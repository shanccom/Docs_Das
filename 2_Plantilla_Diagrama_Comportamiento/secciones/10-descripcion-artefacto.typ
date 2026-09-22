// ============================================================
// Sección 10: Descripción del artefacto
// Artefacto: DIA-CMP-0001 (Diagrama de Comportamiento - Nivel 1 y Nivel 2)
// Estándar: UML 2.5 (OMG)
// Estructura: Educción -> Ilación -> Especificación -> Diagramas N1 y N2
// ============================================================

#import "../diagrama/diagrama-nivel-1.typ": diagrama_nivel_1
#import "../diagrama/diagrama-nivel-2.typ": *
#import "../cuadros/mod.typ": *

= Descripción del artefacto

El presente artefacto corresponde al *Diagrama de Comportamiento* del módulo clínico de gestión y recepción de pacientes, identificado formalmente con el código _DIA-CMP-0001_. El modelado ha sido construido conforme a las especificaciones y buenas prácticas del estándar internacional *UML 2.5* (_Unified Modeling Language_: _Object Management Group_, OMG) para diagramas de actividades y comportamiento del software.

El propósito central de este artefacto es formalizar la secuencia lógica, el flujo de control y las decisiones operativas que gobiernan la recepción del paciente: desde la solicitud inicial de su documento de identidad (DNI), la verificación y búsqueda indexada en la base de datos centralizada, la bifurcación condicional entre la consulta de una ficha clínica existente y el registro estructurado de un nuevo paciente, la convergencia formal mediante un nodo de fusión y, finalmente, el registro de asistencia (_check-in_) en la agenda médica diaria previo a la consulta médica.

Para garantizar máxima rigurosidad metodológica, la presente sección expone en primer lugar la fundamentación analítica basada en las matrices de *Educción*, *Ilación* y *Especificación técnica*, culminando con la presentación visual consecutiva de los *Diagramas de Comportamiento en Nivel 1 (Caja Negra)* y *Nivel 2 (Descomposición en Carriles)*.

#v(0.6em)

== Educción

La estructura del flujo y las restricciones arquitectónicas del artefacto se derivan directamente del repositorio de requisitos del proyecto, articulando las necesidades funcionales del negocio con los requerimientos no funcionales (RNF) y los atributos de calidad del sistema:

- *Identificación expedita del paciente:* La necesidad operativa de ubicar de manera inmediata al paciente al presentarse en la recepción clínica se sustenta en la educción de búsqueda indexada por documento nacional de identidad (DNI).
- *Bifurcación según existencia en base de datos:* El nodo de decisión condicional «¿Paciente existe en BD?» resuelve la dualidad entre recuperar y visualizar el historial clínico de un paciente recurrente o abrir un nuevo expediente clínico cuando el paciente acude por primera vez.
- *Convergencia unificada hacia el check-in:* Ambas ramas del flujo confluyen mediante un nodo de fusión formal hacia la actividad de inicio de asistencia en la agenda médica diaria, garantizando la continuidad del proceso de atención sin duplicidad operativa.

Los atributos de calidad y requerimientos no funcionales (RNF) vinculados formalmente al artefacto son:

- _RNF-0002_ (*Tiempo de respuesta*): El tiempo de consulta y búsqueda indexada por DNI debe ser $t <= 500$ ms, atributo verificable en la actividad «2. Identificar paciente».
- _RNF-0001_ (*Disponibilidad*): Alta disponibilidad y persistencia distribuida de los expedientes clínicos y consentimientos informados en la nube, atributo verificable en la actividad «4. Consultar / cargar ficha del paciente».
- _RNF-01_ (*Persistencia*): Inmutabilidad física de los datos maestros del paciente; se prohíbe la eliminación destructiva (_hard delete_), permitiendo únicamente el borrado lógico o pase a estado de archivo histórico, atributo verificable en la actividad «5. Registrar nuevo paciente».

A continuación, se presentan las matrices de educción que sustentan formalmente las actividades del diagrama:

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

== Ilación

El artefacto ha sido diseñado aplicando con rigor la sintaxis y semántica formal del estándar *UML 2.5* para diagramas de actividades, asegurando máxima legibilidad arquitectónica y consistencia conceptual:

- #text(weight: "bold")[Nodo Inicial (`InitialNode`):] Representado por un círculo negro sólido relleno (#text(size: 11pt)[●]), que marca el punto de activación unívoco del comportamiento del módulo.
- #text(weight: "bold")[Nodos de Acción (`ActionNode`):] Representados mediante rectángulos de esquinas redondeadas con etiquetas expresadas en modo infinitivo, denotando las tareas operativas atómicas del flujo.
- #text(weight: "bold")[Nodo de Decisión (`DecisionNode`):] Representado por un rombo formal con un flujo de entrada y dos flujos de salida disjuntos protegidos por guardas condicionales UML (#strong([\[Sí\]]) y #strong([\[No\]])), que evalúan la existencia previa del paciente en la base de datos.
- #text(weight: "bold")[Nodo de Fusión (`MergeNode`):] Representado por un rombo formal con múltiples flujos de entrada alternativos y una única salida de control hacia la actividad de check-in, unificando los caminos sin requerir sincronización paralela concurrente.
- #text(weight: "bold")[Flujos de Control (`ControlFlow`):] Flechas ortogonales continuas que definen la secuencia temporal y las dependencias de ejecución entre actividades.
- #text(weight: "bold")[Notas UML (`Comment / Note`):] Elementos rectangulares con pliegue superior derecho (_dog-ear_), vinculados mediante líneas discontinuas a las actividades para asociar de forma visible el código del RNF y su respectivo atributo de calidad.
- #text(weight: "bold")[Nodo Final de Actividad (`ActivityFinalNode`):] Representado por una diana concéntrica con núcleo sólido (#text(size: 11pt)[◉]), marcando la culminación formal del ciclo de comportamiento del módulo.

La secuencia formal del flujo se expresa de la siguiente manera: el _Nodo Inicial_ da inicio al ciclo, seguido de la actividad «1. Solicitar identificación» y la actividad «2. Identificar paciente»; este último punto deriva en el nodo de decisión «3. ¿Paciente existe en BD?».
- Rama #strong([\[Sí\]]): Dirige el flujo hacia «4. Consultar / cargar ficha del paciente» y enruta hacia el *Nodo de Fusión*.
- Rama #strong([\[No\]]): Dirige el flujo hacia «5. Registrar nuevo paciente» y enruta hacia el *Nodo de Fusión*.
- Convergencia: A partir del *Nodo de Fusión*, el flujo unificado ejecuta «6. Iniciar check-in en agenda diaria», continúa con «7. Continuar con el proceso de atención» y finaliza en el *Nodo Final de Actividad*.

A continuación, se presentan las matrices de ilación que sustentan la trazabilidad entre el diagrama, las educciones y las especificaciones técnicas:

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

== Especificación

A continuación, se detalla la ficha técnica formal de especificación del artefacto arquitectónico:

#align(center)[
  #block(width: 95%)[
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#ffe599"))[*Elemento / Campo*],
        table.cell(fill: rgb("#ffe599"))[*Especificación del Artefacto*],
      ),
      [*Identificador*], [DIA-CMP-0001],
      [*Tipo de artefacto*], [Diagrama de Comportamiento / Actividades (UML 2.5)],
      [*Título del diagrama*], [Comportamiento del módulo de Pacientes: Nivel 1],
      [*Subtítulo del diagrama*], [Identificación, registro y check-in del paciente],
      [*Dominio funcional*], [Módulo clínico de gestión y recepción de pacientes],
      [*Nivel de abstracción*], [Nivel 1 (Visión funcional general de caja negra)],
      [*Alcance del flujo*], [Identificar paciente, evaluar existencia, registrar nuevo paciente y efectuar check-in en agenda diaria],
      [*Elementos UML*], [1 Nodo Inicial, 6 Nodos de Acción, 1 Nodo de Decisión, 1 Nodo de Fusión (Merge), 1 Nodo Final de Actividad, 3 Notas UML (RNF), 10 Flujos de Control],
      [*Guardas condicionales*], [\[Sí\] (Paciente registrado en BD) / \[No\] (Paciente nuevo)],
      [*Anotaciones de calidad*], [RNF-0002 (Tiempo de respuesta), RNF-0001 (Disponibilidad), RNF-01 (Persistencia)],
      [*Precondición*], [El paciente acude presencialmente a la recepción de la clínica],
      [*Poscondición*], [El paciente queda con asistencia registrada (check-in) y habilitado para su atención médica],
      [*Descomponibilidad*], [Cada nodo de acción compuesto se descompone formalmente en diagramas de Nivel 2],
    )
  ]
]

#v(0.6em)

Las especificaciones técnicas procedimentales que rigen la operación de las actividades del flujo son las siguientes:

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

#strong[ESP-0002]: Cancelar registro inicial de nuevo paciente

#plantilla_especificacion(
  codigo: "ESP-0002",
  nombre: "Cancelar registro inicial de nuevo paciente",
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
    #h(1.2em) btnNuevoRegistro(INT-02-BNT-03) \
    ) \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    Si usuario.click(btnCancelar(BTN-02)) Entonces \
    #h(1.2em) limpiarCamposVista(INT-01) \
    #h(1.2em) descartarCambiosTemporales() \
    #h(1.2em) MostrarMensaje("Se canceló el registro del nuevo paciente.") \
    #h(1.2em) RedirigirVista(INT-02) \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    String[15] str15_VistaActual \
    Boolean bool_CambiosDescartados \
    \
    str15_VistaActual = obtenerVistaActiva() \
    Verificar str15_VistaActual = "INT-02" \
    \
    bool_CambiosDescartados = verificarBufferVacio(INT-01) \
    Verificar bool_CambiosDescartados = true \
    \
    MostrarMensaje("No se realizaron cambios en la base de datos.") \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "BTN-09, INT-02, INT-01, BTN-02",
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

#strong[ESP-0004]: Visualizar ficha del paciente seleccionado

#plantilla_especificacion(
  codigo: "ESP-0004",
  nombre: "Visualizar ficha del paciente seleccionado",
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
    #h(1.2em) MostrarMensaje("No posee permisos para visualizar pacientes.") \
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
    Unsigned int32 uInt32_IdPacienteSeleccionado \
    Paciente obj_PacienteFicha \
    \
    Si usuario.click(btnVerFicha(INT-02-BTN-02)) Entonces \
    #h(1.2em) uInt32_IdPacienteSeleccionado = obtenerIdFilaActiva(INT-02-TBL-01) \
    \
    #h(1.2em) Si uInt32_IdPacienteSeleccionado = 0 o uInt32_IdPacienteSeleccionado = null Entonces \
    #h(2.4em) MostrarMensaje("Debe seleccionar un paciente de la grilla primero.") \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    \
    #h(1.2em) obj_PacienteFicha = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteSeleccionado) \
    \
    #h(1.2em) Si obj_PacienteFicha = null Entonces \
    #h(2.4em) MostrarMensaje("El expediente del paciente seleccionado no se encuentra disponible.") \
    #h(2.4em) Finalizar procedimiento \
    #h(1.2em) FinSi \
    \
    #h(1.2em) poblarDatosVista(INT-02-A, obj_PacienteFicha) \
    #h(1.2em) RedirigirVista(INT-02-A) \
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
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-09, INT-02, INT-02-TBL-01, INT-02-BTN-02, INT-02-A",
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

#v(0.6em)

#strong[ESP-0031]: Cancelar registro de asistencia

#plantilla_especificacion(
  codigo: "ESP-0031",
  nombre: "Cancelar registro de asistencia",
  version: "1.0.0",
  fecha: "08/07/26",
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
    #h(1.2em) MostrarMensaje("No posee permisos para registrar asistencias.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    conexionBD = verificarConexionBD(BD_en_uso) \
    Si conexionBD = false Entonces \
    #h(1.2em) MostrarMensaje("No existe conexión con la base de datos.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    usuario.click(btnCitas(BTN-08)) \
    Fin Precondiciones
  ],
  procedimiento: [
    Inicio \
    Long idCita \
    Cita cita \
    \
    idCita = obtenerCitaSeleccionada() \
    cita = obtenerCita(idCita) \
    Si cita = null Entonces \
    #h(1.2em) MostrarMensaje("La cita no existe.") \
    #h(1.2em) Finalizar procedimiento \
    FinSi \
    \
    MostrarModal(INT-20-MOD-001) \
    \
    Si usuario.click(btnCancelar(INT-20-BTN-001)) Entonces \
    #h(1.2em) cerrarModal(INT-20-MOD-001) \
    #h(1.2em) descartarCambiosTemporales() \
    #h(1.2em) MostrarMensaje("Se canceló el registro de asistencia.") \
    FinSi \
    Fin Procedimiento
  ],
  postcondicion: [
    Inicio Postcondiciones \
    Boolean modalCerrado \
    Boolean asistenciaRegistrada \
    \
    modalCerrado = verificarModalCerrado(INT-20-MOD-001) \
    Verificar modalCerrado = true \
    \
    asistenciaRegistrada = existeAsistencia(idCita) \
    Verificar asistenciaRegistrada = false \
    \
    MostrarMensaje("No se realizaron cambios en la asistencia.") \
    Fin Postcondiciones
  ],
  codigo-artefactos-asociados: "BTN-08, INT-20-MOD-001, INT-20-BTN-001",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Ninguno",
)

== Diagramas de Comportamiento del Artefacto

Una vez formalizada la base de educción, ilación y especificación, a continuación se presentan los diagramas de comportamiento del módulo en sus dos niveles de granularidad arquitectónica: la visión general de caja negra (*Nivel 1*) y la descomposición detallada en carriles de responsabilidad (*Nivel 2*).

=== DIA-CMP-0001: Nivel 1 (Visión funcional general de caja negra)

El diagrama de Nivel 1 expresa la secuencia lógica principal del módulo de manera atómica, abstrayendo detalles internos de implementación y asociando los requerimientos no funcionales (RNF) con sus respectivos atributos de calidad:

#pagebreak(weak: true)

#figure(
  diagrama_nivel_1,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-CMP-0001_: Diagrama de comportamiento del módulo de Pacientes (Nivel 1 bajo estándar UML 2.5). Flujo principal: identificación, registro y check-in del paciente con notas de RNF y atributos de calidad.],
)

#pagebreak(weak: true)

=== DIA-CMP-0001: Nivel 2 (Descomposición en carriles de responsabilidad)

El diagrama de Nivel 2 descompone formalmente, en una *única vista*, las actividades con lógica interna modelable del Nivel 1, construido íntegramente con las primitivas vectoriales de Typst y conforme a las buenas prácticas UML 2.5: *carriles de partición* (_Activity Partitions_) para delimitar la responsabilidad del actor `ACT-0003` (Recepcionista) frente a las validaciones del `Sistema`; verificación de precondiciones de sesión, permisos y conexión contra `OMVITAL_DB_PACIENTES` (ESP-0002); nodos de decisión con guardas `[Sí]`/`[No]`; bucle de validación estricta de la fuente *FUE-0004*; nodo de fusión (_merge_) con la tradición del Nivel 1 y notas UML anexadas (RNF-0002, RNF-01, RNF-0001). El flujo se sustenta en las instancias EDU-0001/0029, ILA-0001/0002/0020 y ESP-0001/0002/0003/0004/0005/0030/0031 del banco de datos `database/`. Las actividades «1. Solicitar identificación del paciente» y «7. Continuar con el proceso de atención» se conservan como cajas negras de entrada/salida del módulo.

#pagebreak(weak: true)

#figure(
  diagrama_nivel_2,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-CMP-0001_: Diagrama de comportamiento de Nivel 2 (UML 2.5): descomposición detallada de «2. Identificar paciente» (ESP-0003), «4. Consultar / cargar ficha del paciente» (ESP-0004 / ESP-0005), «5. Registrar nuevo paciente» (ESP-0001 / ESP-0002 / FUE-0004) y «6. Iniciar check-in en agenda diaria» (ESP-0030 / ESP-0031), con carriles de proceso Recepcionista/Sistema, guardas `[Sí]`/`[No]` y bucle de validación FUE-0004; conserva la decisión y el nodo de fusión del Nivel 1.],
)

#pagebreak(weak: true)
