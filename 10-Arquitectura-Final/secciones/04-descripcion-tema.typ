= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto técnico tiene como propósito fundamental formalizar la especificación, el modelado y la documentación integral de la *Arquitectura de Software Final* correspondiente a la plataforma clínica *OmVital Physio Control*. Dicho sistema ha sido concebido para proporcionar un soporte asistencial y administrativo robusto, trazable y de alta disponibilidad a una red de centros médicos especializados en fisioterapia y rehabilitación física ambulatoria, garantizando la seguridad del paciente, la orquestación óptima de recursos clínicos y la custodia inalterable de los expedientes con valor médico-legal en sus diferentes sedes operativas #cite(<casanova2025>).

La arquitectura de software final constituye el plano director definitivo que articula, sintetiza y concilia las diversas vistas estructurales, dinámicas y de despliegue abordadas en las etapas precedentes del ciclo de vida del proyecto. Para lograr una representación rigurosa y libre de ambigüedades, se adopta el *Modelo C4* propuesto por Simon Brown #cite(<brown2024>), el cual estructura la arquitectura en niveles jerárquicos de abstracción progresiva (Contexto, Contenedores y Componentes), permitiendo comunicar la solución técnica con claridad tanto a directivos del negocio de salud como a ingenieros de software e infraestructura.

Asimismo, la arquitectura final fundamenta sus decisiones de diseño en un *estilo híbrido MVC* acoplado a un *Monolito Modular* #cite(<richards2020>), complementado en su núcleo transaccional mediante los principios de *Clean Architecture* #cite(<martin2017>) y *Arquitectura Hexagonal* (Puertos y Adaptadores) #cite(<cockburn2005>). Este andamiaje garantiza el aislamiento de las invariantes y reglas de negocio clínico respecto de tecnologías volátiles, bibliotecas de persistencia y servicios externos de terceros, dotando a la clínica de una infraestructura digital escalable, mantenible y de fácil evolución conforme a las directrices de salud digital de la Organización Mundial de la Salud #cite(<oms2020>) #cite(<oms2024>).

== Contexto del sistema OmVital Physio Control

*OmVital Physio Control* opera como el núcleo informático de una red asistencial distribuida en tres sucursales físicas (Sede Central, Sede Norte y Sede Sur), las cuales operan en línea de forma coordinada accediendo a un repositorio centralizado de datos alojado en la nube. La clínica atiende un flujo continuo y altamente dinámico de pacientes con patologías traumatológicas, afecciones neurológicas crónicas, lesiones osteomusculares deportivas y requerimientos de rehabilitación psicomotriz gerontológica.

De acuerdo con el dimensionamiento operacional del sistema, la arquitectura se encuentra calculada para soportar:
- La atención concurrente de hasta 65 pacientes diarios distribuidos entre las tres sedes.
- Ventanas de alta concentración en recepción con picos de 6 a 10 pacientes en intervalos de 10 a 15 minutos al inicio de cada bloque horario.
- Más de 20 consultas clínicas y terapéuticas ejecutadas de manera simultánea en cabinas y boxes de atención.
- Cargas transaccionales pico superiores a 25 peticiones por segundo (req/s) dirigidas hacia el servidor central.
- La custodia histórica y el acceso en línea a más de 10 000 expedientes clínicos electrónicos bajo estrictas políticas de inmutabilidad y confidencialidad.

La dinámica del centro clínico demanda una orquestación precisa entre cinco ámbitos operacionales interdependientes:
1. *Gestión integral de pacientes y expedientes clínicos:* Apertura de historias clínicas, registro de datos de filiación, captura de antecedentes y formalización digital de consentimientos informados con certificación criptográfica, aplicando una política obligatoria de baja lógica que prohíbe el borrado físico de registros para salvaguardar la responsabilidad médico-legal institucional.
2. *Programación de citas y admisión síncrona en recepción (Check-in):* Reserva de turnos ambulatorios por especialidad, control de asistencia en ventanilla y validación síncrona en tiempo real del saldo de sesiones contratadas frente a la pasarela financiera externa antes de autorizar el paso del paciente al área de boxes.
3. *Gestión y rotación de recursos clínicos en tiempo real:* Supervisión reactiva del estado y disponibilidad de camillas terapéuticas y consultorios en cada sede, difundiendo de forma instantánea los cambios de ocupación para evitar sobreasignaciones y colisiones entre fisioterapeutas.
4. *Protocolo asistencial de fisioterapia, notas SOAP y banderas rojas:* Registro en el punto de atención de la anamnesis, constantes vitales, técnicas kinesiológicas aplicadas y notas de evolución clínica bajo el estándar SOAP. Incorpora la activación de protocolos de contingencia médica inmediata ante la detección de signos de alerta ("banderas rojas") que contraindiquen la terapia física.
5. *Cierre asistencial, certificación digital PKI y seguimiento multicanal:* Captura ágil de la firma digital de conformidad del paciente en tableta clínica, liberación inmediata del box de tratamiento, compilación asíncrona de constancias en PDF para su resguardo inalterable en la nube (AWS S3) y despacho automatizado de comprobantes y recordatorios preventivos mediante mensajería por WhatsApp.

== Delimitación de actores y ecosistema de integración (C4 Nivel 1)

En el nivel más alto de abstracción, el sistema se delimita conceptualmente como una caja negra estricta según el estándar del Modelo C4, delimitando con precisión las fronteras del software respecto a los actores humanos y los sistemas externos que forman parte de su ecosistema:

=== Actores humanos del sistema

- *Fisioterapeuta (`ACT-0001`):* Profesional asistencial que interactúa directamente desde dispositivos tipo tableta (`P-CLI-02`) en los boxes de tratamiento. Realiza la llamada del paciente, registra constantes vitales y notas SOAP, activa contingencias médicas y captura la firma de conformidad del paciente al culminar la sesión terapéutica.
- *Coordinador de Sede (`ACT-0002`):* Responsable de la asignación de turnos, supervisión de la rotación de camillas, resolución de reasignaciones de terapeutas y balanceo de carga asistencial entre boxes mediante la aplicación web (`P-CLI-01`).
- *Recepcionista (`ACT-0003`):* Personal administrativo de ventanilla que utiliza la estación de trabajo de recepción (`P-CLI-01`) para registrar nuevos pacientes, programar citas en agenda, ejecutar el proceso de check-in en un solo clic y coordinar regularizaciones de pago en caja.
- *Gerente General (`ACT-0004`):* Usuario directivo que accede mediante la interfaz web administrativa (`P-CLI-01`) a módulos de reportería consolidada, auditoría médica multi-sede, indicadores de productividad y monitoreo financiero global.
- *Paciente de Rehabilitación (Actor externo receptor):* Persona que asiste al centro clínico para recibir tratamiento. No posee credenciales directas de acceso al sistema transaccional; interactúa físicamente estampando su firma digital en la tableta del terapeuta y recibe de manera asíncrona notificaciones de citas, recordatorios preventivos y enlaces seguros a sus constancias de atención vía mensajería móvil.

=== Sistemas externos de integración

- *Pasarela Financiera (`S-EXT-01`):* Sistema bancario externo consultado síncronamente vía HTTPS REST para comprobar el saldo de paquetes de sesiones y autorizar cobros en línea, sujeto a una política estricta de tiempo de corte ($t <= 3$ s).
- *AWS S3 (`S-EXT-02`):* Repositorio de almacenamiento de objetos en la nube de alta durabilidad (99.999999999%), utilizado para la custodia inmutable de historias clínicas electrónicas, consentimientos informados firmados y constancias de atención en formato PDF cifrado.
- *WhatsApp Meta Cloud API (`S-EXT-03`):* Servicio de mensajería asíncrona empleado para el despacho automatizado de alertas de abandono, recordatorios de turnos agendados y entrega de comprobantes digitales de atención al paciente.
- *Firma Perú - RENIEC PKI (`S-EXT-04`):* Infraestructura de Clave Pública (PKI) y estampado cronológico digital con valor legal conforme a la normativa peruana, invocada para la certificación criptográfica de consentimientos informados y actas de atención clínica.

== Dinámica operacional y correspondencia con el catálogo oficial de requisitos

La arquitectura final de OmVital Physio Control materializa y da cumplimiento estricto a los requisitos funcionales y no funcionales consolidados en el catálogo oficial del proyecto, el cual se encuentra catalogado y versionado en la base de datos relacional de trazabilidad:

=== Dominio de admisión, filiación y expediente clínico inmutable (`EDU-0001`, `EDU-0026`)
El subsistema de Pacientes y Admisión soporta la creación, indexación y búsqueda por DNI en menos de 3 segundos (`RNF-0002`), aplicando un retardo de estabilización (_debounce_) de 500 ms en el cliente web. Para cumplir con las regulaciones de confidencialidad e integridad médico-legal (`RNF-0010`, `RSK-01`), el sistema prohíbe taxativamente la eliminación física de registros asistenciales. Toda desvinculación se procesa como baja lógica ("Archivo Histórico"), preservando intacta la trazabilidad histórica de auditoría con identificación de usuario, rol y marca temporal UTC (`RNF-0015`).

=== Dominio de agenda multi-sede, check-in y validación financiera síncrona (`EDU-0002`, `EDU-0029`, `EDU-0031`)
Al apersonarse el paciente en ventanilla, la recepcionista activa el check-in en 1 solo clic (`RNF-0003`). El backend core ejecuta una verificación síncrona contra la Pasarela Financiera (`S-EXT-01`) dentro del umbral inflexible de 3 segundos (`RSK-05`). En caso exitoso, el sistema decrementa automáticamente la sesión del paquete y transiciona la cita a estado "En Sala". Para mitigar condiciones de carrera originadas por recepcionistas o coordinadores simultáneos (`RSK-02`), el motor transaccional implementa bloqueo pesimista por fila (`SELECT FOR UPDATE`) a nivel de base de datos relacional (`P-DAT-01`), rechazando cualquier reserva duplicada con código de estado `HTTP 409 Conflict`.

=== Dominio de concurrencia y orquestación reactiva de camillas en tiempo real (`EDU-0025`, `EDU-0032`, `RNF-0006`)
La disponibilidad física de camillas y consultorios se gestiona mediante un motor de eventos bidireccional sobre WebSockets (`P-SRV-02`) bajo el protocolo RFC 6455 #cite(<fette2011>). Toda mutación de estado ("Disponible", "Asignada", "En Tratamiento", "En Desinfección") se difunde de manera reactiva en menos de 1 segundo (con latencia objetivo de 200 a 450 ms) hacia las pantallas de recepción y las tabletas de consultorio, segmentando la mensajería por canal de sucursal (`RNF-0005`, `RNF-0006`).

=== Dominio asistencial, notas SOAP y gestión de contingencia ante banderas rojas (`EDU-0005`, `EDU-0006`, `EDU-0025`)
El fisioterapeuta registra el plan terapéutico estructurado en notas SOAP mediante la aplicación de tableta en el box. Ante la detección de signos clínicos de alarma o "banderas rojas" médicas (tales como crisis hipertensiva, sospecha de fractura o riesgo tromboembólico), el sistema habilita un protocolo asistencial de suspensión inmediata que revierte de forma transaccional el cobro de la sesión, protegiendo la salud del paciente y garantizando la consistencia financiera de la institución.

=== Dominio de cierre asistencial, certificación digital PKI y procesamiento asíncrono (`EDU-0025`, `EDU-0029`, `RNF-0007`)
Al finalizar la sesión terapéutica, el paciente estampa su firma digital en la tableta en un tiempo inferior a 10 segundos (`RNF-0003`). Con el fin de no degradar el flujo asistencial ni bloquear la interfaz del profesional ($t <= 500$ ms, `RNF-0002`), el backend core delega la compilación del reporte en PDF y su estampado de tiempo criptográfico (`S-EXT-04`) a una cola de mensajes en memoria (`P-BRK-01`) consumida por trabajadores en segundo plano (`P-WRK-01`), asegurando la generación y custodia del archivo en AWS S3 en menos de 5 segundos (`RNF-0007`, `RSK-04`).

=== Dominio de seguridad perimetral, control de acceso RBAC y auditoría (`EDU-0032`, `EDU-0033`, `RNF-0015..0018`)
El acceso al sistema se centraliza en un punto de borde perimetral (`P-EDGE-01`) que efectúa la terminación SSL/TLS 1.3 con latencia inferior a 50 ms (`RNF-0018`). La autenticación se valida mediante tokens de seguridad JSON Web Token (JWT), aplicando un modelo estricto de control de acceso basado en roles (RBAC) donde la identidad y los privilegios multi-sede se extraen y verifican exclusivamente en el servidor central (`RSK-06`), previniendo cualquier intento de escalamiento de privilegios.

== Estructura y niveles de abstracción arquitectónica

Para consolidar la solución global de ingeniería, la arquitectura de software final se organiza a través de los tres primeros niveles del Modelo C4, complementados con patrones de diseño de software reconocidos por la industria:

=== Modelo C4 y jerarquía de representación
1. *Nivel 1 - Contexto del Sistema (`D-C4-001`):* Delimita las fronteras del software como caja negra, explicitando las relaciones entre los cuatro actores internos, el paciente como actor externo y los cuatro sistemas externos de servicio #cite(<brown2024>).
2. *Nivel 2 - Contenedores y Protocolos Físicos de Comunicación (`D-C4-002`):* Desglosa las unidades de ejecución desplegables (clientes SPA React y Tablet Kotlin, proxy inverso Nginx, API Core FastAPI, motor WebSockets, broker Redis, worker Celery y base de datos PostgreSQL 16) y formaliza los 11 protocolos físicos estrictos de red que gobiernan su comunicación #cite(<brown2024>).
3. *Nivel 3 - Componentes Internos del Backend Core (`D-C4-003`):* Descompone el contenedor central `P-SRV-01` en cuatro capas concéntricas bajo los postulados de Clean Architecture y Arquitectura Hexagonal, vinculando los 11 casos de uso con sus puertos de entrada y adaptadores secundarios de persistencia e integración #cite(<martin2017>) #cite(<cockburn2005>).

=== Estilo arquitectónico híbrido MVC con Monolito Modular
La arquitectura adopta un estilo híbrido donde la *Vista* reside en los clientes de sede (`P-CLI-01` y `P-CLI-02`), mientras que el *Controlador* y el *Modelo* se centralizan en el servidor de aplicaciones dentro de un *Monolito Modular* #cite(<richards2020>). Esta decisión estratégica se fundamenta en la escala del centro clínico (3 sucursales y hasta 65 pacientes diarios): prescinde de la complejidad de despliegue y latencia de red inherentes a los microservicios, al tiempo que garantiza consistencia transaccional ACID estricta en una única base de datos relacional compartida.

=== Clean Architecture y Arquitectura Hexagonal en el núcleo transaccional
El servidor de aplicaciones `P-SRV-01` implementa el principio de inversión de dependencias dividiendo su lógica interna en cuatro capas concéntricas #cite(<martin2017>):
- *Capa de Presentación:* Enrutadores FastAPI organizados por dominio funcional, validación sintáctica de esquemas Pydantic y middlewares de seguridad JWT/RBAC.
- *Capa de Aplicación:* 11 Casos de Uso clínicos y administrativos que orquestan el flujo de negocio y exponen contratos abstractos de Puertos (repositorios e interfaces de servicios).
- *Capa de Dominio:* Entidades de negocio puras (Paciente, Expediente, Cita, Camilla, Nota SOAP, etc.) y reglas clínicas inviolables totalmente aisladas de dependencias de frameworks o bases de datos.
- *Capa de Infraestructura:* Adaptadores secundarios que implementan los puertos de aplicación mediante repositorios PostgreSQL (SQLAlchemy), el patrón Transactional Outbox, y conectores hacia S3, Firma Perú, Pasarela Financiera, WebSockets y Celery.

== Objetivos del diseño de la Arquitectura Final

La concepción y especificación de la Arquitectura Final persigue los siguientes objetivos primordiales:

1. *Consolidar la visión arquitectónica unificada del sistema:* Integrar las perspectivas de contexto, contenedores, componentes, datos y despliegue físico en un cuerpo documental armónico y congruente, cerrando el ciclo de diseño del curso.
2. *Garantizar la trazabilidad estricta y bidireccional de requisitos:* Establecer una vinculación verificable desde las 11 educciones activas y 27 ilaciones operativas, pasando por los diagramas C4 en tres niveles, hasta los atributos de calidad (`RNF-0001` a `RNF-0018`) y controles de riesgo (`RSK-01` a `RSK-06`).
3. *Aislar las invariantes clínicas frente a tecnologías de terceros:* Blindar las reglas del protocolo kinesiológico y la inmutabilidad de los expedientes médicos mediante puertos y adaptadores abstractos, permitiendo la actualización de bibliotecas y servicios sin alterar el núcleo de dominio.
4. *Resolver formalmente la contención y concurrencia multi-sede:* Especificar mecanismos de sincronización reactiva en tiempo real sobre WebSockets ($t < 1$ s) y bloqueos pesimistas relacionales en PostgreSQL para evitar sobreasignaciones de camillas y turnos entre sucursales.
5. *Desacoplar el cómputo intensivo del flujo interactivo:* Asegurar la rápida liberación de las interfaces de usuario en admisión ($t <= 3$ s) y consultorio ($t <= 500$ ms) delegando la generación de constancias PDF y la certificación digital PKI a procesamiento asíncrono con brokers y trabajadores en segundo plano.
6. *Establecer un contrato técnico normativo para la implementación:* Servir como marco de referencia canónico, exhaustivo e inequívoco para los equipos de desarrollo, pruebas y despliegue de infraestructura de *OmVital Physio Control*.
