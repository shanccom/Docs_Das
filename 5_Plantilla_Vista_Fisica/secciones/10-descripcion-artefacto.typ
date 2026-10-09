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
  [3], [Equipo del fisioterapeuta en consultorio (PC, laptop o celular)], [Registro de notas de evolución (SOAP) y consulta de la ficha del paciente.], [0], [Entrevista 05, se tiene previsto una tableta en el futuro],
  [4], [Impresora para constancias], [Impresión de la constancia de atención.], [0], [Entrevista 05],
)

Servicios externos ya disponibles, que no son dispositivos del sistema: WhatsApp y correo electrónico (confirmaciones y recordatorios), módulo financiero y de facturación, y servicio de firma digital (Firma Perú).

=== Diagrama de despliegue 1: situación actual

#figure(
  rect(width: 100%, height: 7cm)[
    #align(center + horizon)[#image("/assets/image-1.png")]
  ],
  caption: [D-FIS-001: Diagrama de despliegue de #sistema – situación actual.],
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
  columns: (auto, 1.3fr, 2fr, auto, auto),
  align: (center, left, left, center, center),
  table.header(
    [*N.°*], [*Dispositivo*], [*Justificación*], [*RNF*], [*Cant.*],
  ),
  [A1], [Tableta de captura de firma], [Captura de firma del paciente en menos de 10 s. En el análisis de DIA-CMP-0001 la captura en laptop toma 2 a 4 s frente a menos de 1 s con tableta dedicada, lo que importa en los picos de afluencia.], [RNF-0003], [1],
  [A2], [Router con VPN y firewall], [Enlace seguro entre cada sede y la nube (HTTPS/VPN) y filtrado del tráfico.], [RNF-0010], [3],
  [A3], [Enlace de Internet secundario], [Reduce la dependencia de un único proveedor de conectividad (observación de RNF-0001).], [RNF-0001], [3],
)

=== Infraestructura en la nube (contratada)

#table(
  columns: (auto, 1.3fr, 2fr, auto),
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

=== Diagrama de despliegue 2: situación propuesta
#figure(
  rect(width: 100%, height: 7cm)[
    #align(center + horizon)[#image("/assets/image-2.png")]
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
  [Proceso representado], [Acceso de las tres sucursales a una infraestructura centralizada en la nube mediante HTTPS/VPN, con servidores replicables, base de datos con réplica, caché, almacenamiento de archivos, respaldo y monitoreo. Distingue con otro color los dispositivos existentes de los que deben adquirirse.],
  [Versión], [1.0.0],
  [Autor], [AUT-0008],
  [Fecha], [08/10/2026],
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
    [*Capa*], [*Contenido (según D-DP-001)*], [*Nodo físico*],
  ),
  [Presentación], [Interfaz web según rol: formularios, dashboard y reportes.], [Laptop o tableta de cada sucursal],
  [API y control de acceso], [Controladores, endpoints, validación, autenticación y autorización.], [Servidores de aplicación (B1)],
  [Servicios de aplicación], [Módulos de Pacientes, Citas y Atenciones, Documentos y Evaluaciones y Recursos; lógica de dominio y servicio de eventos.], [Servidores de aplicación (B1)],
  [Datos y almacenamiento], [Base de datos principal, caché, archivos y objetos.], [Servidor de BD (B3), caché (B4), almacenamiento (B5)],
  [Servicios transversales], [Respaldo, auditoría y monitoreo.], [Servicios B6 y B7],
  [Integraciones externas], [Finanzas y facturación, WhatsApp, correo y Firma Perú.], [Proveedores externos],
)

Los servidores se separan por responsabilidad: los servidores de aplicación no almacenan datos de forma permanente y la base de datos está en un nodo propio dentro de una red privada. Así se escala cada capa por separado y se protege el acceso a la información clínica.

== Comunicación entre nodos y acceso a la base de datos

Los puertos son *referenciales* y deben confirmarse al elegir la tecnología.

#table(
  columns: (1.3fr, 1.3fr, auto, auto, 1.5fr),
  align: (left, left, center, center, left),
  table.header(
    [*Origen*], [*Destino*], [*Protocolo*], [*Puerto*], [*Observación*],
  ),
  [Navegador (laptop o tableta)], [Balanceador], [HTTPS], [443], [Cifrado en tránsito],
  [Navegador], [Servidor de aplicación], [WSS], [443], [Estado de camillas en tiempo real (RNF-0006)],
  [Router de sede], [Nube], [VPN], [[CONFIRMAR]], [Túnel entre sede y nube],
  [Servidor de aplicación], [Servidor de BD], [TCP], [[5432 si es PostgreSQL]], [Único origen autorizado; BD sin acceso desde Internet],
  [Servidor de aplicación], [Caché], [TCP], [[CONFIRMAR]], [Red privada],
  [Servidor de aplicación], [Almacenamiento de archivos], [HTTPS], [443], [Firmas, consentimientos y PDF],
  [Servidor de aplicación], [Servicios externos], [HTTPS], [443], [Finanzas, WhatsApp, Firma Perú],
  [Servidor de BD], [Réplica y respaldo], [TCP], [[CONFIRMAR]], [Replicación continua],
  [Administración], [Servidores], [SSH], [22], [Solo por VPN o IP autorizadas],
)

El servidor de aplicación es el único nodo que se conecta con `OMVITAL_DB_PACIENTES`, mediante un usuario de privilegios mínimos. El acceso del cliente a los datos siempre pasa por la API, que valida la sesión y el rol (recepción, clínico, administración).

== Representación de la escalabilidad y de otros RNF

- *Escalabilidad:* los servidores de aplicación se dibujan como un grupo de multiplicidad 2..N detrás del balanceador, de modo que se agregan nodos sin rediseñar.
- *Disponibilidad (RNF-0001):* se muestran la réplica de la base de datos, el respaldo y el enlace de Internet secundario.
- *Rendimiento (RNF-0002):* se muestra el nodo de caché entre la aplicación y la base de datos.
- *Tiempo real (RNF-0006):* se marca el canal WebSocket entre el cliente y el servidor.
- *Seguridad e integridad (RNF-0003, RNF-0010):* se marcan los túneles VPN, el firewall y el almacenamiento con control de versiones.

Cada RNF se anota en el diagrama mediante notas UML asociadas a los nodos que lo satisfacen, junto con las secciones de requisitos funcionales y no funcionales exigidas en las revisiones anteriores.
