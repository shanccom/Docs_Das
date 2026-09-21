= Descripción del artefacto

La construcción del presente artefacto corresponde al diseño de la Arquitectura Genérica del sistema clínico para una clínica de fisioterapia. Para su elaboración se toman como base los resultados obtenidos en las etapas previas de Educción, Ilación y Especificación, los cuales permiten identificar las necesidades, relaciones y requisitos que debe atender el sistema.

A partir de estos resultados se identifican las principales responsabilidades del sistema, las cuales son organizadas en componentes y relacionadas entre sí para representar de manera general la estructura de la solución. En esta etapa se busca mantener un nivel de abstracción que permita comprender la organización del sistema sin depender todavía de tecnologías, lenguajes de programación o herramientas específicas.

En los siguientes apartados se presentan los resultados de Educción, Ilación y Especificación como insumos para el diseño, y posteriormente se presenta la Arquitectura Genérica, mostrando sus principales componentes, responsabilidades y relaciones.

== Insumos para la construcción de la arquitectura

La arquitectura genérica no se construye de manera independiente, sino a partir de los resultados obtenidos en las actividades previas del proyecto. Estos resultados permiten conocer las necesidades del sistema y determinar las responsabilidades que posteriormente serán representadas en la arquitectura.

=== Educción

En esta etapa se recopila y analiza la información proporcionada por los involucrados y las necesidades identificadas para el sistema clínico. La información obtenida permite comprender el contexto en el que funcionará el sistema, los actores involucrados y las principales necesidades que deben ser atendidas.

=== Ilación

A partir de la información obtenida durante la educción, se establecen relaciones entre las necesidades, procesos y elementos identificados. La ilación permite organizar la información y encontrar relaciones que posteriormente serán utilizadas para determinar las responsabilidades del sistema.

=== Especificación

La especificación permite formalizar los requerimientos que debe satisfacer el sistema. En esta etapa se identifican y organizan los requisitos funcionales y no funcionales que servirán como referencia para la definición de los componentes y responsabilidades de la arquitectura.

== Construcción de la Arquitectura Genérica

Una vez analizados los resultados de Educción, Ilación y Especificación, se procede a identificar las responsabilidades principales que debe cubrir el sistema clínico. Estas responsabilidades se agrupan en componentes arquitectónicos que permiten representar de manera general la estructura de la solución.

La construcción de la arquitectura considera principalmente tres aspectos: las responsabilidades de cada componente, las relaciones existentes entre los componentes y el flujo general de información dentro del sistema. De esta manera, el diagrama arquitectónico permite observar cómo las diferentes partes de la solución se relacionan para atender los requerimientos previamente identificados.

=== Diagrama de la Arquitectura Genérica — Nivel 1

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-1.png", width: 10cm),
  caption: [Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 1],
)

=== Diagrama de la Arquitectura Genérica — Nivel 2

#figure(
  image("../imagenes/diagramas/diagrama-arquitectura-nivel-2.png", width: 14cm),
  caption: [Diagrama de la Arquitectura Genérica del sistema OmVital Physio Control — Nivel 2],
)