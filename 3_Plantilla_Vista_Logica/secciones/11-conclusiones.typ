= Conclusiones

La vista lógica del sistema clínico OmVital Physio Control capturó y estructuró la dimensión funcional del software, traduciendo los requisitos del catálogo en un modelo de clases y paquetes. Aplicando los principios del diseño orientado a objetos y la trazabilidad de requisitos, se articuló la colaboración entre las clases de dominio, los servicios de soporte y los servicios externos, estableciendo la base para el diseño detallado y la implementación.

== Del marco conceptual

- La vista lógica representa las clases del sistema, sus responsabilidades, atributos y relaciones, facilitando comprender la estructura interna del software antes de decidir la tecnología de implementación.
- El modelo de clases se construye a partir de las necesidades y responsabilidades del sistema, no de las herramientas o lenguajes disponibles, lo que otorga independencia tecnológica.
- La separación de responsabilidades en clases y paquetes reduce el acoplamiento y facilita la comprensión, la reutilización y el mantenimiento del sistema.
- Los requisitos funcionales definen los métodos que cada clase debe ofrecer; los no funcionales condicionan las decisiones de diseño, como el tiempo de respuesta y la integridad de la información.
- El estándar UML 2.5 proporciona una notación formal para expresar la estructura estática del sistema mediante diagramas de clases y de paquetes.

== Del producto

- Se identificaron las clases de dominio organizadas en paquetes coherentes con los módulos de la arquitectura genérica (Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos).
- Se definieron los atributos y métodos de cada clase a partir de las especificaciones (`ESP-0001` a `ESP-0043`) y las ilaciones (`ILA-0001` a `ILA-0027`).
- Se establecieron las relaciones estructurales entre clases (asociación, agregación, composición, herencia y dependencia) que reflejan la colaboración entre los componentes.
- El modelo vincula las clases con los requisitos no funcionales: disponibilidad en la nube (`RNF-0001`), tiempo de respuesta en búsqueda por DNI (`RNF-0002`), firma digital (`RNF-0003`), camillas en tiempo real (`RNF-0006`), emisión de constancias (`RNF-0007`) e inalterabilidad del consentimiento (`RNF-0010`).
- El producto mantiene un nivel de abstracción independiente de la tecnología, útil como referencia para el diseño detallado y la implementación en etapas posteriores.