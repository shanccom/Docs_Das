// =====================================================================
// VISTA FÍSICA - OmVital Physio Control  (contenido para la plantilla)
// Fuentes: Arquitectura Genérica v2.0.0 y Diagrama de Comportamiento v2.0.0
//
// Marcas:  [CONFIRMAR] = dato que NO aparece en los documentos aprobados
//          y debe validarse con el equipo / el cliente.
// El valor de RNF-0002 se cambia en un solo lugar (aquí abajo).
// =====================================================================

#let sistema = [OmVital Physio Control]
// CONFIRMAR: la Arquitectura Genérica dice "menor a 3 segundos" y el
// Diagrama de Comportamiento dice "t ≤ 500 ms". Elegir uno (ver Observaciones).
#let rnf2 = [menor a 3 segundos]

= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto tiene como propósito formalizar la *Vista Física* del sistema clínico #sistema, es decir, la distribución de sus componentes de software sobre los dispositivos, servidores y redes que conforman la solución. La vista física forma parte del modelo de vistas 4+1 y se representa mediante diagramas de despliegue UML [1].

A diferencia de la Arquitectura Genérica, que se mantiene independiente de la tecnología, esta vista debe decidir *dónde* se ejecuta cada responsabilidad y *con qué recursos*. Por ello, el documento distingue entre los dispositivos con los que la clínica cuenta actualmente y los que deben adquirirse o contratarse para cumplir los requisitos no funcionales (RNF) ya aprobados.

== Contexto del sistema

#sistema da soporte a una red de clínicas de fisioterapia y rehabilitación física ambulatoria con *tres sucursales interconectadas* que comparten información de pacientes en la nube. La operación abarca la gestión de pacientes y expedientes, la agenda y el check-in con verificación financiera síncrona, el control de camillas en tiempo real, la evaluación clínica y la emisión de constancias, la captura de firma digital y el envío de confirmaciones por WhatsApp y correo electrónico.

== Correspondencia con los artefactos aprobados

La vista física parte de los módulos y servicios definidos en el diagrama *D-DP-001* (Arquitectura Genérica, Nivel 2) y del flujo operativo del *DIA-CMP-0001* (Diagrama de Comportamiento). Cada dispositivo se justifica por al menos un RNF del catálogo (RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007 y RNF-0010).

== Objetivos del diseño de la Vista Física

+ Inventariar los dispositivos y servicios con los que cuenta actualmente la clínica.
+ Identificar los dispositivos y servicios que deben adquirirse o contratarse, justificados por los RNF.
+ Representar la situación actual y la propuesta mediante dos diagramas de despliegue.
+ Describir la separación en capas, la separación de servidores y la comunicación entre nodos, incluido el acceso a la base de datos.
+ Mostrar cómo se representan los RNF (disponibilidad, rendimiento, tiempo real, seguridad, escalabilidad) en la infraestructura.

= Metodología del proceso y su relación con la metodología propuesta

== Marco metodológico híbrido

Al igual que en los artefactos anteriores, se empleó un marco híbrido que combina *Scrum* para la gestión del equipo, *Jira* para la trazabilidad de tareas y *modelado UML 2.5* (diagrama de despliegue) para la construcción técnica. El principio rector es la trazabilidad: cada dispositivo representado debe responder a un componente de la Arquitectura Genérica y a un RNF del catálogo.

== Organización del trabajo en equipo

El trabajo se organizó en ciclos iterativos de Scrum con los diez integrantes y los roles ya definidos para el proyecto:

- *Jefe de Proyecto y Arquitecto de Software* (AUT-0004): lineamientos de la infraestructura, validación técnica global y conformidad en las actas.
- *Especialista en QA* (AUT-0003): verificación cruzada de los diagramas contra el catálogo de requisitos y contra D-DP-001.
- *Gestor de Versionamiento y Base de Datos* (AUT-0001): repositorio Git, control de cambios y versiones del artefacto.
- *Analistas de Requisitos y Modeladores* (AUT-0002, AUT-0006, AUT-0007, AUT-0008, AUT-0010): inventario de dispositivos, análisis de brecha y modelado de los diagramas de despliegue.
- *Diseñadores de Software y Maquetación* (AUT-0005, AUT-0009): redacción técnica y maquetación del documento en Typst.
- *Asesor docente* (EXP-001): retroalimentación formativa.

== Gestión mediante Jira

El flujo de tareas siguió los estados Por hacer, En progreso, En revisión/QA y Completado. Las actividades gestionadas fueron: revisar RNF y componentes de la Arquitectura Genérica, inventariar dispositivos existentes, determinar los dispositivos a adquirir, elaborar los diagramas de despliegue, revisarlos con QA y elaborar las fichas técnicas y el documento.

== Proceso de construcción de la Vista Física

+ *Fase 1 – Extracción de requisitos con impacto físico:* se seleccionaron los RNF y los módulos de D-DP-001 que condicionan la infraestructura.
+ *Fase 2 – Inventario de la situación actual:* se listaron los dispositivos existentes por sucursal.
+ *Fase 3 – Análisis de brecha:* se contrastó lo existente con lo que exigen los RNF para definir lo que debe adquirirse o contratarse.
+ *Fase 4 – Modelado:* se elaboraron dos diagramas de despliegue: situación actual (D-FIS-001) y situación propuesta (D-FIS-002). Siguiendo las observaciones aprobadas en los artefactos anteriores, cada diagrama incluye la sección de requisitos funcionales y la de requisitos no funcionales como contexto.
+ *Fase 5 – Verificación cruzada:* se comprobó la coherencia con D-ARQ-001, D-DP-001 y DIA-CMP-0001.
+ *Fase 6 – Fichas técnicas y documentación en Typst.*

== Relación entre el proceso de trabajo y la construcción del artefacto

#table(
  columns: (1fr, 1fr),
  align: left,
  [*Proceso de trabajo (gestión y control)*], [*Construcción del artefacto (técnico)*],
  [Scrum: planificación del sprint], [Extracción de RNF y módulos con impacto físico],
  [Jira: registro y asignación de tareas], [Inventario de dispositivos y análisis de brecha],
  [Scrum: actas de trabajo y reuniones], [Coordinación entre quien redacta y quien diagrama],
  [Jira: estado «En progreso»], [Modelado de los dos diagramas de despliegue],
  [Scrum: revisión por pares (QA)], [Verificación contra RNF y contra D-DP-001],
  [Jira: estado «En revisión»], [Fichas técnicas y maquetación en Typst],
  [Scrum: aprobación del Jefe de Proyecto], [Compilación final y cierre del artefacto],
)

= Actas de trabajo

// Insertar aquí las actas firmadas del trabajo de la Vista Física
// (fecha, hora, lugar, agenda, asistencia con firmas, acuerdos y calificación).
// Deben ser actas nuevas de esta vista; no se reutilizan las de la Arquitectura Genérica.

[Insertar las actas de trabajo firmadas correspondientes a la Vista Física.]

= Tabla resumen de las calificaciones de los estudiantes

La siguiente tabla muestra la calificación de cada estudiante según la apreciación del jefe de proyecto.

#table(
  columns: (2fr, 1.4fr, auto, auto),
  align: (left, left, center, center),
  [*Estudiante*], [*Rol / Tarea*], [*Apreciación*], [*Calificación*],
  [AUT-0001 Barrios Medina, Mathias], [Gestor de Versionamiento y BD], [ ], [ ],
  [AUT-0002 Boza Portilla, Yordano], [Analista de Requisitos y Modelador], [ ], [ ],
  [AUT-0003 Cuno Salazar, Eduardo], [Especialista en QA], [ ], [ ],
  [AUT-0004 Hancco Mullisaca, Sergio], [Jefe de Proyecto y Arquitecto], [ ], [ ],
  [AUT-0005 Huacani Jara, Denise], [Diseñadora y Maquetación], [ ], [ ],
  [AUT-0006 Mollo Chuquicaña, Dolly], [Analista de Requisitos y Modelador], [ ], [ ],
  [AUT-0007 Nina Calizaya, Rafael], [Analista de Requisitos y Modelador], [ ], [ ],
  [AUT-0008 Pacheco Palo, Fabiana], [Analista de Requisitos y Modelador], [ ], [ ],
  [AUT-0009 Quispe Madariaga, Jeferson], [Diseñador y Maquetación], [ ], [ ],
  [AUT-0010 Suclle Suca, Michael], [Analista de Requisitos y Modelador], [ ], [ ],
)

= Tabla resumen de la calificación obtenida por el jefe de proyecto

La siguiente tabla muestra la evaluación del jefe de proyecto (AUT-0004 Sergio Hancco) desde la perspectiva de los integrantes del equipo.

#table(
  columns: (2fr, 2fr, auto, auto),
  align: (left, left, center, center),
  [*Integrante evaluador*], [*Criterio evaluado*], [*Apreciación*], [*Calificación*],
  [AUT-0001 Mathias Barrios], [Liderazgo y gestión de tareas], [ ], [ ],
  [AUT-0002 Yordano Boza], [Comunicación y claridad de objetivos], [ ], [ ],
  [AUT-0003 Eduardo Cuno], [Apoyo técnico y resolución de dudas], [ ], [ ],
  [AUT-0005 Denise Huacani], [Organización y planificación del sprint], [ ], [ ],
  [AUT-0006 Dolly Mollo], [Delegación efectiva de responsabilidades], [ ], [ ],
  [AUT-0007 Rafael Nina], [Ambiente de trabajo y motivación], [ ], [ ],
  [AUT-0008 Fabiana Pacheco], [Seguimiento y retroalimentación continua], [ ], [ ],
  [AUT-0009 Jeferson Quispe], [Gestión del tiempo y cumplimiento de plazos], [ ], [ ],
  [AUT-0010 Michael Suclle], [Negociación y gestión de conflictos], [ ], [ ],
  [AUT-0004 Sergio Hancco], [Autoevaluación de su gestión], [ ], [ ],
)

= Estado del arte

== La vista física en el modelo 4+1

Kruchten propone describir la arquitectura mediante cinco vistas: lógica, de procesos, de desarrollo, física y de escenarios [1]. La vista física asigna los elementos del software a los nodos de hardware y atiende requisitos como la disponibilidad, la fiabilidad, el rendimiento y la escalabilidad. Por eso se elabora después de las vistas lógica y de procesos, y se deriva de ellas.

== El diagrama de despliegue de UML

UML 2.5 modela la vista física mediante el diagrama de despliegue, compuesto por nodos (dispositivos físicos o entornos de ejecución), artefactos de software desplegados en ellos y rutas de comunicación entre nodos [2], [3]. Es el medio habitual para documentar arquitecturas cliente-servidor y en capas.

== Infraestructura para sistemas de salud multi-sede

La revisión sistemática de Casanova, Villa-Garzon y Branch-Bedoya sobre 89 estudios identifica una presencia importante de arquitecturas basadas en servicios y arquitecturas distribuidas en los sistemas de información en salud [5]. Esto respalda la decisión de #sistema de centralizar los datos en la nube y de acceder a ellos desde tres sucursales. La OMS, por su parte, considera la tecnología como uno de los dominios arquitectónicos de la salud digital y plantea que las plataformas deben favorecer la integración y la interoperabilidad [6], [7].

== Atributos de calidad y decisiones de infraestructura

Bass, Clements y Kazman describen tácticas de arquitectura para atributos como la disponibilidad (redundancia y réplicas), el rendimiento (caché y reparto de carga) y la escalabilidad (agregar recursos sin rediseñar) [4]. En este artefacto esas tácticas se traducen en servidores replicables, balanceo de carga, caché, base de datos con réplica y respaldos.

= Descripción del artefacto

La vista física representa cómo se distribuyen los componentes de #sistema entre los equipos que conforman la solución. Se emplea el diagrama de despliegue UML: el sistema es el componente mayor y los dispositivos y servidores son los componentes menores contenidos en él. Se presentan dos diagramas: *D-FIS-001* (situación actual) y *D-FIS-002* (situación propuesta).

// CONFIRMAR con el equipo la nomenclatura de los códigos D-FIS-xxx.

== Insumos para la construcción de la vista

=== Requisitos no funcionales con impacto en la infraestructura

#table(
  columns: (auto, 1.2fr, 2fr, 2fr),
  align: (center, left, left, left),
  [*Código*], [*RNF / atributo*], [*Métrica de diseño*], [*Impacto en la infraestructura*],
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
  [*N.°*], [*Dispositivo*], [*Función en el sistema*], [*Cant.*], [*Fuente*],
  [1], [Laptop estándar de oficina (4 a 8 GB de RAM)], [Cliente de la aplicación web en recepción: registro, check-in, carga de firma en PDF.], [[CONFIRMAR] por sede], [Observaciones de DIA-CMP-0001],
  [2], [Conexión a Internet de la clínica (router o módem)], [Acceso de cada sucursal a la nube.], [[CONFIRMAR] 3], [Observaciones de la Arquitectura Genérica (RNF-0001)],
  [3], [Equipo del fisioterapeuta en consultorio (PC, laptop o celular)], [Registro de notas de evolución (SOAP) y consulta de la ficha del paciente.], [[CONFIRMAR]], [Sin confirmar en los documentos],
  [4], [Impresora para constancias], [Impresión de la constancia de atención.], [[CONFIRMAR]], [Sin confirmar en los documentos],
)

Servicios externos ya disponibles, que no son dispositivos del sistema: WhatsApp y correo electrónico (confirmaciones y recordatorios), módulo financiero y de facturación, y servicio de firma digital (Firma Perú).

=== Diagrama de despliegue 1: situación actual

#figure(
  rect(width: 100%, height: 7cm)[
    #align(center + horizon)[Insertar aquí el diagrama D-FIS-001 (situación actual)]
  ],
  caption: [D-FIS-001: Diagrama de despliegue de #sistema – situación actual.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación actual*],
  [Código del diagrama], [D-FIS-001],
  [Requisitos no funcionales], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010 (mostrados como contexto en el diagrama)],
  [Contexto / módulo], [Vista Física de #sistema – situación actual],
  [Proceso representado], [Dispositivos existentes en las tres sucursales (clientes de recepción y consultorio y conexión a Internet). Evidencia que aún no existe infraestructura central para compartir datos entre sedes.],
  [Versión], [1.0.0],
  [Autor], [[AUT-xxxx]],
  [Fecha], [[dd/mm/2026]],
  [Justificación], [Establece la línea base de la infraestructura disponible y permite medir la brecha frente a los RNF.],
  [Estado], [[Concluido / En revisión]],
  [Código de artefactos], [EDU-0001, EDU-0002, EDU-0025, EDU-0026, EDU-0029, EDU-0032, EDU-0033],
  [Comentarios], [Ninguno],
)

== Dispositivos que deben adquirirse o contratarse

=== Dispositivos físicos por sucursal

#table(
  columns: (auto, 1.3fr, 2fr, auto, auto),
  align: (center, left, left, center, center),
  [*N.°*], [*Dispositivo*], [*Justificación*], [*RNF*], [*Cant.*],
  [A1], [Tableta de captura de firma], [Captura de firma del paciente en menos de 10 s. En el análisis de DIA-CMP-0001 la captura en laptop toma 2 a 4 s frente a menos de 1 s con tableta dedicada, lo que importa en los picos de afluencia.], [RNF-0003], [[CONFIRMAR] por sede],
  [A2], [Router con VPN y firewall], [Enlace seguro entre cada sede y la nube (HTTPS/VPN) y filtrado del tráfico.], [RNF-0010], [3],
  [A3], [Enlace de Internet secundario], [Reduce la dependencia de un único proveedor de conectividad (observación de RNF-0001).], [RNF-0001], [3],
)

=== Infraestructura en la nube (contratada)

#table(
  columns: (auto, 1.3fr, 2fr, auto),
  align: (center, left, left, center),
  [*N.°*], [*Componente*], [*Justificación*], [*RNF*],
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
  rect(width: 100%, height: 8cm)[
    #align(center + horizon)[Insertar aquí el diagrama D-FIS-002 (existentes + a adquirir)]
  ],
  caption: [D-FIS-002: Diagrama de despliegue de #sistema – situación propuesta.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación propuesta*],
  [Código del diagrama], [D-FIS-002],
  [Requisitos no funcionales], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia), RNF-0010 (Integridad)],
  [Contexto / módulo], [Vista Física de #sistema – situación propuesta],
  [Proceso representado], [Acceso de las tres sucursales a una infraestructura centralizada en la nube mediante HTTPS/VPN, con servidores replicables, base de datos con réplica, caché, almacenamiento de archivos, respaldo y monitoreo. Distingue con otro color los dispositivos existentes de los que deben adquirirse.],
  [Versión], [1.0.0],
  [Autor], [[AUT-xxxx]],
  [Fecha], [[dd/mm/2026]],
  [Justificación], [Concreta en infraestructura los componentes de D-DP-001 y cumple los RNF aprobados.],
  [Estado], [[Concluido / En revisión]],
  [Código de artefactos], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010, EDU-0027],
  [Comentarios], [Ninguno],
)

== Organización en capas y separación de servidores

#table(
  columns: (1fr, 2fr, 1.4fr),
  align: left,
  [*Capa*], [*Contenido (según D-DP-001)*], [*Nodo físico*],
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
  [*Origen*], [*Destino*], [*Protocolo*], [*Puerto*], [*Observación*],
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

= Conclusiones

== Del marco conceptual

- La vista física completa el modelo 4+1 al vincular los componentes de la Arquitectura Genérica con los dispositivos que los ejecutan.
- El diagrama de despliegue permite documentar nodos, artefactos y rutas de comunicación, y justificar cada dispositivo por un RNF.
- Los atributos de calidad se traducen en decisiones concretas: redundancia, caché, balanceo de carga, réplicas y canales seguros.
- Separar la vista actual de la propuesta hace visible la brecha de infraestructura y facilita planificar la inversión.

== Del producto

- Se elaboraron dos diagramas de despliegue: D-FIS-001 (situación actual) y D-FIS-002 (situación propuesta).
- Se identificaron los dispositivos existentes y los que deben adquirirse o contratarse: 3 dispositivos físicos por sucursal y 7 componentes en la nube, todos justificados por RNF.
- La infraestructura en la nube centraliza los datos de las tres sucursales y sostiene los RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007 y RNF-0010.
- El producto es coherente con D-DP-001 y deja listas las bases para la selección de tecnologías y el presupuesto.

= Observaciones

- *Inconsistencia en RNF-0002:* la Arquitectura Genérica indica un tiempo de respuesta menor a 3 segundos y el Diagrama de Comportamiento indica t ≤ 500 ms. Debe unificarse en el catálogo, porque cambia el dimensionamiento de caché y base de datos. En este documento se usa la primera.
- *Inconsistencia en el código de persistencia:* DIA-CMP-0001 usa «RNF-01» para la inmutabilidad, mientras que la Arquitectura Genérica la registra como RNF-0010. Aquí se usa RNF-0010.
- *EDU-0027 fuera del catálogo de la Arquitectura Genérica:* la ficha de D-DP-001 cita EDU-0027 (sincronización multi-sede), pero la tabla de educciones de ese documento no la incluye. Conviene incorporarla.
- *Dependencia de la conectividad (RNF-0001):* aun con enlace secundario, una caída del proveedor en la nube deja sin acceso a la información. No se define aún un modo degradado u offline para el check-in ni para la validación financiera síncrona.
- *Datos sin confirmar:* las cantidades de equipos, los equipos del fisioterapeuta, las impresoras y los puertos están marcados con [CONFIRMAR].
- *Valores referenciales:* los dimensionamientos provienen de supuestos del Diagrama de Comportamiento y deben validarse con pruebas de carga.
- *Costos:* no se incluyen cotizaciones ni presupuesto de los dispositivos y servicios propuestos.

= Bibliografía

+ P. B. Kruchten, «The 4+1 view model of architecture», _IEEE Software_, vol. 12, n.º 6, pp. 42–50, 1995.
+ Object Management Group, _Unified Modeling Language (UML), Version 2.5.1_. 2017.
+ G. Booch, J. Rumbaugh e I. Jacobson, _The Unified Modeling Language User Guide_, 2.ª ed. Boston, MA, EE. UU.: Addison-Wesley, 2005.
+ L. Bass, P. Clements y R. Kazman, _Software Architecture in Practice_, 4.ª ed. Boston, MA, EE. UU.: Addison-Wesley, 2021.
+ R. Casanova, F. A. Villa-Garzon y J. W. Branch-Bedoya, «Architectural patterns for health information systems: a systematic review», _Frontiers in Digital Health_, vol. 7, p. 1694839, 2025, doi: 10.3389/fdgth.2025.1694839.
+ World Health Organization e International Telecommunication Union, _Digital Health Platform Handbook: Building a Digital Information Infrastructure (Infostructure) for Health_. Ginebra, Suiza: World Health Organization, 2020.
+ World Health Organization, _Digital Transformation Handbook for Primary Health_. Ginebra, Suiza: World Health Organization, 2024.
+ Equipo OmVital, «Arquitectura Genérica de OmVital Physio Control, versión 2.0.0», Universidad Nacional de San Agustín, Arequipa, Perú, 2026.
+ Equipo OmVital, «Diagrama de Comportamiento de OmVital Physio Control, versión 2.0.0», Universidad Nacional de San Agustín, Arequipa, Perú, 2026.

= Anexos

== Versionamiento de la vista física

#table(
  columns: (auto, auto, 3fr, 1.5fr),
  align: (center, center, left, left),
  [*Fecha*], [*Versión*], [*Descripción*], [*Autores*],
  [[dd/mm/2026]], [1.0.0], [Versión inicial: inventario de dispositivos existentes y propuestos, diagramas D-FIS-001 y D-FIS-002.], [[AUT-xxxx]],
)
