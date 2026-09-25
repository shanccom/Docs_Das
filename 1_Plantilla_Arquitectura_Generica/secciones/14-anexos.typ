// ============================================================
// Sección 14: Anexos — Versionamiento de la arquitectura
// Registra las versiones de los diagramas de la Arquitectura Genérica:
//  - Versión 1.0.0 (D-ARQ-001): Nivel 1 — vista general de fronteras
//  - Versión 1.0.1 (D-DP-001): Nivel 2 — despliegue y acceso multi-sucursal
// ============================================================

#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control de versiones de los diagramas de la Arquitectura Genérica del sistema OMVITAL. Cada versión registra la ficha técnica del diagrama: código, requisitos no funcionales vinculados, contexto/módulo, proceso representado, versión, autor, fecha, justificación, estado y códigos de artefactos asociados. La versión vigente corresponde al conjunto conformado por el _Nivel 1_ (_D-ARQ-001_) y el _Nivel 2_ (_D-DP-001_), construidos a partir de la trazabilidad del catálogo de requisitos del proyecto.

=== Versión 1.0.0

_*Ficha técnica — D-ARQ-001 (Arquitectura Genérica Nivel 1)*_

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
      [*Código del diagrama*], [D-ARQ-001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0006 (Tiempo real)],
      [*Contexto / Módulo*], [Arquitectura Genérica del sistema clínico OmVital — Nivel 1 (visión general de fronteras)],
      [*Proceso representado*], [Interacción y organización general del Sistema Clínico: subsistemas de Pacientes y Administración con acceso a una base de datos compartida, delimitando las fronteras frente a los usuarios internos y los servicios externos.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0006],
      [*Fecha*], [17/09/2026],
      [*Justificación*], [Permite visualizar la organización general del sistema, identificando sus dos subsistemas principales y su base de datos compartida, y sirve como base para los diagramas arquitectónicos posteriores.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#v(0.6em)

El diagrama de Nivel 1 se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1.png", width: 9cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-ARQ-001_ versión 1.0.0: Diagrama de la Arquitectura Genérica — Nivel 1. Organización general del sistema en subsistemas de Pacientes y Administración con base de datos compartida.],
)

#pagebreak(weak: true)

=== Versión 1.0.1

_*Ficha técnica — D-DP-001 (Arquitectura Genérica Nivel 2)*_

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

El diagrama de Nivel 2 se presenta a continuación:

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2.png", width: 13.5cm),
  kind: image,
  supplement: [Figura],
  caption: [_D-DP-001_ versión 1.0.1: Diagrama de la Arquitectura Genérica — Nivel 2. Despliegue y acceso centralizado de las tres sucursales a la información de los pacientes en la nube.],
)

#pagebreak(weak: true)