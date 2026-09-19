-- ============================================================
-- EDUCCIONES
-- Datos extraídos de las plantillas oficiales del proyecto
-- ============================================================

-- ============================================================
-- 1. ACTORES (PLANTILLA DE ACTORES)
-- ============================================================
-- Nota: el esquema solo dispone de codigo, nombre y descripcion.
-- El resto de campos de la plantilla se conservan en descripcion.
-- ============================================================

INSERT INTO actor (codigo, nombre, descripcion)
SELECT 'ACT-0001', 'FisioTerapeuta', 'Rol: FisioTerapeuta | Versión: 1.0.0 | Organización: ORG-0002 | Autor de la plantilla: AUT-0005 | Fecha: 2026-04-25 | Tipo: Principal | Estado: Concluido | Comentario: Ninguno'
WHERE NOT EXISTS (SELECT 1 FROM actor WHERE codigo = 'ACT-0001')
;

INSERT INTO actor (codigo, nombre, descripcion)
SELECT 'ACT-0002', 'Coordinador', 'Rol: Coordinador | Versión: 1.0.0 | Organización: ORG-0002 | Autor de la plantilla: AUT-0008 | Fecha: 2026-04-25 | Tipo: Principal | Estado: Concluido | Comentario: Ninguno'
WHERE NOT EXISTS (SELECT 1 FROM actor WHERE codigo = 'ACT-0002')
;

INSERT INTO actor (codigo, nombre, descripcion)
SELECT 'ACT-0003', 'Recepcionista', 'Rol: Recepcionista | Versión: 1.0.0 | Organización: ORG-0002 | Autor de la plantilla: AUT-0009 | Fecha: 2026-04-25 | Tipo: Principal | Estado: Concluido | Comentario: Ninguno'
WHERE NOT EXISTS (SELECT 1 FROM actor WHERE codigo = 'ACT-0003')
;

INSERT INTO actor (codigo, nombre, descripcion)
SELECT 'ACT-0004', 'Gerente', 'Rol: Gerente | Versión: 1.0.0 | Organización: ORG-0002 | Autor de la plantilla: AUT-0006 | Fecha: 2026-04-25 | Tipo: Principal | Estado: Concluido | Comentario: Ninguno'
WHERE NOT EXISTS (SELECT 1 FROM actor WHERE codigo = 'ACT-0004')
;


-- ============================================================
-- 2. EXPERTOS (PLANTILLA DE EXPERTOS)
-- ============================================================
-- Nota: el esquema solo dispone de codigo, nombre, especialidad y
-- descripcion. El resto de campos de la plantilla se conservan en
-- descripcion.
-- ============================================================

INSERT INTO experto (codigo, nombre, especialidad, descripcion)
SELECT 'EXP-001', 'Percy Oscar Huertas Niquen', 'Magister en Ciencias: Ingeniería de Sistemas con mención en Ingeniería de Software. Especialista en Ingeniería de Requerimientos', 'Versión: 1.0.0 | Experiencia: Magister en Ciencias: Ingeniería de Sistemas con mención en Ingeniería de Software. Especialista en Ingeniería de Requerimientos | Organización: ORG-0004 | Autor de la plantilla: AUT-0001 | Fecha: 2026-09-28 | Estado: Concluido | Comentario: Apoyo con la retroalimentación sobre la organización y desarrollo del proyecto'
WHERE NOT EXISTS (SELECT 1 FROM experto WHERE codigo = 'EXP-001')
;


-- ============================================================
-- 3. FUENTES DE INFORMACIÓN (ENT codes)
-- ============================================================

INSERT INTO fuente (codigo)
VALUES
    ('ENT-0001'),
    ('ENT-0002'),
    ('ENT-0004'),
    ('ENT-0005')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO fuente_version (
    fuente_id, version, nombre, autores, fecha_fuente, fecha_plantilla,
    autor_plantilla_codigo, estado, comentario, es_actual
)
SELECT id, '1.0.0', 'Entrevista - Recepcionista', NULL, NULL, '2026-04-26', NULL, 'Concluido', 'Entrevista inicial con recepcionista', TRUE
FROM fuente WHERE codigo = 'ENT-0001'
ON CONFLICT (fuente_id, version) DO NOTHING;

INSERT INTO fuente_version (
    fuente_id, version, nombre, autores, fecha_fuente, fecha_plantilla,
    autor_plantilla_codigo, estado, comentario, es_actual
)
SELECT id, '1.0.0', 'Entrevista - Fisioterapeuta', NULL, NULL, '2026-04-29', NULL, 'Concluido', 'Entrevista inicial con fisioterapeuta', TRUE
FROM fuente WHERE codigo = 'ENT-0002'
ON CONFLICT (fuente_id, version) DO NOTHING;

INSERT INTO fuente_version (
    fuente_id, version, nombre, autores, fecha_fuente, fecha_plantilla,
    autor_plantilla_codigo, estado, comentario, es_actual
)
SELECT id, '1.0.0', 'Entrevista - Recepcionista (monitoreo)', NULL, NULL, '2026-06-07', NULL, 'Concluido', 'Entrevista para monitoreo de organización interna', TRUE
FROM fuente WHERE codigo = 'ENT-0004'
ON CONFLICT (fuente_id, version) DO NOTHING;

INSERT INTO fuente_version (
    fuente_id, version, nombre, autores, fecha_fuente, fecha_plantilla,
    autor_plantilla_codigo, estado, comentario, es_actual
)
SELECT id, '1.0.0', 'Entrevista - Gerente', NULL, NULL, '2026-06-21', NULL, 'Concluido', 'Entrevista con gerente sobre ingreso al sistema', TRUE
FROM fuente WHERE codigo = 'ENT-0005'
ON CONFLICT (fuente_id, version) DO NOTHING;

-- ============================================================
-- 4. IDENTIDADES DE ARTEFACTOS (EDUCCIONES)
-- ============================================================

INSERT INTO artefacto (codigo, tipo)
VALUES
    ('EDU-0001', 'EDUCCION'),
    ('EDU-0002', 'EDUCCION'),
    ('EDU-0005', 'EDUCCION'),
    ('EDU-0006', 'EDUCCION'),
    ('EDU-0025', 'EDUCCION'),
    ('EDU-0026', 'EDUCCION'),
    ('EDU-0027', 'EDUCCION'),
    ('EDU-0029', 'EDUCCION'),
    ('EDU-0031', 'EDUCCION'),
    ('EDU-0032', 'EDUCCION'),
    ('EDU-0033', 'EDUCCION')
ON CONFLICT (codigo) DO NOTHING;

-- ============================================================
-- EDU-0001: Gestión de datos del paciente
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0001 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de datos del paciente',
    '2026-04-26',
    'Vital',
    'Concluido',
    'Se manifestó que la atención al cliente es una prioridad de la organización, se prioriza la atención que la rapidez.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista registrar la ficha de datos del paciente al momento de su ingreso, con el fin de iniciar su atención en el centro

El sistema debe permitir a la recepcionista registrar, y emitir  el consentimiento informado del paciente antes de iniciar el tratamiento, con el fin de contar con respaldo legal'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0001 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Gestión del paciente',
    '2026-05-03',
    'Vital',
    'Concluido',
    'Se manifestó que la atención al cliente es una prioridad de la organización, se prioriza la atención que la rapidez.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir la gestión integral de los datos maestros del paciente mediante un modelo completo de registro, consulta, actualización y baja lógica. Inicialmente, la recepcionista podrá registrar la ficha de ingreso y el consentimiento informado, así como consultar el historial para generar y emitir constancias de atención con respaldo legal.


Asimismo, se habilitará la actualización continua de la información personal o clínica ante cualquier cambio. Finalmente, por normativas de salud, el sistema no realizará el borrado físico de los registros. Ante el cese de atención o deceso del paciente, su estado cambiará a inactivo o "Archivo Histórico", lo que bloqueará la asignación de nuevas citas, pero mantendrá intacta la trazabilidad legal de toda su información y documentos emitidos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0001 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Gestión del paciente',
    '2026-05-10',
    'Vital',
    'Pendiente',
    'Se manifestó que la atención al cliente es una prioridad de la organización, se prioriza la atención que la rapidez.
La FUE-0004 nos indica un gran detalle a tener en cuenta, la implementación de validaciones estrictas en los procesos de registro y actualización (como la prohibición de campos vacíos o el control de caracteres especiales) garantiza la integridad de la información de los pacientes.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir la gestión integral de los datos maestros del paciente mediante un modelo completo de registro, consulta, actualización y baja lógica. Inicialmente, la recepcionista podrá registrar la ficha de ingreso y el consentimiento informado, así como consultar el historial para generar y emitir constancias de atención con respaldo legal.


Asimismo, se habilitará la actualización continua de la información personal o clínica ante cualquier cambio. Finalmente, por normativas de salud, el sistema no realizará el borrado físico de los registros. Ante el cese de atención o deceso del paciente, su estado cambiará a inactivo o "Archivo Histórico", lo que bloqueará la asignación de nuevas citas, pero mantendrá intacta la trazabilidad legal de toda su información y documentos emitidos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0001 v1.0.3
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.3',
    'Gestión del paciente',
    '2026-06-01',
    'Vital',
    'Concluido',
    'Se manifestó que la atención al cliente es una prioridad de la organización, se prioriza la atención que la rapidez.
La FUE-0004 nos indica un gran detalle a tener en cuenta, la implementación de validaciones estrictas en los procesos de registro y actualización (como la prohibición de campos vacíos o el control de caracteres especiales) garantiza la integridad de la información de los pacientes.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0001',
    'El sistema debe permitir la gestión integral de los datos maestros del paciente mediante un modelo completo de registro, consulta, actualización y baja lógica. Inicialmente, la recepcionista podrá registrar la ficha de ingreso y el consentimiento informado, así como consultar el historial para generar y emitir constancias de atención con respaldo legal.


Asimismo, se habilitará la actualización continua de la información personal o clínica ante cualquier cambio. Finalmente, por normativas de salud, el sistema no realizará el borrado físico de los registros. Ante el cese de atención o deceso del paciente, su estado cambiará a inactivo o "Archivo Histórico", lo que bloqueará la asignación de nuevas citas, pero mantendrá intacta la trazabilidad legal de toda su información y documentos emitidos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0007'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0001' AND av.version = '1.0.3' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0002: Gestión de citas de pacientes
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0002 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de citas de pacientes',
    '2026-04-26',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista registrar, modificar y cancelar una cita, considerando los horarios disponibles a fin de organizar la atención del paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0002 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Gestión de citas',
    '2026-05-03',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista registrar, modificar y cancelar una cita, considerando los horarios disponibles a fin de organizar la atención del paciente'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0002 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Gestión de citas',
    '2026-05-10',
    'Vital',
    'Pendiente',
    'La FUE-0005 nos da ideas sobre cómo realizar la gestión de citas, en el documento el registro de citas se realizó mediante formularios intuitivos que seleccionan fecha y hora disponible (validando contra la tabla ATENCION con horarios de inicio/fin y minutos por cita) y se modifican mediante actualización de estado/fecha en la entidad AGENDAMIENTOS, y se cancelan con confirmación.',
    act.id,
    ex.id,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
CROSS JOIN experto ex WHERE a.codigo = 'EDU-0002' AND ex.codigo = 'EXP-001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista gestionar el ciclo completo de la agenda y el flujo de llegada de los pacientes mediante un modelo CRUD. En primer lugar, el sistema permitirá registrar (Crear) y consultar (Leer) citas en los horarios disponibles. Al momento del ingreso del paciente, se realizará el Check-in, consultando el estado financiero mediante la API para verificar si el paciente cuenta con sesiones válidas.

Si el estado es validado, el registro de asistencia actualizará (Modificar) automáticamente el contador de sesiones restantes del paciente y cambiará el estado de la cita. Asimismo, el sistema permitirá modificar fechas de citas agendadas o registrar penalidades de tiempo por tardanzas. Finalmente, respecto a la anulación (Eliminación lógica), el sistema permitirá cancelar citas programadas con confirmación previa. Para evitar inconsistencias con el otro equipo, no se podrán eliminar asistencias pasadas; solo se permitirá anular un check-in ingresado por error durante el mismo día, devolviendo la sesión al saldo del paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.0.2' AND f.codigo = 'FUE-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0002 v1.1.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.2',
    'Gestión de citas y flujo de agenda',
    '2026-06-11',
    'Vital',
    'Concluido',
    'La FUE-0005 nos da ideas sobre cómo realizar la gestión de citas, en el documento el registro de citas se realizó mediante formularios intuitivos que seleccionan fecha y hora disponible (validando contra la tabla ATENCION con horarios de inicio/fin y minutos por cita) y se modifican mediante actualización de estado/fecha en la entidad AGENDAMIENTOS, y se cancelan con confirmación.',
    act.id,
    ex.id,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
CROSS JOIN experto ex WHERE a.codigo = 'EDU-0002' AND ex.codigo = 'EXP-001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista gestionar el ciclo completo de la agenda y el flujo de llegada de los pacientes mediante un modelo CRUD. En primer lugar, el sistema permitirá registrar (Crear) y consultar (Leer) citas en los horarios disponibles. Al momento del ingreso del paciente, se realizará el Check-in, consultando el estado financiero mediante la API para verificar si el paciente cuenta con sesiones válidas.

Si el estado es validado, el registro de asistencia actualizará (Modificar) automáticamente el contador de sesiones restantes del paciente y cambiará el estado de la cita. Asimismo, el sistema permitirá modificar fechas de citas agendadas o registrar penalidades de tiempo por tardanzas. Finalmente, respecto a la anulación (Eliminación lógica), el sistema permitirá cancelar citas programadas con confirmación previa. Para evitar inconsistencias con el otro equipo, no se podrán eliminar asistencias pasadas; solo se permitirá anular un check-in ingresado por error durante el mismo día, devolviendo la sesión al saldo del paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2' AND aut.codigo = 'AUT-0003'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0002' AND av.version = '1.1.2' AND f.codigo = 'FUE-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0005: Gestión de seguimiento de clientes
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0005 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de seguimiento de clientes',
    '2026-04-26',
    'Opcional',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista hacer seguimiento a los pacientes, identificar casos de abandono y generar notificaciones automáticas por correo'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0005 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Gestión de seguimiento de pacientes',
    '2026-05-03',
    'Opcional',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista hacer seguimiento a los pacientes, identificar casos de abandono y generar notificaciones automáticas por correo'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0005 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Gestión de seguimiento de pacientes',
    '2026-05-10',
    'Opcional',
    'Concluido',
    'La FUE-0004 nos da ideas sobre la educción, como por ejemplo una interfaz de monitoreo de estados que permite filtrar citas activas y visualizar historiales de asistencia, lo que facilita a la recepcionista la identificación inmediata de pacientes que han interrumpido su tratamiento para realizar gestiones de reenganche oportunas. También la automatización de recordatorios masivos mediante la API de WhatsApp, asegurando que los avisos se envíen con una antelación específica (por ejemplo, 24 horas antes) de forma desatendida.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir al fisioterapeuta registrar, consultar y analizar métricas clínicas objetivas como dolor (EVA), fuerza, movilidad y resistencia.
Debe ofrecer una vista gráfica de evolución que muestre si el paciente mejora o no mejora sesión a sesión.

El seguimiento debe incluir:
Visualización comparativa entre sesiones.
Generación automática de reportes de progreso: Esto garantiza retroalimentación clara al paciente y soporte clínico para decisiones médicas.
Esto garantiza retroalimentación clara al paciente y soporte clínico para decisiones médicas.

El sistema debe permitir a la recepcionista hacer seguimiento a los pacientes, identificar casos de abandono y generar notificaciones automáticas por Whatsapp'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0005' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0006: Registro clínico del paciente
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0006 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registro clínico del paciente',
    '2026-04-26',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir al fisioterapeuta  registrar los datos clínicos del paciente y observaciones de su estado  durante la sesión con el fin de documentar la evaluación, evolución y tratamiento realizado.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0006 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Registro clínico del paciente',
    '2026-05-03',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir al fisioterapeuta gestionar el registro clínico integral mediante el control de la ficha de evaluación inicial (postura, dolor y movilidad), las notas de evolución sesión tras sesión y el detalle de los tratamientos aplicados. Esta funcionalidad incluye la visualización del historial completo para el seguimiento de la evolución del paciente y la capacidad de rectificar observaciones clínicas manteniendo un registro de las fechas de modificación.

Por normativa de salud, se prohíbe el borrado permanente de la información; en su lugar, el sistema permitirá la anulación de registros por error justificado o el archivado de historias clínicas finalizadas para garantizar la trazabilidad y el respaldo legal en la base de datos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0006 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Gestión de historias clínicas',
    '2026-05-06',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir al fisioterapeuta la gestión integral de las historias clínicas mediante un modelo de creación, consulta, actualización y eliminación lógica.

El profesional podrá crear y controlar el registro clínico integral, el cual abarca la ficha de evaluación inicial (postura, dolor y movilidad), las notas de evolución sesión tras sesión y el detalle minucioso de los tratamientos aplicados.

Se debe permitir leer y visualizar el historial completo para el seguimiento de la evolución, incluyendo la capacidad de realizar estas consultas en tiempo real con el fin de tomar decisiones rápidas y adaptar el tratamiento según el estado actual del paciente.

El sistema debe permitir actualizar o rectificar observaciones clínicas, siempre manteniendo un registro estricto de las fechas de modificación para asegurar la integridad de los datos.

Respecto a la eliminación de registros, por normativa de salud se prohíbe el borrado permanente de la información; por lo tanto, el sistema permitirá la anulación de registros únicamente por error justificado o el archivado de historias clínicas finalizadas, garantizando así la trazabilidad y el respaldo legal en la base de datos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0006 v1.0.3
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.3',
    'Gestión de historias clínicas',
    '2026-05-10',
    'Vital',
    'Concluido',
    'La FUE-0006 integra un módulo de reportes y estadísticas que permita exportar el historial clínico y los diagnósticos en formatos estandarizados (como PDF), facilitando tanto el respaldo documental como la entrega de informes al paciente. También complementa con  una interfaz de búsqueda avanzada por código o nombres, la cual optimiza el acceso a la información técnica de tratamientos y evoluciones previas',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir al fisioterapeuta la gestión integral de las historias clínicas mediante un modelo de creación, consulta, actualización y eliminación lógica.

El profesional podrá crear y controlar el registro clínico integral, el cual abarca la ficha de evaluación inicial (postura, dolor y movilidad), las notas de evolución sesión tras sesión y el detalle minucioso de los tratamientos aplicados.

Se debe permitir leer y visualizar el historial completo para el seguimiento de la evolución, incluyendo la capacidad de realizar estas consultas en tiempo real con el fin de tomar decisiones rápidas y adaptar el tratamiento según el estado actual del paciente.

El sistema debe permitir actualizar o rectificar observaciones clínicas, siempre manteniendo un registro estricto de las fechas de modificación para asegurar la integridad de los datos.

Respecto a la eliminación de registros, por normativa de salud se prohíbe el borrado permanente de la información; por lo tanto, el sistema permitirá la anulación de registros únicamente por error justificado o el archivado de historias clínicas finalizadas, garantizando así la trazabilidad y el respaldo legal en la base de datos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.3'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0006'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.3' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.3' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0006' AND av.version = '1.0.3' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0025: Gestión de registro de sesión terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0025 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de registro de sesión terapéutica',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0025'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir crear, editar, desactivar sesiones terapéuticas.

Cada sesión debe incluir campos obligatorios: agente aplicado, zona de aplicación, tiempo de uso y escala EVA (0–10) y duración total de la sesión.

El sistema debe permitir registrar métricas clínicas (dolor, fuerza, movilidad, resistencia) y preguntas personalizadas de seguimiento.

El sistema debe permitir registrar zonas de dolor mediante mapas corporales y botones predefinidos.

Debe incluir digitalmente el consentimiento informado y registrar qué equipo invasivo se usó y cuándo.

Permitir la creación de informes terapéuticos digitales (dolor, fuerza, movilidad, pruebas funcionales, observaciones) a partir de las sesiones del paciente observadas.

El sistema debe permitir registrar, editar, desactivar tratamientos incluyendo los tiempos estándar por equipo (ej. TENS 8–10 min, Tecarterapia 4–8 min) y registrar la duración total de la terapia estandarizada.

Estros tratamiento pueden ser enlazados por cada sesión

El sistema debe permitir al fisioterapeuta registrar y consultar protocolos de seguridad aplicados durante la sesión, incluyendo situaciones críticas como fiebre, estado etílico, desorientación o inflamación anormal.

Al detectarse una "bandera roja", la sesión debe quedar marcada como suspendida sin descuento para el paciente.

Además, el sistema debe contar con un módulo digital de contingencia que guíe al fisioterapeuta en la acción inmediata a seguir (ej. suspender terapia, recomendar descanso, derivar a médico), garantizando la seguridad clínica y la trazabilidad del evento.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0025' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0025' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0025' AND av.version = '1.0.0' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0025 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Gestión de registro de sesión terapéutica',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se agrego la fuente que contiene la entrevista 02 y una fuente - Implementación De Un Sistema Informático Para La Gestión Y Organización De Historial Clínico De Pacientes En La Clínica Nuestra Señora De Las Mercedes Del Cantón Pedro Carbo',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0025'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir crear, editar, desactivar sesiones terapéuticas.

Cada sesión debe incluir campos obligatorios: agente aplicado, zona de aplicación, tiempo de uso y escala EVA (0–10) y duración total de la sesión.

El sistema debe poder obtener los protocolos definidos y aplicarlos dentro del registro.

El sistema debe permitir registrar zonas de dolor mediante mapas corporales y botones predefinidos.

Debe incluir digitalmente el consentimiento informado y registrar qué equipo invasivo se usó y cuándo.

Permitir la creación de informes terapéuticos digitales (dolor, fuerza, movilidad, pruebas funcionales, observaciones) a partir de las sesiones del paciente observadas.

El sistema debe permitir registrar, editar, desactivar tratamientos incluyendo los tiempos estándar por equipo (ej. TENS 8–10 min, Tecarterapia 4–8 min) y registrar la duración total de la terapia estandarizada.

Estros tratamiento pueden ser enlazados por cada sesión

El sistema debe permitir al fisioterapeuta registrar y consultar protocolos de seguridad aplicados durante la sesión, incluyendo situaciones críticas como fiebre, estado etílico, desorientación o inflamación anormal.

Al detectarse una "bandera roja", la sesión debe quedar marcada como suspendida sin descuento para el paciente.

Además, el sistema debe contar con un módulo digital de contingencia que guíe al fisioterapeuta en la acción inmediata a seguir (ej. suspender terapia, recomendar descanso, derivar a médico), garantizando la seguridad clínica y la trazabilidad del evento.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0025' AND av.version = '1.1.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0025' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0025' AND av.version = '1.1.0' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0025' AND av.version = '1.1.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0025 v1.2.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.2.0',
    'Gestión de registro de sesión terapéutica',
    '2026-06-16',
    'Vital',
    'Concluido',
    'Se agrego la fuente que contiene la entrevista 02 y una fuente - Implementación De Un Sistema Informático Para La Gestión Y Organización De Historial Clínico De Pacientes En La Clínica Nuestra Señora De Las Mercedes Del Cantón Pedro Carbo',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0025'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0017',
    'El sistema debe permitir al fisioterapeuta gestionar las sesiones terapéuticas de los pacientes mediante una interfaz de "Sesión de Pacientes", donde se visualiza el listado de pacientes programados para atención.

Desde este módulo, el fisioterapeuta podrá crear, editar, consultar y desactivar sesiones terapéuticas. Al crear una sesión, el sistema mostrará automáticamente la información del paciente, diagnóstico clínico, número de sesión y tratamientos o agentes terapéuticos asociados.

Durante el registro de la sesión, el fisioterapeuta deberá documentar las observaciones clínicas correspondientes a la atención realizada, quedando dicha información asociada al historial terapéutico del paciente para su posterior consulta y seguimiento.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0025' AND av.version = '1.2.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0025' AND av.version = '1.2.0' AND aut.codigo = 'AUT-0005'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0025' AND av.version = '1.2.0' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0025' AND av.version = '1.2.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0026: Visualización de organización interna actual
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0026 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Visualización de organización interna actual',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se recomienda integrar notificaciones automáticas para cambios críticos.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'Mostrar cambios de recepción, tardanzas y reasignación de camillas. Garantizando que el fisioterapeuta pueda consultar, actualizar y coordinar horarios de forma ágil durante turnos de alta demanda.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.0' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0026 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Visualización de organización interna actual',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se agrego FUE-0003 que contiene la ENTR-0002 de fisioterapeuta',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'Mostrar cambios de recepción, tardanzas y reasignación de camillas. Garantizando que el fisioterapeuta pueda consultar, actualizar y coordinar horarios de forma ágil durante turnos de alta demanda.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.1' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0026 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Gestión de visualización básica de organización interna actual para el fisioterapeuta',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se agrego FUE-0003 que contiene la ENTR-0002 de fisioterapeuta',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'Mostrar cambios de recepción, tardanzas y reasignación de camillas. Garantizando que el fisioterapeuta pueda consultar, actualizar y coordinar horarios de forma ágil durante turnos de alta demanda.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.2'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0026' AND av.version = '1.0.2' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0026 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Visualización de cita actual y agenda del día',
    '2026-06-16',
    'Vital',
    'Concluido',
    'Se realizaron correcciones frente a aclaraciones con el cliente.
Ilación ya',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0006',
    'El sistema debe permitir al fisioterapeuta visualizar en un panel central la información de la cita actual y las citas programadas durante el día.

Mostrar datos básicos del paciente (edad, diagnóstico, tratamiento, número de sesión, camilla asignada).

Incluir indicadores de turno (pacientes atendidos, sesiones pendientes, promedio de duración).

Presentar la agenda con horarios, pacientes y camillas, reflejando cambios en tiempo real provenientes de recepción (tardanzas, reasignaciones de camillas, cancelaciones).

Facilitar la consulta rápida de información de cada paciente desde la agenda, con acceso directo al progreso clínico.

Garantizar actualización automática sin necesidad de recarga manual, optimizando la coordinación en turnos de alta demanda.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0026' AND av.version = '2.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0026' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0026' AND av.version = '2.0.0' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0027: Intercambio de información entre sedes
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0027 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Intercambio de información entre sedes',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se recomienda implementar sincronización automática entre sedes.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0027'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'Debe contener una opción para migrar y consultar los datos de pacientes entre sedes, incluyendo:

Número de sesiones realizadas.
Procedimientos previos aplicados.
Historial clínico relevante: La información debe estar disponible para que cualquier fisioterapeuta pueda retomar el tratamiento con precisión, garantizando continuidad clínica sin depender de llamadas telefónicas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0027' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0027' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0027' AND av.version = '1.0.0' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0027 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Intercambio de información entre sedes',
    '2026-05-09',
    'Vital',
    'Concluido',
    'Se recomienda implementar sincronización automática entre sedes. (RNF)
Se agregó FUE-0003 que contiene la ENTR-0002 de fisioterapeuta',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0027'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'Debe contener una opción para migrar y consultar los datos de pacientes entre sedes, incluyendo:

Número de sesiones realizadas.
Procedimientos previos aplicados.
Historial clínico relevante: La información debe estar disponible para que cualquier fisioterapeuta pueda retomar el tratamiento con precisión, garantizando continuidad clínica sin depender de llamadas telefónicas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0027' AND av.version = '1.1.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0027' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0008'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0027' AND av.version = '1.1.0' AND f.codigo = 'ENT-0002'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0029: Control de asistencia de pacientes
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0029 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Control de asistencia de pacientes',
    '2026-05-10',
    'Vital',
    'Concluido',
    'Requerimiento fundamental de interoperabilidad. Esta educción se comunica directamente con el módulo del equipo de Infraestructura, garantizando que el paciente no sea atendido si no tiene sesiones validadas, pero manteniendo la interfaz en el lado de recepción (InnovaByte).',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0029'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir a la recepcionista gestionar el flujo de llegada de los pacientes (Check-in) mediante un modelo de validación y actualización. Al momento del ingreso, el sistema permitirá consultar (Leer) el estado del paciente consumiendo la API financiera para verificar si cuenta con "sesiones a favor" o pagos pendientes.

Si el estado es validado, la recepcionista podrá registrar (Crear) la asistencia del día, lo cual actualizará (Modificar) automáticamente el contador de sesiones restantes del paquete del paciente. En caso de inasistencia o llegadas tarde recurrentes, el sistema permitirá registrar una penalidad de tiempo en la sesión. Para evitar inconsistencias, no se podrán eliminar asistencias pasadas; solo se permitirá anular (Eliminación lógica) un check-in ingresado por error durante el mismo día, devolviendo la sesión al saldo del paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0029' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0029' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0003'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0029' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0031: Gestión de Plantillas de Tratamiento Estandarizadas
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0031 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de Plantillas de Tratamiento Estandarizadas',
    '2026-05-11',
    'Vital',
    'Pendiente',
    'Se busca que todo el personal de las sedes "hable el mismo idioma" clínico y técnico.',
    act.id,
    NULL,
    FALSE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0031'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-DDDD',
    'El sistema debe permitir que el Licenciado.
Cree
Leer/Consultar
Modificar
Desactivar/Anular
plantillas de protocolos y que se carguen rápidamente en la sesión diaria.
De tal manera el personal puede repetirlos de forma idéntica por un periodo determinado (ej. 3 días) y que el especialista tenga la potestad de modificarlos manualmente según la evolución.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

-- ------------------------------------------------------------
-- EDU-0031 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Gestión de Plantillas de Tratamiento Estandarizadas',
    '2026-05-11',
    'Vital',
    'Concluido',
    'Se busca que todo el personal de las sedes "hable el mismo idioma" clínico y técnico.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0031'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0022',
    'El sistema debe permitir que el Licenciado.
Cree
Leer/Consultar
Modificar
Desactivar/Anular
plantillas de protocolos y que se carguen rápidamente en la sesión diaria.
De tal manera el personal puede repetirlos de forma idéntica por un periodo determinado y que el especialista tenga la potestad de modificarlos manualmente según la evolución.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.1'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0009'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0031' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0032: Gestión de monitoreo de organización interna actual para el recepcionista
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0032 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Gestión de monitoreo de organización interna actual para el recepcionista',
    '2026-06-07',
    'Vital',
    'Concluido',
    'Existe una relación bidireccional con la EDU-0026, ya que el estado de las camillas se actualiza desde la vista del fisioterapeuta (y se consume aquí en modo lectura), mientras que el registro de novedades se envía desde aquí para la visualización del fisioterapeuta.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'EDU-0032'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0026',
    'El sistema debe permitir al recepcionista consultar  la agenda completa de pacientes del día, la cita actual por fisioterapeuta y el estado de ocupación de las camillas; así como registrar y actualizar las novedades o incidencias de la jornada para mantener informado al personal.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0032' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0032' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0032' AND av.version = '1.0.0' AND f.codigo = 'ENT-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0032' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- EDU-0033: Ingreso al sistema
-- ============================================================

-- ------------------------------------------------------------
-- EDU-0033 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Ingreso al sistema',
    '2026-06-21',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'EDU-0033'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO educcion_version (
    artefacto_version_id, codigo_ilacion, descripcion
)
SELECT
    av.id,
    'ILA-0027',
    'El sistema debe permitir el ingreso al sistema usando correo y contraseña. Al ingresar se mostrará una interfaz diferente dependiendo del rol y permisos que tenga el usuario.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'EDU-0033' AND av.version = '1.0.0'
ON CONFLICT (artefacto_version_id) DO NOTHING;

INSERT INTO artefacto_version_autor (
    artefacto_version_id, autor_id
)
SELECT
    av.id,
    aut.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN autor aut
WHERE a.codigo = 'EDU-0033' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
ON CONFLICT (artefacto_version_id, autor_id) DO NOTHING;

INSERT INTO artefacto_version_fuente (
    artefacto_version_id, fuente_id
)
SELECT
    av.id,
    f.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN fuente f
WHERE a.codigo = 'EDU-0033' AND av.version = '1.0.0' AND f.codigo = 'ENT-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;


-- ============================================================
-- FIN DE EDUCCIONES
-- ============================================================