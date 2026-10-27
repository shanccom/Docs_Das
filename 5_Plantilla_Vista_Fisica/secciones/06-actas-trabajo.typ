#pagebreak(weak: true)

= Actas de trabajo

== Acta de Trabajo 1

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [12/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Organización del equipo y definición del alcance de la Vista Física: Coordinación del equipo de trabajo y división de tareas para el informe de la Vista Física de OmVital Physio Control según la plantilla y lineamientos del modelo 4+1 de Kruchten.
2. Relevamiento de la infraestructura y hardware de la situación actual: Catalogación de dispositivos existentes en las tres sucursales (laptops de recepción, conectividad a Internet) para el modelado del diagrama inicial D-FIS-001.
3. Identificación y análisis de requisitos no funcionales con impacto físico: Revisión de disponibilidad en la nube (RNF-0001), rendimiento en búsquedas (RNF-0002), firma digital en asistencia (RNF-0003) y camillas en tiempo real (RNF-0006).

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
      Estructura del documento y asignación de roles: Se estructuró el plan de trabajo de la Vista Física. Se designó a Fabiana Pacheco (AUT-0008) y Dolly Mollo (AUT-0006) en la consolidación del inventario de dispositivos, y a Rafael Nina (AUT-0007) y Michael Suclle (AUT-0010) en la redacción técnica, bajo la supervisión de Sergio Hancco (AUT-0004).
    ],
    [2.], [
      Aprobación del Diagrama de Situación Actual (D-FIS-001 v1.0.0): Se definió y aprobó el diagrama D-FIS-001 que ilustra los dispositivos físicos existentes en las tres sucursales y constata la inexistencia de infraestructura centralizada inter-sedes.
    ],
    [3.], [
      Criterios de dimensionamiento de infraestructura: Mathias Barrios (AUT-0001) y Yordano Boza (AUT-0002) establecieron las premisas de cómputo para soportar picos de 25 peticiones por segundo y más de 10 000 expedientes clínicos en la nube.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [40 minutos],
  [*Siguiente reunión:*], [19/10/2026 21:00 p.m.],
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
  [*FECHA:*], [19/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Levantamiento de observaciones del docente orientador: Incorporación de características del Diagrama Lógico dentro del Diagrama de Vista Física, incluyendo la asignación de componentes de software sobre los nodos de hardware y definición de comunicaciones.
2. Corrección y modelado de la topología propuesta (D-FIS-002 v1.1.0): Diseño de la arquitectura cloud multi-sede, balanceador Nginx, contenedores Docker para microservicios y clúster PostgreSQL con réplica de lectura.
3. Protocolos de red y seguridad perimetral: Especificación de canales de comunicación (HTTPS/TLS, WSS para WebSockets, túneles VPN) y aislamiento de la base de datos en subredes privadas.

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
      Corrección e integración lógico-física (v1.1.0): Se modificó el diagrama D-FIS-002 para representar los componentes y artefactos lógicos desplegados en cada nodo (Front-end Web, API Gateway, Servicio de Camillas, Motor SOAP), atendiendo la observación del orientador. Denise Huacani (AUT-0005) y Jeferson Quispe (AUT-0009) actualizaron las fichas técnicas asociadas.
    ],
    [2.], [
      Aprobación de la infraestructura de alta disponibilidad: Se acordó implementar enlaces secundarios LTE para contingencia en cada sucursal y redundancia en la capa de datos para garantizar una disponibilidad del 99.8 % (RNF-0001).
    ],
    [3.], [
      Canales de comunicación segura y tiempo real: Se aprobó el uso del puerto seguro WSS (443) para el monitoreo de camillas en tiempo real (RNF-0006) y almacenamiento de objetos S3 con cifrado inalterable para consentimientos informados (RNF-0010).
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

#pagebreak(weak: true)

== Acta de Trabajo 3

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [26/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Revisión integral y control de calidad (QA): Verificación cruzada entre los diagramas D-FIS-001, D-FIS-002, tablas de adquisición de hardware, especificaciones de red y los requisitos del catálogo (EDU, ILA, RNF).
2. Consolidación de secciones finales del documento: Verificación de conclusiones arquitectónicas, observaciones técnicas, referencias bibliográficas IEEE y ordenamiento de anexos en Typst.
3. Aprobación final y visto bueno de entrega: Evaluación global del informe de la Vista Física por parte del Jefe de Proyecto para autorizar la versión final de entrega.

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
      Aprobación de la Versión Final del Documento: Se revisó y aprobó la entrega definitiva del documento de la Vista Física, comprobando que responde con fidelidad a las especificaciones de infraestructura del sistema OmVital Physio Control.
    ],
    [2.], [
      Certificación de Trazabilidad y Consistencia Técnica: Eduardo Cuno (AUT-0003), en calidad de responsable de QA, certificó la correspondencia entre los componentes de hardware/servidores y los requisitos de educción e ilación (EDU-0025, EDU-0026, EDU-0029, EDU-0032), confirmando cero discrepancias.
    ],
    [3.], [
      Cierre y Otorgamiento del Visto Bueno: Sergio Hancco (AUT-0004), como jefe de proyecto, validó la calidad visual y formal del informe en Typst y otorgó el visto bueno final para su entrega y sustentación.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [35 minutos],
  [*Siguiente reunión:*], [Sustentación y defensa final del proyecto.],
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
