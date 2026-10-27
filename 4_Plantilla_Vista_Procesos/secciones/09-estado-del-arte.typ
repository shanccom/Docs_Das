= Estado del arte

El modelado de la dimensión dinámica y concurrente en los sistemas de información en salud (_Health Information Systems_ - HIS) constituye uno de los pilares más críticos en la ingeniería de software moderna @casanova2025. En entornos asistenciales de fisioterapia y rehabilitación motriz, donde convergen la interacción presencial inmediata de los pacientes en recepción, la sincronización de recursos físicos en consultorio y la persistencia de actos médicos con valor legal, la arquitectura debe garantizar transaccionalidad estricta, baja latencia y alta tolerancia a fallos @vaz2025.

== La Vista de Procesos en el Modelo 4+1 de Kruchten

La formalización de la Vista de Procesos se fundamenta en el modelo canónico 4+1 introducido por Philippe Kruchten @kruchten1995. Mientras que la vista lógica modela la descomposición funcional del dominio y la vista de desarrollo organiza los módulos de software, la Vista de Procesos aborda exclusivamente los aspectos dinámicos y de tiempo de ejecución del sistema: la concurrencia, la distribución de tareas, la sincronización entre hilos o procesos independientes, el rendimiento y la escalabilidad del flujo operacional @bass2021.

En el contexto de OmVital Physio Control, esta perspectiva permite modelar cómo se orquestan simultáneamente las peticiones de admisión en recepción, la telemetría y actualización del estado de las camillas terapéuticas y la persistencia atómica de evoluciones clínicas (notas SOAP) sin incurrir en cuellos de botella ni bloqueos mutuos (_deadlocks_).

== Modelado de Concurrencia y Flujo Dinámico bajo UML 2.5

De acuerdo con el estándar de la Object Management Group @omg2017, los diagramas de actividades de UML 2.5 constituyen el formalismo predilecto para plasmar el comportamiento procedimental y los procesos de negocio en sistemas distribuidos. A través de la semántica de paso de fichas (_tokens_), UML 2.5 posibilita representar rigurosamente:

- *Carriles de partición (_activity partitions_):* Asignan responsabilidades específicas a cada capa de ejecución (Presentación, Aplicación, Persistencia, Tiempo Real, Asíncrona e Integración) y a los actores del sistema (Recepcionista, Fisioterapeuta y Paciente).
- *Nodos de bifurcación (_fork_) y sincronización (_join_):* Permiten modelar la ejecución paralela y concurrente de operaciones independientes, tales como la emisión síncrona de la confirmación en pantalla y el encolamiento desacoplado de tareas de generación de comprobantes.
- *Nodos de decisión y fusión (_merge_):* Formalizan rutas de control alternativas bajo guardas booleanas inequívocas, previniendo condiciones de ambigüedad en la lógica del negocio.

Esta notación proporciona una trazabilidad directa hacia los atributos de calidad del sistema, haciendo visible el impacto de cada decisión de diseño sobre los requisitos no funcionales @sommerville2011.

== Protocolos de Sincronización Reactiva en Tiempo Real (WebSockets / RFC 6455)

En los sistemas tradicionales de agendamiento y turnos ambulatorios, la sincronización de la disponibilidad de camillas solía apoyarse en sondeos periódicos de corta duración (_HTTP polling_), un esquema que introduce una sobrecarga inadmisible en los encabezados HTTP y latencias de refresco que propician conflictos de reserva @parrales2025.

Fette y Melnikov @fette2011 definen el protocolo WebSocket (RFC 6455) como un canal dúplex completo sobre una única conexión TCP persistente, reduciendo drásticamente la latencia y el consumo de ancho de banda. En OmVital Physio Control, la adopción de WebSockets en la Capa de Tiempo Real garantiza que cualquier cambio de estado en una camilla («Libre», «Asignada», «En Tratamiento» o «En Desinfección») se propague en menos de 1 segundo (_RNF-0006_) a todos los clientes conectados (terminales de recepción y tabletas de los fisioterapeutas), optimizando la rotación de recursos y eliminando tiempos muertos entre pacientes.

== Procesamiento Asíncrono y Desacoplamiento mediante Colas de Tareas

Las operaciones computacionalmente intensivas —tales como la compilación de reportes clínicos en PDF, el estampado cronológico de firmas digitales biométricas y el envío de notificaciones multicanal a través de APIs de mensajería (WhatsApp y correo electrónico)— no deben ejecutarse en el hilo principal de la aplicación médica, pues provocarían el congelamiento de la interfaz del usuario y una degradación severa de la experiencia asistencial @richards2020.

Tal como señala Secaira Zambrano @secaira2024, el desacoplamiento de estas responsabilidades mediante colas de mensajes y _workers_ en segundo plano asegura que la interacción clínica sea inmediata. En OmVital, cuando el fisioterapeuta concluye una sesión terapéutica y guarda la evolución, la interfaz de la tableta se libera en menos de 500 ms para permitir el inicio inmediato del siguiente paciente, mientras que el proceso de compilación del documento PDF y su almacenamiento inmutable en la nube se ejecuta asíncronamente en una ventana máxima de 5 segundos (_RNF-0007_).

== Aislamiento Transaccional ACID y Control de Concurrencia en Salud

La integridad de las historias clínicas y de los saldos de paquetes terapéuticos exige que el motor de persistencia garantice las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad) @pluas2022. En el flujo de check-in (`ILA-0020`), el descuento de una sesión de tratamiento y la actualización del estado de la cita deben ejecutarse bajo una transacción atómica; si la conexión se interrumpe o la verificación con la API financiera falla, el sistema debe efectuar un _rollback_ inmediato para salvaguardar la exactitud financiera y operativa.

Asimismo, la gestión clínica exige la implementación de protocolos de contingencia inmediatos ante "banderas rojas" médicas (fiebre súbita, hipertensión o desorientación) @vaz2025. La arquitectura de procesos contempla la suspensión preventiva de la atención sin descontar la sesión al paciente, preservando la inmutabilidad de la auditoría y cumpliendo con las normativas internacionales de protección de datos clínicos sensibles.
