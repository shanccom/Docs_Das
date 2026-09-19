-- ============================================================
-- REQUERIMIENTOS NO FUNCIONALES (RNF)
-- Datos extraídos de las plantillas oficiales del proyecto
-- ============================================================


-- ============================================================
-- 1. FUENTES DE INFORMACIÓN
-- ============================================================

INSERT INTO fuente (codigo)
VALUES
    ('FUE-0001'),
    ('FUE-0002'),
    ('FUE-0003')
ON CONFLICT (codigo) DO NOTHING;


-- ============================================================
-- 2. AUTORES REFERENCIADOS EN RNF
-- ============================================================

INSERT INTO autor (codigo)
VALUES
    ('AUT-0002'),
    ('AUT-0007'),
    ('AUT-0009'),
    ('AUT-0010')
ON CONFLICT (codigo) DO NOTHING;


-- ============================================================
-- 3. IDENTIDADES DE ARTEFACTOS (RNF)
-- ============================================================

INSERT INTO artefacto (codigo, tipo)
VALUES
    ('RNF-0001', 'RNF'),
    ('RNF-0002', 'RNF'),
    ('RNF-0003', 'RNF'),
    ('RNF-0004', 'RNF'),
    ('RNF-0005', 'RNF'),
    ('RNF-0006', 'RNF'),
    ('RNF-0007', 'RNF'),
    ('RNF-0008', 'RNF'),
    ('RNF-0009', 'RNF'),
    ('RNF-0011', 'RNF'),
    ('RNF-0012', 'RNF'),
    ('RNF-0013', 'RNF'),
    ('RNF-0014', 'RNF'),
    ('RNF-0015', 'RNF')
ON CONFLICT (codigo) DO NOTHING;


-- ============================================================
-- 4. RNF-0001: Disponibilidad de documentos del paciente en la nube
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0001 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Disponibilidad de documentos del paciente en la nube',
    '2026-05-04',
    'Vital',
    'Concluido',
    'No es prioridad del centro que la consistencia de los datos, pero sí debe estar disponible siempre',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Disponibilidad',
    'El sistema debe permitir al coordinador de sucursal consultar de los documentos del paciente, los cuales son la  evaluación inicial, las constancias de atención, los registros clínicos y el consentimiento informado'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0001 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Disponibilidad de documentos del paciente en la nube',
    '2026-05-11',
    'Vital',
    'Concluido',
    'No es prioridad del centro que la consistencia de los datos, pero sí debe estar disponible siempre.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Disponibilidad',
    'El sistema de preferencia debe estar alojado en Amazon Web Services (AWS) para garantizar que el coordinador de sucursal pueda consultar los documentos del paciente (evaluación inicial, constancias de atención, registros clínicos y consentimiento informado) con un uptime del 99.9%.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.1' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0001 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Disponibilidad de documentos del paciente en la nube',
    '2026-05-27',
    'Vital',
    'Concluido',
    '**1. Amazon Web Services (AWS) - Amazon S3 (Standard Tier)**<br>S3 ofrece un **SLA** oficial de disponibilidad **99.9%** y una durabilidad del **99.99999999999%**. También facilita la integración usando instancias EC2 o funciones lambda. Es el servicio más maduro del mercado, con la mayor cantidad de certificaciones de cumplimiento y el ecosistema más grande de herramientas y partners.
- **Estimación de Precio: **
  - **Este de EE. UU. (Norte de Virginia):** \~$0.023 USD por GB al mes (primeros 50 TB). Las operaciones de lectura (GET) cuestan \~$0.0004 USD por cada 1,000 peticiones.
  - **América del Sur (Sao Paulo):** \~$0.0405 USD por GB al mes. Las operaciones de lectura (GET) cuestan \~$0.0007 USD por cada 1,000 peticiones.
- **URLs de referencia:**
  - **SLA:** [**aws.amazon.com/es/s3/sla/**](http://aws.amazon.com/es/s3/sla/)
  - **Precios:**[ ](https://aws.amazon.com/es/s3/pricing/)[**aws.amazon.com/es/s3/pricing/**](http://aws.amazon.com/es/s3/pricing/)
**2. Microsoft Azure - Azure Blob Storage (Hot Tier)**
Azure Blob Storage (**Hot Tier**) ofrece un **SLA** de disponibilidad **99.9%** y durabilidad de **99.999999999%**. Soporta redundancia LRS/ZRS y se integra fácilmente con Azure Functions, Logic Apps y otros servicios de la plataforma. Ideal si ya se usan herramientas de Microsoft en la organización.
- **Estimación de Precio:**
  - **Este de EE. UU.: \~$0.021 USD por GB al mes (primeros 50 TB). Las operaciones de lectura cuestan \~$0.005 USD por cada 10.000 peticiones.**
  - **Chile Central: \~	$0.0258 USD por GB al mes (primeros 50 TB). Las operaciones de lectura cuestan \~$0.0073 USD por cada 10.000 peticiones.**
- **URLs de referencia:**
  - **SLA:** [**azure.microsoft.com/support/legal/sla/storage/**](http://azure.microsoft.com/support/legal/sla/storage/)
  - **Precios:** [**azure.microsoft.com/en-us/pricing/details/storage/blobs/**](http://azure.microsoft.com/en-us/pricing/details/storage/blobs/)
**3. Google Cloud - Cloud Storage (Standard Class)**
Ofrece un **SLA** de disponibilidad **99.9%** (regional) / **99.95%** (multi-región) y durabilidad de **99.999999999%**. Suele tener mejor precio en almacenamiento y egress, excelente latencia y fuerte en analitica y ML si se necesitara a futuro.
- **Estimación de Precio:**
  - **Lowa (us-central1): \~0.02 USD por GB al mes. Operaciones de lectura \~0.0004 USD por 1.000 peticiones.**
  - **Santiago (southamerica-west1): \~0.03 USD por GB al mes. Operaciones de lectura \~0.0004 USD por 1.000 peticiones.**
- **URLs de referencia:**
  - **SLA:** [**cloud.google.com/storage/sla**](http://cloud.google.com/storage/sla)
  - **Precios:** [**cloud.google.com/storage/pricing**](http://cloud.google.com/storage/pricing)',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Disponibilidad',
    'El sistema de preferencia debe estar alojado en Amazon Web Services (AWS) para garantizar que el coordinador de sucursal pueda consultar los documentos del paciente (evaluación inicial, constancias de atención, registros clínicos y consentimiento informado) con un uptime del 99.9%.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0001' AND av.version = '1.0.2' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 5. RNF-0002: Búsqueda rápida de paciente por DNI
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0002 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Búsqueda rápida de paciente por DNI',
    '2026-05-10',
    'Vital',
    'Concluido',
    'Actualmente la recepcionista busca tarjetas físicas en un tarjetero, lo que le toma varios minutos.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia / Usabilidad',
    'El sistema debe permitir a la recepcionista buscar un paciente ingresando su DNI y mostrar los resultados en menos de 3 segundos. La información mostrada debe incluir: nombre completo, diagnóstico, número de sesión actual y total de sesiones del paquete.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0002 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Tiempo máximo de respuesta en búsqueda por DNI',
    '2026-05-11',
    'Vital',
    'Concluido',
    'Actualmente la recepcionista busca tarjetas físicas en un tarjetero, lo que le toma varios minutos.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Rendimiento / Usabilidad',
    'El tiempo de respuesta del sistema al buscar un paciente ingresando su DNI y mostrar sus resultados debe ser de menos de 3 segundos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0002 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Tiempo máximo de respuesta en búsqueda por DNI',
    '2026-05-27',
    'Vital',
    'Concluido',
    '**1. Amazon Web Services (AWS) - Amazon Aurora (PostgreSQL)**<br>RDS Aurora Serverless ofrece baja latencia y escalado automático. Ajusta su potencia durante el día para cumplir las búsquedas en milisegundos y reduce su capacidad al mínimo de madrugada, ahorrando costos frente a un servidor tradicional.
- **Estimación de Precio (Por ACU - Aurora Capacity Unit):**
  - **Este de EE. UU. (N. Virginia): \~$0.12 USD por ACU/hora.**
  - **América del Sur (São Paulo): \~$0.25 USD por ACU/hora.**
- **URLs de referencia:**
  - **Precios:** [**https://aws.amazon.com/es/rds/aurora/pricing/**](https://aws.amazon.com/es/rds/aurora/pricing/)
  - **SLA:** [**aws.amazon.com/rds/sla/**](http://aws.amazon.com/rds/sla/)
**2. Microsoft Azure - Azure SQL Database (General Purpose)**
Azure SQL Database ofrece muy buen rendimiento en consultas y latencia baja. Su modelo sin servidor cobra por los segundos de cómputo utilizados. Muy buena opción si la organización ya usa Microsoft 365 o Power Platform.
- **Estimación de Precio (Nivel General Purpose, Min 0.5 - Max 2 vCore):**
  - **Este de EE. UU. (East US): \~$0.000145 USD por vCore/segundo (Máximo \~$0.5218 USD/hora en uso pico).**
  - **Chile Central: \~$0.0002030 USD por vCore/segundo (Máximo \~$0.7305 USD/hora en uso pico).**
- **URLs de referencia:**
  - **Precios:** [**azure.microsoft.com/en-us/pricing/details/sql-database/**](http://azure.microsoft.com/en-us/pricing/details/sql-database/)
  - **SLA:** [**azure.microsoft.com/support/legal/sla/sql-database/**](http://azure.microsoft.com/support/legal/sla/sql-database/)
**3. Google Cloud - Cloud SQL (PostgreSQL) o AlloyDB**
Cloud SQL entrega excelente latencia en lecturas mediante instancias fijas de servidor. Google destaca en rendimiento-precio para cargas de trabajo constantes, y utiliza su propia red global de fibra óptica para respuestas rápidas.
- **Estimación de Precio (Configuración 2 vCPU y 8 GB RAM)**
  - **Lowa (us-central1): **
1 vCPU = \~$0.0413 / hora -> 2 vCPUs = $0.0826 / hora.  
1 GB RAM = \~$0.007 / hora -> 8 GB = $0.056 / hora.
Total: \~$0.1386 USD/hora
- **Santiago (southamerica-west1):**
1 vCPU = \~$0.0578 / hora -> 2 vCPUs = $0.1156 / hora.  
1 GB RAM = \~$0.0098 / hora -> 8 GB = $0.0784 / hora.
Total: \~$0.194 USD/hora
- **URLs de referencia:**
  - **Precios:** [**cloud.google.com/sql/pricing**](http://cloud.google.com/sql/pricing)
  - **SLA:** [**cloud.google.com/sql/sla**](http://cloud.google.com/sql/sla)
- **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El tiempo de respuesta del sistema al buscar un paciente ingresando su DNI y mostrar sus resultados debe ser de menos de 3 segundos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0002' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 6. RNF-0003: Tiempo límite de respuesta en consultas por DNI
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0003 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Tiempo límite de respuesta en consultas por DNI',
    '2026-05-10',
    'Vital',
    'Concluido',
    'La recepcionista mencionó que es importante que el paciente sea consciente de lo que firma para evitar problemas legales.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0003'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Seguridad',
    'El sistema debe permitir a la recepcionista registrar la asistencia del paciente con un solo clic y capturar la firma digital del paciente en menos de 10 segundos. La firma debe quedar asociada a la sesión y al paciente de forma inalterable.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0003 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Captura inalterable de firma en tiempo límite',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'La recepcionista mencionó que es importante que el paciente sea consciente de lo que firma para evitar problemas legales.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0003'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Seguridad / Rendimiento',
    'Por restricciones de diseño e interacción, el registro de la asistencia del paciente debe limitarse a un máximo de un solo clic, la captura de su firma digital debe completarse en un tiempo de menos de 10 segundos, y dicha firma debe almacenarse de forma inalterable por protocolos de seguridad.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0003 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Captura inalterable de firma en tiempo límite',
    '2026-05-17',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - Amazon S3 con Object Lock (Modo Compliance)**<br>La función Object Lock en S3 permite almacenar las firmas bajo un modelo WORM (escribir una vez, leer muchas). En el modo "Compliance", el archivo se vuelve inmutable y no puede ser borrado ni sobrescrito por nadie. Su alta velocidad de red asegura que el guardado tome milisegundos.
  - **Estimación de Precio** (La función Object Lock no tiene costo extra, se aplican tarifas de S3 y peticiones PUT):
    - **Este de EE. UU. (Norte de Virginia)**: \~$0.023 USD por GB/mes. Subir la firma (PUT) cuesta \~$0.005 USD por cada 1,000 peticiones.
    - **América del Sur (São Paulo)**: \~$0.0405 USD por GB/mes. Subir la firma (PUT) cuesta \~$0.007 USD por cada 1,000 peticiones.
  * **URLs de referencia:**
  - **Precios S3:** [**aws.amazon.com/es/s3/pricing/**](http://aws.amazon.com/es/s3/pricing/)
  - **Object Lock:** [**aws.amazon.com/es/s3/features/object-lock/**](http://aws.amazon.com/es/s3/features/object-lock/)
  **2. Microsoft Azure - Azure Blob Storage (Hot Tier) con Almacenamiento Inmutable**
  Permite establecer políticas de retención temporales que bloquean cualquier modificación o eliminación del blob (firma) durante el período legal establecido.
  - **Estimación de Precio** (La función inmutable es gratuita, se cobran tarifas de Blob y operaciones de escritura):
    - **Este de EE. UU. (East US):** \~$0.021 USD por GB/mes. Operaciones de escritura cuestan \~$0.065 USD por cada 10,000 peticiones.
    - **Chile Central:** \~$0.0258 USD por GB/mes. Operaciones de escritura cuestan \~$0.0.091 USD por cada 10,000 peticiones.
  - **URLs de referencia:**
    - **Precios Blob:** [**azure.microsoft.com/en-us/pricing/details/storage/blobs/**](http://azure.microsoft.com/en-us/pricing/details/storage/blobs/)
    - **Inmutabilidad:** [**learn.microsoft.com/es-es/azure/storage/blobs/immutable-storage-overview**](http://learn.microsoft.com/es-es/azure/storage/blobs/immutable-storage-overview)
  **3. Google Cloud - Cloud Storage (Standard Class) con Bucket Lock**
  Bucket Lock permite configurar políticas de retención para que los archivos no puedan ser eliminados ni modificados.
  - **Estimación de Precio** (Bucket Lock sin costo extra, aplican tarifas estándar y operaciones Clase A):
    - **Iowa (us-central1):** \~$0.02 USD por GB/mes. Operaciones de subida (Clase A) cuestan \~$0.05 USD por 10,000 peticiones.
    - **Santiago (southamerica-west1):** \~$0.03 USD por GB/mes. Operaciones de subida (Clase A) cuestan \~$0.05 USD por 10,000 peticiones.
  - **URLs de referencia:**
    - **Precios Cloud Storage:** [**cloud.google.com/storage/pricing**](http://cloud.google.com/storage/pricing)
    - **Bucket Lock:** [**cloud.google.com/storage/docs/bucket-lock**](http://cloud.google.com/storage/docs/bucket-lock)**UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0003'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'Por restricciones de diseño e interacción, el registro de la asistencia del paciente debe limitarse a un máximo de un solo clic, la captura de su firma digital debe completarse en un tiempo de menos de 10 segundos, y dicha firma debe almacenarse de forma inalterable por protocolos de seguridad.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0003' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 7. RNF-0004: Historial de sesiones del paciente en una sola vista
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0004 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Historial de sesiones del paciente en una sola vista',
    '2026-05-10',
    'Vital',
    'Concluido',
    'La recepcionista necesita revisar el historial cuando un paciente reclama sobre asistencias pasadas o cuando hay discrepancias.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0004'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'El sistema debe mostrar en una sola pantalla el historial completo de sesiones del paciente, incluyendo: fechas de cada sesión, asistencia (presente/ausente), monto pagado y número de sesión.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0004 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Visualización unificada del historial de sesiones',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'La recepcionista necesita revisar el historial cuando un paciente reclama sobre asistencias pasadas o cuando hay discrepancias.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0004'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Interfaz',
    'Para optimizar la interfaz, la visualización del historial completo de sesiones del paciente debe realizarse estrictamente en una sola pantalla, sin requerir navegación adicional por parte de la recepcionista.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0004 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Visualización unificada del historial de sesiones',
    '2026-05-27',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - AWS Amplify Hosting**<br>Amplify Hosting distribuye globalmente aplicaciones de una sola página (SPA). Al servir el código de la interfaz a través de la CDN de Amazon CloudFront, asegura que la vista unificada se renderice instantáneamente en la pantalla de la sucursal.
      - **Estimación de Precio:**
        - **Alojamiento: \~$0.023 USD por GB almacenado al mes (Gratuito hasta los 5 GB al mes). **
        - **Transferencia de datos: \~$0.15 USD por GB descargado. El tiempo de construcción automatizada cuesta \~$0.01 USD por minuto (Gratuito hasta los 15 GB al mes).**
      - **URLs de referencia:**
        - **Precios:** [**aws.amazon.com/amplify/pricing/**](http://aws.amazon.com/amplify/pricing/)
      **2. Microsoft Azure - Azure Static Web Apps**
      Servicio diseñado exclusivamente para aplicaciones web estáticas y arquitecturas de interfaz modernas. Garantiza una carga inmediata e incluye una integración nativa espectacular para lanzar despliegues y actualizaciones visuales directamente desde editores de código.
      - **Estimación de Precio:**
        - **Nivel Estándar (Producción): \~$9.00 USD por aplicación al mes. Incluye 100 GB de ancho de banda de forma predeterminada.**
        - **Exceso de ancho de banda: \~$0.20 USD por cada GB adicional.**
      - **URLs de referencia:**
        - **Precios:** [**azure.microsoft.com/en-us/pricing/details/app-service/static/**](http://azure.microsoft.com/en-us/pricing/details/app-service/static/)
      **3. Google Cloud - Firebase Hosting**
      Firebase Hosting ofrece alojamiento rápido y seguro utilizando discos SSD en la red perimetral de Google. Es el estándar de la industria para desplegar interfaces multiplataforma de forma veloz.
      - **Estimación de Precio:**
        - **Alojamiento: \~$0.10 USD por GB almacenado al mes (Gratuito hasta los 5 GB).**
        - **Transferencia de datos: \~$0.15 USD por GB descargado (Gratuito hasta 10 GB al mes).**
      - **URLs de referencia:**
        - **Precios:** [**firebase.google.com/pricing**](http://firebase.google.com/pricing)
        - **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0004'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'Para optimizar la interfaz, la visualización del historial completo de sesiones del paciente debe realizarse estrictamente en una sola pantalla, sin requerir navegación adicional por parte de la recepcionista.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0004' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 8. RNF-0005: Transferencia de paciente entre sedes con historial completo
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0005 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Transferencia de paciente entre sedes con historial completo',
    '2026-05-10',
    'Vital',
    'Concluido',
    'Actualmente se comunican por WhatsApp o llamadas, lo que genera pérdida de información y trabajo adicional.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Disponibilidad / Integridad',
    'El sistema debe permitir transferir un paciente de una sede a otra conservando todo su historial: datos personales, diagnóstico, número de sesiones realizadas, dinero pagado y evolución clínica. La recepcionista de la sede destino debe poder ver la información completa del paciente al instante.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0005 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Sincronización instantánea de historiales entre sedes',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'Actualmente se comunican por WhatsApp o llamadas, lo que genera pérdida de información y trabajo adicional.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Interoperabilidad / Rendimiento',
    'Para garantizar una alta interoperabilidad de datos, la transferencia del historial de un paciente de una sede a otra debe reflejarse en la sede destino al instante, conservando la integridad de toda la información.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0005 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Sincronización instantánea de historiales entre sedes',
    '2026-05-27',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - Amazon API Gateway (WebSocket APIs)**<br>Para lograr la actualización instantánea sin recargar la pantalla, API Gateway permite mantener una conexión bidireccional (WebSocket) abierta entre las tablets de las diferentes sedes y el servidor.
          - **Estimación de Precio (Pago por uso):**
            - **Este de EE. UU. (N. Virginia): \~$0.8 USD por cada millón de mensajes (\~$1.00 USD el primer millón de mensajes). \~$0.25 USD por cada millón de minutos de conexión.**
            - **América del Sur (São Paulo): \~$1.35 USD por cada millón de mensajes (\~$1.35 USD el primer millón de mensajes). \~$0.388 USD por cada millón de minutos de conexión.**
          - **URLs de referencia:**
            - **Precios:** [**aws.amazon.com/es/api-gateway/pricing/**](http://aws.amazon.com/es/api-gateway/pricing/)
          **2. Microsoft Azure - Azure SignalR Service**
          Es el estándar corporativo de Microsoft para agregar funcionalidad web en tiempo real. SignalR se encarga de gestionar miles de conexiones simultáneas y transmitir actualizaciones en milisegundos.
          - **Estimación de Precio:**
            - **Nivel Free: Gratuito (Limitado a 20 conexiones concurrentes y 20,000 mensajes diarios, ideal para pruebas).**
            - **Nivel Serverless (Pago por uso): \~$1.00 USD por cada millón de mensajes en la región Este de EE. UU.**
          - **URLs de referencia:**
            - **Precios:** [**azure.microsoft.com/es-es/pricing/details/signalr-service/**](http://azure.microsoft.com/es-es/pricing/details/signalr-service/)
          **3. Google Cloud - Cloud Firestore (Realtime Listeners)**
          Firestore destaca en el mercado por su capacidad nativa de sincronización en tiempo real. En lugar de requerir configuraciones complejas, los clientes se suscriben a los documentos; si la sede A modifica un historial, Firestore actualiza automáticamente la interfaz en la sede B.
          - **Estimación de Precio (Edición Estándar):**
            - **Lecturas y Escrituras: No tiene costo hasta las 50,000 lecturas diarias y 20,000 escrituras diarias. Pasado el límite, aplican las tarifas de Google Cloud.**
            - **Almacenamiento y Red: No tiene costo hasta 1 GB total de datos almacenados y 10 GB de transferencia de red al mes.**
          - **URLs de referencia:**
            - **Precios:** [**firebase.google.com/docs/firestore/pricing**](http://firebase.google.com/docs/firestore/pricing)**UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Interoperabilidad',
    'Para garantizar una alta interoperabilidad de datos, la transferencia del historial de un paciente de una sede a otra debe reflejarse en la sede destino al instante, conservando la integridad de toda la información.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0005' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 9. RNF-0006: Visualización de camillas disponibles en tiempo real
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0006 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Visualización de camillas disponibles en tiempo real',
    '2026-05-10',
    'Media',
    'Concluido',
    'La recepcionista se mueve constantemente entre recepción y las camillas para ver disponibilidad. Una vista en tiempo real le ahorraría tiempo y esfuerzo físico.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Eficiencia',
    'El sistema debe mostrar en la pantalla de la recepcionista un mapa o lista actualizada en tiempo real de las camillas disponibles en la sede, indicando cuáles están ocupadas y cuánto tiempo resta de terapia (estimado).'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0006 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Actualización concurrente del estado de camillas',
    '2026-05-11',
    'Media',
    'Concluido',
    'La recepcionista se mueve constantemente entre recepción y las camillas para ver disponibilidad. Una vista en tiempo real le ahorraría tiempo y esfuerzo físico.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Concurrencia / Interfaz',
    'La actualización del mapa o lista que indica la disponibilidad de las camillas y su tiempo estimado debe ejecutarse de forma concurrente y en tiempo real.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0006 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Actualización concurrente del estado de camillas',
    '2026-05-17',
    'Media',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - AWS AppSync**<br>AppSync es un servicio GraphQL administrado que facilita la creación de aplicaciones en tiempo real. Incluye detección y resolución de conflictos nativa en la nube. AppSync gestiona la concurrencia de forma segura, brindando disponibilidad en milisegundos.
              - **Estimación de Precio (Pago por uso):**
                - **Operaciones de modificación: \~$4.00 USD por cada millón de operaciones de modificación. **
                - **Mensajes en tiempo real: \~$2.00 USD por millón.**
              - **URLs de referencia:**
                - **Precios:** [**aws.amazon.com/es/appsync/pricing/**](http://aws.amazon.com/es/appsync/pricing/)
              **2. Microsoft Azure - Azure Cosmos DB**
              Cosmos DB es una base de datos global ultrarrápida. Para manejar la concurrencia, utiliza "Optimistic Concurrency Control" mediante ETags.
              - **Estimación de Precio (Modelo Serverless):**
                - **Este de EE. UU. (East US): \~$0.25 USD por cada millón de Unidades de Solicitud (RU).**
                - **Centro de Chile: \~$0.35 USD por cada millón de Unidades de Solicitud (RU).**
              - **URLs de referencia:**
                - **Precios:** [**azure.microsoft.com/es-es/pricing/details/cosmos-db/serverless/**](http://azure.microsoft.com/es-es/pricing/details/cosmos-db/serverless/)
              **3. Google Cloud - Cloud Firestore (Transacciones)**
              Firestore no solo sincroniza datos, sino que maneja la concurrencia de manera impecable mediante "Operaciones Atómicas y Transacciones".
              - **Estimación de Precio (Edición Estándar, basado en cuotas oficiales):**
                - **Nivel Gratuito: Sin costo hasta las 20,000 escrituras (actualizaciones de camilla) y 50,000 lecturas diarias, cubriendo fácilmente el volumen de una clínica estándar.**
                - **Exceso (lowa - us-central1): \~$0.09 USD por cada 100,000 escrituras adicionales.**
                - **Exceso (santiago - southamerica-west1): \~$0.129 USD por cada 100,000 escrituras adicionales.**
              - **URLs de referencia:**
                - **Precios:** [**https://cloud.google.com/firestore/pricing?hl=es-419#tg0-t1UNIVERSIDAD**](https://cloud.google.com/firestore/pricing?hl=es-419#tg0-t1UNIVERSIDAD) **NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Concurrencia',
    'La actualización del mapa o lista que indica la disponibilidad de las camillas y su tiempo estimado debe ejecutarse de forma concurrente y en tiempo real.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0006' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 10. RNF-0007: Generación automática de constancia de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0007 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Generación automática de constancia de asistencia',
    '2026-05-10',
    'Vital',
    'Concluido',
    'Actualmente la recepcionista demora de 10 a 20 minutos (hasta 1 hora en horas pico) porque debe buscar tarjetas y usar plantilla manual.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0007'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El sistema debe permitir generar una constancia de asistencia con solo seleccionar al paciente y un rango de fechas. La constancia debe generarse en formato PDF en menos de 5 segundos, incluyendo: nombre del paciente, diagnóstico, fechas de sesiones realizadas y número de sesión actual.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0007 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Límite de tiempo en la generación de constancias',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'Actualmente la recepcionista demora de 10 a 20 minutos (hasta 1 hora en horas pico) porque debe buscar tarjetas y usar plantilla manual.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0007'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Rendimiento',
    'El tiempo de procesamiento para generar la constancia de asistencia en formato PDF no debe exceder los 5 segundos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0007 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Límite de tiempo en la generación de constancias',
    '2026-05-27',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - AWS Lambda**<br>Lambda ejecuta código en respuesta a eventos sin administrar servidores. Escala automáticamente.
                  - **Estimación de Precio (Arquitectura x86):**
                    - **Este de EE. UU. (N. Virginia): \~$0.20 USD por cada 1 millón de peticiones. El tiempo de cómputo cuesta \~$0.0000166667 USD por cada GB-segundo utilizado.**
                    - **América del Sur (São Paulo): \~$0.20 USD por cada 1 millón de peticiones. El tiempo de cómputo cuesta \~$0.0000166667 USD por GB-segundo.**
                  - **URLs de referencia:**
                    - **Precios:** [**aws.amazon.com/es/lambda/pricing/**](http://aws.amazon.com/es/lambda/pricing/)
                    - **SLA:** [**aws.amazon.com/es/lambda/sla/**](http://aws.amazon.com/es/lambda/sla/)
                  **2. Microsoft Azure - Azure Functions (Plan de Consumo)**
                  Azure Functions ofrece una arquitectura controlada por eventos ideal para cargas de trabajo breves. Su "Plan de Consumo" es brutalmente económico porque solo cobra por los milisegundos exactos que tarda el procesador en funcionar.
                  - **Estimación de Precio (Plan de Consumo):**
                    - **Este de EE. UU. (East US): \~$0.40 USD por cada 1 millón de ejecuciones. El cómputo cuesta \~$0.000026 USD por GB-segundo. (Incluye una cuota mensual gratuita de 250,000 peticiones y 100,000 GB-segundos).**
                  - **URLs de referencia:**
                    - **Precios:** [**azure.microsoft.com/es-es/pricing/details/functions/**](http://azure.microsoft.com/es-es/pricing/details/functions/)
                    - **SLA:** [**azure.microsoft.com/es-es/support/legal/sla/functions/**](http://azure.microsoft.com/es-es/support/legal/sla/functions/)
                  **3. Google Cloud - Cloud Run**
                  Si se decide usar librerías complejas empaquetadas en un contenedor (Docker), Cloud Run es el rey del mercado. Arranca el contenedor instantáneamente, genera la constancia en milisegundos y lo apaga.
                  - **Estimación de Precio (Pago por uso - Tier 1):**
                    - **Iowa (us-central1): \~$0.40 USD por cada millón de peticiones. **
                      - **Cómputo: \~$0.000024 USD por vCPU-segundo. (Incluye 2 millones de peticiones gratuitas al mes).**
                    - **Santiago (southamerica-west1): \~$0.40 USD por cada millón de peticiones. **
                      - **Cómputo: \~$0.0000336 USD por vCPU-segundo. (Incluye 2 millones de peticiones gratuitas al mes).**
                  - **URLs de referencia:**
                    - **Precios:** [**cloud.google.com/run/pricing**](http://cloud.google.com/run/pricing)
                    - **SLA:** [**cloud.google.com/run/sla**](http://cloud.google.com/run/sla)
            - **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0007'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El tiempo de procesamiento para generar la constancia de asistencia en formato PDF no debe exceder los 5 segundos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0007' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 11. RNF-0008: Navegación limitada a 2 clics en alta demanda
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0008 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Navegación limitada a 2 clics en alta demanda',
    '2026-05-10',
    'Vital',
    'Concluido',
    'La recepcionista atiende múltiples frentes simultáneamente. Una interfaz optimizada reduciría su carga cognitiva y errores.<br><br>Azure – Azure Front Door<br>Optimiza la entrega de la aplicación y mejora los tiempos de navegación. Funciona sobre la infraestructura propuesta en RNF-0004.<br><br>Google Cloud – Cloud CDN + Firebase Hosting<br>Acelera la carga de la interfaz reutilizando el servicio de Firebase Hosting definido en RNF-0004, sin modificar la arquitectura existente.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0008'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Rendimiento',
    'La interfaz de recepción debe soportar momentos de alta demanda (hasta 65 pacientes por día) garantizando que las acciones más frecuentes estén accesibles con un máximo de 2 clics desde la pantalla principal.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0008 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Límite de navegación por clics en alta demanda',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'La recepcionista atiende múltiples frentes simultáneamente. Una interfaz optimizada reduciría su carga cognitiva y errores.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0008'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Interfaz',
    'La interfaz de recepción debe estar diseñada para ser utilizada en momentos de alta demanda (hasta 65 pacientes por día). Las acciones más frecuentes (buscar paciente, registrar asistencia, generar constancia) deben estar accesibles con un máximo de 2 clics desde la pantalla principal.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0008 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Límite de navegación por clics en alta demanda',
    '2026-05-17',
    'Vital',
    'Pendiente',
    'La recepcionista atiende múltiples frentes simultáneamente. Una interfaz optimizada reduciría su carga cognitiva y errores.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0008'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Rendimiento',
    'La interfaz de recepción debe estar diseñada para ser utilizada en momentos de alta demanda (hasta 65 pacientes por día). Las acciones más frecuentes (buscar paciente, registrar asistencia, generar constancia) deben estar accesibles con un máximo de 2 clics desde la pantalla principal.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0008 v1.0.3
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.3',
    'Límite de navegación por clics en alta demanda',
    '2026-07-20',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - Amazon ECS (Elastic Container Service) con AWS Fargate**<br>ECS sobre Fargate ejecuta contenedores de forma serverless y segura. Escala automáticamente ante ráfagas concurrentes de tráfico en recepción, asegurando que las llamadas críticas del flujo de 2 clics (búsqueda, asistencia y constancias) se resuelvan en milisegundos sin congelar la interfaz del usuario. Ofrece un SLA de 99.99%
              - **Estimación de Precio (Configuración base 0.25 vCPU y 0.5 GB RAM):**
                - **Este de EE. UU. (N. Virginia): \~ 0.004445 USD por GB/hora (total aprox. \~ 0.04048 USD por vCPU/hora y \~ 12.60 USD/mes)**
              - **URLs de referencia:**
                - **Precios:** [**aws.amazon.com/es/fargate/pricing/**](http://aws.amazon.com/es/fargate/pricing/)
                - **SLA:** [**aws.amazon.com/es/ecs/sla/**](http://aws.amazon.com/es/ecs/sla/)
              **2. Microsoft Azure - Azure App Service (Plan Linux Basic B1) **
              Azure App Service hospeda la API del backend de forma totalmente administrada (PaaS). Proporciona balanceo de carga integrado y auto-escalamiento inmediato para mitigar ráfagas de consultas simultáneas de la clínica en recepción, manteniendo las operaciones del flujo ágiles y responsivas. Ofrece un SLA de 99.95%
              - **Estimación de Precio (Plan Basic B1 - 1 vCPU, 1.75 GB RAM):**
                - **Este de EE. UU. (East US): \~ $12.41 USD/mes.**
                - **Chile Central: \~ $17.374 USD/mes.**
              - **URLs de referencia:**
                - **Precios: ** [**azure.microsoft.com/en-us/pricing/details/app-service/**](http://azure.microsoft.com/en-us/pricing/details/app-service/)
                - **SLA:** [**azure.microsoft.com/support/legal/sla/app-service/**](http://azure.microsoft.com/support/legal/sla/app-service/)**UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0008'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Rendimiento',
    'La interfaz de recepción debe estar diseñada para ser utilizada en momentos de alta demanda (hasta 65 pacientes por día). Las acciones más frecuentes (buscar paciente, registrar asistencia, generar constancia) deben estar accesibles con un máximo de 2 clics desde la pantalla principal.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0008' AND av.version = '1.0.3' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 12. RNF-0009: Confirmación de registro de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0009 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Confirmación de registro de asistencia',
    '2026-05-10',
    'Media',
    'Pendiente',
    'Ayudaría a evitar errores como registrar asistencia en el paciente equivocado o en fecha incorrecta.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Exactitud',
    'El sistema debe mostrar una confirmación antes de guardar el registro de asistencia, mostrando un resumen de lo que se va a guardar (ej. "¿Registrar asistencia para el paciente Juan Pérez el día 10/05/2026?").'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0009 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Doble validación en confirmación de registro',
    '2026-05-11',
    'Media',
    'Concluido',
    'Ayudaría a evitar errores como registrar asistencia en el paciente equivocado o en fecha incorrecta.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Seguridad',
    'Como mecanismo de usabilidad y prevención de errores, el sistema debe imponer obligatoriamente un paso de confirmación visual previa antes de concretar el guardado de cualquier registro de asistencia.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0009 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Doble validación en confirmación de registro',
    '2026-05-17',
    'Media',
    'Concluido',
    'Ayudaría a evitar errores como registrar asistencia en el paciente equivocado o en fecha incorrecta.<br><br>AWS – Amazon Cognito<br>Permite validar la identidad del usuario antes de confirmar operaciones críticas, complementando la seguridad del sistema.<br><br>Azure / Google Cloud – Entra ID o Firebase Authentication<br>Añaden autenticación y control de identidad cuando el proceso requiera una segunda validación.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Seguridad',
    'Como mecanismo de usabilidad y prevención de errores, el sistema debe imponer obligatoriamente un paso de confirmación visual previa antes de concretar el guardado de cualquier registro de asistencia.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0009 v1.0.3
-- (Nota: En la plantilla original figuraba como v1.0.2,
--  pero se registra como v1.0.3 para garantizar la unicidad de versión cronológica).
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.3',
    'Doble validación en confirmación de registro',
    '2026-07-20',
    'Media',
    'Concluido',
    '**1. Amazon Web Services (AWS) - Amazon Cognito**<br>Cognito User Pools asegura la sesión mediante tokens JWT firmados. Cognito permite implementar re-verificaciones de sesión (Step-Up Authentication) o segundos factores de autenticación (MFA) si el proceso lo requiere, reduciendo el riesgo de alteración de registros. Ofrece un SLA de 99.9%.
                  - **Estimación de Precio (User Pools con plan Essentials):**
                    - **Este de EE. UU. (Norte de Virginia): Capa gratuita permanente de hasta 10,000 MAUs (Monthly Active Users) al mes. El costo mensual neto es de \~ 0.015 USD por MAU adicional).**
                    - **América del Sur (São Paulo): Capa gratuita permanente de hasta 10,000 MAUs al mes. El costo mensual neto es de \~ 0.015 USD por MAU adicional).**
                  - **URLs de referencia:**
                    - **Precios:** [**aws.amazon.com/es/cognito/pricing/**](http://aws.amazon.com/es/cognito/pricing/)
                    - **SLA:** [**aws.amazon.com/es/cognito/sla/**](http://aws.amazon.com/es/cognito/sla/)
                  **2. Microsoft Azure - Microsoft Entra External ID**
                  Entra External ID administra la autenticación segura y el flujo de autorización de tokens OIDC. Es ideal si se configuran directivas de Acceso Condicional, puesto que el sistema puede detectar riesgos en la conexión y solicitar un PIN de re-autenticación inmediato antes de consolidar cambios. Ofrece un SLA de 99.99%.
                  - **Estimación de Precio:**
                    - **Este de EE. UU. (East US): Capa gratuita permanente de hasta 50,000 MAUs al mes. El costo mensual neto para la clínica es de  \~0.030 USD por MAU adicional).**
                    - **Chile Central: Capa gratuita permanente de hasta 50,000 MAUs al mes. El costo mensual neto para la clínica es de  \~0.030 USD por MAU adicional).**
                  - **URLs de referencia:**
                    - **Precios: ** [**azure.microsoft.com/es-es/pricing/details/microsoft-entra-external-id/**](http://azure.microsoft.com/es-es/pricing/details/microsoft-entra-external-id/)
                    - **SLA:** [**azure.microsoft.com/support/legal/sla/active-directory/**](http://azure.microsoft.com/support/legal/sla/active-directory/)
        - **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Seguridad',
    'Como mecanismo de usabilidad y prevención de errores, el sistema debe imponer obligatoriamente un paso de confirmación visual previa antes de concretar el guardado de cualquier registro de asistencia.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0009' AND av.version = '1.0.3' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 13. RNF-0011: Pantalla de resumen de paciente al inicio de la atención
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0011 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Pantalla de resumen de paciente al inicio de la atención',
    '2026-05-10',
    'Vital',
    'Concluido',
    'La recepcionista necesita toda esa información rápidamente para saber en qué punto del tratamiento va el paciente.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'Al seleccionar a un paciente, el sistema debe mostrar una pantalla de resumen que incluya: nombre, DNI, edad, diagnóstico, número de sesión actual, total de sesiones, y una alerta si el paciente está próximo a vencer su paquete según política de abandono.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0011 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Consolidación de datos en la vista resumen',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'La recepcionista necesita toda esa información rápidamente para saber en qué punto del tratamiento va el paciente.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad / Interfaz',
    'Para optimizar la toma de decisiones y reducir la carga cognitiva de navegación, la información crítica del paciente y sus alertas de abandono deben consolidarse estructuralmente en la pantalla de resumen al seleccionar al paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.1' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0011 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Consolidación de datos en la vista resumen',
    '2026-05-17',
    'Vital',
    'Pendiente',
    'La recepcionista necesita toda esa información rápidamente para saber en qué punto del tratamiento va el paciente.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'Para optimizar la toma de decisiones y reducir la carga cognitiva de navegación, la información crítica del paciente y sus alertas de abandono deben consolidarse estructuralmente en la pantalla de resumen al seleccionar al paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.2' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0011 v1.0.3
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.3',
    'Consolidación de datos en la vista resumen',
    '2026-07-20',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - AWS AppSync **<br>AppSync unifica múltiples fuentes de datos (DynamoDB, RDS, Lambdas) bajo un solo esquema GraphQL. Esto permite obtener información en una única consulta de red de ida y vuelta (roundtrip), eliminando llamadas múltiples desde la SPA y acelerando la carga de la pantalla. Ofrece un SLA de 99.95%.
          - **Estimación de Precio (User Pools con plan Essentials):**
            - **Este de EE. UU. (Norte de Virginia): \~ 4.00 USD por cada millón de operaciones de consulta o mutación.**
          - **URLs de referencia:**
            - **Precios: ** [**aws.amazon.com/es/appsync/pricing/**](http://aws.amazon.com/es/appsync/pricing/)
            - **SLA:** [**aws.amazon.com/es/legal/service-level-agreements/**](http://aws.amazon.com/es/legal/service-level-agreements/)
          **2. Microsoft Azure - Azure API Management (Consumption Tier)**
          Permite implementar una interfaz GraphQL sintética que expone un esquema único de consulta. API Management actúa como agregador de consultas hacia distintos microservicios o funciones backend de Azure en paralelo, devolviendo un payload JSON consolidado con el resumen y las alertas directamente a la interfaz. Ofrece un SLA de 99.95%.
          - **Estimación de Precio:**
            - **Este de EE. UU. (East US): \~ 3.00 USD por cada millón de llamadas (primer millón de llamadas gratis al mes)**
          - **URLs de referencia:**
            - **Precios: ** [**azure.microsoft.com/es-es/pricing/details/api-management/**](http://azure.microsoft.com/es-es/pricing/details/api-management/)
            - **SLA:** [**azure.microsoft.com/support/legal/sla/api-management/**](http://azure.microsoft.com/support/legal/sla/api-management/)
        - **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'Para optimizar la toma de decisiones y reducir la carga cognitiva de navegación, la información crítica del paciente y sus alertas de abandono deben consolidarse estructuralmente en la pantalla de resumen al seleccionar al paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0011' AND av.version = '1.0.3' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 14. RNF-0012: Acceso rápido a diagnóstico y etapa del paciente
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0012 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Acceso rápido a diagnóstico y etapa del paciente',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'El coordinador asigna pacientes a técnicos según su experiencia; esta información condiciona qué técnico atiende cada caso.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Rendimiento',
    'El sistema debe mostrar el diagnóstico médico, la fase del tratamiento (aguda, subaguda o crónica) y el número acumulado de sesiones de forma inmediata al realizar la consulta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.0' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0012 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Acceso rápido a diagnóstico y etapa del paciente',
    '2026-05-17',
    'Vital',
    'Pendiente',
    'El coordinador asigna pacientes a técnicos según su experiencia; esta información condiciona qué técnico atiende cada caso.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El sistema debe mostrar el diagnóstico médico, la fase del tratamiento (aguda, subaguda o crónica) y el número acumulado de sesiones de forma inmediata al realizar la consulta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.1' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0012 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.2',
    'Acceso rápido a diagnóstico y etapa del paciente',
    '2026-06-28',
    'Vital',
    'Pendiente',
    'El coordinador asigna pacientes a técnicos según su experiencia; esta información condiciona qué técnico atiende cada caso.<br><br>AWS – ElastiCache (Redis)<br>Puede almacenar temporalmente consultas frecuentes para complementar el rendimiento del RNF-0002.<br><br>Azure – Azure Cache for Redis<br>Reduce el tiempo de respuesta reutilizando la base de datos propuesta en RNF-0002.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El sistema debe mostrar el diagnóstico médico, la fase del tratamiento (aguda, subaguda o crónica) y el número acumulado de sesiones de forma inmediata al realizar la consulta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.2' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0012 v1.0.3
-- (Nota: En la plantilla original figuraba como v1.0.2,
--  pero se registra como v1.0.3 para garantizar la unicidad de versión cronológica).
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.3',
    'Acceso rápido a diagnóstico y etapa del paciente',
    '2026-07-20',
    'Vital',
    'Pendiente',
    '**1. Amazon Web Services (AWS) - Amazon ElastiCache (Redis OSS)**<br>ElastiCache almacena en memoria RAM el diagnóstico, la fase del tratamiento y el contador de sesiones asociados al ID del paciente[1]. Esto permite que la API sirva estos datos de manera inmediata (sub-milisegundo) mediante una operación GET de clave-valor, reduciendo la carga de consultas de lectura en la base de datos del RNF-0002. Ofrece un SLA de 99.9%
          - **Estimación de Precio (Nodo cache.t4g.micro con 0.5 GB de RAM):**
            - **Este de EE. UU. (Norte de Virginia): \~ 0.016 USD por hora**
            - **América del Sur (São Paulo): \~ 0.03 USD por hora**
          - **URLs de referencia:**
            - **Precios: ** [**aws.amazon.com/es/elasticache/pricing/**](http://aws.amazon.com/es/elasticache/pricing/)
            - **SLA:** [**aws.amazon.com/es/elasticache/sla/**](http://aws.amazon.com/es/elasticache/sla/)
        - **UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Eficiencia',
    'El sistema debe mostrar el diagnóstico médico, la fase del tratamiento (aguda, subaguda o crónica) y el número acumulado de sesiones de forma inmediata al realizar la consulta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0012' AND av.version = '1.0.3' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 15. RNF-0013: Visualización de evolución del paciente
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0013 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Visualización de evolución del paciente',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'Los técnicos preguntan al paciente cómo evolucionó; el sistema debe apoyar esa consulta con datos objetivos, sin depender solo de la memoria.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0013'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'La interfaz debe presentar de forma condensada y visualmente destacada la evolución reciente del paciente, incluyendo cambios en el dolor, mejoría funcional y cualquier queja reportada, sin requerir navegación entre múltiples pantallas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.0' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0013 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Visualización de evolución del paciente',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'Los técnicos preguntan al paciente cómo evolucionó; el sistema debe apoyar esa consulta con datos objetivos, sin depender solo de la memoria.<br><br>Arquitectura Dashboard (SPA)<br>Permite presentar indicadores y evolución del paciente en una única pantalla, reutilizando el RNF-0004.<br><br>AWS – Amazon QuickSight Embedded<br>Facilita la visualización gráfica de indicadores clínicos.<br>**UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0013'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Usabilidad',
    'La interfaz debe presentar de forma condensada y visualmente destacada la evolución reciente del paciente, incluyendo cambios en el dolor, mejoría funcional y cualquier queja reportada, sin requerir navegación entre múltiples pantallas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0013' AND av.version = '1.0.1' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 16. RNF-0014: Registro rápido de mini evaluación diaria
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0014 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Registro rápido de mini evaluación diaria',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'El coordinador mencionó que en horas saturadas se omiten registros; esto busca evitar esa omisión.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0014'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Operatividad',
    'El sistema debe permitir al técnico registrar la evaluación diaria del paciente (nivel de dolor, respuesta al tratamiento, incidencias) de manera ágil y con pocos pasos, incluso durante los picos de mayor afluencia de pacientes.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.0' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0014 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Registro rápido de mini evaluación diaria',
    '2026-06-28',
    'Vital',
    'Pendiente',
    'El coordinador mencionó que en horas saturadas se omiten registros; esto busca evitar esa omisión.<br><br>AWS – AppSync<br>Gestiona operaciones concurrentes entre varios técnicos.<br>Azure – SignalR Service<br>Actualiza automáticamente la información sin recargar la interfaz.<br>**UNIVERSIDAD NACIONAL DE SAN AGUSTIN**',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0014'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Operatividad',
    'El sistema debe permitir al técnico registrar la evaluación diaria del paciente (nivel de dolor, respuesta al tratamiento, incidencias) de manera ágil y con pocos pasos, incluso durante los picos de mayor afluencia de pacientes.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0014' AND av.version = '1.0.1' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- 17. RNF-0015: Trazabilidad de quién registró cada evolución
-- ============================================================

-- ------------------------------------------------------------
-- RNF-0015 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Trazabilidad de quién registró cada evolución',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'El coordinador supervisa el trabajo de los técnicos y necesita identificar quién registró cada dato para garantizar la calidad del registro clínico.',
    FALSE
FROM artefacto
WHERE codigo = 'RNF-0015'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Seguridad',
    'Todo ingreso o modificación de datos clínicos (evolución, incidencia, cambio de estado) debe quedar automáticamente asociado al usuario que realizó la acción, registrando su rol (técnico o licenciado) y la fecha y hora exacta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.0' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- RNF-0015 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id,
    version,
    nombre,
    fecha,
    importancia,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Trazabilidad de quién registró cada evolución',
    '2026-06-28',
    'Vital',
    'Pendiente',
    'El coordinador supervisa el trabajo de los técnicos y necesita identificar quién registró cada dato para garantizar la calidad del registro clínico.<br><br>Arquitectura basada en Auditoría (Audit Logging)<br>Cada operación queda registrada automáticamente utilizando la base de datos del RNF-0002.',
    TRUE
FROM artefacto
WHERE codigo = 'RNF-0015'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO rnf_version (
    artefacto_version_id,
    atributo_calidad,
    descripcion
)
SELECT
    av.id,
    'Seguridad',
    'Todo ingreso o modificación de datos clínicos (evolución, incidencia, cambio de estado) debe quedar automáticamente asociado al usuario que realizó la acción, registrando su rol (técnico o licenciado) y la fecha y hora exacta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id,
    autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id,
    fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'RNF-0015' AND av.version = '1.0.1' AND f.codigo = 'FUE-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ============================================================
-- FIN DE REQUERIMIENTOS NO FUNCIONALES
-- ============================================================
