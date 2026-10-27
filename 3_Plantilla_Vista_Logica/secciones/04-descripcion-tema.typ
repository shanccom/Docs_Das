= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto tiene como propósito formalizar la especificación, el modelado y la documentación de la Vista Lógica del sistema clínico OmVital Physio Control. Dicha vista describe la estructura funcional del software en términos de componentes lógicos: clases, sus responsabilidades, atributos y relaciones, abstrayendo los detalles de implementación y de despliegue físico.

La vista lógica cumple este rol al traducir los requisitos del sistema en un modelo de clases y paquetes que sirve de puente entre el diseño de alto nivel (arquitectura genérica) y las etapas de construcción del software, permitiendo validar que cada responsabilidad funcional identificada en la educción, ilación y especificación quede asignada a un componente del sistema.

== Contexto del sistema OmVital Physio Control

El centro asistencial de fisioterapia atiende diariamente a un flujo de pacientes con patologías traumatológicas, afecciones neurológicas, lesiones deportivas y necesidades de acondicionamiento geronto-psicomotriz. La operación clínica se distribuye en tres sucursales interconectadas, con almacenamiento compartido en la nube, lo que exige una coordinación de alta disponibilidad y consistencia en los ámbitos de gestión de pacientes, agenda de citas, recursos clínicos, protocolo asistencial y cierre de sesión.

La vista lógica organiza estos ámbitos en módulos funcionales que se corresponden con los definidos en la arquitectura genérica: Pacientes, Citas y Atenciones, Recursos, Documentos y Evaluaciones, API y control de acceso y Plataforma de datos.

== Correspondencia con el catálogo de requisitos

El modelo lógico traduce directamente las necesidades del catálogo de requisitos, catalogado en la base de datos relacional de trazabilidad. Cada clase y relación responde a una educción (`EDU`), ilación (`ILA`) y especificación (`ESP`), y queda condicionada por los requisitos no funcionales (`RNF`):

=== Dominio de admisión, filiación y expediente clínico (`EDU-0001`)
Las clases del módulo de Pacientes (Paciente, Expediente y Consentimiento) implementan el registro, búsqueda y actualización de los datos maestros del paciente. La búsqueda por DNI se condiciona al tiempo máximo de respuesta (`RNF-0002`) y la inmutabilidad del consentimiento y del expediente responde a las restricciones de integridad (`RNF-0010`).

=== Dominio de agenda, check-in y verificación financiera (`EDU-0002`, `EDU-0029`, `EDU-0031`)
Las clases Cita, Asistencia y PaqueteSesiones soportan la programación de turnos, el control de asistencia y la verificación síncrona del saldo de sesiones con el módulo financiero. La captura de la firma digital en la asistencia queda limitada por el tiempo de respuesta (`RNF-0003`).

=== Dominio de recursos físicos y concurrencia de camillas (`EDU-0025`)
La clase Camilla, junto con sus estados, modela la disponibilidad, ocupación y rotación de camillas y consultorios, actualizándose en tiempo real (`RNF-0006`).

=== Dominio de evaluación clínica y documentación (`EDU-0005`, `EDU-0006`)
Las clases Evaluación, NotaEvolución y Constancia gestionan las fichas de evaluación, el registro de evolución clínica y la emisión de constancias en PDF, condicionada por el tiempo de generación (`RNF-0007`).

=== Dominio de control de acceso, auditoría y respaldo (`EDU-0032`, `EDU-0033`)
Las clases Usuario, Rol y Sesión regulan la autenticación y los permisos, mientras que Auditoría y Respaldo garantizan el registro inalterable de operaciones y la disponibilidad de los documentos en la nube (`RNF-0001`).

== Objetivos del diseño de la Vista Lógica

La elaboración de la vista lógica para el sistema OmVital persigue los siguientes objetivos:

1. Identificar las clases y paquetes que conforman el sistema, derivándolos de los módulos de la arquitectura genérica.
2. Asignar atributos y métodos a cada clase a partir de las especificaciones (`ESP`) y los flujos de las ilaciones (`ILA`).
3. Establecer las relaciones entre clases (asociación, agregación, composición, herencia y dependencia) que reflejan la colaboración entre los componentes.
4. Garantizar la trazabilidad entre cada clase y los requisitos del proyecto (EDU, ILA, ESP y RNF).
5. Mantener un nivel de abstracción independiente de la tecnología, dejando las decisiones de implementación y despliegue para las vistas posteriores.