= Metodología de proceso

Para la construcción del artefacto Arquitectura Genérica del sistema clínico, se empleó un proceso basado en la metodología ágil Scrum, utilizando Jira como herramienta de apoyo para la planificación, organización y seguimiento de las actividades del equipo.

El proceso tomó como punto de partida los resultados obtenidos previamente durante las etapas de Educción, Ilación y Especificación, los cuales fueron utilizados como insumo para realizar la definición de la arquitectura genérica del sistema.

La metodología aplicada permitió organizar el trabajo del equipo mediante actividades planificadas y revisiones progresivas del artefacto.

== Organización del trabajo mediante Scrum

El desarrollo del artefacto se organizó utilizando los principios de Scrum, distribuyendo las actividades en periodos de trabajo y realizando un seguimiento continuo de su avance.

Para ello se consideraron las siguientes actividades:

- Planificación: Definición y desglose de las actividades para construir y documentar la arquitectura genérica. 
- Distribución de tareas: Asignación de las actividades entre los integrantes del equipo.
- Seguimiento: Control continuo del avance de tareas a través de reuniones periódicas y actas de trabajo. 
- Revisión: Evaluación del resultado obtenido y detección de aspectos que requerían ajustes.
- Mejora: incorporación de las observaciones obtenidas para mejorar la arquitectura y su documentación.

== Uso de Jira

La herramienta Jira fue utilizada como soporte para la gestión del trabajo del equipo. En ella se registraron y organizaron las actividades relacionadas con la construcción del artefacto.

Las actividades fueron gestionadas mediante tareas asociadas a las diferentes etapas del trabajo, permitiendo conocer su estado y responsable.

De manera general, se utilizó un flujo similar al siguiente:
#pad(left:1.1em)[
1. Por hacer
2. En progreso
3. En revisión
4. Completado

]
Entre las actividades gestionadas se consideraron:
#pad(left:1.1em)[
- Revisar los resultados de Educción, Ilación y Especificación.
- Identificar responsabilidades arquitectónicas.
- Definir componentes genéricos.
- Establecer relaciones entre componentes.
- Elaborar el diagrama de arquitectura.
- Revisar el diagrama.
- Incorporar observaciones.
- Elaborar la documentación del artefacto.

]
El uso de Jira permitió mantener un registro del avance de las actividades y facilitar la coordinación entre los integrantes del equipo.

== Construcción de la Arquitectura Genérica

A partir de los resultados obtenidos previamente, se realizó un proceso de abstracción arquitectónica.

Primero, se revisaron los requisitos y funcionalidades identificados para el sistema clínico. Posteriormente, estos elementos fueron agrupados de acuerdo con sus responsabilidades, permitiendo identificar los principales componentes que deberían formar parte de la arquitectura.

Luego se establecieron las relaciones y dependencias entre dichos componentes y se construyó el diagrama de arquitectura genérica.

El proceso puede resumirse de la siguiente manera:

#pad(left:1.1em)[
1. Educción + Ilación + Especificación
2. Revisión de requisitos
3. Identificación de responsabilidades
4. Agrupación de responsabilidades
5. Definición de componentes
6. Definición de relaciones
7. Diagrama de Arquitectura Genérica

]
== Relación entre el proceso de trabajo y la construcción del artefacto

Scrum y Jira fueron utilizados como mecanismos para organizar y controlar el trabajo del equipo, mientras que el proceso de abstracción arquitectónica permitió construir el artefacto técnico.

De esta manera, ambos enfoques se complementan:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo*], [*Proceso de construcción del artefacto*]
  ),
  [Scrum], [Educción, Ilación y Especificación como insumo],
  [Jira], [Registro, gestión y seguimiento de tareas],
  [Planificación], [Definición de componentes],
  [Asignación de tareas], [Definición de relaciones],
  [Seguimiento], [Construcción y refinamiento del diagrama],
)

En consecuencia, la metodología permitió organizar el trabajo colaborativo mediante Scrum y Jira, mientras que los resultados obtenidos previamente sirvieron como base para transformar los requisitos del sistema clínico en una representación arquitectónica genérica.