// ============================================================
// DIA-PRC-ILA-0017 — Diagrama de Procesos Específico
// Ilación: ILA-0017 — Editar Sesión Terapéutica (v1.0.1)
// Educción: EDU-0025 | Especificación: ESP-0024 / ESP-0025
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
#let punta-derecha(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.085cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

// ------------------------------------------------------------
// Diagrama Exportado: ILA-0017 (17.0cm × 14.9cm)
// ------------------------------------------------------------
#let diagrama_ila_0017 = box(
  width: 17.0cm,
  height: 14.9cm,
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
            text(size: 6.6pt, weight: "bold", fill: rgb("#0f172a"), [act DIA-PRC-ILA-0017 · Proceso: Editar Sesión Terapéutica (EDU-0025 · ESP-0024/25)]),
            text(size: 5.1pt, fill: rgb("#64748b"), [Edición Clínica, Persistencia Transaccional y Pipeline Asíncrono]),
          ),
          text(size: 5.8pt, weight: "medium", fill: rgb("#475569"), [OmVital Physio Control])
        )
      })
    ))

    // Geometría de los 4 Carriles en Capas (Total: 16.60cm)
    let x0 = 0.20cm
    let y_top = 0.72cm
    let h_lane = 13.15cm

    let carriles = (
      ("Capa de Presentación", "Fisioterapeuta (Tableta Clínica)", 4.10cm, rgb("#ffffff")),
      ("Capa de Aplicación", "API Gateway & Controlador Clínico", 3.80cm, rgb("#f8fafc")),
      ("Capa de Persistencia", "Motor Relacional PostgreSQL", 4.10cm, rgb("#ffffff")),
      ("Capa de Procesamiento Asíncrono", "Workers & Cloud (AWS S3 / WhatsApp)", 4.60cm, rgb("#f8fafc")),
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
    let c3 = centros.at(2) // 10.15cm
    let c4 = centros.at(3) // 14.50cm

    let w1 = 3.60cm
    let w2 = 3.40cm
    let w3 = 3.70cm
    let w4 = 4.10cm
    let h_act = 0.52cm

    // ============================================================
    // FASE 1: APERTURA Y RECUPERACIÓN DE DATOS CLÍNICOS
    // ============================================================

    // 1. Nodo Inicial en Presentación
    let y_ini = 1.55cm
    nodo-inicial(c1, y_ini)

    // 2. Seleccionar opción Editar Sesión (Carril 1)
    let y_1 = 2.15cm
    accion-prc(c1, y_1, w1, h_act, "1. Seleccionar sesión terapéutica\ny solicitar edición clínica")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_ini + 0.15cm), end: (c1, y_1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_1 - h_act / 2)

    // 3. Validar permisos de edición (Carril 2)
    let y_2 = 2.15cm
    accion-prc(c2, y_2, w2, h_act, "2. Validar token y permisos\nde modificación clínica")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_1), end: (c2 - w2 / 2, y_2), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_2)

    // 4. Consultar sesión en BD (Carril 3)
    let y_3 = 2.85cm
    accion-prc(c3, y_3, w3, h_act, "3. Consultar registro de sesión\ny diagnóstico previo en BD", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_2 + h_act / 2), end: (c2, y_3), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_3), end: (c3 - w3 / 2, y_3), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_3)

    // RETORNO OBLIGATORIO DE BASE DE DATOS HACIA APLICACIÓN
    // 5. Recuperar DTO y responder (Carril 2)
    let y_4 = 3.55cm
    accion-prc(c2, y_4, w2, h_act, "4. Recuperar datos clínicos y\nemitir respuesta HTTP 200")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_3 + h_act / 2), end: (c3, y_4), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_4), end: (c2 + w2 / 2, y_4), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_4)

    // 6. Cargar formulario modal en Presentación (Carril 1)
    let y_5 = 4.25cm
    accion-prc(c1, y_5, w1, h_act, "5. Precargar formulario clínico\ncon datos de la sesión")
    place(dx: 0cm, dy: 0cm, line(start: (c2 - w2 / 2, y_4), end: (c1, y_4), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_4), end: (c1, y_5 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_5 - h_act / 2)

    // 7. Modificar observaciones y notas SOAP (Carril 1)
    let y_6 = 4.95cm
    accion-prc(c1, y_6, w1, h_act, "6. Actualizar notas SOAP, mapa\nde dolor y escala EVA")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_5 + h_act / 2), end: (c1, y_6 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_6 - h_act / 2)

    // 8. Pulsar botón Actualizar (Carril 1)
    let y_7 = 5.65cm
    accion-prc(c1, y_7, w1, h_act, "7. Confirmar cambios y enviar\nactualización de sesión")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_6 + h_act / 2), end: (c1, y_7 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_7 - h_act / 2)

    // 9. Validar sintaxis y consistencia (Carril 2)
    let y_8 = 5.65cm
    accion-prc(c2, y_8, w2, h_act, "8. Validar sintaxis y consistencia\nde observaciones clínicas")
    place(dx: 0cm, dy: 0cm, line(start: (c1 + w1 / 2, y_7), end: (c2 - w2 / 2, y_8), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_8)

    // 10. Rombo de Decisión: ¿Válido? (Carril 2)
    let y_dec = 6.40cm
    rombo-prc(c2, y_dec, 0.85cm, 0.32cm, texto: "¿Válido?")
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_8 + h_act / 2), end: (c2, y_dec - 0.32cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c2, y_dec - 0.32cm)

    // Rama [Inválido] hacia Presentación (Carril 1)
    let y_err = 6.40cm
    accion-prc(c1, y_err, w1, h_act, "Mostrar mensaje de error\ny solicitar corrección clínica", fill: white, stroke: rgb("#475569"))
    place(dx: 0cm, dy: 0cm, line(start: (c2 - 0.85cm, y_dec), end: (c1 + w1 / 2, y_err), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c1 + w1 / 2, y_err)
    guarda(3.85cm, y_dec - 0.28cm, "[Inválido]")

    let y_fin_err = 7.05cm
    nodo-final-flujo(c1, y_fin_err, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_err + h_act / 2), end: (c1, y_fin_err - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_err - 0.16cm)

    // Rama [Válido] hacia Persistencia en BD (Carril 3)
    let y_9 = 7.20cm
    let h_act9 = 0.58cm
    accion-prc(c3, y_9, w3, h_act9, "9. Persistir evolución clínica\ny actualizar historial en BD", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_dec + 0.32cm), end: (c2, y_9), stroke: (paint: color-linea, thickness: trazo-grueso)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_9), end: (c3 - w3 / 2, y_9), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-derecha(c3 - w3 / 2, y_9)
    guarda(c2 + 0.12cm, y_dec + 0.45cm, "[Válido]")

    // RETORNO OBLIGATORIO DE BASE DE DATOS HACIA APLICACIÓN
    // 10. Confirmar actualización en Aplicación (Carril 2)
    let y_10 = 7.98cm
    accion-prc(c2, y_10, w2, h_act, "10. Confirmar actualización atómica\ny autorizar bifurcación")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_9 + h_act9 / 2), end: (c3, y_10), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_10), end: (c2 + w2 / 2, y_10), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_10)

    // ============================================================
    // FASE 2: BIFURCACIÓN CONCURRENTE DESDE APLICACIÓN (FORKNODE)
    // ============================================================
    let y_fork = 8.65cm
    barra-sincronizacion(8.40cm, y_fork, 13.00cm) // Spans c1 (2.25cm) to c4 (14.50cm)
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_10 + h_act / 2), end: (c2, y_fork - 0.05cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(c2, y_fork - 0.05cm)

    // --- RAMA 1: CONFIRMACIÓN INMEDIATA Y RETORNO DE UI (CARRIL 1) ---
    // 11a. Desplegar confirmación (Carril 1)
    let y_11a = 9.35cm
    accion-prc(c1, y_11a, w1, h_act, "11a. Notificar actualización exitosa\ny cerrar formulario clínico")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_fork + 0.05cm), end: (c1, y_11a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_11a - h_act / 2)

    // 12a. Retornar a interfaz INT-18 (Carril 1)
    let y_12a = 10.05cm
    accion-prc(c1, y_12a, w1, h_act, "12a. Liberar interfaz táctil y\nvolver a lista de pacientes (< 500ms)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_11a + h_act / 2), end: (c1, y_12a - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_12a - h_act / 2)

    // Fin de flujo local en UI (FlowFinalNode)
    let y_fin_ui = 10.75cm
    nodo-final-flujo(c1, y_fin_ui, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_12a + h_act / 2), end: (c1, y_fin_ui - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_ui - 0.16cm)

    // --- RAMA 2: PIPELINE ASÍNCRONO EN SEGUNDO PLANO (CARRIL 4) ---
    // 11b. Encolar tarea en broker (Carril 4)
    let y_11b = 9.35cm
    accion-prc(c4, y_11b, w4, h_act, "11b. Encolar tarea documental en\nbroker de procesamiento asíncrono", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_fork + 0.05cm), end: (c4, y_11b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_11b - h_act / 2)

    // 12b. Compilar constancia PDF (Carril 4)
    let y_12b = 10.05cm
    accion-prc(c4, y_12b, w4, h_act, "12b. Compilar constancia PDF con\nfirma digital (<= 5s)", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_11b + h_act / 2), end: (c4, y_12b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_12b - h_act / 2)

    // 13b. Persistir en AWS S3 (Carril 4)
    let y_13b = 10.75cm
    accion-prc(c4, y_13b, w4, h_act, "13b. Persistir constancia con cifrado\nAES-256 en almacenamiento S3", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_12b + h_act / 2), end: (c4, y_13b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_13b - h_act / 2)

    // 14b. Despachar WhatsApp API (Carril 4)
    let y_14b = 11.45cm
    accion-prc(c4, y_14b, w4, h_act, "14b. Despachar notificación y enlace\nde descarga por WhatsApp API", fill: rgb("#f8fafc"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_13b + h_act / 2), end: (c4, y_14b - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_14b - h_act / 2)

    // Nodo Final de Actividad Global (ActivityFinalNode) en Carril 4
    let y_fin_global = 12.18cm
    nodo-final-actividad(c4, y_fin_global, r-ext: 0.20cm, r-int: 0.11cm)
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_14b + h_act / 2), end: (c4, y_fin_global - 0.20cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_fin_global - 0.20cm)

    // ============================================================
    // LEYENDA FORMAL INFERIOR (UML 2.5.1)
    // ============================================================
    place(dx: 0.20cm, dy: 13.90cm, block(
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
            • *Educción:* EDU-0025 (Gestión de registro de sesión terapéutica) \
            • *Especificaciones:* ESP-0024 (Generación documental PDF) y ESP-0025 (Actualizar sesión)
          ],
          [
            *Garantías de Ejecución (UML 2.5.1):* \
            • Retorno obligatorio de la consulta y persistencia en BD hacia la Capa de Aplicación. \
            • Liberación reactiva de tableta médica en $< 500$ ms y compilación en segundo plano.
          ]
        )
      }
    ))
  }
)
