// ============================================================
// Sección 14: Anexos — Versionamiento de la arquitectura
// Registra las versiones de los diagramas de la Arquitectura Genérica:
//  - D-ARQ-001 (Nivel 1): 1.0.0 (inicial) -> 1.0.1 (vigente)
//  - D-DP-001 (Nivel 2): 1.0.0 (inicial) -> 1.0.1 (vigente)
// ============================================================

#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control de versiones de los diagramas de la Arquitectura Genérica del sistema OMVITAL. Cada diagrama registra una evolución de dos versiones —la versión 1.0.0 (inicial) y la versión 1.0.1 (vigente)— con su ficha técnica correspondiente: código, requisitos no funcionales vinculados, contexto/módulo, proceso representado, versión, autor, fecha, justificación, estado y códigos de artefactos asociados. Se incluyen ambas versiones para conservar la trazabilidad de la evolución del modelado.

=== D-ARQ-001 — Diagrama de la Arquitectura Genérica: Nivel 1

==== Versión 1.0.0 (inicial)

_Ficha técnica — D-ARQ-001, versión 1.0.0_

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
      [*Código del diagrama*], [D-ARQ-001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo*], [Arquitectura Genérica del sistema clínico OmVital — Nivel 1 (visión general de fronteras)],
      [*Proceso representado*], [Primera representación de la organización general del Sistema Clínico: subsistemas de Pacientes y Administración con acceso a una base de datos compartida, delimitando las fronteras frente a los usuarios internos y los servicios externos.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0006],
      [*Fecha*], [16/09/2026],
      [*Justificación*], [Establece la línea base de la organización general del sistema, identificando los dos subsistemas principales y su base de datos compartida, como punto de partida para el refinamiento posterior del diagrama.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 1 en su versión inicial se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1-version-inicial.png", width: 9cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-ARQ-001_ versión 1.0.0 (inicial): Diagrama de la Arquitectura Genérica — Nivel 1. Organización general del sistema en subsistemas de Pacientes y Administración con base de datos compartida.],
)

#pagebreak(weak: true)

==== Versión 1.0.1 (vigente)

_Ficha técnica — D-ARQ-001, versión 1.0.1_

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
      [*Código del diagrama*], [D-ARQ-001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo*], [Arquitectura Genérica del sistema clínico OmVital — Nivel 1 (visión general de fronteras)],
      [*Proceso representado*], [Interacción y organización general del Sistema Clínico: subsistemas de Pacientes y Administración con acceso a una base de datos compartida, delimitando las fronteras frente a los usuarios internos y los servicios externos.],
      [*Versión*], [1.0.1],
      [*Autor*], [AUT-0006],
      [*Fecha*], [17/09/2026],
      [*Justificación*], [Permite visualizar la organización general del sistema, identificando sus dos subsistemas principales y su base de datos compartida, y sirve como base para los diagramas arquitectónicos posteriores.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 1 en su versión vigente se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1.png", width: 9cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-ARQ-001_ versión 1.0.1 (vigente): Diagrama de la Arquitectura Genérica — Nivel 1. Organización general del sistema en subsistemas de Pacientes y Administración con base de datos compartida.],
)

#pagebreak(weak: true)

=== D-DP-001 — Diagrama de la Arquitectura Genérica: Nivel 2

==== Versión 1.0.0 (inicial)

_Ficha técnica — D-DP-001, versión 1.0.0_

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
      [*Código del diagrama*], [D-DP-001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad en la nube), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo*], [Arquitectura genérica del sistema: gestión y consulta de documentos del paciente — Nivel 2 (despliegue y acceso multi-sucursal)],
      [*Proceso representado*], [Primera representación del acceso y actualización centralizada de la información de los pacientes por parte de las tres sucursales mediante un servidor web y una base de datos en la nube.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0004],
      [*Fecha*], [12/09/2026],
      [*Justificación*], [Establece la línea base del despliegue del sistema, representando el acceso de las tres sucursales a la infraestructura centralizada, como punto de partida para el refinamiento posterior del diagrama.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [RNF-0001, EDU-0027],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 2 en su versión inicial se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2-version-inicial.png", width: 13.5cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-DP-001_ versión 1.0.0 (inicial): Diagrama de la Arquitectura Genérica — Nivel 2. Despliegue y acceso centralizado de las tres sucursales a la información de los pacientes en la nube.],
)

#pagebreak(weak: true)

==== Versión 1.0.1 (vigente)

_Ficha técnica — D-DP-001, versión 1.0.1_

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
      [*Código del diagrama*], [D-DP-001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad en la nube), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo*], [Arquitectura genérica del sistema: gestión y consulta de documentos del paciente — Nivel 2 (despliegue y acceso multi-sucursal)],
      [*Proceso representado*], [Acceso y actualización centralizada de la información de los pacientes por parte de las tres sucursales mediante un servidor web y una base de datos en la nube, garantizando la continuidad de la atención entre sedes.],
      [*Versión*], [1.0.1],
      [*Autor*], [AUT-0004],
      [*Fecha*], [13/09/2026],
      [*Justificación*], [Representa la arquitectura propuesta para el acceso desde múltiples sucursales a la infraestructura en la nube, garantizando seguridad en las transmisiones (HTTPS/VPN), alta velocidad de respuesta mediante servicio de caché y soporte a comunicación en tiempo real con WebSockets.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [RNF-0001, EDU-0027],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 2 en su versión vigente se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2.png", width: 13.5cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-DP-001_ versión 1.0.1 (vigente): Diagrama de la Arquitectura Genérica — Nivel 2. Despliegue y acceso centralizado de las tres sucursales a la información de los pacientes en la nube.],
)

#pagebreak(weak: true)