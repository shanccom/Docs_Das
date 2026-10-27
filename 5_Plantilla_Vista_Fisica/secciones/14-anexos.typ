= Anexos
#let sistema = [OmVital Physio Control]

== Versionamiento de la vista física

#table(
  columns: (auto, auto, 3fr, 1.5fr),
  align: (center, center, left, left),
  table.header(
    [*Fecha*], [*Versión*], [*Descripción*], [*Autores*],
  ),
  
)
#figure(
  rect(width: 100%, height: 15cm)[
    #align(center + horizon)[#image("/assets/image-4.png")]
  ],
  caption: [D-FIS-002: Diagrama de despliegue de #sistema – situación propuesta.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  table.header(
    [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación propuesta*],
  ),
  [Código del diagrama], [D-FIS-002],
  [Requisitos no funcionales], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia), RNF-0010 (Integridad)],
  [Contexto / módulo], [Vista Física de #sistema – situación propuesta],
  [Proceso representado], [Acceso de las tres sucursales a una infraestructura centralizada en la nube mediante HTTPS/VPN, con servidores replicables, base de datos con réplica, caché, almacenamiento de archivos, respaldo y monitoreo. Distingue con otro color los dispositivos existentes de los que deben adquirirse.],
  [Versión], [1.0.0],
  [Autor], [AUT-0008],
  [Fecha], [08/10/2026],
  [Justificación], [Concreta en infraestructura los componentes de D-DP-001 y cumple los RNF aprobados.],
  [Estado], [Concluido],
  [Código de artefactos], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010, EDU-0027],
  [Comentarios], [Ninguno],
)

#figure(
  rect(width: 100%, height: 15cm)[
    #align(center + horizon)[#image("/assets/image-5.png")]
  ],
  caption: [D-FIS-002: Diagrama de despliegue de #sistema – situación propuesta.],
)

#table(
  columns: (1.2fr, 3fr),
  align: left,
  table.header(
    [*Elemento / campo*], [*Ficha técnica: Diagrama de Vista Física – situación propuesta*],
  ),
  [Código del diagrama], [D-FIS-002],
  [Requisitos no funcionales], [RNF-0001 (Disponibilidad), RNF-0002 (Rendimiento), RNF-0003 (Seguridad), RNF-0006 (Tiempo real), RNF-0007 (Eficiencia), RNF-0010 (Integridad)],
  [Contexto / módulo], [Vista Física de #sistema – situación propuesta],
  [Proceso representado], [Acceso de las terminales y dispositivos de cliente (Navegador Web y Tablet) a un Servidor de Aplicaciones contenedorizado en Docker, el cual interactúa con una base de datos PostgreSQL centralizada y servicios externos (AWS S3, WhatsApp Gateway y API Financiera)],
  [Versión], [1.1.0],
  [Autor], [AUT-0005],
  [Fecha], [26/10/2026],
  [Justificación], [Concreta en infraestructura los componentes de D-DP-001 y cumple los RNF aprobados.],
  [Estado], [Concluido],
  [Código de artefactos], [RNF-0001, RNF-0002, RNF-0003, RNF-0006, RNF-0007, RNF-0010, EDU-0027],
  [Comentarios], [Ninguno],
)