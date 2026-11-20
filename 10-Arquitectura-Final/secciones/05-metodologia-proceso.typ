= Metodología de proceso

== Marco metodológico híbrido: Scrum y modelado arquitectónico integral (C4 + Clean Architecture)

Para la concepción, especificación, modelado y validación de la *Arquitectura de Software Final* del sistema clínico *OmVital Physio Control*, el equipo de ingeniería implementó un marco metodológico híbrido. Este enfoque articula las prácticas colaborativas y de entrega incremental del marco de trabajo ágil *Scrum* para la gestión y coordinación del equipo, con el rigor formal de la *Ingeniería de Requisitos* y las disciplinas de diseño arquitectónico consolidadas en la industria de software: el *Modelo C4* propuesto por Simon Brown #cite(<brown2024>), los postulados de *Clean Architecture* formulados por Robert C. Martin #cite(<martin2017>), la *Arquitectura Hexagonal* (Puertos y Adaptadores) de Alistair Cockburn #cite(<cockburn2005>) y el patrón de *Monolito Modular* sistematizado por Mark Richards y Neal Ford #cite(<richards2020>).

El principio estructurador de este proceso es la *trazabilidad bidireccional y verificable*: cada límite de sistema, contenedor desplegable, protocolo de red, componente interno de aplicación y decisión técnica responde directamente a una educción (`EDU`), una ilación procedimental (`ILA`), una especificación funcional (`ESP`), un requisito no funcional de calidad (`RNF`) o un control de mitigación de riesgo arquitectónico (`RSK`), todos formalizados y versionados en la base de datos relacional de control de ingeniería del proyecto.

== Organización del trabajo en equipo mediante Scrum

La ejecución técnica y la elaboración documental del artefacto se organizaron mediante ciclos iterativos basados en Scrum, asignando roles y responsabilidades claras entre los diez integrantes del equipo del proyecto OmVital registrados en la base de datos institucional:

- *Jefe de Proyecto y Arquitecto de Software (`AUT-0004` Sergio Danilo Hancco Mullisaca):* Dirección general del sprint, definición de los lineamientos arquitectónicos globales, establecimiento de los criterios de diseño bajo el Modelo C4, validación de la coherencia técnica de los diagramas, resolución de controversias estructurales, coautoría de las versiones finales concluidas de los diagramas `D-C4-001` y `D-C4-003`, y otorgamiento del visto bueno en las actas de trabajo formales.
- *Especialista en Aseguramiento de la Calidad / QA (`AUT-0003` Eduardo Joel Cuno Salazar):* Auditoría cruzada de consistencia lógica entre los tres niveles C4, verificación de trazabilidad respecto al catálogo de requisitos en PostgreSQL, comprobación de la consistencia sintáctica y semántica de los modelos visuales, y validación estricta de las métricas de tolerancia de los requisitos no funcionales (`RNF-0001` a `RNF-0015`) y de los riesgos arquitectónicos (`RSK-01` a `RSK-06`).
- *Gestor de Versionamiento y Base de Datos (`AUT-0001` Mathias Alonso Barrios Medina):* Administración del repositorio Git institucional, supervisión del control de ramas y fusiones, mantenimiento de la integridad referencial y auditoría del catálogo de requisitos en PostgreSQL, y coautoría técnica en el modelado de contenedores (`D-C4-002`) y componentes backend (`D-C4-003`).
- *Modeladora Arquitectónica Principal (`AUT-0008` Fabiana Francinet Pacheco Palo):* Autora principal responsable de la formulación de las líneas base v1.0.0 de los diagramas `D-C4-001`, `D-C4-002` y `D-C4-003`, y coautora destacada en la refactorización arquitectónica que culminó en las versiones concluidas v2.0.0.
- *Analista de Protocolos de Red y Concurrencia (`AUT-0007` Rafael Diego Nina Calizaya):* Modelado y especificación detallada de la matriz de los 11 protocolos físicos estrictos de comunicación entre contenedores, análisis de las condiciones de carrera multi-sede y coautor del diagrama C4 Nivel 2 (`D-C4-002` v2.0.0).
- *Analistas de Requisitos y Modeladores de Dominio (`AUT-0002` Yordano Hernan Boza Portilla, `AUT-0006` Dolly Yadhira Mollo Chuquicaña, `AUT-0010` Michael Benjamin Suclle Suca):* Análisis en profundidad de las 11 educciones activas y 27 ilaciones operativas, diseño de los 11 casos de uso de la capa de aplicación, definición de invariantes clínicas del dominio (notas SOAP, banderas rojas, baja lógica) y fundamentación de la depuración de las 22 educciones no pertinentes al alcance de rehabilitación ambulatoria.
- *Diseñadores de Software y Maquetación Técnica (`AUT-0005` Denise Andrea Huacani Jara, `AUT-0009` Jeferson Jofre Quispe Madariaga):* Modelado gráfico estandarizado de los diagramas en formatos vectoriales SVG y Mermaid, diseño de figuras de alta fidelidad técnica y maquetación modular del informe en Typst respetando la jerarquía tipográfica institucional.
- *Experto de Dominio y Asesor Docente (`EXP-001` Mg. Percy Oscar Huertas Niquen):* Orientación metodológica, evaluación continua y retroalimentación formativa en las revisiones del artefacto.

=== Ceremonias ágiles y Actas de Trabajo

El control, sincronización y seguimiento del avance técnico se canalizaron a través de ceremonias ágiles sistemáticas:

- *Planificación del Sprint (Sprint Planning):* Definición del objetivo de entrega de la Arquitectura Final, desglose de los entregables en tres niveles C4 (Contexto en caja negra, Contenedores con protocolos de red y Componentes concéntricos de Clean Architecture), definición de criterios de aceptación y estimación del esfuerzo relativo por tareas.
- *Reuniones de Sincronización (Dailies y Sync Meetings):* Sesiones periódicas documentadas formalmente mediante *Actas de Trabajo*. En cada acta se asentó la agenda tratada, los compromisos asumidos, los cuellos de botella identificados y la evaluación individual de desempeño en los ejes de asistencia, puntualidad, responsabilidad y comunicación técnica.
- *Revisión y Retrospectiva del Sprint (Sprint Review & Retrospective):* Sesiones de auditoría técnica por pares revisores (_peer review_), análisis de observaciones formuladas por el jefe de proyecto y el asesor docente, y registro de lecciones aprendidas para la estabilización definitiva de los modelos arquitectónicos.

== Gestión y trazabilidad operativa mediante Jira

Para asegurar la visibilidad del flujo de trabajo y la trazabilidad operativa en tiempo real, se utilizó la plataforma de gestión de proyectos Jira. El ciclo de vida de cada artefacto y tarea técnica se gobernó mediante cuatro estados sucesivos:

#pad(left: 1.1em)[
1. *Por hacer (To Do / Backlog):* Requerimientos arquitectónicos y tareas técnicas desglosadas en espera de priorización.
2. *En progreso (In Progress):* Actividades asignadas activamente a analistas, modeladores y diseñadores de software.
3. *En revisión / QA (In Review):* Modelos C4, especificaciones de protocolos o redacciones concluidas que son sometidas a auditoría de consistencia por parte del Especialista QA y el Arquitecto de Software.
4. *Completado (Done):* Artefactos validados técnicamente, aprobados con V° B° formal e incorporados al repositorio Git oficial del proyecto.
]

Entre las tareas técnicas de ingeniería gestionadas a través del tablero Jira se incluyeron:
#pad(left: 1.1em)[
- Auditoría y depuración formal del catálogo de requisitos (justificación de las 22 educciones excluidas).
- Delimitación de fronteras de negocio y modelado del Diagrama C4 Nivel 1 (Contexto canónico en caja negra `D-C4-001`).
- Definición de la topología de contenedores, dimensionamiento operativo multi-sede y formalización de la matriz de 11 protocolos físicos de red (`D-C4-002`).
- Descomposición concéntrica del Backend Core (`P-SRV-01`) en cuatro capas bajo Clean Architecture y Arquitectura Hexagonal (`D-C4-003`).
- Elaboración de la matriz de mitigación de los 6 riesgos arquitectónicos críticos (`RSK-01` a `RSK-06`).
- Verificación cruzada frente a los 14 requisitos no funcionales (`RNF-0001` a `RNF-0015`).
- Elaboración de fichas técnicas de control arquitectónico y maquetación modular en Typst.
]

== Proceso sistemático de construcción de la Arquitectura Final

La construcción técnica de la Arquitectura Final de OmVital se estructuró a través de una secuencia de ingeniería de software en seis fases consecutivas:

=== Fase 1: Consolidación, depuración y auditoría del catálogo de requisitos
El equipo realizó un saneamiento analítico integral de la base de datos de requisitos en PostgreSQL. Se auditaron las 11 educciones activas y las 27 ilaciones operativas, formalizando la depuración justificada de 22 educciones no pertinentes al alcance de la clínica de rehabilitación física ambulatoria (18 educciones de compras e inventarios comerciales `EDU-0007` a `EDU-0024`, 2 descartadas en refinamiento `EDU-0003` y `EDU-0004`, y 2 unificadas por absorción funcional `EDU-0028` en caja y `EDU-0030` en agenda).

=== Fase 2: Delimitación de fronteras y modelado de Contexto (C4 Nivel 1)
Se elaboró el Diagrama de Contexto del Sistema (`D-C4-001`). En su versión preliminar (v1.0.0), el modelo exponía anticipadamente detalles de infraestructura física (LAN de sucursales y servidor Linux). A través de la revisión arquitectónica, se evolucionó hacia la versión definitiva canónica (v2.0.0), representando a *OmVital* como una caja negra estricta frente a sus cuatro actores internos (`ACT-0001` Fisioterapeuta, `ACT-0002` Coordinador, `ACT-0003` Recepcionista, `ACT-0004` Gerente), el paciente como actor receptor externo y los cuatro sistemas externos de servicio (`S-EXT-01` a `S-EXT-04`).

=== Fase 3: Estructuración de Contenedores y formalización de protocolos físicos de red (C4 Nivel 2)
Se diseñó la topología de contenedores (`D-C4-002`) bajo un estilo híbrido MVC con Monolito Modular. La versión v2.0.0 integró el proxy inverso perimetral `P-EDGE-01` (Nginx TLS 1.3), los clientes de sede (`P-CLI-01` SPA React y `P-CLI-02` App Kotlin), el servidor de aplicaciones `P-SRV-01` (FastAPI), el servidor reactivo `P-SRV-02` (Python WebSockets), el intermediario de tareas en memoria `P-BRK-01` (Redis), los trabajadores en segundo plano `P-WRK-01` (Celery) y la base de datos `P-DAT-01` (PostgreSQL 16). Se definieron y contrastaron formalmente los 11 protocolos físicos estrictos de comunicación en red.

=== Fase 4: Descomposición concéntrica del Backend Core bajo Clean Architecture y Hexagonal (C4 Nivel 3)
Se modeló la estructura interna del contenedor transaccional principal `P-SRV-01` (`D-C4-003`), superando la versión preliminar v1.0.0 —que organizaba servicios planos sin inversión de dependencias— para consolidar en la versión v2.0.0 una arquitectura concéntrica estricta en cuatro capas:
1. *Presentación:* Enrutadores FastAPI y middlewares de seguridad perimetral (JWT y RBAC).
2. *Aplicación:* 11 Casos de Uso clínicos y contratos de Puertos abstractos de entrada y salida.
3. *Dominio:* Entidades clínicas puras, agregados y reglas del protocolo asistencial (bajas lógicas, banderas rojas, inmutabilidad).
4. *Infraestructura:* Adaptadores secundarios concretos (SQLAlchemy sobre PostgreSQL 16 con patrón UnitOfWork y Transactional Outbox, clientes Boto3 hacia S3, Firma Perú PKI REST, Pasarela Financiera con timeout $t <= 3$ s y encolador Celery).

=== Fase 5: Auditoría de Atributos de Calidad (RNF) y Mitigación de Riesgos (RSK)
Los modelos fueron contrastados contra las restricciones cuantitativas del sistema:
- *Disponibilidad centralizada en la nube (`RNF-0001`):* Operación en línea garantizada para las 3 sucursales interconectadas sobre infraestructura VPS Linux y AWS S3.
- *Latencia en admisión y agendamiento (`RNF-0002`):* Tiempos de búsqueda por DNI inferiores a 3 segundos asistidos por debounce de 500 ms y liberación de tableta en $< 500$ ms.
- *Agilidad y no repudio legal en consentimientos (`RNF-0003`, `RSK-04`):* Check-in en un solo clic, captura inalterable de firma en $< 10$ s y certificación con Firma Perú PKI.
- *Consistencia transaccional y prevención de sobreasignación (`RNF-0004`, `RNF-0005`, `RSK-02`):* Bloqueo pesimista por fila en PostgreSQL (`SELECT FOR UPDATE`) ante reservas concurrentes de turnos o camillas, respondiendo `HTTP 409 Conflict`.
- *Sincronización reactiva de camillas en tiempo real (`RNF-0006`, `RSK-03`):* Propagación de cambios en menos de 1 segundo (objetivo de 200 a 450 ms) sobre conexiones dúplex WebSockets RFC 6455.
- *Compilación asíncrona de reportes clínicos (`RNF-0007`, `RSK-05`):* Generación de constancias en PDF en $t <= 5$ s delegada a workers Celery sin bloquear el flujo interactivo de los usuarios.
- *Inmutabilidad y trazabilidad médico-legal (`RNF-0015`, `RSK-01`):* Prohibición absoluta de borrado físico, aplicación de baja lógica ("Archivo Histórico") y bitácora de auditoría append-only con timestamp UTC del servidor.
- *Seguridad perimetral y autenticación robusta (`RNF-0009`, `RSK-06`):* Terminación TLS 1.3 en Nginx ($t < 50$ ms) y validación de tokens JWT en servidor con permisos RBAC por sucursal.

=== Fase 6: Estandarización de Fichas Técnicas, control de versiones y maquetación en Typst
Cada diagrama de arquitectura fue catalogado exhaustivamente mediante una Ficha Técnica de Control Arquitectónico (`D-C4-001`, `D-C4-002` y `D-C4-003`), documentando su código, requisitos asociados, contexto, proceso modelado, autores institucionales, fecha, justificación técnica, estado de vigencia y artefactos de trazabilidad. Finalmente, todos los módulos fueron integrados y compilados en Typst respetando los lineamientos estéticos y editoriales de la Escuela Profesional de Ingeniería de Sistemas.

La secuencia metódica se resume en el siguiente flujo estructurado:

#pad(left: 1.1em)[
1. *Catálogo de Requisitos en PostgreSQL:* Consulta de Educciones (`EDU`), Ilaciones (`ILA`), Especificaciones (`ESP`), Requisitos No Funcionales (`RNF`) y Riesgos (`RSK`).
2. *Depuración y consistencia:* Saneamiento del catálogo excluyendo 22 educciones no pertinentes al alcance de fisioterapia.
3. *Delimitación de límites organizacionales:* Modelado del Diagrama C4 Nivel 1 de Contexto en caja negra.
4. *Topología de Contenedores y protocolos de red:* Modelado del Diagrama C4 Nivel 2 y definición de los 11 protocolos físicos.
5. *Descomposición concéntrica del Backend Core:* Modelado del Diagrama C4 Nivel 3 bajo Clean Architecture y Hexagonal.
6. *Auditoría de Atributos de Calidad y Riesgos:* Contrastación rigurosa frente a los 14 RNF y 6 controles de mitigación RSK.
7. *Fichas Técnicas y consolidación documental:* Normalización de metadatos de control y compilación modular en Typst.
]

== Relación entre el proceso de trabajo y la construcción del artefacto

El marco de trabajo ágil Scrum y el tablero Jira proveyeron la estructura organizativa, colaborativa y de fiscalización para coordinar el esfuerzo colectivo, mientras que el Modelo C4 y la disciplina de diseño arquitectónico aportaron el rigor metodológico y formal. La correspondencia entre ambas dimensiones se detalla en la siguiente tabla comparativa:

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  table.header(
    [*Proceso de trabajo (Gestión y Control / Scrum y Jira)*], [*Proceso de construcción del artefacto (Ingeniería y Modelo C4)*]
  ),
  [Scrum: Planificación del Sprint], [Análisis y depuración del catálogo oficial de requisitos en PostgreSQL (11 EDU activas, 27 ILA y 14 RNF).],
  [Scrum: Dailies y Actas de Trabajo], [Sincronización técnica continua entre el Arquitecto (`AUT-0004`), Especialista QA (`AUT-0003`), Modeladores (`AUT-0007, 0008`) y Maquetadores (`AUT-0005, 0009`).],
  [Jira: Registro y asignación de tareas en Backlog], [Definición del alcance de cada nivel C4: Contexto (N1), Contenedores (N2) y Componentes (N3).],
  [Jira: Tareas en estado "En progreso"], [Modelado de diagramas vectoriales, especificación de los 11 protocolos de red y estructuración concéntrica de capas Clean Architecture.],
  [Scrum: Revisión técnica por pares (_Peer Review_)], [Inspección cruzada de diagramas v1.0.0, detección de acoplamientos indebidos y refactorización hacia versiones definitivas v2.0.0.],
  [Jira: Tareas en estado "En revisión / QA"], [Auditoría exhaustiva contra las restricciones de latencia de los RNF ($t <= 3$ s, $t < 1$ s, $t <= 5$ s) y la mitigación de los 6 riesgos RSK.],
  [Jira: Tareas en estado "Completado / Done"], [Elaboración de las Fichas Técnicas de Control Arquitectónico, documentación en Typst y verificación del informe compilado.],
  [Scrum: Retrospectiva del Sprint y V° B° del Jefe de Proyecto], [Validación final de la línea base arquitectónica consolidada, aprobación colegiada y cierre formal del artefacto.],
)

De esta manera, el proceso metodológico implementado aseguró una trazabilidad completa, transparente y auditable desde las necesidades asistenciales y administrativas de la clínica hasta la definición arquitectónica más detallada de sus componentes de software.
