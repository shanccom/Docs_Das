#pagebreak(weak: true)

= Anexos

== Versionamiento de la arquitectura

La presente sección documenta el control formal de versiones de los diagramas que constituyen la arquitectura de software final del sistema *OmVital Physio Control*, estructurada bajo el Modelo C4 (Contexto, Contenedores y Componentes). Cada especificación incorpora una ficha técnica con su código, requisitos no funcionales vinculados, módulo del sistema, proceso representado, versión, autor mediante código de identificación, fecha, justificación técnica, estado y artefactos asociados, acompañada de la figura correspondiente en las versiones que cuentan con modelo gráfico disponible.

#v(0.4em)

=== D-C4-001: Diagrama C4 — Nivel 1: Contexto del Sistema

==== Versión 1.0.0

_Ficha técnica: D-C4-001, versión 1.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-001],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0012, RNF-0015..0018],
      [*Contexto / Módulo*], [Fronteras de red y despliegue del sistema clínico OmVital],
      [*Proceso representado*], [Representación del contexto del sistema exponiendo componentes internos de red (LAN de sucursal, equipos físicos de sede y servidor VPS Linux) de manera anticipada.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0008],
      [*Fecha*], [17/11/2026],
      [*Justificación*], [Línea base que delimitó el ecosistema de hardware y los actores del negocio antes de separar la abstracción lógica de contexto puro de la topología de contenedores.],
      [*Estado*], [Superado],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0027, EDU-0029, EDU-0031, EDU-0032, EDU-0033],
    )
  ]
]

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/c4-nivel1-v1.png", width: 95%, height: 18cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [_D-C4-001_ versión 1.0.0: Diagrama de contexto con exposición preliminar de componentes de red e infraestructura.],
)

#pagebreak(weak: true)

==== Versión 2.0.0

_Ficha técnica: D-C4-001, versión 2.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-001],
      [*Requisitos no funcionales*], [Trazabilidad general hacia RNF del catálogo oficial (los RNF operacionales se especializan en Niveles 2 y 3)],
      [*Contexto / Módulo*], [Contexto canónico de caja negra de OmVital Physio Control],
      [*Proceso representado*], [Representación canónica del sistema como una caja negra estricta según el estándar de Simon Brown: interacción directa con los 4 actores humanos internos (Fisioterapeuta ACT-0001, Coordinador ACT-0002, Recepcionista ACT-0003 y Gerente General ACT-0004), el actor externo receptor (Paciente) y los 4 sistemas externos (Pasarela Financiera S-EXT-01, AWS S3 S-EXT-02, WhatsApp Meta Cloud API S-EXT-03 y Firma Perú RENIEC PKI S-EXT-04).],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0004, AUT-0008],
      [*Fecha*], [19/11/2026],
      [*Justificación*], [Alineación con el estándar del Modelo C4, eliminando detalles de despliegue interno del Nivel 1 para concentrarse estrictamente en los límites del negocio y las fronteras de integración.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0027, EDU-0029, EDU-0031, EDU-0032, EDU-0033, ILA-0001..27],
    )
  ]
]

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/c4-nivel1-v2.png", width: 100%, height: 14cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [_D-C4-001_ versión 2.0.0: Diagrama C4 canónico de Contexto del Sistema OmVital Physio Control en caja negra.],
)

#pagebreak(weak: true)

=== D-C4-002: Diagrama C4 — Nivel 2: Contenedores y Arquitectura Híbrida MVC

==== Versión 1.0.0

_Ficha técnica: D-C4-002, versión 1.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-002],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0006, RNF-0007, RNF-0012, RNF-0015],
      [*Contexto / Módulo*], [Topología de contenedores del sistema OmVital],
      [*Proceso representado*], [Estructuración de los contenedores clientes (SPA web y tablet box) conectándose directamente al API Gateway sin una capa perimetral de proxy inverso y con buffer local offline.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0008],
      [*Fecha*], [17/11/2026],
      [*Justificación*], [Definición de la línea base de los contenedores principales y los canales de comunicación física.],
      [*Estado*], [Superado],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0006, EDU-0025, EDU-0026, EDU-0029, EDU-0033],
    )
  ]
]

#pagebreak(weak: true)

==== Versión 2.0.0

_Ficha técnica: D-C4-002, versión 2.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-002],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0005, RNF-0006, RNF-0007, RNF-0008, RNF-0011, RNF-0012, RNF-0011..15, RSK-01..06],
      [*Contexto / Módulo*], [Topología de Contenedores y Protocolos Físicos de Comunicación (MVC + Hexagonal en Monolito Modular)],
      [*Proceso representado*], [Estructuración completa de las unidades ejecutables: Clientes de sede (P-CLI-01 SPA React y P-CLI-02 App Kotlin), Borde perimetral (P-EDGE-01 Nginx TLS), Servidores de aplicaciones (P-SRV-01 FastAPI Core y P-SRV-02 Python WebSockets), Procesamiento asíncrono (P-BRK-01 Broker de tareas y P-WRK-01 Celery Worker), Persistencia relacional (P-DAT-01 PostgreSQL 16) y los 11 protocolos físicos estrictos de red. Soporta dimensionamiento para 3 sucursales, 65 pacientes/día, picos > 25 req/s y mitigación integral RSK-01..06.],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0001, AUT-0007, AUT-0008],
      [*Fecha*], [19/11/2026],
      [*Justificación*], [Incorporación de P-EDGE-01 para terminación TLS, formalización del broker P-BRK-01, alineación estricta con el dimensionamiento de la Vista Física y mitigación de concurrencia multi-sede.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0027, EDU-0029, EDU-0031, EDU-0032, EDU-0033, RSK-01 al RSK-06],
    )
  ]
]

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/c4-nivel2.png", width: 100%, height: 18cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [_D-C4-002_ versión 2.0.0: Diagrama C4 de Contenedores y los 11 protocolos de comunicación física.],
)

#pagebreak(weak: true)

=== D-C4-003: Diagrama C4 — Nivel 3: Componentes Internos del Backend Core (P-SRV-01)

==== Versión 1.0.0

_Ficha técnica: D-C4-003, versión 1.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-003],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0006, RNF-0007, RNF-0015],
      [*Contexto / Módulo*], [Estructura interna del contenedor P-SRV-01 (Backend API)],
      [*Proceso representado*], [Descomposición de servicios y controladores FastAPI organizados por módulos funcionales directos, sin puertos abstractos ni separación concéntrica.],
      [*Versión*], [1.0.0],
      [*Autor*], [AUT-0008],
      [*Fecha*], [17/11/2026],
      [*Justificación*], [Línea base de componentes del backend antes de la refactorización arquitectónica.],
      [*Estado*], [Superado],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0006, EDU-0025, EDU-0033],
    )
  ]
]

#pagebreak(weak: true)

==== Versión 2.0.0

_Ficha técnica: D-C4-003, versión 2.0.0_

#align(center)[
  #block(width: 95%)[
    #set text(size: 9pt)
    #table(
      columns: (4.5cm, 1fr),
      align: (left + horizon, left + horizon),
      stroke: 0.5pt + luma(140),
      table.header(
        table.cell(fill: rgb("#dbe6f0"))[*Elemento / Campo*],
        table.cell(fill: rgb("#dbe6f0"))[*Especificación del Artefacto*],
      ),
      [*Código del diagrama*], [D-C4-003],
      [*Requisitos no funcionales*], [RNF-0001, RNF-0002, RNF-0003, RNF-0004, RNF-0005, RNF-0006, RNF-0007, RNF-0008, RNF-0009, RNF-0012..15, RSK-01..06],
      [*Contexto / Módulo*], [P-SRV-01 Backend Core bajo Clean Architecture y Arquitectura Hexagonal],
      [*Proceso representado*], [Descomposición concéntrica rigurosa en 4 capas: 01 Presentación (API Routers y dependencias de seguridad JWT/RBAC), 02 Aplicación (11 Casos de Uso y contratos abstractos de Puertos), 03 Dominio puro (Entidades clínicas y reglas de negocio independientes de frameworks) y 04 Infraestructura (Repositorios PostgreSQL, UnitOfWork, Transactional Outbox y Adaptadores secundarios hacia S3, Firma Perú, Pasarela Financiera, WebSockets y Celery Worker).],
      [*Versión*], [2.0.0],
      [*Autor*], [AUT-0001, AUT-0004],
      [*Fecha*], [18/11/2026],
      [*Justificación*], [Garantiza el desacoplamiento de las invariantes clínicas frente a librerías externas y motores de persistencia, resolviendo la testabilidad unitaria y la trazabilidad hacia los 6 controles de riesgo arquitectónicos.],
      [*Estado*], [Concluido],
      [*Código de artefactos*], [EDU-0001, EDU-0002, EDU-0005, EDU-0006, EDU-0025, EDU-0026, EDU-0027, EDU-0029, EDU-0031, EDU-0032, EDU-0033, RSK-01..06],
    )
  ]
]

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/c4-nivel3.png", width: 100%, height: 18cm, fit: "contain"),
  kind: image,
  supplement: [Figura],
  caption: [_D-C4-003_ versión 2.0.0: Diagrama de Componentes Internos del Backend Core (P-SRV-01 FastAPI Clean Architecture).],
)
