= Descripción del tema a tratar

== Introducción y justificación 

El presente artefacto técnico tiene como propósito fundamental formalizar la especificación, el modelado y la documentación rigurosa de los *Diagramas de Comportamiento* correspondientes al sistema clínico *OmVital Physio Control*. Dicho sistema ha sido concebido para dar soporte integral a una red de clínicas especializadas en fisioterapia y rehabilitación física ambulatoria, garantizando una atención clínica segura, una orquestación eficiente de los recursos y una trazabilidad médico-legal inmutable en sus diferentes sedes operativas.

Los diagramas de comportamiento cumplen este rol determinante al modelar cómo reacciona el sistema ante eventos del entorno asistencial, cómo se orquestan las operaciones entre los actores humanos y servicios externos, de qué manera fluyen los datos y el control a través de los procesos de negocio, y cómo transicionan los estados de las entidades clave a lo largo de su ciclo de vida.

== Contexto del sistema OmVital Physio Control

El centro asistencial de fisioterapia atiende diariamente a un flujo continuo de pacientes que presentan patologías traumatológicas, afecciones neurológicas, lesiones deportivas y necesidades de acondicionamiento geronto-psicomotriz. La operación clínica se encuentra distribuida en tres sucursales interconectadas, destinado al almacenamiento compartido en la nuve lo que exige una coordinación de alta disponibilidad y consistencia en los siguientes ámbitos operativos:

1. *Gestión de pacientes y expedientes clínicos*: Registro de nuevos usuarios, apertura de historias clínicas, captura digital obligatoria de consentimientos informados con respaldo legal inalterable y actualización permanente de antecedentes de salud, bajo la premisa estricta de prohibición del borrado físico para salvaguardar la responsabilidad médico-legal institucional.
2. *Programación y flujo de agenda de citas*: Reserva de turnos ambulatorios por especialidad y fisioterapeuta, control de asistencias mediante check-in en recepción, validación síncrona de saldo de sesiones disponibles con el módulo financiero, y reprogramación o cancelación justificada de consultas.
3. *Gestión de recursos clínicos y concurrencia de camillas*: Supervisión en tiempo real de la disponibilidad, ocupación y rotación de camillas y consultorios en cada sede, evitando colisiones de agenda o sobreasignaciones entre profesionales.
4. *Protocolo asistencial de terapia física y banderas rojas*: Evaluación inicial, toma de constantes vitales, ejecución del plan de ejercicios terapéuticos y registro de notas de evolución clínica (método SOAP). Asimismo, se requiere la activación de protocolos de contingencia médica inmediata ante signos de alerta o "banderas rojas" que contraindiquen el tratamiento físico.
5. *Cierre de sesión, certificación digital y seguimiento multicanal*: Captura de firma digital de conformidad del paciente al concluir la sesión, liberación inmediata y desinfección del recurso físico, emisión ágil de constancias de atención en PDF y despacho asíncrono de confirmaciones y recordatorios preventivos mediante mensajería automatizada (WhatsApp y correo electrónico).

== Dinámica operacional y correspondencia con el catálogo de requisitos

El modelado del comportamiento dinámico en OmVital Physio Control traduce directamente las necesidades identificadas en el catálogo de requisitos del proyecto, el cual se encuentra catalogado y versionado en la base de datos relacional de trazabilidad:

=== Flujo de admisión, filiación y expediente clínico (`EDU-0001`, `EDU-0026`)
La recepcionista (`ACT-0003`) registra la ficha de filiación del paciente y genera el documento digital de consentimiento informado. De acuerdo con las regulaciones sanitarias y los requisitos de calidad (`RNF-0010`), el sistema garantiza la inmutabilidad de los expedientes. Ante el cese voluntario del tratamiento o el fallecimiento del paciente, el comportamiento del sistema aplica una baja lógica, cambiando su estado a "Archivo Histórico" e impidiendo la programación de nuevas citas, preservando intacta la auditoría histórica de documentos previos.

=== Flujo de recepción, check-in y verificación financiera síncrona (`EDU-0002`, `EDU-0031`, `RNF-0002`)
Al momento en que el paciente ingresa a la sucursal, la recepcionista ejecuta la operación de check-in en un tiempo de respuesta óptimo (menor a 3 segundos, conforme a `RNF-0002`). El sistema inicia una consulta síncrona hacia la API del servicio financiero para validar si el paciente cuenta con saldo en su paquete de sesiones contratado. En caso favorable, la cita transiciona al estado "En Sala", el contador de sesiones pendientes se decrementa automáticamente y se notifica al fisioterapeuta asignado. En caso de ausencia de saldo o discrepancias financieras, el flujo de control bifurca hacia un proceso de regularización de pagos en caja antes de autorizar el ingreso a cabina terapéutica.

=== Flujo asistencial, contingencia médica y banderas rojas (`EDU-0005`, `EDU-0006`, `EDU-0025`)
El fisioterapeuta (`ACT-0001`) llama al paciente, ocupando una camilla previamente asignada cuyo estado se actualiza instantáneamente a "Ocupada" en la interfaz de recepción (`RNF-0006`). Durante la anamnesis y control preliminar de signos vitales, el sistema implementa una compuerta de decisión médica crítica: si se detectan "banderas rojas" clínicas (como picos de hipertensión severa, sospecha de fractura no consolidada o trombosis venosa profunda), el protocolo clínico exige la suspensión inmediata de la terapia física. El comportamiento del software registra la causa de la interrupción médica y la derivación hospitalaria de urgencia, asegurando como regla de negocio que la sesión no sea descontada del saldo del paciente ni penalizada económicamente.

=== Flujo de registro de evolución, certificación y liberación de recursos (`EDU-0025`, `EDU-0029`, `RNF-0003`, `RNF-0007`)
Al finalizar satisfactoriamente la aplicación de técnicas fisioterapéuticas, el profesional ingresa las notas de evolución y técnicas aplicadas en la historia clínica electrónica inmutable. El paciente estampa su firma digital en la interfaz móvil o tableta de atención en menos de 10 segundos (`RNF-0003`), formalizando la conformidad del servicio recibido. De inmediato, el sistema desencadena dos acciones concurrentes: la actualización del estado de la camilla a "En Desinfección / Disponible" y la generación asíncrona de la constancia de atención en formato PDF en menos de 5 segundos (`RNF-0007`), enviando una copia al expediente digital y una notificación de recordatorio para la próxima sesión a través de WhatsApp (`EDU-0029`).

=== Flujo de monitoreo de sede y coordinación operativa (`EDU-0027`, `EDU-0032`, `RNF-0001`)
El coordinador de sucursal (`ACT-0002`) y el gerente (`ACT-0004`) disponen de vistas dinámicas de supervisión para monitorear el flujo global de atenciones, el índice de ocupación de camillas y la sincronización de expedientes entre las tres sedes del centro clínico, garantizando continuidad asistencial ininterrumpida gracias a la infraestructura en la nube (`RNF-0001`).

== Objetivos del modelado de comportamiento

La elaboración de los diagramas de comportamiento para el sistema OmVital persigue los siguientes objetivos esenciales:

1. *Delimitar de forma inequívoca el alcance funcional y las fronteras del sistema*: Representar la interacción de los actores (`ACT-0001` FisioTerapeuta, `ACT-0002` Coordinador, `ACT-0003` Recepcionista, `ACT-0004` Gerente y Paciente) con los límites del software y servicios externos a través de casos de uso rigurosamente especificados.
2. *Formalizar la lógica procedimental de los procesos clínicos y administrativos*: Describir mediante diagramas de actividades el flujo ordenado de acciones, puntos de bifurcación condicional, sincronización paralela y tratamientos excepcionales (como banderas rojas y fallas de pago).
3. *Establecer el ciclo de vida y las reglas de transición de entidades críticas*: Definir los estados finitos, eventos desencadenantes, condiciones de guarda y acciones asociadas al ciclo de vida de la *Cita Médica*, la *Camilla / Recurso Terapéutico* y el *Expediente del Paciente*.
4. *Garantizar la trazabilidad estricta con los atributos de calidad*: Asegurar que cada escenario dinámico respete los tiempos de respuesta, la consistencia transaccional ACID, la inmutabilidad documental y la seguridad exigida por los Requisitos No Funcionales del proyecto.


