// ============================================================
// DIA-CMP-0001 — Diagrama de Comportamiento (Nivel 1)
// Módulo: Gestión de Pacientes (Identificación, Registro, Check-in)
// Estándar: UML 2.5 — Diagrama de Actividades / Comportamiento
// Construido con primitivas vectoriales de Typst
// ============================================================

#let trazo         = 0.75pt
#let trazo-fino    = 0.5pt
#let color-linea   = black
#let color-fondo   = white
#let color-nota    = rgb("#f8f9fa")

#let titulo-diagrama   = "Diagrama de Comportamiento del módulo de Pacientes — Nivel 1"
#let subtitulo-diagrama = "Identificación, registro y check-in del paciente"

// ------------------------------------------------------------
// Primitivas estándar UML 2.5
// ------------------------------------------------------------

// 1. Nodo Inicial UML (Círculo negro sólido relleno)
#let nodo-inicial(cx, cy, r: 0.28cm) = {
  place(
    dx: cx - r,
    dy: cy - r,
    circle(radius: r, fill: color-linea, stroke: none),
  )
}

// 2. Nodo Final de Actividad UML (Diana / Círculo concéntrico con núcleo relleno)
#let nodo-final(cx, cy, r-ext: 0.35cm, r-int: 0.20cm) = {
  place(
    dx: cx - r-ext,
    dy: cy - r-ext,
    circle(radius: r-ext, fill: color-fondo, stroke: (paint: color-linea, thickness: trazo)),
  )
  place(
    dx: cx - r-int,
    dy: cy - r-int,
    circle(radius: r-int, fill: color-linea, stroke: none),
  )
}

// 3. Nodo de Acción / Actividad UML (Rectángulo redondeado)
#let actividad(cx, cy, ancho, alto, texto, size: 9pt) = place(
  dx: cx - ancho / 2,
  dy: cy - alto / 2,
  block(
    width: ancho,
    height: alto,
    inset: (x: 6pt, y: 4pt),
    fill: color-fondo,
    stroke: (paint: color-linea, thickness: trazo),
    radius: 6pt,
    align(center + horizon, text(size: size, weight: "regular", hyphenate: false, texto)),
  ),
)

// 4. Nodo de Decisión / Fusión (Rombo UML)
#let rombo(cx, cy, hw, hh, texto: none, size: 8.5pt) = {
  place(
    dx: cx - hw,
    dy: cy - hh,
    polygon(
      (hw, 0cm), (2 * hw, hh), (hw, 2 * hh), (0cm, hh),
      fill: color-fondo, stroke: (paint: color-linea, thickness: trazo),
    ),
  )
  if texto != none {
    place(
      dx: cx - hw,
      dy: cy - hh,
      block(
        width: 2 * hw,
        height: 2 * hh,
        inset: (x: 4pt, y: 2pt),
        align(center + horizon, text(size: size, weight: "medium", hyphenate: false, texto)),
      ),
    )
  }
}

// 5. Nota UML con esquina doblada (Dog-ear Note)
#let nota-uml(cx, cy, ancho, alto, codigo, ..rest) = {
  let texto = if rest.pos().len() > 0 {
    rest.pos().at(0)
  } else if "texto" in rest.named() {
    rest.named().at("texto")
  } else {
    none
  }
  let fold = 0.16cm
  let x0 = cx - ancho / 2
  let y0 = cy - alto / 2
  let w = ancho
  let h = alto

  // Cuerpo de la nota con corte superior derecho
  place(
    dx: x0,
    dy: y0,
    polygon(
      (0cm, 0cm),
      (w - fold, 0cm),
      (w, fold),
      (w, h),
      (0cm, h),
      fill: color-nota,
      stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed"),
    ),
  )
  // Doblez de la esquina
  place(
    dx: x0 + w - fold,
    dy: y0,
    polygon(
      (0cm, 0cm),
      (0cm, fold),
      (fold, fold),
      fill: rgb("#e9ecef"),
      stroke: (paint: color-linea, thickness: trazo-fino),
    ),
  )
  // Contenido de la nota
  place(
    dx: x0,
    dy: y0,
    block(
      width: w,
      height: h,
      inset: (top: 2pt, bottom: 2pt, left: 3pt, right: 3pt),
      align(center + horizon, {
        text(size: 7.5pt, weight: "bold", codigo)
        if texto != none and texto != "" {
          v(1pt)
          text(size: 6.8pt, style: "normal", hyphenate: false, texto)
        }
      }),
    ),
  )
}

// 6. Guarda UML [Condición]
#let guarda(cx, cy, texto) = place(
  dx: cx - 1.0cm,
  dy: cy - 0.25cm,
  block(
    width: 2.0cm,
    align(center + horizon, text(size: 8.5pt, weight: "bold", hyphenate: false, texto)),
  ),
)

// 7. Flechas y Puntas de Flecha
#let punta-abajo(x, y) = place(
  dx: 0cm, dy: 0cm,
  polygon((x - 0.10cm, y - 0.20cm), (x + 0.10cm, y - 0.20cm), (x, y), fill: color-linea),
)

#let punta-izquierda(x, y) = place(
  dx: 0cm, dy: 0cm,
  polygon((x + 0.20cm, y - 0.10cm), (x + 0.20cm, y + 0.10cm), (x, y), fill: color-linea),
)

#let punta-derecha(x, y) = place(
  dx: 0cm, dy: 0cm,
  polygon((x - 0.20cm, y - 0.10cm), (x - 0.20cm, y + 0.10cm), (x, y), fill: color-linea),
)

#let flecha-v(x, y1, y2) = {
  place(dx: 0cm, dy: 0cm, line(start: (x, y1), end: (x, y2), stroke: (paint: color-linea, thickness: trazo)))
  punta-abajo(x, y2)
}

#let flecha-h(x1, x2, y) = {
  place(dx: 0cm, dy: 0cm, line(start: (x1, y), end: (x2, y), stroke: (paint: color-linea, thickness: trazo)))
  if x2 > x1 {
    punta-derecha(x2, y)
  } else {
    punta-izquierda(x2, y)
  }
}

// ------------------------------------------------------------
// Lienzo del diagrama (17 cm × 18.6 cm)
// ------------------------------------------------------------

#let diagrama_nivel_1 = box(
  width: 17cm,
  height: 18.6cm,
  {
    // --- Título y subtítulo del diagrama ---
    place(
      dx: 0cm, dy: 0.10cm,
      block(width: 17cm, align(center + horizon, text(size: 10.5pt, weight: "bold", titulo-diagrama))),
    )
    place(
      dx: 0cm, dy: 0.70cm,
      block(width: 17cm, align(center + horizon, text(size: 8.5pt, style: "italic", subtitulo-diagrama))),
    )

    // Coordenadas principales
    let xc = 7.0cm     // Eje vertical principal
    let xr = 13.6cm    // Eje vertical derecho (rama SÍ)
    let w-act = 6.4cm  // Ancho de cajas de actividad principales
    let h-act = 1.05cm // Alto de cajas de actividad
    let w-act-r = 5.6cm // Ancho de caja rama derecha

    // --- Flujos de control principales (Flechas verticales) ---
    // 1. De Nodo Inicial a Actividad 1
    flecha-v(xc, 2.08cm, 2.80cm)

    // 2. De Actividad 1 a Actividad 2
    flecha-v(xc, 3.85cm, 4.60cm)

    // 3. De Actividad 2 a Decisión 3
    flecha-v(xc, 5.65cm, 6.50cm)

    // 4. Rama [Sí] de Decisión 3 a Actividad 4
    flecha-h(9.40cm, 10.80cm, 7.40cm)

    // 5. Rama [No] de Decisión 3 a Actividad 5
    flecha-v(xc, 8.30cm, 9.60cm)

    // 6. De Actividad 5 a Nodo de Fusión (Merge)
    flecha-v(xc, 10.65cm, 11.60cm)

    // 7. De Actividad 4 hacia Nodo de Fusión (Merge)
    // Línea hacia abajo desde Actividad 4
    place(dx: 0cm, dy: 0cm, line(start: (xr, 7.925cm), end: (xr, 11.95cm), stroke: (paint: color-linea, thickness: trazo)))
    // Línea hacia la izquierda entrando al Merge Node
    flecha-h(xr, xc + 0.55cm, 11.95cm)

    // 8. De Nodo de Fusión (Merge) a Actividad 6
    flecha-v(xc, 12.30cm, 13.10cm)

    // 9. De Actividad 6 a Actividad 7
    flecha-v(xc, 14.15cm, 14.90cm)

    // 10. De Actividad 7 a Nodo Final
    flecha-v(xc, 15.95cm, 16.95cm)

    // --- Conectores discontinuos hacia las Notas UML (RNF) ---
    // A RNF-0002 (Tiempo de respuesta)
    place(dx: 0cm, dy: 0cm, line(start: (3.45cm, 5.125cm), end: (xc - w-act / 2, 5.125cm), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))
    // A RNF-01 (Persistencia)
    place(dx: 0cm, dy: 0cm, line(start: (3.45cm, 10.125cm), end: (xc - w-act / 2, 10.125cm), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))
    // A RNF-0001 (Disponibilidad)
    place(dx: 0cm, dy: 0cm, line(start: (xr, 6.25cm), end: (xr, 6.875cm), stroke: (paint: color-linea, thickness: trazo-fino, dash: "dashed")))

    // --- Nodos del Diagrama UML 2.5 ---

    // Nodo Inicial UML (●)
    nodo-inicial(xc, 1.80cm, r: 0.28cm)

    // Actividades del flujo principal
    actividad(xc, 3.325cm, w-act, h-act, "1. Solicitar identificación del paciente")
    actividad(xc, 5.125cm, w-act, h-act, "2. Identificar paciente")

    // Nodo de Decisión UML (Rombo)
    rombo(xc, 7.40cm, 2.40cm, 0.90cm, texto: "3. ¿Paciente existe en BD?")

    // Actividad Rama SÍ
    actividad(xr, 7.40cm, w-act-r, h-act, "4. Consultar / cargar ficha del paciente")

    // Actividad Rama NO
    actividad(xc, 10.125cm, w-act, h-act, "5. Registrar nuevo paciente")

    // Nodo de Fusión UML (Merge Node)
    rombo(xc, 11.95cm, 0.55cm, 0.35cm)

    // Actividades post-fusión
    actividad(xc, 13.625cm, w-act, h-act, "6. Iniciar check-in en agenda diaria")
    actividad(xc, 15.425cm, w-act, h-act, "7. Continuar con el proceso de atención")

    // Nodo Final de Actividad UML (◉)
    nodo-final(xc, 17.30cm, r-ext: 0.35cm, r-int: 0.20cm)

    // --- Anotaciones / Notas UML (RNF + Atributo de Calidad) ---
    nota-uml(2.00cm, 5.125cm, 2.90cm, 0.95cm, "RNF-0002", "Tiempo de respuesta")
    nota-uml(2.00cm, 10.125cm, 2.90cm, 0.95cm, "RNF-01", "Persistencia")
    nota-uml(xr, 5.75cm, 3.00cm, 0.95cm, "RNF-0001", "Disponibilidad")

    // --- Guardas UML [Condiciones] ---
    guarda(10.10cm, 7.10cm, "[Sí]")
    guarda(6.35cm, 8.95cm, "[No]")
  }
)
