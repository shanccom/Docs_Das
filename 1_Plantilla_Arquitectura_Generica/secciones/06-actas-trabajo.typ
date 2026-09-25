#pagebreak(weak: true)

= Actas de trabajo

== Acta de Trabajo 1

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*FECHA:*], [10/09/2026],
  [*HORA:*], [21:00],
  [*LUGAR:*], [Reunión Virtual #link("https://meet.google.com/xnh-wqha-xeb?hs=224")],
)

=== Agenda

1. Organización y Estructuración de Documentos de Arquitectura: Definición de la estructura de carpetas, nomenclaturas y plantilla oficial para la fase de Diseño y Arquitectura de Software.
2. Elaboración de Diagramas Iniciales del Sistema: El Diagrama de Despliegue (UML), acompañados de sus respectivas Fichas Técnicas.
3. Planificación y Avance del Documento "Arquitectura Genérica": Distribución de secciones para la elaboración del documento borrador marco del sistema OmVital.

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
    [AUT-0001], [Barrios Medina Mathias Alonso], image("../imagenes/firmas/firma-01.png", height: 0.95cm),
    [AUT-0002], [Boza Portilla Yordano Hernan], image("../imagenes/firmas/firma-02.png", height: 0.95cm),
    [AUT-0003], [Cuno Salazar Eduardo Joel], image("../imagenes/firmas/firma-03.png", height: 0.95cm),
    [AUT-0004], [Hancco Mullisaca Sergio Danilo], image("../imagenes/firmas/firma-04.png", height: 0.95cm),
    [AUT-0005], [Huacani Jara Denise Andrea], image("../imagenes/firmas/firma-05.png", height: 0.95cm),
    [AUT-0006], [Mollo Chuquicaña Dolly Yadhira], image("../imagenes/firmas/firma-06.png", height: 0.95cm),
    [AUT-0007], [Nina Calizaya Rafael Diego], image("../imagenes/firmas/firma-07.png", height: 0.95cm),
    [AUT-0008], [Pacheco Palo Fabiana Francinet], image("../imagenes/firmas/firma-08.png", height: 0.95cm),
    [AUT-0009], [Quispe Madariaga Jeferson Jofre], image("../imagenes/firmas/firma-09.png", height: 0.95cm),
    [AUT-0010], [Suclle Suca Michael Benjamin], image("../imagenes/firmas/firma-10.png", height: 0.95cm),
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
      *Organización de la Documentación Técnica:* Se aprobó la estructura de carpetas y la nomenclatura estandarizada para los artefactos de arquitectura (DIA-ARQ-xxxx). Se fijó el uso obligatorio de PlantUML y la incorporación de una Ficha Técnica de Control (propósito, problema que resuelve, versión, justificación y responsabilidades) para cada figura del proyecto.
    ],
    [2.], [
      *Creación de Diagramas Iniciales:* Se elaboraron y aprobaron los dos diagramas base para la arquitectura de OmVital: Diagrama de Contexto (delimita el sistema central frente a los actores ACT-0003 Recepcionista, ACT-0001 Fisioterapeuta, ACT-0004 Traumatólogo y sistemas externos) y Diagrama de Despliegue (UML), que define la topología física de infraestructura (Navegador Cliente, Servidor de Aplicaciones Backend y Servidor de BD Omvital_Db_Pacientes).
    ],
    [3.], [
      *Avance del Documento "Arquitectura Genérica":* Se inició formalmente la redacción del documento borrador "Arquitectura Genérica". Se asignó la consolidación de la vista del entorno a Jeferson (AUT-0009) y Sergio (AUT-0004), acordando que el equipo completo participará en la especificación de restricciones técnicas y patrones de integración.
    ],
  )
]

#v(0.3em)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Duración:*], [35 minutos],
  [*Siguiente reunión:*], [12/09/2026 21:00 p.m.],
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
      #image("../imagenes/firmas/firma-vobo.png", height: 1.35cm) \
      #v(-0.1cm)
      #line(length: 6cm, stroke: 0.5pt + luma(140)) \
      #v(0.12cm)
      #text(weight: "bold", size: 9.5pt)[V° B° Sergio Danilo Hancco Mullisaca] \
      #text(size: 8.5pt, fill: luma(60))[Jefe de Proyecto]
    ]
  ]
]