= Conclusiones

== Del marco conceptual

- La vista física completa el modelo 4+1 al vincular los componentes de la Arquitectura Genérica con los dispositivos que los ejecutan.
- El diagrama de despliegue permite documentar nodos, artefactos y rutas de comunicación, y justificar cada dispositivo por un RNF.
- Los atributos de calidad se traducen en decisiones concretas: redundancia, caché, balanceo de carga, réplicas y canales seguros.
- Separar la vista actual de la propuesta hace visible la brecha de infraestructura y facilita planificar la inversión.

== Del producto

- Se elaboraron dos diagramas de despliegue: D-FIS-001 (situación actual) y D-FIS-002 (situación propuesta).
- Se identificaron los dispositivos existentes y los que deben adquirirse o contratarse: 3 dispositivos físicos por sucursal y 7 componentes en la nube, todos justificados por RNF.
- La infraestructura en la nube centraliza los datos de las tres sucursales y sostiene los RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007 y RNF-0010.
- El producto es coherente con D-DP-001 y deja listas las bases para la selección de tecnologías y el presupuesto.


== Conclusiones

== Del marco conceptual

- La vista física completa el modelo 4+1 al vincular los componentes de la arquitectura lógica con los contenedores y dispositivos físicos que los ejecutan.
- El diagrama de vista física permite documentar nodos, artefactos contenedorizados y rutas de comunicación, justificando la estructura a través de los RNF del sistema.
- Los atributos de calidad se traducen en decisiones de diseño concretas: desacoplamiento de tareas asíncronas, comunicación en tiempo real y aislamiento de la base de datos en una red interna.
- Separar la vista física actual de la propuesta hace visible la brecha de infraestructura y facilita planificar la adopción de tecnologías de virtualización.

== Del producto

- Se elaboraron dos diagramas de vista física: D-FIS-001 (situación actual) y D-FIS-002 (situación propuesta).
- Se definieron los dispositivos cliente (terminales web y tablets) y la infraestructura basada en contenedores Docker para los servicios de aplicación y persistencia, todos justificados por RNF.
- La vista física propuesta centraliza la lógica del negocio y la persistencia de datos en el servidor de aplicaciones y base de datos, sosteniendo los RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007 y RNF-0010.
- El producto es coherente con D-DP-001 y deja listas las bases para la selección de tecnologías y la estructuración de los entornos de ejecución.