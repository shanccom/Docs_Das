= Conclusiones

La formalización de los diagramas de comportamiento para el sistema clínico OmVital Physio Control permitió capturar y estructurar la dimensión dinámica del software, traduciendo las políticas asistenciales y administrativas de la clínica de fisioterapia en flujos operacionales rigurosos. Mediante la aplicación de los estándares de modelado dinámico, se logró articular la interacción secuencial entre los usuarios operativos y la lógica del sistema, estableciendo condiciones claras para la toma de decisiones, la sincronización de tareas y la preservación de la consistencia clínica.

== Del marco conceptual

- El modelado de comportamiento a través de diagramas de actividades bajo el estándar UML 2.5 proporciona una notación formal indispensable para representar la causalidad, el paralelismo y la secuencia temporal de las operaciones del sistema, superando la visión puramente estática de la arquitectura de software.
- La incorporación de carriles de partición (_activity partitions_) permite delimitar inequívocamente las responsabilidades entre la interacción humana del actor operativo y los servicios automatizados del sistema, evitando ambigüedades respecto a qué entidad ejecuta cada validación lógica.
- La semántica de bifurcación condicional mediante nodos de decisión y nodos de fusión (_merge_) garantiza que el flujo de control resuelva caminos alternativos disjuntos sin incurrir en sincronizaciones paralelas erróneas, asegurando una convergencia limpia hacia las etapas posteriores de la atención.
- Los atributos de calidad y los requisitos no funcionales (RNF) actúan en el dominio dinámico como restricciones operacionales que condicionan la latencia permisible, la atomicidad transaccional y los mecanismos de persistencia en cada nodo de acción.
- En los sistemas de información en salud, la inmutabilidad y la trazabilidad operativa rigen el comportamiento del software; los flujos de negocio deben impedir transiciones destructivas de información y garantizar que los estados de expedientes y asistencias transicionen de forma verificable y auditable.
- El diseño riguroso del comportamiento procedimental reduce el riesgo de inconsistencias en tiempo de ejecución, ya que explicita las precondiciones, las guardas de decisión y las postcondiciones que deben satisfacerse antes y después de cada cambio de estado en las entidades del dominio.

== Del producto

- Se construyó el artefacto técnico _DIA-CMP-0001_ en dos niveles de granularidad: una vista de caja negra (Nivel 1) que sintetiza el flujo general de recepción y asistencia, y una vista detallada en carriles (Nivel 2) que expone la lógica algorítmica interna del proceso.
- El modelo elaborado plasma con exactitud el ciclo de admisión del paciente en OmVital Physio Control, contemplando tanto la recuperación ágil del historial existente como la apertura guiada de nuevos expedientes bajo políticas estrictas de validación.
- Se garantizó la trazabilidad directa entre las actividades del diagrama y las especificaciones técnicas formales del proyecto (desde `ESP-0001` hasta `ESP-0005`, así como `ESP-0030` y `ESP-0031`), respaldadas en las matrices de ilación (`ILA-0001`, `ILA-0002`, `ILA-0020`) y educción (`EDU-0001`, `EDU-0029`).
- La integración de guardas condicionales y ciclos de validación basados en fuentes reales (como el control estricto de campos de la fuente _FUE-0004_) formaliza el tratamiento de datos inconsistentes en la interfaz de usuario antes de comprometer la persistencia en la base de datos.
- El artefacto vincula explícitamente los puntos de control con los requisitos no funcionales del sistema, destacando el cumplimiento del tiempo de respuesta en la búsqueda indexada ($t <= 500$ ms, _RNF-0002_), la persistencia inmutable de historias clínicas (_RNF-01_) y la disponibilidad distribuida en la nube (_RNF-0001_).
- El diagrama de comportamiento de Nivel 2 sirve como especificación directriz para la posterior codificación de controladores, validadores de entrada y contratos de servicios de interfaz, minimizando desalineaciones entre las necesidades de recepción clínica y la implementación final del software.
