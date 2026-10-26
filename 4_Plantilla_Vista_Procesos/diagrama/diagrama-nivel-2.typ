// ============================================================
// DIA-PRC-0001 — Diagrama de Procesos Integrado del Sistema
// Estándar: OMG UML 2.5.1 (Sección 15.6 ActivityPartitions)
// Matriz Bidimensional de Actividad:
//   - Eje Horizontal (Filas): Ilaciones del Negocio (ILA-0020, ILA-0019, ILA-0017)
//   - Eje Vertical (Columnas): Capas de Ejecución Arquitectónicas
// Gama Tonal: Pizarra / Cool Neutrals (Slate #f8fafc a #0f172a)
// ============================================================

#let trazo         = 0.65pt
#let trazo-fino    = 0.45pt
#let trazo-grueso  = 1.10pt
#let color-linea   = rgb("#1e293b")
#let color-fondo   = white
#let color-borde-carril = rgb("#cbd5e1")
#let color-fork    = rgb("#0f172a")
#let color-guarda  = rgb("#1e293b")

// Primitivas gráficas estándar OMG UML 2.5.1
#let nodo-inicial(cx, cy, r: 0.14cm) = place(
  dx: cx - r, dy: cy - r,
  circle(radius: r, fill: color-fork, stroke: none),
)

#let nodo-final-actividad(cx, cy, r-ext: 0.19cm, r-int: 0.10cm) = {
  place(dx: cx - r-ext, dy: cy - r-ext, circle(radius: r-ext, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  place(dx: cx - r-int, dy: cy - r-int, circle(radius: r-int, fill: color-fork, stroke: none))
}

#let nodo-final-flujo(cx, cy, r: 0.14cm) = {
  place(dx: cx - r, dy: cy - r, circle(radius: r, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  let d = r * 0.707
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy - d), end: (cx + d, cy + d), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy + d), end: (cx + d, cy - d), stroke: (paint: color-linea, thickness: trazo)))
}

#let accion-n2(cx, cy, ancho, alto, texto, fill: white, stroke: color-linea, size: 4.85pt) = {
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
        set par(leading: 0.35em, spacing: 0pt)
        align(center + horizon, text(size: size, weight: "medium", fill: rgb("#0f172a"), texto))
      }
    )
  )
}

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

#let rombo-n2(cx, cy, hw, hh, texto: none, size: 5.0pt) = {
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

#let guarda(x, y, txt) = place(
  dx: x, dy: y,
  text(size: 5.0pt, weight: "bold", font: ("Arial", "Segoe UI"), fill: color-guarda, txt)
)

#let punta-abajo(x, y, s: 0.08cm, fill: color-linea) = place(
  dx: x - s, dy: y - 2 * s,
  polygon((0cm, 0cm), (2 * s, 0cm), (s, 2 * s), fill: fill, stroke: none),
)
#let punta-arriba(x, y, s: 0.08cm, fill: color-linea) = place(
  dx: x - s, dy: y,
  polygon((0cm, 2 * s), (2 * s, 2 * s), (s, 0cm), fill: fill, stroke: none),
)
#let punta-derecha(x, y, s: 0.08cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.08cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

// ------------------------------------------------------------
// Diagrama Exportado: DIA-PRC-0001 (17.0cm × 17.4cm)
// ------------------------------------------------------------
#let diagrama_nivel_2 = box(
  width: 17.0cm,
  height: 17.4cm,
  fill: white,
  stroke: (paint: rgb("#94a3b8"), thickness: 0.70pt),
  radius: 3pt,
  {
    set text(font: ("Arial", "Segoe UI"), lang: "es")
    set par(leading: 0.40em)

    // --- Encabezado del Marco UML 2.5.1 (Diagram Frame) ---
    place(dx: 0cm, dy: 0cm, block(
      height: 0.72cm,
      width: 17.0cm,
      fill: rgb("#f1f5f9"),
      stroke: (bottom: (paint: rgb("#cbd5e1"), thickness: 0.6pt)),
      inset: (x: 8pt),
      align(left + horizon, {
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          stack(
            dir: ttb,
            spacing: 2.2pt,
            text(size: 6.6pt, weight: "bold", fill: rgb("#0f172a"), [act DIA-PRC-0001 · Diagrama de Procesos Integrado del Sistema]),
            text(size: 5.1pt, fill: rgb("#475569"), [Flujo asistencial unificado: ILA-0020, ILA-0019, ILA-0017]),
          ),
          text(size: 5.8pt, weight: "medium", fill: rgb("#334155"), [OmVital Physio Control])
        )
      })
    ))

    // ============================================================
    // GEOMETRÍA DE LA MATRIZ BIDIMENSIONAL
    // ============================================================
    let x0 = 0.20cm
    let y_top = 0.75cm
    let h_lane = 15.15cm
    let h_head = 0.58cm
    let y_content_top = y_top + h_head // 1.33cm

    // Columna 0: Encabezado de Filas (Ilaciones)
    let w_row_hdr = 1.70cm
    let x_layers_start = x0 + w_row_hdr // 1.90cm

    // Columnas 1 a 5: Capas de Ejecución
    let carriles = (
      ("Capa de Presentación", "UI Recepción / Tablet", 2.80cm, rgb("#ffffff")),
      ("Capa de Aplicación", "API Gateway & Servicios", 3.00cm, rgb("#f8fafc")),
      ("Capa de Persistencia", "Motor Relacional PostgreSQL", 2.70cm, rgb("#ffffff")),
      ("Capa de Tiempo Real", "Servidor WebSocket (WSS)", 2.90cm, rgb("#f8fafc")),
      ("Capa Asíncrona", "Workers & Servicios Cloud (S3)", 3.50cm, rgb("#ffffff")),
    )

    // Dibujar encabezado de la Columna de Ilaciones
    place(
      dx: x0, dy: y_top,
      block(
        width: w_row_hdr, height: h_head,
        fill: rgb("#1e293b"),
        inset: (x: 2pt),
        align(center + horizon, {
          stack(
            dir: ttb,
            spacing: 1.8pt,
            text(size: 5.6pt, weight: "bold", fill: white, [Ámbito]),
            text(size: 4.6pt, fill: rgb("#cbd5e1"), [Ilación de Negocio]),
          )
        })
      )
    )

    // Dibujar columnas de Capas
    let curr_x = x_layers_start
    let centros = ()
    for c in carriles {
      let w = c.at(2)
      let cx = curr_x + w / 2
      centros.push(cx)

      place(
        dx: curr_x, dy: y_top,
        rect(width: w, height: h_lane, fill: c.at(3), stroke: (paint: color-borde-carril, thickness: 0.40pt))
      )
      place(
        dx: curr_x, dy: y_top,
        block(
          width: w, height: h_head,
          fill: rgb("#334155"),
          inset: (x: 2pt),
          align(center + horizon, {
            stack(
              dir: ttb,
              spacing: 1.8pt,
              text(size: 5.6pt, weight: "bold", fill: white, c.at(0)),
              text(size: 4.6pt, fill: rgb("#cbd5e1"), c.at(1)),
            )
          })
        )
      )
      curr_x += w
    }

    // Centros de cada capa
    let c1 = centros.at(0) // 3.30cm (Presentación)
    let c2 = centros.at(1) // 6.20cm (Aplicación)
    let c3 = centros.at(2) // 9.05cm (Persistencia)
    let c4 = centros.at(3) // 11.85cm (Tiempo Real)
    let c5 = centros.at(4) // 15.05cm (Asíncrona)

    let w1 = 2.56cm
    let w2 = 2.76cm
    let w3 = 2.52cm
    let w4 = 2.68cm
    let w5 = 3.20cm
    let h_act = 0.58cm

    // ============================================================
    // DEFINICIÓN DE FILAS (PARTICIONES HORIZONTALES DE ILACIÓN)
    // ============================================================
    let y_r1_top = y_content_top // 1.33cm
    let y_r1_bot = 5.20cm
    let h_r1     = y_r1_bot - y_r1_top // 3.87cm

    let y_r2_top = 5.20cm
    let y_r2_bot = 9.20cm
    let h_r2     = y_r2_bot - y_r2_top // 4.00cm

    let y_r3_top = 9.20cm
    let y_r3_bot = y_top + h_lane // 15.90cm
    let h_r3     = y_r3_bot - y_r3_top // 6.70cm

    // --- Tarjeta Lateral Fila 1: ILA-0020 (Gama Pizarra / Slate) ---
    place(
      dx: x0, dy: y_r1_top,
      block(
        width: w_row_hdr, height: h_r1,
        fill: rgb("#f8fafc"),
        stroke: (
          left: (paint: rgb("#334155"), thickness: 2.5pt),
          right: (paint: color-borde-carril, thickness: 0.5pt),
          bottom: (paint: rgb("#94a3b8"), thickness: 0.8pt, dash: "dashed"),
        ),
        inset: (x: 3pt, y: 3pt),
        align(center + horizon, {
          stack(
            dir: ttb,
            spacing: 2.0pt,
            text(size: 6.4pt, weight: "bold", fill: rgb("#0f172a"), [ILA-0020]),
            text(size: 5.3pt, weight: "bold", fill: rgb("#1e293b"), [Control de Asistencia]),
            text(size: 4.6pt, fill: rgb("#475569"), [(Check-in)]),
            v(1pt),
            text(size: 4.3pt, fill: rgb("#64748b"), [EDU-0029 \ ESP-0030/31]),
          )
        })
      )
    )

    // --- Tarjeta Lateral Fila 2: ILA-0019 (Gama Pizarra / Slate) ---
    place(
      dx: x0, dy: y_r2_top,
      block(
        width: w_row_hdr, height: h_r2,
        fill: rgb("#f1f5f9"),
        stroke: (
          left: (paint: rgb("#475569"), thickness: 2.5pt),
          right: (paint: color-borde-carril, thickness: 0.5pt),
          bottom: (paint: rgb("#94a3b8"), thickness: 0.8pt, dash: "dashed"),
        ),
        inset: (x: 3pt, y: 3pt),
        align(center + horizon, {
          stack(
            dir: ttb,
            spacing: 2.0pt,
            text(size: 6.4pt, weight: "bold", fill: rgb("#0f172a"), [ILA-0019]),
            text(size: 5.3pt, weight: "bold", fill: rgb("#1e293b"), [Organización y Camillas]),
            text(size: 4.6pt, fill: rgb("#475569"), [(Sincronización WSS)]),
            v(1pt),
            text(size: 4.3pt, fill: rgb("#64748b"), [EDU-0026 \ ESP-0027/28]),
          )
        })
      )
    )

    // --- Tarjeta Lateral Fila 3: ILA-0017 (Gama Pizarra / Slate) ---
    place(
      dx: x0, dy: y_r3_top,
      block(
        width: w_row_hdr, height: h_r3,
        fill: rgb("#f8fafc"),
        stroke: (
          left: (paint: rgb("#1e293b"), thickness: 2.5pt),
          right: (paint: color-borde-carril, thickness: 0.5pt),
          bottom: (paint: color-borde-carril, thickness: 0.5pt),
        ),
        inset: (x: 3pt, y: 5pt),
        align(center + horizon, {
          stack(
            dir: ttb,
            spacing: 2.2pt,
            text(size: 6.4pt, weight: "bold", fill: rgb("#0f172a"), [ILA-0017]),
            text(size: 5.3pt, weight: "bold", fill: rgb("#1e293b"), [Sesión Terapéutica]),
            text(size: 4.6pt, fill: rgb("#475569"), [(Cierre & Cloud)]),
            v(1pt),
            text(size: 4.3pt, fill: rgb("#64748b"), [EDU-0025 \ ESP-0024/25]),
          )
        })
      )
    )

    // Líneas divisoras horizontales entre Filas cruzando las Capas
    let w_layers_total = 14.90cm
    place(dx: x_layers_start, dy: y_r2_top, line(start: (0cm, 0cm), end: (w_layers_total, 0cm), stroke: (paint: rgb("#94a3b8"), thickness: 0.8pt, dash: "dashed")))
    place(dx: x_layers_start, dy: y_r3_top, line(start: (0cm, 0cm), end: (w_layers_total, 0cm), stroke: (paint: rgb("#94a3b8"), thickness: 0.8pt, dash: "dashed")))

    // Badges identificadores de cada Fila ubicados estratégicamente para no interceptar flujos
    place(dx: 7.70cm, dy: y_r1_top + 0.08cm, block(
      width: 8.80cm, height: 0.30cm,
      fill: rgb("#f1f5f9"),
      stroke: (paint: rgb("#e2e8f0"), thickness: 0.5pt),
      radius: 2pt,
      inset: (x: 5pt),
      align(center + horizon, text(size: 4.8pt, weight: "bold", fill: rgb("#1e293b"), [ILA-0020 — Admisión, Verificación de Pago y Registro Transaccional de Check-in]))
    ))

    place(dx: 7.70cm, dy: y_r2_top + 0.06cm, block(
      width: 8.80cm, height: 0.30cm,
      fill: rgb("#e2e8f0"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.5pt),
      radius: 2pt,
      inset: (x: 5pt),
      align(center + horizon, text(size: 4.8pt, weight: "bold", fill: rgb("#0f172a"), [ILA-0019 — Asignación de Recursos, Persistencia y Telemetría Reactiva WSS (< 1s)]))
    ))

    place(dx: 5.50cm, dy: y_r3_top + 0.06cm, block(
      width: 11.00cm, height: 0.30cm,
      fill: rgb("#f1f5f9"),
      stroke: (paint: rgb("#e2e8f0"), thickness: 0.5pt),
      radius: 2pt,
      inset: (x: 5pt),
      align(center + horizon, text(size: 4.8pt, weight: "bold", fill: rgb("#1e293b"), [ILA-0017 — Registro de Sesión SOAP, Cierre Clínico y Pipeline Documental en Segundo Plano]))
    ))

    // ============================================================
    // NODOS DE FILA 1: ILA-0020 (Admisión y Check-in)
    // ============================================================
    let y_ini = 1.95cm
    nodo-inicial(c1, y_ini)

    let y_1 = 2.45cm
    accion-n2(c1, y_1, w1, h_act, "1. Ingresar DNI y registrar\nllegada del paciente")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_ini + 0.14cm), end: (c1, y_1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_1 - h_act / 2)

    let y_2 = 2.45cm
    accion-n2(c2, y_2, w2, h_act, "2. Validar token y consultar\nsaldo financiero (<= 3s)")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_1), end: (c2 - w2 / 2, y_2), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_2)

    let y_dec1 = 3.25cm
    rombo-n2(c2, y_dec1, 0.85cm, 0.30cm, texto: "¿Saldo?")
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_2 + h_act / 2), end: (c2, y_dec1 - 0.30cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c2, y_dec1 - 0.30cm)

    // Rama No/Timeout -> Caja
    let y_err1 = 3.25cm
    accion-n2(c1, y_err1, w1, h_act, "Notificar saldo pendiente\ny derivar paciente a caja", fill: white, stroke: rgb("#475569"))
    place(dx: 0cm, dy: 0cm, line(start: (c2 - 0.85cm, y_dec1), end: (c1 + w1 / 2, y_err1), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c1 + w1 / 2, y_err1)
    guarda(4.60cm, y_dec1 - 0.28cm, "[No/Timeout]")

    let y_fin_err = 3.85cm
    nodo-final-flujo(c1, y_fin_err, r: 0.14cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_err1 + h_act / 2), end: (c1, y_fin_err - 0.14cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_err - 0.14cm)

    // Rama Saldo verificado -> Persistencia en BD
    let y_3 = 4.05cm
    accion-n2(c3, y_3, w3, h_act, "3. Bloquear cita y deducir\nsesión en BD (ACID)", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_dec1 + 0.30cm), end: (c2, y_3), stroke: (paint: color-linea, thickness: trazo-grueso)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_3), end: (c3 - w3 / 2, y_3), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-derecha(c3 - w3 / 2, y_3)
    guarda(c2 + 0.10cm, y_dec1 + 0.45cm, "[Saldo verificado]")

    // Retorno obligatorio de BD a Aplicación
    let y_4 = 4.75cm
    accion-n2(c2, y_4, w2, h_act, "4. Confirmar transacción ACID\ny comisionar asignación")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_3 + h_act / 2), end: (c3, y_4), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_4), end: (c2 + w2 / 2, y_4), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_4)

    // ============================================================
    // TRANSICIÓN Y NODOS DE FILA 2: ILA-0019 (Organización y Camillas)
    // ============================================================
    // Transición directa de Aplicación hacia Fila 2
    let y_5 = 5.80cm
    accion-n2(c2, y_5, w2, h_act, "5. Asignar camilla disponible\ny turno en agenda")
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_4 + h_act / 2), end: (c2, y_5 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c2, y_5 - h_act / 2)

    // 6. Persistir camilla y turno en BD (Persistencia)
    let y_6 = 6.50cm
    accion-n2(c3, y_6, w3, h_act, "6. Registrar en BD:\nCamilla 'Ocupada' y turno", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_5 + h_act / 2), end: (c2, y_6), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_6), end: (c3 - w3 / 2, y_6), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_6)

    // 7. Retorno obligatorio de BD a Aplicación
    let y_7 = 7.20cm
    accion-n2(c2, y_7, w2, h_act, "7. Confirmar asignación en BD\ny autorizar difusión")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_6 + h_act / 2), end: (c3, y_7), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_7), end: (c2 + w2 / 2, y_7), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_7)
    guarda(7.75cm, y_7 - 0.20cm, "[Turno persistido]")

    // Bifurcación FORKNODE 1 (Disparo reactivo en ILA-0019)
    let y_fork1 = 7.75cm
    let x_fork1_center = (c1 + c4) / 2 // 7.575cm
    let w_fork1 = (c4 - c1) + 0.80cm   // 9.35cm
    barra-sincronizacion(x_fork1_center, y_fork1, w_fork1)
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_7 + h_act / 2), end: (c2, y_fork1 - 0.055cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c2, y_fork1 - 0.055cm)

    // Rama 8a: Cargar turno y desplegar en tableta del fisioterapeuta
    let y_8a = 8.40cm
    accion-n2(c1, y_8a, w1, h_act, "8a. Cargar turno y paciente\nen tableta (< 500ms)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork1 + 0.055cm), end: (c1, y_8a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_8a - h_act / 2)

    // Rama 8b: Broadcast Tiempo Real WSS a pantallas de sede
    let y_8b = 8.40cm
    accion-n2(c4, y_8b, w4, h_act, "8b. Transmitir por WSS:\nCamilla 'Ocupada' (< 1s)")
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork1 + 0.055cm), end: (c4, y_8b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_8b - h_act / 2)

    let y_fin_wss1 = 9.00cm
    nodo-final-flujo(c4, y_fin_wss1, r: 0.14cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_8b + h_act / 2), end: (c4, y_fin_wss1 - 0.14cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_fin_wss1 - 0.14cm)

    // ============================================================
    // TRANSICIÓN Y NODOS DE FILA 3: ILA-0017 (Sesión Terapéutica y Cierre)
    // ============================================================
    // Transición directa desde la tableta cargada (8a) hacia la sesión clínica (9)
    let y_9 = 9.85cm
    accion-n2(c1, y_9, w1, h_act, "9. Ejecutar sesión clínica y\ncapturar firma digital")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_8a + h_act / 2), end: (c1, y_9 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_9 - h_act / 2)

    let y_10 = 9.85cm
    accion-n2(c2, y_10, w2, h_act, "10. Consolidar notas SOAP\ny emitir cierre de sesión")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_9), end: (c2 - w2 / 2, y_10), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_10)

    let y_11 = 10.55cm
    accion-n2(c3, y_11, w3, h_act, "11. Registrar evolución y\nmarcar 'En Desinfección'", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_10 + h_act / 2), end: (c2, y_11), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_11), end: (c3 - w3 / 2, y_11), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_11)

    // Retorno obligatorio de BD a Aplicación
    let y_12 = 11.25cm
    accion-n2(c2, y_12, w2, h_act, "12. Confirmar registro en BD\ny autorizar bifurcación")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_11 + h_act / 2), end: (c3, y_12), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_12), end: (c2 + w2 / 2, y_12), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_12)
    guarda(7.75cm, y_12 - 0.20cm, "[Evolución persistida]")

    // BIFURCACIÓN FORKNODE 2 (Disparo tripartito de cierre)
    let y_fork2 = 11.85cm
    let x_fork2_center = (c1 + c5) / 2 // 9.175cm
    let w_fork2 = (c5 - c1) + 0.80cm   // 12.55cm
    barra-sincronizacion(x_fork2_center, y_fork2, w_fork2)
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_12 + h_act / 2), end: (c2, y_fork2 - 0.055cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c2, y_fork2 - 0.055cm)

    // Rama 13a: Liberar tableta en Presentación
    let y_13a = 12.50cm
    accion-n2(c1, y_13a, w1, h_act, "13a. Confirmar cierre y\nliberar tableta (< 500ms)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork2 + 0.055cm), end: (c1, y_13a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_13a - h_act / 2)

    let y_fin_ui = 13.15cm
    nodo-final-flujo(c1, y_fin_ui, r: 0.14cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_13a + h_act / 2), end: (c1, y_fin_ui - 0.14cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_ui - 0.14cm)

    // Rama 13b: Transmitir Camilla Disponible en Tiempo Real
    let y_13b = 12.50cm
    accion-n2(c4, y_13b, w4, h_act, "13b. Transmitir por WSS:\nCamilla 'Disponible'")
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork2 + 0.055cm), end: (c4, y_13b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_13b - h_act / 2)

    let y_fin_ws = 13.15cm
    nodo-final-flujo(c4, y_fin_ws, r: 0.14cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_13b + h_act / 2), end: (c4, y_fin_ws - 0.14cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_fin_ws - 0.14cm)

    // Rama 13c: Encolar tarea en Asíncrono
    let y_13c = 12.50cm
    accion-n2(c5, y_13c, w5, h_act, "13c. Encolar tarea en broker\nde procesamiento asíncrono", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_fork2 + 0.055cm), end: (c5, y_13c - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_13c - h_act / 2)

    // Pipeline Asíncrono
    let y_14 = 13.25cm
    accion-n2(c5, y_14, w5, h_act, "14. Compilar constancia PDF\ncon firma digital (<= 5s)", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_13c + h_act / 2), end: (c5, y_14 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_14 - h_act / 2)

    let y_15 = 14.00cm
    accion-n2(c5, y_15, w5, h_act, "15. Persistir constancia en\nAWS S3 (Cifrado AES-256)", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_14 + h_act / 2), end: (c5, y_15 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_15 - h_act / 2)

    let y_16 = 14.75cm
    accion-n2(c5, y_16, w5, h_act, "16. Despachar notificación\ny ticket por WhatsApp API", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_15 + h_act / 2), end: (c5, y_16 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_16 - h_act / 2)

    let y_fin_global = 15.45cm
    nodo-final-actividad(c5, y_fin_global, r-ext: 0.19cm, r-int: 0.10cm)
    place(dx: 0cm, dy: 0cm, line(start: (c5, y_16 + h_act / 2), end: (c5, y_fin_global - 0.19cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c5, y_fin_global - 0.19cm)

    // ============================================================
    // LEYENDA FORMAL EN MATRIZ 2D (OMG UML 2.5.1)
    // ============================================================
    place(dx: 0.20cm, dy: 16.05cm, block(
      width: 16.60cm,
      height: 1.15cm,
      fill: rgb("#f8fafc"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.6pt),
      radius: 3pt,
      inset: (x: 8pt, y: 3.5pt),
      {
        set text(size: 4.9pt, font: ("Arial", "Segoe UI"))
        set par(leading: 0.38em, spacing: 0pt)
        grid(
          columns: (1.2fr, 1.2fr, 1.1fr),
          gutter: 6pt,
          [
            *Partición por Ilación (Flujo Asistencial):* \
            • #text(weight: "bold", fill: rgb("#0f172a"), [ILA-0020]): Admisión y Check-in (EDU-0029) \
            • #text(weight: "bold", fill: rgb("#0f172a"), [ILA-0019]): Sincronización Camillas WSS (EDU-0026) \
            • #text(weight: "bold", fill: rgb("#0f172a"), [ILA-0017]): Sesión y Pipeline Cloud (EDU-0025)
          ],
          [
            *Capas de Ejecución (Arquitectura del Sistema):* \
            • Presentación, Aplicación, Persistencia, Tiempo Real, Asíncrono \
            • #text(weight: "bold", fill: rgb("#0f172a"), [Persistencia con Retorno Obligatorio]): Base de datos siempre devuelve confirmación a Capa de Aplicación.
          ],
          [
            *Nodos de Control de Flujo (UML 2.5.1):* \
            • #text(weight: "bold", fill: color-fork, [●]) Inicio   • #text(weight: "bold", fill: color-fork, [◉]) Fin actividad   • #text(weight: "bold", fill: color-linea, [(X)]) Fin local \
            • #text(weight: "bold", fill: color-linea, [◇]) Decisión condicional #text(weight: "bold", fill: color-guarda, [[Guardas]]) \
            • #text(weight: "bold", fill: color-fork, [▬]) Barras ForkNode de sincronización concurrente
          ]
        )
      }
    ))
  }
)
