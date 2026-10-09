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

Para asegurar trazabilidad rigurosa y apego a la metodología de ingeniería de software del curso, la presente sección expone en primer lugar los insumos analíticos estructurados en las matrices de *Educción*, *Ilación* y *Especificación técnica*, culminando con la presentación de los *Diagramas de Procesos en Nivel 1 (Visión general de procesos)* y *Nivel 2 (Concurrencia en detalle y carriles)*, complementados con la *Matriz de Asignación Proceso-Dispositivo*.

#v(0.6em)

== Educción

La estructura del flujo y las restricciones arquitectónicas del artefacto se derivan directamente del repositorio de requisitos del proyecto, articulando las necesidades funcionales del negocio con los requerimientos no funcionales (RNF) y los atributos de calidad del sistema:

- *Control de asistencia y check-in síncrono:* Verificación síncrona de saldo financiero y registro atómico de asistencia en recepción clínica (`EDU-0029`).
- *Sincronización reactiva de camillas:* Supervisión y telemetría de camillas en tiempo real entre recepción y consultorios mediante WebSockets (`EDU-0025`, `EDU-0026`, `EDU-0032`).
- *Cierre asistencial y desacoplamiento en segundo plano:* Registro de atención, captura de firma en tablet y delegación asíncrona de constancias PDF y almacenamiento en la nube (`EDU-0025`, `EDU-0026`).

Los atributos de calidad y requerimientos no funcionales (RNF) vinculados formalmente al artefacto son:

- _RNF-0002_ (*Tiempo de respuesta*): Búsqueda de pacientes por DNI en tiempo $t <= 500$ ms; check-in de recepción completado en $t <= 3$ s.
- _RNF-0006_ (*Sincronización en tiempo real*): Propagación del estado de camillas vía WebSockets con latencia menor a 1 segundo entre recepción y consultorios.
- _RNF-0007_ (*Generación documental*): Emisión y compilación de constancias de atención en formato PDF en tiempo $t <= 5$ s ejecutada en segundo plano.
- _RNF-0010_ (*Persistencia inmutable*): Almacenamiento seguro de constancias firmadas en la nube (AWS S3) con cifrado AES-256 sin posibilidad de sobrescritura.
- _RNF-0001_ (*Alta disponibilidad*): Operación multi-sede ininterrumpida soportada por infraestructura distribuida en la nube.

A continuación se presentan las matrices de educción que sustentan formalmente las decisiones de la Vista de Procesos:

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
  codigo-ilacion: "ILA-0020",
  descripcion: [
    El sistema debe permitir a la recepcionista gestionar el flujo de llegada de los pacientes (Check-in) mediante un modelo de validación y actualización. Al momento del ingreso, el sistema permitirá consultar de manera síncrona el estado del paciente consumiendo la API financiera para verificar si cuenta con sesiones a favor o pagos pendientes. \
    \
    Si el estado es validado, la recepcionista podrá registrar la asistencia del día, lo cual actualizará atómicamente el contador de sesiones restantes del paquete del paciente. En caso de inasistencia o demoras, el sistema permitirá asentar la incidencia. Para evitar inconsistencias y salvaguardar la auditoría, no se podrán eliminar asistencias pasadas; solo se permitirá anular un check-in registrado por error durante la misma jornada mediante baja lógica.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Requerimiento de interoperabilidad crítico. Exige definir un tiempo máximo de espera (timeout de 3 segundos) con el servicio externo para evitar retener hilos del servidor de recepción ante contingencias de red.
  ],
)

#v(0.4em)

#strong[EDU-0026]: Visualización de organización interna actual

#plantilla_educcion(
  codigo: "EDU-0026",
  nombre: "Visualización de organización interna actual",
  version: "2.0.0",
  fecha: "16/06/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001",
  fuente: "ENT-0002",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0006",
  descripcion: [
    El sistema debe permitir al fisioterapeuta visualizar en un panel central la información de la cita actual y las citas programadas durante el turno asistencial. \
    \
    Debe mostrar los datos del paciente (edad, diagnóstico, tratamiento, número de sesión, camilla asignada), así como la agenda de horarios y camillas reflejando cambios en tiempo real provenientes de recepción (tardanzas, reasignaciones de camilla y cancelaciones). \
    \
    El sistema debe garantizar la actualización automática de estos datos sin necesidad de recarga manual de pantalla, optimizando la coordinación asistencial en turnos de alta demanda.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Condiciona la adopción de canales dúplex mediante WebSockets (RFC 6455) para la sincronización de estados de camillas entre recepción y los consultorios de fisioterapia.
  ],
)

#v(0.4em)

#strong[EDU-0025]: Gestión de registro de sesión terapéutica

#plantilla_educcion(
  codigo: "EDU-0025",
  nombre: "Gestión de registro de sesión terapéutica",
  version: "1.2.0",
  fecha: "16/06/2026",
  autor-plantilla: "AUT-0005",
  actor: "ACT-0001",
  fuente: "ENT-0002, FUE-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0017",
  descripcion: [
    El sistema debe permitir al fisioterapeuta gestionar las sesiones terapéuticas de los pacientes mediante una interfaz de atención clínica donde se lista a los pacientes en espera y en tratamiento. \
    \
    Al iniciar la sesión, el sistema carga automáticamente la ficha clínica previa, diagnóstico funcional y número de sesión. Al concluir la atención física, el profesional documenta las notas de evolución clínica (método SOAP) y solicita la captura de la firma digital de conformidad del paciente en la tableta clínica. \
    \
    El registro debe consolidarse de forma inmutable, actualizando el estado de la camilla a disponible tras su sanitización y disparando la emisión del comprobante asistencial.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    La captura de firma y generación de comprobante debe desacoplarse del hilo principal para permitir que el terapeuta libere su dispositivo sin experimentar demoras de procesamiento.
  ],
)

#v(0.4em)

#strong[EDU-0032]: Gestión de monitoreo de organización interna para el recepcionista

#plantilla_educcion(
  codigo: "EDU-0032",
  nombre: "Gestión de monitoreo de organización interna para el recepcionista",
  version: "1.0.0",
  fecha: "07/06/2026",
  autor-plantilla: "AUT-0002",
  actor: "ACT-0003",
  fuente: "ENT-0004",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0026",
  descripcion: [
    El sistema debe permitir a la recepcionista consultar la agenda completa de pacientes del día, la cita en curso por cada terapeuta y el estado de ocupación de las camillas terapéuticas en la sede. \
    \
    Asimismo, debe permitir registrar novedades e incidencias de la jornada para mantener informado al personal clínico, garantizando que el mapa visual de camillas refleje las transiciones de estado de forma instantánea.
  ],
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Existe relación bidireccional estricta con EDU-0026: el terapeuta cambia el estado de la camilla al atender y el recepcionista visualiza dicho cambio inmediatamente en pantalla.
  ],
)

== Ilación

La etapa de ilación traduce las necesidades de educción en reglas formales de secuencia procedimental, control de concurrencia y pre/postcondiciones técnicas. El modelado se apega a la sintaxis y semántica de *UML 2.5* (OMG):

- #text(weight: "bold")[Particiones de Actividad (`ActivityPartitions`):] Carriles que agrupan acciones bajo unidades de ejecución independientes (hilos de interfaz, proceso API Gateway, motor WebSocket, workers asíncronos y motor relacional).
- #text(weight: "bold")[Nodo de Bifurcación (`ForkNode`):] Barra horizontal continua de sincronización que divide un flujo de control entrante en múltiples flujos paralelos concurrentes mediante la multiplicación de tokens de ejecución.
- #text(weight: "bold")[Nodo de Sincronización (`JoinNode`):] Barra de sincronización que bloquea el flujo saliente hasta que todos los flujos concurrentes entrantes hayan completado su procesamiento.
- #text(weight: "bold")[Nodos de Acción (`ActionNode`):] Rectángulos de esquinas redondeadas que representan operaciones atómicas de software.
- #text(weight: "bold")[Nodos de Decisión y Fusión (`DecisionNode` / `MergeNode`):] Rombos formales con guardas disjuntas para control condicional y convergencia de rutas alternativas.

A continuación se presentan las fichas técnicas formales de ilación:

#v(0.4em)

#strong[ILA-0020]: Registrar asistencia y check-in de paciente

#plantilla_ilacion(
  codigo: "ILA-0020",
  nombre: "Registrar asistencia y check-in de paciente",
  version: "1.0.0",
  fecha: "17/06/2026",
  autor-plantilla: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-educcion: "EDU-0029",
  codigo-especificacion: "ESP-0030",
  precondicion: [
    El usuario cuenta con sesión activa y rol de Recepcionista. \
    Conexión de red operativa con el backend central de OmVital. \
    El paciente se presenta en recepción y su cita se encuentra en estado "Programada" para el turno actual.
  ],
  procedimiento: [
    1. La recepcionista ingresa el DNI del paciente en la interfaz de citas. \
    2. El cliente web remite solicitud POST /api/citas/{id}/checkin al API Gateway. \
    3. El backend verifica el token JWT y ejecuta consulta síncrona GET /api/finanzas/saldo/{pacienteId} ante el servicio financiero externo con límite de 3 segundos. \
    4. Si el saldo es positivo, el backend inicia transacción de base de datos aplicando bloqueo pesimista a nivel de fila sobre el registro de cita y camilla. \
    5. Se actualiza el estado de la cita a "En Sala" y se decrementa el saldo de sesiones. \
    6. Se confirma la transacción ACID y de manera concurrente se emite la señal de ocupación de camilla al servidor WebSocket. \
    7. Se envía respuesta HTTP 200 a la interfaz de recepción con tiempo total inferior a 3 segundos.
  ],
  postcondicion: [
    La cita cambia formalmente a estado "En Sala". \
    El saldo de sesiones queda actualizado en la base de datos centralizada. \
    La camilla asignada transiciona a estado "Ocupada" en la interfaz del terapeuta.
  ],
  codigo-artefactos-asociados: "INT-06, INT-20-MOD-001, SDB-01, TABLE_CITAS",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Sustenta el flujo síncrono inicial y el primer nodo de bifurcación concurrente (ForkNode 1) del diagrama de procesos.
  ],
)

#v(0.4em)

#strong[ILA-0006]: Visualización y sincronización de camillas en tiempo real

#plantilla_ilacion(
  codigo: "ILA-0006",
  nombre: "Visualización y sincronización de camillas en tiempo real",
  version: "1.0.0",
  fecha: "16/06/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001",
  fuente: "ENT-0002",
  experto: "Ninguno",
  codigo-educcion: "EDU-0026",
  codigo-especificacion: "ESP-0008",
  precondicion: [
    El terapeuta ha iniciado sesión en la tablet asistencial. \
    El canal WebSocket seguro (WSS) se encuentra establecido con el servidor en tiempo real de OmVital.
  ],
  procedimiento: [
    1. La interfaz del terapeuta se suscribe al tópico de eventos de la sede clínica correspondiente. \
    2. El servidor en tiempo real mantiene la conexión TCP abierta enviando latidos de control (_heartbeats_). \
    3. Al emitirse un evento de check-in o liberación de camilla desde el backend, el motor WebSocket difunde el payload JSON a todos los clientes suscritos. \
    4. La aplicación receptora procesa el evento en su hilo de renderizado sin recargar la página, actualizando los indicadores gráficos en menos de 1 segundo.
  ],
  postcondicion: [
    El panel de control refleja el estado exacto de los recursos de la sede de manera reactiva y sin discrepancias de estado entre usuarios.
  ],
  codigo-artefactos-asociados: "INT-10, WSS-CAMILLAS, TABLE_RECURSOS",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Garantiza el cumplimiento estricto del requisito de latencia RNF-0006.
  ],
)

#v(0.4em)

#strong[ILA-0017]: Cierre de sesión asistencial y desacoplamiento en segundo plano

#plantilla_ilacion(
  codigo: "ILA-0017",
  nombre: "Cierre de sesión asistencial y desacoplamiento en segundo plano",
  version: "1.0.0",
  fecha: "16/06/2026",
  autor-plantilla: "AUT-0005",
  actor: "ACT-0001",
  fuente: "ENT-0002",
  experto: "Ninguno",
  codigo-educcion: "EDU-0025",
  codigo-especificacion: "ESP-0024",
  precondicion: [
    La sesión de fisioterapia ha finalizado en la camilla asignada. \
    El terapeuta ha completado las notas de evolución clínica.
  ],
  procedimiento: [
    1. El paciente estampa su firma digital en la tablet de atención. \
    2. La aplicación cliente envía el payload consolidado (notas SOAP + trazo de firma) al API Gateway. \
    3. El backend actualiza el estado de la atención en base de datos e inicia el ForkNode 2. \
    4. Rama 1: Se actualiza la camilla a estado "En Desinfección" y se emite señal WSS. \
    5. Rama 2: Se deposita un mensaje con los datos clínicos en la cola de tareas asíncronas. \
    6. Rama 3: Se retorna confirmación inmediata a la tablet, liberando la interfaz para la siguiente atención. \
    7. Un proceso trabajador independiente toma el mensaje de la cola, compila el PDF de constancia clínica, calcula el hash criptográfico, sube el archivo a AWS S3 y despacha el mensaje a WhatsApp.
  ],
  postcondicion: [
    La tablet queda disponible en tiempo $t <= 500$ ms. \
    El comprobante queda persistido inmutablemente en S3 y notificado al paciente.
  ],
  codigo-artefactos-asociados: "INT-12, QUEUE-WORKERS, TABLE_EVOLUCIONES",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Sustenta el segundo nodo de bifurcación concurrente (ForkNode 2) y el desacoplamiento de workers asíncronos.
  ],
)

== Especificación

La fase de especificación consolida las reglas algorítmicas, estructuras de datos y parámetros operacionales verificables que rigen la ejecución de los procesos:

#v(0.4em)

#strong[ESP-0030]: Registro y control de concurrencia en check-in

#plantilla_especificacion(
  codigo: "ESP-0030",
  nombre: "Registro y control de concurrencia en check-in",
  version: "1.0.0",
  fecha: "06/07/2026",
  autor-plantilla: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0020",
  precondicion: [
    `Boolean sesionValida = true;` \
    `Boolean conexionBD = true;` \
    `Long idCita;` \
    `String tokenJWT;`
  ],
  procedimiento: [
    ```
    INICIO PROCESO_CHECKIN(idCita, tokenJWT):
      IF NOT ValidarToken(tokenJWT) THEN RETORNAR Error(401, "No autorizado")
      
      // Llamada síncrona acotada por temporizador de 3 segundos
      TRY:
        saldo = HttpGet("https://api.finanzas.omvital/saldo", idCita, timeout=3000ms)
      CATCH TimeoutException:
        ActivarCircuitBreaker()
        RETORNAR RegistrarContingenciaLocal(idCita)
      
      IF saldo <= 0 THEN
        RETORNAR Respuesta(402, "Pago pendiente en caja")
      
      // Transacción atómica ACID con bloqueo de fila
      INICIAR_TRANSACCION():
        EJECUTAR "SELECT * FROM citas WHERE id = :id FOR UPDATE;"
        EJECUTAR "UPDATE citas SET estado = 'EN_SALA', hora_checkin = NOW() WHERE id = :id;"
        EJECUTAR "UPDATE pacientes SET sesiones_saldo = sesiones_saldo - 1 WHERE id = :pId;"
      CONFIRMAR_TRANSACCION()
      
      // Bifurcación Concurrente (Fork)
      SPAWN_THREAD: EmitirEventoWebSocket("CAMILLA_OCUPADA", idCita.camillaId)
      SPAWN_THREAD: RegistrarLogAuditoria("CHECKIN_COMPLETADO", idCita)
      
      RETORNAR Respuesta(200, "Check-in exitoso")
    FIN
    ```
  ],
  postcondicion: [
    Cita en estado `EN_SALA`. Camilla bloqueada. Saldo decrementado atómicamente. Evento WebSocket emitido en $< 1$ s.
  ],
  codigo-artefactos-asociados: "API-GW-01, SQL-LOCK-01, WSS-SRV-01",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Especificación del procedimiento atómico orquestado entre el Carril 2 (API Gateway), Carril 3 (Persistencia ACID) y Carril 4 (Tiempo Real).
  ],
)

#v(0.4em)

#strong[ESP-0008]: Sincronización reactiva de estado de camillas

#plantilla_especificacion(
  codigo: "ESP-0008",
  nombre: "Sincronización reactiva de estado de camillas",
  version: "1.0.0",
  fecha: "06/07/2026",
  autor-plantilla: "AUT-0008",
  actor: "ACT-0001",
  fuente: "ENT-0002",
  experto: "Ninguno",
  codigo-ilacion: "ILA-0006",
  precondicion: [
    `WebSocketConnection socket;` \
    `Integer sedeId;`
  ],
  procedimiento: [
    ```
    INICIO BROADCAST_CAMILLA(sedeId, camillaId, nuevoEstado):
      payload = {
        "evento": "CAMBIO_ESTADO_CAMILLA",
        "camilla_id": camillaId,
        "estado": nuevoEstado, // [DISPONIBLE, OCUPADA, EN_DESINFECCION]
        "timestamp": ISO8601_NOW()
      }
      clientesSede = RegistroConexiones.ObtenerPorSede(sedeId)
      PARA CADA socket EN clientesSede HACER:
        IF socket.IsOpen() THEN
          socket.SendAsync(JSON.Serialize(payload))
      FIN PARA
    FIN
    ```
  ],
  postcondicion: [
    Notificación entregada a todas las pantallas activas de la sede con latencia de red verificada $< 1$ segundo.
  ],
  codigo-artefactos-asociados: "WSS-BROADCAST-01, CLIENT-UI-REACT",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Especificación algorítmica del despachador de eventos ejecutado en el Carril 4 (Tiempo Real).
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
  codigo-ilacion: "ILA-0020, ILA-0006, ILA-0017, ILA-0026",
  precondicion: [
    Infraestructura multi-sede interconectada sobre red WAN segura. \
    Servidor de base de datos relacional PostgreSQL con soporte de transacciones ACID y aislamiento Read Committed. \
    Broker de mensajería asíncrona operativo para desacoplamiento de workers.
  ],
  procedimiento: [
    El artefacto formaliza la arquitectura en tiempo de ejecución en dos niveles de descomposición gráfica: \
    - Nivel 1 (Macroscópico): Representación en caja negra de los 6 procesos del sistema operativo y sus canales de comunicación IPC, HTTP REST, WSS y TCP. \
    - Nivel 2 (Concurrencia en Detalle): Descomposición en 5 carriles de actividad (ActivityPartitions) que modela el flujo temporal desde el check-in hasta el cierre de sesión, formalizando dos puntos de bifurcación concurrente (ForkNode 1 y ForkNode 2).
  ],
  postcondicion: [
    Garantía de cumplimiento verificable de tiempos de respuesta: búsqueda <= 500 ms (RNF-0002), check-in <= 3 s (RNF-0002), broadcast de camillas < 1 s (RNF-0006), generación de PDF <= 5 s (RNF-0007) y persistencia inmutable en S3 (RNF-0010).
  ],
  codigo-artefactos-asociados: "P-CLI-01, P-CLI-02, P-SRV-01, P-SRV-02, P-WRK-01, P-DAT-01, S-EXT-01, S-EXT-02, S-EXT-03",
  importancia: "Vital",
  estado: "Concluido",
  comentario: [
    Artefacto de arquitectura de software correspondiente a la Evaluación Continua 2 (Segunda Fase) del curso DAS 2026-B.
  ],
)

#pagebreak(weak: true)

== Diagramas de la Vista de Procesos

=== DIA-PRC-0001: Nivel 1 (Visión general de procesos en tiempo de ejecución)

El diagrama de Nivel 1 expresa la organización general de los procesos del sistema en tiempo de ejecución, delimitando los procesos activos del sistema operativo, sus mecanismos de comunicación interproceso (IPC) y la integración con servicios externos:

#figure(
  diagrama_nivel_1,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_: Diagrama de procesos del sistema OmVital Physio Control (Nivel 1). Vista macroscópica de procesos en tiempo de ejecución, canales de comunicación y servicios externos.],
)

#pagebreak(weak: true)

=== Análisis de procesos, interfaces y protocolos del Nivel 1:

1. *`P-CLI-01` (Terminal Web de Recepción):* Proceso cliente ejecutado en navegadores Chromium sobre laptops de recepción. Consume servicios REST mediante HTTPS para la consulta de pacientes y check-in; mantiene un socket WSS abierto para recibir en tiempo real las novedades del mapa de camillas.
2. *`P-CLI-02` (App Tablet Fisioterapia):* Proceso cliente en dispositivos táctiles Android WebView utilizado por los terapeutas en los cubículos de atención. Envía las notas de evolución clínica y la firma digital vía HTTPS; recibe la asignación de turnos a través del canal WSS.
3. *`P-SRV-01` (API Gateway & Backend Clínico):* Proceso servidor central ejecutado en runtime Node.js/FastAPI. Administra el grupo de hilos de atención HTTP, valida tokens JWT, orquesta transacciones relacionales e implementa un cortacircuitos con temporizador de 3 segundos ante la API financiera externa.
4. *`P-SRV-02` (Motor WebSocket en Tiempo Real):* Proceso demonio especializado en conexiones persistentes dúplex (RFC 6455). Mantiene el registro de sockets activos segmentados por sede clínica y retransmite eventos de ocupación de camillas en menos de 1 segundo (`RNF-0006`).
5. *`P-WRK-01` (Worker de Tareas Asíncronas):* Proceso trabajador desacoplado que consume tareas desde una cola de mensajes. Ejecuta en segundo plano el renderizado de PDFs con firma digital (`RNF-0007`), sube documentos inmutables a AWS S3 (`RNF-0010`) y despacha mensajes a la API de WhatsApp sin penalizar los hilos web de atención al usuario.
6. *`P-DAT-01` (Servidor de Base de Datos PostgreSQL):* Proceso de persistencia relacional que gestiona el grupo de conexiones concurrentes y aplica bloqueos pesimistas de fila para garantizar integridad transaccional ACID en la deducción de sesiones y reserva de camillas.
7. *Servicios Externos (`S-EXT-01`, `S-EXT-02`, `S-EXT-03`):* Pasarela de pagos externa para verificación de saldos, repositorio de objetos en la nube para almacenamiento inmutable y gateway de mensajería de Meta para confirmación de turnos.

#pagebreak(weak: true)

=== DIA-PRC-0001: Nivel 2 (Concurrencia en detalle y descomposición en carriles)

El diagrama de Nivel 2 modela el flujo concurrente y la sincronización temporal del proceso asistencial y de check-in, descomponiendo la ejecución en carriles de responsabilidad y coordinando la atención clínica con las tareas en segundo plano:

#figure(
  diagrama_nivel_2,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_: Diagrama de procesos del sistema OmVital Physio Control (Nivel 2). Descomposición del flujo concurrente en carriles de actividad, sincronización de hilos y procesamiento en segundo plano.],
)

#pagebreak(weak: true)

=== Secuencia analítica de las fases del flujo concurrente:

- *Fase A (Admisión y verificación síncrona):* Inicia en el _Nodo Inicial_ (Carril 1) al ingresar el DNI del paciente. El API Gateway (Carril 2) valida el JWT y consulta la API Financiera (timeout 3 s). Ante saldo insuficiente o expiración, bifurca a notificación de pago en caja y culmina en el nodo final.
- *Fase B (Bifurcación en Check-in y sincronización):* Verificado el saldo, se activa la bifurcación concurrente en tres ramas paralelas: bloqueo de camilla y deducción de sesión en BD (Carril 3, `EDU-0029`), emisión WSS de camilla ocupada (Carril 4, `RNF-0006`) y confirmación HTTP a recepción en $< 500$ ms (Carril 1, `RNF-0002`). Las tres ramas convergen en una barrera de sincronización, garantizando el bloqueo de datos antes de habilitar la atención clínica.
- *Fase C (Atención asistencial y firma digital):* Desde la sincronización, el control transita a la tableta del terapeuta (Carril 1), quien ejecuta la sesión física, registra notas SOAP y captura la firma digital (`EDU-0026`). El payload consolidado se remite al API Gateway (Carril 2).
- *Fase D (Bifurcación en cierre de sesión):* El API Gateway activa la bifurcación paralela, derivando cuatro flujos concurrentes: confirmación inmediata a la tableta liberando la interfaz en $< 500$ ms, actualización del estado a «En Desinfección» en base de datos (Carril 3), difusión vía WebSocket de camilla disponible (Carril 4) y encolamiento asíncrono del comprobante en la cola de trabajadores (Carril 5).
- *Fase E (Pipeline asíncrono en segundo plano):* El worker (Carril 5) compila la constancia PDF en $t <= 5$ s (`RNF-0007`), la persiste con cifrado AES-256 en AWS S3 (`RNF-0010`) y despacha el comprobante por WhatsApp API. El ciclo transaccional culmina formalmente en el _Nodo Final de Actividad_.

#pagebreak(weak: true)

== Matriz de Asignación Proceso-Dispositivo

A continuación se define la matriz de asignación de procesos a dispositivos, estableciendo la correspondencia entre cada proceso e hilo del sistema y el hardware computacional donde se ejecuta (terminales de recepción, tabletas de fisioterapia y servidores en la nube), garantizando la adecuada distribución física y el rendimiento de la plataforma:

#align(center)[
  #set text(size: 8.0pt)
  #table(
    columns: (1.8cm, 2.8cm, 2.2cm, 3.2cm, 2.2cm, 1fr),
    align: (center + horizon, left + horizon, left + horizon, left + horizon, center + horizon, left + horizon),
    table.header(
      [*ID Proceso*], [*Nombre del Proceso*], [*Tipo de Hilo*], [*Entorno de Ejecución*], [*Dispositivo Hardware*], [*Justificación Arquitectónica*]
    ),
    [P-CLI-01], [Terminal Recepción], [UI Thread + WebWorker WSS], [Chromium V8 Engine (React SPA)], [Laptop Recepción (Sedes 1, 2, 3)], [Manejo de interacción directa de check-in y visualización reactiva de camillas.],
    [P-CLI-02], [App Fisioterapia], [UI Thread + Touch Event Loop], [Android WebView / Capacitor], [Tablet Clínica (Cubículos Sede)], [Captura táctil de firma digital y registro de notas SOAP a pie de camilla.],
    [P-SRV-01], [API Gateway Backend], [Event Loop no bloqueante + Worker Pool], [Node.js / FastAPI Runtime en Contenedor Linux], [Servidor Cloud de Aplicaciones], [Gestión centralizada de peticiones HTTP, JWT, ruteo y cortacircuitos.],
    [P-SRV-02], [Servidor WebSocket], [Daemon Asíncrono persistente TCP], [Socket.io / WS Server en Contenedor Linux], [Servidor Cloud en Tiempo Real], [Retención de canales abiertos WSS y difusión con latencia sub-segundo.],
    [P-WRK-01], [Background Workers], [ThreadPool multinúcleo dedicado I/O], [Celery / BullMQ Worker en Contenedor Linux], [Servidor Cloud de Background Workers], [Aislamiento de tareas intensivas de CPU (PDF) y red (S3, WhatsApp).],
    [P-DAT-01], [Servidor Base de Datos], [Procesos backend PostgreSQL + WAL], [PostgreSQL 16 en Instancia Gestionada], [Servidor Cloud de Base de Datos], [Garantía de transacciones ACID, bloqueo pesimista y persistencia inmutable.],
    [S-EXT-01], [API Financiera], [Proceso externo REST], [Infraestructura bancaria / POS de terceros], [Servidor Externo Financiero], [Validación remota de paquetes terapéuticos pagados (timeout 3s).],
    [S-EXT-02], [Almacenamiento S3], [Servicio distribuido de objetos], [AWS S3 Standard Bucket], [Infraestructura Cloud AWS], [Persistencia inmutable de historias clínicas y consentimientos firmados.],
    [S-EXT-03], [Gateway WhatsApp], [API REST en la nube], [Meta Graph API Cloud], [Infraestructura Cloud Meta], [Entrega multicanal de confirmaciones y tickets de atención al paciente.],
  )
]
