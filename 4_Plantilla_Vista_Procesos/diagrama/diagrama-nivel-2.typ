// ============================================================
// DIA-PRC-0001 — Diagrama de Procesos (Nivel 2: Concurrencia en Detalle)
// Sistema: OmVital Physio Control
// Estándar: OMG UML 2.5.1 — ActivityPartitions & Nodos de Control
// Notación: Carriles de Hilos/Procesos, ForkNode, JoinNode, FlowFinalNode
// Primitivas vectoriales de Typst
// ============================================================

#let trazo         = 0.70pt
#let trazo-fino    = 0.45pt
#let trazo-grueso  = 1.10pt
#let color-linea   = rgb("#1e293b")
#let color-fondo   = white
#let color-borde-carril = rgb("#cbd5e1")
#let color-fork    = rgb("#0f172a")
#let color-guarda  = rgb("#1e40af")
#let color-nota-bg = rgb("#fffbeb")
#let color-nota-br = rgb("#d97706")

// ------------------------------------------------------------
// Primitivas estándar OMG UML 2.5.1
// ------------------------------------------------------------

// 1. Nodo Inicial (InitialNode: Círculo negro sólido)
#let nodo-inicial(cx, cy, r: 0.15cm) = place(
  dx: cx - r, dy: cy - r,
  circle(radius: r, fill: color-fork, stroke: none),
)

// 2. Nodo Final de Actividad (ActivityFinalNode: Círculo concéntrico)
#let nodo-final-actividad(cx, cy, r-ext: 0.20cm, r-int: 0.11cm) = {
  place(dx: cx - r-ext, dy: cy - r-ext, circle(radius: r-ext, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  place(dx: cx - r-int, dy: cy - r-int, circle(radius: r-int, fill: color-fork, stroke: none))
}

// 3. Nodo Final de Flujo (FlowFinalNode: Círculo con X interna - UML 2.5.1 Cl. 15.3.3.5)
#let nodo-final-flujo(cx, cy, r: 0.16cm) = {
  place(dx: cx - r, dy: cy - r, circle(radius: r, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  let d = r * 0.707
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy - d), end: (cx + d, cy + d), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy + d), end: (cx + d, cy - d), stroke: (paint: color-linea, thickness: trazo)))
}

// 4. Nodo de Acción UML (Action: Rectángulo redondeado)
#let accion-n2(cx, cy, ancho, alto, texto, fill: white, stroke: color-linea, size: 5.3pt) = {
  place(
    dx: cx - ancho / 2,
    dy: cy - alto / 2,
    block(
      width: ancho,
      height: alto,
      inset: (x: 2.5pt, y: 1.5pt),
      fill: fill,
      stroke: (paint: stroke, thickness: trazo-fino),
      radius: 3pt,
      {
        set text(font: ("Arial", "Segoe UI"), lang: "es")
        set par(leading: 0.44em, spacing: 0pt)
        align(center + horizon, text(size: size, weight: "medium", fill: stroke, texto))
      }
    )
  )
}

// 5. Barra de ForkNode / JoinNode UML (Solid thick bar - UML 2.5.1 Cl. 15.3.4.1/2)
#let barra-sincronizacion(cx, cy, ancho, grosor: 0.11cm) = {
  place(
    dx: cx - ancho / 2,
    dy: cy - grosor / 2,
    rect(
      width: ancho,
      height: grosor,
      fill: color-fork,
      stroke: none,
      radius: 1.5pt,
    )
  )
}

// 6. Nodo de Decisión / Fusión (Rombo UML 2.5.1 Cl. 15.3.4.3)
#let rombo-n2(cx, cy, hw, hh, texto: none, size: 5.2pt) = {
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
        inset: (x: 2pt, y: 1pt),
        align(center + horizon, text(size: size, weight: "bold", font: ("Arial", "Segoe UI"), texto)),
      )
    )
  }
}

// 7. Guarda UML [Condición]
#let guarda(x, y, txt) = place(
  dx: x, dy: y,
  text(size: 5.3pt, weight: "bold", font: ("Arial", "Segoe UI"), fill: color-guarda, txt)
)

// 8. Nota UML 2.5.1 (Dog-ear Note)
#let nota-n2(cx, cy, ancho, alto, cod, desc, tx, ty) = {
  let fold = 0.12cm
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  let w = ancho
  let h = alto

  place(dx: x0, dy: y0, polygon(
    (0cm, 0cm), (w - fold, 0cm), (w, fold), (w, h), (0cm, h),
    fill: color-nota-bg,
    stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed"),
  ))
  place(dx: x0 + w - fold, dy: y0, polygon(
    (0cm, 0cm), (0cm, fold), (fold, fold),
    fill: rgb("#fde68a"),
    stroke: (paint: color-nota-br, thickness: trazo-fino),
  ))
  place(dx: x0, dy: y0, block(
    width: w, height: h,
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.38em)
      stack(
        dir: ttb,
        spacing: 1.8pt,
        text(size: 5.5pt, weight: "bold", fill: rgb("#92400e"), cod),
        if desc != "" {
          text(size: 4.7pt, fill: rgb("#78350f"), desc)
        }
      )
    })
  ))
  // Conector discontinuo sin flecha (UML 2.5.1 Cl. 7.2.4)
  let x_start = if cx < tx { cx + w / 2 } else if cx > tx { cx - w / 2 } else { cx }
  let y_start = if cy < ty { cy + h / 2 } else if cy > ty { cy - h / 2 } else { cy }
  place(dx: 0cm, dy: 0cm, line(
    start: (x_start, y_start),
    end: (tx, ty),
    stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed"),
  ))
}

// 9. Puntas de Flecha
#let punta-abajo(x, y, s: 0.09cm, fill: color-linea) = place(
  dx: x - s, dy: y - 2 * s,
  polygon((0cm, 0cm), (2 * s, 0cm), (s, 2 * s), fill: fill, stroke: none),
)
#let punta-derecha(x, y, s: 0.09cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.09cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

// ------------------------------------------------------------
// Diagrama Nivel 2 Exportado (Atomic Box 17.0cm × 17.2cm)
// ------------------------------------------------------------
#let diagrama_nivel_2 = box(
  width: 17.0cm,
  height: 17.2cm,
  fill: white,
  stroke: (paint: rgb("#94a3b8"), thickness: 0.70pt),
  radius: 3pt,
  {
    set text(font: ("Arial", "Segoe UI"), lang: "es")
    set par(leading: 0.42em)

    // --- Encabezado del Marco UML 2.5.1 (Diagram Frame) ---
    place(dx: 0cm, dy: 0cm, block(
      height: 0.72cm,
      width: 17.0cm,
      fill: rgb("#f1f5f9"),
      stroke: (bottom: (paint: rgb("#cbd5e1"), thickness: 0.6pt)),
      inset: (x: 8pt),
      align(left + horizon, {
        grid(
          columns: (auto, 1fr),
          align: (left + horizon, right + horizon),
          [
            #text(size: 7.2pt, weight: "bold", fill: rgb("#0f172a"), [act DIA-PRC-0001 · Concurrencia de Procesos en Carriles (Nivel 2)])
            #h(8pt)
            #text(size: 5.8pt, fill: rgb("#64748b"), [Flujo Concurrente y Sincronización de Hilos · Nivel 2])
          ],
          [
            #text(size: 5.8pt, weight: "medium", fill: rgb("#475569"), [OmVital Physio Control])
          ]
        )
      })
    ))

    // Geometría de los 5 Carriles de Ejecución (Suma de anchos: 16.60cm)
    let x0 = 0.20cm
    let y_top = 0.75cm
    let h_lane = 14.85cm

    let carriles = (
      ("Carril 1: UI Cliente", "«process» P-CLI-01/02", 3.00cm, rgb("#f8fafc")),
      ("Carril 2: API Gateway", "«process» P-SRV-01", 3.40cm, rgb("#eef2ff")),
      ("Carril 3: Persistencia ACID", "«process» P-DAT-01", 3.10cm, rgb("#f1f5f9")),
      ("Carril 4: Tiempo Real", "«process» P-SRV-02", 3.20cm, rgb("#faf5ff")),
      ("Carril 5: Worker Async", "«process» P-WRK-01", 3.90cm, rgb("#f0fdf4")),
    )

    // Dibujar fondos y encabezados de carriles
    let curr_x = x0
    let centros = ()
    for c in carriles {
      let w = c.at(2)
      let cx = curr_x + w / 2
      centros.push(cx)

      // Fondo del carril
      place(
        dx: curr_x, dy: y_top,
        rect(width: w, height: h_lane, fill: c.at(3), stroke: (paint: color-borde-carril, thickness: 0.40pt))
      )
      // Encabezado del carril
      place(
        dx: curr_x, dy: y_top,
        block(
          width: w, height: 0.58cm,
          fill: rgb("#334155"),
          inset: (x: 2pt),
          align(center + horizon, {
            set text(font: ("Arial", "Segoe UI"), lang: "es")
            stack(
              dir: ttb,
              spacing: 2.0pt,
              text(size: 5.6pt, weight: "bold", fill: white, c.at(0)),
              text(size: 4.6pt, fill: rgb("#cbd5e1"), c.at(1)),
            )
          })
        )
      )
      curr_x += w
    }

    // Coordenadas de centro de cada carril
    let c1 = centros.at(0) // 1.70cm
    let c2 = centros.at(1) // 4.90cm
    let c3 = centros.at(2) // 8.15cm
    let c4 = centros.at(3) // 11.30cm
    let c5 = centros.at(4) // 14.85cm

    let w_box1 = 2.65cm
    let w_box2 = 3.00cm
    let w_box3 = 2.70cm
    let w_box4 = 2.70cm
    let w_box5 = 3.10cm
    let h_act  = 0.56cm

    // ============================================================
    // FASE A: ADMISIÓN Y VERIFICACIÓN SÍNCRONA
    // ============================================================

    // 1. Nodo Inicial en Carril 1
    let y_ini = 1.65cm
    nodo-inicial(c1, y_ini, r: 0.15cm)

    // Nota RNF-0002 en Carril 2 arriba de Action 2 (Conexión vertical directa)
    nota-n2(c2, y_ini, 2.50cm, 0.52cm, "RNF-0002", "DNI <= 500ms · Saldo <= 3s", c2, 2.35cm - h_act / 2)

    // 2. Solicitar Check-in (Carril 1)
    let y_act1 = 2.35cm
    accion-n2(c1, y_act1, w_box1, h_act, "1. Solicitar Check-in\n(Ingreso DNI en INT-06)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_ini + 0.15cm), end: (c1, y_act1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_act1 - h_act / 2)

    // 3. Validar JWT y verificar saldo (Carril 2)
    let y_act2 = 2.35cm
    accion-n2(c2, y_act2, w_box2, h_act, "2. Validar Token JWT y consultar\nsaldo a API Financiera (<= 3s)", fill: rgb("#e0e7ff"), stroke: rgb("#4338ca"))
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w_box1 / 2, y_act1), end: (c2 - w_box2 / 2, y_act2), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w_box2 / 2, y_act2)

    // 4. Rombo de Decisión: ¿Saldo Válido? (Carril 2)
    let y_dec1 = 3.30cm
    rombo-n2(c2, y_dec1, 0.85cm, 0.35cm, texto: "¿Saldo?")
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_act2 + h_act / 2), end: (c2, y_dec1 - 0.35cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c2, y_dec1 - 0.35cm)

    // Rama [No / Timeout] de Decisión 1 -> Notificar caja en Carril 1
    let y_err1 = 3.30cm
    accion-n2(c1, y_err1, w_box1, h_act, "Aviso: 'Pago Pendiente'\nen caja de cobro", fill: rgb("#fff1f2"), stroke: rgb("#e11d48"))
    place(dx: 0cm, dy: 0cm, line(start: (c2 - 0.85cm, y_dec1), end: (c1 + w_box1 / 2, y_err1), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c1 + w_box1 / 2, y_err1)
    guarda(3.10cm, y_dec1 - 0.28cm, "[No/Timeout]")

    // Fin de flujo de error -> ActivityFinalNode
    let y_fin_err = 4.10cm
    nodo-final-actividad(c1, y_fin_err, r-ext: 0.18cm, r-int: 0.10cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_err1 + h_act / 2), end: (c1, y_fin_err - 0.18cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_err - 0.18cm)

    // Rama [Saldo verificado] hacia FORK 1
    let y_fork1 = 4.25cm
    barra-sincronizacion(6.50cm, y_fork1, 10.80cm) // Spans c1 (1.70cm) to c4 (11.30cm)
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_dec1 + 0.35cm), end: (c2, y_fork1 - 0.055cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c2, y_fork1 - 0.055cm)
    guarda(c2 + 0.15cm, y_dec1 + 0.45cm, "[Saldo verificado]")

    // ============================================================
    // FASE B: BIFURCACIÓN CONCURRENTE (FORKNODE 1)
    // ============================================================

    // Rama 1 (Carril 1 - UI): Confirmación recepción
    let y_f1_ui = 5.10cm
    accion-n2(c1, y_f1_ui, w_box1, h_act, "4a. Confirmar ingreso en\nrecepción (<= 500ms)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork1 + 0.055cm), end: (c1, y_f1_ui - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_f1_ui - h_act / 2)

    // Rama 2 (Carril 3 - BD): Bloqueo ACID
    let y_f1_db = 5.10cm
    accion-n2(c3, y_f1_db, w_box3, h_act, "4b. Bloqueo de camilla y\ndeducción de sesión ACID", fill: rgb("#e2e8f0"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_fork1 + 0.055cm), end: (c3, y_f1_db - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c3, y_f1_db - h_act / 2)

    // Rama 3 (Carril 4 - WSS): Difusión tiempo real
    let y_f1_ws = 5.10cm
    accion-n2(c4, y_f1_ws, w_box4, h_act, "4c. Broadcast WSS:\nCamilla 'Ocupada' (< 1s)", fill: rgb("#faf5ff"), stroke: rgb("#7e22ce"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork1 + 0.055cm), end: (c4, y_f1_ws - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_f1_ws - h_act / 2)

    // Nota RNF-0006 en Carril 5 a la altura de Fork 1 (Carril 5 está libre aquí)
    nota-n2(c5, 5.10cm, 2.40cm, 0.65cm, "RNF-0006", "WSS Latencia < 1s", c4 + w_box4 / 2, y_f1_ws)

    // ============================================================
    // SINCRONIZACIÓN DE CHECK-IN (JOINNODE 1) — OMG UML 2.5.1
    // ============================================================
    let y_join1 = 5.95cm
    barra-sincronizacion(6.50cm, y_join1, 10.80cm) // Spans c1 (1.70cm) to c4 (11.30cm)
    // 3 flujos entrantes al JoinNode 1
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_f1_ui + h_act / 2), end: (c1, y_join1 - 0.055cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_join1 - 0.055cm)
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_f1_db + h_act / 2), end: (c3, y_join1 - 0.055cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c3, y_join1 - 0.055cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_f1_ws + h_act / 2), end: (c4, y_join1 - 0.055cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_join1 - 0.055cm)

    // ============================================================
    // FASE C: ATENCIÓN CLÍNICA Y CIERRE CON FIRMA DIGITAL
    // ============================================================

    // 1 flujo saliente de JoinNode 1 hacia Ejecución en Carril 1
    let y_act5 = 6.80cm
    accion-n2(c1, y_act5, w_box1, h_act, "5. Ejecutar sesión física y\ncapturar firma en tablet")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_join1 + 0.055cm), end: (c1, y_act5 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_act5 - h_act / 2)

    // Conector de Carril 1 a Carril 2 (Orquestar Cierre)
    let y_act6 = 6.80cm
    accion-n2(c2, y_act6, w_box2, h_act, "6. Orquestar cierre de sesión\ny payload de notas SOAP", fill: rgb("#e0e7ff"), stroke: rgb("#4338ca"))
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w_box1 / 2, y_act5), end: (c2 - w_box2 / 2, y_act6), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w_box2 / 2, y_act6)

    // ============================================================
    // FASE D: BIFURCACIÓN AL CIERRE (FORKNODE 2)
    // ============================================================
    let y_fork2 = 7.75cm
    barra-sincronizacion(8.25cm, y_fork2, 14.30cm) // Spans c1 (1.70cm) to c5 (14.85cm)
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_act6 + h_act / 2), end: (c2, y_fork2 - 0.055cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c2, y_fork2 - 0.055cm)

    // 4 ramas concurrentes salientes de ForkNode 2:

    // Rama A (Carril 1 - UI): Liberar tablet de inmediato
    let y_f2_ui = 8.60cm
    accion-n2(c1, y_f2_ui, w_box1, h_act, "7a. Confirmar cierre en\ntablet (< 500ms)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork2 + 0.055cm), end: (c1, y_f2_ui - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_f2_ui - h_act / 2)

    // FlowFinalNode de UI en Carril 1 (UML 2.5.1 Cl. 15.3.3.5)
    let y_fin_ui = 9.45cm
    nodo-final-flujo(c1, y_fin_ui, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_f2_ui + h_act / 2), end: (c1, y_fin_ui - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_ui - 0.16cm)

    // Rama B (Carril 3 - BD): Liberar Camilla en BD
    let y_f2_db = 8.60cm
    accion-n2(c3, y_f2_db, w_box3, h_act, "7b. Actualizar estado BD:\n'En Desinfección'", fill: rgb("#e2e8f0"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_fork2 + 0.055cm), end: (c3, y_f2_db - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c3, y_f2_db - h_act / 2)

    // FlowFinalNode de BD en Carril 3 (UML 2.5.1 Cl. 15.3.3.5)
    let y_fin_db = 9.45cm
    nodo-final-flujo(c3, y_fin_db, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_f2_db + h_act / 2), end: (c3, y_fin_db - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c3, y_fin_db - 0.16cm)

    // Rama C (Carril 4 - WSS): Difusión Camilla Liberada
    let y_f2_ws = 8.60cm
    accion-n2(c4, y_f2_ws, w_box4, h_act, "7c. Broadcast WSS:\nCamilla 'Disponible'", fill: rgb("#faf5ff"), stroke: rgb("#7e22ce"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork2 + 0.055cm), end: (c4, y_f2_ws - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_f2_ws - h_act / 2)

    // FlowFinalNode de WSS en Carril 4 (UML 2.5.1 Cl. 15.3.3.5)
    let y_fin_ws = 9.45cm
    nodo-final-flujo(c4, y_fin_ws, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_f2_ws + h_act / 2), end: (c4, y_fin_ws - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_fin_ws - 0.16cm)

    // ============================================================
    // FASE E: PIPELINE ASÍNCRONO EN SEGUNDO PLANO (CARRIL 5)
    // ============================================================

    // Rama D (Carril 5 - Worker): Encolamiento asíncrono
    let y_f2_wrk = 8.60cm
    accion-n2(c5, y_f2_wrk, w_box5, h_act, "7d. Encolar payload en\nQueue de Workers", fill: rgb("#dcfce7"), stroke: rgb("#15803d"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_fork2 + 0.055cm), end: (c5, y_f2_wrk - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_f2_wrk - h_act / 2)

    // 8. Renderizado PDF (Carril 5)
    let y_act8 = 9.85cm
    accion-n2(c5, y_act8, w_box5, h_act, "8. Compilar constancia PDF\ncon firma digital (<= 5s)", fill: rgb("#dcfce7"), stroke: rgb("#15803d"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_f2_wrk + h_act / 2), end: (c5, y_act8 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_act8 - h_act / 2)

    // 9. Persistencia en AWS S3 (Carril 5)
    let y_act9 = 11.05cm
    accion-n2(c5, y_act9, w_box5, h_act, "9. Subir constancia a S3\n(Inmutable AES-256)", fill: rgb("#dcfce7"), stroke: rgb("#15803d"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_act8 + h_act / 2), end: (c5, y_act9 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_act9 - h_act / 2)

    // 10. Despacho WhatsApp API (Carril 5)
    let y_act10 = 12.25cm
    accion-n2(c5, y_act10, w_box5, h_act, "10. Despachar ticket y cita\npor WhatsApp API", fill: rgb("#dcfce7"), stroke: rgb("#15803d"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_act9 + h_act / 2), end: (c5, y_act10 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_act10 - h_act / 2)

    // 11. Nodo Final de Actividad Global (ActivityFinalNode)
    let y_fin_global = 13.35cm
    nodo-final-actividad(c5, y_fin_global, r-ext: 0.22cm, r-int: 0.12cm)
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_act10 + h_act / 2), end: (c5, y_fin_global - 0.22cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_fin_global - 0.22cm)

    // ============================================================
    // NOTAS UML 2.5.1 (Ubicadas en Carril 4 alineadas a Actions 8 y 9)
    // ============================================================
    // RNF-0007 en Carril 4 a la altura exacta de Action 8
    nota-n2(c4, y_act8, 2.40cm, 0.65cm, "RNF-0007", "Render PDF <= 5s", c5 - w_box5 / 2, y_act8)

    // RNF-0010 en Carril 4 a la altura exacta de Action 9
    nota-n2(c4, y_act9, 2.40cm, 0.65cm, "RNF-0010", "S3 Cifrado AES-256", c5 - w_box5 / 2, y_act9)

    // ============================================================
    // LEYENDA FORMAL OMG UML 2.5.1 (Bottom Legend Bar)
    // ============================================================
    place(dx: 0.20cm, dy: 15.65cm, block(
      width: 16.60cm,
      height: 1.35cm,
      fill: rgb("#f8fafc"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.6pt),
      radius: 3pt,
      inset: (x: 10pt, y: 4pt),
      {
        set text(size: 5.4pt, font: ("Arial", "Segoe UI"))
        set par(leading: 0.44em, spacing: 0pt)
        grid(
          columns: (1fr, 1.1fr),
          gutter: 8pt,
          [
            *Nodos de Control de Flujo:* \
            • #text(weight: "bold", fill: color-fork, [●]) Inicio   • #text(weight: "bold", fill: color-fork, [◉]) Fin de actividad   • #text(weight: "bold", fill: color-linea, [(X)]) Fin de hilo local \
            • #text(weight: "bold", fill: color-linea, [◇]) Decisión condicional con guardas #text(weight: "bold", fill: color-guarda, [[Condición]])
          ],
          [
            *Concurrencia y Sincronización:* \
            • #text(weight: "bold", fill: color-fork, [▬]) Barra de bifurcación (Fork) y sincronización (Join) \
            • #text(weight: "bold", fill: color-nota-br, [Nota]): Requisito No Funcional asociado
          ]
        )
      }
    ))
  }
)
