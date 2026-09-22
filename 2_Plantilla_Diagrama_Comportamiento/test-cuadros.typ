// Archivo de prueba para verificar las 3 plantillas de cuadros
#import "cuadros/mod.typ": *

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
)
#set text(font: ("Times New Roman", "New Computer Modern"), size: 10pt, lang: "es")

#align(center)[
  #text(size: 16pt, weight: "bold")[VERIFICACIÓN DE PLANTILLAS DE CUADROS]
]

#v(0.5cm)

== 1. Plantilla de Educción (Encabezado Verde)

#plantilla_educcion()

#pagebreak()

== 2. Plantilla de Ilación (Encabezado Azul)

#plantilla_ilacion()

#pagebreak()

== 3. Plantilla de Especificación (Encabezado Amarillo)

#plantilla_especificacion()

#v(0.5cm)

== 3.1. Plantilla de Especificación con Datos de Ejemplo

#plantilla_especificacion(
  codigo: "ESP-0001",
  nombre: "Especificación de Registro de Pacientes",
  version: "1.0.0",
  fecha: "21/09/26",
  autor: "AUT-0001",
  actor: "ACT-0003",
  fuente: "ENT-0001",
  experto: "EXP-0001",
  codigo_ilacion: "ILA-0001",
  precondicion: [El recepcionista ha iniciado sesión y se encuentra en el módulo de recepción.],
  procedimiento: [
    1. El recepcionista solicita el documento de identidad. \
    2. Ingresa el número y consulta en el sistema. \
    3. Si no existe, completa los datos personales y registra la ficha. \
    4. Emite el consentimiento informado para firma del paciente.
  ],
  postcondicion: [La ficha del paciente queda registrada y lista para el check-in médico.],
  codigo_artefactos_asociados: "DIA-CMP-0001, GUI-0001",
  importancia: "Vital",
  estado: "Concluido",
  comentario: "Cumple con las directivas de trazabilidad y privacidad de datos.",
)
