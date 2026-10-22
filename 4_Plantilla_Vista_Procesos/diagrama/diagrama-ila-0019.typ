// ============================================================
// DIA-PRC-ILA-0019 — Diagrama de Procesos Específico
// Ilación: ILA-0019 — Visualizar organización interna (v3.0.0)
// Educción: EDU-0026 / EDU-0032 | Especificación: ESP-0027/28/29
// Sistema: OmVital Physio Control
// Estándar: OMG UML 2.5.1 — ActivityPartitions en Capas
// ============================================================

#let trazo         = 0.70pt
#let trazo-fino    = 0.45pt
#let trazo-grueso  = 1.10pt
#let color-linea   = rgb("#1e293b")
#let color-fondo   = white
#let color-borde-carril = rgb("#cbd5e1")
#let color-fork    = rgb("#0f172a")
#let color-guarda  = rgb("#1e293b")
#let color-nota-bg = rgb("#f1f5f9")
#let color-nota-br = rgb("#64748b")

// Primitivas estándar OMG UML 2.5.1
#let nodo-inicial(cx, cy, r: 0.15cm) = place(
  dx: cx - r, dy: cy - r,
  circle(radius: r, fill: color-fork, stroke: none),
)

#let nodo-final-actividad(cx, cy, r-ext: 0.20cm, r-int: 0.11cm) = {
  place(dx: cx - r-ext, dy: cy - r-ext, circle(radius: r-ext, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  place(dx: cx - r-int, dy: cy - r-int, circle(radius: r-int, fill: color-fork, stroke: none))
}

#let nodo-final-flujo(cx, cy, r: 0.16cm) = {
  place(dx: cx - r, dy: cy - r, circle(radius: r, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)))
  let d = r * 0.707
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy - d), end: (cx + d, cy + d), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (cx - d, cy + d), end: (cx + d, cy - d), stroke: (paint: color-linea, thickness: trazo)))
}

#let accion-prc(cx, cy, ancho, alto, texto, fill: white, stroke: color-linea, size: 5.3pt) = {
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
        align(center + horizon, text(size: size, weight: "medium", fill: rgb("#0f172a"), texto))
      }
    )
  )
}

#let barra-sincronizacion(cx, cy, ancho, grosor: 0.10cm) = {
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

#let rombo-prc(cx, cy, hw, hh, texto: none, size: 5.2pt) = {
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
  text(size: 5.2pt, weight: "bold", font: ("Arial", "Segoe UI"), fill: color-guarda, txt)
)

#let punta-abajo(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x - s, dy: y - 2 * s,
  polygon((0cm, 0cm), (2 * s, 0cm), (s, 2 * s), fill: fill, stroke: none),
)
#let punta-arriba(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x - s, dy: y,
  polygon((0cm, 2 * s), (2 * s, 2 * s), (s, 0cm), fill: fill, stroke: none),
)
#let punta-derecha(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

// ------------------------------------------------------------
// Diagrama Exportado: ILA-0019 (17.0cm × 13.0cm)
// ------------------------------------------------------------
#let diagrama_ila_0019 = box(
  width: 17.0cm,
  height: 13.0cm,
  fill: white,
  stroke: (paint: rgb("#94a3b8"), thickness: 0.70pt),
  radius: 3pt,
  {
    set text(font: ("Arial", "Segoe UI"), lang: "es")
    set par(leading: 0.40em)

    // Marco UML 2.5.1
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
            text(size: 6.6pt, weight: "bold", fill: rgb("#0f172a"), [act DIA-PRC-ILA-0019 · Proceso: Visualizar organización interna (EDU-0026 · ESP-0027/28/29)]),
            text(size: 5.1pt, fill: rgb("#64748b"), [Sincronización Reactiva de Camillas y Telemetría WSS (WebSocket RFC 6455)]),
          ),
          text(size: 5.8pt, weight: "medium", fill: rgb("#475569"), [OmVital Physio Control])
        )
      })
    ))

    // Geometría de las 4 Capas de Ejecución (Total: 16.60cm)
    let x0 = 0.20cm
    let y_top = 0.72cm
    let h_lane = 11.00cm

    let carriles = (
      ("Capa de Presentación", "Tablet / Panel Fisioterapeuta", 4.10cm, rgb("#ffffff")),
      ("Capa de Aplicación", "API Gateway & Controlador de Turnos", 3.80cm, rgb("#f8fafc")),
      ("Capa de Persistencia", "Motor Relacional PostgreSQL", 4.30cm, rgb("#ffffff")),
      ("Capa de Comunicación en Tiempo Real", "Servidor WebSocket WSS (RFC 6455)", 4.40cm, rgb("#f8fafc")),
    )

    let curr_x = x0
    let centros = ()
    for c in carriles {
      let w = c.at(2)
      let cx = curr_x + w / 2
      centros.push(cx)

      place(dx: curr_x, dy: y_top, rect(width: w, height: h_lane, fill: c.at(3), stroke: (paint: color-borde-carril, thickness: 0.40pt)))
      place(dx: curr_x, dy: y_top, block(
        width: w, height: 0.56cm,
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
      ))
      curr_x += w
    }

    let c1 = centros.at(0) // 2.25cm
    let c2 = centros.at(1) // 6.20cm
    let c3 = centros.at(2) // 10.25cm
    let c4 = centros.at(3) // 14.60cm

    let w1 = 3.60cm
    let w2 = 3.40cm
    let w3 = 3.80cm
    let w4 = 3.90cm
    let h_act = 0.54cm

    // ============================================================
    // FASE 1: INICIALIZACIÓN, CONSULTA Y RENDERIZADO DE PANELES
    // ============================================================

    // 1. Nodo Inicial en Presentación
    let y_ini = 1.55cm
    nodo-inicial(c1, y_ini)

    // 2. Acceder a panel de turnos (Presentación)
    let y_1 = 2.20cm
    accion-prc(c1, y_1, w1, h_act, "1. Iniciar sesión y acceder al\npanel de turno en tableta")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_ini + 0.15cm), end: (c1, y_1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_1 - h_act / 2)

    // 3. Validar token JWT (Aplicación)
    let y_2 = 2.20cm
    accion-prc(c2, y_2, w2, h_act, "2. Validar token JWT y rol\nactivo de Fisioterapeuta")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_1), end: (c2 - w2 / 2, y_2), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_2)

    // 4. Consultar citas y turno actual en BD (Persistencia)
    let y_3 = 2.95cm
    accion-prc(c3, y_3, w3, h_act, "3. Recuperar citas programadas\ny turno asignado en BD", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_2 + h_act / 2), end: (c2, y_3), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_3), end: (c3 - w3 / 2, y_3), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_3)

    // 5. Recuperar pacientes y terapeuta en BD (Persistencia)
    let y_4 = 3.70cm
    accion-prc(c3, y_4, w3, h_act, "4. Consultar datos clínicos del\npaciente y terapeuta en BD", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_3 + h_act / 2), end: (c3, y_4 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c3, y_4 - h_act / 2)

    // RETORNO OBLIGATORIO DE BASE DE DATOS HACIA APLICACIÓN
    // 6. Calcular indicadores (Aplicación)
    let y_5 = 4.45cm
    accion-prc(c2, y_5, w2, h_act, "5. Calcular indicadores de turno\ny consolidar agenda del día")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_4 + h_act / 2), end: (c3, y_5), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_5), end: (c2 + w2 / 2, y_5), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_5)
    guarda(8.20cm, y_5 - 0.24cm, "[Datos recuperados]")

    // 7. Poblar paneles en Presentación
    let y_6 = 5.20cm
    accion-prc(c1, y_6, w1, h_act, "6. Renderizar panel de turno y\nlista de espera en pantalla")
    place(dx: 0cm, dy: 0cm, line(start: (c2 - w2 / 2, y_5), end: (c1, y_5), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_5), end: (c1, y_6 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_6 - h_act / 2)

    // 8. Establecer canal WebSocket (Presentación)
    let y_7 = 5.95cm
    accion-prc(c1, y_7, w1, h_act, "7. Establecer canal WebSocket\ndúplex permanente (RFC 6455)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_6 + h_act / 2), end: (c1, y_7 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_7 - h_act / 2)

    // 9. Suscribir a tópico de sede (Tiempo Real)
    let y_8 = 5.95cm
    accion-prc(c4, y_8, w4, h_act, "8. Suscribir cliente a tópico\nde camillas de la sede clínica")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_7), end: (c4 - w4 / 2, y_8), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c4 - w4 / 2, y_8)
    guarda(7.80cm, y_8 - 0.24cm, "[Handshake WSS completado]")

    // ============================================================
    // FASE 2: BIFURCACIÓN CONCURRENTE (FORKNODE: TELEMETRÍA VS INTERACCIÓN)
    // ============================================================
    let y_fork = 6.75cm
    let x_fork_center = (c1 + c4) / 2 // 8.425cm
    let w_fork = (c4 - c1) + 0.80cm   // 13.15cm
    barra-sincronizacion(x_fork_center, y_fork, w_fork)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_8 + h_act / 2), end: (c4, y_fork - 0.055cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c4, y_fork - 0.055cm)

    // --- RAMA A: SINCRONIZACIÓN REACTIVA EN TIEMPO REAL (RNF-0006) ---
    let y_9a = 7.55cm
    accion-prc(c4, y_9a, w4, h_act, "9a. Recibir evento reactivo de\ncambio de estado de camilla")
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork + 0.055cm), end: (c4, y_9a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_9a - h_act / 2)

    let y_10a = 8.40cm
    accion-prc(c4, y_10a, w4, h_act, "10a. Retransmitir broadcast WSS\na tabletas suscritas (< 1s)")
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_9a + h_act / 2), end: (c4, y_10a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_10a - h_act / 2)

    let y_fin_ws = 9.20cm
    nodo-final-flujo(c4, y_fin_ws, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_10a + h_act / 2), end: (c4, y_fin_ws - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_fin_ws - 0.16cm)
    place(dx: c4 - 1.80cm, dy: y_fin_ws + 0.20cm, block(width: 3.60cm, align(center, text(size: 4.8pt, weight: "bold", font: ("Arial", "Segoe UI"), fill: color-guarda, [Difusión WSS concluida]))))

    // --- RAMA B: INTERACCIÓN ASISTENCIAL Y CONSULTA DE EVOLUCIÓN (ESP-0028) ---
    let y_9b = 7.55cm
    accion-prc(c1, y_9b, w1, h_act, "9b. Seleccionar paciente y solicitar\nevolución clínica")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork + 0.055cm), end: (c1, y_9b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_9b - h_act / 2)

    let y_10b = 7.55cm
    accion-prc(c2, y_10b, w2, h_act, "10b. Recibir solicitud y autorizar\nconsulta de evolución clínica")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_9b), end: (c2 - w2 / 2, y_10b), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_10b)

    let y_11b = 8.40cm
    accion-prc(c3, y_11b, w3, h_act, "11b. Consultar historial de dolor\ny evolución clínica en BD", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_10b + h_act / 2), end: (c2, y_11b), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_11b), end: (c3 - w3 / 2, y_11b), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_11b)

    // RETORNO OBLIGATORIO DE BASE DE DATOS HACIA APLICACIÓN
    let y_12b = 9.25cm
    accion-prc(c2, y_12b, w2, h_act, "12b. Consolidar serie temporal de\nprogreso clínico (<= 1s)")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_11b + h_act / 2), end: (c3, y_12b), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_12b), end: (c2 + w2 / 2, y_12b), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_12b)
    guarda(8.15cm, y_12b - 0.24cm, "[Serie recuperada]")

    let y_13b = 10.10cm
    accion-prc(c1, y_13b, w1, h_act, "13b. Desplegar gráfica evolutiva\ny progreso del paciente")
    place(dx: 0cm, dy: 0cm, line(start: (c2 - w2 / 2, y_12b), end: (c1, y_12b), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_12b), end: (c1, y_13b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_13b - h_act / 2)

    // Nodo Final de Actividad Global (ActivityFinalNode) en Presentación
    let y_fin_act = 10.95cm
    nodo-final-actividad(c1, y_fin_act, r-ext: 0.20cm, r-int: 0.11cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_13b + h_act / 2), end: (c1, y_fin_act - 0.20cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_act - 0.20cm)

    // ============================================================
    // LEYENDA FORMAL INFERIOR (UML 2.5.1)
    // ============================================================
    place(dx: 0.20cm, dy: 11.85cm, block(
      width: 16.60cm,
      height: 0.85cm,
      fill: rgb("#f8fafc"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.6pt),
      radius: 3pt,
      inset: (x: 8pt, y: 2.5pt),
      {
        set text(size: 5.1pt, font: ("Arial", "Segoe UI"))
        set par(leading: 0.38em, spacing: 0pt)
        grid(
          columns: (1fr, 1.2fr),
          gutter: 8pt,
          [
            *Trazabilidad a Requisitos:* \
            • *Educción:* EDU-0026 (Org. Interna Fisioterapeuta) / EDU-0032 (Org. Recepción) \
            • *Especificaciones:* ESP-0027 (Acceso y carga), ESP-0028 (Progreso), ESP-0029
          ],
          [
            *Garantías de Ejecución (UML 2.5.1):* \
            • Retorno obligatorio de la consulta a BD hacia la Capa de Aplicación y Presentación. \
            • Sincronización reactiva bidireccional vía WebSocket (RFC 6455) con latencia $< 1$ s.
          ]
        )
      }
    ))
  }
)
