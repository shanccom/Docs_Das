= Metodología de proceso

== Marco metodológico híbrido: Scrum y modelado arquitectónico

Para la concepción, análisis, diseño y especificación del artefacto Arquitectura Genérica se implementó un marco metodológico híbrido. Este combina los principios ágiles del marco de trabajo Scrum para la gestión y coordinación del equipo con el rigor analítico de la Ingeniería de Requisitos con la herramienta Jira y la disciplina de modelado arquitectónico basada en la descomposición de responsabilidades y la trazabilidad de requisitos.

El principio rector del proceso es la trazabilidad estricta y verificable. De esta manera, cada componente, módulo y relación arquitectónica responde directamente a una educción (`EDU`), una ilación (`ILA`), una especificación funcional (`ESP`) y un conjunto de atributos de calidad y restricciones no funcionales (`RNF`).

== Organización del trabajo en equipo mediante Scrum

El desarrollo colaborativo del artefacto se organizó mediante ciclos iterativos fundamentados en Scrum, asignando responsabilidades específicas según las competencias y roles de los diez integrantes del equipo de desarrollo registrados en la base de datos institucional:

- Jefe de Proyecto y Arquitecto de Software (`AUT-0004` Sergio Danilo Hancco Mullisaca): Dirección general del sprint, facilitación de las reuniones de sincronización, definición de los lineamientos arquitectónicos, validación de la consistencia técnica global y firma de conformidad en las actas de trabajo.
- Especialista en Aseguramiento de Calidad / QA (`AUT-0003` Eduardo Joel Cuno Salazar): Verificación y validación cruzada de los diagramas frente al catálogo de requisitos, comprobación de la consistencia de los componentes arquitectónicos y supervisión de las métricas de calidad.
- Gestor de Versionamiento y Base de Datos (`AUT-0001` Mathias Alonso Barrios Medina): Administración del repositorio Git, control de cambios, mantenimiento de la integridad referencial del catálogo de requisitos en la base de datos PostgreSQL y gestión de versiones de los artefactos.
- Analistas de Requisitos y Modeladores de Procesos (`AUT-0002` Yordano Hernan Boza Portilla, `AUT-0006` Dolly Yadhira Mollo Chuquicaña, `AUT-0007` Rafael Diego Nina Calizaya, `AUT-0008` Fabiana Francinet Pacheco Palo, `AUT-0010` Michael Benjamin Suclle Suca): Desglose de las educciones arquitectónicas, identificación de responsabilidades funcionales y modelado de las relaciones entre los componentes del sistema.
- Diseñadores de Software y Maquetación Técnica (`AUT-0005` Denise Andrea Huacani Jara, `AUT-0009` Jeferson Jofre Quispe Madariaga): Elaboración gráfica estandarizada de los diagramas de arquitectura, redacción técnica, integración y maquetación de los documentos en Typst.
- Experto de Dominio y Asesor Docente (`EXP-001` Mg. Percy Oscar Huertas Niquen): Asesoría y retroalimentación formativa.

=== Ceremonias ágiles y Actas de Trabajo

El control y seguimiento del avance se ejecutó a través de las siguientes ceremonias:

- Planificación del Sprint (Sprint Planning): Definición del objetivo de entrega del artefacto de arquitectura, desglose de los diagramas requeridos (contexto, módulos, despliegue y arquitectura genérica) y estimación del esfuerzo por tareas.
- Reuniones periódicas de sincronización (Dailies / Weekly Meetings): Sesiones virtuales de coordinación registradas formalmente en Actas de Trabajo. En cada acta se documenta la agenda tratada, los acuerdos adquiridos, las responsabilidades asignadas y la evaluación individual de los integrantes conforme a los criterios de asistencia, puntualidad, responsabilidad y comunicación.
- Revisión y Retrospectiva del Sprint (Sprint Review & Retrospective): Inspección detallada de los diagramas elaborados por pares revisores (_peer review_), análisis de observaciones técnicas detectadas y acuerdos de mejora continua para el siguiente ciclo.

== Gestión y trazabilidad operativa mediante Jira

Como soporte para la gestión ágil del proyecto, se utilizó la plataforma Jira. Dicho tablero permitió monitorear el ciclo de vida de cada tarea técnica desde su formulación hasta su incorporación definitiva en la documentación formal:

El flujo de trabajo se estructuró en cuatro estados sucesivos:
#pad(left: 1.1em)[
1. Por hacer (To Do / Backlog): Tareas planificadas y desglosadas en espera de ser abordadas.
2. En progreso (In Progress): Tareas asignadas activamente a analistas y diseñadores de software.
3. En revisión / QA (In Review): Diagramas o redacciones concluidas que son sometidas a auditoría de consistencia por parte del Especialista QA y el Arquitecto.
4. Completado (Done): Artefactos aprobados formalmente e integrados en el código fuente documental del repositorio.
]

Entre las actividades gestionadas en Jira se consideraron:
#pad(left: 1.1em)[
- Revisar los resultados de Educción, Ilación y Especificación.
- Identificar responsabilidades arquitectónicas.
- Agrupar responsabilidades y definir componentes genéricos.
- Establecer relaciones entre componentes y servicios externos.
- Elaborar el diagrama de la arquitectura genérica (Nivel 1 y Nivel 2).
- Revisar el diagrama e incorporar observaciones.
- Elaborar las fichas técnicas y la documentación del artefacto.
]

== Proceso sistemático de construcción de la Arquitectura Genérica

La construcción técnica del artefacto se ejecutó siguiendo una secuencia metodológica de ingeniería de software, articulada en seis fases:

=== Fase 1: Extracción y análisis de requisitos arquitectónicos
El equipo analiza las educciones y la documentación previa con impacto directo en la estructura del sistema: `EDU-0001` (gestión integral de pacientes y consentimientos), `EDU-0002` (agenda y check-in con validación síncrona), `EDU-0005` (seguimiento y notas de evolución), `EDU-0006` (registro clínico inmutable), `EDU-0025` (sesión terapéutica y ocupación de camillas), `EDU-0026` (consentimiento informado), `EDU-0029` (control de asistencia de pacientes y verificación síncrona de sesiones), `EDU-0031` (cobro y verificación de paquetes terapéuticos), `EDU-0032` (control de acceso) y `EDU-0033` (auditoría y respaldo).

=== Fase 2: Identificación y agrupación de responsabilidades
Se identificaron las responsabilidades funcionales del sistema y se agruparon por afinidad de dominio, dando lugar a los módulos arquitectónicos principales: Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos.

=== Fase 3: Definición de componentes y relaciones
A partir de las responsabilidades agrupadas se definieron los componentes genéricos de la arquitectura y las relaciones entre ellos, incluyendo los servicios externos que participan en el flujo de atención: firma digital de consentimientos, mensajería por WhatsApp, finanzas y facturación. Se estableció el flujo general de información dentro del sistema.

=== Fase 4: Modelado de la Arquitectura Genérica en dos niveles
Se construyeron los diagramas de arquitectura en dos niveles de granularidad:
- Nivel 1: Vista general que delimita las fronteras de la plataforma frente a los usuarios internos y los servicios externos, identificando los subsistemas de Pacientes y Administración y su acceso a una base de datos compartida.
- Nivel 2: Descomposición que representa cómo las tres sucursales acceden y actualizan de manera centralizada la información de los pacientes mediante un servidor web y una base de datos en la nube, garantizando la continuidad de la atención entre sedes.

=== Fase 5: Verificación cruzada con Requisitos No Funcionales (RNF)
Cada diagrama fue contrastado contra las restricciones de calidad registradas en `rnf_version`:
- Verificación de disponibilidad de documentos en la nube para las tres sucursales (`RNF-0001`).
- Verificación de latencia menor a 3 segundos en búsquedas operativas por DNI (`RNF-0002`).
- Verificación de captura segura de firma digital en menos de 10 segundos (`RNF-0003`).
- Verificación de actualización en tiempo real del estado de recursos clínicos para prevenir colisiones (`RNF-0006`).
- Verificación de generación de constancias en formato PDF en menos de 5 segundos (`RNF-0007`).
- Verificación de inalterabilidad legal del consentimiento informado y la historia clínica (`RNF-0010`).

=== Fase 6: Estandarización de Fichas Técnicas y Documentación en Typst
Cada diagrama de arquitectura modelado fue catalogado mediante una Ficha Técnica de Control Arquitectónico, documentando su código identificador estandarizado (`D-ARQ-001` y `D-DP-001`), requisitos asociados, contexto del módulo, proceso representado, autor, fecha, justificación técnica y estado de validación. Todo el contenido fue integrado en los módulos de Typst respetando la jerarquía tipográfica y las directrices visuales del curso.

El proceso completo puede sintetizarse en la siguiente secuencia estructurada:

#pad(left: 1.1em)[
1. Catálogo de Requisitos en PostgreSQL: Consulta de Educciones (`EDU`), Ilaciones (`ILA`), Especificaciones (`ESP`) y `RNF`.
2. Revisión de requisitos: Análisis de las educciones, ilaciones y especificaciones como insumo arquitectónico.
3. Identificación de responsabilidades: Delimitación de las responsabilidades funcionales del sistema clínico.
4. Agrupación de responsabilidades: Organización por afinidad de dominio en módulos arquitectónicos.
5. Definición de componentes: Identificación de los componentes genéricos del sistema.
6. Definición de relaciones: Establecimiento de las dependencias y el flujo de información entre componentes y servicios externos.
7. Diagramas de Arquitectura Genérica: Modelado de los Niveles 1 y 2.
8. Auditoría contra RNF: Comprobación de disponibilidad, latencias, integridad, tiempo real y seguridad.
9. Fichas Técnicas y Consolidación en Typst: Normalización documental, revisión por pares y aprobación de entrega.
]

== Relación entre el proceso de trabajo y la construcción del artefacto

El marco colaborativo Scrum y la plataforma Jira actuaron como los mecanismos habilitadores para organizar, gestionar y fiscalizar el esfuerzo del equipo, mientras que el proceso de abstracción arquitectónica proveyó el rigor técnico y analítico para construir el artefacto. La correspondencia entre ambas dimensiones se detalla a continuación:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo (Gestión y Control)*], [*Proceso de construcción del artefacto (Técnico / Arquitectónico)*]
  ),
  [Scrum: Planificación del Sprint], [Extracción y análisis de educciones (EDU), ilaciones (ILA) y especificaciones (ESP) desde la base de datos de trazabilidad],
  [Scrum: Actas de Trabajo y Dailies], [Coordinación interdisciplinaria entre analistas de requisitos y diseñadores de software],
  [Jira: Registro y asignación de tareas], [Identificación y agrupación de responsabilidades en módulos arquitectónicos],
  [Jira: Estado "En progreso"], [Definición de componentes y relaciones entre módulos y servicios externos],
  [Scrum: Revisión por pares (QA)], [Auditoría cruzada de consistencia frente a los Requisitos No Funcionales (RNF) y reglas de negocio],
  [Jira: Estado "En revisión"], [Elaboración de Fichas Técnicas de Control Arquitectónico y maquetación modular en Typst],
  [Scrum: Aprobación y V° B° del Jefe de Proyecto], [Validación final, compilación del informe en PDF y cierre formal del artefacto de arquitectura genérica],
)

En consecuencia, la metodología permitió organizar el trabajo colaborativo mediante Scrum y Jira, mientras que los resultados obtenidos previamente sirvieron como base para transformar los requisitos del sistema clínico en una representación arquitectónica genérica estructurada y trazable.