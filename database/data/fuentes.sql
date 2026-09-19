-- ============================================================
-- DATOS DE FUENTES
-- ============================================================


-- ============================================================
-- 1. CREAR IDENTIDADES DE FUENTES
-- ============================================================

INSERT INTO fuente (codigo)
VALUES
    ('FUE-0001'),
    ('FUE-0002'),
    ('FUE-0003'),
    ('FUE-0004'),
    ('FUE-0005'),
    ('FUE-0006')
ON CONFLICT (codigo) DO NOTHING;


-- ============================================================
-- 2. FUE-0001
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Recepcionista - Xiomara',
    'Michael Benjamin Suclle Suca',
    '2026-04-26',
    '2026-05-10',
    'AUT-0005',
    'Concluido',
    'Basado en la ENT-0004 - Recepcionista',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0001'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- 3. FUE-0002
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Coordinador - Arnold Huanqui Aguilar',
    'Michael Benjamin Suclle Suca',
    '2026-05-09',
    '2026-05-10',
    'AUT-0005',
    'Concluido',
    'Basado en la ENT-0003 - Coordinador',
    FALSE
FROM fuente
WHERE codigo = 'FUE-0002'
ON CONFLICT (fuente_id, version) DO NOTHING;


INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Coordinador de la sucursal - Arnold Huanqui Aguilar',
    'Michael Benjamin Suclle Suca',
    '2026-05-09',
    '2026-05-10',
    'AUT-0005',
    'Concluido',
    'Basado en la ENT-0003 - Coordinador de la sucursal',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0002'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- 4. FUE-0003
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Fisioterapeuta - Arnold Huanqui Aguilar',
    'Michael Benjamin Suclle Suca',
    '2026-04-29',
    '2026-05-10',
    'AUT-0008',
    'Concluido',
    'Basado en la ENT-0002 - Fisioterapeuta',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0003'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- 5. FUE-0004
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Desarrollo De Un Sistema Web Para La Gestión De Pacientes Y Automatización De Recordatorios De Citas Odontológicas',
    'Nayeli Melany Secaira Zambrano',
    '2024-12-04',
    '2026-05-10',
    'AUT-0001',
    'Concluido',
    'Es un documento muy interesante que muestra conocimiento en asuntos de nuestro interés, como la gestión de pacientes y gestión de seguimiento del paciente.',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0004'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- 6. FUE-0005
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Desarrollo De Un Sistema De Agendamiento De Citas Médicas En El Centro De Salud De Ayampe Con Tecnologías De Software Libre',
    'Parrales Pilligua Walter Hernán',
    '2025-06-05',
    '2026-05-10',
    'AUT-0001',
    'Concluido',
    'En el documento se muestra un tema de interés para el desarrollo del sistema, la forma en la que se gestionan las citas, nos da un ejemplo preciso de una forma de implementación que podríamos usar.',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0005'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- 7. FUE-0006
-- ============================================================

INSERT INTO fuente_version (
    fuente_id,
    version,
    nombre,
    autores,
    fecha_fuente,
    fecha_plantilla,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Implementación De Un Sistema Informático Para La Gestión Y Organización De Historial Clínico De Pacientes En La Clínica Nuestra Señora De Las Mercedes Del Cantón Pedro Carbo',
    'Pluas Cercado Daniela Fabiola',
    '2022-03-14',
    '2026-05-10',
    'AUT-0001',
    'Concluido',
    'En esta fuente se nos da un ejemplo de un sistema de organización de historial clínico, y podemos tomarlo de referencia para hacer el nuestro.',
    TRUE
FROM fuente
WHERE codigo = 'FUE-0006'
ON CONFLICT (fuente_id, version) DO NOTHING;


-- ============================================================
-- FIN DE FUENTES
-- ============================================================
