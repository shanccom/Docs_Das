// ============================================================
// DIA-CMP-0001 — Diagrama de Comportamiento (Nivel 2)
// Módulo: Gestión de Pacientes (Descomposición formal en carriles)
// Estándar: UML 2.5 — Diagrama de Actividades / Comportamiento
// Buenas prácticas UML 2.5 aplicadas:
// 1. Carriles de partición (Activity Partitions / Swimlanes)
//    - Carril 1: ACT-0003 (Recepcionista) -> Interacción y captura UI
//    - Carril 2: Sistema (Módulo Pacientes) -> Lógica de negocio y BD
// 2. Nodos de acción (Action Nodes) con tipografía y paddings optimizados
// 3. Nodos de decisión (Decision Nodes) con textos contenidos y guardas [Sí]/[No]
// 4. Nodo de fusión (Merge Node) para unión de ramas
// 5. Bucle de retorno FUE-0004 con ruteo ortogonal sin colisiones
// 6. Notas UML (Dog-ear Notes) vinculadas con líneas discontinuas
// 7. Nodo inicial y nodos finales (éxito y excepciones)
// ============================================================
#import "diagrama-nivel-1.typ": nodo-inicial, nodo-final, punta-abajo, punta-izquierda, punta-derecha, flecha-v, flecha-h, color-linea, trazo, trazo-fino, color-fondo

#let titulo-n2 = "DIA-CMP-0001 — Descomposición de actividades (Nivel 2)"
#let subtitulo-n2 = "Identificar (ESP-0003) · Consultar ficha (ESP-0004/0005) · Registrar (ESP-0001/0002/FUE-0004) · Check-in (ESP-0030/0031)"

// ------------------------------------------------------------
// Configuración de colores y geometrías
// ------------------------------------------------------------
#let color-carril-actor = rgb("#f8fafc")
#let color-carril-sys   = rgb("#fbfcfd")
#let color-borde-carril = rgb("#94a3b8")
#let color-guarda       = rgb("#0f3d75")
#let color-nota-linea   = rgb("#64748b")
#let color-nota-bg      = rgb("#f1f5f9")

#let x_act = 4.05cm   // Centro del carril Recepcionista (0.3cm a 7.8cm)
#let x_sys = 11.55cm  // Centro del carril Sistema (8.0cm a 16.7cm)
#let w_act = 5.50cm   // Ancho de cajas de actor
#let w_sys = 4.40cm   // Ancho de cajas de sistema
#let h_box = 0.44cm   // Alto de nodo de acción
#let t_txt = 6.2pt    // Tamaño de fuente del texto de nodos

// Primitiva de Acción optimizada para Nivel 2
#let accion-n2(cx, cy, ancho, alto, texto, size: t_txt) = place(
  dx: cx - ancho / 2,
  dy: cy - alto / 2,
  block(
    width: ancho,
    height: alto,
    inset: (x: 4pt, y: 1pt),
    fill: color-fondo,
    stroke: (paint: color-linea, thickness: trazo),
    radius: 4pt,
    {
      set par(leading: 0.28em, spacing: 0pt)
      align(center + horizon, text(size: size, weight: "regular", hyphenate: false, texto))
    },
  ),
)

// Primitiva de Decisión (Rombo con caja de texto protegida de los vértices)
#let decision-n2(cx, cy, hw, hh, texto: none, size: 5.6pt) = {
  place(
    dx: cx - hw,
    dy: cy - hh,
    polygon(
      (hw, 0cm), (2 * hw, hh), (hw, 2 * hh), (0cm, hh),
      fill: color-fondo, stroke: (paint: color-linea, thickness: trazo),
    ),
  )
  if texto != none {
    let w_text = 2 * hw - 0.90cm
    place(
      dx: cx - w_text / 2,
      dy: cy - hh + 0.04cm,
      block(
        width: w_text,
        height: 2 * hh - 0.08cm,
        inset: (x: 1pt, y: 0pt),
        {
          set par(leading: 0.24em, spacing: 0pt)
          align(center + horizon, text(size: size, weight: "medium", hyphenate: false, texto))
        },
      ),
    )
  }
}

// Primitiva de Fusión (Merge Node)
#let merge-n2(cx, cy, hw: 0.30cm, hh: 0.18cm) = place(
  dx: cx - hw,
  dy: cy - hh,
  polygon(
    (hw, 0cm), (2 * hw, hh), (hw, 2 * hh), (0cm, hh),
    fill: color-fondo, stroke: (paint: color-linea, thickness: trazo),
  ),
)

// Primitiva de Nota UML optimizada para Nivel 2
#let nota-n2(cx, cy, ancho, alto, cod, desc, tx, ty) = {
  let fold = 0.14cm
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  let w = ancho
  let h = alto

  // Cuerpo de la nota con esquina doblada
  place(
    dx: x0,
    dy: y0,
    polygon(
      (0cm, 0cm), (w - fold, 0cm), (w, fold), (w, h), (0cm, h),
      fill: color-nota-bg,
      stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed"),
    ),
  )
  place(
    dx: x0 + w - fold,
    dy: y0,
    polygon(
      (0cm, 0cm), (0cm, fold), (fold, fold),
      fill: rgb("#cbd5e1"),
      stroke: (paint: color-linea, thickness: trazo-fino),
    ),
  )
  // Texto de la nota
  place(
    dx: x0,
    dy: y0,
    block(
      width: w,
      height: h,
      inset: (x: 2pt, y: 1pt),
      align(center + horizon, {
        set par(leading: 0.22em, spacing: 0pt)
        text(size: 5.8pt, weight: "bold", fill: rgb("#0f172a"), cod)
        v(0.5pt)
        text(size: 5.0pt, fill: rgb("#334155"), hyphenate: false, desc)
      }),
    ),
  )
  // Conector discontinuo al nodo destino
  let x_start = if cx < tx { cx + w / 2 } else { cx - w / 2 }
  place(dx: 0cm, dy: 0cm, line(
    start: (x_start, cy),
    end: (tx, ty),
    stroke: (paint: color-nota-linea, thickness: trazo-fino, dash: "dashed"),
  ))
}

// Ruteador ortogonal (Manhattan L-path) hacia la derecha
#let ruta-ortogonal-D(x1, y1, x2, y2) = {
  place(dx: 0cm, dy: 0cm, line(start: (x1, y1), end: (x1, y2), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (x1, y2), end: (x2, y2), stroke: (paint: color-linea, thickness: trazo)))
  punta-derecha(x2, y2)
}

// Ruteador ortogonal (Manhattan L-path) hacia la izquierda
#let ruta-ortogonal-I(x1, y1, x2, y2) = {
  place(dx: 0cm, dy: 0cm, line(start: (x1, y1), end: (x1, y2), stroke: (paint: color-linea, thickness: trazo)))
  place(dx: 0cm, dy: 0cm, line(start: (x1, y2), end: (x2, y2), stroke: (paint: color-linea, thickness: trazo)))
  punta-izquierda(x2, y2)
}

// Etiqueta de guarda UML [Condición]
#let guarda-uml(x, y, w, txt) = place(
  dx: x - w / 2, dy: y - 0.13cm,
  block(width: w, align(center + horizon, text(size: 6.6pt, weight: "bold", fill: color-guarda, hyphenate: false, txt))),
)

// ------------------------------------------------------------
// Lienzo vectorial del Diagrama de Nivel 2
// ------------------------------------------------------------
#let diagrama_nivel_2 = box(
  width: 17.0cm,
  height: 18.50cm,
  {
    let y_top_carril = 0.78cm
    let y_bot_carril = 18.35cm

    // --- Título del diagrama ---
    place(dx: 0cm, dy: 0.02cm, block(width: 17cm, align(center + horizon, text(size: 9.0pt, weight: "bold", titulo-n2))))
    place(dx: 0cm, dy: 0.38cm, block(width: 17cm, align(center + horizon, text(size: 6.5pt, style: "italic", fill: rgb("#374151"), subtitulo-n2))))

    // --- Carriles / Particiones UML 2.5 ---
    // Carril 1: Recepcionista (ACT-0003)
    place(dx: 0.30cm, dy: y_top_carril, block(
      width: 7.50cm, height: y_bot_carril - y_top_carril,
      fill: color-carril-actor,
      stroke: (paint: color-borde-carril, thickness: 0.70pt),
      radius: (top-left: 3pt, bottom-left: 3pt),
    ))
    // Encabezado Carril 1
    place(dx: 0.30cm, dy: y_top_carril, block(
      width: 7.50cm, height: 0.40cm,
      fill: rgb("#e2ebf4"),
      stroke: (bottom: (paint: color-borde-carril, thickness: 0.70pt)),
      inset: (x: 8pt),
      align(left + horizon, text(size: 7.2pt, weight: "bold", fill: rgb("#1b365d"), "ACT-0003 · Recepcionista")),
    ))

    // Carril 2: Sistema (OMVITAL)
    place(dx: 8.00cm, dy: y_top_carril, block(
      width: 8.70cm, height: y_bot_carril - y_top_carril,
      fill: color-carril-sys,
      stroke: (paint: color-borde-carril, thickness: 0.70pt),
      radius: (top-right: 3pt, bottom-right: 3pt),
    ))
    // Encabezado Carril 2
    place(dx: 8.00cm, dy: y_top_carril, block(
      width: 8.70cm, height: 0.40cm,
      fill: rgb("#e6eef6"),
      stroke: (bottom: (paint: color-borde-carril, thickness: 0.70pt)),
      inset: (x: 8pt),
      align(left + horizon, text(size: 7.2pt, weight: "bold", fill: rgb("#1b365d"), "Sistema — Módulo de Pacientes (OMVITAL)")),
    ))

    // ============================================================
    // SECCIÓN 1: INICIO & PRECONDICIONES (ESP-0002)
    // ============================================================
    // Nodo Inicial
    let y_ini = 1.38cm
    nodo-inicial(x_act, y_ini, r: 0.18cm)

    // 1. Solicitar identificación
    let y_act1 = 1.98cm
    accion-n2(x_act, y_act1, w_act, h_box, "1. Solicitar documento de identidad al paciente *")
    flecha-v(x_act, y_ini + 0.18cm, y_act1 - h_box / 2)

    // 2. Ingresar búsqueda
    let y_act2 = 2.68cm
    accion-n2(x_act, y_act2, w_act, h_box, "2. Ingresar criterio de búsqueda en INT-02 (DNI / Apellidos)")
    flecha-v(x_act, y_act1 + h_box / 2, y_act2 - h_box / 2)

    // 3. Decisión: Precondiciones
    let y_dec3 = 3.52cm
    let hw_dec3 = 2.30cm
    let hh_dec3 = 0.40cm
    decision-n2(x_sys, y_dec3, hw_dec3, hh_dec3, texto: "3. ¿Sesión y conexión válidas?\n(ACT-0003 / ESP-0002)")
    
    // Conector 2 -> 3 (Actor a Sistema)
    ruta-ortogonal-D(x_act + w_act / 2, y_act2, x_sys - hw_dec3, y_dec3)

    // Rama [No] de Decisión 3 -> Bloqueo y Fin de Flujo
    let x_err3 = 15.50cm
    let y_err3 = 4.12cm
    let w_err3 = 2.05cm
    let h_err3 = 0.38cm
    accion-n2(x_err3, y_err3, w_err3, h_err3, "Aviso: precondición\nno superada", size: 5.4pt)
    place(dx: 0cm, dy: 0cm, line(start: (x_sys + hw_dec3, y_dec3), end: (x_err3, y_dec3), stroke: (paint: color-linea, thickness: trazo)))
    flecha-v(x_err3, y_dec3, y_err3 - h_err3 / 2)
    guarda-uml(14.65cm, y_dec3 - 0.16cm, 1.1cm, "[No]")
    // Fin de flujo de error 3
    let y_fin3 = 4.70cm
    nodo-final(x_err3, y_fin3, r-ext: 0.18cm, r-int: 0.10cm)
    flecha-v(x_err3, y_err3 + h_err3 / 2, y_fin3 - 0.18cm)

    // Rama [Sí] de Decisión 3 -> 4. Consulta indexada
    let y_act4 = 4.42cm
    accion-n2(x_sys, y_act4, w_sys, h_box, "4. Consulta indexada por DNI / nombre (SDB-01)")
    flecha-v(x_sys, y_dec3 + hh_dec3, y_act4 - h_box / 2)
    guarda-uml(x_sys + 0.42cm, y_dec3 + hh_dec3 + 0.22cm, 0.9cm, "[Sí]")

    // Nota RNF-0002 (Ubicada en el espacio libre del carril actor)
    nota-n2(x_act, 4.42cm, 2.70cm, 0.44cm, "RNF-0002", "Tiempo respuesta ≤ 500 ms", x_sys - w_sys / 2, y_act4)

    // ============================================================
    // SECCIÓN 2: EVALUACIÓN DE COINCIDENCIAS (ESP-0003)
    // ============================================================
    // 5. Decisión: Coincidencias
    let y_dec5 = 5.28cm
    let hw_dec5 = 2.30cm
    let hh_dec5 = 0.40cm
    decision-n2(x_sys, y_dec5, hw_dec5, hh_dec5, texto: "5. ¿Criterio ≥ 3 caracteres?\n(Filtro ESP-0003)")
    flecha-v(x_sys, y_act4 + h_box / 2, y_dec5 - hh_dec5)

    // 6. Poblar grilla
    let y_act6 = 6.18cm
    accion-n2(x_sys, y_act6, w_sys, h_box, "6. Poblar grilla de pacientes (INT-02-TBL-01)")

    // Rama [Sí] de Decisión 5 -> 6
    flecha-v(x_sys, y_dec5 + hh_dec5, y_act6 - h_box / 2)
    guarda-uml(x_sys + 0.42cm, y_dec5 + hh_dec5 + 0.22cm, 0.9cm, "[Sí]")

    // Rama [No] de Decisión 5 (ESP-0003: recientes) -> bypass a 6 por la derecha
    let x_rec = 15.50cm
    let y_rec = 5.72cm
    let w_rec = 2.05cm
    let h_rec = 0.38cm
    accion-n2(x_rec, y_rec, w_rec, h_rec, "Cargar 10 registros\nrecientes (ESP-0003)", size: 5.4pt)
    place(dx: 0cm, dy: 0cm, line(start: (x_sys + hw_dec5, y_dec5), end: (x_rec, y_dec5), stroke: (paint: color-linea, thickness: trazo)))
    flecha-v(x_rec, y_dec5, y_rec - h_rec / 2)
    guarda-uml(14.65cm, y_dec5 - 0.16cm, 1.1cm, "[No]")
    // Retorno de recientes hacia nodo 6
    place(dx: 0cm, dy: 0cm, line(start: (x_rec, y_rec + h_rec / 2), end: (x_rec, y_act6), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (x_rec, y_act6), end: (x_sys + w_sys / 2, y_act6), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(x_sys + w_sys / 2, y_act6)

    // ============================================================
    // SECCIÓN 3: BIFURCACIÓN PRINCIPAL N1 (¿PACIENTE EXISTE?)
    // ============================================================
    // 7. Identificar paciente en grilla
    let y_act7 = 6.98cm
    accion-n2(x_act, y_act7, w_act, h_box, "7. Evaluar resultados y seleccionar registro en grilla")
    // Conector 6 -> 7 (Sistema a Actor)
    ruta-ortogonal-I(x_sys - w_sys / 2, y_act6, x_act + w_act / 2, y_act7)

    // 8. Decisión Principal: ¿Paciente existe en BD?
    let y_dec8 = 7.82cm
    let hw_dec8 = 2.30cm
    let hh_dec8 = 0.40cm
    decision-n2(x_act, y_dec8, hw_dec8, hh_dec8, texto: "8. ¿Paciente registrado en BD?\n(Validación SDB-01)")
    flecha-v(x_act, y_act7 + h_box / 2, y_dec8 - hh_dec8)

    // ------------------------------------------------------------
    // RAMA [SÍ]: CONSULTAR FICHA (ESP-0004 / ESP-0005) -> Columna derecha
    // ------------------------------------------------------------
    let y_act8a = 7.82cm
    accion-n2(x_sys, y_act8a, w_sys, h_box, "4a. Consultar ficha y antecedentes (SDB-01, ESP-0004)")
    // Conector Rama [Sí] de 8 -> 8a (Actor a Sistema)
    flecha-h(x_act + hw_dec8, x_sys - w_sys / 2, y_dec8)
    guarda-uml(7.05cm, y_dec8 - 0.16cm, 1.0cm, "[Sí]")

    // Nota RNF-0001
    nota-n2(15.50cm, 7.82cm, 2.05cm, 0.44cm, "RNF-0001", "Disponibilidad 99.8%", x_sys + w_sys / 2, y_act8a)

    let y_act8b = 8.68cm
    accion-n2(x_sys, y_act8b, w_sys, h_box, "4b. Auditar consulta y emitir constancia (ESP-0005)")
    flecha-v(x_sys, y_act8a + h_box / 2, y_act8b - h_box / 2)

    // Salida de 4b hacia Merge Node por pasillo lateral derecho (x = 14.15cm)
    let x_bypass_mer = 14.15cm
    place(dx: 0cm, dy: 0cm, line(start: (x_sys + w_sys / 2, y_act8b), end: (x_bypass_mer, y_act8b), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (x_bypass_mer, y_act8b), end: (x_bypass_mer, 12.05cm), stroke: (paint: color-linea, thickness: trazo)))
    place(dx: 0cm, dy: 0cm, line(start: (x_bypass_mer, 12.05cm), end: (x_sys + 0.30cm, 12.05cm), stroke: (paint: color-linea, thickness: trazo)))
    punta-izquierda(x_sys + 0.30cm, 12.05cm)

    // ------------------------------------------------------------
    // RAMA [NO]: REGISTRAR PACIENTE (ESP-0001 / FUE-0004) -> Columna izquierda
    // ------------------------------------------------------------
    // 9. Diligenciar formulario
    let y_act9 = 8.68cm
    accion-n2(x_act, y_act9, w_act, h_box, "5a. Diligenciar formulario de filiación INT-01 (DNI 8 dígitos)")
    flecha-v(x_act, y_dec8 + hh_dec8, y_act9 - h_box / 2)
    guarda-uml(x_act + 1.25cm, y_dec8 + hh_dec8 + 0.22cm, 2.0cm, "[No] registrar")

    // 10. Guardar
    let y_act10 = 9.52cm
    accion-n2(x_act, y_act10, w_act, h_box, "5b. Confirmar y solicitar guardado (INT-01-BTN-01)")
    flecha-v(x_act, y_act9 + h_box / 2, y_act10 - h_box / 2)

    // 11. Validación FUE-0004
    let y_act11 = 9.52cm
    accion-n2(x_sys, y_act11, w_sys, h_box, "5c. Validar formatos y unicidad de DNI (FUE-0004)")
    // Conector 10 -> 11 (Actor a Sistema)
    flecha-h(x_act + w_act / 2, x_sys - w_sys / 2, y_act10)

    // Nota FUE-0004
    nota-n2(15.50cm, 9.52cm, 2.05cm, 0.44cm, "FUE-0004", "Validación estricta", x_sys + w_sys / 2, y_act11)

    // 12. Decisión: ¿Datos válidos?
    let y_dec12 = 10.38cm
    let hw_dec12 = 2.30cm
    let hh_dec12 = 0.40cm
    decision-n2(x_sys, y_dec12, hw_dec12, hh_dec12, texto: "12. ¿Datos y formato conformes?\n(Validación FUE-0004)")
    flecha-v(x_sys, y_act11 + h_box / 2, y_dec12 - hh_dec12)

    // Bucle [No] de Decisión 12 -> Regresar a Diligenciar (9)
    let x_loop = 0.70cm
    place(dx: 0cm, dy: 0cm, line(start: (x_sys - hw_dec12, y_dec12), end: (x_loop, y_dec12), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))
    place(dx: 0cm, dy: 0cm, line(start: (x_loop, y_dec12), end: (x_loop, y_act9), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))
    place(dx: 0cm, dy: 0cm, line(start: (x_loop, y_act9), end: (x_act - w_act / 2, y_act9), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))
    punta-derecha(x_act - w_act / 2, y_act9)
    guarda-uml(4.60cm, y_dec12 - 0.16cm, 3.2cm, "[No] Corregir datos con error")

    // Rama [Sí] de Decisión 12 -> 13. INSERT
    let y_act13 = 11.24cm
    accion-n2(x_sys, y_act13, w_sys, h_box, "5d. INSERT en TABLE_PACIENTE (SDB-01, ESP-0001)")
    flecha-v(x_sys, y_dec12 + hh_dec12, y_act13 - h_box / 2)
    guarda-uml(x_sys + 0.42cm, y_dec12 + hh_dec12 + 0.22cm, 0.9cm, "[Sí]")

    // Nota RNF-01
    nota-n2(15.50cm, 11.24cm, 2.05cm, 0.44cm, "RNF-01", "Persistencia DB", x_sys + w_sys / 2, y_act13)

    // 14. Confirmar registro exitoso (Actor)
    let y_act14 = 11.24cm
    accion-n2(x_act, y_act14, w_act, h_box, "5e. Visualizar confirmación de registro exitoso")
    // Conector 13 -> 14 (Sistema a Actor)
    flecha-h(x_sys - w_sys / 2, x_act + w_act / 2, y_act14)

    // ============================================================
    // SECCIÓN 4: FUSIÓN (MERGE NODE) Y CHECK-IN (ESP-0030 / 0031)
    // ============================================================
    // Nodo de Fusión UML (Merge Node)
    let y_merge = 12.05cm
    let hw_mer = 0.30cm
    let hh_mer = 0.18cm
    merge-n2(x_sys, y_merge, hw: hw_mer, hh: hh_mer)
    place(dx: x_sys - 2.15cm, dy: y_merge - 0.14cm, block(width: 1.8cm, align(right + horizon, text(size: 6.5pt, style: "italic", fill: rgb("#4b5563"), "«Merge»"))))

    // Entrada de 5e (Registro exitoso) -> Merge Node
    ruta-ortogonal-D(x_act + w_act / 2, y_act14 + h_box / 2, x_sys - hw_mer, y_merge)

    // 15. Seleccionar cita en agenda (Actor)
    let y_act15 = 12.85cm
    accion-n2(x_act, y_act15, w_act, h_box, "6a. Seleccionar cita en agenda diaria (INT-20-MOD-001)")
    // Conector Merge -> 15 (Sistema a Actor)
    ruta-ortogonal-I(x_sys, y_merge + hh_mer, x_act + w_act / 2, y_act15)

    // 16. Consultar estado de pago (Sistema)
    let y_act16 = 13.62cm
    accion-n2(x_sys, y_act16, w_sys, h_box, "6b. Consultar estado de pago de la cita (ILA-0020)")
    // Conector 15 -> 16 (Actor a Sistema)
    ruta-ortogonal-D(x_act + w_act / 2, y_act15, x_sys - w_sys / 2, y_act16)

    // 17. Decisión: ¿Pago validado?
    let y_dec17 = 14.48cm
    let hw_dec17 = 2.30cm
    let hh_dec17 = 0.40cm
    decision-n2(x_sys, y_dec17, hw_dec17, hh_dec17, texto: "17. ¿Pago verificado y cita activa?\n(Validación INT-20-TXT-006)")
    flecha-v(x_sys, y_act16 + h_box / 2, y_dec17 - hh_dec17)

    // Rama [No] de Decisión 17 -> Anular Check-in (ESP-0031)
    let x_anul = 15.50cm
    let y_anul = 15.08cm
    let w_anul = 2.05cm
    let h_anul = 0.38cm
    accion-n2(x_anul, y_anul, w_anul, h_anul, "Anular check-in\n(ESP-0031, BTN-001)", size: 5.4pt)
    place(dx: 0cm, dy: 0cm, line(start: (x_sys + hw_dec17, y_dec17), end: (x_anul, y_dec17), stroke: (paint: color-linea, thickness: trazo)))
    flecha-v(x_anul, y_dec17, y_anul - h_anul / 2)
    guarda-uml(14.65cm, y_dec17 - 0.16cm, 1.1cm, "[No]")
    // Fin de flujo de anulación
    let y_fin17 = 15.68cm
    nodo-final(x_anul, y_fin17, r-ext: 0.18cm, r-int: 0.10cm)
    flecha-v(x_anul, y_anul + h_anul / 2, y_fin17 - 0.18cm)

    // Rama [Sí] de Decisión 17 -> 18. Capturar firma y confirmar (Actor)
    let y_act18 = 15.28cm
    accion-n2(x_act, y_act18, w_act, h_box, "6c. Capturar firma digital y confirmar (INT-20-FUP-001)")
    // Conector 17 [Sí] -> 18 (Sistema a Actor)
    ruta-ortogonal-I(x_sys - hw_dec17, y_dec17, x_act + w_act / 2, y_act18)
    guarda-uml(9.10cm, y_dec17 - 0.16cm, 1.0cm, "[Sí]")

    // 19. Actualizar estado 'Asistió' (Sistema)
    let y_act19 = 16.08cm
    accion-n2(x_sys, y_act19, w_sys, h_box, "6d. Actualizar estado en TABLE_CITAS (SDB-01, ESP-0030)")
    // Conector 18 -> 19 (Actor a Sistema)
    ruta-ortogonal-D(x_act + w_act / 2, y_act18, x_sys - w_sys / 2, y_act19)

    // 20. Informar check-in al paciente (Actor)
    let y_act20 = 16.82cm
    accion-n2(x_act, y_act20, w_act, h_box, "6e. Informar check-in completado y entregar ticket")
    // Conector 19 -> 20 (Sistema a Actor)
    ruta-ortogonal-I(x_sys - w_sys / 2, y_act19, x_act + w_act / 2, y_act20)

    // 21. Continuar con la atención (Actor)
    let y_act21 = 17.52cm
    accion-n2(x_act, y_act21, w_act, h_box, "7. Continuar con el proceso de atención médica *")
    flecha-v(x_act, y_act20 + h_box / 2, y_act21 - h_box / 2)

    // Nodo Final de Actividad UML
    let y_final = 18.15cm
    nodo-final(x_act, y_final, r-ext: 0.20cm, r-int: 0.11cm)
    flecha-v(x_act, y_act21 + h_box / 2, y_final - 0.20cm)
  }
)