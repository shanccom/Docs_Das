= Metodología de proceso

== Marco metodológico híbrido: Scrum y modelado UML 2.5

Para la concepción, análisis y diseño del artefacto Vista Lógica se implementó un marco metodológico híbrido. Este combina los principios ágiles del marco de trabajo Scrum para la gestión y coordinación del equipo con el rigor analítico de la Ingeniería de Requisitos con la herramienta Jira y el estándar UML 2.5 para el modelado orientado a objetos.

El principio rector del proceso es la trazabilidad estricta y verificable: cada clase, atributo, método y relación del modelo lógico responde a una educción (`EDU`), una ilación (`ILA`), una especificación funcional (`ESP`) y un conjunto de atributos de calidad (`RNF`).

== Organización del trabajo en equipo mediante Scrum

El desarrollo colaborativo del artefacto se organizó mediante ciclos iterativos fundamentados en Scrum, asignando responsabilidades específicas según las competencias y roles de los diez integrantes del equipo:

- Jefe de Proyecto y Arquitecto de Software (`AUT-0004` Sergio Danilo Hancco Mullisaca): Dirección general del sprint, definición de los lineamientos del modelo lógico, validación de la consistencia técnica y firma de conformidad en las actas de trabajo.
- Especialista en Aseguramiento de Calidad / QA (`AUT-0003` Eduardo Joel Cuno Salazar): Verificación y validación cruzada del modelo de clases frente al catálogo de requisitos y comprobación de la consistencia sintáctica UML 2.5.
- Gestor de Versionamiento y Base de Datos (`AUT-0001` Mathias Alonso Barrios Medina): Administración del repositorio Git, control de cambios y mantenimiento de la integridad referencial del catálogo de requisitos en PostgreSQL.
- Analistas de Requisitos y Modeladores (`AUT-0002` Yordano Hernan Boza Portilla, `AUT-0006` Dolly Yadhira Mollo Chuquicaña, `AUT-0007` Rafael Diego Nina Calizaya, `AUT-0008` Fabiana Francinet Pacheco Palo, `AUT-0010` Michael Benjamin Suclle Suca): Desglose de las educciones e identificación de clases, atributos, métodos y responsabilidades.
- Diseñadores de Software y Maquetación Técnica (`AUT-0005` Denise Andrea Huacani Jara, `AUT-0009` Jeferson Jofre Quispe Madariaga): Elaboración de los diagramas de clases en PlantUML y maquetación de los documentos en Typst.
- Experto de Dominio y Asesor Docente (`EXP-001` Mg. Percy Oscar Huertas Niquen): Asesoría y retroalimentación formativa.

=== Ceremonias ágiles y Actas de Trabajo

El control y seguimiento del avance se ejecutó a través de las siguientes ceremonias:

- Planificación del Sprint (Sprint Planning): Definición del objetivo de entrega del modelo lógico, desglose de los diagramas requeridos (paquetes y clases) y estimación del esfuerzo por tareas.
- Reuniones periódicas de sincronización (Dailies / Weekly Meetings): Sesiones virtuales de coordinación registradas en Actas de Trabajo, documentando agenda, acuerdos, responsabilidades y evaluación individual.
- Revisión y Retrospectiva del Sprint (Sprint Review & Retrospective): Inspección de los diagramas por pares revisores, análisis de observaciones y acuerdos de mejora continua.

== Gestión y trazabilidad operativa mediante Jira

Como soporte para la gestión ágil del proyecto se utilizó la plataforma Jira, monitoreando el ciclo de vida de cada tarea técnica:

#pad(left: 1.1em)[
1. Por hacer (To Do / Backlog): Tareas planificadas y desglosadas en espera de ser abordadas.
2. En progreso (In Progress): Tareas asignadas activamente a analistas y diseñadores.
3. En revisión / QA (In Review): Diagramas concluidos sometidos a auditoría de consistencia.
4. Completado (Done): Artefactos aprobados e integrados en el repositorio.
]

== Proceso sistemático de construcción de la Vista Lógica

La construcción técnica del artefacto se ejecutó siguiendo una secuencia metodológica de ingeniería de software, articulada en cinco fases:

=== Fase 1: Extracción y análisis de requisitos
El equipo analiza las educciones, ilaciones y especificaciones con impacto en la estructura lógica: `EDU-0001` (gestión de pacientes), `EDU-0002` (agenda y citas), `EDU-0005` (seguimiento clínico), `EDU-0006` (registro clínico), `EDU-0025` (sesión terapéutica y camillas), `EDU-0029` (control de asistencia), `EDU-0031` (paquetes terapéuticos), `EDU-0032` (control de acceso) y `EDU-0033` (auditoría).

=== Fase 2: Identificación de clases y paquetes
A partir de las responsabilidades funcionales se identifican las clases de dominio y se agrupan en paquetes lógicos coherentes con los módulos de la arquitectura genérica.

=== Fase 3: Definición de atributos, métodos y relaciones
Se asignan atributos y métodos a cada clase con base en las especificaciones (`ESP`), y se establecen las relaciones estructurales entre clases (asociación, agregación, composición, herencia y dependencia).

=== Fase 4: Verificación cruzada con Requisitos No Funcionales (RNF)
Cada clase fue contrastada contra las restricciones de calidad:
- Verificación del tiempo máximo de respuesta en búsqueda por DNI (`RNF-0002`).
- Verificación de la captura inalterable de firma en tiempo límite (`RNF-0003`).
- Verificación de la visualización de camillas en tiempo real (`RNF-0006`).
- Verificación de la generación automática de constancias en PDF (`RNF-0007`).
- Verificación de la disponibilidad de documentos en la nube (`RNF-0001`).

=== Fase 5: Elaboración de diagramas y documentación en Typst
Cada diagrama fue catalogado mediante una Ficha Técnica de Control Arquitectónico (`D-LOG-xxx`), documentando código, requisitos asociados, contexto, proceso representado, autor, fecha, justificación y estado. Todo el contenido se integró en Typst respetando la jerarquía tipográfica del curso.

El proceso completo puede sintetizarse en la siguiente secuencia:

#pad(left: 1.1em)[
1. Catálogo de Requisitos en PostgreSQL: consulta de Educciones (`EDU`), Ilaciones (`ILA`), Especificaciones (`ESP`) y `RNF`.
2. Identificación de clases de dominio y paquetes lógicos.
3. Definición de atributos, métodos y visibilidad.
4. Establecimiento de relaciones entre clases.
5. Auditoría contra RNF.
6. Fichas Técnicas y consolidación en Typst.
]

== Relación entre el proceso de trabajo y la construcción del artefacto

El marco colaborativo Scrum y la plataforma Jira actuaron como los mecanismos habilitadores para organizar y fiscalizar el esfuerzo del equipo, mientras que el modelado UML 2.5 proveyó el rigor técnico. La correspondencia entre ambas dimensiones se detalla a continuación:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo (Gestión y Control)*], [*Proceso de construcción del artefacto (Técnico / UML)*]
  ),
  [Scrum: Planificación del Sprint], [Extracción y análisis de educciones (EDU), ilaciones (ILA) y especificaciones (ESP)],
  [Scrum: Actas de Trabajo y Dailies], [Coordinación entre analistas de requisitos y diseñadores de software],
  [Jira: Registro y asignación de tareas], [Identificación de clases de dominio y paquetes lógicos],
  [Jira: Estado "En progreso"], [Definición de atributos, métodos y relaciones entre clases],
  [Scrum: Revisión por pares (QA)], [Auditoría cruzada de consistencia frente a los RNF],
  [Jira: Estado "En revisión"], [Elaboración de Fichas Técnicas y maquetación modular en Typst],
  [Scrum: Aprobación y V° B° del Jefe de Proyecto], [Validación final, compilación del informe en PDF y cierre del artefacto],
)

En consecuencia, la metodología permitió organizar el trabajo colaborativo mediante Scrum y Jira, mientras que el modelado UML transformó los requisitos del sistema clínico en un modelo lógico de clases trazable y estructurado.