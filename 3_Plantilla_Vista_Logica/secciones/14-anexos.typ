// ============================================================
// Sección 14: Anexos — Versionamiento de la arquitectura
// Registra las versiones de los diagramas de la Vista Lógica:
//  - D-LOG-001 (Nivel 1): 1.0.0 (inicial) -> 1.1.0 (vigente)
//  - D-LOG-002 (Nivel 2): 1.0.0 (inicial) -> 2.0.0 (vigente)
// ============================================================

#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control de versiones de los diagramas de la Vista Lógica del sistema OMVITAL. Cada diagrama registra una evolución de dos versiones —la versión 1.0.0 (inicial) y la versión vigente (1.1.0 para el Nivel 1 y 2.0.0 para el Nivel 2)— con su ficha técnica correspondiente: código, requisitos no funcionales vinculados, contexto/módulo, proceso representado, versión, autor, fecha, justificación, estado y códigos de artefactos asociados. Se incluyen ambas versiones para conservar la trazabilidad de la evolución del modelado.

=== D-LOG-001 — Diagrama de la Vista Lógica: Nivel 1

==== Versión 1.0.0 (inicial)

_Ficha técnica — D-LOG-001, versión 1.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-LOG-001],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007],
      [*Contexto / Módulo*], [Vista Lógica del sistema clínico OmVital — Nivel 1 (paquetes lógicos)],
      [*Proceso representado*], [Primera representación de la organización de los paquetes lógicos del sistema y sus dependencias entre las capas de presentación, negocio, soporte y servicios externos.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0009],
      [*Fecha*], [24/09/2026],
      [*Justificación*], [Establece la línea base de la organización en paquetes del sistema, como punto de partida para el refinamiento posterior del diagrama.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 1 en su versión inicial se presenta a continuación:

#pad(left: -4.8cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-1-1.0.0.png", width: 13cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-001_ versión 1.0.0 (inicial): Diagrama de paquetes lógicos — Nivel 1.],
  )
]

#pagebreak(weak: true)

==== Versión 1.1.0 (vigente)

_Ficha técnica — D-LOG-001, versión 1.1.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-LOG-001],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007],
      [*Contexto / Módulo*], [Vista Lógica del sistema clínico OmVital — Nivel 1 (paquetes lógicos)],
      [*Proceso representado*], [Organización de los paquetes lógicos del sistema (presentación, módulos de negocio, servicios de soporte y servicios externos) y sus dependencias.],
      [*Versión*], [1.1.0],
      [*Autor*], [AUT-0009],
      [*Fecha*], [25/09/2026],
      [*Justificación*], [Delimita los paquetes del sistema y sus dependencias, estableciendo la frontera entre la interfaz de usuario, los módulos de negocio y los servicios externos, en correspondencia con los módulos de la arquitectura genérica.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 1 en su versión vigente se presenta a continuación:

#pad(left: -4.8cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-1-1.1.0.png", width: 15cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-001_ versión 1.1.0 (vigente): Diagrama de paquetes lógicos — Nivel 1.],
  )
]

#pagebreak(weak: true)

=== D-LOG-002 — Diagrama de la Vista Lógica: Nivel 2

==== Versión 1.0.0 (inicial)

_Ficha técnica — D-LOG-002, versión 1.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-LOG-002],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007],
      [*Contexto / Módulo*], [Vista Lógica del sistema clínico OmVital — Nivel 2 (modelo de clases)],
      [*Proceso representado*], [Primera representación del modelo de clases del sistema: clases de dominio, atributos y relaciones principales por módulo.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0005],
      [*Fecha*], [24/09/2026],
      [*Justificación*], [Establece la línea base del modelo de clases, identificando las clases de dominio principales, como punto de partida para el refinamiento posterior.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [ESP-0001 a ESP-0043],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 2 en su versión inicial se presenta a continuación:

#pad(left: -4.8cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-2-1.0.0.png", width: 15cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-002_ versión 1.0.0 (inicial): Diagrama de clases — Nivel 2.],
  )
]

#pagebreak(weak: true)

==== Versión 2.0.0 (vigente)

_Ficha técnica — D-LOG-002, versión 2.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9.5pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-LOG-002],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007],
      [*Contexto / Módulo*], [Vista Lógica del sistema clínico OmVital — Nivel 2 (modelo de clases)],
      [*Proceso representado*], [Modelo de clases del sistema con atributos, métodos, relaciones (asociación, agregación, composición, herencia y dependencia) y enumeraciones de estado por módulo, vinculando los requisitos no funcionales con las clases que los implementan.],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0005],
      [*Fecha*], [25/09/2026],
      [*Justificación*], [Detalla la estructura interna de las clases y sus colaboraciones, sirviendo de base para el diseño detallado y la implementación, y garantizando la trazabilidad con las especificaciones del proyecto.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [ESP-0001 a ESP-0043],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 2 en su versión vigente se presenta a continuación:

#pad(left: -4.8cm)[
  #figure(
    align(center, image("../diagrama/diagrama-logica-nivel-2-2.0.0.png", width: 15cm)),
    kind: image,
    supplement: [Figura],
    caption: [_D-LOG-002_ versión 2.0.0 (vigente): Diagrama de clases — Nivel 2.],
  )
]

#pagebreak(weak: true)