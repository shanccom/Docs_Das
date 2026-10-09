= Metodología del proceso y su relación con la metodología propuesta

== Marco metodológico híbrido

Al igual que en los artefactos anteriores, se empleó un marco híbrido que combina *Scrum* para la gestión del equipo, *Jira* para la trazabilidad de tareas y *modelado UML 2.5* (diagrama de despliegue) para la construcción técnica. El principio rector es la trazabilidad: cada dispositivo representado debe responder a un componente de la Arquitectura Genérica y a un RNF del catálogo.

== Organización del trabajo en equipo

El trabajo se organizó en ciclos iterativos de Scrum con los diez integrantes y los roles ya definidos para el proyecto:

- *Jefe de Proyecto y Arquitecto de Software* (AUT-0004): lineamientos de la infraestructura, validación técnica global y conformidad en las actas.
- *Especialista en QA* (AUT-0003): verificación cruzada de los diagramas contra el catálogo de requisitos y contra D-DP-001.
- *Gestor de Versionamiento y Base de Datos* (AUT-0001): repositorio Git, control de cambios y versiones del artefacto.
- *Analistas de Requisitos y Modeladores* (AUT-0002, AUT-0006, AUT-0007, AUT-0008, AUT-0010): inventario de dispositivos, análisis de brecha y modelado de los diagramas de despliegue.
- *Diseñadores de Software y Maquetación* (AUT-0005, AUT-0009): redacción técnica y maquetación del documento en Typst.
- *Asesor docente* (EXP-001): retroalimentación formativa.

== Gestión mediante Jira

El flujo de tareas siguió los estados Por hacer, En progreso, En revisión/QA y Completado. Las actividades gestionadas fueron: revisar RNF y componentes de la Arquitectura Genérica, inventariar dispositivos existentes, determinar los dispositivos a adquirir, elaborar los diagramas de despliegue, revisarlos con QA y elaborar las fichas técnicas y el documento.

== Proceso de construcción de la Vista Física

+ *Fase 1 – Extracción de requisitos con impacto físico:* se seleccionaron los RNF y los módulos de D-DP-001 que condicionan la infraestructura.
+ *Fase 2 – Inventario de la situación actual:* se listaron los dispositivos existentes por sucursal.
+ *Fase 3 – Análisis de brecha:* se contrastó lo existente con lo que exigen los RNF para definir lo que debe adquirirse o contratarse.
+ *Fase 4 – Modelado:* se elaboraron dos diagramas de despliegue: situación actual (D-FIS-001) y situación propuesta (D-FIS-002). Siguiendo las observaciones aprobadas en los artefactos anteriores, cada diagrama incluye la sección de requisitos funcionales y la de requisitos no funcionales como contexto.
+ *Fase 5 – Verificación cruzada:* se comprobó la coherencia con D-ARQ-001, D-DP-001 y DIA-CMP-0001.
+ *Fase 6 – Fichas técnicas y documentación en Typst.*

== Relación entre el proceso de trabajo y la construcción del artefacto

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header(
    [*Proceso de trabajo (gestión y control)*], [*Construcción del artefacto (técnico)*],
  ),
  [Scrum: planificación del sprint], [Extracción de RNF y módulos con impacto físico],
  [Jira: registro y asignación de tareas], [Inventario de dispositivos y análisis de brecha],
  [Scrum: actas de trabajo y reuniones], [Coordinación entre quien redacta y quien diagrama],
  [Jira: estado «En progreso»], [Modelado de los dos diagramas de despliegue],
  [Scrum: revisión por pares (QA)], [Verificación contra RNF y contra D-DP-001],
  [Jira: estado «En revisión»], [Fichas técnicas y maquetación en Typst],
  [Scrum: aprobación del Jefe de Proyecto], [Compilación final y cierre del artefacto],
)
