= Metodología de proceso

== Marco metodológico híbrido: Scrum y modelado dinámico UML 2.5

Para la formulación, análisis y diseño del artefacto técnico correspondiente a la *Vista de Procesos*, el equipo de ingeniería implementó un marco metodológico híbrido. Este enfoque articula las prácticas colaborativas y de iteración continua del marco ágil *Scrum* para la gestión y control del esfuerzo del equipo, junto con el rigor analítico de la *Ingeniería de Requisitos* y el estándar formal *UML 2.5* (OMG) para la representación de flujos de control concurrentes y reactivos.

El principio estructurador del proceso radica en la trazabilidad bidireccional y verificable: cada nodo de acción, carril de partición, compuerta condicional y bifurcación paralela en los diagramas de procesos responde directamente a una educción (`EDU`), una ilación procedimental (`ILA`), una especificación funcional algorítmica (`ESP`) y un conjunto de restricciones operacionales definidas en los requisitos no funcionales (`RNF`).

== Organización del trabajo en equipo mediante Scrum

La construcción técnica del artefacto se organizó mediante ciclos iterativos de desarrollo fundamentados en Scrum, asignando roles y responsabilidades especializadas entre los diez integrantes del equipo del proyecto OmVital:

- *Jefe de Proyecto y Arquitecto de Software (`AUT-0004` Sergio Danilo Hancco Mullisaca):* Dirección general del sprint, definición de los lineamientos arquitectónicos del modelo de procesos en capas, resolución de controversias de diseño, fiscalización del cronograma y otorgamiento del visto bueno final en las actas de trabajo.
- *Especialista en Aseguramiento de la Calidad / QA (`AUT-0003` Eduardo Joel Cuno Salazar):* Auditoría y verificación cruzada de los flujos de procesos frente a la matriz de requisitos, comprobación de la consistencia sintáctica bajo el estándar UML 2.5 y validación de las precondiciones y poscondiciones operativas.
- *Gestor de Versionamiento y Base de Datos (`AUT-0001` Mathias Alonso Barrios Medina):* Administración del repositorio Git, control de ramas y fusiones, y verificación de la integridad transaccional del catálogo de requisitos en PostgreSQL.
- *Analistas de Requisitos y Modeladores de Procesos (`AUT-0002` Yordano Hernan Boza Portilla, `AUT-0007` Rafael Diego Nina Calizaya, `AUT-0010` Michael Benjamin Suclle Suca):* Autores principales del artefacto `DIA-PRC-0001`. Encargados del análisis detallado de la concurrencia, diseño algorítmico de los flujos `ILA-0020`, `ILA-0019` e `ILA-0017`, especificación de los mecanismos transaccionales ACID y modelado de la comunicación reactiva por WebSockets.
- *Analistas de Requisitos Complementarios (`AUT-0006` Dolly Yadhira Mollo Chuquicaña, `AUT-0008` Fabiana Francinet Pacheco Palo):* Levantamiento de fuentes, análisis de interfaces de usuario asociadas (`INT-06`, `INT-08`, `INT-17`, `INT-20`) y definición de parámetros clínicos de contingencia.
- *Diseñadores de Software y Maquetación Técnica (`AUT-0005` Denise Andrea Huacani Jara, `AUT-0009` Jeferson Jofre Quispe Madariaga):* Modelado gráfico de diagramas vectoriales en capas y maquetación modular del documento técnico en Typst.
- *Experto de Dominio y Asesor Docente (`EXP-001` Mg. Percy Oscar Huertas Niquen):* Orientación metodológica y retroalimentación formativa de los entregables.

=== Ceremonias ágiles y seguimiento continuo

El control y seguimiento del avance del artefacto se ejecutó a través de ceremonias ágiles periódicas:

- *Planificación del Sprint (Sprint Planning):* Definición del objetivo de entrega de la Vista de Procesos, desglose de los diagramas requeridos (Nivel 1 caja negra, Nivel 2 en capas de ejecución, diagramas específicos de ilación) y estimación del esfuerzo por tareas.
- *Reuniones de Sincronización Diaria / Semanal (Dailies & Sync Meetings):* Sesiones de coordinación técnica documentadas formalmente en Actas de Trabajo, registrando agenda, compromisos adquiridos, identificación de cuellos de botella y evaluación del desempeño individual.
- *Revisión y Retrospectiva del Sprint (Sprint Review & Retrospective):* Inspección del artefacto por pares revisores, análisis de observaciones formuladas por el jefe de proyecto y definición de acciones de mejora en el versionamiento de la arquitectura.

== Gestión y trazabilidad operativa mediante Jira

Como plataforma de soporte para la gestión del flujo de trabajo se empleó el tablero ágil de Jira, supervisando el ciclo de vida de cada tarea técnica a través de estados predefinidos:

#pad(left: 1.1em)[
1. *Por hacer (To Do / Backlog):* Requerimientos y flujos de procesos desglosados pendientes de modelado.
2. *En progreso (In Progress):* Actividades de análisis de concurrencia y elaboración de diagramas asignadas activamente a los modeladores.
3. *En revisión / QA (In Review):* Diagramas de actividades completados sometidos a inspección de consistencia lógica y validación de RNF.
4. *Completado (Done):* Artefactos validados, maquetados en Typst y fusionados en la rama principal del repositorio Git.
]

== Proceso sistemático de construcción de la Vista de Procesos

La construcción técnica del artefacto se ejecutó siguiendo una secuencia metodológica estructurada en cinco fases consecutivas:

=== Fase 1: Extracción y análisis de requisitos de tiempo de ejecución
El equipo analizó las educciones, ilaciones y especificaciones con impacto directo en la dinámica de ejecución:
- `EDU-0029` e `ILA-0020`: Control de asistencia y check-in con verificación financiera síncrona.
- `EDU-0026`, `EDU-0032` e `ILA-0019`: Gestión de visualización de organización interna y monitoreo de camillas.
- `EDU-0025` e `ILA-0017`: Registro de sesiones terapéuticas, notas SOAP y manejo de banderas rojas clínicas.

=== Fase 2: Identificación de capas de ejecución y carriles de partición
A partir del análisis de concurrencia se definieron los límites de ejecución del sistema, estructurando el flujo dinámico en seis capas diferenciadas: Presentación, Aplicación (API Gateway / Controladores), Persistencia (PostgreSQL ACID), Tiempo Real (Servidor WebSocket dúplex), Asíncrona (Broker de mensajería y Workers) e Integración (Servicios externos AWS S3, Pasarela Financiera y WhatsApp API).

=== Fase 3: Modelado de bifurcaciones, paralelismo y sincronizaciones fork/join
Se aplicaron las primitivas de UML 2.5 para representar con exactitud los puntos de decisión condicional (`merge`/`decision`) —como la bifurcación ante saldos impagos o banderas rojas clínicas— y la concurrencia paralela (`fork`/`join`) —como el despacho simultáneo de la confirmación visual al terapeuta y el encolamiento de tareas asíncronas de generación de constancias en PDF.

=== Fase 4: Verificación cruzada con Requisitos No Funcionales (RNF)
Cada nodo operacional fue auditado rigurosamente frente a los umbrales de calidad del sistema:
- Verificación del tiempo de respuesta síncrono en admisión ($t <= 3$ s, `RNF-0002`).
- Verificación de la propagación reactiva del estado de camillas en menos de 1 segundo vía WebSockets (`RNF-0006`).
- Verificación de la liberación inmediata de la tableta del terapeuta ($t <= 500$ ms, `RNF-0002`).
- Verificación de la compilación asíncrona de constancias en PDF en un tiempo menor a 5 segundos (`RNF-0007`).
- Verificación de la inmutabilidad y seguridad mediante cifrado simétrico AES-256 en AWS S3 (`RNF-0010`).

=== Fase 5: Elaboración de diagramas vectoriales y documentación en Typst
Cada diagrama fue catalogado mediante su respectiva Ficha Técnica de Control Arquitectónico (`DIA-PRC-0001`, `DIA-PRC-ILA-0020`, `DIA-PRC-ILA-0019`, `DIA-PRC-ILA-0017`), consolidando los insumos técnicos en la plantilla oficial de Typst respetando la jerarquía tipográfica institucional.

== Relación entre el proceso de trabajo y la construcción del artefacto

El marco de gestión Scrum y la plataforma Jira facilitaron la organización sistemática del esfuerzo grupal, mientras que el estándar UML 2.5 garantizó el rigor analítico y formal del modelo resultante. La tabla siguiente sintetiza la correspondencia directa entre ambas dimensiones:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo (Gestión y Control)*], [*Proceso de construcción del artefacto (Técnico / UML)*]
  ),
  [Scrum: Planificación del Sprint], [Extracción y análisis de educciones (`EDU`), ilaciones (`ILA`) y restricciones `RNF`],
  [Scrum: Dailies y Actas de Trabajo], [Coordinación entre modeladores (`AUT-0002, 0007, 0010`) y equipo de QA (`AUT-0003`)],
  [Jira: Registro y desglose de tareas], [Definición de capas de ejecución y carriles de partición (_swimlanes_)],
  [Jira: Estado "En progreso"], [Modelado de nodos de acción, bifurcaciones condicionales y sincronizaciones _fork/join_],
  [Scrum: Revisión por pares (QA)], [Auditoría cruzada de consistencia transaccional y cumplimiento de latencias RNF],
  [Jira: Estado "En revisión"], [Elaboración de Fichas Técnicas arquitectónicas y maquetación modular en Typst],
  [Scrum: Aprobación y V° B° del Jefe de Proyecto], [Validación final, compilación del informe en PDF y cierre formal del artefacto],
)

De este modo, la metodología adoptada garantizó una trazabilidad total desde las necesidades clínicas del centro asistencial hasta la representación dinámica del software en tiempo de ejecución.
