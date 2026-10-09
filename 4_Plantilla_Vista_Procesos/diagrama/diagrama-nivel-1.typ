// ============================================================
// DIA-PRC-0001 — Diagrama de Procesos (Nivel 1: Macroscópico)
// Sistema: OmVital Physio Control
// Estándar: OMG UML 2.5.1 & Modelo 4+1 (Philippe Kruchten 1995)
// Notación: Active Classes / Procesos del S.O., Interfaces y Canales IPC
// Primitivas vectoriales de Typst
// ============================================================

#let trazo         = 0.75pt
#let trazo-fino    = 0.45pt
#let trazo-grueso  = 1.10pt
#let color-linea   = rgb("#1e293b")
#let color-fondo   = white
#let color-proc    = rgb("#f8fafc")
#let color-gw      = rgb("#eef2ff")
#let color-gw-br   = rgb("#4338ca")
#let color-ws-bg   = rgb("#faf5ff")
#let color-ws-br   = rgb("#7e22ce")
#let color-wrk-bg  = rgb("#f0fdf4")
#let color-wrk-br  = rgb("#15803d")
#let color-dat-bg  = rgb("#f1f5f9")
#let color-dat-br  = rgb("#334155")
#let color-ext-bg  = rgb("#fff1f2")
#let color-ext-br  = rgb("#e11d48")
#let color-nota-bg = rgb("#fffbeb")
#let color-nota-br = rgb("#d97706")
#let color-sync    = rgb("#1d4ed8")
#let color-async   = rgb("#15803d")
#let color-ws      = rgb("#9333ea")

// ------------------------------------------------------------
// Primitivas estándar OMG UML 2.5.1
// ------------------------------------------------------------

// 1. Caja de Proceso Activo UML 2.5.1 (Active Class: Doble borde vertical)
#let caja-proceso-uml(cx, cy, ancho, alto, estereotipo, codigo, nombre, runtime, fill: color-proc, stroke: color-linea) = {
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  let d = 0.16cm // Distancia de la doble línea vertical UML (Clause 11.4 Active Class)

  // Rectángulo principal
  place(dx: x0, dy: y0, rect(width: ancho, height: alto, fill: fill, stroke: (paint: stroke, thickness: trazo), radius: 3pt))
  // Doble línea vertical izquierda (UML Active Class)
  place(dx: 0cm, dy: 0cm, line(start: (x0 + d, y0), end: (x0 + d, y0 + alto), stroke: (paint: stroke, thickness: trazo)))
  // Doble línea vertical derecha (UML Active Class)
  place(dx: 0cm, dy: 0cm, line(start: (x0 + ancho - d, y0), end: (x0 + ancho - d, y0 + alto), stroke: (paint: stroke, thickness: trazo)))

  // Texto interno estructurado
  place(dx: x0 + d, dy: y0, block(
    width: ancho - 2 * d,
    height: alto,
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.38em)
      stack(
        dir: ttb,
        spacing: 2.2pt,
        text(size: 5.4pt, style: "italic", fill: rgb("#64748b"), [«#estereotipo»]),
        text(size: 6.6pt, weight: "bold", fill: stroke, [#codigo: #nombre]),
        if runtime != none and runtime != "" {
          text(size: 5.2pt, fill: rgb("#334155"), runtime)
        }
      )
    })
  ))
}

// 2. Caja de Componente / Servicio Externo UML (Borde simple estándar)
#let caja-externo-uml(cx, cy, ancho, alto, estereotipo, codigo, nombre, detalle, fill: color-ext-bg, stroke: color-ext-br) = {
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2

  place(dx: x0, dy: y0, rect(width: ancho, height: alto, fill: fill, stroke: (paint: stroke, thickness: trazo), radius: 3pt))
  place(dx: x0, dy: y0, block(
    width: ancho,
    height: alto,
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.38em)
      stack(
        dir: ttb,
        spacing: 2.0pt,
        text(size: 5.2pt, style: "italic", fill: stroke, [«#estereotipo»]),
        text(size: 6.4pt, weight: "bold", fill: stroke, [#codigo: #nombre]),
        if detalle != none and detalle != "" {
          text(size: 5.0pt, fill: rgb("#7f1d1d"), detalle)
        }
      )
    })
  ))
}

// 3. Nota UML 2.5.1 con esquina doblada (Dog-ear Note)
#let nota-uml(cx, cy, ancho, alto, codigo, texto) = {
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
    width: w,
    height: h,
    align(center + horizon, {
      set text(font: ("Arial", "Segoe UI"), lang: "es")
      set par(leading: 0.38em)
      stack(
        dir: ttb,
        spacing: 2.0pt,
        text(size: 5.8pt, weight: "bold", fill: rgb("#92400e"), codigo),
        if texto != "" {
          text(size: 5.0pt, fill: rgb("#78350f"), texto)
        }
      )
    })
  ))
}

// 4. Puntas de Flecha UML
#let punta-abajo(x, y, s: 0.10cm, fill: color-linea) = place(
  dx: x - s, dy: y - 2 * s,
  polygon((0cm, 0cm), (2 * s, 0cm), (s, 2 * s), fill: fill, stroke: none),
)
#let punta-arriba(x, y, s: 0.10cm, fill: color-linea) = place(
  dx: x - s, dy: y,
  polygon((0cm, 2 * s), (2 * s, 2 * s), (s, 0cm), fill: fill, stroke: none),
)
#let punta-derecha(x, y, s: 0.10cm, fill: color-linea) = place(
  dx: x - 2 * s, dy: y - s,
  polygon((0cm, 0cm), (0cm, 2 * s), (2 * s, s), fill: fill, stroke: none),
)
#let punta-izquierda(x, y, s: 0.10cm, fill: color-linea) = place(
  dx: x, dy: y - s,
  polygon((2 * s, 0cm), (2 * s, 2 * s), (0cm, s), fill: fill, stroke: none),
)

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
            #text(size: 7.2pt, weight: "bold", fill: rgb("#0f172a"), [pkg DIA-PRC-0001 · Arquitectura Macroscópica de Procesos (Nivel 1)])
            #h(8pt)
            #text(size: 5.8pt, fill: rgb("#64748b"), [Vista de Procesos en Tiempo de Ejecución · Nivel 1])
          ],
          [
            #text(size: 5.8pt, weight: "medium", fill: rgb("#475569"), [OmVital Physio Control])
          ]
        )
      })
    ))

    // Coordenadas calculadas sin colisiones
    let y_cli = 1.95cm  // Capa Clientes
    let y_gw  = 5.25cm  // Capa Núcleo Gateway
    let y_mid = 8.55cm  // Capa Servicios Especializados
    let y_dat = 11.90cm // Capa Persistencia
    let y_leg = 14.45cm // Capa Leyenda

    let x_c1  = 5.20cm  // Proceso Recepción
    let x_c2  = 11.60cm // Proceso Tablet
    let x_mid = 7.10cm  // Proceso Central Gateway
    let x_ext = 14.80cm // Columna Externa

    // ============================================================
    // 1. PROCESOS CLIENTE (Top Layer)
    // ============================================================
    caja-proceso-uml(x_c1, y_cli, 5.20cm, 1.35cm, "process", "P-CLI-01", "Terminal Web Recepción", "Chromium V8 · React SPA · Check-in & Citas", fill: color-proc, stroke: rgb("#334155"))
    caja-proceso-uml(x_c2, y_cli, 5.20cm, 1.35cm, "process", "P-CLI-02", "App Tablet Fisioterapia", "Android WebView · UI Asistencial & Firma Digital", fill: color-proc, stroke: rgb("#334155"))

    // ============================================================
    // 2. PROCESO SERVIDOR CENTRAL (Core Gateway)
    // ============================================================
    caja-proceso-uml(x_mid, y_gw, 7.60cm, 1.40cm, "process", "P-SRV-01", "API Gateway & Backend Clínico", "Node.js / FastAPI · Pool Hilos HTTP · JWT & Orquestador", fill: color-gw, stroke: color-gw-br)

    // ============================================================
    // 3. PROCESOS ESPECIALIZADOS INTERNOS (Middle Layer)
    // ============================================================
    caja-proceso-uml(3.30cm, y_mid, 4.80cm, 1.40cm, "process", "P-SRV-02", "Motor WebSocket en Tiempo Real", "Daemon WSS (RFC 6455) · Difusión de Camillas", fill: color-ws-bg, stroke: color-ws-br)
    caja-proceso-uml(9.30cm, y_mid, 5.00cm, 1.40cm, "process", "P-WRK-01", "Worker de Tareas Asíncronas", "Worker Pool · Broker Queue · PDF & Notificaciones", fill: color-wrk-bg, stroke: color-wrk-br)

    // ============================================================
    // 4. PROCESO DE PERSISTENCIA (Bottom Layer)
    // ============================================================
    caja-proceso-uml(6.80cm, y_dat, 7.20cm, 1.35cm, "process", "P-DAT-01", "Servidor Base de Datos PostgreSQL", "Daemon PostgreSQL 16 · Transacciones ACID & Bloqueo Fila", fill: color-dat-bg, stroke: color-dat-br)

    // ============================================================
    // 5. SUBSISTEMAS / SERVICIOS EXTERNOS (Right Column)
    // ============================================================
    caja-externo-uml(x_ext, y_gw, 3.60cm, 1.30cm, "external service", "S-EXT-01", "API Financiera", "REST HTTPS · Validación Saldo\nTimeout Estricto 3s")
    caja-externo-uml(x_ext, y_mid, 3.60cm, 1.30cm, "external service", "S-EXT-02", "Almacenamiento S3", "AWS S3 Bucket · Cifrado AES-256\nDocumentos Inmutables")
    caja-externo-uml(x_ext, y_dat, 3.60cm, 1.30cm, "external service", "S-EXT-03", "Gateway WhatsApp", "Meta Cloud API · Notificaciones\nDespacho de Tickets")

    // ============================================================
    // 6. CONECTORES Y CANALES DE COMUNICACIÓN (IPC / Network)
    // ============================================================

    // De P-CLI-01 a P-SRV-01 (HTTPS Síncrono)
    place(dx: 0cm, dy: 0cm, line(start: (x_c1, y_cli + 0.675cm), end: (x_c1, y_gw - 0.70cm), stroke: (paint: color-sync, thickness: trazo)))
    punta-abajo(x_c1, y_gw - 0.70cm, fill: color-sync)
    place(dx: x_c1 + 0.15cm, dy: 3.25cm, text(size: 5.4pt, weight: "bold", fill: color-sync, [REST / HTTPS]))

    // De P-CLI-02 a P-SRV-01 (HTTPS Síncrono)
    place(dx: 0cm, dy: 0cm, line(start: (10.20cm, y_cli + 0.675cm), end: (10.20cm, y_gw - 0.70cm), stroke: (paint: color-sync, thickness: trazo)))
    punta-abajo(10.20cm, y_gw - 0.70cm, fill: color-sync)
    place(dx: 10.35cm, dy: 3.25cm, text(size: 5.4pt, weight: "bold", fill: color-sync, [REST / HTTPS]))

    // Canal WebSocket Bidireccional de P-SRV-02 a P-CLI-01 (WSS Dúplex)
    place(dx: 0cm, dy: 0cm, line(start: (2.20cm, y_mid - 0.70cm), end: (2.20cm, y_cli), stroke: (paint: color-ws, thickness: trazo, dash: "dashed")))
    place(dx: 0cm, dy: 0cm, line(start: (2.20cm, y_cli), end: (x_c1 - 2.60cm, y_cli), stroke: (paint: color-ws, thickness: trazo, dash: "dashed")))
    punta-derecha(x_c1 - 2.60cm, y_cli, fill: color-ws)
    punta-abajo(2.20cm, y_mid - 0.70cm, fill: color-ws)
    place(dx: 0.95cm, dy: 3.95cm, text(size: 5.2pt, weight: "bold", fill: color-ws, [WSS Dúplex]))
    place(dx: 0.95cm, dy: 4.22cm, text(size: 4.8pt, fill: color-ws, [(RFC 6455)]))

    // Disparo de Evento de P-SRV-01 a P-SRV-02
    place(dx: 0cm, dy: 0cm, line(start: (3.60cm, y_gw + 0.70cm), end: (3.60cm, y_mid - 0.70cm), stroke: (paint: color-ws, thickness: trazo)))
    punta-abajo(3.60cm, y_mid - 0.70cm, fill: color-ws)
    place(dx: 3.75cm, dy: 6.70cm, text(size: 5.2pt, fill: color-ws, [Event Emit]))

    // Encolamiento Asíncrono de P-SRV-01 a P-WRK-01
    place(dx: 0cm, dy: 0cm, line(start: (8.80cm, y_gw + 0.70cm), end: (8.80cm, y_mid - 0.70cm), stroke: (paint: color-async, thickness: trazo)))
    punta-abajo(8.80cm, y_mid - 0.70cm, fill: color-async)
    place(dx: 8.95cm, dy: 6.70cm, text(size: 5.2pt, fill: color-async, [Task Enqueue]))

    // Llamada Síncrona a API Financiera S-EXT-01 (Con Circuit Breaker)
    place(dx: 0cm, dy: 0cm, line(start: (x_mid + 3.80cm, y_gw), end: (x_ext - 1.80cm, y_gw), stroke: (paint: color-sync, thickness: trazo)))
    punta-derecha(x_ext - 1.80cm, y_gw, fill: color-sync)
    place(dx: 11.05cm, dy: y_gw - 0.30cm, text(size: 5.2pt, weight: "bold", fill: color-sync, [Check Saldo (<= 3s)]))

    // Transacción ACID de P-SRV-01 a P-DAT-01
    place(dx: 0cm, dy: 0cm, line(start: (6.20cm, y_gw + 0.70cm), end: (6.20cm, y_dat - 0.675cm), stroke: (paint: color-linea, thickness: trazo-grueso)))
    punta-abajo(6.20cm, y_dat - 0.675cm, fill: color-linea)
    place(dx: 4.85cm, dy: 10.25cm, text(size: 5.2pt, weight: "bold", fill: color-linea, [Pool TCP ACID]))

    // Worker a Base de Datos (P-WRK-01 a P-DAT-01)
    place(dx: 0cm, dy: 0cm, line(start: (7.80cm, y_mid + 0.70cm), end: (7.80cm, y_dat - 0.675cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-abajo(7.80cm, y_dat - 0.675cm, fill: color-linea)

    // Worker a S-EXT-02 (Upload S3)
    place(dx: 0cm, dy: 0cm, line(start: (11.80cm, y_mid), end: (x_ext - 1.80cm, y_mid), stroke: (paint: color-async, thickness: trazo)))
    punta-derecha(x_ext - 1.80cm, y_mid, fill: color-async)
    place(dx: 11.90cm, dy: y_mid - 0.28cm, text(size: 5.0pt, fill: color-async, [Upload S3]))

    // Worker a S-EXT-03 (WhatsApp API)
    place(dx: 0cm, dy: 0cm, line(start: (11.40cm, y_mid + 0.70cm), end: (11.40cm, y_dat), stroke: (paint: color-async, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (11.40cm, y_dat), end: (x_ext - 1.80cm, y_dat), stroke: (paint: color-async, thickness: trazo)))
    punta-derecha(x_ext - 1.80cm, y_dat, fill: color-async)
    place(dx: 11.60cm, dy: y_dat - 0.28cm, text(size: 5.0pt, fill: color-async, [WhatsApp API]))

    // ============================================================
    // 7. NOTAS UML 2.5.1 (Asociaciones a RNF sin flechas)
    // ============================================================
    // RNF-0002 encima de P-CLI-01
    nota-uml(5.20cm, 0.95cm, 2.50cm, 0.65cm, "RNF-0002", "Búsqueda DNI <= 500ms")
    place(dx: 0cm, dy: 0cm, line(start: (5.20cm, 1.28cm), end: (5.20cm, y_cli - 0.675cm), stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed")))

    // RNF-0006 en Servidor WebSocket (abajo a la izquierda)
    nota-uml(1.20cm, y_mid + 1.10cm, 2.10cm, 0.70cm, "RNF-0006", "WSS Latencia < 1s")
    place(dx: 0cm, dy: 0cm, line(start: (2.25cm, y_mid + 1.10cm), end: (3.30cm - 2.40cm + 0.50cm, y_mid + 0.70cm), stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed")))

    // RNF-0007 en Worker Pool
    nota-uml(10.50cm, 10.35cm, 2.30cm, 0.70cm, "RNF-0007", "Render PDF <= 5s")
    place(dx: 0cm, dy: 0cm, line(start: (9.30cm + 0.50cm, y_mid + 0.70cm), end: (10.50cm, 10.00cm), stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed")))

    // RNF-0010 en Almacenamiento S3
    nota-uml(15.00cm, 6.70cm, 2.40cm, 0.70cm, "RNF-0010", "S3 AES-256 Inmutable")
    place(dx: 0cm, dy: 0cm, line(start: (15.00cm, 7.05cm), end: (x_ext, y_mid - 0.65cm), stroke: (paint: color-nota-br, thickness: trazo-fino, dash: "dashed")))

    // ============================================================
    // 8. LEYENDA TÉCNICA UML 2.5.1 (Bottom Legend Bar)
    // ============================================================
    place(dx: 0.30cm, dy: y_leg, block(
      width: 16.40cm,
      height: 1.25cm,
      fill: rgb("#f8fafc"),
      stroke: (paint: rgb("#cbd5e1"), thickness: 0.6pt),
      radius: 3pt,
      inset: (x: 10pt, y: 4.5pt),
      {
        set text(size: 5.4pt, font: ("Arial", "Segoe UI"))
        set par(leading: 0.44em, spacing: 0pt)
        grid(
          columns: (1fr, 1.4fr),
          gutter: 8pt,
          [
            *Notación de Procesos:* \
            • #text(weight: "bold", fill: color-linea, [«process»]): Proceso activo del Sistema Operativo \
            • #text(weight: "bold", fill: color-ext-br, [«external service»]): Servicio o subsistema externo
          ],
          [
            *Canales de Comunicación e IPC:* \
            • #text(weight: "bold", fill: color-sync, [Síncrono (REST/HTTPS)])   • #text(weight: "bold", fill: color-ws, [Dúplex (WSS RFC 6455)]) \
            • #text(weight: "bold", fill: color-async, [Asíncrono (Queue)])   • #text(weight: "bold", fill: color-linea, [Pool TCP ACID])
          ]
        )
      }
    ))
  }
)
