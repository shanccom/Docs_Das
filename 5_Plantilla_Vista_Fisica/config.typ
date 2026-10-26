//  CONFIGURACIÓN DEL INFORME  (aquí cambias todo, no en el texto)

// --- Portada: datos ---
#let universidad = "UNIVERSIDAD NACIONAL DE SAN AGUSTÍN"
#let curso    = "DISEÑO Y ARQUITECTURA DE SOFTWARE"
#let semestre = "2026-B"
#let resultado-estudiante = "OmVital Physio Control"
#let titulo   = "OmVital Physio Control"   // nombre real del sistema (aparece en grande bajo «NOMBRE DEL SISTEMA A CONSTRUIR»)
#let version-documento = "1.0.0"

#let color-seccion-a = rgb("#fff59d") // Amarillo
#let color-seccion-b = rgb("#a4d8f0") // Azul como celeste

// Integrantes: la portada los reparte en 2 columnas (hasta 5 por columna).
// Agrega o quita líneas; cada uno va en su propia línea.
#let integrantes = (
  highlight(fill: color-seccion-b)[Barrios Medina Mathias Alonso (B)],
  highlight(fill: color-seccion-b)[Boza Portilla Yordano Hernan (B)],
  highlight(fill: color-seccion-a)[Cuno Salazar Eduardo Joel (A)],
  highlight(fill: color-seccion-b)[Hancco Mullisaca Sergio Danilo (B)],
  highlight(fill: color-seccion-b)[Huacani Jara Denise Andrea (B)],
  highlight(fill: color-seccion-a)[Mollo Chuquicaña Dolly Yadhira (A)],
  highlight(fill: color-seccion-b)[Nina Calizaya Rafael Diego (B)],
  highlight(fill: color-seccion-b)[Pacheco Palo Fabiana Francinet (B)],
  highlight(fill: color-seccion-a)[Quispe Madariaga Jeferson Jofre (A)],
  highlight(fill: color-seccion-b)[Suclle Suca Michael Benjamin (B)],
)
#let docente = "Mg. Percy Huertas Niquen"
#let lugar   = "Arequipa - Perú"
#let fecha   = "08 - 10 - 2026"
// Para que la fecha sea la del día de compilación, usa:
// #let fecha = datetime.today().display("[day] - [month] - [year]")

// --- Encabezado e imágenes (aparece en todas las páginas) ---
#let facultad         = "FACULTAD DE INGENIERÍA PRODUCCIÓN Y SERVICIOS"
#let escuela          = "ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMAS"
#let logo-izquierdo   = "imagenes/logo-izquierdo.png"   // pon none para no usar logo
#let logo-derecho     = "imagenes/logo-derecho.png"
#let altura-logo      = 1.4cm       // tamaño/alto de los logos (cabecera)
#let altura-logo-portada = 1.7cm   // tamaño/alto del logo en la portada
#let tamano-encabezado = 7.5pt     // tamaño de fuente del texto del encabezado

// --- Posición del encabezado y separación ---
#let distancia-encabezado-arriba = 1.5cm   // distancia desde el borde superior de la hoja hasta el encabezado
#let separacion-encabezado-texto = 0.8cm // espacio libre entre el encabezado y el texto (índice, títulos, contenido)

// --- Opciones ---
#let portada            = true    // mostrar portada
#let indice             = true    // mostrar índice
#let numerar-paginas    = true
#let encabezado-paginas = true    // mostrar cabecera en todas las páginas

// --- Tipografía ---
#let fuente        = ("Times New Roman", "New Computer Modern")   // se usa la primera que exista
#let tamano        = 11pt
#let interlineado  = 0.7em
#let espacio-parrafo = 1.1em
#let justificar    = true
#let idioma        = "es"

// --- Portada: estilo ---
#let tamano-titulo-portada = 28pt
#let color-lineas-portada  = luma(140)

// --- Página y Márgenes ---
#let papel           = "a4"
#let margen-lateral  = 2cm
#let margen-inferior = 2.5cm

// --- Títulos ---
#let numeracion-titulos = "1.1"
#let ancho-numero = 1.2cm        // ancho de la columna del número; el texto se alinea aquí
#let tamano-titulos = (11pt, 11pt, 11pt)   // nivel 1, 2, 3 (mismo tamaño que el contenido en negrita)
#let color-titulos  = black
