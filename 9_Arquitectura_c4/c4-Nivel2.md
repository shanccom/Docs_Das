### Especificaciones Arquitectónicas y Reglas de Trazabilidad (C4 Nivel 2)

#### 1. Patrón Arquitectónico, Dimensionamiento y Concurrencia
* **Estilo híbrido (MVC + Hexagonal en Monolito Modular):** Vista en clientes de sucursal (`P-CLI-01` React + TypeScript y `P-CLI-02` Kotlin / Android), borde TLS en `P-EDGE-01` (Nginx), Controlador y Modelo en el núcleo hexagonal sobre VPS Docker (`P-SRV-01` FastAPI/Python, `P-SRV-02` Python WebSockets, `P-BRK-01` broker de tareas y `P-WRK-01` Celery/Python), persistencia en `P-DAT-01` (`PostgreSQL 16`) y puertos secundarios hacia `S-EXT-01`..`S-EXT-04`.
* **Dimensionamiento operativo (Vista Física y `RNF-0008`):** 3 sucursales en línea hacia el servidor central; hasta 65 pacientes/día; picos de 6 a 10 pacientes en ventanas de 10 a 15 minutos; más de 20 consultas simultáneas; picos superiores a 25 req/s y más de 10 000 expedientes en la nube. Operación conectada con enlace principal y secundario de respaldo (sin almacenamiento local offline).
* **Reglas de concurrencia y desacoplamiento:**
  * **Reservas concurrentes (`RSK-02`):** `P-SRV-01` coordina transacciones ACID con bloqueo a nivel de fila en `P-DAT-01` y devuelve `HTTP 409 Conflict` ante colisión de turno o camilla.
  * **Procesamiento asíncrono (`RNF-0007`):** `P-SRV-01` encola en `P-BRK-01` hacia `P-WRK-01` la generación de constancias PDF (≤ 5 s), su archivo en `S-EXT-02` y el envío por `S-EXT-03` sin bloquear peticiones HTTP.

---

#### 2. Matriz de Protocolos entre Contenedores

*(Puertos referenciales sujetos a confirmación en el despliegue final, conforme a la Vista Física).*

| # | Contenedor Origen | Contenedor Destino | Protocolo / Puerto | Propósito operativo y regla de negocio |
| :---: | :--- | :--- | :--- | :--- |
| **1** | `P-CLI-01` (SPA Web) | `P-EDGE-01` (Reverse Proxy) | `HTTPS REST (443) + JWT` | Peticiones de admisión, búsqueda por DNI (< 3 s), agenda, check-in en 1 clic con firma, monitoreo y reportes (`RNF-0002`, `0003`, `0004`, `0008`). |
| **2** | `P-CLI-02` (App Tablet) | `P-EDGE-01` (Reverse Proxy) | `HTTPS REST (443) + JWT` | Registro de historias clínicas, sesiones terapéuticas, plantillas y captura de firma (`EDU-0006`, `0025`, `0031`). |
| **3** | `P-CLI-01` / `P-CLI-02` | `P-EDGE-01` (Reverse Proxy) | `WSS (443)` | Canal bidireccional en tiempo real para actualización de camillas y turnos (`EDU-0026`, `0032`, `RNF-0006`). |
| **4** | `P-EDGE-01` (Reverse Proxy) | `P-SRV-01` (API Gateway) | `HTTP interno + JWT` | Reenvío de tráfico REST autenticado tras terminación TLS. |
| **5** | `P-EDGE-01` (Reverse Proxy) | `P-SRV-02` (Motor WebSocket) | `WS interno` | Reenvío de conexiones WebSocket hacia las salas segmentadas por sucursal. |
| **6** | `P-SRV-01` (API Gateway) | `P-SRV-02` (Motor WebSocket) | `Evento interno` | Notificación de cambios en agenda, asistencia o disponibilidad de camillas para su difusión (`RNF-0005`, `0006`). |
| **7** | `P-SRV-01` (API Gateway) | `P-BRK-01` -> `P-WRK-01` | `Cola de mensajes (Red Docker)` | Encolamiento y consumo de trabajos diferidos para generación de constancias PDF y mensajería (`RNF-0007`). |
| **8** | `P-SRV-01` (API Gateway) | `P-DAT-01` (`OMVITAL_DB`) | `TCP/IP (5432 · Pool ACID)` | Operaciones transaccionales multi-sede, bloqueos de reserva, baja lógica y bitácora de auditoría (`RNF-0015`, `RSK-01`, `02`). |
| **9** | `P-SRV-02` (Motor WebSocket) | `P-DAT-01` (`OMVITAL_DB`) | `TCP/IP (5432 · Consulta/Pub-Sub)` | Lectura de estado y escucha asíncrona (`LISTEN/NOTIFY`) de cambios de disponibilidad en tiempo real (`RNF-0006`). |
| **10** | `P-WRK-01` (Worker) | `P-DAT-01` (`OMVITAL_DB`) | `TCP/IP (5432 · Lectura/Log)` | Consulta de datos para compilación de constancias PDF y registro del estado de despacho (`RNF-0007`). |
| **11** | `P-SRV-01` (API Gateway) | `S-EXT-01` (API Financiera) | `HTTPS REST (443 · ≤ 3 s)` | Consulta de saldo de sesiones y validación de pago previo en check-in (`EDU-0002`, `0029`, `RSK-05`). |
| **12** | `P-SRV-01` (API Gateway) | `S-EXT-04` (Firma Perú PKI) | `HTTPS REST (443)` | Certificación criptográfica de consentimientos informados, sesiones y firmas digitales (`EDU-0001`, `0025`, `0029`, `RNF-0003`, `RSK-04`). |
| **13** | `P-SRV-01` / `P-WRK-01` | `S-EXT-02` (AWS S3) | `HTTPS (443)` | Lectura de adjuntos desde backend y almacenamiento definitivo de historias, consentimientos y constancias PDF (`EDU-0001`, `0006`, `0025`, `0029`, `RNF-0001`, `0003`, `0007`). |
| **14** | `P-WRK-01` (Worker) | `S-EXT-03` -> `Paciente` | `HTTPS (443 · Meta API)` | Envío automatizado de recordatorios, alertas de abandono y enlaces de constancias PDF por WhatsApp (`EDU-0005`, `0029`, `RSK-05`). |

---

#### 3. Mitigación de Riesgos Arquitectónicos (`RSK`)
* **`RSK-01` (Integridad del historial clínico y auditoría):** baja lógica (`Archivo Histórico`, sin borrado físico), transacciones atómicas en `P-DAT-01`, sello temporal UTC del servidor y bitácora *append-only* (`EDU-0001`, `0006`; `RNF-0015`).
* **`RSK-02` (Condiciones de carrera en citas y camillas):** bloqueo pesimista por fila y restricciones únicas en `P-DAT-01`, con respuesta `HTTP 409 Conflict` desde `P-SRV-01` (`EDU-0002`, `0026`; `RNF-0006`).
* **`RSK-04` (Repudio legal de firmas y consentimientos):** certificación digital vía puerto secundario con `S-EXT-04` (`Firma Perú PKI`) y custodia inalterable en `S-EXT-02` (`AWS S3`) (`EDU-0001`, `0025`, `0029`; `RNF-0003`).
* **`RSK-05` (Bloqueo por latencia de servicios externos):** límite `timeout ≤ 3 s` hacia `S-EXT-01` y despacho asíncrono de notificaciones `S-EXT-03` vía `P-BRK-01` y `P-WRK-01` (`EDU-0002`, `0005`, `0029`; `RNF-0007`).
* **`RSK-06` (Acceso no autorizado o suplantación de rol):** validación JWT en servidor, extracción de identidad y rol exclusivamente desde el token verificado y control RBAC multi-sede en `P-SRV-01` (`EDU-0033`, `ILA-0027`; `RNF-0015`).

---

#### 4. Alcance y Trazabilidad del Catálogo Oficial
* **Actores oficiales (`database/data/educciones.sql`):** `ACT-0001` Fisioterapeuta (`P-CLI-02`), `ACT-0002` Coordinador (`P-CLI-01`), `ACT-0003` Recepcionista (`P-CLI-01`), `ACT-0004` Gerente (`P-CLI-01`) y Paciente *(actor externo receptor vía `S-EXT-03`)*.
* **Educciones e ilaciones activas (11 `EDU` / 27 `ILA`):** `EDU-0001` (`ILA-0001..0004`), `EDU-0002` (`ILA-0005..0008`), `EDU-0005` (`ILA-0009..0010`), `EDU-0006` (`ILA-0011..0014`), `EDU-0025` (`ILA-0015..0018`), `EDU-0026` (`ILA-0019`), `EDU-0027` *(intercambio multi-sede)*, `EDU-0029` (`ILA-0020..0021`), `EDU-0031` (`ILA-0022..0025`), `EDU-0032` (`ILA-0026`) y `EDU-0033` (`ILA-0027`).
* **Requisitos no funcionales activos (14 `RNF`):** `RNF-0001` (AWS 99.9%), `RNF-0002` (DNI < 3 s), `RNF-0003` (asistencia 1 clic, firma < 10 s e inalterable), `RNF-0004` (historial en 1 pantalla), `RNF-0005` (sincronización entre sedes), `RNF-0006` (camillas en tiempo real), `RNF-0007` (PDF ≤ 5 s), `RNF-0008` (≤ 2 clics / 65 pac./día), `RNF-0009` (doble validación), `RNF-0011` (vista resumen), `RNF-0012` (diagnóstico y fase inmediatos), `RNF-0013` (evolución condensada), `RNF-0014` (mini evaluación diaria) y `RNF-0015` (trazabilidad autor/rol/UTC).
* **Códigos archivados fuera de alcance:** `EDU-0003..0004`, `EDU-0007..0024`, `EDU-0028`, `EDU-0030` y `RNF-0010` *(archivados en Ingeniería de Requisitos; la integridad del consentimiento citada como `RNF-0010` en vistas previas queda cubierta por `RNF-0001` y `RNF-0003`)*.

```mermaid
---
title: "Diagrama C4 — Nivel 2: Contenedores (Arquitectura Híbrida MVC + Hexagonal)"
config:
  flowchart:
    curve: linear
    nodeSpacing: 30
    rankSpacing: 50
---

flowchart TB
    %% CLASES VISUALES (ESTÁNDAR C4 · NIVEL 3)
    classDef actor fill:#D8EAFE,stroke:#397BC1,stroke-width:2px,color:#123F70
    classDef vista fill:#85BBF0,stroke:#397BC1,stroke-width:1.5px,color:#0F172A
    classDef srv fill:#559CE1,stroke:#2769B4,stroke-width:1.5px,color:#071D3C
    classDef brk fill:#E5F1FF,stroke:#397BC1,stroke-width:1.5px,stroke-dasharray:5 3,color:#123F70
    classDef db fill:#1168BD,stroke:#0B4884,stroke-width:2px,color:#FFFFFF
    classDef ext fill:#64748B,stroke:#475569,stroke-width:1.5px,color:#FFFFFF
    classDef leg fill:transparent,stroke:#94A3B8,stroke-width:1px,color:#475569

    %% =============================================================
    %% ACTORES INTERNOS DEL SISTEMA
    %% =============================================================

    subgraph ACTORES["ACTORES DEL SISTEMA"]
        direction LR
        ACT03["<b>Recepcionista</b><br/><i>[ACT-0003 | Persona]</i><br/>Admisión, agenda, check-in y monitoreo<br/><b>[EDU-0001, 0002, 0005, 0029, 0032, 0033]</b>"]:::actor
        ACT02["<b>Coordinador</b><br/><i>[ACT-0002 | Persona]</i><br/>Control operativo y documentos nube<br/><b>[EDU-0027, 0033 | RNF-0001]</b>"]:::actor
        ACT04["<b>Gerente</b><br/><i>[ACT-0004 | Persona]</i><br/>Supervisión general multi-sede<br/><b>[EDU-0033]</b>"]:::actor
        ACT01["<b>Fisioterapeuta</b><br/><i>[ACT-0001 | Persona]</i><br/>Atención clínica y sesiones en box<br/><b>[EDU-0005, 0006, 0025, 0026, 0027, 0031, 0033]</b>"]:::actor
    end

    %% =============================================================
    %% FRONTERA DEL SISTEMA OMVITAL
    %% =============================================================

    subgraph SISTEMA["SISTEMA OMVITAL | Arquitectura Híbrida MVC + Hexagonal"]
        direction TB

        subgraph VISTA["01 · VISTA | Clientes de sucursal"]
            direction LR
            CLI01["<b>P-CLI-01 · SPA Web Recepción y Gestión</b><br/>[React + TypeScript]<br/>Admisión, agenda, check-in y monitoreo<br/><b>[EDU-0001, 0002, 0005, 0027, 0029, 0032, 0033]</b><br/><b>[RNF-0002, 0003, 0004, 0008, 0009, 0011]</b>"]:::vista
            CLI02["<b>P-CLI-02 · App Tablet Consultorio</b><br/>[Kotlin / Android]<br/>Historia clínica, sesión SOAP, firma y plantillas<br/><b>[EDU-0005, 0006, 0025, 0026, 0027, 0031, 0033]</b><br/><b>[RNF-0003, 0012, 0013, 0014]</b>"]:::vista
        end

        EDGE01["<b>P-EDGE-01 · Reverse Proxy</b><br/>[Nginx / HTTPS / WSS]<br/>Terminación TLS y enrutamiento REST/WS"]:::ext

        subgraph APP_SERVER["02 · CONTROLADOR Y MODELO | Núcleo Hexagonal (VPS Docker)"]
            direction TB

            subgraph APP_SYNC["SERVICIOS DE ATENCIÓN"]
                direction LR
                SRV02["<b>P-SRV-02 · Motor WebSocket</b><br/>[Python WebSockets]<br/>Difusión en tiempo real de camillas y agenda por sede<br/><b>[EDU-0026, 0027, 0032 | RNF-0005, 0006]</b>"]:::srv
                SRV01["<b>P-SRV-01 · API Gateway y Backend Core</b><br/>[FastAPI / Python · Monolito Modular]<br/>Adaptadores REST, JWT/RBAC, casos de uso, dominio y puertos<br/><b>[EDU-0001..0033 | ILA-0001..0027 | RNF-0002, 0005, 0015 | RSK-01, 02, 06]</b>"]:::srv
            end

            subgraph APP_ASYNC["PROCESAMIENTO ASÍNCRONO"]
                direction LR
                BRK01["<b>P-BRK-01 · Broker de Tareas</b><br/>[Cola de mensajes · Tec. por confirmar]<br/>Desacoplamiento de trabajos diferidos<br/><b>[RNF-0007]</b>"]:::brk
                WRK01["<b>P-WRK-01 · Worker Asíncrono</b><br/>[Celery / Python]<br/>Constancias PDF &lt;= 5 s, archivo S3 y envío WhatsApp<br/><b>[EDU-0005, 0029 | RNF-0007]</b>"]:::srv
            end
        end

        subgraph PERSISTENCIA["03 · PERSISTENCIA | Base de datos relacional"]
            direction TB
            DAT01[("<b>P-DAT-01 · OMVITAL_DB</b><br/>[PostgreSQL 16]<br/>Datos clínicos multi-sede, baja lógica, locks y bitácora append-only<br/><b>[ILA-0001..0027 | RNF-0001, 0005, 0015 | RSK-01, 02]</b>")]:::db
        end
    end

    %% =============================================================
    %% SISTEMAS EXTERNOS Y ACTOR EXTERNO
    %% =============================================================

    subgraph EXTERNOS["SISTEMAS EXTERNOS | Puertos secundarios"]
        direction LR
        EXT01["<b>S-EXT-01 · API Financiera</b><br/>[HTTPS REST]<br/>Validación de pagos y sesiones (timeout &lt;= 3 s)<br/><b>[EDU-0002, 0029 | RSK-05]</b>"]:::ext
        EXT04["<b>S-EXT-04 · Firma Perú PKI</b><br/>[HTTPS REST]<br/>Certificación digital inalterable de firmas<br/><b>[EDU-0001, 0025, 0029 | RNF-0003 | RSK-04]</b>"]:::ext
        EXT02["<b>S-EXT-02 · AWS S3 Storage</b><br/>[HTTPS / Cloud Object Storage]<br/>Custodia de historias, consentimientos y PDFs<br/><b>[EDU-0001, 0006, 0025, 0029 | RNF-0001, 0003, 0007]</b>"]:::ext
        EXT03["<b>S-EXT-03 · Gateway WhatsApp</b><br/>[Meta Cloud API / HTTPS]<br/>Recordatorios, alertas de abandono y constancias<br/><b>[EDU-0005, 0029 | RSK-05]</b>"]:::ext
    end

    PAC["<b>Paciente</b><br/>[Actor Externo]<br/>Recibe alertas de citas y constancias PDF<br/><b>[EDU-0005, 0029]</b>"]:::actor

    %% =============================================================
    %% LEYENDA ARQUITECTÓNICA INTEGRADA
    %% =============================================================

    subgraph LEYENDA["LEYENDA · ELEMENTOS, RELACIONES Y REQUISITOS"]
        direction TB

        subgraph LEG_TYPES["TIPOS DE ELEMENTOS"]
            direction LR
            L_ACT["Actor<br/>Rol / Persona"]:::actor
            L_VIS["Vista<br/>Clientes de sucursal"]:::vista
            L_SRV["Aplicación<br/>Servicios Backend"]:::srv
            L_BRK["Broker<br/>Cola asíncrona"]:::brk
            L_DB[("Persistencia<br/>PostgreSQL 16")]:::db
            L_EXT["Borde / Externo<br/>Proxy / Cloud"]:::ext
        end

        subgraph LEG_CODES["CÓDIGOS DE TRAZABILIDAD"]
            direction LR
            L_EDU["<b>EDU</b><br/>Educción funcional"]:::leg
            L_ILA["<b>ILA</b><br/>Ilación / regla derivada"]:::leg
            L_RNF["<b>RNF</b><br/>Requisito no funcional"]:::leg
            L_RSK["<b>RSK</b><br/>Riesgo / control"]:::leg
        end

        subgraph LEG_REL["RELACIONES"]
            direction LR
            L_A["Origen"]:::leg
            L_B["Destino síncrono"]:::leg
            L_C["Origen"]:::leg
            L_D["Destino asíncrono / WS"]:::leg
            L_A -->|"HTTPS / HTTP / TCP"| L_B
            L_C -.->|"WSS / Cola / Evento"| L_D
        end
    end

    %% =============================================================
    %% RELACIONES ENTRE ACTORES, CONTENEDORES Y SISTEMAS EXTERNOS
    %% =============================================================

    ACT03 -->|"Admisión y monitoreo"| CLI01
    ACT02 -->|"Consulta y sedes"| CLI01
    ACT04 -->|"Supervisión"| CLI01
    ACT01 -->|"Atención en box"| CLI02

    CLI01 -->|"HTTPS REST"| EDGE01
    CLI02 -->|"HTTPS REST"| EDGE01
    CLI01 -.->|"WSS Tiempo Real"| EDGE01
    CLI02 -.->|"WSS Tiempo Real"| EDGE01

    EDGE01 -->|"HTTP interno + JWT"| SRV01
    EDGE01 -.->|"WS interno"| SRV02

    SRV01 -.->|"Publica eventos camillas"| SRV02
    SRV01 -.->|"Encola PDF y envíos"| BRK01
    BRK01 -.->|"Entrega trabajos"| WRK01

    SRV01 -->|"TCP/5432 Pool ACID"| DAT01
    WRK01 -->|"TCP/5432 Lectura/Log"| DAT01
    SRV02 -.->|"TCP/5432 Consulta/Pub-Sub"| DAT01

    SRV01 -->|"HTTPS timeout &lt;= 3 s"| EXT01
    SRV01 -->|"HTTPS Firma PKI"| EXT04
    SRV01 -->|"HTTPS Adjuntos/Lectura"| EXT02
    WRK01 -->|"HTTPS PutObject PDF"| EXT02
    WRK01 -->|"HTTPS Webhook"| EXT03
    EXT03 -.->|"Notificación WhatsApp"| PAC

    PAC ~~~ L_ACT

    %% =============================================================
    %% ESTILOS DE CONTENEDORES Y AGRUPACIONES
    %% =============================================================

    style ACTORES fill:transparent,stroke:#94A3B8,stroke-width:1px,stroke-dasharray:5 4,color:#475569
    style SISTEMA fill:transparent,stroke:#3B82F6,stroke-width:2.5px,color:#1E3A8A
    style VISTA fill:transparent,stroke:#60A5FA,stroke-width:1.5px,stroke-dasharray:5 4,color:#1E40AF
    style APP_SERVER fill:transparent,stroke:#2563EB,stroke-width:2px,color:#1E3A8A
    style PERSISTENCIA fill:transparent,stroke:#60A5FA,stroke-width:1.5px,stroke-dasharray:5 4,color:#1E40AF
    style APP_SYNC fill:transparent,stroke:none
    style APP_ASYNC fill:transparent,stroke:none
    style EXTERNOS fill:transparent,stroke:#94A3B8,stroke-width:1px,stroke-dasharray:5 4,color:#475569
    style LEYENDA fill:transparent,stroke:#94A3B8,stroke-width:1px,stroke-dasharray:3 3,color:#475569
    style LEG_TYPES fill:transparent,stroke:none
    style LEG_CODES fill:transparent,stroke:none
    style LEG_REL fill:transparent,stroke:none
```