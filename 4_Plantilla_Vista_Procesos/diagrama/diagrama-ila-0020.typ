// ============================================================
// DIA-PRC-ILA-0020 — Diagrama de Procesos Específico
// Ilación: ILA-0020 — Registrar asistencia (v1.0.0)
// Educción: EDU-0029 | Especificación: ESP-0030 / ESP-0031
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
// Diagrama Exportado: ILA-0020 (17.0cm × 14.2cm)
// ------------------------------------------------------------
#let diagrama_ila_0020 = box(
  width: 17.0cm,
  height: 14.2cm,
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
            text(size: 6.6pt, weight: "bold", fill: rgb("#0f172a"), [act DIA-PRC-ILA-0020 · Proceso: Registrar asistencia (EDU-0029 · ESP-0030/31)]),
            text(size: 5.1pt, fill: rgb("#64748b"), [Admisión, Verificación Financiera y Transacción ACID de Check-in]),
          ),
          text(size: 5.8pt, weight: "medium", fill: rgb("#475569"), [OmVital Physio Control])
        )
      })
    ))

    // Geometría de los 4 Carriles en Capas (Total: 16.60cm)
    let x0 = 0.20cm
    let y_top = 0.72cm
    let h_lane = 12.50cm

    let carriles = (
      ("Capa de Presentación", "Recepción y Admisión", 4.10cm, rgb("#ffffff")),
      ("Capa de Aplicación", "API Gateway & Servicio Check-in", 3.90cm, rgb("#f8fafc")),
      ("Capa de Integración", "API Finanzas (Verificación Saldo)", 3.90cm, rgb("#ffffff")),
      ("Capa de Persistencia", "Motor Relacional PostgreSQL", 4.70cm, rgb("#f8fafc")),
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
    let c2 = centros.at(1) // 6.25cm
    let c3 = centros.at(2) // 10.15cm
    let c4 = centros.at(3) // 14.45cm

    let w1 = 3.60cm
    let w2 = 3.40cm
    let w3 = 3.40cm
    let w4 = 4.10cm
    let h_act = 0.54cm

    // Nodos de flujo:
    // 1. Inicio en Presentación
    let y_ini = 1.60cm
    nodo-inicial(c1, y_ini)

    // 2. Ingresar a citas
    let y_1 = 2.30cm
    accion-prc(c1, y_1, w1, h_act, "1. Ingresar a agenda de citas y\nseleccionar paciente programado")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_ini + 0.15cm), end: (c1, y_1 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_1 - h_act / 2)

    // 3. Abrir modal
    let y_2 = 3.10cm
    accion-prc(c1, y_2, w1, h_act, "2. Abrir formulario de check-in\ny registrar llegada de paciente")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_1 + h_act / 2), end: (c1, y_2 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_2 - h_act / 2)

    // 4. Solicitar validación a Aplicación
    let y_3 = 3.90cm
    accion-prc(c2, y_3, w2, h_act, "3. Validar sesión de usuario y\nsolicitar verificación de pago")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_2 + h_act / 2), end: (c1, y_3), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_3), end: (c2 - w2 / 2, y_3), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_3)

    // 5. Consultar a Integración
    let y_4 = 3.90cm
    accion-prc(c3, y_4, w3, h_act, "4. Consultar saldo de sesiones\ny validar pago (timeout <= 3s)")
    place(dx: 0cm, dy: 0cm, line(start: (c2 + w2 / 2, y_3), end: (c3 - w3 / 2, y_4), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c3 - w3 / 2, y_4)

    // 6. Rombo de decisión en Aplicación
    let y_dec = 4.80cm
    rombo-prc(c2, y_dec, 0.85cm, 0.32cm, texto: "¿Pagado?")
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_4 + h_act / 2), end: (c3, y_dec), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c3, y_dec), end: (c2 + 0.85cm, y_dec), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + 0.85cm, y_dec)

    // Rama [No Pagado] -> Notificar y derivar a caja en Presentación
    let y_err = 4.80cm
    accion-prc(c1, y_err, w1, h_act, "Notificar saldo pendiente\ny derivar paciente a caja", fill: white, stroke: rgb("#475569"))
    place(dx: 0cm, dy: 0cm, line(start: (c2 - 0.85cm, y_dec), end: (c1 + w1 / 2, y_err), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c1 + w1 / 2, y_err)
    guarda(3.90cm, y_dec - 0.28cm, "[No Pagado]")

    let y_fin_err = 5.55cm
    nodo-final-flujo(c1, y_fin_err, r: 0.16cm)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_err + h_act / 2), end: (c1, y_fin_err - 0.16cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin_err - 0.16cm)

    // Rama [Pagado] hacia Habilitación y Confirmación en Presentación
    let y_5 = 6.20cm
    accion-prc(c1, y_5, w1, 0.58cm, "5. Capturar firma digital opcional\ny autorizar check-in")
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_dec + 0.32cm), end: (c2, y_5), stroke: (paint: color-linea, thickness: trazo-grueso)))
    place(dx: 0cm, dy: 0cm, line(start: (c2, y_5), end: (c1 + w1 / 2, y_5), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-izquierda(c1 + w1 / 2, y_5)
    guarda(c2 + 0.12cm, y_dec + 0.45cm, "[Pagado]")

    // 6. Iniciar Transacción en Aplicación
    let y_6 = 7.10cm
    accion-prc(c2, y_6, w2, h_act, "6. Iniciar transacción relacional\nACID (Read Committed)")
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_5 + h_act / 2), end: (c1, y_6), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_6), end: (c2 - w2 / 2, y_6), stroke: (paint: color-linea, thickness: trazo)))
    punta-derecha(c2 - w2 / 2, y_6)

    // 7. Bloquear fila pesimistamente (Persistencia)
    let y_7 = 7.90cm
    accion-prc(c4, y_7, w4, h_act, "7. Bloquear registro de cita y\nverificar concurrencia", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c2 + w2 / 2, y_6), end: (c4, y_6), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_6), end: (c4, y_7 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_7 - h_act / 2)

    // 8. Insertar Asistencia (Persistencia)
    let y_8 = 8.70cm
    accion-prc(c4, y_8, w4, h_act, "8. Insertar registro de asistencia\ncon marca temporal", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_7 + h_act / 2), end: (c4, y_8 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_8 - h_act / 2)

    // 9. Decrementar sesión (Persistencia)
    let y_9 = 9.50cm
    accion-prc(c4, y_9, w4, h_act, "9. Deducir sesión disponible\ndel paquete contratado", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_8 + h_act / 2), end: (c4, y_9 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_9 - h_act / 2)

    // 10. Actualizar cita (Persistencia)
    let y_10 = 10.30cm
    accion-prc(c4, y_10, w4, h_act, "10. Actualizar estado de cita\na 'En Atención'", fill: rgb("#f1f5f9"), stroke: rgb("#334155"))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_9 + h_act / 2), end: (c4, y_10 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c4, y_10 - h_act / 2)

    // 11. Confirmar Transacción (Aplicación)
    let y_11 = 11.10cm
    accion-prc(c2, y_11, w2, h_act, "11. Confirmar transacción en BD\ny emitir respuesta HTTP 200")
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_10 + h_act / 2), end: (c4, y_11), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c4, y_11), end: (c2 + w2 / 2, y_11), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(c2 + w2 / 2, y_11)
    guarda(10.15cm, y_11 - 0.26cm, "[Confirmación COMMIT]")

    // 12. Desplegar éxito y cerrar modal (Presentación)
    let y_12 = 11.90cm
    accion-prc(c1, y_12, w1, h_act, "12. Notificar check-in exitoso\ny actualizar agenda en pantalla")
    place(dx: 0cm, dy: 0cm, line(start: (c2 - w2 / 2, y_11), end: (c1, y_11), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_11), end: (c1, y_12 - h_act / 2), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_12 - h_act / 2)

    // 13. Nodo final de actividad
    let y_fin = 12.75cm
    nodo-final-actividad(c1, y_fin)
    place(dx: 0cm, dy: 0cm, line(start: (c1, y_12 + h_act / 2), end: (c1, y_fin - 0.20cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(c1, y_fin - 0.20cm)

    // Leyenda inferior formal
    place(dx: 0.20cm, dy: 13.25cm, block(
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
            • *Educción:* EDU-0029 (Control de asistencia)   • *Actor:* ACT-0003 (Recepcionista) \
            • *Especificación Procedural:* ESP-0030 (Registro de asistencia atómico) y ESP-0031
          ],
          [
            *Garantías de Ejecución (UML 2.5.1):* \
            • Bloqueo pesimista `FOR UPDATE` y retorno obligatorio de persistencia en BD a Capa de Aplicación. \
            • Timeout de verificación externa de 3s para evitar retención de conexiones cliente.
          ]
        )
      }
    ))
  }
)
