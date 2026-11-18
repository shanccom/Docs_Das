

### Especificaciones Arquitectónicas y Reglas de Trazabilidad (C4 Nivel 2)

#### 1. Patrón Arquitectónico y Concurrencia Operativa
* **Denominación Híbrida:** Síntesis de separación por capas **MVC** (Vista en terminales de sede, Controlador/Modelo en VPS Linux y Persistencia relacional ACID) combinada con **Arquitectura Hexagonal** (Puertos y Adaptadores hacia los 4 servicios cloud externos) bajo un despliegue de **Monolito Modular**.
* **Dimensionamiento y Concurrencia Formal:** Soporta operación concurrente para **15 trabajadores en la sede central** y **3 operadores por sucursal**, garantizando aislamiento transaccional multi-sede (`EDU-0027`).
* **Reglas de Sincronización y Bloqueo:**
  * **Control de Citas y Camillas (`RSK-02`):** Implementa bloqueo pesimista (`SELECT FOR UPDATE`) sobre el recurso camilla/turno en `CitaService`, retornando `HTTP 409 Conflict` ante intentos de reserva simultánea.
  * **Ejecución Paralela (`EDU-0006`):** Aplicación de patrón *Fork/Join* paralelo (registro de evolución clínica, carga documental a AWS S3 y log de auditoría) validado antes de confirmar el `COMMIT` transaccional.
  * **Control de Interfaz (`RNF-0002`):** Aplicación de *debounce* de `500 ms` en búsquedas y envíos desde la SPA (`P-CLI-01`) para evitar sobrecarga de peticiones repetidas.

---

#### 2. Matriz de los 11 Protocolos Físicos Estrictos entre Contenedores

| # | Contenedor Origen | Contenedor Destino | Protocolo / Transporte | Propósito Operativo y Regla de Negocio |
| :--- | :--- | :--- | :--- | :--- |
| **1** | `P-CLI-01` (SPA Web) | `P-SRV-01` (API Gateway) | `HTTPS (REST) + JWT Bearer` | Operaciones transaccionales de admisión, agenda, caja y asistencia (`EDU-0001`, `0002`, `0029`, `0033`). |
| **2** | `P-CLI-01` (SPA Web) | `P-SRV-02` (WebSocket) | `WSS (WebSocket TLS)` | Suscripción en tiempo real al monitor de recepción, turnos y camillas (`EDU-0032`, `RNF-0006`). |
| **3** | `P-CLI-02` (App Tablet) | `P-SRV-01` (API Gateway) | `HTTPS (REST) + JWT Bearer` | Registro de atención en box, fichas, evolución clínica y firma (`EDU-0006`, `0025`, `0031`). |
| **4** | `P-CLI-02` (App Tablet) | `P-SRV-02` (WebSocket) | `WSS (WebSocket TLS)` | Sincronización *full-duplex* del estado de ocupación de camillas y boxes (`EDU-0026`, `RNF-0005`). |
| **5** | `P-SRV-01` (API Gateway) | `P-DAT-01` (PostgreSQL 16) | `TCP/IP (Pool ACID)` | Escritura/lectura transaccional multi-esquema con baja lógica (`RSK-01`) y auditoría (`RNF-0015`). |
| **6** | `P-SRV-02` (WebSocket) | `P-DAT-01` (PostgreSQL 16) | `TCP/IP (Pub/Sub)` | Escucha asíncrona de eventos y cambios de estado en base de datos (`LISTEN/NOTIFY`). |
| **7** | `P-WRK-01` (Worker Celery) | `P-DAT-01` (PostgreSQL 16) | `TCP/IP (Lectura/Log)` | Consulta de datos para generación de reportes PDF y registro de colas de despacho (`RNF-0007`). |
| **8** | `P-SRV-01` (API Gateway) | `S-EXT-01` (API Financiera) | `HTTPS REST (Timeout <= 3s)` | Validación bancaria en línea de pagos y sesiones con corte por *timeout* (`EDU-0002`, `RSK-05`). |
| **9** | `P-SRV-01` (API Gateway) | `S-EXT-04` (Firma Digital) | `HTTPS REST (PKI RENIEC)` | Certificación legal criptográfica de consentimientos informados (`EDU-0025`, `RNF-0003`, `RSK-04`). |
| **10** | `P-WRK-01` (Worker Celery) | `S-EXT-02` (AWS S3 Storage) | `HTTPS (PutObject TLS)` | Almacenamiento seguro en la nube de historias clínicas, fichas y PDFs (`EDU-0006`, `0031`, `RNF-0001`). |
| **11** | `P-WRK-01` (Worker Celery) | `S-EXT-03` (Gateway WhatsApp) | `HTTPS (Meta Cloud API)` | Despacho asíncrono de recordatorios de citas y constancias al paciente (`EDU-0005`, `ILA-0009..10`). |

---

#### 3. Mitigación de Riesgos Arquitectónicos (`RSK`) y Seguridad
* **`RSK-01` (Integridad Referencial e Histórica):** Prohibición de borrado físico (`DELETE`) en entidades clínicas; se aplica **baja lógica** (`estado_activo = false`) combinada con llaves foráneas cruzadas y pistas de auditoría inmutables (`RNF-0015`).
* **`RSK-02` (Condiciones de Carrera en Agenda):** Mitigado en `P-SRV-01` mediante bloqueo a nivel de fila en PostgreSQL durante la asignación de fisioterapeuta y camilla.
* **`RSK-04` (No Repudio Legal):** Integración directa con `S-EXT-04` (Firma Perú / PKI) para garantizar validez jurídica en consentimientos informados (`RNF-0003`).
* **`RSK-05` (Degradación por Terceros Financieros):** Restricción estricta de `Timeout <= 3 segundos` en el adaptador hacia `S-EXT-01` para no bloquear los hilos del API Gateway.
* **`RSK-06` (Escalación de Privilegios):** Middleware centralizado de autenticación **JWT Bearer** y control de acceso basado en roles (**RBAC**) en `P-SRV-01` (`EDU-0033`).

---

#### 4. Reglas de Depuración y Exclusión de Requisitos (Alcance C4 Nivel 2)
* **Educciones Activas en el Modelo (11 de 33):** `EDU-0001`, `EDU-0002`, `EDU-0005`, `EDU-0006`, `EDU-0025`, `EDU-0026`, `EDU-0027`, `EDU-0029` (integrado vía software en terminales web/móvil), `EDU-0031`, `EDU-0032` y `EDU-0033` (cubriendo `ILA-0001` al `ILA-0027`).
* **Educciones Depuradas en Refactorización (22 de 33):**
  * **Por refinamiento o duplicidad funcional (4):** `EDU-0003`, `EDU-0004`, `EDU-0028` (absorbida por gestión clínica) y `EDU-0030` (absorbida por módulo de citas).
  * **Por recorte de módulos *legacy* administrativos (18):** `EDU-0007` al `EDU-0024` (módulos antiguos de compras, proveeduría y facturación fuera del núcleo clínico).
* **Requisitos No Funcionales Excluidos (1):**
  * **`RNF-0010`:** Eliminado por obsolescencia tecnológica (requería compatibilidad con *Internet Explorer 11*, incompatible con el stack moderno React/TypeScript en `P-CLI-01`).

```mermaid
---
title: "Diagrama C4 — Nivel 2: Contenedores y Arquitectura Híbrida MVC"
config:
  flowchart:
    curve: linear
    nodeSpacing: 35
    rankSpacing: 55
---

flowchart TD
    %% =========================================================================
    %% 1. CAPA DE ACTORES INTERNOS (ENTRADA AL SISTEMA)
    %% =========================================================================

    subgraph SUB_ACTORES["1. Actores Internos del Negocio"]
        direction TB
        ACT03["<b>Gerente General</b><br/><i>[ACT-0003 | Persona]</i><br/>Supervisión y auditoría multi-sede<br/><b>[EDU-0027, 0033]</b>"]
        ACT01["<b>Recepcionista / Admin</b><br/><i>[ACT-0001 | Persona]</i><br/>Admisión, agenda, caja y asistencia<br/><b>[EDU-0001, 0002, 0029]</b>"]
        ACT02["<b>Fisioterapeuta</b><br/><i>[ACT-0002 | Persona]</i><br/>Atención en box y evolución clínica<br/><b>[EDU-0006, 0025, 0031]</b>"]
    end

    %% =========================================================================
    %% 2. FRONTERA DEL SISTEMA OMVITAL (CAPAS MVC DE CONTENEDORES)
    %% =========================================================================

    subgraph SISTEMA["2. Sistema OMVITAL — Contenedores (Monolito Modular Hexagonal)"]
        direction TB

        subgraph VISTA["Capa MVC · VISTA — Clientes de Sucursal (LAN Sede)"]
            direction TB
            CLI01["<b>P-CLI-01: SPA Recepción y Admin</b><br/><i>[Contenedor: React + TypeScript]</i><br/>Agenda, caja, asistencia y debounce 500ms<br/><b>[EDU-0001, 0029, 0032 | RNF-0002, 0018]</b>"]
            CLI02["<b>P-CLI-02: App Tablet Fisioterapia</b><br/><i>[Contenedor: Kotlin / Android OS]</i><br/>Fichas, evolución en camilla y caché local<br/><b>[EDU-0006, 0025, 0031 | RNF-0012, 0017]</b>"]
        end

        subgraph APP_SERVER["Capa MVC · CONTROLADOR + MODELO — Servidor de Aplicaciones (Linux VPS)"]
            direction TB
            SRV01["<b>P-SRV-01: API Gateway & Backend</b><br/><i>[Contenedor: FastAPI / Python]</i><br/>Orquestador Hexagonal, JWT/RBAC y lock de citas<br/><b>[EDU-0002, 0033 | RSK-02, RSK-06]</b>"]
            WRK01["<b>P-WRK-01: Worker Tareas Asíncronas</b><br/><i>[Contenedor: Celery / Python]</i><br/>Generación de PDFs y colas de despacho<br/><b>[EDU-0005, 0029 | RNF-0007]</b>"]
            SRV02["<b>P-SRV-02: Motor WebSocket</b><br/><i>[Contenedor: Python WebSockets]</i><br/>Difusión full-duplex de camillas y turnos<br/><b>[EDU-0026, 0027, 0032 | RNF-0005, 0006]</b>"]
        end

        subgraph PERSISTENCIA["Capa MVC · PERSISTENCIA — Base de Datos Relacional"]
            direction TB
            DAT01[("<b>P-DAT-01: OMVITAL_DB</b><br/><i>[Contenedor: PostgreSQL 16 ACID]</i><br/>Multi-esquema clínico, baja lógica y auditoría<br/><b>[ILA-0001..27 | RNF-0015 | RSK-01]</b>")]
        end
    end

    %% =========================================================================
    %% 3. SISTEMAS EXTERNOS (PUERTOS SECUNDARIOS) Y PACIENTE
    %% =========================================================================

    subgraph EXTERNOS["3. Sistemas Externos (Cloud / Terceros) y Actor Externo"]
        direction TB
        EXT01["<b>S-EXT-01: API Financiera</b><br/><i>[REST HTTPS | Timeout <= 3s]</i><br/>Validación bancaria de pagos<br/><b>[EDU-0002 | RSK-05]</b>"]
        EXT04["<b>S-EXT-04: Firma Digital</b><br/><i>[Firma Perú RENIEC / PKI HTTPS]</i><br/>Certificación legal de consentimientos<br/><b>[EDU-0025 | RNF-0003, RSK-04]</b>"]
        EXT02["<b>S-EXT-02: AWS S3 Storage</b><br/><i>[Cloud Object Storage / HTTPS]</i><br/>Repositorio de historias y PDFs<br/><b>[EDU-0006, 0031 | RNF-0001]</b>"]
        EXT03["<b>S-EXT-03: Gateway WhatsApp</b><br/><i>[Meta Cloud API / HTTPS]</i><br/>Avisos de citas y constancias<br/><b>[EDU-0005 | ILA-0009..10]</b>"]
        ACT04["<b>Paciente</b><br/><i>[ACT-0004 | Persona Externa]</i><br/>Receptor móvil de recordatorios y PDFs<br/><b>[EDU-0005]</b>"]
    end

    %% =========================================================================
    %% LEYENDA INFERIOR EN LETRA MÍNIMA (PIE DE DIAGRAMA)
    %% =========================================================================

    subgraph LEYENDA["Leyenda"]
        direction LR
        LEG_ACT["<span style='font-size:10px; line-height:1.1'><b>[✓] EDU Activas (11/33):</b> EDU-0001, 0002, 0005, 0006, 0025, 0026, 0027, 0029, 0031, 0032, 0033 | <b>ILA:</b> 0001..0027</span>"]
        LEG_ARC["<span style='font-size:10px; line-height:1.1'><b>[⚙] Control Arquitectónico:</b> RNF: 0001..08, 0011..18 | Riesgos: RSK-01 (Baja lógica), RSK-02 (Lock 409), RSK-04..06 | Fork/Join: EDU-0006</span>"]
        LEG_DEP["<span style='font-size:10px; line-height:1.1'><b>[✕] Depuradas (22/33):</b> EDU-0003, 0004, 0028, 0030 | Legacy: EDU-0007..0024 (18 mód.) | RNF Excluido: RNF-0010 (IE11)</span>"]
    end

    %% =========================================================================
    %% CONEXIONES DE USUARIOS Y LAS 11 CONEXIONES FÍSICAS (CERO CRUCES)
    %% =========================================================================

    %% Actores Internos -> Vista
    ACT03 -->|"Supervisa [HTTPS]"| CLI01
    ACT01 -->|"Opera caja/citas [HTTPS]"| CLI01
    ACT02 -->|"Atención box [Touch]"| CLI02

    %% Vista -> Controlador (Protocolos 1 a 4)
    CLI01 -->|"1. HTTPS REST + JWT"| SRV01
    CLI02 -->|"3. HTTPS REST + JWT"| SRV01
    CLI01 -.->|"2. WSS Estado camillas"| SRV02
    CLI02 -.->|"4. WSS Estado camillas"| SRV02

    %% Comunicación Interna entre Contenedores Backend
    SRV01 -.->|"Encola PDF/Envíos [IPC]"| WRK01
    SRV01 -.->|"Publica eventos"| SRV02

    %% Controlador -> Persistencia (Protocolos 5 a 7)
    SRV01 -->|"5. TCP/IP (Pool ACID)"| DAT01
    WRK01 -->|"7. TCP/IP (Lectura/Log)"| DAT01
    SRV02 -.->|"6. TCP/IP (Pub/Sub)"| DAT01

    %% Controlador -> Sistemas Externos (Protocolos 8 a 11) y Paciente
    SRV01 -->|"8. HTTPS (Timeout <= 3s)"| EXT01
    SRV01 -->|"9. HTTPS (Firma PKI)"| EXT04
    WRK01 -->|"10. HTTPS (PutObject S3)"| EXT02
    WRK01 -->|"11. HTTPS (Webhook Async)"| EXT03
    EXT03 -->|"Notificación móvil"| ACT04

    %% ANCLAJE INVISIBLE PARA FIJAR LA LEYENDA AL PIE DEL DIAGRAMA
    EXT01 ~~~ LEYENDA
    EXT04 ~~~ LEYENDA
    EXT02 ~~~ LEYENDA
    ACT04 ~~~ LEYENDA

    %% =========================================================================
    %% ESTILOS VISUALES POR CAPAS C4 / MVC
    %% =========================================================================

    %% Contenedores de Agrupación
    style SUB_ACTORES fill:#F8FAFC,stroke:#334155,stroke-width:1.5px,color:#0F172A
    style SISTEMA fill:#FAFAFA,stroke:#1E293B,stroke-width:2px,color:#0F172A
    style VISTA fill:#F0F7FF,stroke:#0284C7,stroke-width:1.5px,stroke-dasharray: 4 4,color:#0F172A
    style APP_SERVER fill:#EEF2FF,stroke:#4F46E5,stroke-width:1.5px,stroke-dasharray: 4 4,color:#0F172A
    style PERSISTENCIA fill:#ECFDF5,stroke:#059669,stroke-width:1.5px,stroke-dasharray: 4 4,color:#0F172A
    style EXTERNOS fill:#F9FAFB,stroke:#4B5563,stroke-width:1.5px,color:#0F172A
    style LEYENDA fill:#FFFFFF,stroke:#CBD5E1,stroke-width:1px,stroke-dasharray: 2 2,color:#64748B,font-size:10px

    %% Nodos de Actores
    style ACT01 fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT02 fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT03 fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT04 fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000

    %% Nodos MVC Vista (Clientes)
    style CLI01 fill:#BAE6FD,stroke:#0369A1,stroke-width:1.5px,color:#000000
    style CLI02 fill:#BAE6FD,stroke:#0369A1,stroke-width:1.5px,color:#000000

    %% Nodos MVC Controlador/Modelo (Backend)
    style SRV01 fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000
    style WRK01 fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000
    style SRV02 fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000

    %% Nodo MVC Persistencia (Base de Datos)
    style DAT01 fill:#A7F3D0,stroke:#065F46,stroke-width:1.5px,color:#000000

    %% Nodos de Servicios Externos
    style EXT01 fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT04 fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT02 fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT03 fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000

    %% Tarjetas de Leyenda Mínima
    style LEG_ACT fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
    style LEG_ARC fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
    style LEG_DEP fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
```