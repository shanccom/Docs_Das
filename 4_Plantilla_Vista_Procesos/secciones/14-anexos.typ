#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control formal de versiones de los diagramas que conforman la Vista de Procesos del sistema *OmVital Physio Control*. Cada registro contiene la ficha técnica detallada del artefacto: código del diagrama, requisitos no funcionales (RNF) vinculados, contexto/módulo, proceso representado, capas de ejecución, versión, autores, fecha de emisión, justificación técnica, estado de vigencia y códigos de los artefactos del proyecto asociados. 

La versión vigente del sistema corresponde a la _2.0.0_ (_DIA-PRC-0001_), modelada bajo el estándar UML 2.5 en dos niveles de descomposición en capas de ejecución concurrente y desacoplada; la versión previa _1.0.0_ (_DIA-ARQ-0004_) corresponde al diagrama de flujo macroscópico preliminar que definió la línea base de la interacción asistencial.

#v(0.4em)

=== Versión 1.0.0

_*Ficha técnica — DIA-ARQ-0004 (Diagrama de Flujo de Procesos Macroscópico Preliminar)*_

#align(center)[
  #block(width: 95%)[
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [DIA-ARQ-0004],
      [*Requisitos no funcionales*], [RNF-0002 (Tiempo de respuesta $t <= 3$ s), RNF-0006 (Sincronización en tiempo real $< 1$ s), RNF-0007 (Generación asíncrona $t <= 5$ s)],
      [*Contexto / Módulo*], [Módulo de Atención Clínica y Flujo Asistencial Ambulatorio / Flujo General Preliminar de Procesos],
      [*Proceso representado*], [Flujo secuencial macroscópico de la atención del paciente desde su recepción hasta el cierre asistencial: abarca el registro de asistencia en admisión con descuento de sesión (ILA-0020), la asignación de camilla disponible con notificación a sala (ILA-0019) y el registro de la atención terapéutica con notas SOAP, captura de firma digital y emisión de constancia clínica (ILA-0017).],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0001, AUT-0003],
      [*Fecha*], [19/09/2026],
      [*Justificación*], [Permitió establecer la línea base funcional del ciclo de vida del paciente en la clínica, identificando los puntos de interacción secuencial entre los roles operativos antes de la formalización en capas de ejecución concurrentes y desacopladas.],
      [*Estado*], [Superado por v2.0.0],
      [*Código de artefactos*], [EDU-0025, EDU-0026, EDU-0029, EDU-0032, ILA-0017, ILA-0019, ILA-0020],
    )
  ]
]

#v(0.6em)

A continuación se presenta la lámina correspondiente a la versión 1.0.0 preliminar:

#figure(
  image("../imagenes/diagramas/diagrama-procesos-macro-anexo.png", width: 95%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-ARQ-0004_ versión 1.0.0: Diagrama de flujo de procesos macroscópico preliminar que articula la secuencia de las ilaciones ILA-0020, ILA-0019 e ILA-0017.],
)

#pagebreak(weak: true)

=== Versión 2.0.0

_*Ficha técnica — DIA-PRC-0001 (Diagrama de Vista de Procesos en Capas de Ejecución UML 2.5)*_

#align(center)[
  #block(width: 95%)[
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [DIA-PRC-0001],
      [*Requisitos no funcionales*], [RNF-0002 (Rendimiento en validación financiera $t <= 3$ s), RNF-0006 (Sincronización reactiva WebSocket $< 1$ s), RNF-0007 (Liberación de dispositivo $t <= 500$ ms y PDF asíncrono $t <= 5$ s), RNF-0010 (Persistencia inmutable y cifrado AES-256 en AWS S3)],
      [*Contexto / Módulo*], [Módulo de Gestión Clínica y Flujo Asistencial Ambulatorio / Vista de Procesos en Capas de Ejecución (UML 2.5)],
      [*Proceso representado*], [Flujo dinámico, concurrente y desacoplado del ciclo asistencial completo: orquestación de la admisión y check-in con verificación financiera síncrona (ILA-0020); sincronización reactiva dúplex de camillas por WebSockets entre recepción y consultorios (ILA-0019); registro atómico de evolución clínica SOAP y firma biométrica, liberación instantánea de la tableta del terapeuta ($t <= 500$ ms) y delegación asíncrona a colas de workers para compilación de constancia PDF, archivado en la nube y notificación multicanal (ILA-0017).],
      [*Capas de ejecución*], [Presentación, Aplicación, Persistencia, Tiempo Real, Asíncrona e Integración],
      [*Mecanismos de concurrencia*], [Transacciones ACID (Read Committed en PostgreSQL), WebSockets dúplex (RFC 6455), ejecución multihilo paralela y colas de tareas en segundo plano],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0001, AUT-0002, AUT-0003, AUT-0005, AUT-0008],
      [*Fecha*], [22/10/2026],
      [*Justificación*], [Formaliza la arquitectura dinámica en tiempo de ejecución conforme al estándar UML 2.5 y el Modelo 4+1 de Kruchten. Separa explícitamente las responsabilidades mediante capas y carriles de ejecución paralela, resolviendo cuellos de botella en admisión y optimizando la latencia del fisioterapeuta en consultorio mediante procesamiento asíncrono y comunicación reactiva.],
      [*Estado*], [Vigente / Concluido],
      [*Código de artefactos*], [EDU-0025, EDU-0026, EDU-0029, EDU-0032, ILA-0017, ILA-0019, ILA-0020, ILA-0026, ESP-0025, ESP-0027, ESP-0030, ESP-0031],
    )
  ]
]

#v(0.6em)

A continuación se presentan las láminas oficiales que componen la versión vigente 2.0.0:

#figure(
  image("../imagenes/diagramas/diagrama-procesos-nivel-1.png", width: 95%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_ versión 2.0.0: Vista de Procesos Nivel 1 — Visión modular de caja negra de las capas de ejecución del flujo asistencial.],
)

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-nivel-2.png", width: 95%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_ versión 2.0.0: Vista de Procesos Nivel 2 — Descomposición detallada en carriles de ejecución paralela, transaccionalidad y mensajería reactiva.],
)

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-integrado.png", width: 95%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-PRC-0001_ versión 2.0.0: Diagrama de Procesos Integrado — Orquestación global entre actores, capas de servicio y componentes externos.],
)

#pagebreak(weak: true)

== DIA-FLU-0001: Diagrama de Flujo de Procesos (Visión General de Ilaciones)

Este diagrama sintetiza la perspectiva funcional del recorrido del paciente a través de las tres ilaciones troncales del sistema OmVital Physio Control, integrando desde la llegada inicial a recepción hasta el cierre de la atención médica:

#v(0.4em)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-macro-anexo.png", width: 95%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-FLU-0001_: Diagrama de flujo de procesos. Visión general de las ilaciones ILA-0020, ILA-0019 e ILA-0017.],
)

#v(0.6em)

=== Descripción del flujo unificado:

1. *Admisión y Control de Asistencia (`ILA-0020`):*
   La recepcionista registra la llegada del paciente ingresando su DNI. El sistema verifica que cuente con saldo de sesiones ($t <= 3$ s), descuenta la sesión en la base de datos y cambia el estado de la cita a «En Sala». Al completarse, envía la señal para la asignación de camilla.

2. *Organización y Sincronización de Camillas (`ILA-0019`):*
   El sistema asigna una camilla libre y actualiza su estado a «Ocupada». Este cambio se difunde por WebSocket en menos de 1 segundo a las pantallas de recepción y a la tableta del fisioterapeuta en consultorio, habilitando el inicio de la sesión.

3. *Atención Terapéutica y Cierre Clínico (`ILA-0017`):*
   El fisioterapeuta registra la evolución clínica (notas SOAP) y captura la firma digital del paciente. Al guardar, la tableta se libera para el siguiente turno ($t <= 500$ ms), la camilla pasa a estado «En Desinfección» y el sistema genera en segundo plano la constancia en PDF, guardándola en la nube y notificando al paciente por WhatsApp.
