// ============================================================
// Sección 14: Anexos — Versionamiento de la arquitectura
// Registra las versiones de los diagramas de comportamiento:
//  - Versión 1.0.1 (DIA-ARQ-0001): línea base del caso de estudio (C4 Nivel 1, imágenes)
//  - Versión 2.0.0 (DIA-CMP-0001): versión vigente (UML 2.5, diagramas vectoriales N1/N2)
// ============================================================

#import "../diagrama/diagrama-nivel-1.typ": diagrama_nivel_1
#import "../diagrama/diagrama-nivel-2.typ": diagrama_nivel_2

#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control de versiones de los diagramas de comportamiento del sistema OMVITAL. Cada versión registra la ficha técnica del diagrama: código, requisitos no funcionales vinculados, contexto/módulo, proceso representado, versión, autor, fecha, justificación, estado y códigos de artefactos asociados. La versión vigente es la _2.0.0_ (_DIA-CMP-0001_), construida íntegramente con primitivas vectoriales de Typst conforme al estándar UML 2.5; la versión previa _1.0.1_ (_DIA-ARQ-0001_) corresponde a la línea base del caso de estudio, elaborada en formato imagen bajo notación C4 de Nivel 1.

=== Versión 1.0.1

_*Ficha técnica — DIA-ARQ-0001 (Diagrama de Comportamiento C4 Nivel 1)*_

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
      [*Código del diagrama*], [DIA-ARQ-0001],
      [*Requisitos no funcionales*], [RNF-01, RNF-02, RNF-03, RNF-05, RNF-06, RNF-07],
      [*Contexto / Módulo*], [Módulo de Atención Clínica y Flujo Asistencial Ambulatorio / Diagrama de Comportamiento (C4 Nivel 1)],
      [*Proceso representado*], [Flujo dinámico integral de atención ambulatoria del paciente: abarca la admisión y búsqueda con validación de consentimiento informado, el procedimiento de Check-in con verificación síncrona de saldo de sesiones ante la API Financiera, el monitoreo y ocupación de camillas en tiempo real, la ejecución de la terapia física con aplicación de protocolos y detección de banderas rojas clínicas, el registro atómico en la historia clínica y la emisión de constancias certificadas con firma digital y envío multicanal (Correo y WhatsApp).],
      [*Versión*], [1.0.1],
      [*Autor*], [AUT-0003],
      [*Fecha*], [17/09/2026],
      [*Justificación*], [Permite modelar las transiciones de estado, las condiciones de guarda del negocio y la interacción temporal entre los roles del centro (Recepcionista, Paciente, Fisioterapeuta) y los microservicios externos, asegurando que las reglas de contingencia médica y validaciones financieras se ejecuten sin comprometer la consistencia de los datos clínicos.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [DIA-CMP-0001 (vinculado a EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0029, EDU-0031, EDU-0032 y sus respectivas especificaciones ESP-0001 a ESP-0040)],
    )
  ]
]

#v(0.6em)

El diagrama se compone de tres láminas que cubren el flujo ambulatorio completo de la atención del paciente, presentadas a continuación:

#figure(
  align(center, image("../imagenes/diagramas/Diagrama_Comportamiento_P1_1.0.0.png", height: 19cm)),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-ARQ-0001_ versión 1.0.1: Lámina 1 de 3 — admisión y búsqueda del paciente con validación del consentimiento informado y verificación síncrona del saldo de sesiones ante la API Financiera.],
)

#figure(
  align(center, image("../imagenes/diagramas/Diagrama_Comportamiento_P2_1.0.0.png", height: 19cm)),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-ARQ-0001_ versión 1.0.1: Lámina 2 de 3 — monitoreo y ocupación de camillas en tiempo real con ejecución de la terapia física, aplicación de protocolos y detección de banderas rojas clínicas.],
)

#figure(
  align(center, image("../imagenes/diagramas/Diagrama_Comportamiento_P3_1.0.0.png", height: 19cm)),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-ARQ-0001_ versión 1.0.1: Lámina 3 de 3 — registro atómico en la historia clínica y emisión de constancias certificadas con firma digital y envío multicanal (Correo y WhatsApp).],
)

#pagebreak(weak: true)

=== Versión 2.0.0

_*Ficha técnica — DIA-CMP-0001 (Diagrama de Comportamiento UML 2.5, Nivel 1 y Nivel 2)*_

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
      [*Código del diagrama*], [DIA-CMP-0001],
      [*Requisitos no funcionales*], [RNF-0001 (Disponibilidad 99.8%), RNF-0002 (Tiempo de respuesta ≤ 500 ms), RNF-01 (Persistencia / sin borrado físico)],
      [*Contexto / Módulo*], [Módulo de Gestión y Recepción de Pacientes (OMVITAL) / Diagrama de Comportamiento (UML 2.5) — Nivel 1 (visión funcional de caja negra) y Nivel 2 (descomposición en carriles de responsabilidad)],
      [*Proceso representado*], [Flujo de control de identificación, registro y check-in del paciente: solicitud del documento de identidad e ingreso del criterio de búsqueda (INT-02) con validación de precondiciones de sesión, permisos y conexión (ESP-0002); consulta indexada por DNI con filtro de ≥ 3 caracteres y carga de registros recientes (ESP-0003); bifurcación principal según la existencia del paciente en BD con guardas \[Sí\]/\[No\]: por la rama \[Sí\] consulta de ficha y antecedentes con auditoría y emisión de constancia (ESP-0004 / ESP-0005), y por la rama \[No\] registro de nuevo paciente con validaciones estrictas de la fuente FUE-0004 (ESP-0001 / ESP-0002 / FUE-0004); convergencia formal en nodo de fusión (Merge); check-in con verificación síncrona del estado de pago de la cita ante la API (ILA-0020), captura de firma digital, actualización del estado de la cita y anulación de asistencia (ESP-0030 / ESP-0031).],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0003, AUT-0001, AUT-0007],
      [*Fecha*], [21/09/2026],
      [*Justificación*], [Formaliza la secuencia lógica, el flujo de control y las decisiones operativas del módulo mediante el estándar UML 2.5: nodo inicial, nodos de acción, nodos de decisión con guardas \[Sí\]/\[No\], nodo de fusión, notas UML de calidad (RNF) y nodo final de actividad. El Nivel 2 descompone en carriles la interacción entre el actor ACT-0003 (Recepcionista) y el Sistema, incorporando precondiciones, el bucle de validación FUE-0004 y la verificación financiera síncrona, garantizando que las reglas de negocio y las validaciones financieras se ejecuten sin comprometer la consistencia de los datos clínicos.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [DIA-CMP-0001 (definido en diagrama/diagrama-nivel-1.typ y diagrama/diagrama-nivel-2.typ; vinculado a EDU-0001, EDU-0029, ILA-0001, ILA-0002, ILA-0020, ESP-0001, ESP-0002, ESP-0003, ESP-0004, ESP-0005, ESP-0030, ESP-0031)],
    )
  ]
]

#v(0.6em)

La versión vigente abarca las dos vistas de granularidad arquitectónica del artefacto, presentadas a continuación:

#pagebreak(weak: true)

#figure(
  diagrama_nivel_1,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-CMP-0001_ versión 2.0.0: Nivel 1 — visión funcional general de caja negra (UML 2.5). Flujo principal: identificación, registro y check-in del paciente con notas de RNF y atributos de calidad.],
)

#pagebreak(weak: true)

#figure(
  diagrama_nivel_2,
  kind: image,
  supplement: [Figura],
  caption: [_DIA-CMP-0001_ versión 2.0.0: Nivel 2 — descomposición en carriles de responsabilidad (UML 2.5): descomposición de «2. Identificar paciente» (ESP-0003), «4. Consultar / cargar ficha del paciente» (ESP-0004 / ESP-0005), «5. Registrar nuevo paciente» (ESP-0001 / ESP-0002 / FUE-0004) y «6. Iniciar check-in en agenda diaria» (ESP-0030 / ESP-0031), con carriles Recepcionista/Sistema, guardas \[Sí\]/\[No\] y bucle de validación FUE-0004.],
)

#pagebreak(weak: true)