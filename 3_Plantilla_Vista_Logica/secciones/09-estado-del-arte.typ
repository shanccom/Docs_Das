= Estado del arte

== La vista lógica en el diseño arquitectónico

La vista lógica es una de las perspectivas del modelo de vistas de arquitectura. Describe la estructura funcional del sistema en términos de clases o componentes, sus responsabilidades y las relaciones entre ellos, con independencia de la plataforma de despliegue. Sommerville (2011) señala que los modelos de clases y de objetos permiten representar las entidades del dominio del problema, sus atributos y las operaciones que encapsulan, sirviendo de base para el diseño e implementación del software #cite(<sommerville2011>).

Pressman y Maxim (2014) destacan que el diseño arquitectónico y el modelado de clases responden a la separación de responsabilidades y al bajo acoplamiento, principios que facilitan la comprensión, la reutilización y el mantenimiento del sistema #cite(<pressman2014>). En este sentido, la vista lógica de OmVital se construye a partir de las responsabilidades identificadas en las etapas previas del proyecto.

== Modelado orientado a objetos y UML

El Lenguaje Unificado de Modelado (UML) constituye el estándar para la representación del diseño orientado a objetos. El diagrama de clases permite especificar clases, atributos, métodos, visibilidad y relaciones como asociación, agregación, composición, herencia y dependencia. Sommerville (2011) resalta que los diagramas de clases son la representación central del diseño orientado a objetos, pues condensan la estructura estática del sistema #cite(<sommerville2011>).

En el presente proyecto, el modelado UML se complementa con diagramas de paquetes para agrupar las clases por módulo, manteniendo la correspondencia con los módulos definidos en la arquitectura genérica del sistema clínico.

== Arquitecturas de sistemas de información en salud

Casanova, Villa-Garzon y Branch-Bedoya (2025) realizaron una revisión sistemática de patrones arquitectónicos en sistemas de información en salud, identificando arquitecturas basadas en servicios y diseños modulares, orientados a la interoperabilidad y a la integración mediante contratos estandarizados #cite(<casanova2025>). Estos resultados refuerzan la conveniencia de un modelo lógico organizado en módulos y paquetes con responsabilidades delimitadas.

== Historias clínicas electrónicas en fisioterapia

Vaz et al. (2025) revisaron el uso de historias clínicas electrónicas en la práctica fisioterapéutica, identificando factores de adopción como la preparación organizacional, la utilidad percibida y la disponibilidad de capacitación, así como dificultades en la calidad y completitud de los datos #cite(<vaz2025>). Para el sistema OmVital, esto justifica que el modelo de clases contemple entidades diferenciadas para la historia clínica, el expediente y el consentimiento informado, garantizando la trazabilidad de la información clínica durante toda la atención.
