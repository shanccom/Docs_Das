#pagebreak(weak: true)

= Actas de trabajo

== Acta de Trabajo 1

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [19/09/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Organización del equipo y estructura de la Vista de Procesos: Coordinación inicial del equipo de trabajo y división de tareas para el informe de la Vista de Procesos según la plantilla del curso.
2. Elaboración del Diagrama de Flujo Macroscópico (DIA-ARQ-0004): Definición del primer diagrama borrador que muestre el recorrido del paciente en la clínica OmVital (admisión, sala de espera, camilla y atención).
3. Identificación de los casos y flujos principales: Revisión de las historias de usuario e ilaciones del sistema: control de asistencia (ILA-0020), disponibilidad de camillas (ILA-0019) y registro de la atención (ILA-0017).

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../imagenes/firmas/firma-10.png", height: 0.88cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Estructura del documento y asignación de tareas: Se acordó crear el documento de la Vista de Procesos tomando como base la plantilla del curso. Se designó a Yordano Boza (AUT-0002), Rafael Nina (AUT-0007) y Michael Suclle (AUT-0010) como responsables directos de la redacción técnica, con la supervisión de Sergio Hancco (AUT-0004).
    ],
    [2.], [
      Aprobación del Diagrama Preliminar (v1.0.0): Se elaboró y aprobó el diagrama DIA-ARQ-0004 versión 1.0.0 en PlantUML, que representa de forma secuencial la llegada del paciente a recepción, el descuento de la sesión, la asignación de camilla y la consulta con el fisioterapeuta.
    ],
    [3.], [
      Revisión de requisitos no funcionales: Mathias Barrios (AUT-0001) y Eduardo Cuno (AUT-0003) señalaron la necesidad de considerar los tiempos de respuesta (RNF-0002) y la sincronización de camillas (RNF-0006) en los diagramas posteriores.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [35 minutos],
  [*Siguiente reunión:*], [09/10/2026 21:00 p.m.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 1.5pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*ASISTENCIA*], [*PUNTUALIDAD*], [*RESPONSABILIDAD*], [*COMUNICACIÓN*], [*PUNTAJE \ FINAL*]
    ),
    [AUT-0001], [1], [1], [1], [1], [4],
    [AUT-0002], [1], [1], [1], [1], [4],
    [AUT-0003], [1], [1], [1], [1], [4],
    [AUT-0004], [1], [1], [1], [1], [4],
    [AUT-0005], [1], [1], [1], [1], [4],
    [AUT-0006], [1], [1], [1], [1], [4],
    [AUT-0007], [1], [1], [1], [1], [4],
    [AUT-0008], [1], [1], [1], [1], [4],
    [AUT-0009], [1], [1], [1], [1], [4],
    [AUT-0010], [1], [1], [1], [1], [4],
  )
]

#v(0.3em)
#block(
  fill: luma(250),
  stroke: (left: 2.5pt + luma(90), rest: 0.5pt + luma(190)),
  inset: (x: 8pt, y: 6pt),
  radius: (right: 3pt),
  [
    #set text(size: 8pt)
    #set par(justify: true, leading: 0.55em)
    *NOTA:* La tabla se llena con 1 (Si) y 0 (No). El puntaje final se obtiene sumando todos los valores de la fila y luego se definen las equivalencias de acuerdo a la siguiente relación: 0 corresponde a 0.10, 1 corresponde a 0.25, 2 corresponde a 0.50, 3 corresponde a 0.75, 4 corresponde a 1.00. Estas puntuaciones son incorporados en las notas de los examenes finales.
  ]
)

#v(0.6em)
#align(center)[
  #block(width: 8cm)[
    #align(center)[
      #image("../imagenes/firmas/firma-vobo.jpeg", height: 2.6cm)
      #v(-0.35cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140))
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]

#pagebreak(weak: true)

== Acta de Trabajo 2

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [09/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Revisión de fichas de requerimientos: Incorporación de las tablas de educción (EDU-0025, EDU-0026, EDU-0029, EDU-0032), ilación y especificación funcional en la sección de descripción del artefacto.
2. Modelado de la arquitectura en capas (DIA-PRC-0001): Desarrollo de los diagramas de procesos de Nivel 1 y Nivel 2 en UML 2.5 para reemplazar el diagrama macroscópico previo.
3. Discusión técnica sobre concurrencia y comunicación: Definición del uso de WebSockets para actualizar camillas en tiempo real y transacciones en la base de datos PostgreSQL.

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../imagenes/firmas/firma-10.png", height: 0.88cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Inclusión de las fichas técnicas en el documento: Se completaron y agregaron al documento las fichas de educción, ilación y especificación técnica de los tres flujos principales (check-in, camillas y registro SOAP). Denise Huacani (AUT-0005) y Dolly Mollo (AUT-0006) apoyaron en el formato y revisión de los textos.
    ],
    [2.], [
      Aprobación de los diagramas Nivel 1 y Nivel 2 (v1.1.0): Se acordó separar la vista de procesos en dos niveles de detalle: el Nivel 1 mostrando las capas del sistema (presentación, lógica, datos, tiempo real y workers) y el Nivel 2 detallando la interacción entre hilos y servicios. Con esto se actualiza el artefacto a la versión 1.1.0 (código DIA-PRC-0001).
    ],
    [3.], [
      Manejo de tiempo real: Se acordó representar el uso de WebSockets para que cuando recepción cambie el estado de una camilla a ocupada, la tableta del terapeuta se actualice en menos de 1 segundo (RNF-0006).
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [40 minutos],
  [*Siguiente reunión:*], [20/10/2026 21:00 p.m.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 1.5pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*ASISTENCIA*], [*PUNTUALIDAD*], [*RESPONSABILIDAD*], [*COMUNICACIÓN*], [*PUNTAJE \ FINAL*]
    ),
    [AUT-0001], [1], [1], [1], [1], [4],
    [AUT-0002], [1], [1], [1], [1], [4],
    [AUT-0003], [1], [1], [1], [1], [4],
    [AUT-0004], [1], [1], [1], [1], [4],
    [AUT-0005], [1], [1], [1], [1], [4],
    [AUT-0006], [1], [1], [1], [1], [4],
    [AUT-0007], [1], [1], [1], [1], [4],
    [AUT-0008], [1], [1], [1], [1], [4],
    [AUT-0009], [1], [1], [1], [1], [4],
    [AUT-0010], [1], [1], [1], [1], [4],
  )
]

#v(0.3em)
#block(
  fill: luma(250),
  stroke: (left: 2.5pt + luma(90), rest: 0.5pt + luma(190)),
  inset: (x: 8pt, y: 6pt),
  radius: (right: 3pt),
  [
    #set text(size: 8pt)
    #set par(justify: true, leading: 0.55em)
    *NOTA:* La tabla se llena con 1 (Si) y 0 (No). El puntaje final se obtiene sumando todos los valores de la fila y luego se definen las equivalencias de acuerdo a la siguiente relación: 0 corresponde a 0.10, 1 corresponde a 0.25, 2 corresponde a 0.50, 3 corresponde a 0.75, 4 corresponde a 1.00. Estas puntuaciones son incorporados en las notas de los examenes finales.
  ]
)

#v(0.6em)
#align(center)[
  #block(width: 8cm)[
    #align(center)[
      #image("../imagenes/firmas/firma-vobo.jpeg", height: 2.6cm)
      #v(-0.35cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140))
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]

#pagebreak(weak: true)

== Acta de Trabajo 3

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [20/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Corrección de observaciones y trazabilidad: Revisión de la consistencia entre los códigos del catálogo de requisitos (EDU, ILA, ESP, RNF) y las tablas del documento.
2. Detalle del procesamiento en segundo plano: Modelado del guardado de la constancia de atención, generación de reportes en PDF y envío de mensajes al paciente sin congelar la aplicación móvil.
3. Pruebas de concurrencia y transacciones: Revisión del comportamiento del sistema ante múltiples check-in simultáneos y asignación de camillas en horas punta.

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../imagenes/firmas/firma-10.png", height: 0.88cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Ajuste de tablas y trazabilidad (v1.2.0): Se corrigieron las referencias cruzadas de requisitos en las tablas y se ajustaron los parámetros de entrada y salida de cada proceso según las observaciones del equipo de QA (Eduardo Cuno, AUT-0003).
    ],
    [2.], [
      Desacoplamiento de tareas pesadas: Se acordó que al terminar la sesión clínica, la tableta del terapeuta se desbloquee de inmediato ($t <= 500$ ms) y que la generación del PDF con la firma y su subida a AWS S3 se maneje mediante colas de tareas asíncronas en un plazo menor a 5 segundos (RNF-0007).
    ],
    [3.], [
      Control transaccional en PostgreSQL: Se definió el uso de transacciones con nivel de aislamiento Read Committed para evitar que dos recepcionistas descuenten la misma cita o asignen la misma camilla a la vez.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [35 minutos],
  [*Siguiente reunión:*], [22/10/2026 21:00 p.m.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 1.5pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*ASISTENCIA*], [*PUNTUALIDAD*], [*RESPONSABILIDAD*], [*COMUNICACIÓN*], [*PUNTAJE \ FINAL*]
    ),
    [AUT-0001], [1], [1], [1], [1], [4],
    [AUT-0002], [1], [1], [1], [1], [4],
    [AUT-0003], [1], [1], [1], [1], [4],
    [AUT-0004], [1], [1], [1], [1], [4],
    [AUT-0005], [1], [1], [1], [1], [4],
    [AUT-0006], [1], [1], [1], [1], [4],
    [AUT-0007], [1], [1], [1], [1], [4],
    [AUT-0008], [1], [1], [1], [1], [4],
    [AUT-0009], [1], [1], [1], [1], [4],
    [AUT-0010], [1], [1], [1], [1], [4],
  )
]

#v(0.3em)
#block(
  fill: luma(250),
  stroke: (left: 2.5pt + luma(90), rest: 0.5pt + luma(190)),
  inset: (x: 8pt, y: 6pt),
  radius: (right: 3pt),
  [
    #set text(size: 8pt)
    #set par(justify: true, leading: 0.55em)
    *NOTA:* La tabla se llena con 1 (Si) y 0 (No). El puntaje final se obtiene sumando todos los valores de la fila y luego se definen las equivalencias de acuerdo a la siguiente relación: 0 corresponde a 0.10, 1 corresponde a 0.25, 2 corresponde a 0.50, 3 corresponde a 0.75, 4 corresponde a 1.00. Estas puntuaciones son incorporados en las notas de los examenes finales.
  ]
)

#v(0.6em)
#align(center)[
  #block(width: 8cm)[
    #align(center)[
      #image("../imagenes/firmas/firma-vobo.jpeg", height: 2.6cm)
      #v(-0.35cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140))
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]

#pagebreak(weak: true)

== Acta de Trabajo 4

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [22/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Integración de diagramas específicos y diagrama integrado: Inclusión de los diagramas detallados de ILA-0017, ILA-0019, ILA-0020 y el diagrama integrado de procesos del sistema.
2. Documentación del versionamiento en Anexos: Registro formal de la evolución del artefacto desde la versión 1.0.0 (DIA-ARQ-0004) hasta la versión 2.0.0 (DIA-PRC-0001) y el diagrama de flujo general DIA-FLU-0001.
3. Revisión final y visto bueno del documento: Verificación de conclusiones, observaciones, bibliografía y aprobación final por parte del Jefe de Proyecto.

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../imagenes/firmas/firma-10.png", height: 0.88cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Aprobación de la Versión 2.0.0: Se aprobó la entrega final del documento de la Vista de Procesos en su versión 2.0.0, integrando todos los diagramas específicos de cada ilación y el diagrama general integrado en Typst.
    ],
    [2.], [
      Consolidación de la sección de Anexos: Jeferson Quispe (AUT-0009) y Fabiana Pacheco (AUT-0008) ayudaron a consolidar en los anexos las fichas técnicas de la versión preliminar 1.0.0 (marcada como superada) y de la versión vigente 2.0.0, junto a la figura del flujo macroscópico general DIA-FLU-0001.
    ],
    [3.], [
      Cierre y Visto Bueno: Sergio Hancco (AUT-0004), como jefe de proyecto, revisó el documento completo, validó que cumple con las pautas del modelo 4+1 y otorgó el visto bueno final para su presentación.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [45 minutos],
  [*Siguiente reunión:*], [26/10/2026 21:00 p.m.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(120),
    inset: (x: 1.5pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*ASISTENCIA*], [*PUNTUALIDAD*], [*RESPONSABILIDAD*], [*COMUNICACIÓN*], [*PUNTAJE \ FINAL*]
    ),
    [AUT-0001], [1], [1], [1], [1], [4],
    [AUT-0002], [1], [1], [1], [1], [4],
    [AUT-0003], [1], [1], [1], [1], [4],
    [AUT-0004], [1], [1], [1], [1], [4],
    [AUT-0005], [1], [1], [1], [1], [4],
    [AUT-0006], [1], [1], [1], [1], [4],
    [AUT-0007], [1], [1], [1], [1], [4],
    [AUT-0008], [1], [1], [1], [1], [4],
    [AUT-0009], [1], [1], [1], [1], [4],
    [AUT-0010], [1], [1], [1], [1], [4],
  )
]

#v(0.3em)
#block(
  fill: luma(250),
  stroke: (left: 2.5pt + luma(90), rest: 0.5pt + luma(190)),
  inset: (x: 8pt, y: 6pt),
  radius: (right: 3pt),
  [
    #set text(size: 8pt)
    #set par(justify: true, leading: 0.55em)
    *NOTA:* La tabla se llena con 1 (Si) y 0 (No). El puntaje final se obtiene sumando todos los valores de la fila y luego se definen las equivalencias de acuerdo a la siguiente relación: 0 corresponde a 0.10, 1 corresponde a 0.25, 2 corresponde a 0.50, 3 corresponde a 0.75, 4 corresponde a 1.00. Estas puntuaciones son incorporados en las notas de los examenes finales.
  ]
)

#v(0.6em)
#align(center)[
  #block(width: 8cm)[
    #align(center)[
      #image("../imagenes/firmas/firma-vobo.jpeg", height: 2.6cm)
      #v(-0.35cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140))
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]
