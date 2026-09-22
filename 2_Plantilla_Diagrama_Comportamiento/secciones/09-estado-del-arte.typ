= Estado del arte

El modelado del comportamiento dinámico en sistemas de información en salud (_Health Information Systems_ - HIS) representa un pilar esencial en la arquitectura de software médica. Su propósito es garantizar que el flujo operacional entre los actores clínicos y la plataforma se ejecute de manera transaccional, segura y alineada con los protocolos de atención al paciente.

== Integración Transaccional y Persistencia Inmutable en Historias Clínicas

De acuerdo con Pluas Cercado (2022), la trazabilidad y auditoría de eventos en sistemas hospitalarios exige que toda modificación o registro sobre la historia clínica se gestione mediante transacciones ACID con marcas temporales inmutables, prohibiendo estrictamente el borrado físico de información clínica sensible. Siguiendo este principio, el diagrama de comportamiento de OmVital no elimina datos de pacientes ni notas de evolución, sino que los guarda mediante procesos que garantizan que la información no se pierda ni se corrompa.

== Coordinación de Citas, Control de Concurrencia y Asignación de Recursos

Segun Parrales Pilligua (2025), los sistemas de agendamiento ambulatorio requieren mecanismos de sincronización instantánea entre la disponibilidad de recursos físicos (camillas y consultorios) y la agenda de los profesionales de la salud para evitar cruces o duplicaciones de turnos. En OmVital, este control se logra verificando en tiempo real la disponibilidad de camillas y el cambio de estado sincrónico de las citas al realizar el check-in.

== Verificación Financiera en Tiempo Real e Interoperabilidad

Según Casanova et al. (2025), la integración de arquitecturas distribuidas mediante  APIs REST para validar pagos e información del paciente es una práctica muy usada en software médico. OmVital adopta este enfoque al integrar una verificación síncrona con un servicio financiero para validar paquetes terapéuticos y saldos de sesiones antes de autorizar la atención clínica, contemplando un tiempo máximo de respuesta para mitigar cuellos de botella operacionales.

== Gestión de Banderas Rojas y Protocolos de Contingencia Clínica

Según Vaz et al. (2025), la detección temprana de signos de alerta o "banderas rojas" al tomar constantes vitales exige que el software permita cancelar la atención de inmediato y derivar al paciente a un médico especialista. OmVital aplica este criterio al permitir registrar la suspensión del tratamiento por motivos de seguridad sin descontar la sesión de la cuenta del paciente.

== Certificación Digital, Firma Electrónica y Notificación Multicanal

Según Secaira Zambrano (2024) destaca que la automatización de notificaciones multicanal (correo electrónico y WhatsApp) reduce significativamente el ausentismo en tratamientos prolongados. Asimismo, usar firma digital con fecha y hora le da valor legal a los comprobantes de atención, mientras que el envío automático de estos documentos en segundo plano evita que el sistema se vuelva lento o se congelen las pantallas.