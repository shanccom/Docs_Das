= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto técnico tiene como propósito fundamental formalizar la especificación, el modelado y la documentación rigurosa de la *Arquitectura Genérica* correspondiente al sistema clínico *OmVital Physio Control*. Dicho sistema ha sido concebido para dar soporte integral a una red de clínicas especializadas en fisioterapia y rehabilitación física ambulatoria, garantizando una atención clínica segura, una orquestación eficiente de los recursos y una trazabilidad médico-legal inmutable en sus diferentes sedes operativas.

La arquitectura genérica cumple este rol determinante al establecer una primera representación estructurada de los componentes que conformarán el sistema y de las relaciones existentes entre ellos, sirviendo como base para posteriores decisiones de diseño y construcción del software. A través de un nivel adecuado de abstracción, se organizan las principales responsabilidades del sistema sin introducir prematuramente dependencias tecnológicas, lenguajes de programación o plataformas específicas.

== Contexto del sistema OmVital Physio Control

El centro asistencial de fisioterapia atiende diariamente a un flujo continuo de pacientes que presentan patologías traumatológicas, afecciones neurológicas, lesiones deportivas y necesidades de acondicionamiento geronto-psicomotriz. La operación clínica se encuentra distribuida en tres sucursales interconectadas, destinadas al almacenamiento compartido en la nube, lo que exige una coordinación de alta disponibilidad y consistencia en los siguientes ámbitos operativos:

1. *Gestión de pacientes y expedientes clínicos*: Registro de nuevos usuarios, apertura de historias clínicas, captura digital obligatoria de consentimientos informados con respaldo legal inalterable y actualización permanente de antecedentes de salud, bajo la premisa estricta de prohibición del borrado físico para salvaguardar la responsabilidad médico-legal institucional.
2. *Programación y flujo de agenda de citas*: Reserva de turnos ambulatorios por especialidad y fisioterapeuta, control de asistencias mediante check-in en recepción, validación síncrona de saldo de sesiones disponibles con el módulo financiero y reprogramación o cancelación justificada de consultas.
3. *Gestión de recursos clínicos y concurrencia de camillas*: Supervisión en tiempo real de la disponibilidad, ocupación y rotación de camillas y consultorios en cada sede, evitando colisiones de agenda o sobreasignaciones entre profesionales.
4. *Protocolo asistencial de terapia física y banderas rojas*: Evaluación inicial, toma de constantes vitales, ejecución del plan de ejercicios terapéuticos y registro de notas de evolución clínica (método SOAP), así como la activación de protocolos de contingencia médica inmediata ante signos de alerta o "banderas rojas" que contraindiquen el tratamiento físico.
5. *Cierre de sesión, certificación digital y seguimiento multicanal*: Captura de firma digital de conformidad del paciente al concluir la sesión, liberación inmediata y desinfección del recurso físico, emisión ágil de constancias de atención en PDF y despacho asíncrono de confirmaciones y recordatorios preventivos mediante mensajería automatizada (WhatsApp y correo electrónico).

== Dinámica operacional y correspondencia con el catálogo de requisitos

El diseño de la arquitectura genérica en OmVital Physio Control traduce directamente las necesidades identificadas en el catálogo de requisitos del proyecto, el cual se encuentra catalogado y versionado en la base de datos relacional de trazabilidad. Los ámbitos operativos descritos se corresponden con un conjunto de educciones, ilaciones y especificaciones que condicionan las responsabilidades y componentes del modelo arquitectónico:

=== Dominio de admisión, filiación y expediente clínico (`EDU-0001`, `EDU-0026`)
El módulo de *Pacientes* agrupa las responsabilidades de registro, búsqueda y actualización de los datos maestros del paciente. De acuerdo con las regulaciones sanitarias y los requisitos de calidad (`RNF-0010`), el sistema garantiza la inmutabilidad de los expedientes. Ante el cese voluntario del tratamiento o el fallecimiento del paciente, el comportamiento del sistema aplica una baja lógica, cambiando su estado a "Archivo Histórico" e impidiendo la programación de nuevas citas, preservando intacta la auditoría histórica de documentos previos.

=== Dominio de agenda, check-in y verificación financiera síncrona (`EDU-0002`, `EDU-0031`, `RNF-0002`)
El módulo de *Citas y Atenciones* concentra la programación de turnos ambulatorios y el control de asistencias. Al momento en que el paciente ingresa a la sucursal, la recepcionista ejecuta la operación de check-in en un tiempo de respuesta óptimo (menor a 3 segundos, conforme a `RNF-0002`). El sistema inicia una consulta síncrona hacia la API del servicio financiero para validar si el paciente cuenta con saldo en su paquete de sesiones contratado, lo cual exige que la arquitectura contemple la interoperabilidad con los *servicios externos* de finanzas y facturación.

=== Dominio de recursos físicos y concurrencia de camillas (`EDU-0025`, `RNF-0006`)
El módulo de *Recursos* es responsable de la supervisión en tiempo real de la disponibilidad, ocupación y rotación de camillas y consultorios en cada sede. La actualización inmediata del estado de los recursos físicos en la interfaz de recepción (`RNF-0006`) condiciona la necesidad de mecanismos de sincronización y consistencia entre las tres sucursales sobre la infraestructura en la nube.

=== Dominio de evaluación clínica y documentación (`EDU-0005`, `EDU-0006`, `RNF-0003`, `RNF-0007`)
El módulo de *Documentos y Evaluaciones* gestiona la elaboración de fichas de evaluación inicial, diagnósticos, historias clínicas electrónicas y la emisión de constancias. La captura segura de la firma digital del paciente en menos de 10 segundos (`RNF-0003`) y la generación asíncrona de constancias en PDF en menos de 5 segundos (`RNF-0007`) son atributos de calidad que la arquitectura debe habilitar a través de componentes de generación documental y de servicios externos de certificación y mensajería.

=== Dominio de control de acceso, auditoría y respaldo (`EDU-0032`, `EDU-0033`, `RNF-0001`)
La *API y control de acceso* regula la autenticación y los permisos de los usuarios según su rol (recepción, clínico, administración), mientras que la *plataforma de datos* garantiza el registro inalterable de auditoría sobre las operaciones clínicas y la generación periódica de copias de seguridad. La disponibilidad de los documentos en la nube para las tres sucursales (`RNF-0001`) sustenta la decisión de desplegar la información sobre infraestructura distribuida de alta disponibilidad.

== Objetivos del diseño de la Arquitectura Genérica

La elaboración de la arquitectura genérica para el sistema OmVital persigue los siguientes objetivos esenciales:

1. *Delimitar de forma inequívoca el alcance funcional y las fronteras del sistema*: Representar la interacción de los actores (`ACT-0001` FisioTerapeuta, `ACT-0002` Coordinador, `ACT-0003` Recepcionista, `ACT-0004` Gerente y Paciente) con los límites del software y los servicios externos a través de una vista de contexto clara.
2. *Identificar y agrupar las responsabilidades del sistema*: Organizar las necesidades identificadas en la educción, ilación y especificación en componentes arquitectónicos coherentes, permitiendo que cada módulo asuma responsabilidades diferenciadas y reduzca el acoplamiento.
3. *Establecer las relaciones y dependencias entre componentes*: Definir de manera general el flujo de información entre los módulos internos y los servicios externos, sirviendo como base para los diagramas arquitectónicos posteriores (vista lógica, procesos y despliegue).
4. *Garantizar la trazabilidad estricta con los atributos de calidad*: Asegurar que cada componente arquitectónico responda a los tiempos de respuesta, la consistencia transaccional ACID, la inmutabilidad documental y la seguridad exigida por los Requisitos No Funcionales del proyecto (`RNF-0001`, `RNF-0002`, `RNF-0003`, `RNF-0006`, `RNF-0007`, `RNF-0010`).
5. *Mantener un nivel de abstracción independiente de la tecnología*: Posibilitar que el modelo arquitectónico pueda ser utilizado posteriormente como referencia para evaluar y seleccionar las tecnologías, lenguajes de programación y plataformas más apropiadas sin modificar la estructura conceptual obtenida.