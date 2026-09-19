
-- ============================================================
-- DATOS DE AUTORES
-- ============================================================


-- ============================================================
-- 1. CREAR IDENTIDADES DE AUTORES
-- ============================================================
-- AUT-0005 corresponde al "Autor de la plantilla" referenciado
-- en las plantillas de actores, expertos, fuentes y educciones.
-- ============================================================

INSERT INTO autor (codigo)
VALUES
    ('AUT-0001'),
    ('AUT-0002'),
    ('AUT-0003'),
    ('AUT-0004'),
    ('AUT-0005'),
    ('AUT-0006'),
    ('AUT-0007'),
    ('AUT-0008'),
    ('AUT-0009'),
    ('AUT-0010')
ON CONFLICT (codigo) DO NOTHING;


-- ============================================================
-- 2. AUT-0001
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Mathias Alonso Barrios Medina',
    'Mathias',
    '2026-04-19',
    'Gestor de versionamiento',
    'ORG-0001',
    'AUT-0001',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0001'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 3. AUT-0002
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Yordano Hernan Boza Portilla',
    NULL,
    '2026-04-19',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0002',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0002'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Yordano Hernan Boza Portilla',
    'Yordano',
    '2026-05-20',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0002'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 4. AUT-0003
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Eduardo Joel Cuno Salazar',
    NULL,
    '2026-04-19',
    'Ingeniero de Calidad / QA Specialist',
    'ORG-0001',
    'AUT-0003',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0003'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Eduardo Joel Cuno Salazar',
    'Eduardo',
    '2026-05-20',
    'Ingeniero de Calidad / QA Specialist',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0003'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 5. AUT-0004
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Sergio Danilo Hancco Mullisaca',
    NULL,
    '2026-04-20',
    'Project Manager / Arquitecto de Software',
    'ORG-0001',
    'AUT-0004',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0004'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Sergio Danilo Hancco Mullisaca',
    'Sergio',
    '2026-05-20',
    'Project Manager / Arquitecto de Software',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0004'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 6. AUT-0006
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Dolly Yadhira Mollo Chuquicaña',
    NULL,
    '2026-04-19',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0006',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0006'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Dolly Yadhira Mollo Chuquicaña',
    'Dolly',
    '2026-05-20',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0006'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 7. AUT-0007
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Rafael Diego Nina Calizaya',
    NULL,
    '2026-04-19',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0007',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0007'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Rafael Diego Nina Calizaya',
    'Rafael',
    '2026-05-20',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0007'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 8. AUT-0008
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Fabiana Francinet Pacheco Palo',
    'Fabi',
    '2026-04-19',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0008',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0008'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 9. AUT-0009
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Quispe Madariaga Jeferson Jofre',
    NULL,
    '2026-04-19',
    'Diseñadores de Software',
    'ORG-0001',
    'AUT-0009',
    'Concluido',
    'Ninguno',
    FALSE
FROM autor
WHERE codigo = 'AUT-0009'
ON CONFLICT (autor_id, version) DO NOTHING;


INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.1',
    'Quispe Madariaga Jeferson Jofre',
    'Jeferson',
    '2026-05-20',
    'Diseñadores de Software',
    'ORG-0001',
    'AUT-0005',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0009'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- 10. AUT-0010
-- ============================================================

INSERT INTO autor_version (
    autor_id,
    version,
    nombres_apellidos,
    alias,
    fecha,
    rol,
    organizacion,
    autor_plantilla_codigo,
    estado,
    comentario,
    es_actual
)
SELECT
    id,
    '1.0.0',
    'Michael Benjamin Suclle Suca',
    'Benja',
    '2026-04-19',
    'Analista de Requisitos',
    'ORG-0001',
    'AUT-0010',
    'Concluido',
    'Ninguno',
    TRUE
FROM autor
WHERE codigo = 'AUT-0010'
ON CONFLICT (autor_id, version) DO NOTHING;


-- ============================================================
-- FIN DE AUTORES
-- ============================================================
