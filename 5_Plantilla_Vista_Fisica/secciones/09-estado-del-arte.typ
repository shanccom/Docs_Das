#let sistema = [OmVital Physio Control]

= Estado del arte

== La vista física en el modelo 4+1

Kruchten propone describir la arquitectura mediante cinco vistas: lógica, de procesos, de desarrollo, física y de escenarios [1]. La vista física asigna los elementos del software a los nodos de hardware y atiende requisitos como la disponibilidad, la fiabilidad, el rendimiento y la escalabilidad. Por eso se elabora después de las vistas lógica y de procesos, y se deriva de ellas.

== El diagrama de despliegue de UML

UML 2.5 modela la vista física mediante el diagrama de despliegue, compuesto por nodos (dispositivos físicos o entornos de ejecución), artefactos de software desplegados en ellos y rutas de comunicación entre nodos [2], [3]. Es el medio habitual para documentar arquitecturas cliente-servidor y en capas.

== Infraestructura para sistemas de salud multi-sede

La revisión sistemática de Casanova, Villa-Garzon y Branch-Bedoya sobre 89 estudios identifica una presencia importante de arquitecturas basadas en servicios y arquitecturas distribuidas en los sistemas de información en salud [5]. Esto respalda la decisión de #sistema de centralizar los datos en la nube y de acceder a ellos desde tres sucursales. La OMS, por su parte, considera la tecnología como uno de los dominios arquitectónicos de la salud digital y plantea que las plataformas deben favorecer la integración y la interoperabilidad [6], [7].

== Atributos de calidad y decisiones de infraestructura

Bass, Clements y Kazman describen tácticas de arquitectura para atributos como la disponibilidad (redundancia y réplicas), el rendimiento (caché y reparto de carga) y la escalabilidad (agregar recursos sin rediseñar) [4]. En este artefacto esas tácticas se traducen en servidores replicables, balanceo de carga, caché, base de datos con réplica y respaldos.
