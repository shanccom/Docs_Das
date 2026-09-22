= Metodología de proceso

== Marco metodológico híbrido: Scrum y Modelado UML 2.5

Para la concepción, análisis, diseño y especificación formal del artefacto *Diagrama de Comportamiento* se implementó un marco metodológico estructurado de naturaleza híbrida. Este combina los principios ágiles del marco de trabajo *Scrum* para la gestión y coordinación del equipo con el rigor analítico de la *Ingeniería de Requisitos* con la herramienta Jira y el estándar internacional *UML 2.5* (_Unified Modeling Language_).

El principio rector del proceso es la *trazabilidad estricta y verificable*. De esta manera, cada caso de uso, flujo de actividades, transición de estados e interacción de mensajes responde directamente a una educción (`EDU`), una ilación (`ILA`), una especificación funcional (`ESP`) y un conjunto de atributos de calidad y restricciones no funcionales (`RNF`).

== Organización del trabajo en equipo mediante Scrum

El desarrollo colaborativo del artefacto se organizó mediante ciclos iterativos fundamentados en Scrum, asignando responsabilidades específicas según las competencias y roles de los diez integrantes del equipo de desarrollo registrados en la base de datos institucional:

- *Jefe de Proyecto y Arquitecto de Software* (`AUT-0004` Sergio Danilo Hancco Mullisaca): Dirección general del sprint, facilitación de las reuniones de sincronización, definición de los lineamientos arquitectónicos, validación de la consistencia técnica global y firma de conformidad en las actas de trabajo.
- *Especialista en Aseguramiento de Calidad / QA* (`AUT-0003` Eduardo Joel Cuno Salazar): Verificación y validación cruzada de los diagramas frente al catálogo de requisitos, comprobación de la consistencia sintáctica UML 2.5 y supervisión de las métricas de calidad.
- *Gestor de Versionamiento y Base de Datos* (`AUT-0001` Mathias Alonso Barrios Medina): Administración del repositorio Git, control de cambios, mantenimiento de la integridad referencial del catálogo de requisitos en la base de datos PostgreSQL y gestión de versiones de los artefactos.
- *Analistas de Requisitos y Modeladores de Procesos* (`AUT-0002` Yordano Hernan Boza Portilla, `AUT-0006` Dolly Yadhira Mollo Chuquicaña, `AUT-0007` Rafael Diego Nina Calizaya, `AUT-0008` Fabiana Francinet Pacheco Palo, `AUT-0010` Michael Benjamin Suclle Suca): Desglose exhaustivo de las educciones conductuales, formalización de precondiciones y postcondiciones en las ilaciones y especificaciones, y modelado de flujos principales, alternativos y de excepción.
- *Diseñadores de Software y Maquetación Técnica* (`AUT-0005` Denise Andrea Huacani Jara, `AUT-0009` Jeferson Jofre Quispe Madariaga): Elaboración gráfica estandarizada de los diagramas mediante herramientas CASE (PlantUML), redacción técnica, integración y maquetación de los documentos en Typst.
- *Experto de Dominio y Asesor Docente* (`EXP-001` Mg. Percy Oscar Huertas Niquen): Asesoría y retroalimentación formativa.

=== Ceremonias ágiles y Actas de Trabajo

El control y seguimiento del avance se ejecutó a través de las siguientes ceremonias:

- *Planificación del Sprint (Sprint Planning)*: Definición del objetivo de entrega del artefacto de comportamiento, desglose de los diagramas requeridos (casos de uso, actividades de procesos clínicos, estados de entidades y secuencia) y estimación del esfuerzo por tareas.
- *Reuniones periódicas de sincronización (Dailies / Weekly Meetings)*: Sesiones virtuales de coordinación registradas formalmente en *Actas de Trabajo*. En cada acta se documenta la agenda tratada, los acuerdos adquiridos, las responsabilidades asignadas y la evaluación individual de los integrantes conforme a los criterios de asistencia, puntualidad, responsabilidad y comunicación.
- *Revisión y Retrospectiva del Sprint (Sprint Review & Retrospective)*: Inspección detallada de los diagramas elaborados por pares revisores (_peer review_), análisis de observaciones técnicas detectadas y acuerdos de mejora continua para el siguiente ciclo.

== Gestión y trazabilidad operativa mediante Jira

Como soporte para la gestión ágil del proyecto, se utilizó la plataforma *Jira*. Dicho tablero permitió monitorear el ciclo de vida de cada tarea técnica desde su formulación hasta su incorporación definitiva en la documentación formal:

El flujo de trabajo se estructuró en cuatro estados sucesivos:
#pad(left: 1.1em)[
1. *Por hacer (To Do / Backlog)*: Tareas planificadas y desglosadas en espera de ser abordadas.
2. *En progreso (In Progress)*: Tareas asignadas activamente a analistas y diseñadores de software.
3. *En revisión / QA (In Review)*: Diagramas o redacciones concluidas que son sometidas a auditoría de consistencia por parte del Especialista QA y el Arquitecto.
4. *Completado (Done)*: Artefactos aprobados formalmente e integrados en el código fuente documental del repositorio.
]


== Proceso sistemático de construcción de los Diagramas de Comportamiento

La construcción técnica del artefacto se ejecutó siguiendo una secuencia metodológica rigurosa de ingeniería de software, articulada en seis fases interconectadas:

=== Fase 1: Extracción y análisis de requisitos conductuales 
El equipo analiza las educciones y docuemntación anteriro dada con impacto directo en el comportamiento dinámico del sistema: `EDU-0001` (gestión integral de pacientes y consentimientos), `EDU-0002` (agenda y check-in con validación síncrona), `EDU-0005` (seguimiento y notas de evolución), `EDU-0006` (registro clínico inmutable), `EDU-0025` (sesión terapéutica y ocupación de camillas), `EDU-0027` (sincronización multi-sede), `EDU-0029` (control de asistencia con firma digital) y `EDU-0031` (cobro y verificación de paquetes terapéuticos).

=== Fase 2: Delimitación de actores y modelado de Casos de Uso
Se identificaron las fronteras del sistema clínico y las responsabilidades operacionales de cada actor (`ACT-0001` FisioTerapeuta, `ACT-0002` Coordinador de Sucursal, `ACT-0003` Recepcionista, `ACT-0004` Gerente y Paciente). Se estructuraron los paquetes de casos de uso aplicando relaciones de inclusión (`<<include>>`) para operaciones obligatorias (como la verificación de credenciales y la validación financiera de saldo) y relaciones de extensión (`<<extend>>`) para flujos condicionales o de contingencia (como la suspensión médica por banderas rojas o el registro de penalidad por tardanza).

=== Fase 3: Modelado de procesos de negocio y flujos procedimentales (Diagramas de Actividades)
A partir de las descripciones procedimentales de las ilaciones (`ilacion_version`), se modeló la lógica temporal y las compuertas de decisión de los procesos asistenciales y administrativos. Se enfatizó el modelado de:
- *Bifurcaciones de decisión financiera*: Verificación de saldo positivo en paquete versus saldo agotado, derivando a caja antes del check-in.
- *Compuertas de decisión clínica (Banderas Rojas)*: Detección de anomalías en constantes vitales o contraindicaciones patológicas durante la evaluación del fisioterapeuta, activando la derivación de emergencia y la suspensión de la terapia sin penalizar la sesión del paciente.
- *Acciones concurrentes de cierre*: Actualización reactiva del estado de la camilla a "Disponible / En Desinfección", firma digital del paciente y generación en segundo plano de la constancia PDF y recordatorios por WhatsApp.

=== Fase 4: Modelado del ciclo de vida de entidades (Diagramas de Estados)
Se modelaron las máquinas de estado finito para aquellas entidades de dominio cuya conducta depende críticamente de su estado actual y eventos recibidos:
- *Cita Médica*: Transiciones entre `Programada`, `Confirmada`, `En Sala (Check-in Realizado)`, `En Atención Clínica`, `Finalizada`, `Cancelada` y `No Asistió`.
- *Camilla / Recurso Físico*: Transiciones entre `Disponible`, `Reservada`, `Ocupada en Tratamiento` y `En Desinfección / Limpieza`.
- *Expediente del Paciente*: Transiciones entre `Activo`, `Inactivo` y `Archivo Histórico`, respetando la regla de inmutabilidad legal que prohíbe el borrado físico de datos clínicos.

=== Fase 5: Verificación cruzada con Requisitos No Funcionales (RNF)
Cada diagrama fue contrastado rigurosamente contra las restricciones de calidad registradas en `rnf_version`:
- Verificación de latencia menor a 3 segundos en búsquedas operativas por DNI (`RNF-0002`).
- Verificación de captura segura de firma digital en menos de 10 segundos (`RNF-0003`).
- Verificación de actualización en tiempo real del estado de recursos clínicos para prevenir colisiones (`RNF-0006`).
- Verificación de generación de constancias en formato PDF en menos de 5 segundos (`RNF-0007`).
- Verificación de inalterabilidad legal del consentimiento informado y la historia clínica (`RNF-0010`).
- Verificación de disponibilidad de documentos en la nube para las tres sucursales (`RNF-0001`).

=== Fase 6: Estandarización de Fichas Técnicas y Documentación en Typst
Cada diagrama de comportamiento modelado fue catalogado mediante una *Ficha Técnica de Control Arquitectónico*, documentando su código identificador estandarizado (`D-COMP-xxx`), requisitos asociados, contexto del módulo, proceso representado, autor, fecha, justificación técnica y estado de validación. Todo el contenido fue integrado en los módulos de Typst respetando la jerarquía tipográfica y las directrices visuales del curso.

El proceso completo puede sintetizarse en la siguiente secuencia estructurada:

#pad(left: 1.1em)[
1. *Catálogo de Requisitos en PostgreSQL*: Consulta de Educciones (`EDU`), Ilaciones (`ILA`), Especificaciones (`ESP`) y `RNF`.
2. *Mapeo de Actores y Disparadores*: Delimitación de actores humanos (`ACT-0001` a `ACT-0004`), servicios externos y eventos operacionales.
3. *Modelado de Casos de Uso*: Definición del límite del sistema y relaciones `<<include>>` y `<<extend>>`.
4. *Modelado de Actividades y Procesos*: Orquestación de flujos clínicos, compuertas de decisión de banderas rojas y caminos de excepción.
5. *Modelado de Estados de Entidades*: Ciclos de vida para Cita Médica, Camilla y Expediente Clínico inmutable.
6. *Auditoría contra RNF*: Comprobación de latencias, integridad de firma, consistencia ACID y tiempo real.
7. *Fichas Técnicas y Consolidación en Typst*: Normalización documental, revisión por pares y aprobación de entrega.
]
/*

== Relación entre el proceso de trabajo y la construcción del artefacto

El marco colaborativo Scrum y la plataforma Jira actuaron como los mecanismos habilitadores para organizar, gestionar y fiscalizar el esfuerzo del equipo, mientras que el marco de modelado UML y la ingeniería de requisitos proveyeron el rigor técnico y analítico. La correspondencia entre ambas dimensiones se detalla a continuación:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo (Gestión y Control)*], [*Proceso de construcción del artefacto (Técnico / UML)*]
  ),
  [Scrum: Planificación del Sprint], [Extracción y análisis de educciones (EDU) e ilaciones (ILA) desde la base de datos de trazabilidad],
  [Scrum: Actas de Trabajo y Dailies], [Coordinación interdisciplinaria entre analistas de requisitos y diseñadores de software],
  [Jira: Registro y asignación de tareas], [Modelado de Casos de Uso y delimitación de fronteras de los actores (ACT-0001 a ACT-0004)],
  [Jira: Estado "En progreso"], [Construcción de Diagramas de Actividades y Diagramas de Máquinas de Estado en PlantUML],
  [Scrum: Revisión por pares (QA)], [Auditoría cruzada de consistencia frente a los Requisitos No Funcionales (RNF) y reglas de negocio],
  [Jira: Estado "En revisión"], [Elaboración de Fichas Técnicas de Control Arquitectónico y maquetación modular en Typst],
  [Scrum: Aprobación y V° B° del Jefe de Proyecto], [Validación final, compilación del informe en PDF y cierre formal del artefacto de comportamiento],
)

