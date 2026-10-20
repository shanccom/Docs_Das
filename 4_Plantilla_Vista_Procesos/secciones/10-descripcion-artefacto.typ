// ============================================================
// Sección 10: Descripción del artefacto
// Artefacto: DIA-PRC-0001 (Vista de Procesos - Nivel 1 y Nivel 2)
// Estándar: UML 2.5 (OMG) & Modelo 4+1 (Kruchten 1995)
// Estructura: Educción -> Ilación -> Especificación -> Diagramas N1 y N2
// ============================================================

#import "../diagrama/diagrama-nivel-1.typ": diagrama_nivel_1
#import "../diagrama/diagrama-nivel-2.typ": diagrama_nivel_2
#import "../cuadros/mod.typ": *

= Descripción del artefacto

El presente artefacto corresponde a la *Vista de Procesos* del sistema clínico *OmVital Physio Control*, identificado formalmente con el código _DIA-PRC-0001_. El modelado ha sido elaborado conforme al estándar internacional *UML 2.5* para la representación de los aspectos dinámicos del sistema, modelando la concurrencia, la distribución de tareas, la sincronización de hilos y la tolerancia a fallos en tiempo de ejecución.

El propósito central de este artefacto es formalizar la arquitectura en tiempo de ejecución del sistema en sus tres sedes operativas: la coordinación de hilos de ejecución concurrentes, la sincronización en tiempo real de recursos físicos compartidos (camillas y consultorios), el desacoplamiento de tareas intensivas de entrada/salida mediante colas de trabajadores en segundo plano (_background workers_), la preservación de la consistencia transaccional ACID en bases de datos relacionales y la resiliencia operativa ante la integración con servicios externos.

Para asegurar trazabilidad rigurosa y apego a la metodología de ingeniería de software del curso, la presente sección expone en primer lugar los insumos analíticos estructurados en las matrices de *Educción*, *Ilación* y *Especificación técnica*, culminando con la presentación de los *Diagramas de Procesos en Nivel 1 (Orquestación macroscópica de procesos)* y *Nivel 2 (Concurrencia en detalle y carriles de actividad)*.

#v(0.6em)

== Educción

La estructura del flujo y las restricciones arquitectónicas del artefacto se derivan directamente del repositorio oficial de requisitos del proyecto (*Catálogo de Requisitos de OmVital Physio Control*, Versión 1.0.1 Oficial consolidada de Google Drive), articulando las necesidades funcionales del negocio con los requerimientos no funcionales (RNF) y los atributos de calidad del sistema:

- *Control de asistencia y check-in síncrono:* Verificación síncrona de saldo financiero y registro atómico de asistencia en recepción clínica (`EDU-0029`).
- *Sincronización reactiva de camillas y organización interna:* Supervisión y telemetría de camillas y turnos en tiempo real entre recepción y consultorios (`EDU-0026`, `EDU-0032`).
- *Cierre asistencial y registro de sesión terapéutica:* Registro de atención, evolución clínica SOAP, captura de firma digital y actualización de historial (`EDU-0025`).

Los atributos de calidad y requerimientos no funcionales (RNF) vinculados formalmente al artefacto son:

- _RNF-0002_ (*Tiempo de respuesta*): Búsqueda de pacientes por DNI en tiempo $t <= 500$ ms; check-in de recepción completado en $t <= 3$ s.
- _RNF-0006_ (*Sincronización en tiempo real*): Propagación del estado de camillas vía WebSockets con latencia menor a 1 segundo entre recepción y consultorios.
- _RNF-0007_ (*Generación documental*): Emisión y compilación de constancias de atención en formato PDF en tiempo $t <= 5$ s ejecutada en segundo plano.
- _RNF-0010_ (*Persistencia inmutable*): Almacenamiento seguro de constancias firmadas en la nube (AWS S3) con cifrado AES-256 sin posibilidad de sobrescritura.
- _RNF-0001_ (*Alta disponibilidad*): Operación multi-sede ininterrumpida soportada por infraestructura distribuida en la nube.

A continuación se presentan las matrices de educción que sustentan formalmente las decisiones de la Vista de Procesos, extraídas en su versión oficial vigente:

#v(0.4em)

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
  codigo-ilacion: "ILA-0020, ILA-0021",
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

#v(0.4em)

#strong[EDU-0026]: Gestión de visualización básica de organización interna actual para el fisioterapeuta

#plantilla_educcion(
  codigo: "EDU-0026",
  nombre: "Gestión de visualización basica de organización interna actual para el fisioterapeuta",
  version: "1.0.0",
  fecha: "09/05/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001",
  fuente: "FUE-0003",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0019",
  descripcion: [
    Mostrar cambios de recepción, tardanzas y reasignación de camillas. Garantizando que el fisioterapeuta pueda consultar, actualizar y coordinar horarios de forma ágil durante turnos de alta demanda.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Se agregó FUE-0003 que contiene la ENTR-0002 de fisioterapeuta. Condiciona la adopción de canales dúplex mediante WebSockets (RFC 6455) para la sincronización reactiva de estados de camillas entre recepción y consultorios.
  ],
)

#v(0.4em)

#strong[EDU-0025]: Gestión de registro de sesión terapéutica

#plantilla_educcion(
  codigo: "EDU-0025",
  nombre: "Gestión de registro de sesión terapéutica",
  version: "1.1.0",
  fecha: "09/05/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001",
  fuente: "FUE-0001 (ENTR-002), FUE-0006",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0015, ILA-0016, ILA-0017, ILA-0018",
  descripcion: [
    El sistema debe permitir crear, editar, desactivar sesiones terapéuticas. \
    \
    Cada sesión debe incluir campos obligatorios: agente aplicado, zona de aplicación, tiempo de uso y escala EVA (0–10) y duración total de la sesión. El sistema debe poder obtener los protocolos definidos y aplicarlos dentro del registro. \
    \
    El sistema debe permitir registrar zonas de dolor mediante mapas corporales y botones predefinidos. Debe incluir digitalmente el consentimiento informado y registrar qué equipo invasivo se usó y cuándo. Permitir la creación de informes terapéuticos digitales (dolor, fuerza, movilidad, pruebas funcionales, observaciones) a partir de las sesiones del paciente observadas. \
    \
    El sistema debe permitir registrar, editar, desactivar tratamientos incluyendo los tiempos estándar por equipo (ej. TENS 8–10 min, Tecarterapia 4–8 min) y registrar la duración total de la terapia estandarizada. Estos tratamientos pueden ser enlazados por cada sesión. \
    \
    El sistema debe permitir al fisioterapeuta registrar y consultar protocolos de seguridad aplicados durante la sesión, incluyendo situaciones críticas como fiebre, estado etílico, desorientación o inflamación anormal. Al detectarse una "bandera roja", la sesión debe quedar marcada como suspendida sin descuento para el paciente. Además, el sistema debe contar con un módulo digital de contingencia que guíe al fisioterapeuta en la acción inmediata a seguir (ej. suspender terapia, recomendar descanso, derivar a médico), garantizando la seguridad clínica y la trazabilidad del evento.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Se agregó la fuente que contiene la entrevista 02 y una fuente bibliográfica (FUE-0006). La captura de firma y generación de comprobante debe desacoplarse del hilo principal para permitir que el terapeuta libere su dispositivo sin experimentar demoras de procesamiento.
  ],
)

#v(0.4em)

#strong[EDU-0032]: Gestión de monitoreo de organización interna actual para el recepcionista

#plantilla_educcion(
  codigo: "EDU-0032",
  nombre: "Gestión de monitoreo de organización interna actual para el recepcionista",
  version: "1.0.0",
  fecha: "07/06/2026",
  autor-plantilla: "AUT-0002",
  actor: "ACT-0003",
  fuente: "ENT-0004, FUE-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0026",
  descripcion: [
    El sistema debe permitir al recepcionista consultar la agenda completa de pacientes del día, la cita actual por fisioterapeuta y el estado de ocupación de las camillas; así como registrar y actualizar las novedades o incidencias de la jornada para mantener informado al personal.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Existe una relación bidireccional con la EDU-0026, ya que el estado de las camillas se actualiza desde la vista del fisioterapeuta (y se consume aquí en modo lectura), mientras que el registro de novedades se envía desde aquí para la visualización del fisioterapeuta.
  ],
)

== Ilación

La etapa de ilación traduce las necesidades de educción en reglas formales de secuencia procedimental, control de concurrencia y pre/postcondiciones técnicas. El modelado se apega a la sintaxis y semántica de *UML 2.5* (OMG):

- #text(weight: "bold")[Particiones de Actividad (`ActivityPartitions`):] Carriles que agrupan acciones bajo unidades de ejecución independientes (hilos de interfaz, proceso API Gateway, motor WebSocket, workers asíncronos y motor relacional).
- #text(weight: "bold")[Nodo de Bifurcación (`ForkNode`):] Barra horizontal continua de sincronización que divide un flujo de control entrante en múltiples flujos paralelos concurrentes mediante la multiplicación de tokens de ejecución.
- #text(weight: "bold")[Nodo de Sincronización (`JoinNode`):] Barra de sincronización que bloquea el flujo saliente hasta que todos los flujos concurrentes entrantes hayan completado su procesamiento.
- #text(weight: "bold")[Nodos de Acción (`ActionNode`):] Rectángulos de esquinas redondeadas que representan operaciones atómicas de software.
- #text(weight: "bold")[Nodos de Decisión y Fusión (`DecisionNode` / `MergeNode`):] Rombos formales con guardas disjuntas para control condicional y convergencia de rutas alternativas.

A continuación se presentan las fichas técnicas formales de ilación en su versión oficial consolidada:

#v(0.4em)

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
    1. El usuario ha iniciado sesión correctamente. \
    2. El usuario cuenta con rol y permisos activos de Recepcionista. \
    3. El sistema tiene conexión estable con la base de datos "OMVITAL_DB_PACIENTES". \
    4. El usuario se encuentra en la interfaz de Citas. \
    5. El usuario posee permisos para registrar asistencias en "TABLE_CITAS".
  ],
  procedimiento: [
    1. El ACT-0003 presiona el botón INT-06-BTN-06. \
    2. Luego presiona el botón INT-06-BTN-07. \
    3. Luego se abrirá el modal INT-20-MOD-001 (Registrar Asistencia). \
    4. Para registrar la asistencia se verifica que se haya realizado el pago en INT-20-TXT-006. \
    5. Si el estado es Pagado, puede presionar el botón INT-20-BTN-002. \
    6. Si necesita subir alguna firma para la asistencia puede subir un archivo pdf en INT-20-FUP-001. \
    7. Para registrar la asistencia presiona el botón INT-20-BTN-002. \
    8. Si el estado está en No Pagado, el ACT-0003 presiona el botón INT-20-BTN-001. \
    9. Se cierra el INT-20-MOD-001 presionando cualquiera de los dos botones.
  ],
  postcondicion: [
    1. En caso de haberse presionado el INT-20-BTN-002, la asistencia quedará registrada en el sistema con firma o sin firma. \
    2. La cita cambiará de estado a en curso.
  ],
  codigo-artefactos-asociados: "SDB-02, INT-06-BTN-06, INT-06-BTN-07, INT-20-MOD-001, INT-20-TBL-001, INT-20-TXT-001, INT-20-TXT-002, INT-20-TXT-003, INT-20-TXT-004, INT-20-TXT-005, INT-20-TXT-006, INT-20-BTN-001, INT-20-BTN-002, INT-20-FUP-001",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Sustenta el flujo síncrono inicial de check-in y el primer nodo de bifurcación concurrente (ForkNode 1) del diagrama de procesos.
  ],
)

#v(0.4em)

#strong[ILA-0019]: Visualizar organización interna de atención al paciente

#plantilla_ilacion(
  codigo: "ILA-0019",
  nombre: "Visualizar organización interna de atención al paciente",
  version: "3.0.0",
  fecha: "16/06/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0002 (Fisioterapeuta)",
  fuente: "FUE-0003 (ENTR-002)",
  experto: "Ninguno",
  codigo-educcion: "EDU-0026",
  codigo-especificacion: "ESP-0027, ESP-0028, ESP-0029",
  precondicion: [
    1. El usuario ha iniciado sesión correctamente. \
    2. El usuario cuenta con rol y permisos activos de Fisioterapeuta. \
    3. El sistema tiene conexión estable con la base de datos "OMVITAL_DB_PACIENTES". \
    4. Las tablas TABLE_PACIENTE, TABLE_CITAS, TABLE_HISTORIAL_CLINICO, TABLE_FISIOTERAPEUTA deben estar creadas con datos correctamente. \
    5. El usuario se encuentra en la interfaz INT-008.
  ],
  procedimiento: [
    1. El Fisioterapeuta accede a la interfaz panel de turno (INT-008), pantalla principal de su interfaz. \
    2. Se muestra una vista rápida con: \
       #h(1em) a. Detalles del paciente del turno actual. \
       #h(1em) b. Indicadores de turno. \
       #h(1em) c. Próximos turnos en general. \
       #h(1em) d. Detalles de pacientes de agenda. \
    3. La visualización se actualiza automáticamente sin recarga manual. \
    \
    *Flujos funcionales asociados:* \
    - _Ver progreso del paciente:_ En panel DETALLES DEL TURNO ACTUAL (INT-8-PNL-1), clic en botón "VER PROGRESO" (INT-8-BTN-01), recuperando datos de TABLE_SEGUIMIENTO_CLINICO en interfaz INT-006. \
    - _Filtrar citas propias:_ En panel AGENDA (INT-8-PNL-3), clic en "FILTRAR: MIS CITAS" (INT-8-BTN-02), recuperando datos de TABLE_CITAS del terapeuta en INT-8-TBL-01. \
    - _Ver información de paciente de agenda:_ Clic en botón "VER" (INT-8-BTN-03) en INT-8-TBL-01, desplegando los datos en panel INT-8-PNL-4.
  ],
  postcondicion: [
    1. El fisioterapeuta revisa los avances de sus pacientes dinámicamente durante el día. \
    2. La información queda sincronizada con recepción sin necesidad de recarga manual. \
    3. Los cambios registrados se reflejan inmediatamente en la visualización del fisioterapeuta.
  ],
  codigo-artefactos-asociados: "SDB-01, INT-19-PNL-01, INT-19-BTN-01, INT-19-PNL-02, INT-19-PNL-03, INT-19-BTN-02, INT-19-TBL-01, INT-19-BTN-03, INT-19-PNL-04, INT-19-BTN-04, INT-006, TABLE_CITAS, TABLE_SEGUIMIENTO_CLINICO",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Garantiza el cumplimiento estricto del requisito de sincronización reactiva RNF-0006 y telemetría de camillas sin recarga manual.
  ],
)

#v(0.4em)

#strong[ILA-0017]: Editar Sesión Terapéutica

#plantilla_ilacion(
  codigo: "ILA-0017",
  nombre: "Editar Sesión Terapéutica",
  version: "1.0.1",
  fecha: "17/06/2026",
  autor-plantilla: "AUT-0005",
  actor: "ACT-0001",
  fuente: "FUE-0001 (ENTR-002), FUE-0006",
  experto: "Ninguno",
  codigo-educcion: "EDU-0025",
  codigo-especificacion: "ESP-0025",
  precondicion: [
    1. El fisioterapeuta ha iniciado sesión correctamente en el sistema. \
    2. El fisioterapeuta cuenta con permisos activos para modificar sesiones terapéuticas. \
    3. El sistema tiene conexión estable con la base de datos "OMVITAL_DB_PACIENTES". \
    4. El paciente se encuentra registrado en el sistema. \
    5. Existe al menos un registro en la TABLE_SESION. \
    6. El fisioterapeuta accede al módulo "Sesión de Pacientes". \
    7. El sistema muestra el listado de pacientes. \
    8. El fisioterapeuta selecciona la opción "Editar Sesión" desde la tabla de sesiones.
  ],
  procedimiento: [
    1. El fisioterapeuta accede al módulo "Sesión de Pacientes". \
    2. El sistema muestra el listado de pacientes y sesiones terapéuticas registradas. \
    3. El fisioterapeuta selecciona la opción "Editar Sesión" (INT-18-BTN-04). \
    4. El sistema despliega el modal "Editar Sesión Terapéutica" (INT-17-MDL-01). \
    5. El sistema ejecuta una consulta a TABLE_SESION para recuperar la información de la sesión seleccionada. \
    6. El sistema carga automáticamente los datos: fecha, hora, datos del paciente, número de sesión, terapeuta, diagnóstico, agentes terapéuticos y observaciones clínicas. \
    7. El fisioterapeuta actualiza las observaciones clínicas (INT-17-INP-01). \
    8. Presiona "Actualizar Sesión" (INT-17-BTN-01). \
    9. El sistema valida la información modificada. \
    10. El sistema actualiza el registro en la TABLE_SESION. \
    11. Se muestra mensaje de confirmación de sesión actualizada (INT-17-MDL-02). \
    12. Se cierra el modal y se retorna a la interfaz "Sesión de Pacientes" (INT-18). \
    13. (Flujo alternativo) Opción de cancelar cambios mediante confirmación previa (INT-17-MDL-03).
  ],
  postcondicion: [
    1. La información modificada de la sesión terapéutica queda actualizada en el historial clínico del paciente. \
    2. La información actualizada queda disponible para futuras consultas o reportes. \
    3. Si la edición es cancelada, el registro de la TABLE_SESION conserva los datos previos sin modificaciones.
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-01 a BTN-06, INT-17-TXT-01 a TXT-15, INT-17-INP-01, INT-17-BTN-01 a BTN-05, INT-17-MDL-01, INT-17-MDL-02, INT-17-MDL-03, TABLE_SESION",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Sustenta el segundo nodo de bifurcación concurrente (ForkNode 2) y el desacoplamiento de workers asíncronos para el cierre de atención asistencial.
  ],
)

== Especificación

La fase de especificación consolida las reglas algorítmicas, estructuras de datos y parámetros operacionales verificables que rigen la ejecución de los procesos:

#v(0.4em)

#strong[ESP-0030]: Registro de asistencia

#plantilla_especificacion(
  codigo: "ESP-0030",
  nombre: "Registro de asistencia",
  version: "1.0.0",
  fecha: "06/07/2026",
  autor-plantilla: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0020",
  precondicion: [
    ```
    Boolean sesionValida, permisosValidos, conexionBD
    Usuario usuarioActual
    Long idCita
    String BD_en_uso = "Omvital_Db_Pacientes"

    sesionValida = validarSesion()
    Si sesionValida == false Entonces
        MostrarMensaje("La sesión ha expirado.")
        Finalizar procedimiento
    FinSi

    usuarioActual = obtenerUsuarioSesion()
    permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
    Si permisosValidos == false Entonces
        MostrarMensaje("No posee permisos para registrar asistencias.")
        Finalizar procedimiento
    FinSi

    conexionBD = verificarConexionBD(BD_en_uso)
    Si conexionBD == false Entonces
        MostrarMensaje("No existe conexión con la base de datos.")
        Finalizar procedimiento
    FinSi

    usuario.click(btnCitas(BTN-08))
    ```
  ],
  procedimiento: [
    ```
    Inicio
      Long idCita; Cita cita; Asistencia asistencia
      ArchivoPDF firmaPDF; EstadoPago estadoPago; RutaArchivo rutaFirma

      idCita = obtenerCitaSeleccionada()
      cita = obtenerCita(idCita)
      Si cita == null Entonces
          MostrarMensaje("La cita no existe.")
          Finalizar procedimiento
      FinSi

      estadoPago = obtenerEstadoPago(idCita)
      Si estadoPago <> PAGADO Entonces
          MostrarMensaje("No es posible registrar la asistencia porque la cita aún no ha sido pagada.")
          Finalizar procedimiento
      FinSi

      Si existeAsistencia(idCita) == true Entonces
          MostrarMensaje("La asistencia ya fue registrada.")
          Finalizar procedimiento
      FinSi

      Si usuario.putIn(FileUpload(INT-20-FUP-0001)) Entonces
          firmaPDF = obtenerArchivoSubido()
          Si firmaPDF <> null Entonces
              validarFormatoArchivo(firmaPDF)
              validarTamanoArchivo(firmaPDF)
              rutaFirma = guardarArchivo(firmaPDF)
          Sino
              rutaFirma = null
          FinSi
      Sino
          rutaFirma = null
      FinSi

      Si user.click(btnRegistrarAsistencia(INT-20-BTN-002)) Entonces
          asistencia = new Asistencia()
          asistencia.setIdCita(idCita)
          asistencia.setUsuarioRegistro(usuarioActual)
          asistencia.setFechaRegistro(obtenerFechaActual())
          asistencia.setHoraRegistro(obtenerHoraActual())
          asistencia.setRutaFirma(rutaFirma)
          registrarAsistencia(asistencia)
      FinSi
    Fin
    ```
  ],
  postcondicion: [
    ```
    Inicio Postcondiciones
      Si existeAsistencia(idCita) == true Entonces
          estadoCita = obtenerEstadoCita(idCita)
          Verificar estadoCita == EN_CURSO
          Si rutaFirma <> null Entonces
              Verificar obtenerFirmaAsistencia(idCita) <> null
          FinSi
          MostrarMensaje("La asistencia fue registrada correctamente.")
      FinSi
    Fin Postcondiciones
    ```
  ],
  codigo-artefactos-asociados: "BTN-08, INT-20-FUP-0001, INT-20-BTN-002, TABLE_CITAS",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Especificación del procedimiento atómico orquestado entre el Carril 2 (API Gateway), Carril 3 (Persistencia ACID) y Carril 4 (Tiempo Real).
  ],
)

#v(0.4em)

#strong[ESP-0027]: Acceso y carga inicial del dashboard de monitoreo

#plantilla_especificacion(
  codigo: "ESP-0027",
  nombre: "Acceso y carga inicial del dashboard de monitoreo",
  version: "1.0.0",
  fecha: "16/07/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001 (Fisioterapeuta)",
  fuente: "FUE-0003",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0019",
  precondicion: [
    ```
    Boolean sesionValida, permisosValidos, conexionBD, tablasCreadas
    Usuario usuarioActual
    String str_BD_EnUso = "OMVITAL_DB_PACIENTES"

    sesionValida = validarSesion()
    Si sesionValida == false Entonces
        MostrarMensaje("La sesión ha expirado.")
        RedirigirVista(LOGIN)
        Finalizar procedimiento
    FinSi

    usuarioActual = obtenerUsuarioSesion()
    permisosValidos = validarPermisos(usuarioActual, "FISIOTERAPEUTA")
    Si permisosValidos == false Entonces
        MostrarMensaje("No posee permisos para acceder.")
        RedirigirVista(INICIO)
        Finalizar procedimiento
    FinSi

    conexionBD = verificarConexionBD(str_BD_EnUso)
    tablasCreadas = verificarExistenciaTablas(str_BD_EnUso, [
        "TABLE_PACIENTE", "TABLE_CITA", "TABLE_FISIOTERAPEUTA", "TABLE_SEGUIMIENTO_CLINICO"
    ])
    ```
  ],
  procedimiento: [
    ```
    Inicio
      Vista obj_VistaPanelTurno
      DatosTurno obj_DatosTurnoActual
      DatosIndicador[] arr_IndicadoresTurno
      DatosCita[] arr_AgendaCompleta
      DateTime date_FechaActual
      Fisioterapeuta obj_FisioterapeutaAutenticado

      Si usuario.click(btnAccesoPanelTurno(BTN-05)) Entonces
          obj_VistaPanelTurno = cargarVistaPanelTurno(INT-008)
          date_FechaActual = obtenerFechaServidor()
          obj_FisioterapeutaAutenticado = obtenerFisioterapeutaPorUsuario(str_BD_EnUso, usuarioActual)
          actualizarEncabezadoPanelTurno(INT-008, obj_FisioterapeutaAutenticado.nombres, date_FechaActual)
          
          obj_DatosTurnoActual = consultarTurnoActual(str_BD_EnUso, obj_FisioterapeutaAutenticado.id, date_FechaActual)
          poblarPanelTurnoActual(INT-8-PNL-01, obj_DatosTurnoActual)
          
          arr_IndicadoresTurno = calcularIndicadoresTurno(str_BD_EnUso, obj_FisioterapeutaAutenticado.id, date_FechaActual)
          poblarPanelIndicadoresTurno(INT-8-PNL-02, arr_IndicadoresTurno)
          
          arr_AgendaCompleta = consultarAgendaCompleta(str_BD_EnUso, date_FechaActual)
          poblarPanelAgenda(INT-8-PNL-03, arr_AgendaCompleta, INT-8-TBL-01)
          
          activarActualizacionAutomatica(INT-008, intervalo=30)
      FinSi
    Fin
    ```
  ],
  postcondicion: [
    ```
    Verificar str_VistaActual == "INT-008"
    Verificar bool_PanelTurnoCargado == true
    Verificar bool_PanelesCompletos == true
    QuedaHabilitado(INT-008, modo="CONSULTA_ACTIVA")
    activarSincronizacionRecepcion(INT-008)
    ```
  ],
  codigo-artefactos-asociados: "SDB-01, BTN-05, INT-008, INT-8-PNL-01, INT-8-PNL-02, INT-8-PNL-03, INT-8-TBL-01, TABLE_CITAS, TABLE_FISIOTERAPEUTA",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Especificación algorítmica para el renderizado inicial y suscripción a eventos de sincronización de turnos y camillas del fisioterapeuta.
  ],
)

#v(0.4em)

#strong[ESP-0025]: Actualizar Sesión Terapéutica

#plantilla_especificacion(
  codigo: "ESP-0025",
  nombre: "Actualizar Sesión Terapéutica",
  version: "1.0.0",
  fecha: "16/07/2026",
  autor-plantilla: "AUT-0005",
  actor: "ACT-0001",
  fuente: "FUE-0001 (ENTR-002), FUE-0006",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0017",
  precondicion: [
    ```
    Boolean sesionSeleccionada, datosCargados
    Long idSesion
    
    idSesion = obtenerSesionSeleccionada()
    sesionSeleccionada = existeSesion(idSesion)
    Si sesionSeleccionada == false Entonces
        MostrarMensaje("Debe seleccionar una sesión terapéutica.")
        Finalizar procedimiento
    FinSi
    
    datosCargados = verificarCargaInformacion()
    Si datosCargados == false Entonces
        MostrarMensaje("No fue posible cargar la información de la sesión.")
        Finalizar procedimiento
    FinSi
    ```
  ],
  procedimiento: [
    ```
    Inicio
      Boolean datosValidos, actualizacionExitosa
      String observacionesClinicas

      usuario.click(INT-17-BTN-02)
      observacionesClinicas = obtenerObservaciones()
      datosValidos = validarObservaciones(observacionesClinicas)

      Si datosValidos == true Entonces
          actualizacionExitosa = actualizarSesion(idSesion, observacionesClinicas)
          Si actualizacionExitosa == true Entonces
              MostrarModal(INT-17-MDL-01)
              retornarInterfaz(INT-16)
          Sino
              MostrarMensaje("No fue posible actualizar la sesión terapéutica.")
          FinSi
      Sino
          MostrarMensaje("Los datos ingresados son inválidos.")
      FinSi
    Fin
    ```
  ],
  postcondicion: [
    ```
    Inicio Postcondiciones
      Verificar existeSesionActualizada(idSesion) == true
      historialClinico.actualizarObservaciones(idSesion, observacionesClinicas)
      MostrarMensaje("Sesión terapéutica actualizada correctamente.")
    Fin Postcondiciones
    ```
  ],
  codigo-artefactos-asociados: "SDB-01, INT-17-BTN-01, INT-17-BTN-02, INT-17-MDL-01, INT-16, TABLE_SESION",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Especificación de la persistencia atómica de evolución clínica en TABLE_SESION y consolidación del cierre asistencial.
  ],
)

== Especificación técnica del artefacto `DIA-PRC-0001`

#v(0.4em)

#plantilla_especificacion(
  codigo: "DIA-PRC-0001",
  nombre: "Vista de Procesos de OmVital Physio Control",
  version: "1.0.0",
  fecha: "08/10/2026",
  autor-plantilla: "AUT-0001, AUT-0002, AUT-0003, AUT-0005, AUT-0008",
  actor: "ACT-0001, ACT-0002, ACT-0003",
  fuente: "ENT-0001, ENT-0002, ENT-0004",
  experto: "EXP-001",
  codigo-ilacion: "ILA-0020, ILA-0019, ILA-0006, ILA-0017, ILA-0026",
  inset: (x: 6pt, y: 3.2pt),
  tamano_letra: 9.0pt,
  precondicion: [
    Infraestructura multi-sede interconectada sobre red WAN segura. \
    Servidor de base de datos relacional PostgreSQL con soporte de transacciones ACID y aislamiento Read Committed. \
    Broker de mensajería asíncrona operativo para desacoplamiento de workers.
  ],
  procedimiento: [
    El artefacto formaliza la arquitectura en tiempo de ejecución en dos niveles de descomposición gráfica: \
    - Nivel 1 (Macroscópico): Orquestación en tiempo de ejecución de las Ilaciones del sistema (ILA-0020, ILA-0019 / ILA-0006 e ILA-0017), modelando los macro-procesos, sus eventos de disparo reactivo y el ciclo de retroalimentación de recursos. \
    - Nivel 2 (Concurrencia en Detalle): Descomposición en 5 carriles de actividad (ActivityPartitions) que formaliza la ejecución multihilo, los puntos de bifurcación concurrente (ForkNode 1 y ForkNode 2) y la barrera de sincronización (JoinNode 1).
  ],
  postcondicion: [
    Garantía de cumplimiento verificable de los procedimientos de las ilaciones: admisión y deducción atómica de sesiones (ILA-0020), sincronización reactiva de ocupación y liberación de camillas (ILA-0019 / ILA-0006), y cierre asistencial con desacoplamiento asíncrono en segundo plano (ILA-0017).
  ],
  codigo-artefactos-asociados: "PRC-01, PRC-02, PRC-03, ILA-0020, ILA-0019, ILA-0006, ILA-0017, ESP-0030, ESP-0027, ESP-0025, EVT-01, EVT-02, EVT-03",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Artefacto de arquitectura de software correspondiente a la Evaluación Continua 2 (Segunda Fase) del curso DAS 2026-B.
  ],
)

#pagebreak(weak: true)

== Diagramas de la Vista de Procesos

=== DIA-PRC-0001: Nivel 1 (Orquestación macroscópica de procesos en tiempo de ejecución)

El diagrama de Nivel 1 expresa la orquestación general de los procesos del sistema en tiempo de ejecución, atacando directamente la cobertura procedural de las ilaciones clave del sistema (ILA-0020, ILA-0019 / ILA-0006 e ILA-0017), delimitando las entradas de los actores, los eventos de transición de estado y los canales de retroalimentación de recursos:

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-nivel-1.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_: Diagrama de procesos del sistema OmVital Physio Control (Nivel 1). Orquestación macroscópica de procesos en tiempo de ejecución, cobertura de ilaciones y eventos transaccionales.],
)

#pagebreak(weak: true)

=== Análisis de macro-procesos, ilaciones y eventos del Nivel 1:

1. *`PRC-01` (Admisión y Control de Asistencia — Cobertura: `ILA-0020`):*
   Iniciado por la recepcionista (`ACT-0003`) al ingresar el DNI del paciente. Ejecuta la verificación síncrona de saldo financiero ante el servicio externo (con límite estricto de 3 segundos), inicia la transacción relacional atómica ACID con bloqueo de fila para decrementar el contador de sesiones contratadas y transiciona la cita a estado «En Sala». Al completarse, genera el disparo reactivo `EVT-01`.

2. *`PRC-02` (Sincronización Reactiva de Recursos y Camillas — Cobertura: `ILA-0019` / `ILA-0006`):*
   Gestiona la retención continua de canales WebSocket dúplex (RFC 6455) segmentados por sede clínica. Al recibir la señal `EVT-01` desde `PRC-01`, retransmite instantáneamente (*Broadcast* con latencia inferior a 1 segundo) el cambio de estado de la camilla a «Ocupada», sincronizando en tiempo real la Bandeja de Agenda en Recepción (`INT-26` / `INT-06`) y las tablets en consultorios (`INT-008` / `INT-19`). Emite la habilitación `EVT-02` para el inicio de la atención médica.

3. *`PRC-03` (Cierre Asistencial y Desacoplamiento en Fondo — Cobertura: `ILA-0017`):*
   Operado por el fisioterapeuta (`ACT-0001`) al culminar la terapia física. Registra las notas de evolución clínica (SOAP) y captura la firma digital del paciente sobre la tablet. Orquesta el cierre asistencial liberando la interfaz táctil en menos de 500 ms y dispara en paralelo dos flujos: el evento de retroalimentación `EVT-03` que transiciona la camilla a estado «En Desinfección» hacia `PRC-02`, y el encolamiento asíncrono en segundo plano para compilación de constancia PDF inmutable en AWS S3 y despacho del ticket por WhatsApp API.

=== DIA-PRC-0001: Nivel 2 (Concurrencia en detalle y descomposición en carriles)

El diagrama de Nivel 2 modela el flujo concurrente y la sincronización temporal del proceso asistencial y de check-in, descomponiendo la ejecución en carriles de responsabilidad y coordinando la atención clínica con las tareas en segundo plano:

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-nivel-2.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_: Diagrama de procesos del sistema OmVital Physio Control (Nivel 2). Descomposición del flujo concurrente en carriles de actividad, sincronización de hilos y procesamiento en segundo plano.],
)

#pagebreak(weak: true)

=== Secuencia analítica de las fases del flujo concurrente:

- *Fase A (Admisión y verificación síncrona):* Inicia en el _Nodo Inicial_ (Carril 1) al ingresar el DNI del paciente. El API Gateway (Carril 2) valida el JWT y consulta la API Financiera (timeout 3 s). Ante saldo insuficiente o expiración, bifurca a notificación de pago en caja y culmina en el nodo final.
- *Fase B (Bifurcación en Check-in y sincronización):* Verificado el saldo, se activa la bifurcación concurrente en tres ramas paralelas: bloqueo de camilla y deducción de sesión en BD (Carril 3, `ILA-0020` · `EDU-0029`), emisión WSS de camilla ocupada (Carril 4, `ILA-0019` / `ILA-0006` · `ESP-0027`) y confirmación HTTP a recepción (Carril 1, `ESP-0030`). Las tres ramas convergen en una barrera de sincronización, garantizando el bloqueo de datos antes de habilitar la atención clínica.
- *Fase C (Atención asistencial y firma digital):* Desde la sincronización, el control transita a la tableta del terapeuta (Carril 1), quien ejecuta la sesión física, registra notas SOAP y captura la firma digital (`ILA-0017` · `EDU-0025`). El payload consolidado se remite al API Gateway (Carril 2).
- *Fase D (Bifurcación en cierre de sesión):* El API Gateway activa la bifurcación paralela, derivando cuatro flujos concurrentes: confirmación inmediata a la tableta liberando la interfaz en $< 500$ ms, actualización del estado a «En Desinfección» en base de datos (Carril 3), difusión vía WebSocket de camilla disponible (Carril 4) y encolamiento asíncrono del comprobante en la cola de trabajadores (Carril 5).
- *Fase E (Pipeline asíncrono en segundo plano):* El worker (Carril 5) compila la constancia PDF en segundo plano (`ILA-0017` · `ESP-0024`), la persiste con cifrado AES-256 en AWS S3 (`ESP-0025`) y despacha el comprobante por WhatsApp API. El ciclo transaccional culmina formalmente en el _Nodo Final de Actividad_.

