#let sistema = [OmVital Physio Control]

= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto tiene como propósito formalizar la *Vista Física* del sistema clínico #sistema, es decir, la distribución de sus componentes de software sobre los dispositivos, servidores y redes que conforman la solución. La vista física forma parte del modelo de vistas 4+1 y se representa mediante diagramas de despliegue UML [1].

A diferencia de la Arquitectura Genérica, que se mantiene independiente de la tecnología, esta vista debe decidir *dónde* se ejecuta cada responsabilidad y *con qué recursos*. Por ello, el documento distingue entre los dispositivos con los que la clínica cuenta actualmente y los que deben adquirirse o contratarse para cumplir los requisitos no funcionales (RNF) ya aprobados.

== Contexto del sistema

#sistema da soporte a una red de clínicas de fisioterapia y rehabilitación física ambulatoria con *tres sucursales interconectadas* que comparten información de pacientes en la nube. La operación abarca la gestión de pacientes y expedientes, la agenda y el check-in con verificación financiera síncrona, el control de camillas en tiempo real, la evaluación clínica y la emisión de constancias, la captura de firma digital y el envío de confirmaciones por WhatsApp y correo electrónico.

== Objetivos del diseño de la Vista Física

+ Inventariar los dispositivos y servicios con los que cuenta actualmente la clínica.
+ Identificar los dispositivos y servicios que deben adquirirse o contratarse, justificados por los RNF.
+ Representar la situación actual y la propuesta mediante dos diagramas de despliegue.
+ Describir la separación en capas, la separación de servidores y la comunicación entre nodos, incluido el acceso a la base de datos.
+ Mostrar cómo se representan los RNF (disponibilidad, rendimiento, tiempo real, seguridad, escalabilidad) en la infraestructura.
