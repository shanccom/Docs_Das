#pagebreak(weak: true)

= Actas de trabajo

== Acta de Trabajo 1

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [28/09/2026],
  [*HORA:*], [20:30],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Planificación del Sprint y Extracción de Requisitos de Infraestructura: Revisión de los RNF (RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010) y módulos de la Arquitectura Genérica (D-DP-001) con impacto en la infraestructura física.
2. Inventario de Dispositivos de la Situación Actual: Relevamiento y catalogación de hardware existente en las tres sucursales de OmVital y conectividad de red.
3. Asignación de Roles y Tareas en Jira: Distribución de actividades de modelado del diagrama D-FIS-001 (situación actual) y análisis de brecha tecnológica.

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-10.png", height: 0.95cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Extracción de Requisitos y Criterios Físicos: Se formalizó la lista de RNF rectores que determinan el despliegue del sistema clínico y se definió la política de centralización de datos en la nube para las tres sedes.
    ],
    [2.], [
      Inventario de Situación Actual: Se consolidó el listado de dispositivos existentes por sucursal (laptops de recepción, equipos de consultorio y conectividad de red) para establecer la línea base de la infraestructura.
    ],
    [3.], [
      Elaboración del Diagrama D-FIS-001: Se asignó a los analistas de requisitos y modeladores la construcción del diagrama de despliegue de la situación actual y la ficha técnica correspondiente.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [35 minutos],
  [*Siguiente reunión:*], [02/10/2026 21:00 p.m.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
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
  fill: rgb("#f8f9fa"),
  stroke: (left: 2.5pt + rgb("#6c757d"), rest: 0.5pt + luma(210)),
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
      #image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-vobo.png", height: 1.35cm) \
      #v(-0.1cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140)) \
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
  [*FECHA:*], [02/10/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Análisis de Brecha y Especificación de Dispositivos a Adquirir/Contratar: Definición de tableta de firma, router con VPN/firewall, enlaces secundarios y servicios cloud (nodos de aplicación, BD con réplica, caché, balanceador y object storage).
2. Modelado del Diagrama D-FIS-002 (Situación Propuesta): Revisión técnica de la topología distribuida multi-sede, organización en capas y comunicación entre nodos/puertos.
3. Integración, QA y Maquetación del Documento en Typst: Verificación cruzada contra D-DP-001 y DIA-CMP-0001, revisión de observaciones y cierre de la versión 1.0.0.

=== Asistencia

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2.9cm, 1fr, 3.2cm),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
    inset: (x: 6pt, y: 3.5pt),
    table.header(
      [*INTEGRANTE*], [*NOMBRES Y APELLIDOS*], [*FIRMA*]
    ),
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-10.png", height: 0.95cm),
  )
]

#pagebreak(weak: true)

=== Acuerdos

#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (1.5cm, 1fr),
    align: (center + horizon, left + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
    inset: (x: 7pt, y: 5.5pt),
    table.header(
      [*ITEMS*], [*ACUERDOS*]
    ),
    [1.], [
      Aprobación del Diagrama D-FIS-002: Se aprobó la topología física propuesta distinguiendo claramente los componentes existentes de los adquiridos/contratados, garantizando alta disponibilidad (RNF-0001) y escalabilidad.
    ],
    [2.], [
      Protocolos de Comunicación y Seguridad: Se definieron las vías de comunicación (HTTPS, WSS, VPN, TCP) y el aislamiento de la base de datos dentro de una red privada sin acceso público directo desde Internet.
    ],
    [3.], [
      Cierre y Validación del Artefacto: El Especialista QA (AUT-0003) y el Arquitecto/Jefe de Proyecto (AUT-0004) validaron la consistencia global del documento y se autorizó la generación de la versión final en Typst.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [40 minutos],
  [*Siguiente reunión:*], [Entrega y presentación final.],
)

=== Calificación

#align(center)[
  #set text(size: 7.5pt)
  #table(
    columns: (2.0cm, 1.9cm, 2.3cm, 2.7cm, 2.4cm, 1.9cm),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.5pt + luma(140),
    fill: (_, y) => if y == 0 { rgb("#f0f4f8") },
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
  fill: rgb("#f8f9fa"),
  stroke: (left: 2.5pt + rgb("#6c757d"), rest: 0.5pt + luma(210)),
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
      #image("../../1_Plantilla_Arquitectura_Generica/imagenes/firmas/firma-vobo.png", height: 1.35cm) \
      #v(-0.1cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140)) \
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]
