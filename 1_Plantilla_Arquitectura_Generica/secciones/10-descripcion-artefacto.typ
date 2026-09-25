#import "../cuadros/mod.typ": *

= Descripción del artefacto

El presente artefacto corresponde a la *Arquitectura Genérica* del sistema clínico *OmVital Physio Control*, identificado formalmente con los códigos _D-ARQ-001_ (Nivel 1) y _D-DP-001_ (Nivel 2). El modelado ha sido construido conforme a los principios de abstracción arquitectónica y trazabilidad de requisitos establecidos por el curso, representando de manera general los componentes principales de la solución y las relaciones existentes entre ellos.

El propósito central de este artefacto es formalizar la estructura conceptual del sistema: la delimitación de las fronteras de la plataforma frente a los usuarios internos y los servicios externos, la organización de las responsabilidades funcionales en módulos arquitectónicos (Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos) y la representación del acceso centralizado de las tres sucursales a la información de los pacientes mediante la infraestructura en la nube.

Para garantizar máxima rigurosidad metodológica, la presente sección expone en primer lugar la fundamentación analítica basada en las matrices de *Educción*, *Ilación* y *Especificación técnica*, culminando con la presentación visual de los *Diagramas de Arquitectura Genérica en Nivel 1 (Vista general de fronteras)* y *Nivel 2 (Acceso multi-sucursal y despliegue)*.

== Insumos para la construcción de la arquitectura

El diseño arquitectónico se fundamenta en la trazabilidad de los requisitos del proyecto, los cuales transforman las necesidades de la clínica en especificaciones técnicas verificables a través de tres etapas continuas: Educción, Ilación y Especificación.

=== Educción

A partir de las entrevistas con el personal clínico y administrativo, las necesidades operativas de la clínica se consolidaron en diez educciones activas:

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

A continuación, se presentan las fichas técnicas de educción que sustentan formalmente los componentes y módulos de la arquitectura:

#v(0.6em)

#strong[EDU-0001]: Gestión del paciente

#plantilla_educcion(
  codigo: "EDU-0001",
  nombre: "Gestión del paciente",
  version: "1.0.3",
  fecha: "01/06/2026",
  autor-plantilla: "AUT-0006, AUT-0001, AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001, FUE-0004",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0001, ILA-0002",
  descripcion: [
    El sistema debe permitir la gestión integral de los datos maestros del paciente mediante un modelo completo de registro, consulta, actualización y baja lógica. Inicialmente, la recepcionista podrá registrar la ficha de ingreso y el consentimiento informado, así como consultar el historial para generar y emitir constancias de atención con respaldo legal. \
    \
    Asimismo, se habilitará la actualización continua de la información personal o clínica ante cualquier cambio. Finalmente, por normativas de salud, el sistema no realizará el borrado físico de los registros. Ante el cese de atención o deceso del paciente, su estado cambiará a inactivo o "Archivo Histórico", lo que bloqueará la asignación de nuevas citas, pero mantendrá intacta la trazabilidad legal de toda su información y documentos emitidos.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Se manifestó que la atención al cliente es una prioridad de la organización, se prioriza la atención que la rapidez. \
    La FUE-0004 nos indica un gran detalle a tener en cuenta, la implementación de validaciones estrictas en los procesos de registro y actualización (como la prohibición de campos vacíos o el control de caracteres especiales) garantiza la integridad de la información de los pacientes.
  ],
)

#v(0.6em)

#strong[EDU-0029]: Control de asistencia de pacientes

#plantilla_educcion(
  codigo: "EDU-0029",
  nombre: "Control de asistencia de pacientes",
  version: "1.0.0",
  fecha: "10/05/2026",
  autor-plantilla: "AUT-0003",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0020",
  descripcion: [
    El sistema debe permitir a la recepcionista gestionar el flujo de llegada de los pacientes (Check-in) mediante un modelo de validación y actualización. Al momento del ingreso, el sistema permitirá consultar (Leer) el estado del paciente consumiendo la API financiera para verificar si cuenta con "sesiones a favor" o pagos pendientes. \
    \
    Si el estado es validado, la recepcionista podrá registrar (Crear) la asistencia del día, lo cual actualizará (Modificar) automáticamente el contador de sesiones restantes del paquete del paciente. En caso de inasistencia o llegadas tarde recurrentes, el sistema permitirá registrar una penalidad de tiempo en la sesión. Para evitar inconsistencias, no se podrán eliminar asistencias pasadas; solo se permitirá anular (Eliminación lógica) un check-in ingresado por error durante el mismo día, devolviendo la sesión al saldo del paciente.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Requerimiento fundamental de interoperabilidad. Esta educción se comunica directamente con el módulo del equipo de Infraestructura, garantizando que el paciente no sea atendido si no tiene sesiones validadas, pero manteniendo la interfaz en el lado de recepción (InnovaByte).
  ],
)

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

A continuación, se presentan las fichas técnicas de ilación que sustentan la trazabilidad entre la arquitectura, las educciones y las especificaciones técnicas:

#v(0.6em)

#strong[ILA-0001]: Registro inicial de nuevo paciente

#plantilla_ilacion(
  codigo: "ILA-0001",
  nombre: "Registro inicial de nuevo paciente",
  version: "1.0.2",
  fecha: "13/06/2026",
  autor-plantilla: "AUT-0003, AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001, FUE-0004",
  experto: "Ninguno",
  codigo-educcion: "EDU-0001",
  codigo-especificacion: "ESP-0001, ESP-0002",
  precondicion: [
    El usuario ha iniciado sesión correctamente. \
    El usuario cuenta con rol y permisos activos de Recepcionista. \
    El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES” \
    El usuario se encuentra en la interfaz de Gestión de Pacientes. \
    El usuario posee permisos para registrar nuevos pacientes. \
    El paciente no debe de existir previamente en la base de datos del sistema (validación por DNI/Documento de identidad) en la tabla “TABLE_PACIENTE”.
  ],
  procedimiento: [
    El usuario ingresa al módulo de Gestión de Pacientes (INT-02) y hace clic en el botón Nuevo Registro (INT-02-BNT-03). \
    El sistema redirige al módulo de Registro de Nuevo Paciente (INT-01). \
    El usuario ingresa el DNI del paciente en el campo DNI (INT-01-INP-01). Este campo es obligatorio. \
    El usuario ingresa el nombre del paciente en el campo Nombres (INT-01-INP-02). Este campo es obligatorio. \
    El usuario ingresa los apellidos del paciente en el campo Apellidos (INT-01-INP-03). Este campo es obligatorio. \
    El usuario ingresa el teléfono del paciente en el campo Teléfono (INT-01-INP-04) \
    El usuario ingresa la fecha de nacimiento del paciente en el campo Fecha de nacimiento (INT-01-INP-05) \
    El usuario ingresa la dirección del paciente en el campo Dirección (INT-01-INP-06) \
    El usuario registra la aceptación del Consentimiento Informado en el checkbox Consentimiento Informado (INT-01-CHK-01). \
    El usuario hace clic en el botón Guardar (INT-01-BTN-01). \
    El sistema ejecuta validaciones estrictas. Verifica que no haya campos obligatorios vacíos (DNI, Nombres, Apellidos), no haya DNI duplicado, se haya aceptado el Consentimiento Firmado y se controla el uso de caracteres especiales. \
    Si la validación es correcta, el sistema almacena la información y confirma el registro exitoso, redirigiendo al módulo de Gestión de Pacientes (INT-02). \
    Si la validación es incorrecta, resalta los campos a corregir.
  ],
  postcondicion: [
    El nuevo paciente queda registrado en el sistema en la tabla “TABLE_PACIENTE”. \
    El paciente se registra con un estado inicial Activo \
    El paciente queda habilitado para la asignación de citas clínicas.
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-01, INT-01-INP-01, INT-01-INP-02, INT-01-INP-03, INT-01-INP-04, INT-01-INP-05, INT-01-INP-06, INT-01-CHK-01, BTN-01, BTN-02",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Permite al recepcionista registrar nuevos pacientes dentro del sistema para su futura asignación de citas clínicas y gestión general, favoreciendo el la obtención de la información personal del paciente y como respaldo legal al aceptar el acta del consentimiento informado.
  ],
)

#v(0.6em)

#strong[ILA-0002]: Consulta del perfil del paciente

#plantilla_ilacion(
  codigo: "ILA-0002",
  nombre: "Consulta del perfil del paciente",
  version: "1.0.2",
  fecha: "13/06/2026",
  autor-plantilla: "AUT-0003, AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-educcion: "EDU-0001",
  codigo-especificacion: "ESP-0003, ESP-0004, ESP-0005",
  precondicion: [
    El usuario ha iniciado sesión correctamente. \
    El usuario cuenta con rol y permisos activos de Recepcionista. \
    El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES” \
    El usuario se encuentra en la interfaz de Gestión de Pacientes. \
    El usuario posee permisos para visualizar los pacientes del sistema. \
    El paciente debe de estar registrado en el sistema (tanto si tiene estado Activo o Inactivo/Archivo Histórico) en la tabla “TABLE_PACIENTE”.
  ],
  procedimiento: [
    El usuario ingresa al módulo de "Gestión de Pacientes". \
    El usuario visualiza los registros de los pacientes del sistema en la tabla Grilla de Pacientes (INT-02-TBL-01). \
    El usuario se ubica en el campo Barra de Busqueda (INT-02-INP-01) e ingresa el parámetro de búsqueda (DNI, nombres o apellidos del paciente). \
    El sistema filtra en tiempo real y muestra los registros coincidentes de la búsqueda previa. \
    El usuario selecciona al paciente deseado. \
    El usuario hace clic en botón Ver Ficha (INT-02-BTN-02), siendo redirigido al módulo de Ficha del Paciente (INT-02-A). \
    El usuario hace clic en el botón Constancia (INT-02-BTN-01) para generar la constancia de atención del paciente. \
    El sistema emite el documento con respaldo legal listo para imprimirse o enviar. \
    El usuario hace clic en el botón Nuevo Registro (INT-02-BTN-03), siendo redirigido al módulo de Registro de Nuevo Paciente (INT-01). \
    El usuario puede visualizar toda la información personal del paciente (DNI, Nombres, Apellidos, Teléfono, Fecha de nacimiento, Dirección, Aceptó Consentimiento Firmado, Estado actual). \
    El usuario hace clic en el botón Editar Datos (INT-02-A-BTN-01), siendo redirigido al módulo Modificar Datos del Paciente (INT-03). \
    El usuario hace clic en el botón Archivar/Inactivar Paciente (INT-02-A-BTN-02), siendo redirigido al módulo Gestionar Estado del Paciente (INT-04).
  ],
  postcondicion: [
    El usuario visualiza la información y/o emite los documentos requeridos \
    No se modifica ni altera ningún registro de la base de datos.
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-02, INT-02-INP-01, INT-02-TBL-01, INT-02-BTN-01, INT-02-BTN-02, INT-02-BTN-03, INT-02-A, INT-02-A-BTN-01, INT-02-A-BTN-02",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    El flujo prioriza la rapidez en la atención al cliente, permitiendo encontrar al paciente en pocos clics. Además, garantiza la lectura de datos incluso si el paciente está inactivo por cese o deceso (trazabilidad legal).
  ],
)

#v(0.6em)

#strong[ILA-0020]: Registrar asistencia

#plantilla_ilacion(
  codigo: "ILA-0020",
  nombre: "Registrar asistencia",
  version: "1.0.0",
  fecha: "17/06/2026",
  autor-plantilla: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-educcion: "EDU-0029",
  codigo-especificacion: "ESP-0030, ESP-0031",
  precondicion: [
    El usuario ha iniciado sesión correctamente. \
    El usuario cuenta con rol y permisos activos de Recepcionista. \
    El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES” \
    El usuario se encuentra en la interfaz de Citas. \
    El usuario posee permisos para registrar asistencias en “TABLE_CITAS”
  ],
  procedimiento: [
    El ACT-0003 presiona el botón INT-06-BTN-06. \
    Luego presiona el botón INT-06-BTN-07. \
    Luego se abrirá el INT-20-MOD-001. \
    Para registrar la asistencia se verifica que se haya realizado el pago en INT-20-TXT-006. \
    Si el estado es Pagado, puede presionar el botón INT-20-BTN-002. \
    Si necesita subir alguna firma para la asistencia puede subir un archivo pdf en INT-20-FUP-001. \
    Para registrar la asistencia presiona el botón INT-20-BTN-002. \
    Si el estado está en No Pagado, el ACT-0003 presiona el botón INT-20-BTN-001. \
    Se cierra el INT-20-MOD-001 presionando cualquiera de los dos botones.
  ],
  postcondicion: [
    En caso de haberse presionado el INT-20-BTN-002, la asistencia quedará registrada en el sistema con firma o sin firma. \
    La cita cambiará de estado a en curso.
  ],
  codigo-artefactos-asociados: "SDB-02, INT-06-BTN-06, INT-06-BTN-07, INT-20-MOD-001, INT-20-TBL-001, INT-20-TXT-001, INT-20-TXT-002, INT-20-TXT-003, INT-20-TXT-004, INT-20-TXT-005, INT-20-TXT-006, INT-20-BTN-001, INT-20-BTN-002, INT-20-FUP-001",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Ninguno",
)

=== Especificación

La etapa de especificación formaliza las condiciones operativas y técnicas del software mediante especificaciones técnicas (`ESP`), las cuales se derivan de las ilaciones y definen las responsabilidades funcionales que implementa cada módulo de la arquitectura:

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

Asimismo, los requisitos no funcionales (`RNF`) activos del proyecto establecen las restricciones y criterios de calidad arquitectónicos:

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

A continuación, se presentan las fichas técnicas de especificación más representativas que implementan las responsabilidades funcionales de los módulos de la arquitectura y sus atributos de calidad vinculados:

#v(0.6em)

#strong[ESP-0001]: Registro inicial de nuevo paciente

#plantilla_especificacion(
  codigo: "ESP-0001",
  nombre: "Registro inicial de nuevo paciente",
  version: "1.0.0",
  fecha: "09/07/26",
  autor-plantilla: "AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001, FUE-0004",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0001",
  precondicion: [
    Boolean sesionValida \
    Boolean permisosValidos \
    Boolean conexionBD \
    Usuario usuarioActual \
    String BD_en_uso \
    \
    BD_en_uso = "Omvital_Db_Pacientes" \
    sesionValida = validarSesion() \
    Si sesionValida = false Entonces \
    #h(1.2em) MostrarMensaje("La sesión ha expirado.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuarioActual = obtenerUsuarioSesion() \
    permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA") \
    Si permisosValidos = false Entonces \
    #h(1.2em) MostrarMensaje("No posee permisos para registrar pacientes.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    conexionBD = verificarConexionBD(BD_en_uso) \
    Si conexionBD = false Entonces \
    #h(1.2em) MostrarMensaje("No existe conexión con la base de datos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuario.click( \
    #h(1.2em) btnPacientes(BTN-09) \
    ) \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    String[8] str8_Dni \
    String[50] str_Nombres \
    String[50] str_Apellidos \
    String[9] str9_Telefono \
    Date date_FechaNacimiento \
    String[100] str_Direccion \
    Boolean bool_Consentimiento \
    Boolean bool_DniDuplicado \
    Paciente obj_PacienteNuevo \
    \
    Si usuario.click(btnNuevoRegistro(INT-02-BNT-03)) Entonces \
    #h(1.2em) RedirigirVista(INT-01) \
    FinSi \
    \
    Si usuario.putIn(Input(INT-01-INP-01)) Entonces \
    #h(1.2em) str8_Dni = obtenerValorTexto(INT-01-INP-01) \
    FinSi \
    Si usuario.putIn(Input(INT-01-INP-02)) Entonces \
    #h(1.2em) str_Nombres = obtenerValorTexto(INT-01-INP-02) \
    FinSi \
    Si usuario.putIn(Input(INT-01-INP-03)) Entonces \
    #h(1.2em) str_Apellidos = obtenerValorTexto(INT-01-INP-03) \
    FinSi \
    Si usuario.putIn(Input(INT-01-INP-04)) Entonces \
    #h(1.2em) str9_Telefono = obtenerValorTexto(INT-01-INP-04) \
    FinSi \
    Si usuario.putIn(Input(INT-01-INP-05)) Entonces \
    #h(1.2em) date_FechaNacimiento = obtenerValorFecha(INT-01-INP-05) \
    FinSi \
    Si usuario.putIn(Input(INT-01-INP-06)) Entonces \
    #h(1.2em) str_Direccion = obtenerValorTexto(INT-01-INP-06) \
    FinSi \
    Si usuario.click(Checkbox(INT-01-CHK-01)) Entonces \
    #h(1.2em) bool_Consentimiento = obtenerEstadoCheckbox(INT-01-CHK-01) \
    FinSi \
    \
    Si usuario.click(btnGuardar(INT-01-BTN-01)) Entonces \
    #h(1.2em) Si str8_Dni = null o str8_Dni = "" Entonces \
    #h(2.4em) MostrarMensaje("El campo DNI es obligatorio.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-01) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si longitud(str8_Dni) <> 8 o validarSoloDigitos(str8_Dni) = false Entonces \
    #h(2.4em) MostrarMensaje("El DNI debe contener exactamente 8 dígitos numéricos.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-01) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) bool_DniDuplicado = existeRegistro("TABLE_PACIENTE", str8_Dni) \
    #h(1.2em) Si bool_DniDuplicado = true Entonces \
    #h(2.4em) MostrarMensaje("El DNI ya pertenece a un paciente registrado.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-01) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si str_Nombres = "" o str_Nombres = null Entonces \
    #h(2.4em) MostrarMensaje("Los Nombres son obligatorios.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-02) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si validarCaracteresEspeciales(str_Nombres) = true Entonces \
    #h(2.4em) MostrarMensaje("Los Nombres no permiten caracteres especiales.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-02) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si str_Apellidos = "" o str_Apellidos = null Entonces \
    #h(2.4em) MostrarMensaje("Los Apellidos son obligatorios.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-03) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si validarCaracteresEspeciales(str_Apellidos) = true Entonces \
    #h(2.4em) MostrarMensaje("Los Apellidos no permiten caracteres especiales.") \
    #h(2.4em) ResaltarCampo(INT-01-INP-03) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    #h(1.2em) Si str9_Telefono <> "" y str9_Telefono <> null Entonces \
    #h(2.4em) Si longitud(str9_Telefono) <> 9 o validarSoloDigitos(str9_Telefono) = false Entonces \
    #h(3.6em) MostrarMensaje("El Teléfono debe contener exactamente 9 dígitos numéricos.") \
    #h(3.6em) ResaltarCampo(INT-01-INP-04) \
    #h(3.6em) Finalizar procedimiento \
    #h(2.4em) FinSi \
    #h(1.2em) FinSi \
    #h(1.2em) Si bool_Consentimiento = false Entonces \
    #h(2.4em) MostrarMensaje("Debe aceptar el Consentimiento Informado.") \
    #h(2.4em) ResaltarCampo(INT-01-CHK-01) \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    \
    #h(1.2em) obj_PacienteNuevo = new Paciente() \
    #h(1.2em) obj_PacienteNuevo.setDni(str8_Dni) \
    #h(1.2em) obj_PacienteNuevo.setNombres(str_Nombres) \
    #h(1.2em) obj_PacienteNuevo.setApellidos(str_Apellidos) \
    #h(1.2em) Si str9_Telefono <> "" Entonces \
    #h(2.4em) obj_PacienteNuevo.setTelefono(str9_Telefono) \
    #h(1.2em) FinSi \
    #h(1.2em) Si date_FechaNacimiento <> null Entonces \
    #h(2.4em) obj_PacienteNuevo.setFechaNacimiento(date_FechaNacimiento) \
    #h(1.2em) FinSi \
    #h(1.2em) Si str_Direccion <> "" Entonces \
    #h(2.4em) obj_PacienteNuevo.setDireccion(str_Direccion) \
    #h(1.2em) FinSi \
    #h(1.2em) obj_PacienteNuevo.setConsentimiento(bool_Consentimiento) \
    #h(1.2em) obj_PacienteNuevo.setEstado("ACTIVO") \
    \
    #h(1.2em) uInt32_NuevoId = registrarPaciente(obj_PacienteNuevo) \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    Boolean bool_PacienteRegistrado \
    String[20] str_EstadoVerificado \
    \
    bool_PacienteRegistrado = existeRegistroId("TABLE_PACIENTE", uInt32_NuevoId) \
    Si bool_PacienteRegistrado = true Entonces \
    #h(1.2em) str_EstadoVerificado = obtenerEstadoPaciente(str8_Dni) \
    #h(1.2em) Verificar str_EstadoVerificado = "ACTIVO" \
    #h(1.2em) MostrarMensaje("El registro fue exitoso.") \
    #h(1.2em) RedirigirVista(INT-02) \
    FinSi \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-01, INT-01-INP-01, INT-01-INP-02, INT-01-INP-03, INT-01-INP-04, INT-01-INP-05, INT-01-INP-06, INT-01-CHK-01, INT-01-BTN-01",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Ninguno",
)

#v(0.6em)

#strong[ESP-0003]: Búsqueda y filtrado de pacientes en grilla

#plantilla_especificacion(
  codigo: "ESP-0003",
  nombre: "Búsqueda y filtrado de pacientes en grilla",
  version: "1.0.0",
  fecha: "09/07/26",
  autor-plantilla: "AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0002",
  precondicion: [
    Boolean sesionValida \
    Boolean permisosValidos \
    Boolean conexionBD \
    Usuario usuarioActual \
    String BD_en_uso \
    \
    BD_en_uso = "Omvital_Db_Pacientes" \
    sesionValida = validarSesion() \
    Si sesionValida = false Entonces \
    #h(1.2em) MostrarMensaje("La sesión ha expirado.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuarioActual = obtenerUsuarioSesion() \
    permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA") \
    Si permisosValidos = false Entonces \
    #h(1.2em) MostrarMensaje("No posee permisos para consultar pacientes.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    conexionBD = verificarConexionBD(BD_en_uso) \
    Si conexionBD = false Entonces \
    #h(1.2em) MostrarMensaje("No existe conexión con la base de datos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuario.click( \
    #h(1.2em) btnPacientes(BTN-09) \
    ) \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    String[50] str50_ParametroBusqueda \
    Unsigned int8 uInt8_LongitudBusqueda \
    Unsigned int8 uInt8_LimiteResultados \
    Unsigned int8 uInt8_IndiceFor \
    ListaPacientes obj_ListaPacientes \
    \
    uInt8_LimiteResultados = 50 \
    \
    Si usuario.putIn(Input(INT-02-INP-01)) Entonces \
    #h(1.2em) str50_ParametroBusqueda = obtenerValorTexto(INT-02-INP-01) \
    #h(1.2em) uInt8_LongitudBusqueda = contarCaracteres(str50_ParametroBusqueda) \
    \
    #h(1.2em) Si uInt8_LongitudBusqueda < 3 y uInt8_LongitudBusqueda > 0 Entonces \
    #h(2.4em) DetenerEjecucion() // Evita saturar la BD por cada letra, espera a 3 chars \
    #h(1.2em) FinSi \
    \
    #h(1.2em) Si uInt8_LongitudBusqueda >= 3 Entonces \
    #h(2.4em) obj_ListaPacientes = buscarRegistros("TABLE_PACIENTE", str50_ParametroBusqueda, uInt8_LimiteResultados) \
    #h(1.2em) Sino \
    #h(2.4em) obj_ListaPacientes = cargarPacientesRecientes("TABLE_PACIENTE", uInt8_LimiteResultados) \
    #h(1.2em) FinSi \
    \
    #h(1.2em) limpiarGrilla(INT-02-TBL-01) \
    \
    #h(1.2em) Si obj_ListaPacientes.estaVacia() = true Entonces \
    #h(2.4em) MostrarMensajeInteractivo("No se encontraron pacientes coincidentes.") \
    #h(1.2em) Sino \
    #h(2.4em) Para uInt8_IndiceFor = 0 Hasta (obj_ListaPacientes.longitud() - 1) con paso 1 Hacer \
    #h(3.6em) agregarFilaGrilla(INT-02-TBL-01, obj_ListaPacientes.obtener(uInt8_IndiceFor).getIdInterno()) \
    #h(2.4em) FinPara \
    #h(1.2em) FinSi \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    Unsigned int8 uInt8_FilasMostradas \
    Boolean bool_DatosModificados \
    \
    uInt8_FilasMostradas = contarFilas(INT-02-TBL-01) \
    Verificar uInt8_FilasMostradas <= 50 \
    \
    bool_DatosModificados = verificarCambiosPendientesEnBD("TABLE_PACIENTE") \
    Verificar bool_DatosModificados = false \
    \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-02, INT-02-INP-01, INT-02-TBL-01",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Ninguno",
)

#v(0.6em)

#strong[ESP-0005]: Generar constancia de atención del paciente

#plantilla_especificacion(
  codigo: "ESP-0005",
  nombre: "Generar constancia de atención del paciente",
  version: "1.0.0",
  fecha: "09/07/26",
  autor-plantilla: "AUT-0007",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0002",
  precondicion: [
    Boolean sesionValida \
    Boolean permisosValidos \
    Boolean conexionBD \
    Usuario usuarioActual \
    String BD_en_uso \
    \
    BD_en_uso = "Omvital_Db_Pacientes" \
    sesionValida = validarSesion() \
    Si sesionValida = false Entonces \
    #h(1.2em) MostrarMensaje("La sesión ha expirado.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuarioActual = obtenerUsuarioSesion() \
    permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA") \
    Si permisosValidos = false Entonces \
    #h(1.2em) MostrarMensaje("No posee permisos para generar documentos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    conexionBD = verificarConexionBD(BD_en_uso) \
    Si conexionBD = false Entonces \
    #h(1.2em) MostrarMensaje("No existe conexión con la base de datos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuario.click( \
    #h(1.2em) btnVerFicha(INT-02-BTN-02) \
    ) \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    Unsigned int32 uInt32_IdPacienteActivo \
    Boolean bool_AtencionesValidas \
    ArchivoPDF obj_ConstanciaEnMemoria \
    \
    uInt32_IdPacienteActivo = obtenerIdContextoVista(INT-02-A) \
    Si uInt32_IdPacienteActivo = 0 o uInt32_IdPacienteActivo = null Entonces \
    #h(1.2em) MostrarMensaje("No se pudo identificar al paciente en la vista actual.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    Si usuario.click(btnConstancia(INT-02-BTN-01)) Entonces \
    #h(1.2em) bool_AtencionesValidas = verificarAtencionesPrevias("TABLE_CITAS", uInt32_IdPacienteActivo) \
    #h(1.2em) Si bool_AtencionesValidas = false Entonces \
    #h(2.4em) MostrarMensaje("El paciente no registra atenciones previas.") \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    \
    #h(1.2em) obj_ConstanciaEnMemoria = compilarConstanciaPDF(uInt32_IdPacienteActivo) \
    #h(1.2em) Si obj_ConstanciaEnMemoria = null Entonces \
    #h(2.4em) MostrarMensaje("Ocurrió un error al procesar el archivo PDF.") \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    \
    #h(1.2em) renderizarDocumentoEnPantalla(obj_ConstanciaEnMemoria) \
    #h(1.2em) liberarBufferMemoria(obj_ConstanciaEnMemoria) \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    String[15] str15_VistaActual \
    Boolean bool_DatosModificados \
    \
    str15_VistaActual = obtenerVistaActiva() \
    Verificar str15_VistaActual = "INT-02-A" \
    \
    bool_DatosModificados = verificarCambiosPendientesEnBD("TABLE_PACIENTE") \
    Verificar bool_DatosModificados = false \
    \
    MostrarMensaje("Documento generado con éxito.") \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-02-A, INT-02-BTN-01",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Ninguno",
)

#v(0.6em)

#strong[ESP-0030]: Registro de asistencia

#plantilla_especificacion(
  codigo: "ESP-0030",
  nombre: "Registro de asistencia",
  version: "1.0.0",
  fecha: "06/07/26",
  autor-plantilla: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0020",
  precondicion: [
    Boolean sesionValida \
    Boolean permisosValidos \
    Boolean conexionBD \
    Usuario usuarioActual \
    Long idCita \
    String BD_en_uso \
    \
    BD_en_uso = "Omvital_Db_Pacientes" \
    \
    sesionValida = validarSesion() \
    \
    Si sesionValida = false Entonces \
    #h(1.2em) MostrarMensaje("La sesión ha expirado.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    usuarioActual = obtenerUsuarioSesion() \
    \
    permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA") \
    \
    Si permisosValidos = false Entonces \
    #h(1.2em) MostrarMensaje("No posee permisos para registrar asistencias.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    conexionBD = verificarConexionBD(BD_en_uso) \
    \
    Si conexionBD = false Entonces \
    #h(1.2em) MostrarMensaje("No existe conexión con la base de datos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    usuario.click( \
    #h(1.2em) btnCitas(BTN-08) \
    ) \
    \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    \
    Long idCita \
    Cita cita \
    Asistencia asistencia \
    ArchivoPDF firmaPDF \
    EstadoPago estadoPago \
    EstadoCita estadoCita \
    Boolean asistenciaRegistrada \
    RutaArchivo rutaFirma \
    \
    idCita = obtenerCitaSeleccionada() \
    \
    cita = obtenerCita(idCita) \
    \
    Si cita = null Entonces \
    #h(1.2em) MostrarMensaje("La cita no existe.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    estadoPago = obtenerEstadoPago(idCita) \
    \
    Si estadoPago <> PAGADO Entonces \
    #h(1.2em) MostrarMensaje("No es posible registrar la asistencia porque la cita aún no ha sido pagada.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    asistenciaRegistrada = existeAsistencia(idCita) \
    \
    Si asistenciaRegistrada = true Entonces \
    #h(1.2em) MostrarMensaje("La asistencia ya fue registrada.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    Si usuario.putIn(FileUpload(INT-20-FUP-0001)) Entonces \
    #h(1.2em) firmaPDF = obtenerArchivoSubido() \
    \
    #h(1.2em) Si firmaPDF <> null Entonces \
    #h(2.4em) validarFormatoArchivo(firmaPDF) \
    #h(2.4em) validarTamanoArchivo(firmaPDF) \
    #h(2.4em) rutaFirma = guardarArchivo(firmaPDF) \
    #h(1.2em) Sino \
    #h(2.4em) rutaFirma = null \
    #h(1.2em) FinSi \
    Sino \
    #h(1.2em) rutaFirma = null \
    FinSi \
    \
    Si usuario.click(btnRegistrarAsistencia(INT-20-BTN-002)) Entonces \
    #h(1.2em) asistencia = new Asistencia() \
    #h(1.2em) asistencia.setIdCita(idCita) \
    #h(1.2em) asistencia.setUsuarioRegistro(usuarioActual) \
    #h(1.2em) asistencia.setFechaRegistro(obtenerFechaActual()) \
    #h(1.2em) asistencia.setHoraRegistro(obtenerHoraActual()) \
    #h(1.2em) asistencia.setRutaFirma(rutaFirma) \
    \
    #h(1.2em) registrarAsistencia(asistencia) \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    \
    Boolean asistenciaRegistrada \
    EstadoCita estadoCita \
    ArchivoPDF firmaPDF \
    \
    asistenciaRegistrada = existeAsistencia(idCita) \
    \
    Si asistenciaRegistrada = true Entonces \
    #h(1.2em) estadoCita = obtenerEstadoCita(idCita) \
    #h(1.2em) Verificar estadoCita = EN_CURSO \
    \
    #h(1.2em) Si rutaFirma <> null Entonces \
    #h(2.4em) firmaPDF = obtenerFirmaAsistencia(idCita) \
    #h(2.4em) Verificar firmaPDF <> null \
    #h(1.2em) FinSi \
    \
    #h(1.2em) MostrarMensaje("La asistencia fue registrada correctamente.") \
    FinSi \
    \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "BTN-08, INT-20-FUP-0001, INT-20-BTN-002",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Se planea usar para las firmas: Firma Perú",
)

== Construcción de la Arquitectura Genérica

A partir de los requisitos establecidos, se definieron las responsabilidades del sistema y se agruparon en dos niveles de detalle:
- *Nivel 1*: Vista general que delimita las fronteras de la plataforma frente a los usuarios internos y los servicios externos.
- *Nivel 2*: Descomposición interna que representa el acceso centralizado de las tres sucursales a la información de los pacientes mediante la infraestructura en la nube.

=== Diagrama de la Arquitectura Genérica: Nivel 1

El diagrama de Nivel 1 expresa la organización general del sistema clínico, identificando los subsistemas de Pacientes y Administración y su acceso a una base de datos compartida, asociando los requisitos no funcionales (RNF) con sus respectivos atributos de calidad:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1.png", width: 9cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-ARQ-001_: Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 1. Vista general de fronteras del sistema frente a los usuarios internos y servicios externos.],
)

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
        table.cell(fill: rgb("#ffe599"))[*Ficha Técnica: Diagrama Arquitectura Genérica Nivel 1*],
      ),
      [*Código del diagrama:*], [D-ARQ-001],
      [*Requisitos no funcionales:*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo:*], [Arquitectura Genérica del sistema clínico OmVital — Nivel 1],
      [*Proceso representado:*], [Interacción y organización general del Sistema Clínico, mostrando los subsistemas de Pacientes y Administración y su acceso a una base de datos compartida.],
      [*Versión:*], [1.0.0],
      [*Autor:*], [AUT-0006],
      [*Fecha:*], [17/09/2026],
      [*Justificación:*], [El diagrama representa la estructura general del Sistema Clínico, identificando sus dos subsistemas principales, Pacientes y Administración, y mostrando que ambos utilizan una base de datos compartida. Permite visualizar la organización general del sistema y sirve como base para los diagramas arquitectónicos posteriores.],
      [*Estado:*], [Concluido],
      [*Código de artefactos:*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
      [*Comentarios:*], [Ninguno],
    )
  ]
]

#pagebreak(weak: true)

=== Diagrama de la Arquitectura Genérica: Nivel 2

El diagrama de Nivel 2 descompone formalmente el despliegue y la topología de la infraestructura: cómo las tres sucursales acceden y actualizan de manera centralizada la información de los pacientes mediante un servidor web y una base de datos en la nube, garantizando la continuidad de la atención entre sedes:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2.png", width: 13.5cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-DP-001_: Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 2. Acceso multi-sucursal, despliegue y persistencia centralizada en la nube.],
)

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
        table.cell(fill: rgb("#ffe599"))[*Ficha Técnica: Diagrama Arquitectura Genérica Nivel 2*],
      ),
      [*Código del diagrama:*], [D-DP-001],
      [*Requisitos no funcionales:*], [RNF-0001 (Disponibilidad en la nube), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo:*], [Arquitectura genérica del sistema: gestión y consulta de documentos del paciente],
      [*Proceso representado:*], [El diagrama representa cómo las tres sucursales acceden y actualizan de manera centralizada la información de los pacientes mediante un servidor web y una base de datos en la nube, permitiendo la continuidad de la atención entre sedes.],
      [*Versión:*], [1.0.1],
      [*Autor:*], [AUT-0004],
      [*Fecha:*], [13/09/2026],
      [*Justificación:*], [El diagrama representa la arquitectura propuesta para permitir el acceso desde múltiples sucursales a la infraestructura en la nube, garantizando seguridad en las transmisiones (HTTPS/VPN), alta velocidad de respuesta mediante servicio de caché y soporte a comunicación en tiempo real con WebSockets.],
      [*Estado:*], [Concluido],
      [*Código de artefactos:*], [RNF-0001, EDU-0027],
      [*Comentarios:*], [Ninguno],
    )
  ]
]

#v(0.6em)

La arquitectura genérica elaborada mantiene un nivel de abstracción adecuado que evita depender de una tecnología, lenguaje de programación o plataforma específica, permitiendo que el modelo pueda utilizarse posteriormente como referencia para evaluar y seleccionar las tecnologías más apropiadas en las etapas de diseño detallado, implementación y despliegue.