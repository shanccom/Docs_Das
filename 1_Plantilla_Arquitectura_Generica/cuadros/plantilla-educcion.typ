// =============================================================================
// PLANTILLA DE EDUCCIÓN (DAS - UNSA)
// =============================================================================
// Formato estilo Google Docs:
// - Encabezado verde pastel (#b7e1cd) con texto negro en negrita.
// - Cuadro centrado en la página con márgenes a izquierda y derecha.
// - Texto interior alineado a la izquierda.
// =============================================================================

#let plantilla_educcion(
  codigo: "EDU-DDDD",
  nombre: "Nombre de la educción",
  version: "DD.DD",
  fecha: "DD/MM/AA",
  autor: "AUT-DDDD",
  actor: "ACT-DDDD",
  fuente: "FUE-DDDD / Ninguno",
  experto: "EXP-DDDD / Ninguno",
  codigo_ilacion: "ILA-DDDD",
  descripcion: "Descripción de lo manifestado por el entrevistado",
  importancia: "Vital / Opcional",
  estado: "Pendiente / Concluido",
  comentario: "Detalles relevantes / Ninguno",
  // Opciones de personalización y estilo Google Docs
  color_encabezado: rgb("#93c47d"), // Verde Google Docs más oscuro (Medium green)
  color_texto_encabezado: black,
  ancho_tabla: 100%,                // Ancho completo aprovechando los márgenes
  ancho_columna_1: 4.0cm,           // Ancho adecuado para los nombres de campos
  ancho_columna_2: 1fr,             // Ancho restante para los valores
  alineacion: (left + top, left + top),
  inset: (x: 7pt, y: 5pt),
  stroke: 0.5pt + luma(140),
  tamano_letra: 9pt,                // Tamaño de letra óptimo
  ..args,
) = {
  let named = args.named()
  let cod = named.at("codigo-educcion", default: named.at("codigo_educcion", default: codigo))
  let nom = named.at("nombre", default: nombre)
  let ver = named.at("version", default: version)
  let fec = named.at("fecha", default: fecha)
  let aut = named.at("autor-plantilla", default: named.at("autor_plantilla", default: named.at("autor", default: autor)))
  let act = named.at("actor", default: actor)
  let fue = named.at("fuente", default: fuente)
  let exp = named.at("experto", default: experto)
  let ila = named.at("codigo-ilacion", default: named.at("codigo_ilacion", default: named.at("ilacion", default: codigo_ilacion)))
  let des = named.at("descripcion", default: descripcion)
  let imp = named.at("importancia", default: importancia)
  let est = named.at("estado", default: estado)
  let com = named.at("comentario", default: comentario)
  let col_enc = named.at("color-encabezado", default: named.at("color_encabezado", default: color_encabezado))
  let col_txt = named.at("color-texto-encabezado", default: named.at("color_texto_encabezado", default: color_texto_encabezado))
  let w_tab = named.at("ancho-tabla", default: named.at("ancho_tabla", default: named.at("ancho", default: ancho_tabla)))
  let w1 = named.at("ancho-columna-1", default: named.at("ancho_columna_1", default: ancho_columna_1))
  let w2 = named.at("ancho-columna-2", default: named.at("ancho_columna_2", default: ancho_columna_2))
  let ali = named.at("alineacion", default: alineacion)
  let ins = named.at("inset", default: inset)
  let stk = named.at("stroke", default: stroke)
  let tam = named.at("tamano-letra", default: named.at("tamano_letra", default: tamano_letra))

  align(center)[
    #block(width: w_tab)[
      #set text(size: tam)
      #set par(justify: false, leading: 0.55em)
      #table(
        columns: (w1, w2),
        align: ali,
        inset: ins,
        stroke: stk,
        table.header(repeat: false,
          table.cell(fill: col_enc, align: left + horizon)[
            #text(fill: col_txt, weight: "bold")[Código educción]
          ],
          table.cell(fill: col_enc, align: left + horizon)[
            #text(fill: col_txt, weight: "bold")[#cod]
          ],
        ),
        [*Nombre*], [#nom],
        [*Versión*], [#ver],
        [*Fecha*], [#fec],
        [*Autor de la plantilla*], [#aut],
        [*Actor*], [#act],
        [*Fuente*], [#fue],
        [*Experto*], [#exp],
        [*Código ilación*], [#ila],
        [*Descripción*], [#des],
        [*Importancia*], [#imp],
        [*Estado*], [#est],
        [*Comentario*], [#com],
      )
    ]
  ]
}

// Alias con guiones (kebab-case)
#let plantilla-educcion = plantilla_educcion
