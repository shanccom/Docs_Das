= Conclusiones

La arquitectura genérica del sistema clínico OmVital Physio Control capturó y estructuró la dimensión estática del software, traduciendo las políticas asistenciales y administrativas de la clínica en una organización conceptual de componentes y relaciones. Aplicando los principios de abstracción arquitectónica y trazabilidad de requisitos, se articuló la interacción entre los usuarios, los módulos internos y los servicios externos, estableciendo la base para las decisiones posteriores de diseño y construcción.

== Del marco conceptual

- El diseño de una arquitectura genérica representa las responsabilidades del sistema y las relaciones entre sus componentes, facilitando comprender el funcionamiento global antes de elegir la tecnología de implementación.
- La arquitectura de software debe construirse a partir de las necesidades y responsabilidades del sistema, no de las herramientas o lenguajes disponibles. Así se obtiene un diseño independiente de la tecnología y se facilita evaluar alternativas en etapas posteriores.
- La separación de responsabilidades reduce el acoplamiento y facilita la comprensión, modificación y mantenimiento del sistema, evitando concentrar todas las funciones en un solo componente.
- Los requisitos funcionales definen los servicios que debe soportar el sistema; los no funcionales condicionan la forma de organizarlos y afectan directamente la arquitectura.
- La interoperabilidad debe considerarse desde el diseño, aunque el sistema funcione inicialmente de forma independiente, para permitir futuras integraciones sin rediseñar la estructura.
- No existe una arquitectura única aplicable a todos los sistemas; la elección responde al contexto, alcance y requisitos específicos de cada uno.

== Del producto

- Se construyó el artefacto en dos niveles: _D-ARQ-001_ (Nivel 1), vista de fronteras con los subsistemas de Pacientes y Administración, y _D-DP-001_ (Nivel 2), vista de despliegue y acceso multi-sucursal sobre la nube.
- El modelo organiza los módulos arquitectónicos (Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos) y su relación con los servicios externos de firma, mensajería y finanzas.
- Se garantizó la trazabilidad entre los componentes y el catálogo de requisitos, respaldada en las matrices de educción (`EDU-0001` a `EDU-0033`), ilación (`ILA-0001` a `ILA-0027`) y especificación (`ESP-0001` a `ESP-0043`).
- El artefacto vincula los componentes con los requisitos no funcionales: disponibilidad de documentos en la nube (_RNF-0001_), tiempo de respuesta en búsqueda por DNI (_RNF-0002_), firma digital (_RNF-0003_), camillas en tiempo real (_RNF-0006_), emisión de constancias (_RNF-0007_) e inalterabilidad del consentimiento (_RNF-0010_).
- El producto mantiene un nivel de abstracción independiente de la tecnología, útil como referencia para seleccionar las tecnologías más apropiadas.
- El diagrama de Nivel 2 sirve de guía para las etapas posteriores (vista lógica, procesos y despliegue), alineando las necesidades de la clínica con la implementación.