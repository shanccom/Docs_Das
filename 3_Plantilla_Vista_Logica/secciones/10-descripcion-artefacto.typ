= Descripción del artefacto

El presente artefacto corresponde a la Vista Lógica del sistema clínico OmVital Physio Control, identificado con los códigos _D-LOG-001_ (Nivel 1: paquetes lógicos) y _D-LOG-002_ (Nivel 2: modelo de clases). El modelado se basa en los principios del diseño orientado a objetos y del estándar UML 2.5, representando las clases del sistema, sus responsabilidades, atributos, métodos y relaciones, en correspondencia con los módulos definidos en la arquitectura genérica.

El propósito de este artefacto es formalizar la estructura lógica del software: la organización de las clases de dominio en paquetes (Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos), la definición de sus atributos y métodos, y el establecimiento de las relaciones estructurales que reflejan la colaboración entre componentes.

Para garantizar la trazabilidad, la presente sección expone en primer lugar la fundamentación basada en las matrices de Educción, Ilación y Especificación técnica. La presentación de los diagramas de clases (Nivel 1 y Nivel 2) se incorpora en la sección de construcción del artefacto.

== Insumos para la construcción de la vista lógica

El diseño lógico se fundamenta en la trazabilidad de los requisitos del proyecto, transformando las necesidades de la clínica en especificaciones verificables a través de tres etapas: Educción, Ilación y Especificación.

=== Educción

A partir de las entrevistas con el personal clínico y administrativo, las necesidades operativas de la clínica se consolidaron en las siguientes educciones activas:

#align(center)[
  #set text(size: 9.5pt)
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
    [EDU-0029], [Asistencia y Check-in], [Control de llegada del paciente, verificación de sesiones a favor y registro de la asistencia del día.], [Módulo de Citas y Atenciones],
    [EDU-0031], [Pagos y Facturación], [Registro de cobros por sesiones de terapia y emisión de comprobantes de pago.], [Servicios externos (Finanzas)],
    [EDU-0032], [Control de Acceso], [Autenticación y permisos de usuario según su rol (recepción, clínico, administración).], [API y control de acceso],
    [EDU-0033], [Auditoría y Respaldo], [Registro de cambios en historias clínicas y copias de seguridad de la información.], [Plataforma de datos],
  )
]

=== Ilación

La etapa de ilación define las relaciones lógicas entre las necesidades del centro, estructurando 27 ilaciones (de ILA-0001 a ILA-0027) asociadas a cada educción de origen:

#align(center)[
  #set text(size: 9.5pt)
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
    [ILA-0020], [EDU-0029], [Registrar asistencia], [Control de llegada del paciente y registro de la asistencia del día con verificación del pago.],
    [ILA-0021], [EDU-0029], [Obtener constancia de asistencia], [Consulta y emisión de la constancia de asistencia del paciente.],
    [ILA-0022], [EDU-0031], [Cobro de sesiones y paquetes], [Registro de pagos por sesiones de fisioterapia adquiridas.],
    [ILA-0023], [EDU-0031], [Emisión de comprobante], [Generación de boleta o factura electrónica autorizada.],
    [ILA-0024], [EDU-0031], [Estado de cuenta del paciente], [Consulta de sesiones pagadas, consumidas y pendientes.],
    [ILA-0025], [EDU-0031], [Ajuste o anulación de cobro], [Corrección de registros contables ante cancelaciones de servicio.],
    [ILA-0026], [EDU-0032], [Control de acceso], [Comprobación de credenciales y permisos según el rol del usuario.],
    [ILA-0027], [EDU-0033], [Auditoría y respaldo de datos], [Trazabilidad de operaciones clínicas y respaldo periódico de datos.],
  )
]

=== Especificación

La etapa de especificación formaliza las condiciones operativas mediante especificaciones técnicas (`ESP`), derivadas de las ilaciones, que definen las responsabilidades funcionales de cada módulo de la arquitectura:

#align(center)[
  #set text(size: 9.5pt)
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
    [ESP-0030], [Registro de asistencia], [ILA-0020], [Control de llegada del paciente y registro de la asistencia del día con verificación del pago.], [Citas y Atenciones],
    [ESP-0033], [Enviar constancia de asistencia por correo], [ILA-0021], [Envío de la constancia de asistencia del paciente por correo electrónico.], [Servicios externos],
    [ESP-0036], [Cobro de paquetes], [ILA-0022], [Registro de cobro por paquetes de sesiones terapéuticas.], [Servicios externos],
    [ESP-0038], [Facturación electrónica], [ILA-0023], [Emisión de boletas y facturas electrónicas autorizadas.], [Servicios externos],
    [ESP-0040], [Control de acceso], [ILA-0026], [Autenticación de usuarios y comprobación de permisos por rol.], [API y control de acceso],
    [ESP-0041], [Auditoría clínica], [ILA-0027], [Registro inalterable de auditoría sobre operaciones clínicas.], [Plataforma de datos],
    [ESP-0043], [Respaldo de base de datos], [ILA-0027], [Generación periódica de copias de seguridad de la base de datos.], [Plataforma de datos],
  )
]

Asimismo, los requisitos no funcionales (`RNF`) activos del proyecto establecen las restricciones y criterios de calidad que condicionan el diseño lógico:

#align(center)[
  #set text(size: 9.5pt)
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
]

== Construcción de la Vista Lógica

A partir de los requisitos establecidos, se identificaron las clases de dominio y se organizaron en dos niveles de detalle:
- Nivel 1: Diagrama de paquetes lógicos que delimita los módulos del sistema y sus dependencias.
- Nivel 2: Diagrama de clases que detalla los atributos, métodos y relaciones de cada módulo.

=== Diagrama de la Vista Lógica: Nivel 1

El diagrama de Nivel 1 representa los paquetes lógicos del sistema y sus dependencias, organizados en las capas de presentación, módulos de negocio, servicios de soporte y servicios externos:

#pad(left: -3.6cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-1-1.1.0.png", width: 15cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-001_ (versión 1.1.0): Diagrama de paquetes lógicos — Nivel 1 de la Vista Lógica del sistema OmVital Physio Control.],
  )
]

#v(0.6em)

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#ffe599"))[*Elemento / Campo*],
        table.cell(fill: rgb("#ffe599"))[*Ficha Técnica: Diagrama Vista Lógica Nivel 1*],
      ),
      [*Código del diagrama:*], [D-LOG-001],
      [*Requisitos no funcionales:*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia)],
      [*Contexto / Módulo:*], [Vista Lógica del sistema clínico OmVital — Nivel 1 (paquetes lógicos)],
      [*Proceso representado:*], [Organización de los paquetes lógicos del sistema (presentación, módulos de negocio, servicios de soporte y servicios externos) y sus dependencias.],
      [*Versión:*], [1.1.0],
      [*Autor:*], [AUT-0009],
      [*Fecha:*], [25/09/2026],
      [*Justificación:*], [Delimita los paquetes del sistema y sus dependencias, estableciendo la frontera entre la interfaz de usuario, los módulos de negocio y los servicios externos, en correspondencia con los módulos de la arquitectura genérica.],
      [*Estado:*], [Concluido],
      [*Código de artefactos:*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
      [*Comentarios:*], [Ninguno],
    )
  ]
]

#pagebreak(weak: true)

=== Diagrama de la Vista Lógica: Nivel 2

El diagrama de Nivel 2 detalla el modelo de clases del sistema: clases, atributos, métodos, relaciones y enumeraciones de estado por módulo, vinculando los requisitos no funcionales con las clases que los implementan:

#pad(left: -3.6cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-2-2.0.0.png", width: 15cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-002_ (versión 2.0.0): Diagrama de clases — Nivel 2 de la Vista Lógica del sistema OmVital Physio Control.],
  )
]

#v(0.6em)

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#ffe599"))[*Elemento / Campo*],
        table.cell(fill: rgb("#ffe599"))[*Ficha Técnica: Diagrama Vista Lógica Nivel 2*],
      ),
      [*Código del diagrama:*], [D-LOG-002],
      [*Requisitos no funcionales:*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia)],
      [*Contexto / Módulo:*], [Vista Lógica del sistema clínico OmVital — Nivel 2 (modelo de clases)],
      [*Proceso representado:*], [Modelo de clases del sistema con atributos, métodos, relaciones (asociación, agregación, composición, herencia y dependencia) y enumeraciones de estado por módulo.],
      [*Versión:*], [2.0.0],
      [*Autor:*], [AUT-0005],
      [*Fecha:*], [25/09/2026],
      [*Justificación:*], [Detalla la estructura interna de las clases y sus colaboraciones, sirviendo de base para el diseño detallado y la implementación, y garantizando la trazabilidad con las especificaciones del proyecto.],
      [*Estado:*], [Concluido],
      [*Código de artefactos:*], [ESP-0001 a ESP-0043],
      [*Comentarios:*], [Ninguno],
    )
  ]
]

#pagebreak(weak: true)
