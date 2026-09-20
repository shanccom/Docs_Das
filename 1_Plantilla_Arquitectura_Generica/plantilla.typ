//  PLANTILLA: aquí vive la lógica. Normalmente no la tocas.
#import "config.typ": *

#let informe(cuerpo) = {
  // ---------- Ajustes generales ----------
  set document(title: titulo, author: integrantes)
  // El logo se ajusta a la altura indicada respetando su proporción
  let logo(ruta, alin, alto: altura-logo) = if ruta != none {
    align(alin + horizon, context {
      let m = measure(image(ruta))
      image(ruta, height: alto, width: alto * (m.width / m.height))
    })
  }

  let alto-cabecera = if (logo-izquierdo != none or logo-derecho != none) { altura-logo } else { 1.2em }
  let margen-superior = distancia-encabezado-arriba + alto-cabecera + separacion-encabezado-texto

  let encabezado = {
    set text(size: tamano-encabezado)
    grid(
      columns: (auto, 1fr, auto),
      column-gutter: 0.4cm,
      align: horizon,
      logo(logo-izquierdo, left),
      align(center)[
        #facultad \
        #text(weight: "bold", escuela)
      ],
      logo(logo-derecho, right),
    )
  }

  set page(
    paper: papel,
    margin: (
      x: margen-lateral,
      top: margen-superior,
      bottom: margen-inferior,
    ),
    header-ascent: separacion-encabezado-texto,
    header: if encabezado-paginas { encabezado } else { none },
    numbering: if numerar-paginas { "1" } else { none },
  )
  set text(font: fuente, size: tamano, lang: idioma)
  set par(justify: justificar, leading: interlineado, spacing: espacio-parrafo)

  // ---------- Títulos con sangría francesa ----------
  set heading(numbering: numeracion-titulos)
  show heading: it => {
    let tam = tamano-titulos.at(calc.min(it.level, tamano-titulos.len()) - 1)
    let num = if it.numbering != none {
      counter(heading).display(it.numbering)
    } else { none }
    // Cada nivel empieza una columna más adentro que el anterior.
    let estilo(x) = text(size: tam, weight: "bold", fill: color-titulos, x)
    if num == none {
      // Título sin número (por ejemplo «Índice»): empieza en el margen, sin columna vacía
      block(above: 1.6em, below: 1em, sticky: true, estilo(it.body))
    } else {
      // Cada nivel empieza una columna más adentro que el anterior.
      pad(left: (it.level - 1) * ancho-numero, block(
        width: 100%,
        above: 1.6em,
        below: 1em,
        sticky: true,
        grid(
          columns: (ancho-numero, 1fr),
          column-gutter: 0pt,
          estilo(num),
          estilo(it.body),
        ),
      ))
    }
  }

  // ---------- Portada ----------
  if portada {
    let etiqueta(t) = text(weight: "bold", size: 11pt, t)
    let linea-portada(nombre, valor) = align(center, block(above: 0.25em, below: 0.25em, width: 100%)[
      #etiqueta(nombre) #valor
    ])

    // Integrantes en 2 columnas (hasta 5 por columna), cada nombre centrado.
    // Las celdas se pasan en orden por filas: izquierda, derecha, izquierda, ...
    let red-integrantes = block()
    if integrantes.len() > 0 {
      let col-mayor = integrantes.chunks(5)
      let n-filas = calc.max(..col-mayor.map(col => col.len()))
      if n-filas > 0 {
        let celdas = ()
        for i in range(n-filas) {
          celdas.push(align(center, col-mayor.at(0).at(i, default: block())))
          let derecha = if col-mayor.len() > 1 { col-mayor.at(1).at(i, default: block()) } else { block() }
          celdas.push(align(center, derecha))
        }
        red-integrantes = grid(columns: (1fr, 1fr), column-gutter: 0.8cm, row-gutter: 0.35em, ..celdas)
      }
    }

    page(
      header: none,
      numbering: none,
      margin: (x: margen-lateral, top: margen-lateral, bottom: margen-inferior),
      {
        set par(justify: false, leading: 0.6em, spacing: 0.6em)
        set text(size: 11pt)

        // Bloque superior: logo a la izquierda un poco adentro y textos centrados
        v(2cm)
        grid(
          columns: (auto, 1fr),
          column-gutter: 0.7cm,
          align: horizon,
          if logo-izquierdo != none { pad(left: 1.5cm, logo(logo-izquierdo, left, alto: altura-logo-portada)) } else { block() },
          align(center + horizon)[
            #text(weight: "bold", universidad) \
            #text(weight: "bold", escuela) \
            #etiqueta("CURSO:") #curso \
            #etiqueta("SEMESTRE:") #semestre
          ],
        )

        v(3.5cm)

        linea-portada("RESULTADO DEL ESTUDIANTE A MEDIR:", resultado-estudiante)

        v(2cm)

        // Sistema
        align(center, etiqueta("NOMBRE DEL SISTEMA A CONSTRUIR"))
        v(0.7cm)
        v(0.6cm)
        align(center, text(weight: "bold", "ARQUITECTURA GENÉRICA"))
        v(0.2cm)
        align(center, text(weight: "bold", "VERSIÓN 1.0.0"))

        v(2cm)

        // Integrantes
        align(center, etiqueta("INTEGRANTES"))
        v(0.7cm)
        red-integrantes

        v(1.2cm)

        // Fecha
        align(center, etiqueta("FECHA"))
        v(0.25cm)
        align(center, lugar)
      },
    )
    counter(page).update(1)
  }

  // ---------- Contenido: el texto se sangra según el nivel del último título ----------
  // Se aplana únicamente las secuencias para preservar tablas, figuras y otros bloques.
  let aplanar(c) = if type(c) == content and c.func() == [].func() {
    c.children.map(aplanar).flatten()
  } else { (c,) }

  let items = aplanar(cuerpo)
  let bloque = ()      // texto acumulado bajo el título actual
  let nivel = 0

  let vaciar(bloque, nivel) = {
    if bloque.len() > 0 {
      pad(left: nivel * ancho-numero, bloque.join())
    }
  }

  for c in items {
    if c.func() == heading {
      vaciar(bloque, nivel)
      bloque = ()
      let lvl = if c.has("level") { c.level } else if c.has("depth") { c.depth } else { 1 }
      let tiene-num = if c.has("numbering") { c.numbering != none } else { true }
      nivel = if tiene-num { lvl } else { 0 }
      c
    } else if c.func() in (pagebreak, outline, counter.update) {
      vaciar(bloque, nivel)
      bloque = ()
      if c.func() in (pagebreak, outline) {
        nivel = 0
      }
      c
    } else {
      bloque.push(c)
    }
  }
  vaciar(bloque, nivel)
}
