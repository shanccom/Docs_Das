// ============================================================
// DIA-PRC-0001 — Diagrama de Procesos (Nivel 1: Macroscópico)
// Sistema: OmVital Physio Control
// Enfoque: Orquestación de Macro-Procesos en Tiempo de Ejecución
// Metodología: Trazabilidad y Cobertura Directa de ILACIONES (UML 2.5)
// Nota: Vista de Procesos cubre ILACIONES (ILA-0020, ILA-0006, ILA-0017)
// Primitivas vectoriales de Typst
// ============================================================

#let trazo         = 0.75pt
#let trazo-fino    = 0.45pt
#let trazo-grueso  = 1.15pt
#let color-linea   = rgb("#1e293b")
#let color-fondo   = white

// Paleta cromática institucional sobria (Escala de Grises y Slate - Acorde al resto de diagramas)
#let c-p1-bg       = rgb("#f8fafc")
#let c-p1-hdr      = rgb("#f1f5f9")
#let c-p1-br       = rgb("#475569")
#let c-p1-badge    = rgb("#1e293b")

#let c-p2-bg       = rgb("#ffffff")
#let c-p2-hdr      = rgb("#f1f5f9")
#let c-p2-br       = rgb("#334155")
#let c-p2-badge    = rgb("#0f172a")

#let c-p3-bg       = rgb("#f8fafc")
#let c-p3-hdr      = rgb("#f1f5f9")
#let c-p3-br       = rgb("#475569")
#let c-p3-badge    = rgb("#1e293b")

#let c-actor-bg    = rgb("#f8fafc")
#let c-actor-br    = rgb("#334155")
#let c-evt-bg      = rgb("#f1f5f9")
#let c-evt-br      = rgb("#334155")
#let c-loop-br     = rgb("#475569")
#let c-guarda      = rgb("#0f3d75")

// ------------------------------------------------------------
// Primitivas estándar OMG UML 2.5
// ------------------------------------------------------------

// 1. Nodo Inicial (InitialNode: Círculo negro sólido)
#let nodo-inicial(cx, cy, r: 0.12cm) = place(
  dx: cx - r, dy: cy - r,
  circle(radius: r, fill: color-linea, stroke: none),
)

// 2. Nodo Final de Actividad (ActivityFinalNode: Círculo concéntrico)
#let nodo-final(cx, cy, r-ext: 0.17cm, r-int: 0.09cm) = {
  place(dx: cx - r-ext, dy: cy - r-ext, circle(radius: r-ext, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  place(dx: cx - r-int, dy: cy - r-int, circle(radius: r-int, fill: color-linea, stroke: none))
}

// 3. Nodo Final de Flujo (FlowFinalNode: Círculo con X interna - UML 2.5 Cl. 15.3.3.5)
#let nodo-final-flujo(cx, cy, r: 0.12cm) = {
  place(dx: cx - r, dy: cy - r, circle(radius: r, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  let d = r * 0.707
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy - d), end: (cx + d, cy + d), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy + d), end: (cx + d, cy - d), stroke: (paint: color-linea, thickness: trazo)))
}

// 4. Puntas de Flecha UML
#let punta-abajo(x, y, s: 0.075cm, fill: color-linea) = place(
  dx: x - s, dy: y - 2 * s,
  polygon((0cm, 0cm), (2 * s, 0cm), (s, 2 * s), fill: fill, stroke: none),
)
#let punta-arriba(x, y, s: 0.075cm, fill: color-linea) = place(
  dx: x - s, dy: y,
  polygon((0cm, 2 * s), (2 * s, 2 * s), (s, 0cm), fill: fill, stroke: none),
)
#let punta-derecha(x, y, s: 0.075cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.075cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

// 5. Barra de ForkNode / JoinNode UML (Solid bar)
#let barra-sincronizacion(cx, cy, ancho, grosor: 0.09cm, fill: color-linea) = {
  place(
    dx: cx - ancho / 2,
    dy: cy - grosor / 2,
    rect(
      width: ancho,
      height: grosor,
      fill: fill,
      stroke: none,
      radius: 1.2pt,
    )
  )
}

// 6. Nodo de Decisión / Fusión (Rombo UML 2.5)
#let rombo(cx, cy, hw, hh, texto: none, size: 4.8pt) = {
  place(
    dx: cx - hw, dy: cy - hh,
    polygon(
      (hw, 0cm), (2 * hw, hh), (hw, 2 * hh), (0cm, hh),
      fill: white, stroke: (paint: color-linea, thickness: trazo),
    ),
  )
  if texto != none {
    place(
      dx: cx - hw, dy: cy - hh,
      block(
        width: 2 * hw,
        height: 2 * hh,
        inset: (x: 1pt, y: 1pt),
        align(center + horizon, text(size: size, weight: "bold", font: ("Arial", "Segoe UI"), fill: rgb("#0f172a"), texto)),
      )
    )
  }
}

// 7. Guarda UML [Condición]
#let guarda(x, y, txt) = place(
  dx: x, dy: y,
  text(size: 4.6pt, weight: "bold", font: ("Arial", "Segoe UI"), fill: c-guarda, txt)
)

// 8. Nodo de Acción UML (Action: Rectángulo redondeado)
#let accion(cx, cy, ancho, alto, titulo, subtitulo: none, fill: white, stroke: color-linea, size-t: 5.1pt, size-s: 4.2pt) = {
  place(
    dx: cx - ancho / 2,
    dy: cy - alto / 2,
    block(
      width: ancho,
      height: alto,
      inset: (x: 2pt, y: 1pt),
      fill: fill,
      stroke: (paint: stroke, thickness: trazo-fino),
      radius: 3pt,
      align(center + horizon, {
        set text(font: ("Arial", "Segoe UI"), lang: "es")
        set par(leading: 0.30em, spacing: 0pt)
        stack(
          dir: ttb,
          spacing: 1.2pt,
          text(size: size-t, weight: "bold", fill: stroke, titulo),
          if subtitulo != none {
            text(size: size-s, fill: rgb("#475569"), subtitulo)
          }
        )
      })
    )
  )
}

// 9. Nota UML Dog-ear (Alineada a Ilación / Educción)
#let nota-uml(cx, cy, ancho, alto, codigo, desc, tx: none, ty: none) = {
  let fold = 0.11cm
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  let w = ancho
  let h = alto

  place(dx: x0, dy: y0, polygon(
    (0cm, 0cm), (w - fold, 0cm), (w, fold), (w, h), (0cm, h),
    fill: rgb("#f1f5f9"),
    stroke: (paint: rgb("#64748b"), thickness: trazo-fino, dash: "dashed"),
  ))
  place(dx: x0 + w - fold, dy: y0, polygon(
    (0cm, 0cm), (0cm, fold), (fold, fold),
    fill: rgb("#cbd5e1"),
    stroke: (paint: rgb("#64748b"), thickness: trazo-fino),
  ))
  place(dx: x0, dy: y0, block(
    width: w, height: h,
    inset: (x: 3pt, y: 1.5pt),
    align(left + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.28em)
      stack(
        dir: ttb,
        spacing: 1.0pt,
        text(size: 4.8pt, weight: "bold", fill: rgb("#0f172a"), codigo),
        text(size: 4.1pt, fill: rgb("#334155"), desc),
      )
    })
  ))
  if tx != none and ty != none {
    let x_start = if cx < tx { cx + w / 2 } else if cx > tx { cx - w / 2 } else { cx }
    let y_start = if cy < ty { cy + h / 2 } else if cy > ty { cy - h / 2 } else { cy }
    place(dx: 0cm, dy: 0cm, line(
      start: (x_start, y_start),
      end: (tx, ty),
      stroke: (paint: rgb("#64748b"), thickness: trazo-fino, dash: "dashed"),
    ))
  }
}

// 10. Caja de Rol / Actor (Sobria, sin estereotipos innecesarios)
#let caja-actor(cx, cy, ancho, alto, codigo, rol, detalle) = {
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  place(dx: x0, dy: y0, rect(width: ancho, height: alto, fill: c-actor-bg, stroke: (paint: c-actor-br, thickness: trazo), radius: 3pt))
  place(dx: x0, dy: y0, block(
    width: ancho, height: alto,
    inset: (x: 2pt, y: 1.5pt),
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.30em)
      stack(
        dir: ttb,
        spacing: 1.6pt,
        text(size: 5.5pt, weight: "bold", fill: rgb("#0f172a"), [#codigo\ #rol]),
        text(size: 4.3pt, fill: rgb("#475569"), detalle),
      )
    })
  ))
}

// 11. Contenedor de Macro-Proceso (Limpio, con identificador y cobertura de Ilación)
#let contenedor-macro-proceso(x0, y0, ancho, alto, cod-prc, nombre, cod-ila, ref-req, bg-color, hdr-color, br-color, badge-color) = {
  let h_header = 0.48cm
  // Fondo y contorno del macro-proceso
  place(dx: x0, dy: y0, rect(width: ancho, height: alto, fill: bg-color, stroke: (paint: br-color, thickness: trazo), radius: 4pt))
  // Encabezado
  place(dx: x0, dy: y0, block(
    width: ancho, height: h_header,
    fill: hdr-color,
    stroke: (bottom: (paint: br-color, thickness: 0.6pt)),
    inset: (x: 6pt),
    align(left + horizon, {
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #set text(font: ("Arial", "Segoe UI"), lang: "es")
          #text(size: 6.5pt, weight: "bold", fill: rgb("#0f172a"), [#cod-prc: #nombre])
        ],
        [
          #set text(font: ("Arial", "Segoe UI"), lang: "es")
          #grid(
            columns: (auto, auto),
            gutter: 4pt,
            align: horizon,
            rect(
              fill: badge-color,
              radius: 2pt,
              inset: (x: 4.5pt, y: 1.5pt),
              text(size: 5.3pt, weight: "bold", fill: white, cod-ila),
            ),
            text(size: 4.6pt, fill: rgb("#475569"), [(#ref-req)]),
          )
        ]
      )
    })
  ))
}

// 12. Etiqueta / Nodo de Evento Transaccional (Inter-procesos)
#let badge-evento(cx, cy, ancho, alto, cod, texto, fill: c-evt-bg, stroke: c-evt-br) = {
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  place(dx: x0, dy: y0, rect(width: ancho, height: alto, fill: fill, stroke: (paint: stroke, thickness: 0.80pt), radius: 3pt))
  place(dx: x0, dy: y0, block(
    width: ancho, height: alto,
    inset: (x: 4pt, y: 1.5pt),
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.28em)
      stack(
        dir: ttb,
        spacing: 1.0pt,
        text(size: 5.1pt, weight: "bold", fill: stroke, cod),
        text(size: 4.2pt, fill: rgb("#475569"), texto),
      )
    })
  ))
}

// ------------------------------------------------------------
// Diagrama Nivel 1 Exportado (Atomic Box 17.0cm × 16.0cm)
// ------------------------------------------------------------
#let diagrama_nivel_1 = box(
  width: 17.0cm,
  height: 16.0cm,
  fill: white,
  stroke: (paint: rgb("#94a3b8"), thickness: 0.70pt),
  radius: 3pt,
  {
    set text(font: ("Arial", "Segoe UI"), lang: "es")
    set par(leading: 0.40em)

    // ============================================================
    // CAPA 1: ESTRUCTURA, CONTENEDORES Y MARCO
    // ============================================================

    // Encabezado del Marco UML 2.5 (Diagram Frame)
    place(dx: 0cm, dy: 0cm, block(
      height: 0.62cm,
      width: 17.0cm,
      fill: rgb("#f1f5f9"),
      stroke: (bottom: (paint: rgb("#cbd5e1"), thickness: 0.6pt)),
      inset: (x: 8pt),
      align(left + horizon, {
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #text(size: 6.5pt, weight: "bold", fill: rgb("#0f172a"), [DIA-PRC-0001 · Orquestación Macroscópica de Procesos (Nivel 1)])
            #h(4pt)
            #text(size: 5.0pt, fill: rgb("#64748b"), [Vista de Procesos en Tiempo de Ejecución · Cobertura Directa de Ilaciones])
          ],
          [
            #text(size: 5.8pt, weight: "bold", fill: rgb("#475569"), [OmVital Physio Control])
          ]
        )
      })
    ))

    // Coordenadas globales de distribución
    let x_act       = 1.35cm   // Centro columna de actores
    let w_act       = 2.10cm   // Ancho actores
    let h_act       = 1.05cm   // Alto actores

    let x_prc_box   = 2.85cm   // Borde izquierdo contenedores de macro-proceso
    let w_prc_box   = 12.80cm  // Ancho contenedor (de 2.85cm a 15.65cm)

    // Alturas de contenedores
    let y_p1_top    = 0.75cm
    let h_p1_box    = 3.00cm
    let y_p1_bot    = y_p1_top + h_p1_box // 3.75cm
    let y_act1      = y_p1_top + 1.00cm   // 1.75cm

    let y_p2_top    = 5.00cm
    let h_p2_box    = 3.30cm
    let y_p2_bot    = y_p2_top + h_p2_box // 8.30cm

    let y_p3_top    = 9.55cm
    let h_p3_box    = 3.30cm
    let y_p3_bot    = y_p3_top + h_p3_box // 12.85cm
    let y_act2      = y_p3_top + 0.95cm   // 10.50cm

    // Contenedores Macro-Procesos (Fondo y Header)
    contenedor-macro-proceso(
      x_prc_box, y_p1_top, w_prc_box, h_p1_box,
      "PRC-01", "Admisión y Control de Asistencia",
      "ILA-0020", "EDU-0029 · ESP-0030/31",
      c-p1-bg, c-p1-hdr, c-p1-br, c-p1-badge,
    )

    contenedor-macro-proceso(
      x_prc_box, y_p2_top, w_prc_box, h_p2_box,
      "PRC-02", "Sincronización Reactiva de Recursos y Camillas",
      "ILA-0019", "EDU-0026 · ESP-0027",
      c-p2-bg, c-p2-hdr, c-p2-br, c-p2-badge,
    )

    contenedor-macro-proceso(
      x_prc_box, y_p3_top, w_prc_box, h_p3_box,
      "PRC-03", "Cierre Asistencial y Desacoplamiento en Fondo",
      "ILA-0017", "EDU-0025 · ESP-0024/25",
      c-p3-bg, c-p3-hdr, c-p3-br, c-p3-badge,
    )

    // ============================================================
    // CAPA 2: ACTORES, NODOS DE ACTIVIDAD Y BADGES INTERMEDIOS
    // ============================================================

    // --- ACTOR 1: Recepcionista (ACT-0003) ---
    nodo-inicial(x_act, y_p1_top + 0.12cm, r: 0.12cm)
    caja-actor(x_act, y_act1, w_act, h_act, "ACT-0003", "Recepcionista", "Check-in (INT-06)")

    // --- NODOS PRC-01 (Admisión) ---
    let y_p1_row = y_act1              // 1.75cm
    let x_p1_n1  = 4.15cm              // Consultar Cita y DNI
    let x_p1_n2  = 6.85cm              // Verificar Saldo en Caja
    let x_p1_d1  = 8.95cm              // Rombo ¿Pagado?
    let x_p1_n3  = 11.70cm             // Transacción ACID Check-in (Spine central: 11.70cm)
    let y_p1_alt = y_p1_row + 1.00cm   // 2.75cm (Rama No Pagado)
    let x_p1_caja = 8.95cm             // Derivar Pago a Caja

    accion(x_p1_n1, y_p1_row, 2.20cm, 0.60cm, [Consultar Cita y DNI], subtitulo: [Bandeja INT-06 (TABLE_CITAS)], stroke: c-p1-br)
    accion(x_p1_n2, y_p1_row, 2.20cm, 0.60cm, [Verificar Saldo en Caja], subtitulo: [API Finanzas · Timeout 3 s], stroke: c-p1-br)
    rombo(x_p1_d1, y_p1_row, 0.50cm, 0.28cm, texto: [¿Pagado?], size: 4.6pt)
    accion(x_p1_n3, y_p1_row, 2.70cm, 0.62cm, [Transacción ACID Check-in], subtitulo: [Deduce sesión & Cita 'En Sala'], stroke: c-p1-br)

    accion(x_p1_caja, y_p1_alt, 2.20cm, 0.52cm, [Derivar Pago a Caja], subtitulo: [Cierre modal INT-20-BTN-001], stroke: rgb("#475569"))
    nodo-final-flujo(6.85cm, y_p1_alt, r: 0.12cm)

    // Nota ILA-0020 vinculada limpiamente a Consultar Cita y DNI sin cruzar flujos
    nota-uml(
      4.15cm, y_p1_alt, 2.40cm, 0.60cm,
      [ILA-0020: Asistencia],
      [Procedimiento ESP-0030/31. Deducción atómica en BD.],
      tx: 4.15cm, ty: y_p1_row + 0.30cm
    )

    // --- TRANSICIÓN EVT-01 (Entre PRC-01 y PRC-02) ---
    let y_evt1_mid  = (y_p1_bot + y_p2_top) / 2 // 4.375cm
    let h_evt_badge = 0.52cm
    badge-evento(x_p1_n3, y_evt1_mid, 6.20cm, h_evt_badge, "EVT-01: Check-in Exitoso & Solicitud de Camilla", "Disparo reactivo transaccional post-admisión")

    // --- NODOS PRC-02 (Sincronización) ---
    let y_p2_r1  = y_p2_top + 0.80cm // 5.80cm
    let x_p2_n1  = 11.70cm          // Evaluar Camilla (Eje Central Spine: 11.70cm)
    let x_p2_rec = 14.50cm          // Reciclar Camilla (Centro, ancho 1.80cm, span 13.60-15.40cm)
    let y_p2_d1  = y_p2_top + 1.55cm // 6.55cm (Rombo ¿Libre?)
    let x_p2_alt = 8.40cm           // Encolar en Sala de Espera
    let y_p2_fork = y_p2_top + 2.10cm // 7.10cm (ForkNode)
    let w_p2_bar  = 4.60cm
    let y_p2_sync = y_p2_top + 2.55cm // 7.55cm (Broadcasts)
    let x_p2_b1   = 9.80cm           // Broadcast Recepción
    let x_p2_b2   = 13.60cm          // Push Tablet
    let y_p2_join = y_p2_top + 3.00cm // 8.00cm (JoinNode)

    accion(x_p2_n1, y_p2_r1, 3.10cm, 0.58cm, [Evaluar Asignación de Camilla], subtitulo: [Consulta disponibilidad en sede], stroke: c-p2-br)
    accion(x_p2_rec, y_p2_r1, 1.80cm, 0.58cm, [Reciclar Camilla], subtitulo: [Desinfección ➔ Disponible], stroke: c-loop-br, fill: rgb("#f8fafc"))

    // Nota ILA-0006 con conexión exacta al borde izquierdo de Evaluar Camilla (sin penetrar el nodo)
    nota-uml(
      6.20cm, y_p2_r1, 4.60cm, 0.65cm,
      [ILA-0006: Sincronización de Recursos],
      [Canales WSS (RFC 6455). Supervisa Libre ↔ Ocupada ↔ En Desinfección en tiempo real.],
      tx: x_p2_n1 - 1.55cm, ty: y_p2_r1
    )

    rombo(x_p2_n1, y_p2_d1, 0.50cm, 0.28cm, texto: [¿Libre?], size: 4.8pt)
    accion(x_p2_alt, y_p2_d1, 2.60cm, 0.52cm, [Encolar en Sala de Espera], subtitulo: [Notificar demora a Recepción], stroke: rgb("#475569"))
    nodo-final-flujo(6.20cm, y_p2_d1, r: 0.12cm)

    barra-sincronizacion(x_p2_n1, y_p2_fork, w_p2_bar, grosor: 0.09cm, fill: color-linea)
    accion(x_p2_b1, y_p2_sync, 2.90cm, 0.52cm, [Broadcast WSS a Recepción], subtitulo: [Bandeja INT-06 · EDU-0032], stroke: c-p2-br)
    accion(x_p2_b2, y_p2_sync, 2.90cm, 0.52cm, [Push WSS a Tablet Clínica], subtitulo: [Panel Terapeuta · EDU-0026], stroke: c-p2-br)
    barra-sincronizacion(x_p2_n1, y_p2_join, w_p2_bar, grosor: 0.09cm, fill: color-linea)

    // --- TRANSICIÓN EVT-02 y EVT-03 (Entre PRC-02 y PRC-03) ---
    let y_evt2_mid  = (y_p2_bot + y_p3_top) / 2 // 8.925cm
    badge-evento(x_p2_n1, y_evt2_mid, 6.20cm, h_evt_badge, "EVT-02: Camilla Asignada & Paciente en Cubículo", "Telemetría WSS confirmada en Tablet y Recepción")

    let x_loop_track = 16.20cm // Carril lateral derecho dedicado para EVT-03 (dentro del canvas de 17cm)
    badge-evento(x_loop_track, y_evt2_mid, 1.20cm, h_evt_badge, "EVT-03", "Recurso Libre", fill: rgb("#f1f5f9"), stroke: c-loop-br)

    // --- ACTOR 2: Fisioterapeuta (ACT-0001) ---
    caja-actor(x_act, y_act2, w_act, h_act, "ACT-0001", "Fisioterapeuta", "Notas & Firma (INT-17)")

    // --- NODOS PRC-03 (Cierre Asistencial) ---
    let y_p3_row  = y_act2              // 10.50cm
    let x_p3_n1   = 4.15cm              // Registrar Notas SOAP
    let x_p3_n2   = 6.85cm              // Capturar Firma Digital
    let x_p3_d1   = 8.95cm              // Rombo ¿Conforme?
    let x_p3_n3   = 11.70cm             // Consolidar Cierre Clínico (Spine central: 11.70cm)
    let y_p3_alt  = 11.50cm             // Nivel de cancelación y descarte
    let y_p3_fork = y_p3_top + 1.60cm   // 11.15cm (ForkNode)
    let w_p3_fork = 3.00cm              // ForkNode compacto centrado en workers (10.70-13.70cm)
    let y_p3_tasks = y_p3_top + 2.10cm  // 11.65cm (Worker y Dispatcher)
    let x_p3_w    = 10.95cm             // Worker en Fondo
    let x_p3_fb   = 13.45cm             // Disparar Desinfección

    accion(x_p3_n1, y_p3_row, 2.20cm, 0.60cm, [Registrar Notas SOAP], subtitulo: [Campo INT-17-INP-01], stroke: c-p3-br)
    accion(x_p3_n2, y_p3_row, 2.20cm, 0.60cm, [Capturar Firma Digital], subtitulo: [Tableta clínica · INT-17-BTN-01], stroke: c-p3-br)
    rombo(x_p3_d1, y_p3_row, 0.50cm, 0.28cm, texto: [¿Conforme?], size: 4.4pt)
    accion(x_p3_n3, y_p3_row, 2.70cm, 0.62cm, [Consolidar Cierre Clínico], subtitulo: [TABLE_SESION & Estado 'Atendida'], stroke: c-p3-br)

    accion(6.85cm, y_p3_alt, 2.40cm, 0.52cm, [Descartar Edición], subtitulo: [Retorno a INT-18 (Sin cambios)], stroke: rgb("#475569"))
    nodo-final-flujo(4.80cm, y_p3_alt, r: 0.12cm)

    // Nota ILA-0017 vinculada limpiamente a Registrar Notas SOAP sin cruzar flujos
    nota-uml(
      4.15cm, y_p3_alt + 0.75cm, 2.40cm, 0.60cm,
      [ILA-0017: Cierre],
      [Procedimiento ESP-0024/25. Inmutable SOAP y firma.],
      tx: 4.15cm, ty: y_p3_row + 0.30cm
    )

    barra-sincronizacion(12.20cm, y_p3_fork, w_p3_fork, grosor: 0.09cm, fill: color-linea)
    accion(x_p3_w, y_p3_tasks, 2.30cm, 0.54cm, [Worker en Segundo Plano], subtitulo: [PDF Inmutable S3 & WhatsApp], stroke: c-p3-br)
    accion(x_p3_fb, y_p3_tasks, 2.30cm, 0.54cm, [Disparar Desinfección], subtitulo: [Camilla en Desinfección], stroke: c-loop-br, fill: rgb("#f8fafc"))

    // Culminación Global (ActivityFinalNode exterior con salida descriptiva sin colisiones)
    let y_nodo_fin = 13.35cm
    nodo-final(x_p3_w, y_nodo_fin, r-ext: 0.17cm, r-int: 0.09cm)
    place(
      dx: 1.50cm, dy: 13.72cm,
      block(
        width: 14.00cm,
        align(center + horizon, {
          set text(font: ("Arial", "Segoe UI"), lang: "es")
          text(size: 5.1pt, weight: "bold", fill: rgb("#334155"), [Salida: Constancia Médica Digital Archivada en S3 · Ticket WhatsApp Notificado · Camillas Recicladas y Disponibles])
        })
      )
    )

    // ============================================================
    // CAPA 3: FLUJOS, CONECTORES Y FLECHAS (SUPERIOR / TOP LAYER)
    // ============================================================

    // --- Flujos Actor 1 (ACT-0003) -> PRC-01 ---
    place(dx: 0cm, dy: 0cm, line(start: (x_act, y_p1_top + 0.24cm), end: (x_act, y_act1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_act, y_act1 - h_act / 2)

    // Flujo continuo desde Recepcionista hacia Consultar Cita y DNI (trazo directo sin cortes ni solapamientos)
    place(dx: 0cm, dy: 0cm, line(start: (x_act + w_act / 2, y_act1), end: (x_p1_n1 - 1.10cm, y_p1_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p1_n1 - 1.10cm, y_p1_row, fill: color-linea)

    place(dx: 0cm, dy: 0cm, line(start: (x_p1_n1 + 1.10cm, y_p1_row), end: (x_p1_n2 - 1.10cm, y_p1_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p1_n2 - 1.10cm, y_p1_row)

    place(dx: 0cm, dy: 0cm, line(start: (x_p1_n2 + 1.10cm, y_p1_row), end: (x_p1_d1 - 0.50cm, y_p1_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p1_d1 - 0.50cm, y_p1_row)

    // Rama Pagado
    place(dx: 0cm, dy: 0cm, line(start: (x_p1_d1 + 0.50cm, y_p1_row), end: (x_p1_n3 - 1.35cm, y_p1_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p1_n3 - 1.35cm, y_p1_row)
    guarda(x_p1_d1 + 0.50cm, y_p1_row - 0.26cm, [[Pagado]])

    // Rama No Pagado
    place(dx: 0cm, dy: 0cm, line(start: (x_p1_d1, y_p1_row + 0.28cm), end: (x_p1_d1, y_p1_alt - 0.26cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p1_d1, y_p1_alt - 0.26cm)
    guarda(x_p1_d1 + 0.08cm, y_p1_row + 0.38cm, [[No Pagado]])

    place(dx: 0cm, dy: 0cm, line(start: (x_p1_caja - 1.10cm, y_p1_alt), end: (7.00cm, y_p1_alt), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(7.00cm, y_p1_alt)

    // Salida Transacción ACID Check-in hacia EVT-01 (Columna continua y despejada en Spine 11.70cm)
    place(dx: 0cm, dy: 0cm, line(start: (x_p1_n3, y_p1_row + 0.31cm), end: (x_p1_n3, y_evt1_mid - h_evt_badge / 2), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(x_p1_n3, y_evt1_mid - h_evt_badge / 2, fill: color-linea)

    // Flujo EVT-01 -> PRC-02 [Evaluar Asignación de Camilla]
    // (UNA SOLA LÍNEA CONTINUA Y DIRECTA AL NODO, SIN SALTO NI ARROWHEAD INTERMEDIO)
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, y_evt1_mid + h_evt_badge / 2), end: (x_p2_n1, y_p2_r1 - 0.29cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(x_p2_n1, y_p2_r1 - 0.29cm, fill: color-linea)

    // Flujo Reciclar Camilla -> Evaluar Asignación de Camilla
    // Termina exactamente en el borde derecho del nodo (x_p2_n1 + 1.55cm = 13.25cm)
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_rec - 0.90cm, y_p2_r1), end: (x_p2_n1 + 1.55cm, y_p2_r1), stroke: (paint: c-loop-br, thickness: trazo, dash: "dashed")))
    punta-izquierda(x_p2_n1 + 1.55cm, y_p2_r1, fill: c-loop-br)

    // Flujo Evaluar -> Rombo ¿Libre?
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, y_p2_r1 + 0.29cm), end: (x_p2_n1, y_p2_d1 - 0.28cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_n1, y_p2_d1 - 0.28cm)

    // Rama No Disponible
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1 - 0.50cm, y_p2_d1), end: (x_p2_alt + 1.30cm, y_p2_d1), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(x_p2_alt + 1.30cm, y_p2_d1)
    guarda(x_p2_n1 - 1.55cm, y_p2_d1 - 0.26cm, [[No Disponible]])

    place(dx: 0cm, dy: 0cm, line(start: (x_p2_alt - 1.30cm, y_p2_d1), end: (6.35cm, y_p2_d1), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(6.35cm, y_p2_d1)

    // Rama Disponible -> ForkNode
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, y_p2_d1 + 0.28cm), end: (x_p2_n1, y_p2_fork), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_n1, y_p2_fork)
    guarda(x_p2_n1 + 0.08cm, y_p2_d1 + 0.36cm, [[Disponible]])

    // ForkNode -> Ramas Paralelas
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_b1, y_p2_fork + 0.045cm), end: (x_p2_b1, y_p2_sync - 0.26cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_b1, y_p2_sync - 0.26cm)

    place(dx: 0cm, dy: 0cm, line(start: (x_p2_b2, y_p2_fork + 0.045cm), end: (x_p2_b2, y_p2_sync - 0.26cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_b2, y_p2_sync - 0.26cm)

    // Ramas Paralelas -> JoinNode
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_b1, y_p2_sync + 0.26cm), end: (x_p2_b1, y_p2_join - 0.045cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_b1, y_p2_join - 0.045cm)

    place(dx: 0cm, dy: 0cm, line(start: (x_p2_b2, y_p2_sync + 0.26cm), end: (x_p2_b2, y_p2_join - 0.045cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p2_b2, y_p2_join - 0.045cm)

    // Salida JoinNode hacia EVT-02
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, y_p2_join + 0.045cm), end: (x_p2_n1, y_evt2_mid - h_evt_badge / 2), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(x_p2_n1, y_evt2_mid - h_evt_badge / 2, fill: color-linea)

    // Flujo Salida EVT-02 -> Entrada PRC-03
    // Ruteo perimetral limpio por fuera del encabezado para no cortar el título del proceso
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, y_evt2_mid + h_evt_badge / 2), end: (x_p2_n1, 9.25cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    place(dx: 0cm, dy: 0cm, line(start: (x_p2_n1, 9.25cm), end: (2.60cm, 9.25cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    place(dx: 0cm, dy: 0cm, line(start: (2.60cm, 9.25cm), end: (2.60cm, y_act2), stroke: (paint: color-linea, thickness: trazo-grueso)))

    // Flujos Actor 2 (ACT-0001) -> PRC-03 (Línea continua desde el Terapeuta hasta Registrar Notas SOAP)
    place(dx: 0cm, dy: 0cm, line(start: (x_act + w_act / 2, y_act2), end: (x_p3_n1 - 1.10cm, y_p3_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p3_n1 - 1.10cm, y_p3_row, fill: color-linea)

    // Nodo de Unión (T-Junction) donde el evento EVT-02 converge con el flujo de activación del terapeuta
    place(dx: 2.60cm - 0.05cm, dy: y_act2 - 0.05cm, circle(radius: 0.05cm, fill: color-linea, stroke: none))

    // Flujos internos PRC-03
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_n1 + 1.10cm, y_p3_row), end: (x_p3_n2 - 1.10cm, y_p3_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p3_n2 - 1.10cm, y_p3_row)

    place(dx: 0cm, dy: 0cm, line(start: (x_p3_n2 + 1.10cm, y_p3_row), end: (x_p3_d1 - 0.50cm, y_p3_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p3_d1 - 0.50cm, y_p3_row)

    // Rama Confirmar
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_d1 + 0.50cm, y_p3_row), end: (x_p3_n3 - 1.35cm, y_p3_row), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(x_p3_n3 - 1.35cm, y_p3_row)
    guarda(x_p3_d1 + 0.50cm, y_p3_row - 0.26cm, [[Confirmar]])

    // Rama Cancelar
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_d1, y_p3_row + 0.28cm), end: (x_p3_d1, y_p3_alt), stroke: (paint: color-linea, thickness: trazo)))
    guarda(x_p3_d1 + 0.08cm, y_p3_row + 0.38cm, [[Cancelar]])
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_d1, y_p3_alt), end: (8.05cm, y_p3_alt), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(8.05cm, y_p3_alt)

    place(dx: 0cm, dy: 0cm, line(start: (5.65cm, y_p3_alt), end: (4.95cm, y_p3_alt), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(4.95cm, y_p3_alt)

    // Cierre Clínico -> ForkNode
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_n3, y_p3_row + 0.31cm), end: (x_p3_n3, y_p3_fork), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p3_n3, y_p3_fork)

    // ForkNode -> Sub-ramas
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_w, y_p3_fork + 0.045cm), end: (x_p3_w, y_p3_tasks - 0.27cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p3_w, y_p3_tasks - 0.27cm)

    place(dx: 0cm, dy: 0cm, line(start: (x_p3_fb, y_p3_fork + 0.045cm), end: (x_p3_fb, y_p3_tasks - 0.27cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p3_fb, y_p3_tasks - 0.27cm)

    // Culminación Worker en Fondo -> ActivityFinalNode
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_w, y_p3_tasks + 0.27cm), end: (x_p3_w, y_nodo_fin - 0.17cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(x_p3_w, y_nodo_fin - 0.17cm)

    // --- BUCLE DE RETROALIMENTACIÓN EVT-03 ---
    // Salida desde Disparar Desinfección hacia carril exterior
    place(dx: 0cm, dy: 0cm, line(start: (x_p3_fb + 1.15cm, y_p3_tasks), end: (x_loop_track, y_p3_tasks), stroke: (paint: c-loop-br, thickness: trazo, dash: "dashed")))
    // Trayecto vertical hacia EVT-03
    place(dx: 0cm, dy: 0cm, line(start: (x_loop_track, y_p3_tasks), end: (x_loop_track, y_evt2_mid + h_evt_badge / 2), stroke: (paint: c-loop-br, thickness: trazo, dash: "dashed")))
    punta-arriba(x_loop_track, y_evt2_mid + h_evt_badge / 2, fill: c-loop-br)

    // Trayecto vertical desde EVT-03 hacia PRC-02 (Reciclar Camilla)
    place(dx: 0cm, dy: 0cm, line(start: (x_loop_track, y_evt2_mid - h_evt_badge / 2), end: (x_loop_track, y_p2_r1), stroke: (paint: c-loop-br, thickness: trazo, dash: "dashed")))
    // Entrada horizontal hacia Reciclar Camilla (termina exactamente en el borde derecho x_p2_rec + 0.90cm = 15.40cm)
    place(dx: 0cm, dy: 0cm, line(start: (x_loop_track, y_p2_r1), end: (x_p2_rec + 0.90cm, y_p2_r1), stroke: (paint: c-loop-br, thickness: trazo, dash: "dashed")))
    punta-izquierda(x_p2_rec + 0.90cm, y_p2_r1, fill: c-loop-br)

    // ============================================================
    // CAPA 4: LEYENDA TÉCNICA FORMAL
    // ============================================================
    let y_leg = 14.25cm
    place(dx: 0.25cm, dy: y_leg, block(
      width: 16.50cm,
      height: 1.45cm,
      fill: rgb("#f8fafc"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.6pt),
      radius: 3pt,
      inset: (x: 8pt, y: 3.5pt),
      {
        set text(size: 5.0pt, font: ("Arial", "Segoe UI"))
        set par(leading: 0.38em, spacing: 0pt)
        grid(
          columns: (1fr, 1.15fr, 1.25fr),
          gutter: 8pt,
          [
            *Macro-Procesos y Roles:* \
            • #text(weight: "bold", fill: rgb("#0f172a"), [PRC-01, 02, 03]): Macro-procesos en tiempo de ejecución \
            • #text(weight: "bold", fill: c-actor-br, [ACT-0003, 0001]): Roles que operan las interfaces \
            • Rectángulo redondeado: Acción procedural atómica
          ],
          [
            *Nodos de Control y Concurrencia (UML 2.5):* \
            • Rombo con #text(weight: "bold", fill: c-guarda, [[Guarda]]): Decisión condicional \
            • Barra sólida: Bifurcación (#text(weight: "bold")[ForkNode]) / Sincronización (#text(weight: "bold")[JoinNode]) \
            • Círculo con X: Final de flujo alternativo (#text(weight: "bold")[FlowFinalNode])
          ],
          [
            *Eventos y Trazabilidad de Ilaciones:* \
            • #text(weight: "bold", fill: c-p1-badge, [ILA-0020]): Admisión y check-in transaccional \
            • #text(weight: "bold", fill: c-p2-badge, [ILA-0006]): Sincronización reactiva WSS multi-pantalla \
            • #text(weight: "bold", fill: c-p3-badge, [ILA-0017]): Cierre clínico y pipeline en background \
            • #text(weight: "bold", fill: c-loop-br, [Línea discontinua (- - ►)]): Bucle de recursos (#text(weight: "bold")[EVT-03])
          ]
        )
      }
    ))
  }
)
