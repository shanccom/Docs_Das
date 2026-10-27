= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto técnico tiene como propósito fundamental formalizar la especificación, el modelado y la documentación rigurosa de la *Vista de Procesos* (_Process View_) correspondiente al sistema clínico *OmVital Physio Control*. Dicha vista constituye una de las dimensiones estructurales del modelo canónico 4+1 introducido por Philippe Kruchten, complementando a la Vista Lógica, la Vista de Desarrollo y la Vista Física al abordar de forma exclusiva los aspectos dinámicos y de tiempo de ejecución de la arquitectura de software.

Mientras que las vistas estáticas describen la organización modular, los componentes y la topología de red, la Vista de Procesos modela cómo interactúan los hilos de ejecución, cómo se distribuyen las tareas computacionales, cómo se orquestan los flujos concurrentes entre múltiples actores y de qué forma se resuelven las sincronizaciones y el aislamiento transaccional bajo condiciones de operación reales.

En una plataforma médica orientada a la rehabilitación física y fisioterapia ambulatoria como OmVital Physio Control, el diseño explícito de los procesos en tiempo de ejecución resulta indispensable. La atención diaria demanda la concurrencia armónica entre la admisión en ventanilla, el agendamiento y ocupación dinámica de camillas de tratamiento, la consulta y edición en tiempo real de notas de evolución clínica (método SOAP) en consultorio, y la emisión asíncrona de constancias digitales con valor médico-legal. Carecer de un modelado riguroso de procesos conduciría inevitablemente a problemas críticos de tiempo de ejecución, tales como bloqueos mutuos (_deadlocks_), condiciones de carrera en la asignación de recursos clínicos, congelamiento de las interfaces de usuario por operaciones bloqueantes y degradación severa en los tiempos de respuesta.

== Contexto del sistema OmVital Physio Control

OmVital Physio Control da soporte a una red asistencial distribuida en tres sucursales interconectadas que comparten una base de datos centralizada en la nube bajo PostgreSQL. La clínica atiende un flujo continuo y exigente de pacientes que presentan afecciones traumatológicas, patologías neurológicas crónicas, lesiones osteomusculares deportivas y requerimientos de rehabilitación psicomotriz gerontológica.

La operación diaria involucra la coordinación síncrona y asíncrona entre diversos perfiles operativos y subsistemas tecnológicos:

1. *Recepción y Admisión Ambulatoria (`ACT-0003`):* Encargada del control de llegada de pacientes, identificación biométrica o por DNI, confirmación de asistencia (Check-in) y validación inmediata del estado de pago o cupos disponibles en paquetes de sesiones antes de autorizar el ingreso a cabina.
2. *Fisioterapeutas en Consultorio (`ACT-0001`):* Profesionales de la salud que interactúan mediante dispositivos móviles y tabletas clínicas en sala de tratamiento, consultando la agenda de turnos, visualizando la disponibilidad de camillas, ejecutando protocolos terapéuticos, registrando la evolución médica y capturando la firma digital de conformidad del paciente.
3. *Coordinación Médica y Dirección (`ACT-0002` / `ACT-0004`):* Monitoreo en tiempo real del flujo asistencial, tiempos de permanencia en sala y rotación de recursos clínicos para optimizar la capacidad operativa de la clínica.
4. *Servicios Externos y Pasarelas de Integración:* Pasarela financiera para la validación de transacciones y saldos de sesiones, almacenamiento inmutable en la nube (AWS S3) y servicios de mensajería reactiva y multicanal (WebSockets dúplex, WhatsApp Business API y SMTP).

== Dinámica operacional y correspondencia con el catálogo de requisitos

El modelado procedimental plasmará con precisión la dinámica en tiempo de ejecución, traduciendo directamente las necesidades del catálogo de requisitos formalizadas mediante educciones (`EDU`), ilaciones (`ILA`), especificaciones técnicas (`ESP`) y requisitos no funcionales (`RNF`):

=== Dominio de admisión, check-in y verificación financiera síncrona (`EDU-0029`, `ILA-0020`)
Al presentarse el paciente en la sede, la recepcionista registra su llegada en la interfaz de admisión. El sistema ejecuta una consulta síncrona hacia la API financiera externa para verificar el saldo de sesiones disponibles dentro de un umbral máximo de latencia de 3 segundos (_RNF-0002_). 

Si el saldo es favorable, el motor de persistencia ejecuta una transacción ACID con nivel de aislamiento _Read Committed_, aplicando un bloqueo pesimista sobre el registro de la cita, debitando la sesión consumida y transicionando el estado a «En Sala». En caso de saldo insuficiente o rechazo financiero, el flujo de control bifurca hacia un proceso alternativo de regularización en caja, salvaguardando la consistencia contable del centro clínico.

=== Dominio de sincronización reactiva de camillas en tiempo real (`EDU-0026`, `EDU-0032`, `ILA-0019`)
La asignación y rotación de camillas en fisioterapia requiere que los cambios de disponibilidad se reflejen instantáneamente en todos los puntos de la clínica. El sistema implementa un canal de comunicación dúplex basado en WebSockets (RFC 6455).

Tan pronto como recepción asigna un box terapéutico o un terapeuta concluye un tratamiento, el evento de cambio de estado («Libre», «Asignada», «En Tratamiento», «En Desinfección») se difunde en menos de 1 segundo (_RNF-0006_) a las pantallas de recepción y a las tabletas de consultorio, eliminando tiempos muertos y previniendo la doble ocupación de recursos físicos.

=== Dominio de atención terapéutica, notas SOAP y gestión de contingencia por banderas rojas (`EDU-0025`, `ILA-0017`)
En el consultorio, el fisioterapeuta evalúa al paciente, registra constantes vitales y aplica las técnicas kinesiológicas prescritas. Si durante el examen preliminar se detectan signos de alarma o "banderas rojas" médicas (como hipertensión súbita o dolor inflamatorio agudo contraindicado), el flujo de control activa un protocolo de contingencia que suspende inmediatamente la sesión por seguridad clínica y deriva al paciente a consulta médica especializada.

Como regla transaccional crítica, la arquitectura asegura que dicha suspensión no debite la sesión del paciente, ejecutando una compensación atómica en el registro del paquete terapéutico.

=== Dominio de cierre asistencial, procesamiento asíncrono y notificación multicanal (`EDU-0025`, `EDU-0029`)
Al culminar satisfactoriamente la atención, el paciente estampa su firma digital en la tableta clínica. Para evitar demoras que perjudiquen el inicio del turno siguiente, la interfaz del terapeuta se libera en menos de 500 ms (_RNF-0002_), cambiando la camilla a estado de «Desinfección».

De forma paralela y desacoplada mediante un _fork_ de ejecución, un gestor de colas de tareas en segundo plano (_workers_) compila el reporte médico en formato PDF en menos de 5 segundos (_RNF-0007_), aplica cifrado simétrico AES-256 para su archivado inmutable en AWS S3 (_RNF-0010_) y despacha una notificación con el comprobante firmado y recordatorio del próximo turno vía WhatsApp API.

== Objetivos del modelado de la Vista de Procesos

La formalización de la Vista de Procesos en OmVital Physio Control persigue los siguientes objetivos directrices:

1. *Explicitar la concurrencia y el paralelismo del sistema:* Modelar mediante la notación formal UML 2.5 las actividades concurrentes, las bifurcaciones condicionales y los puntos de sincronización (_fork_ y _join_) entre los hilos del backend y los clientes conectados.
2. *Estructurar la arquitectura en capas de ejecución:* Delimitar con nitidez las responsabilidades operativas mediante carriles de partición correspondientes a las capas de Presentación, Aplicación, Persistencia, Tiempo Real, Asíncrona e Integración.
3. *Operacionalizar los Atributos de Calidad (RNF):* Traducir los requisitos no funcionales de latencia ($t <= 3$ s en check-in, $t < 1$ s en WebSocket, $t <= 500$ ms en tableta y $t <= 5$ s en PDF) en restricciones directas en los nodos de acción.
4. *Garantizar la integridad transaccional y el desacoplamiento:* Definir los límites de las transacciones ACID en la base de datos relacional y asegurar la independencia de tareas computacionalmente pesadas mediante procesamiento asíncrono.
5. *Proveer una guía canónica de implementación:* Servir como artefacto de referencia vinculante para los equipos de desarrollo e infraestructura, asegurando que los controladores, sockets, brokers y workers respeten los contratos dinámicos del sistema.
