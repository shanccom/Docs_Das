#let sistema = [OmVital Physio Control]
// CONFIRMAR: la Arquitectura Genérica dice "menor a 3 segundos" y el
// Diagrama de Comportamiento dice "t ≤ 500 ms". Elegir uno (ver Observaciones).
#let rnf2 = [menor a 3 segundos]

= Descripción del artefacto

La vista física representa cómo se distribuyen los componentes de #sistema entre los equipos que conforman la solución. Se emplea el diagrama de despliegue UML: el sistema es el componente mayor y los dispositivos y servidores son los componentes menores contenidos en él. Se presentan dos diagramas: *D-FIS-001* (situación actual) y *D-FIS-002* (situación propuesta).

// CONFIRMAR con el equipo la nomenclatura de los códigos D-FIS-xxx.

== Insumos para la construcción de la vista

=== Requisitos no funcionales con impacto en la infraestructura

#table(
  columns: (auto, 1.2fr, 2fr, 2fr),
  align: (center, left, left, left),
  table.header(
    [*Código*], [*RNF / atributo*], [*Métrica de diseño*], [*Impacto en la infraestructura*],
  ),
  [RNF-0001], [Disponibilidad en la nube], [Acceso continuo a expedientes, constancias y consentimientos desde cualquier sede. Disponibilidad de 99.8 % según DIA-CMP-0001 (equivale a unas 17.5 h de indisponibilidad al año).], [Servidores redundantes, base de datos con réplica, respaldos y enlace de Internet secundario por sede.],
  [RNF-0002], [Rendimiento: búsqueda por DNI], [Respuesta #rnf2 en recepción.], [Caché, índices en la base de datos y servidores con capacidad para picos de más de 25 peticiones por segundo.],
  [RNF-0003], [Seguridad: firma digital en asistencia], [Captura y guardado seguro de la firma en menos de 10 segundos.], [Tableta de captura de firma en cada recepción y almacenamiento seguro de archivos.],
  [RNF-0006], [Camillas en tiempo real], [Actualización inmediata del estado de camillas en recepción.], [Canal WebSocket y servicio de eventos en el servidor de aplicaciones.],
  [RNF-0007], [Eficiencia: constancias PDF], [Generación automática en menos de 5 segundos.], [Capacidad de cómputo en el servidor de aplicaciones y almacenamiento de archivos.],
  [RNF-0010], [Integridad: consentimiento digital], [Archivo inalterable del consentimiento firmado.], [Almacenamiento de objetos con control de versiones, respaldos y registro de auditoría.],
)

=== Supuestos de dimensionamiento

Tomados del análisis del Diagrama de Comportamiento (valores referenciales): tres sucursales; picos de 6 a 10 pacientes en ventanas de 10 a 15 minutos por sede en el cambio de turno; más de 20 consultas simultáneas; picos de más de 25 peticiones por segundo; más de 10 000 expedientes en la nube.

== Dispositivos con los que se cuenta actualmente

#table(
  columns: (auto, 1.3fr, 2fr, auto, 1.2fr),
  align: (center, left, left, center, left),
  table.header(
    [*N.°*], [*Dispositivo*], [*Función en el sistema*], [*Cant.*], [*Fuente*],
  ),
  [1], [Laptop estándar de oficina (4 a 8 GB de RAM)], [Cliente de la aplicación web en recepción: registro, check-in, carga de firma en PDF.], [1], [Observaciones de DIA-CMP-0001],
  

  [2], [Conexión a Internet de la clínica (router o módem)], [Acceso de cada sucursal a la nube.], [3], [Observaciones de la Arquitectura Genérica (RNF-0001)],
  [3], [Equipo del fisioterapeuta en consultorio (PC, laptop o celular)], [Registro de notas de evolución (SOAP) y consulta de la ficha del paciente.], [0], [Inexistente en la situación actual. Se incorporará como Tablet en el plan propuesto],
  [4], [Impresora para constancias], [Impresión de la constancia de atención.], [0], [Inexistente en la situación actual. Se excluye del plan propuesto por digitalización del proceso (envío vía WhatsApp/Email)],
)

Servicios externos ya disponibles, que no son dispositivos del sistema: WhatsApp y correo electrónico (confirmaciones y recordatorios), módulo financiero y de facturación, y servicio de firma digital (Firma Perú).

=== Diagrama de Vista Fisica 1: situación actual

#figure(
  rect(width: 100%, height: 7cm)[
    #align(center + horizon)[#image("/assets/image-1.png")]
  ],
  caption: [D-FIS-001: Diagrama de vista fisica de #sistema – situación actual.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  table.header(
    [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación actual*],
  ),
  [Código del diagrama], [D-FIS-001],
  [Requisitos no funcionales], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010 (mostrados como contexto en el diagrama)],
  [Contexto / módulo], [Vista Física de #sistema – situación actual],
  [Proceso representado], [Dispositivos existentes en las tres sucursales (clientes de recepción y consultorio y conexión a Internet). Evidencia que aún no existe infraestructura central para compartir datos entre sedes.],
  [Versión], [1.0.0],
  [Autor], [AUT-0008],
  [Fecha], [08/10/2026],
  [Justificación], [Establece la línea base de la infraestructura disponible y permite medir la brecha frente a los RNF.],
  [Estado], [[Concluido]],
  [Código de artefactos], [EDU-0001, EDU-0002, EDU-0025, EDU-0026, EDU-0029, EDU-0032, EDU-0033],
  [Comentarios], [Ninguno],
)

== Dispositivos que deben adquirirse o contratarse

=== Dispositivos físicos por sucursal

#table(
  columns: (auto, 1.3fr, 4fr, 2fr, 2fr),
  align: (center, left, left, center, center),
  table.header(
    [*N.°*], [*Dispositivo*], [*Justificación*], [*RNF*], [*Cant.*],
  ),
  [A1], [Tableta de captura de firma], [Captura de firma del paciente en menos de 10 s. En el análisis de DIA-CMP-0001 la captura en laptop toma 2 a 4 s frente a menos de 1 s con tableta dedicada, lo que importa en los picos de afluencia.], [RNF-0003], [1],
  [A2], [Tableta para Fisioterapeuta, con lapiz optico], [Dispositivo móvil/asistencial para la atención clínica, consulta de expedientes y registro de notas SOAP en consultorio.], [RNF-0002, RNF-0006], [1 por consultorio],
  [A3], [Router con VPN y firewall], [Enlace seguro entre cada sede y la nube (HTTPS/VPN) y filtrado del tráfico.], [RNF-0010], [3],
  [A4], [Enlace de Internet secundario], [Reduce la dependencia de un único proveedor de conectividad (observación de RNF-0001).], [RNF-0001], [3],
)

=== Infraestructura en la nube (contratada)

#table(
  columns: (auto, 3fr, 5fr, 3fr),
  align: (center, left, left, center),
  table.header(
    [*N.°*], [*Componente*], [*Justificación*], [*RNF*],
  ),
  [B1], [Servidores de aplicación y web (al menos 2 nodos)], [Alojan la API, los módulos funcionales, la lógica de dominio y el servicio de eventos (WebSocket).], [RNF-0001, RNF-0002, RNF-0006, RNF-0007],
  [B2], [Balanceador de carga], [Reparte las peticiones de las tres sedes y permite escalar nodos sin cambiar el diseño.], [RNF-0001, RNF-0002],
  [B3], [Servidor de base de datos principal con réplica], [Aloja `OMVITAL_DB_PACIENTES`; la réplica da continuidad ante fallas.], [RNF-0001, RNF-0002, RNF-0010],
  [B4], [Servicio de caché], [Acelera la búsqueda por DNI en los picos de consulta.], [RNF-0002],
  [B5], [Almacenamiento de archivos y objetos], [Guarda consentimientos, firmas y constancias PDF con control de versiones.], [RNF-0003, RNF-0007, RNF-0010],
  [B6], [Respaldo y replicación], [Copias de seguridad periódicas de la base de datos y los archivos (ESP-0043).], [RNF-0001],
  [B7], [Registro de auditoría y monitoreo con alertas], [Trazabilidad de operaciones clínicas (ESP-0041) y detección de fallas.], [RNF-0001, RNF-0010],
)
=== Diagrama de Vista Fisica: situacion propuesta

#figure(
  rect(width: 100%, height: 15cm)[
    #align(center + horizon)[#image("/assets/image-5.png")]
  ],
  caption: [D-FIS-002: Diagrama de despliegue de #sistema – situación propuesta.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  table.header(
    [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación propuesta*],
  ),
  [Código del diagrama], [D-FIS-002],
  [Requisitos no funcionales], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia), RNF-0010 (Integridad)],
  [Contexto / módulo], [Vista Física de #sistema – situación propuesta],
  [Proceso representado], [Acceso de las terminales y dispositivos de cliente (Navegador Web y Tablet) a un Servidor de Aplicaciones contenedorizado en Docker, el cual interactúa con una base de datos PostgreSQL centralizada y servicios externos (AWS S3, WhatsApp Gateway y API Financiera)],
  [Versión], [1.1.0],
  [Autor], [AUT-0005],
  [Fecha], [26/10/2026],
  [Justificación], [Concreta en infraestructura los componentes de D-DP-001 y cumple los RNF aprobados.],
  [Estado], [Concluido],
  [Código de artefactos], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010, EDU-0027],
  [Comentarios], [Ninguno],
)

== Organización en capas y separación de servidores

#table(
  columns: (1fr, 2fr, 1.4fr),
  align: left,
  table.header(
    [*Capa*], [*Contenido (según D-DP-001)*], [*Nodo físico / Contenedor*],
  ),
  [Presentación], [Interfaz web según rol: formularios, dashboard y reportes.], [Dispositivos Cliente (Terminal y Tablet)],
  [API y control de acceso], [Endpoints REST, validación, autenticación y lógica principal.], [Contenedor: API Gateway (P-SRV-01)],
  [Tiempo Real], [Difusión de eventos y estados asistenciales en tiempo real.], [Contenedor: WebSocket Engine (P-SRV-02)],
  [Procesamiento asíncrono], [Generación de PDF y notificaciones en segundo plano.], [Contenedor: Async Worker (P-WRK-01)],
  [Datos y almacenamiento], [Persistencia de datos del sistema.], [Instancia PostgreSQL (P-DAT-01)],
  [Integraciones externas], [API Financiera, Gateway de WhatsApp y Almacenamiento S3.], [Servicios externos en la nube],
)

Los servidores se separan por responsabilidad utilizando virtualización a nivel de contenedor (Docker). Los servicios de aplicación e integración no almacenan datos de forma permanente y la base de datos está en un nodo propio dentro de una red privada. Así se escala cada capa por separado y se protege el acceso a la información clínica.

== Comunicación entre nodos y acceso a la base de datos

Los puertos son *referenciales* y deben confirmarse al desplegar la infraestructura.

#table(
  columns: (1.3fr, 1.3fr, auto, auto, 1.5fr),
  align: (left, left, center, center, left),
  table.header(
    [*Origen*], [*Destino*], [*Protocolo*], [*Puerto*], [*Observación*],
  ),
  [Terminal Web / Tablet], [API Gateway (P-SRV-01)], [HTTPS], [443], [Consultas REST y cifrado en tránsito],
  [Terminal Web], [WebSocket Engine (P-SRV-02)], [WSS], [443], [Difusión en tiempo real (RNF-0006)],
  [API Gateway (P-SRV-01)], [PostgreSQL (P-DAT-01)], [TCP], [5432], [Acceso a datos persistentes],
  [WebSocket Engine (P-SRV-02)], [PostgreSQL (P-DAT-01)], [TCP], [5432], [Consulta de estado para eventos],
  [Async Worker (P-WRK-01)], [PostgreSQL (P-DAT-01)], [TCP], [5432], [Lectura y actualización de tareas],
  [Async Worker (P-WRK-01)], [AWS S3 (S-EXT-02)], [HTTPS], [443], [Almacenamiento de archivos y PDF],
  [Async Worker (P-WRK-01)], [WhatsApp (S-EXT-03)], [HTTPS], [443], [Envío de notificaciones],
  [API Gateway (P-SRV-01)], [API Financiera (S-EXT-01)], [HTTPS], [443], [Integración de pagos y facturación],
)

El servidor de base de datos recibe conexiones únicamente desde los contenedores autorizados del servidor de aplicaciones mediante un usuario de privilegios mínimos. El acceso de los clientes a los datos pasa obligatoriamente por la API Gateway o el Motor WebSocket.

== Representación de los RNF en la arquitectura

- *Seguridad e Integridad (RNF-0003, RNF-0010):* Cifrado en tránsito mediante HTTPS/WSS entre los clientes y los contenedores de aplicación, aislando la base de datos en su propio nodo.
- *Tiempo real (RNF-0006):* Canal dedicado via WebSocket (`P-SRV-02`) para la difusión instantánea de eventos a los clientes web.
- *Eficiencia y Rendimiento (RNF-0002, RNF-0007):* Desacoplamiento de tareas pesadas (PDF y notificaciones) hacia un worker asíncrono (`P-WRK-01`) para evitar bloquear el API Gateway.
- *Disponibilidad y Modularidad (RNF-0001):* Despliegue modular basado en Docker, permitiendo la gestión independiente de cada servicio backend.
