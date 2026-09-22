= Descripción del artefacto

En este capítulo se detalla la estructura técnica de la Arquitectura Genérica del sistema clínico OmVital Physio Control, vinculando la trazabilidad de los requisitos analizados con el modelado del sistema en dos niveles de representación.

== Insumos para la construcción de la arquitectura

El diseño arquitectónico se fundamenta en la trazabilidad de los requisitos del proyecto, los cuales transforman las necesidades de la clínica en especificaciones técnicas verificables a través de tres etapas continuas: Educción, Ilación y Especificación.

=== Educción

A partir de las entrevistas con el personal clínico y administrativo, las necesidades operativas de la clínica se consolidaron en diez educciones activas:

#table(
  columns: (2.3cm, 3.2cm, 1fr, 3.2cm),
  align: (center + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    [*Código*], [*Área operativa*], [*Necesidad identificada*], [*Módulo relacionado*]
  ),
  [EDU-0001], [Gestión de Pacientes], [Registro, búsqueda y actualización de datos de filiación e historia de pacientes.], [Módulo de Pacientes],
  [EDU-0002], [Agenda y Citas], [Programación, reserva y reprogramación de citas según disponibilidad horaria.], [Módulo de Citas y Atenciones],
  [EDU-0005], [Atención y Terapias], [Registro de asistencia, notas de evolución y sesiones de terapia física aplicadas.], [Módulo de Citas y Atenciones],
  [EDU-0006], [Evaluación Clínica], [Elaboración de fichas de evaluación inicial, diagnósticos y emisión de constancias.], [Módulo de Documentos y Evaluaciones],
  [EDU-0025], [Recursos Físicos], [Control de disponibilidad y asignación de camillas y salas de terapia en tiempo real.], [Módulo de Recursos],
  [EDU-0026], [Consentimiento], [Firma y archivo digital del consentimiento informado para tratamientos clínicos.], [Servicios externos (Firma)],
  [EDU-0029], [Notificaciones], [Envío de recordatorios y avisos de citas a pacientes mediante mensajería (WhatsApp).], [Servicios externos (WhatsApp)],
  [EDU-0031], [Pagos y Facturación], [Registro de cobros por sesiones de terapia y emisión de comprobantes de pago.], [Servicios externos (Finanzas)],
  [EDU-0032], [Control de Acceso], [Autenticación y permisos de usuario según su rol (recepción, clínico, administración).], [API y control de acceso],
  [EDU-0033], [Auditoría y Respaldo], [Registro de cambios en historias clínicas y copias de seguridad de la información.], [Plataforma de datos],
)

=== Ilación

La etapa de ilación define las relaciones lógicas entre las necesidades del centro, estructurando 27 ilaciones (de ILA-0001 a ILA-0027) asociadas a cada educción de origen:

#table(
  columns: (2.2cm, 2.2cm, 3.2cm, 1fr),
  align: (center + horizon, center + horizon, left + horizon, left + horizon),
  table.header(
    [*Código*], [*Educción*], [*Proceso clínico / administrativo*], [*Flujo de interacción operativa*]
  ),
  [ILA-0001], [EDU-0001], [Registro de nuevo paciente], [Apertura de expediente clínico e ingreso de datos de filiación.],
  [ILA-0002], [EDU-0001], [Consulta de perfil de paciente], [Búsqueda rápida por DNI y visualización del expediente clínico.],
  [ILA-0003], [EDU-0001], [Actualización de paciente], [Modificación de información de contacto y antecedentes personales.],
  [ILA-0004], [EDU-0001], [Baja lógica o archivado], [Desactivación o archivo histórico del expediente del paciente.],
  [ILA-0005], [EDU-0002], [Programación de cita médica], [Asignación de paciente con fisioterapeuta, horario y camilla libre.],
  [ILA-0006], [EDU-0002], [Consulta de agenda médica], [Visualización de turnos y disponibilidad por sede y consultorio.],
  [ILA-0007], [EDU-0002], [Reprogramación de cita], [Modificación de fecha, turno u operador asignado a la cita.],
  [ILA-0008], [EDU-0002], [Cancelación de cita], [Liberación del turno reservado y registro del motivo de anulación.],
  [ILA-0009], [EDU-0005], [Seguimiento clínico], [Control de asistencia, sesiones aplicadas y notas de evolución.],
  [ILA-0010], [EDU-0005], [Dashboard de atención], [Monitoreo del progreso y número de sesiones del paquete clínico.],
  [ILA-0011], [EDU-0006], [Consulta de historias clínicas], [Acceso a expedientes y selección de evaluación inicial del paciente.],
  [ILA-0012], [EDU-0006], [Historial clínico del paciente], [Consulta cronológica de diagnósticos, evoluciones y constancias.],
  [ILA-0013], [EDU-0006], [Evaluación traumatológica], [Ficha clínica especializada y diagnóstico de terapia física.],
  [ILA-0014], [EDU-0006], [Evaluación geronto-psicomotriz], [Ficha clínica funcional especializada y plan de tratamiento.],
  [ILA-0015], [EDU-0025], [Asignación de camilla], [Reserva y ocupación de camilla según la terapia indicada.],
  [ILA-0016], [EDU-0025], [Consulta de estado de camillas], [Visualización en tiempo real de espacios ocupados y libres.],
  [ILA-0017], [EDU-0025], [Liberación y limpieza], [Notificación de término de terapia y cambio a estado disponible.],
  [ILA-0018], [EDU-0025], [Reasignación de recursos], [Ajuste de camilla o sala ante cambios imprevistos en la sede.],
  [ILA-0019], [EDU-0026], [Consentimiento informado], [Firma digital del paciente previa al inicio del tratamiento.],
  [ILA-0020], [EDU-0029], [Confirmación de cita], [Envío automatizado de mensaje de reserva al WhatsApp del paciente.],
  [ILA-0021], [EDU-0029], [Recordatorio de cita], [Envío de aviso previo a la sesión para reducir el ausentismo.],
  [ILA-0022], [EDU-0031], [Cobro de sesiones y paquetes], [Registro de pagos por sesiones de fisioterapia adquiridas.],
  [ILA-0023], [EDU-0031], [Emisión de comprobante], [Generación de boleta o factura electrónica autorizada.],
  [ILA-0024], [EDU-0031], [Estado de cuenta del paciente], [Consulta de sesiones pagadas, consumidas y pendientes.],
  [ILA-0025], [EDU-0031], [Ajuste o anulación de cobro], [Corrección de registros contables ante cancelaciones de servicio.],
  [ILA-0026], [EDU-0032], [Control de acceso], [Comprobación de credenciales y permisos según el rol del usuario.],
  [ILA-0027], [EDU-0033], [Auditoría y respaldo de datos], [Trazabilidad de operaciones clínicas y respaldo periódico de datos.],
)

=== Especificación

La etapa de especificación formaliza las condiciones operativas y técnicas del software mediante especificaciones técnicas (`ESP`), las cuales se derivan de las ilaciones y definen las responsabilidades funcionales que implementa cada módulo de la arquitectura:

#table(
  columns: (2.1cm, 3.2cm, 2cm, 1fr, 2.9cm),
  align: (center + horizon, left + horizon, center + horizon, left + horizon, left + horizon),
  table.header(
    [*Código*], [*Funcionalidad*], [*Ilación*], [*Descripción operativa de la especificación*], [*Módulo arquitectónico*]
  ),
  [ESP-0001], [Registro de pacientes], [ILA-0001], [Formulario de captura y validación de datos de filiación.], [Módulo de Pacientes],
  [ESP-0003], [Consulta de pacientes], [ILA-0002], [Búsqueda rápida y filtrado de pacientes por DNI o nombres.], [Módulo de Pacientes],
  [ESP-0004], [Expediente clínico], [ILA-0002], [Visualización detallada del expediente clínico del paciente.], [Módulo de Pacientes],
  [ESP-0006], [Actualización de datos], [ILA-0003], [Actualización y corrección de datos personales y de contacto.], [Módulo de Pacientes],
  [ESP-0008], [Baja de pacientes], [ILA-0004], [Baja lógica y archivado histórico del expediente del paciente.], [Módulo de Pacientes],
  [ESP-0010], [Programación de citas], [ILA-0005], [Registro y reserva de cita médica según turno y fisioterapeuta.], [Citas y Atenciones],
  [ESP-0011], [Agenda de citas], [ILA-0006], [Consulta y visualización de la agenda de citas médicas.], [Citas y Atenciones],
  [ESP-0012], [Reprogramación de citas], [ILA-0007], [Modificación y reprogramación de citas médicas reservadas.], [Citas y Atenciones],
  [ESP-0013], [Cancelación de citas], [ILA-0008], [Cancelación de citas y liberación inmediata del turno.], [Citas y Atenciones],
  [ESP-0014], [Registro de atención], [ILA-0009], [Registro de asistencia, técnicas aplicadas y notas de evolución.], [Citas y Atenciones],
  [ESP-0015], [Evolución clínica], [ILA-0010], [Visualización de sesiones consumidas y evolución del tratamiento.], [Citas y Atenciones],
  [ESP-0016], [Gestión documental], [ILA-0011], [Gestión de historias clínicas y selección de evaluación inicial.], [Documentos y Eval.],
  [ESP-0017], [Historial de atenciones], [ILA-0012], [Consulta cronológica de evoluciones y altas clínicas.], [Documentos y Eval.],
  [ESP-0018], [Evaluación traumatológica], [ILA-0013], [Ficha de evaluación traumatológica y plan de tratamiento.], [Documentos y Eval.],
  [ESP-0019], [Evaluación psicomotriz], [ILA-0014], [Ficha de evaluación geronto-psicomotriz y constancias PDF.], [Documentos y Eval.],
  [ESP-0020], [Asignación de camillas], [ILA-0015], [Asignación de sesión de fisioterapia a una camilla libre.], [Módulo de Recursos],
  [ESP-0021], [Estado de camillas], [ILA-0016], [Consulta en tiempo real del estado de camillas en la sede.], [Módulo de Recursos],
  [ESP-0024], [Liberación de camillas], [ILA-0017], [Liberación y actualización de término de sesión en camilla.], [Módulo de Recursos],
  [ESP-0027], [Consentimiento informado], [ILA-0019], [Captura de firma digital y archivo de consentimiento informado.], [Servicios externos],
  [ESP-0030], [Notificaciones WhatsApp], [ILA-0020], [Envío de confirmación de cita médica por WhatsApp al paciente.], [Servicios externos],
  [ESP-0033], [Recordatorio de citas], [ILA-0021], [Envío automatizado de recordatorio previo a la cita terapéutica.], [Servicios externos],
  [ESP-0036], [Cobro de paquetes], [ILA-0022], [Registro de cobro por paquetes de sesiones terapéuticas.], [Servicios externos],
  [ESP-0038], [Facturación electrónica], [ILA-0023], [Emisión de boletas y facturas electrónicas autorizadas.], [Servicios externos],
  [ESP-0040], [Control de acceso], [ILA-0026], [Autenticación de usuarios y comprobación de permisos por rol.], [API y control de acceso],
  [ESP-0041], [Auditoría clínica], [ILA-0027], [Registro inalterable de auditoría sobre operaciones clínicas.], [Plataforma de datos],
  [ESP-0043], [Respaldo de base de datos], [ILA-0027], [Generación periódica de copias de seguridad de la base de datos.], [Plataforma de datos],
)

Asimismo, los requisitos no funcionales (`RNF`) activos del proyecto establecen las restricciones y criterios de calidad arquitectónicos:

#table(
  columns: (2.3cm, 3.4cm, 2.4cm, 1fr),
  align: (center + horizon, left + horizon, center + horizon, left + horizon),
  table.header(
    [*Código*], [*Nombre oficial*], [*Atributo*], [*Métrica / Criterio de diseño*]
  ),
  [RNF-0001], [Disponibilidad en la nube], [Disponibilidad], [Acceso continuo a expedientes, constancias y consentimientos desde cualquier sede.],
  [RNF-0002], [Búsqueda rápida por DNI], [Rendimiento], [Tiempo de respuesta menor a 3 segundos en búsquedas de pacientes en recepción.],
  [RNF-0003], [Firma digital en asistencia], [Seguridad], [Captura y guardado seguro de la firma del paciente en menos de 10 segundos.],
  [RNF-0006], [Camillas en tiempo real], [Tiempo real], [Actualización inmediata del estado de camillas en la interfaz de recepción.],
  [RNF-0007], [Emisión de constancias], [Eficiencia], [Generación automática de constancias de asistencia en PDF en menos de 5 segundos.],
  [RNF-0010], [Consentimiento digital], [Integridad], [Archivo digital inalterable del consentimiento informado firmado por el paciente.],
)

== Construcción de la Arquitectura Genérica

A partir de los requisitos establecidos, se definieron las responsabilidades del sistema y se agruparon en dos niveles de detalle:
- *Nivel 1*: Vista general que delimita las fronteras de la plataforma frente a los usuarios internos y los servicios externos.
- *Nivel 2*: Descomposición interna en capas, detallando presentación, controladores, módulos de negocio, servicios de soporte y almacenamiento.

=== Diagrama de la Arquitectura Genérica: Nivel 1

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1.png", width: 9cm),
  caption: [Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 1],
)

#table(
  columns: (5cm, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Campo*], [*Ficha técnica: Diagrama Arquitectura Genérica Nivel 1*]
  ),
  [*Código del diagrama:*], [D-ARQ-001],
  [*Requisitos no funcionales:*], [RNF-006: Rendimiento],
  [*Contexto / Módulo:*], [Arquitectura Generica Nivel 1],
  [*Proceso representado:*], [Interacción y organización general del Sistema Clínico, mostrando los subsistemas de Pacientes y Administración y su acceso a una base de datos compartida.],
  [*Versión:*], [1.0.0],
  [*Autor:*], [AUT-006],
  [*Fecha:*], [17/09/2026],
  [*Justificación:*], [El diagrama representa la estructura general del Sistema Clínico, identificando sus dos subsistemas principales, Pacientes y Administración, y mostrando que ambos utilizan una base de datos compartida. Permite visualizar la organización general del sistema y sirve como base para los diagramas arquitectónicos posteriores.],
  [*Estado:*], [Concluido],
  [*Código de artefactos:*], [Ninguno],
  [*Comentarios:*], [Ninguno],
)

=== Diagrama de la Arquitectura Genérica: Nivel 2

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2.png", width: 13.5cm),
  caption: [Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 2],
)

#table(
  columns: (5cm, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Campo*], [*Ficha técnica: Diagrama Arquitectura Genérica Nivel 2*]
  ),
  [*Código del diagrama:*], [D-DP-001],
  [*Requisitos no funcionales:*], [Requisitos funcionales y no funcionales],
  [*Contexto / Módulo:*], [Arquitectura genérica del sistema: Gestión y consulta de documentos del paciente],
  [*Proceso representado:*], [El diagrama representa cómo las tres sucursales acceden y actualizan de manera centralizada la información de los pacientes mediante un servidor web y una base de datos en la nube, permitiendo la continuidad de la atención entre sedes.],
  [*Versión:*], [1.0.1],
  [*Autor:*], [AUT-004],
  [*Fecha:*], [13/09/2026],
  [*Justificación:*], [El diagrama representa la arquitectura propuesta para permitir el acceso desde múltiples sucursales a la infraestructura en la nube, garantizando seguridad en las transmisiones (HTTPS/VPN), alta velocidad de respuesta mediante servicio de caché y soporte a comunicación en tiempo real con WebSockets.],
  [*Estado:*], [Concluido],
  [*Código de artefactos:*], [RNF-0001, EDU-0027],
  [*Comentarios:*], [Ninguno],
)