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

La *Vista de Procesos* (_DIA-PRC-0001_) modela la dinámica en tiempo de ejecución de *OmVital Physio Control* bajo el estándar *UML 2.5*. Describe la concurrencia entre hilos, la sincronización reactiva de camillas entre sedes, el aislamiento transaccional en la base de datos relacional y el desacoplamiento de tareas mediante colas en segundo plano.

La sección estructura los insumos mediante las matrices de *Educción*, *Ilación* y *Especificación técnica*, seguidas de la *Arquitectura en Capas de Ejecución*, el *Diagrama de Procesos Integrado* y los *Diagramas de Procesos Específicos* para las ilaciones base (`ILA-0020`, `ILA-0019` e `ILA-0017`).

#v(0.4em)

== Educción

Los requisitos se derivan del catálogo consolidado del proyecto, asociando las necesidades clínicas con los requerimientos no funcionales (RNF):

- *Control de asistencia (`EDU-0029`):* Verificación síncrona de saldo y check-in en recepción ($t <= 3$ s, _RNF-0002_).
- *Sincronización de camillas (`EDU-0026`, `EDU-0032`):* Actualización reactiva vía WebSockets entre recepción y consultorios con latencia menor a 1 segundo (_RNF-0006_).
- *Registro de sesión y constancias (`EDU-0025`):* Registro de notas SOAP, firma digital, compilación de PDF en segundo plano ($t <= 5$ s, _RNF-0007_) y persistencia inmutable en AWS S3 con cifrado AES-256 (_RNF-0010_).

A continuación se presentan las fichas de educción aplicables:

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

La etapa de ilación define la secuencia de ejecución de los procesos clínicos, el control de concurrencia y las condiciones operativas de cada flujo:

A continuación se presentan las fichas de ilación correspondientes:

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
    Sustenta el flujo síncrono inicial de check-in y la activación concurrente del flujo de asignación de camillas en el diagrama de procesos.
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
    Sustenta el procesamiento concurrente y el desacoplamiento de workers asíncronos para el cierre de atención asistencial.
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
    Especificación del procedimiento atómico orquestado entre la Capa de Aplicación (API Gateway), Capa de Persistencia (ACID) y Capa de Tiempo Real.
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

#pagebreak(weak: true)

== Especificación técnica del artefacto `DIA-PRC-0001`

#v(0.4em)

#align(center)[
  #block(width: 95%)[
    #set text(size: 8.5pt)
    #table(
      columns: (4.5cm, 1fr),
      inset: (x: 6pt, y: 3.8pt),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#ffe599"))[*Elemento / Campo*],
        table.cell(fill: rgb("#ffe599"))[*Ficha Técnica: Diagrama de Vista de Procesos*],
      ),
      [*Código del diagrama:*], [DIA-PRC-0001],
      [*Tipo de artefacto:*], [Diagrama de Procesos / Actividades en Capas (UML 2.5)],
      [*Dominio funcional:*], [Gestión clínica, check-in, monitoreo de camillas y sesión terapéutica],
      [*Requisitos no funcionales:*], [RNF-0002 (Rendimiento $t <= 500$ ms), RNF-0006 (Tiempo real $< 1$ s), RNF-0007 (Constancias $t <= 5$ s), RNF-0010 (Seguridad AES-256)],
      [*Capas de ejecución:*], [Presentación, Aplicación, Persistencia, Tiempo Real, Asíncrona e Integración],
      [*Mecanismos de concurrencia:*], [Transacciones ACID (Read Committed), WebSockets dúplex (RFC 6455), ejecución multihilo paralela y colas de workers],
      [*Precondición:*], [Conectividad de red operativa, PostgreSQL disponible y broker de tareas activo],
      [*Poscondición:*], [Asistencia registrada, camillas sincronizadas y constancia médica archivada en la nube],
      [*Ilaciones asociadas:*], [ILA-0020, ILA-0019, ILA-0017, ILA-0026],
      [*Versión:*], [2.0.0],
      [*Autor:*], [AUT-0001, AUT-0002, AUT-0003, AUT-0005, AUT-0008],
      [*Fecha:*], [20/10/2026],
      [*Estado:*], [Concluido],
    )
  ]
]

#pagebreak(weak: true)

== Capas de ejecución del sistema

Los procesos se organizan en cinco capas de ejecución según sus responsabilidades transaccionales y de comunicación:

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (3.0cm, 4.3cm, 1fr),
      inset: (x: 6pt, y: 5pt),
      align: (center + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#e5e7eb"))[*Capa de ejecución*],
        table.cell(fill: rgb("#e5e7eb"))[*Componentes asociados*],
        table.cell(fill: rgb("#e5e7eb"))[*Función en el flujo asistencial*],
      ),
      [Presentación],
      [Recepción web (`INT-06`, `INT-20`), tableta de consultorio (`INT-17`, `INT-18`) y monitores (`INT-26`).],
      [Captura de datos en recepción, registro de check-in, visualización de agenda y firma digital sobre la tableta.],

      [Aplicación],
      [API Gateway, controladores REST y orquestador de flujos clínicos.],
      [Validación de reglas de negocio, control de acceso por roles y coordinación del flujo asistencial entre capas.],

      [Persistencia],
      [Base de datos relacional PostgreSQL (`TABLE_CITAS`, `TABLE_PACIENTE`, `TABLE_SESION`).],
      [Registro transaccional de asistencia, actualización de saldo de sesiones y almacenamiento inmutable de notas SOAP.],

      [Tiempo Real],
      [Servidor WebSocket (RFC 6455).],
      [Sincronización instantánea del estado de camillas hacia recepción y consultorios con latencia menor a 1 segundo (_RNF-0006_).],

      [Asíncrona e Integración],
      [Broker de mensajería, AWS S3 y servicio WhatsApp API.],
      [Compilación de constancias médicas en PDF ($t <= 5$ s, _RNF-0007_), archivo inmutable en la nube (_RNF-0010_) y notificación al paciente.],
    )
  ]
]

#pagebreak(weak: true)

== DIA-PRC-0001: Diagrama de Procesos Integrado del Sistema

El diagrama integra las tres ilaciones principales en un solo flujo continuo:

1. *Admisión y asignación de camilla (`ILA-0020` e `ILA-0019`):* La recepcionista valida el saldo del paciente ($t <= 3$ s). Al confirmarse, el sistema descuenta la sesión en PostgreSQL bajo una transacción ACID y pasa el control a la gestión de camillas. La aplicación asigna una camilla libre y la registra como «Ocupada».

2. *Sincronización en tiempo real e inicio de atención:* Con la camilla asignada, el sistema despacha dos acciones en paralelo:
   - Despliega el turno y los datos del paciente en la tableta del consultorio ($t < 500$ ms), habilitando el inicio de la atención médica en `ILA-0017`.
   - Difunde el estado «Ocupada» vía WebSocket ($t < 1$ s) a las pantallas de recepción y monitores de la sede.

3. *Cierre asistencial y procesamiento en segundo plano (`ILA-0017`):* Tras registrar notas SOAP y firma digital, PostgreSQL persiste la sesión y cambia la camilla a «En Desinfección». La tableta se libera de inmediato ($t <= 500$ ms), recepción se actualiza por WebSocket y un worker en segundo plano compila la constancia médica en PDF ($t <= 5$ s), la almacena en AWS S3 con cifrado AES-256 y envía el enlace al paciente por WhatsApp.

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-integrado.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_: Diagrama de procesos integrado del sistema OmVital Physio Control.],
)

#pagebreak(weak: true)

== Diagramas de Procesos Específicos por Ilación

Cada ilación base cuenta con un diagrama de procesos propio que detalla la secuencia de ejecución, la interacción entre capas y la trazabilidad hacia las tablas relacionales.

=== DIA-PRC-ILA-0020: Proceso de Registro de Asistencia (`EDU-0029` · `ESP-0030`/`31`)

Modela el flujo de check-in operado desde recepción. Articula la validación financiera síncrona con la persistencia transaccional en la base de datos:

1. *Ingreso y Verificación:* La recepcionista captura la llegada del paciente con su DNI. La Capa de Aplicación consulta la disponibilidad de saldo ante la API financiera con un tiempo límite de 3 segundos.
2. *Decisión de Saldo:* Si la cita registra saldo pendiente o expira el tiempo límite, el sistema notifica el estado y deriva al paciente a caja, finalizando el flujo local.
3. *Transacción ACID y Retorno:* Ante saldo verificado, la aplicación inicia una transacción con aislamiento Read Committed, aplica bloqueo pesimista en la cita y descuenta la sesión del paciente. La base de datos ejecuta el commit y retorna obligatoriamente la confirmación a la aplicación, la cual actualiza la interfaz de recepción y concluye la admisión.

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-ila-0020.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-ILA-0020_: Diagrama de procesos del registro de asistencia.],
)

#pagebreak(weak: true)

=== DIA-PRC-ILA-0019: Proceso de Visualización de Organización Interna y Sincronización de Camillas (`EDU-0026` · `ESP-0027`/`28`/`29`)

Modela la actualización reactiva del panel de consultorios y la telemetría de camillas operada por el fisioterapeuta:

1. *Carga Inicial y Sesión:* El fisioterapeuta accede al sistema; la Capa de Aplicación recupera la agenda y el paciente en turno desde la base de datos, desplegando el panel operativo.
2. *Canal WebSocket y Flujos en Paralelo:* Se establece la conexión WSS persistente (RFC 6455), atendiendo dos flujos simultáneos:
   - *Telemetría Reactiva:* El servidor transmite eventos de cambio de estado de camillas a todas las pantallas de la sede en menos de 1 segundo (_RNF-0006_).
   - *Consulta de Historial Clínico:* Al solicitar la evolución del paciente, la aplicación consulta la base de datos, la cual devuelve la serie temporal de atenciones previas para su renderizado en pantalla.

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-ila-0019.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-ILA-0019_: Diagrama de procesos de visualización de organización interna y sincronización de camillas.],
)

#pagebreak(weak: true)

=== DIA-PRC-ILA-0017: Proceso de Edición de Sesión Terapéutica (`EDU-0025` · `ESP-0024`/`25`)

Modela la evolución clínica, el cierre de consulta y el desacoplamiento de tareas documentales pesadas:

1. *Carga y Edición Clínica:* Al iniciar la atención, la aplicación recupera la sesión desde la base de datos para precargar el formulario. El fisioterapeuta registra los agentes físicos, escala EVA, notas SOAP y captura la firma digital.
2. *Persistencia Transaccional:* La aplicación comisiona la actualización atómica en PostgreSQL. La base de datos persiste la evolución, actualiza el historial clínico y retorna la confirmación a la aplicación.
3. *Cierre Asistencial y Procesamiento en Paralelo:* Con la persistencia confirmada, el sistema despacha dos flujos simultáneos:
   - *Respuesta a Usuario:* Cierra el formulario y libera la tableta clínica en menos de 500 ms (_RNF-0002_).
   - *Pipeline en Segundo Plano:* Encola la tarea en el broker de mensajería; un worker compila la constancia médica en PDF ($t <= 5$ s, _RNF-0007_), almacena el archivo con cifrado AES-256 en AWS S3 (_RNF-0010_) y despacha el enlace de descarga por WhatsApp API.

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-ila-0017.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-ILA-0017_: Diagrama de procesos de edición de sesión terapéutica.],
)

#pagebreak(weak: true)



