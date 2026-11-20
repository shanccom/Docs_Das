= Descripción del tema a tratar

== Introducción y justificación

El presente artefacto técnico tiene como propósito fundamental formalizar la especificación, el modelado y la documentación integral de la *Arquitectura de Software Final* correspondiente a la plataforma clínica *OmVital Physio Control*. Dicho sistema ha sido concebido para proporcionar un soporte asistencial y administrativo robusto, trazable y de alta disponibilidad a una red de centros médicos especializados en fisioterapia y rehabilitación física ambulatoria, garantizando la seguridad del paciente, la orquestación óptima de recursos clínicos y la custodia inalterable de los expedientes con valor médico-legal en sus diferentes sedes operativas #cite(<casanova2025>).

La arquitectura de software final constituye el plano director definitivo que articula, sintetiza y concilia las diversas vistas estructurales, dinámicas y de despliegue abordadas en las etapas precedentes del ciclo de vida del proyecto. Para lograr una representación rigurosa y libre de ambigüedades, se adopta el *Modelo C4* propuesto por Simon Brown #cite(<brown2024>), el cual estructura la arquitectura en niveles jerárquicos de abstracción progresiva (Contexto, Contenedores y Componentes), permitiendo comunicar la solución técnica con claridad tanto a directivos del negocio de salud como a ingenieros de software e infraestructura.

Asimismo, la arquitectura final fundamenta sus decisiones de diseño en un *estilo híbrido MVC* acoplado a un *Monolito Modular* #cite(<richards2020>), complementado en su núcleo transaccional mediante los principios de *Clean Architecture* #cite(<martin2017>) y *Arquitectura Hexagonal* (Puertos y Adaptadores) #cite(<cockburn2005>). Este andamiaje garantiza el aislamiento de las invariantes y reglas de negocio clínico respecto de tecnologías volátiles, bibliotecas de persistencia y servicios externos de terceros, dotando a la clínica de una infraestructura digital escalable, mantenible y de fácil evolución conforme a las directrices de salud digital de la Organización Mundial de la Salud #cite(<oms2020>) #cite(<oms2024>).

== Contexto del sistema OmVital Physio Control

*OmVital Physio Control* opera como el núcleo informático de una red asistencial distribuida en tres sucursales físicas (Sede Central, Sede Norte y Sede Sur), las cuales operan en línea de forma coordinada accediendo a un repositorio centralizado de datos alojado en la nube. La clínica atiende un flujo continuo y altamente dinámico de pacientes con patologías traumatológicas, afecciones neurológicas crónicas, lesiones osteomusculares deportivas y requerimientos de rehabilitación psicomotriz gerontológica.

De acuerdo con el dimensionamiento operacional del sistema, la arquitectura se encuentra calculada para soportar:
- La atención concurrente de hasta 65 pacientes diarios distribuidos entre las tres sedes.
- Ventanas de alta concentración en recepción con picos de 6 a 10 pacientes en intervalos de 10 a 15 minutos al inicio de cada bloque horario.
- Más de 20 consultas clínicas y terapéuticas ejecutadas de manera simultánea en cabinas y boxes de atención.
- Cargas transaccionales pico superiores a 25 peticiones por segundo (req/s) dirigidas hacia el servidor central.
- La custodia histórica y el acceso en línea a más de 10 000 expedientes clínicos electrónicos bajo estrictas políticas de inmutabilidad y confidencialidad.

La dinámica del centro clínico demanda una orquestación precisa entre cinco ámbitos operacionales interdependientes:
1. *Gestión integral de pacientes y expedientes clínicos:* Apertura de historias clínicas, registro de datos de filiación, captura de antecedentes y formalización digital de consentimientos informados con certificación criptográfica, aplicando una política obligatoria de baja lógica que prohíbe el borrado físico de registros para salvaguardar la responsabilidad médico-legal institucional.
2. *Programación de citas y admisión síncrona en recepción (Check-in):* Reserva de turnos ambulatorios por especialidad, control de asistencia en ventanilla y validación síncrona en tiempo real del saldo de sesiones contratadas frente a la pasarela financiera externa antes de autorizar el paso del paciente al área de boxes.
3. *Gestión y rotación de recursos clínicos en tiempo real:* Supervisión reactiva del estado y disponibilidad de camillas terapéuticas y consultorios en cada sede, difundiendo de forma instantánea los cambios de ocupación para evitar sobreasignaciones y colisiones entre fisioterapeutas.
4. *Protocolo asistencial de fisioterapia, notas SOAP y banderas rojas:* Registro en el punto de atención de la anamnesis, constantes vitales, técnicas kinesiológicas aplicadas y notas de evolución clínica bajo el estándar SOAP. Incorpora la activación de protocolos de contingencia médica inmediata ante la detección de signos de alerta ("banderas rojas") que contraindiquen la terapia física.
5. *Cierre asistencial, certificación digital PKI y seguimiento multicanal:* Captura ágil de la firma digital de conformidad del paciente en tableta clínica, liberación inmediata del box de tratamiento, compilación asíncrona de constancias en PDF para su resguardo inalterable en la nube (AWS S3) y despacho automatizado de comprobantes y recordatorios preventivos mediante mensajería por WhatsApp.

== Base formal de requisitos y trazabilidad arquitectónica

La arquitectura final de OmVital Physio Control se encuentra estrictamente fundamentada en el catálogo oficial de requisitos de software del proyecto, almacenado y auditado en la base de datos relacional de control de ingeniería (`database/`). Cada límite de sistema, contenedor desplegable, protocolo de red y componente interno responde de manera bidireccional a una educción (`EDU`), una ilación procedimental (`ILA`), un requerimiento no funcional de calidad (`RNF`) o un control de mitigación de riesgo arquitectónico (`RSK`).

=== Catálogo oficial de Educciones activas

De las 33 necesidades identificadas inicialmente en el estudio de campo, el alcance técnico de la plataforma clínica se consolida en 11 educciones activas que cubren íntegramente la operación de rehabilitación ambulatoria:

#align(center)[
  #block(width: 100%)[
    #set text(size: 8.5pt)
    #table(
      columns: (2cm, 4cm, 1.8cm, 2cm, 1fr),
      align: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Código*],
        table.cell(fill: rgb("#dbe6f0"))[*Nombre de la Educción*],
        table.cell(fill: rgb("#dbe6f0"))[*Prioridad*],
        table.cell(fill: rgb("#dbe6f0"))[*Actor*],
        table.cell(fill: rgb("#dbe6f0"))[*Requisito Esencial y Alcance Clínico*],
      ),
      [*EDU-0001*], [Gestión de datos del paciente], [Vital], [ACT-0003], [Gestión integral de filiación, antecedentes e inmutabilidad de la historia clínica. Prohíbe borrado físico y aplica baja lógica.],
      [*EDU-0002*], [Gestión de citas de pacientes], [Vital], [ACT-0003], [Ciclo de vida de la agenda médica multi-sede: programación, reprogramación, cancelación y detección de colisiones horarias.],
      [*EDU-0005*], [Gestión de seguimiento de clientes], [Opcional], [ACT-0001], [Registro y visualización analítica de métricas evolutivas objetivas: dolor en Escala Visual Analógica (EVA) y arcos de movilidad.],
      [*EDU-0006*], [Registro clínico del paciente], [Vital], [ACT-0001], [Apertura de historia clínica, ficha de evaluación traumatológica y geronto-psicomotriz con diagnóstico cinético.],
      [*EDU-0025*], [Gestión de sesión terapéutica], [Vital], [ACT-0001], [Registro de notas SOAP en box, toma de constantes vitales, activación de banderas rojas y captura de firma en tableta.],
      [*EDU-0026*], [Visualización de organización interna], [Vital], [ACT-0002], [Tablero de control de turnos en consultorio, pacientes asignados y visualización de carga de trabajo por fisioterapeuta.],
      [*EDU-0027*], [Intercambio de información entre sedes], [Vital], [ACT-0002], [Acceso unificado al expediente clínico y saldo de sesiones desde cualquiera de las tres sedes de la red asistencial.],
      [*EDU-0029*], [Control de asistencia de pacientes], [Vital], [ACT-0003], [Recepción y check-in en ventanilla en un solo clic, con validación síncrona de saldo y generación de constancia.],
      [*EDU-0031*], [Plantillas de tratamiento estándar], [Vital], [ACT-0001], [Creación, actualización y aplicación de protocolos kinesiológicos estandarizados reutilizables por patología.],
      [*EDU-0032*], [Monitoreo de organización en recepción], [Vital], [ACT-0003], [Dashboard reactivo en ventanilla con estado de camillas en tiempo real y asignación dinámica de pacientes a boxes.],
      [*EDU-0033*], [Ingreso al sistema y seguridad], [Vital], [ACT-0004], [Autenticación centralizada mediante credenciales corporativas, tokens JWT y control de acceso basado en roles (RBAC).],
    )
  ]
]

=== Justificación técnica de Requisitos Depurados / Fuera de Alcance

Con el propósito de mantener la alta cohesión arquitectónica y evitar el sobre-dimensionamiento innecesario del sistema hacia dominios ajenos a la práctica de fisioterapia ambulatoria, se formalizó la exclusión de 22 educciones del alcance de *OmVital Physio Control*:

#align(center)[
  #block(width: 100%)[
    #set text(size: 8.5pt)
    #table(
      columns: (3cm, 3.5cm, 1fr),
      align: (center + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Educciones Excluidas*],
        table.cell(fill: rgb("#dbe6f0"))[*Dominio Funcional*],
        table.cell(fill: rgb("#dbe6f0"))[*Fundamentación Técnica y Arquitectónica de Exclusión*],
      ),
      [*EDU-0003*], [Farmacia e Insumos], [El centro médico no comercializa medicamentos sujetos a receta. Los consumibles kinesiológicos (cintas, geles) se gestionan mediante caja chica administrativa.],
      [*EDU-0004*], [Facturación Electrónica SUNAT], [La emisión y timbrado tributario de boletas/facturas electrónicas se delega al software contable corporativo externo, evitando acoplar el backend clínico a normativas tributarias.],
      [*EDU-0007 al EDU-0024* \ (18 educciones)], [Módulos ERP Legacy (Compras, Proveedores, Almacén)], [Corresponden a requerimientos de compras corporativas, evaluación de proveedores y gestión de inventario pesado, los cuales no forman parte del núcleo asistencial ni de la interacción con el paciente.],
      [*EDU-0028*], [Presupuestos Comerciales], [Las cotizaciones y paquetizaciones se unificaron dentro del flujo simplificado de admisión y caja en recepción (`EDU-0001` y `EDU-0002`), eliminando pantallas redundantes.],
      [*EDU-0030*], [Encuestas de Satisfacción], [Excluido del núcleo transaccional para priorizar el rendimiento y la adherencia al tratamiento clínico (`EDU-0005`), trasladando la analítica de satisfacción a campañas externas.],
    )
  ]
]

=== Catálogo oficial de Ilaciones operativas (27 ILA)

Las 11 educciones activas se descomponen procedimentalmente en 27 ilaciones de negocio que rigen el comportamiento de las interfaces de usuario y de los casos de uso transaccionales:

#align(center)[
  #block(width: 100%)[
    #set text(size: 8pt)
    #table(
      columns: (1.8cm, 4.2cm, 1.8cm, 1.6cm, 1fr),
      align: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Código*],
        table.cell(fill: rgb("#dbe6f0"))[*Nombre del Procedimiento*],
        table.cell(fill: rgb("#dbe6f0"))[*Educción*],
        table.cell(fill: rgb("#dbe6f0"))[*Prioridad*],
        table.cell(fill: rgb("#dbe6f0"))[*Propósito Operativo y Regla de Negocio*],
      ),
      [*ILA-0001*], [Registro inicial de paciente], [EDU-0001], [Vital], [Captura de datos de filiación obligatorios y creación del identificador único de expediente.],
      [*ILA-0002*], [Consulta de perfil de paciente], [EDU-0001], [Vital], [Búsqueda indexada por DNI con tiempo de respuesta inferior a 3 segundos (`RNF-0002`).],
      [*ILA-0003*], [Actualización de información], [EDU-0001], [Vital], [Modificación de datos de contacto o clínicos preservando la bitácora histórica de cambios.],
      [*ILA-0004*], [Baja lógica o archivado], [EDU-0001], [Vital], [Transición a estado inactivo histórico sin eliminación física en base de datos (`RSK-01`).],
      [*ILA-0005*], [Registro inicial de cita], [EDU-0002], [Vital], [Asignación de turno ambulatorio con validación de disponibilidad de fisioterapeuta y sede.],
      [*ILA-0006*], [Consulta de agenda médica], [EDU-0002], [Vital], [Visualización multi-sucursal de citas programadas en cuadrícula horaria interactiva.],
      [*ILA-0007*], [Reprogramación de citas], [EDU-0002], [Vital], [Cambio de horario o terapeuta aplicando bloqueo pesimista para evitar sobre-reservas (`RSK-02`).],
      [*ILA-0008*], [Cancelación de cita], [EDU-0002], [Vital], [Anulación justificada con liberación inmediata de camilla y horario en la agenda central.],
      [*ILA-0009*], [Registro de seguimiento], [EDU-0005], [Opcional], [Ingreso de métricas objetivas (EVA, balance articular) durante o tras la sesión.],
      [*ILA-0010*], [Dashboard de seguimiento], [EDU-0005], [Opcional], [Visualización gráfica condensada de la evolución clínica del paciente a lo largo del tiempo.],
      [*ILA-0011*], [Gestión de historia clínica], [EDU-0006], [Vital], [Apertura y selección del tipo de evaluación inicial (traumatológica o gerontológica).],
      [*ILA-0012*], [Consulta de historial clínico], [EDU-0006], [Vital], [Acceso unificado y cronológico a todas las sesiones, diagnósticos y notas previas.],
      [*ILA-0013*], [Evaluación traumatológica], [EDU-0006], [Vital], [Ficha especializada para lesiones musculares, articulares, posturales y de deportistas.],
      [*ILA-0014*], [Evaluación psicomotriz], [EDU-0006], [Vital], [Ficha geriátrica enfocada en equilibrio, movilidad articular y autonomía psicomotriz.],
      [*ILA-0015*], [Crear sesión terapéutica], [EDU-0025], [Vital], [Apertura de la sesión en el box, toma de constantes vitales y redacción de notas SOAP.],
      [*ILA-0016*], [Consultar sesión terapéutica], [EDU-0025], [Vital], [Revisión en tableta de los procedimientos y ejercicios ejecutados en turnos previos.],
      [*ILA-0017*], [Editar sesión terapéutica], [EDU-0025], [Vital], [Ajuste de notas o técnicas antes del cierre definitivo y firma del paciente.],
      [*ILA-0018*], [Desactivar sesión terapéutica], [EDU-0025], [Vital], [Suspensión inmediata de la sesión ante banderas rojas clínicas con reversión de cobro.],
      [*ILA-0019*], [Visualizar organización interna], [EDU-0026], [Media], [Panel de control en consultorio con citas del día y estado de pacientes en sala.],
      [*ILA-0020*], [Registrar asistencia (Check-in)], [EDU-0029], [Vital], [Admisión en 1 solo clic en recepción tras verificar saldo financiero síncrono ($t <= 3$ s).],
      [*ILA-0021*], [Obtener constancia asistencial], [EDU-0029], [Vital], [Generación en background de constancia PDF firmada y resguardada en AWS S3.],
      [*ILA-0022*], [Crear protocolo estandarizado], [EDU-0031], [Vital], [Definición de plantillas terapéuticas estructuradas por patología kinefisiátrica.],
      [*ILA-0023*], [Consultar protocolo estándar], [EDU-0031], [Vital], [Búsqueda y carga rápida de plantillas prediseñadas en la sesión en curso.],
      [*ILA-0024*], [Actualizar protocolo estándar], [EDU-0031], [Vital], [Modificación de fases, ejercicios y recomendaciones de una plantilla clínica.],
      [*ILA-0025*], [Eliminar protocolo estándar], [EDU-0031], [Vital], [Inactivación de plantillas obsoletas garantizando integridad en registros antiguos.],
      [*ILA-0026*], [Dashboard de recepción], [EDU-0032], [Media], [Monitoreo en tiempo real del estado de camillas en todas las sedes vía WebSockets.],
      [*ILA-0027*], [Ingreso al sistema (Login)], [EDU-0033], [Vital], [Autenticación mediante credenciales con entrega de token JWT y claims de rol.],
    )
  ]
]

=== Catálogo oficial de Requerimientos No Funcionales (RNF) y Calidad

El catálogo de Requerimientos No Funcionales formaliza los atributos de calidad según la norma ISO/IEC 25010 que gobiernan las decisiones de diseño arquitectónico:

#align(center)[
  #block(width: 100%)[
    #set text(size: 8pt)
    #table(
      columns: (1.8cm, 2.5cm, 3.2cm, 1fr, 2.8cm),
      align: (center + horizon, center + horizon, left + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Código*],
        table.cell(fill: rgb("#dbe6f0"))[*Atributo ISO*],
        table.cell(fill: rgb("#dbe6f0"))[*Métrica / Umbral*],
        table.cell(fill: rgb("#dbe6f0"))[*Criterio de Aceptación Arquitectónico*],
        table.cell(fill: rgb("#dbe6f0"))[*Componente Responsable*],
      ),
      [*RNF-0001*], [Disponibilidad], [Durabilidad: 99.999999999% \ Disponibilidad: >= 99.9%], [Custodia en la nube de documentos médicos, consentimientos e historias clínicas electrónicas.], [AWS S3 (`S-EXT-02`) y PostgreSQL (`P-DAT-01`)],
      [*RNF-0002*], [Eficiencia / Latencia], [Latencia: $t <= 3.0$ s \ Debounce: 500 ms], [Búsqueda y filtrado por DNI en el catálogo de pacientes en recepción y consultorio.], [Cliente React (`P-CLI-01`) y FastAPI Core (`P-SRV-01`)],
      [*RNF-0003*], [Usabilidad / Tiempo], [Acción: 1 clic en check-in \ Firma: $t <= 10$ s en tablet], [Ejecución rápida del check-in en admisión y captura ágil de la firma digital de conformidad.], [Cliente React (`P-CLI-01`) y Tablet Kotlin (`P-CLI-02`)],
      [*RNF-0004*], [Usabilidad], [Densidad: 1 sola vista \ Scroll vertical continuo], [Presentación condensada del historial de sesiones sin paginaciones fragmentadas.], [Clientes SPA (`P-CLI-01`) y Tablet (`P-CLI-02`)],
      [*RNF-0005*], [Interoperabilidad], [Consistencia multi-sede \ Latencia: $t < 2$ s], [Sincronización del historial y sesiones del paciente entre Sede Central, Norte y Sur.], [FastAPI Core (`P-SRV-01`) y PostgreSQL (`P-DAT-01`)],
      [*RNF-0006*], [Concurrencia / T. Real], [Latencia difusora: $t < 1.0$ s \ Objetivo: 200 a 450 ms], [Actualización instantánea en pantalla de recepción del mapa de disponibilidad de camillas.], [Motor WebSockets (`P-SRV-02`) y Redis (`P-BRK-01`)],
      [*RNF-0007*], [Eficiencia / Procesamiento], [Generación PDF: $t <= 5.0$ s \ Desacople asíncrono], [Generación en background de constancias asistenciales y comprobantes sin congelar UI.], [Broker Celery (`P-BRK-01`) y Worker (`P-WRK-01`)],
      [*RNF-0008*], [Rendimiento / Carga], [Carga: hasta 65 pac/día \ Picos: 6 a 10 pac / 15 min], [Operación fluida en ventanilla en horarios pico con navegación limitada a 2 clics.], [Cliente Web (`P-CLI-01`) y FastAPI Pool (`P-SRV-01`)],
      [*RNF-0009*], [Seguridad / Usabilidad], [Paso modal de doble factor \ Confirmación obligatoria], [Prevención de errores de admisión mediante diálogo de confirmación previo al check-in.], [Interfaz de Usuario React (`P-CLI-01`)],
      [*RNF-0011*], [Usabilidad], [Resumen clínico en 1 vista \ Cero navegación previa], [Pantalla resumen con motivo de consulta, fase de lesión y banderas rojas al iniciar box.], [Aplicación Tablet (`P-CLI-02`)],
      [*RNF-0012*], [Eficiencia], [Acceso clínico: <= 2 clics \ Visualización inmediata], [Acceso directo al diagnóstico cinético y constantes fisiológicas desde la sesión abierta.], [Aplicación Tablet (`P-CLI-02`)],
      [*RNF-0013*], [Usabilidad], [Gráfica interactiva \ Escala EVA (0-10) y ROM], [Representación visual de la curva de dolor y rango de movimiento en el tiempo.], [Módulo de Seguimiento (`P-CLI-01`, `P-CLI-02`)],
      [*RNF-0014*], [Operatividad], [Tiempo registro: <= 45 s \ Formulario estructurado], [Registro veloz de la mini-evaluación diaria sin retrasar la atención física del paciente.], [Formularios SOAP en Tablet (`P-CLI-02`)],
      [*RNF-0015*], [Seguridad / Auditoría], [Marca temporal UTC \ Bitácora inmutable], [Trazabilidad inalterable de cada mutación clínica: usuario, rol, timestamp y baja lógica.], [PostgreSQL (`P-DAT-01`) y Core (`P-SRV-01`)],
      [*RNF-0016*], [Seguridad RBAC], [Validación JWT en servidor \ Firma RS256/HS256], [Control de acceso basado en roles multi-sede con claims validados exclusivamente en backend.], [API Gateway FastAPI (`P-SRV-01`)],
      [*RNF-0017*], [Consistencia ACID], [Nivel de aislamiento Read Committed \ SELECT FOR UPDATE], [Bloqueo pesimista por fila para impedir sobre-asignación concurrente de turnos y camillas.], [Motor relacional PostgreSQL 16 (`P-DAT-01`)],
      [*RNF-0018*], [Seguridad Perimetral], [Terminación TLS 1.3 \ Latencia: $t < 50$ ms], [Cifrado perimetral de todo el tráfico entrante de sucursales con proxy inverso.], [Reverse Proxy Nginx (`P-EDGE-01`)],
    )
  ]
]

=== Matriz de Mitigación de Riesgos Arquitectónicos (RSK)

Para garantizar la estabilidad y validez médico-legal de la solución, la arquitectura final implementa seis mecanismos de mitigación de riesgos críticos:

- *RSK-01 (Pérdida de integridad del historial médico o alteración no autorizada):* Mitigado mediante la prohibición estricta de borrado físico en base de datos (`P-DAT-01`). Toda desvinculación se procesa como baja lógica ("Archivo Histórico"), complementada por marcas de tiempo UTC del servidor y una bitácora de auditoría inmutable de tipo _append-only_ (`RNF-0015`).
- *RSK-02 (Condiciones de carrera en reserva de citas o asignación concurrente de camillas):* Mitigado mediante transacciones ACID con bloqueo pesimista por fila (`SELECT FOR UPDATE`) a nivel de base de datos relacional. Si dos recepcionistas o coordinadores intentan asignar el mismo recurso simultáneamente, el backend `P-SRV-01` rechaza la segunda solicitud devolviendo un código `HTTP 409 Conflict` (`RNF-0006`, `RNF-0017`).
- *RSK-03 (Fuga de información confidencial o incumplimiento de leyes de protección de datos personales):* Mitigado mediante cifrado simétrico robusto AES-256 en reposo para todos los objetos y documentos clínicos en AWS S3 (`S-EXT-02`), y cifrado obligatorio en tránsito con SSL/TLS 1.3 en el borde perimetral (`P-EDGE-01`, `RNF-0018`).
- *RSK-04 (Repudio legal de consentimientos informados y actas de atención):* Mitigado mediante la integración síncrona con el servicio de firma digital criptográfica de Firma Perú - RENIEC PKI (`S-EXT-04`), vinculando la firma biométrica de la tableta con un certificado digital y sello cronológico inalterable resguardado en la nube (`RNF-0003`, `RNF-0007`).
- *RSK-05 (Bloqueo y degradación de la experiencia por indisponibilidad o latencia de APIs externas):* Mitigado mediante una política estricta de tiempo de corte (_timeout_ de 3 segundos) en las llamadas hacia la Pasarela Financiera (`S-EXT-01`), y el desacoplamiento total de la generación de PDFs y mensajería de WhatsApp (`S-EXT-03`) delegándolos a colas de mensajería asíncronas con Celery y Redis (`P-BRK-01`, `P-WRK-01`, `RNF-0007`).
- *RSK-06 (Acceso no autorizado, suplantación o escalamiento de privilegios entre sedes):* Mitigado centralizando la verificación de roles exclusivamente en el backend core (`P-SRV-01`) mediante tokens JWT criptográficamente firmados, impidiendo que los clientes web o tableta determinen privilegios de manera autónoma (`RNF-0016`).

#pagebreak(weak: true)

== Estructura y niveles de abstracción arquitectónica (Modelo C4)

La representación arquitectónica de OmVital Physio Control se articula rigurosamente a través de los tres primeros niveles jerárquicos del Modelo C4 propuesto por Simon Brown #cite(<brown2024>), transitando desde la delimitación del sistema como caja negra hasta la estructura concéntrica de componentes de su backend central:

=== Nivel 1: Contexto del Sistema (D-C4-001)

El Diagrama de Contexto del Sistema delimita formalmente las fronteras de software de *OmVital Physio Control* respecto a su ecosistema humano y tecnológico externo:

- *Actores humanos internos:*
  - *Fisioterapeuta (`ACT-0001`):* Interactúa desde la aplicación de tableta (`P-CLI-02`) en boxes de tratamiento. Registra notas SOAP, constantes vitales, activa alertas de banderas rojas y captura la firma de conformidad del paciente.
  - *Coordinador de Sede (`ACT-0002`):* Monitorea la ocupación y rotación de camillas, gestiona la disponibilidad de terapeutas y coordina traslados de expedientes entre sedes mediante la interfaz web (`P-CLI-01`).
  - *Recepcionista (`ACT-0003`):* Personal de ventanilla que registra nuevos pacientes, administra la agenda, ejecuta el check-in en 1 solo clic y coordina cobros de sesiones (`P-CLI-01`).
  - *Gerente General (`ACT-0004`):* Usuario de nivel directivo que supervisa la auditoría asistencial multi-sede, indicadores de productividad y gestión de accesos RBAC (`P-CLI-01`).
- *Actor humano externo receptor:*
  - *Paciente de Rehabilitación:* Asiste a la clínica para recibir terapia física. No accede de manera autenticada al sistema central; interactúa físicamente estampando su firma digital en la tableta del terapeuta y recibe de forma remota notificaciones, recordatorios y enlaces de constancias en PDF vía WhatsApp móvil.
- *Sistemas externos de integración:*
  - *Pasarela Financiera (`S-EXT-01`):* Entidad bancaria o pasarela consultada vía HTTPS REST con _timeout_ $<= 3$ s para validar el saldo de paquetes y cobrar sesiones.
  - *AWS S3 (`S-EXT-02`):* Repositorio de objetos en la nube de alta disponibilidad utilizado para la custodia inmutable de historias clínicas y PDFs.
  - *WhatsApp Meta Cloud API (`S-EXT-03`):* Servicio de mensajería en la nube utilizado para el despacho automatizado de constancias y recordatorios de citas.
  - *Firma Perú - RENIEC PKI (`S-EXT-04`):* Infraestructura de Clave Pública nacional para el estampado criptográfico de consentimientos informados con plena validez médico-legal.

#v(0.6em)

#figure(
  image("../imagenes/c1.svg", width: 100%, height: 13.5cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [Diagrama C4 — Nivel 1: Contexto del Sistema OmVital Physio Control en caja negra.],
)

#pagebreak(weak: true)

=== Nivel 2: Contenedores y Protocolos Físicos de Comunicación (D-C4-002)

El Diagrama de Contenedores expone las unidades ejecutables y desplegables que componen la solución de software, articulando un estilo híbrido donde la *Vista* se distribuye en las sedes físicas, mientras que el *Controlador* y el *Modelo* se centralizan en la nube dentro de un *Monolito Modular* de alta consistencia transaccional:

1. *P-CLI-01 (SPA Web React / TypeScript):* Aplicación web enriquecida desplegada en navegadores de recepción y coordinación. Optimizada para flujos ágiles de admisión, agenda multi-sucursal y dashboards de monitoreo reactivo (`RNF-0002`, `RNF-0008`).
2. *P-CLI-02 (App Tablet Android / Kotlin):* Aplicación móvil nativa utilizada por fisioterapeutas en los boxes de tratamiento. Proporciona formularios kinefisiátricos ágiles, evaluación rápida diaria y un componente de lienzo táctil para captura de firma manuscrita digital (`RNF-0003`, `RNF-0014`).
3. *P-EDGE-01 (Reverse Proxy Nginx / TLS 1.3):* Punto de entrada y borde de seguridad que efectúa la terminación SSL/TLS con latencia inferior a 50 ms (`RNF-0018`), aplicando políticas de limitación de tasa de peticiones (_rate limiting_) y enrutando el tráfico hacia el API Core o el motor de WebSockets.
4. *P-SRV-01 (OMVITAL Backend Core API - FastAPI / Python):* Servidor transaccional monolítico modular estructurado bajo Clean Architecture. Procesa los 11 casos de uso de negocio clínico, ejecuta validaciones Pydantic, coordina el control de acceso JWT/RBAC y gestiona los puertos secundarios de persistencia e integración.
5. *P-SRV-02 (Motor WebSockets en tiempo real - Python):* Servidor reactivo basado en el protocolo RFC 6455 que mantiene conexiones bidireccionales persistentes con recepción y boxes, difundiendo los eventos de ocupación y liberación de camillas con latencia de 200 a 450 ms (`RNF-0006`).
6. *P-BRK-01 (Broker de Tareas en Memoria - Redis):* Cola de mensajes de alta velocidad empleada para desacoplar el procesamiento intensivo de constancias PDF y despacho de mensajería del hilo principal de peticiones HTTP.
7. *P-WRK-01 (Trabajadores en Segundo Plano - Celery / Python):* Servicio de ejecución diferida que procesa los trabajos de la cola Redis, compila reportes en PDF, consume el servicio de mensajería WhatsApp (`S-EXT-03`) y sube archivos cifrados a AWS S3 (`S-EXT-02`) en menos de 5 segundos (`RNF-0007`).
8. *P-DAT-01 (Repositorio Relacional PostgreSQL 16):* Base de datos principal configurada con motor ACID estricto. Organiza la información en esquemas lógicos desacoplados (`core_clinical`, `scheduling_resources`, `security_audit`), garantizando integridad referencial, bloqueos pesimistas y preservación de auditoría histórica (`RNF-0015`, `RNF-0017`).

#v(0.4em)

==== Matriz de Protocolos Físicos de Comunicación

La interacción entre contenedores y servicios externos se gobierna mediante 11 protocolos físicos estrictos:

#align(center)[
  #block(width: 100%)[
    #set text(size: 8pt)
    #table(
      columns: (0.9cm, 2.6cm, 2.6cm, 3.2cm, 1fr),
      align: (center + horizon, left + horizon, left + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*N°*],
        table.cell(fill: rgb("#dbe6f0"))[*Origen*],
        table.cell(fill: rgb("#dbe6f0"))[*Destino*],
        table.cell(fill: rgb("#dbe6f0"))[*Protocolo / Puerto*],
        table.cell(fill: rgb("#dbe6f0"))[*Propósito Operativo y Regla Vinculada*],
      ),
      [1], [`P-CLI-01` (SPA Web)], [`P-EDGE-01` (Proxy)], [HTTPS REST (443) + JWT], [Admisión, búsqueda por DNI ($t < 3$ s), agenda, check-in en 1 clic y monitoreo (`RNF-0002`, `0003`, `0008`).],
      [2], [`P-CLI-02` (Tablet)], [`P-EDGE-01` (Proxy)], [HTTPS REST (443) + JWT], [Registro de historias clínicas, notas SOAP, plantillas y captura de firma en box (`EDU-0006`, `0025`, `0031`).],
      [3], [`P-CLI-01` / `02`], [`P-EDGE-01` (Proxy)], [WSS Seguro (443)], [Canal bidireccional reactivo para actualización instantánea de camillas y turnos (`EDU-0026`, `0032`, `RNF-0006`).],
      [4], [`P-EDGE-01` (Proxy)], [`P-SRV-01` (Core API)], [HTTP interno + JWT], [Reenvío de tráfico REST autenticado tras la terminación perimetral TLS.],
      [5], [`P-EDGE-01` (Proxy)], [`P-SRV-02` (WS Motor)], [WS interno (8001)], [Reenvío transparente de conexiones WebSocket hacia salas segmentadas por sucursal.],
      [6], [`P-SRV-01` (Core API)], [`P-SRV-02` (WS Motor)], [Evento interno HTTP / IPC], [Emisión de eventos tras mutaciones de estado en base de datos para su difusión reactiva (`RNF-0005`, `0006`).],
      [7], [`P-SRV-01` (Core API)], [`P-BRK-01` -> Worker], [Redis Protocol (6379)], [Encolamiento asíncrono de tareas pesadas de generación de constancias PDF y notificaciones (`RNF-0007`).],
      [8], [`P-SRV-01` (Core API)], [`P-DAT-01` (Postgres)], [TCP/IP (5432) Pool ACID], [Transacciones relacionales multi-sede, bloqueos `SELECT FOR UPDATE`, baja lógica y auditoría (`RNF-0015`, `RSK-01`).],
      [9], [`P-SRV-02` (WS Motor)], [`P-DAT-01` (Postgres)], [TCP/IP (5432) Pub/Sub], [Escucha asíncrona mediante `LISTEN/NOTIFY` para detectar liberaciones de camillas en tiempo real (`RNF-0006`).],
      [10], [`P-WRK-01` (Worker)], [`P-DAT-01` (Postgres)], [TCP/IP (5432) Pool Read], [Lectura de datos clínicos para compilación de constancias y actualización del estado de despacho (`RNF-0007`).],
      [11], [`P-SRV-01` (Core API)], [`S-EXT-01` (Finanzas)], [HTTPS REST (443) $\le 3$ s], [Consulta síncrona de saldo de sesiones antes de autorizar el check-in en admisión (`EDU-0002`, `0029`, `RSK-05`).],
    )
  ]
]

#pagebreak(weak: true)

#figure(
  image("../imagenes/c2.svg", width: 100%, height: 21cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [Diagrama C4 — Nivel 2: Topología de Contenedores y los 11 Protocolos Físicos de Comunicación.],
)

#pagebreak(weak: true)

=== Nivel 3: Componentes Internos del Backend Core (D-C4-003)

El Diagrama de Componentes descompone la anatomía interna del contenedor central `P-SRV-01: OMVITAL API Gateway & Backend Core (FastAPI / Python)`. Siguiendo los principios de *Clean Architecture* #cite(<martin2017>) y *Arquitectura Hexagonal* #cite(<cockburn2005>), el sistema organiza su código en cuatro capas concéntricas donde el flujo de dependencias apunta estrictamente hacia el interior:

1. *Capa 01 - Presentación (Adaptadores Primarios de Entrada):*
  - *FastAPI Domain Routers:* Enrutadores modulares que exponen los endpoints REST para Pacientes, Agenda, Sesiones, Recursos y Seguridad, efectuando la serialización sintáctica con esquemas Pydantic v2.
  - *Middlewares de Seguridad y Contexto:* Verificación obligatoria de tokens JWT, inyección de dependencias de identidad multi-sede y autorización estricta RBAC (`RNF-0016`).
2. *Capa 02 - Aplicación (Casos de Uso y Puertos Abstractos):*
  - *Casos de Uso Clínicos y Administrativos (11 Use Cases):* Orquestadores del flujo de negocio que encapsulan la lógica transaccional: Admisión de Paciente, Programación de Cita, Admisión Síncrona (Check-in con validación financiera $\le 3$ s), Asignación de Box, Registro de Notas SOAP, Activación de Contingencia Médica (Banderas Rojas), Cierre de Sesión con Firma Digital, Creación de Plantilla Terapéutica, Consulta de Historial Multi-Sede, Generación Asíncrona de Constancia y Autenticación Centralizada.
  - *Puertos de Aplicación (Interfaces Abstractas):* Contratos abstractos orientados al dominio que desacoplan la lógica de negocio respecto de la tecnología de almacenamiento (interfaces `IPatientRepository`, `IAppointmentRepository`, `IClinicalRecordRepository`, etc.) y de servicios externos (interfaces `IFinancialGatewayService`, `IDigitalSignatureService`, `IStorageService`, `INotificationService`).
3. *Capa 03 - Dominio Puro (Entidades e Invariantes Clínicas):*
  - *Entidades de Negocio:* Modelos de dominio enriquecidos que no poseen ninguna dependencia de SQLAlchemy, FastAPI o bibliotecas de persistencia (Paciente, Expediente Clínico, Cita, Camilla, Nota SOAP, Constantes Vitales, Plantilla Kinesiológica).
  - *Invariantes y Reglas Clínicas:* Validación de consistencia médica (imposibilidad de firmar sesiones sin toma previa de constantes vitales, prohibición de sobrepasar rangos biológicos admisibles, y la regla de no-borrado físico mediante baja lógica obligatoria).
4. *Capa 04 - Infraestructura (Adaptadores Secundarios de Persistencia e Integración):*
  - *Adaptadores de Persistencia (PostgreSQL Repositories):* Implementaciones de los puertos de aplicación mediante SQLAlchemy 2.0 ORM con soporte asíncrono (`asyncpg`), gobernadas por el patrón *Unit of Work* para asegurar atomicidad transaccional y bloqueos pesimistas por fila (`SELECT FOR UPDATE`, `RNF-0017`).
  - *Patrón Transactional Outbox:* Garantiza que todo evento de dominio (liberación de camilla, cita atendida) se registre en una tabla de bandeja de salida dentro de la misma transacción de base de datos antes de publicarse hacia WebSockets o Celery, impidiendo desincronizaciones ante caídas de red.
  - *Adaptador Pasarela Financiera:* Cliente HTTP asíncrono con control de tiempo de corte estricto ($t \le 3$ s) hacia `S-EXT-01` (`RSK-05`).
  - *Adaptador Firma Perú PKI:* Cliente REST para invocación de firma digital criptográfica de consentimientos informados con `S-EXT-04` (`RSK-04`).
  - *Adaptador de Almacenamiento AWS S3:* Conector seguro con SDK Boto3 para carga y descarga de expedientes clínicos en buckets privados con cifrado AES-256 (`S-EXT-02`, `RNF-0001`).
  - *Despachador Celery:* Adaptador que serializa y encola tareas de compilación documental hacia Redis (`P-BRK-01`).

#pagebreak(weak: true)

#figure(
  image("../imagenes/c3.svg", width: 100%, height: 20.5cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [Diagrama C4 — Nivel 3: Componentes Internos del Backend Core (P-SRV-01 FastAPI Clean Architecture).],
)

#pagebreak(weak: true)

== Objetivos consolidados del diseño de la Arquitectura Final

La concepción, modelado y especificación técnica de la Arquitectura Final de *OmVital Physio Control* alcanza los siguientes objetivos primordiales de ingeniería de software:

1. *Consolidar la visión arquitectónica unificada del sistema:* Sintetizar las perspectivas de contexto en caja negra, contenedores físicos desplegables, protocolos de red y componentes concéntricos de software en un cuerpo documental armónico, cerrando el ciclo de diseño del curso de manera rigurosa.
2. *Garantizar la trazabilidad estricta y bidireccional de requisitos:* Establecer una vinculación demostrable desde las 11 educciones activas y 27 ilaciones operativas, pasando por los tres niveles del Modelo C4, hasta los atributos de calidad (`RNF-0001` a `RNF-0018`) y controles de riesgo (`RSK-01` a `RSK-06`) catalogados en PostgreSQL.
3. *Aislar las invariantes clínicas frente a tecnologías de terceros:* Blindar las reglas del protocolo kinesiológico, las notas SOAP y la inmutabilidad de los expedientes médicos mediante puertos y adaptadores abstractos, permitiendo la actualización de bases de datos o servicios de mensajería sin alterar el núcleo de dominio.
4. *Resolver formalmente la contención y concurrencia multi-sede:* Especificar mecanismos de sincronización reactiva en tiempo real sobre WebSockets ($t < 1$ s, latencia objetivo 200 a 450 ms) y bloqueos pesimistas relacionales en PostgreSQL (`SELECT FOR UPDATE`) para erradicar cualquier sobreasignación de camillas y turnos entre sucursales.
5. *Desacoplar el cómputo intensivo del flujo interactivo:* Asegurar la rápida liberación de las interfaces de usuario en admisión ($t \le 3$ s) y consultorio ($t \le 500$ ms) delegando la generación de constancias PDF y la certificación digital PKI a procesamiento asíncrono con brokers Redis y trabajadores Celery en segundo plano.
6. *Establecer un contrato técnico normativo para la implementación:* Servir como marco de referencia canónico, exhaustivo e inequívoco para los equipos de desarrollo, pruebas automatizadas y despliegue de infraestructura de *OmVital Physio Control*.
