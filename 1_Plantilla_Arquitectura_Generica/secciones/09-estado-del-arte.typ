= Estado del arte

El estado del arte presenta una revisión de los principales conceptos, enfoques y tendencias relacionados con los sistemas de información en el ámbito clínico y con el diseño de arquitecturas de software orientadas a la salud. Esta revisión permite conocer cómo se han abordado problemas similares en investigaciones y propuestas actuales, así como identificar características que deben ser consideradas durante el diseño de un sistema clínico.

== Sistemas de información en el ámbito clínico

Los sistemas de información en salud constituyen un componente fundamental de la transformación digital del sector sanitario, debido a que permiten gestionar información relacionada con los pacientes y apoyar los procesos de atención. La Organización Mundial de la Salud (OMS) plantea que las plataformas digitales de salud deben favorecer la integración e interoperabilidad de los diferentes sistemas que participan en la gestión de información sanitaria #cite(<oms2020>).

Desde una perspectiva arquitectónica, un sistema de información en salud no debe considerarse únicamente como una aplicación aislada, sino como un conjunto de componentes que interactúan para proporcionar servicios, gestionar datos y soportar los procesos de atención. La OMS identifica diferentes dominios arquitectónicos relacionados con la salud digital, entre ellos la arquitectura de negocio, datos, aplicaciones y tecnología #cite(<oms2024>).

Para el presente proyecto, esta perspectiva resulta relevante debido a que el sistema propuesto para la clínica de fisioterapia debe integrar diferentes procesos, como la gestión de pacientes, citas, evaluaciones, tratamientos y sesiones, manteniendo una relación coherente entre la información generada durante la atención.

== Sistemas de información aplicados a fisioterapia

La utilización de registros electrónicos en fisioterapia presenta características particulares debido a la necesidad de documentar información clínica relacionada con la evaluación funcional, el tratamiento y la evolución del paciente.

Vaz et al. realizaron una revisión sistemática sobre el uso de historias clínicas electrónicas en fisioterapia, identificando nueve estudios observacionales. Los autores encontraron que factores como la preparación organizacional, la utilidad percibida, el apoyo de la administración y la disponibilidad de capacitación influyen en la adopción de estos sistemas. Asimismo, identificaron dificultades relacionadas con la calidad y completitud de los datos y con la integración del marco de la Clasificación Internacional del Funcionamiento, de la Discapacidad y de la Salud (ICF) #cite(<vaz2025>).

Estos resultados muestran que el diseño de un sistema para una clínica de fisioterapia no debe limitarse a digitalizar registros existentes. La arquitectura debe facilitar que la información clínica pueda registrarse de forma estructurada y mantenerse relacionada durante las diferentes etapas de atención del paciente.

Desde la perspectiva del presente proyecto, esto justifica que la arquitectura genérica considere componentes diferenciados para la gestión del paciente, las citas y los procesos clínicos, permitiendo que posteriormente puedan incorporarse los elementos específicos relacionados con la evaluación, tratamiento y seguimiento fisioterapéutico.

== Tendencias actuales en la arquitectura de sistemas de información en salud

Las arquitecturas utilizadas en sistemas de información en salud han evolucionado hacia modelos que buscan mejorar la modularidad, interoperabilidad y capacidad de integración.

Casanova, Villa-Garzon y Branch-Bedoya realizaron en 2025 una revisión sistemática de patrones arquitectónicos utilizados en sistemas de información en salud. A partir del análisis de 89 estudios, los autores identificaron una presencia importante de arquitecturas basadas en servicios y arquitecturas distribuidas, junto con tendencias relacionadas con diseños modulares, computación en el borde y tecnologías de registro distribuido. También identificaron el uso de contratos basados en FHIR como un mecanismo para estabilizar las interfaces entre sistemas y reducir los costos de integración #cite(<casanova2025>).

Los resultados de esta revisión muestran que no existe una única arquitectura que pueda considerarse adecuada para todos los sistemas de salud. La elección de una arquitectura depende de las características del sistema, sus requisitos y el nivel de integración requerido.

Para el sistema clínico propuesto, esta consideración es importante porque el objetivo actual es construir una arquitectura genérica, por lo que no resulta conveniente establecer prematuramente una tecnología o estilo arquitectónico específico. En esta etapa se busca identificar las responsabilidades y relaciones principales del sistema, dejando las decisiones tecnológicas para etapas posteriores.

== Interoperabilidad como consideración arquitectónica

La interoperabilidad constituye uno de los aspectos relevantes en la arquitectura de los sistemas digitales de salud. La OMS define la interoperabilidad como la capacidad de diferentes aplicaciones para acceder, intercambiar, integrar y utilizar datos de manera coordinada. Además, distingue dimensiones como la interoperabilidad sintáctica, semántica, organizacional y legal #cite(<oms2024>).

En este contexto, estándares como HL7 FHIR permiten establecer estructuras y mecanismos comunes para el intercambio de información sanitaria. La arquitectura de referencia de la OMS basada en FHIR contempla componentes destinados al intercambio de información y a la interoperabilidad entre diferentes sistemas #cite(<oms2025>).

Aunque el sistema propuesto se encuentra inicialmente orientado a una clínica de fisioterapia y no requiere necesariamente integración con sistemas externos en su primera versión, considerar la interoperabilidad desde la arquitectura genérica permite evitar un diseño excesivamente cerrado. De esta manera, futuras integraciones con otros sistemas clínicos, laboratorios, servicios externos u otros componentes podrían incorporarse sin tener que modificar completamente la estructura del sistema.

== Requisitos no funcionales relevantes para sistemas clínicos

Además de las funcionalidades que debe proporcionar el sistema, los sistemas clínicos requieren considerar características de calidad que tienen un impacto directo sobre la arquitectura.

Entre las principales se encuentran:

- Seguridad: debido a que el sistema gestiona información clínica y datos personales, se requiere controlar el acceso a la información de acuerdo con las responsabilidades de cada usuario.
- Privacidad: la información de los pacientes debe ser protegida frente a accesos o usos no autorizados.
- Disponibilidad: el sistema debe encontrarse disponible durante las actividades de atención de la clínica.
- Integridad: los registros clínicos deben conservarse correctamente y evitar modificaciones no autorizadas.
- Interoperabilidad: la arquitectura debería permitir futuras comunicaciones con otros sistemas cuando sea necesario.
- Mantenibilidad: los componentes deben estar organizados de manera que las modificaciones futuras no impliquen alterar innecesariamente todo el sistema.

La OMS señala que las iniciativas de salud digital deben considerar aspectos de privacidad, seguridad, gobernanza, estándares e interoperabilidad dentro de su arquitectura #cite(<oms2026>).

Por ello, estos requisitos no funcionales deben ser considerados desde las primeras decisiones arquitectónicas y no únicamente durante la implementación.