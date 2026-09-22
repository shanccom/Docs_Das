-- ============================================================
-- ILACIONES
-- Datos extraídos de las plantillas oficiales del proyecto
-- ============================================================

-- ============================================================
-- 1. IDENTIDADES DE ARTEFACTOS (ILACIONES)
-- ============================================================

INSERT INTO artefacto (codigo, tipo)
VALUES
    ('ILA-0001', 'ILACION'),
    ('ILA-0002', 'ILACION'),
    ('ILA-0003', 'ILACION'),
    ('ILA-0004', 'ILACION'),
    ('ILA-0005', 'ILACION'),
    ('ILA-0006', 'ILACION'),
    ('ILA-0007', 'ILACION'),
    ('ILA-0008', 'ILACION'),
    ('ILA-0009', 'ILACION'),
    ('ILA-0010', 'ILACION'),
    ('ILA-0011', 'ILACION'),
    ('ILA-0012', 'ILACION'),
    ('ILA-0013', 'ILACION'),
    ('ILA-0014', 'ILACION'),
    ('ILA-0015', 'ILACION'),
    ('ILA-0016', 'ILACION'),
    ('ILA-0017', 'ILACION'),
    ('ILA-0018', 'ILACION'),
    ('ILA-0019', 'ILACION'),
    ('ILA-0020', 'ILACION'),
    ('ILA-0021', 'ILACION'),
    ('ILA-0022', 'ILACION'),
    ('ILA-0023', 'ILACION'),
    ('ILA-0024', 'ILACION'),
    ('ILA-0025', 'ILACION'),
    ('ILA-0026', 'ILACION'),
    ('ILA-0027', 'ILACION')
ON CONFLICT (codigo) DO NOTHING;

-- ============================================================
-- 2. ARTEFACTOS ASOCIADOS REFERENCIADOS POR LAS ILACIONES
-- ============================================================

INSERT INTO artefacto_asociado (codigo, tipo)
VALUES
    ('SDB-01', 'SDB'),
    ('BTN-09', 'BTN'),
    ('INT-01', 'INT'),
    ('INT-01-INP-01', 'INT'),
    ('INT-01-INP-02', 'INT'),
    ('INT-01-INP-03', 'INT'),
    ('INT-01-INP-04', 'INT'),
    ('INT-01-INP-05', 'INT'),
    ('INT-01-INP-06', 'INT'),
    ('INT-01-CHK-01', 'INT'),
    ('BTN-01', 'BTN'),
    ('BTN-02', 'BTN'),
    ('INT-02', 'INT'),
    ('INT-02-INP-01', 'INT'),
    ('INT-02-TBL-01', 'INT'),
    ('INT-02-BTN-01', 'INT'),
    ('INT-02-BTN-02', 'INT'),
    ('INT-02-BTN-03', 'INT'),
    ('INT-02-A', 'INT'),
    ('INT-02-A-BTN-01', 'INT'),
    ('INT-02-A-BTN-02', 'INT'),
    ('INT-003', 'INT'),
    ('INT-003-INP-01', 'INT'),
    ('INT-003-INP-02', 'INT'),
    ('INT-003-INP-03', 'INT'),
    ('INT-003-INP-04', 'INT'),
    ('INT-003-INP-05', 'INT'),
    ('INT-003-BTN-01', 'INT'),
    ('INT-003-BTN-02', 'INT'),
    ('INT-004', 'INT'),
    ('INT-004-DPD-01', 'INT'),
    ('INT-004-INP-01', 'INT'),
    ('INT-05', 'INT'),
    ('INT-05-TXT-01', 'INT'),
    ('INT-05-TXT-02', 'INT'),
    ('INT-05-DPD-01', 'INT'),
    ('INT-05-DPD-02', 'INT'),
    ('INT-05-DPD-03', 'INT'),
    ('INT-05-DPD-04', 'INT'),
    ('INT-05-DPD-05', 'INT'),
    ('INT-05-BTN-01', 'INT'),
    ('INT-05-BTN-02', 'INT'),
    ('INT-06', 'INT'),
    ('INT-06-DPD-01', 'INT'),
    ('INT-06-DPD-02', 'INT'),
    ('INT-06-INP-01', 'INT'),
    ('INT-06-BTN-01', 'INT'),
    ('INT-06-BTN-02', 'INT'),
    ('INT-06-BTN-03', 'INT'),
    ('INT-06-BTN-04', 'INT'),
    ('INT-06-BTN-05', 'INT'),
    ('INT-06-BTN-06', 'INT'),
    ('INT-06-BTN-07', 'INT'),
    ('INT-06-BTN-08', 'INT'),
    ('INT-06-TBL-01', 'INT'),
    ('INT-07', 'INT'),
    ('INT-07-TXT-01', 'INT'),
    ('INT-07-TXT-02', 'INT'),
    ('INT-07-DPD-01', 'INT'),
    ('INT-07-DPD-02', 'INT'),
    ('INT-07-DPD-03', 'INT'),
    ('INT-07-DPD-04', 'INT'),
    ('INT-07-DPD-05', 'INT'),
    ('INT-07-BTN-01', 'INT'),
    ('INT-07-BTN-02', 'INT'),
    ('INT-08', 'INT'),
    ('INT-08-TXT-01', 'INT'),
    ('INT-08-TXT-02', 'INT'),
    ('INT-08-INP-01', 'INT'),
    ('INT-08-BTN-01', 'INT'),
    ('INT-08-BTN-02', 'INT'),
    ('INT-021-BTN-003', 'INT'),
    ('INT-009-BTN-01', 'INT'),
    ('INT-009-IMG-01', 'INT'),
    ('INT-009-PNL-01', 'INT'),
    ('INT-009-DPD-01', 'INT'),
    ('INT-009-DTP-01', 'INT'),
    ('INT-009-CMB-01', 'INT'),
    ('INT-009-CMB-02', 'INT'),
    ('INT-009-CMB-03', 'INT'),
    ('INT-009-CMB-04', 'INT'),
    ('INT-009-IMP-01', 'INT'),
    ('INT-009-BTN-02', 'INT'),
    ('INT-009-BTN-03', 'INT'),
    ('INT-021-BTN-04', 'INT'),
    ('INT-010-PNL-01', 'INT'),
    ('INT-010-BTN-01', 'INT'),
    ('INT-010-IMG-01', 'INT'),
    ('INT-010-GRD-01', 'INT'),
    ('INT-010-GRD-02', 'INT'),
    ('INT-010-GRD-03', 'INT'),
    ('INT-010-GRD-04', 'INT'),
    ('INT-010-TBL-01', 'INT'),
    ('INT-010-BTN-02', 'INT'),
    ('INT-010-BTN-03', 'INT'),
    ('LOG-01', 'LOG'),
    ('BTN-03', 'BTN'),
    ('BTN-04', 'BTN'),
    ('BTN-05', 'BTN'),
    ('BTN-06', 'BTN'),
    ('PRF-01', 'PRF'),
    ('INT-12-TXT-01', 'INT'),
    ('INT-12-INP-01', 'INT'),
    ('INT-12-BTN-01', 'INT'),
    ('INT-12-BTN-02', 'INT'),
    ('INT-12-TBL-01', 'INT'),
    ('INT-12-BTN-03', 'INT'),
    ('INT-12-BTN-04', 'INT'),
    ('INT-12-BTN-05', 'INT'),
    ('INT-12-BTN-06', 'INT'),
    ('INT-12-A-MDL-01', 'INT'),
    ('INT-12-A-TXT-01', 'INT'),
    ('INT-12-A-BTN-02', 'INT'),
    ('INT-12-A-BTN-03', 'INT'),
    ('INT-13', 'INT'),
    ('INT-14', 'INT'),
    ('INT-11-TXT-01', 'INT'),
    ('INT-11-BTN-01', 'INT'),
    ('INT-11-BTN-02', 'INT'),
    ('INT-11-BTN-03', 'INT'),
    ('INT-11-IMG-04', 'INT'),
    ('INT-11-TXT-02', 'INT'),
    ('INT-11-TXT-03', 'INT'),
    ('INT-11-TXT-04', 'INT'),
    ('INT-11-TXT-05', 'INT'),
    ('INT-11-TXT-06', 'INT'),
    ('INT-13-TXT-01', 'INT'),
    ('INT-13-TXT-02', 'INT'),
    ('INT-13-TXT-03', 'INT'),
    ('INT-13-TXT-04', 'INT'),
    ('INT-13-TXT-05', 'INT'),
    ('INT-13-TXT-06', 'INT'),
    ('INT-13-TXT-08', 'INT'),
    ('INT-13-TXT-09', 'INT'),
    ('INT-13-TXT-10', 'INT'),
    ('INT-13-TXT-11', 'INT'),
    ('INT-13-TXT-12', 'INT'),
    ('INT-13-TXT-13', 'INT'),
    ('INT-13-TXT-14', 'INT'),
    ('INT-13-TXT-15', 'INT'),
    ('INT-13-TXT-16', 'INT'),
    ('INT-13-INP-01', 'INT'),
    ('INT-13-INP-02', 'INT'),
    ('INT-13-INP-03', 'INT'),
    ('INT-13-INP-04', 'INT'),
    ('INT-13-INP-05', 'INT'),
    ('INT-13-CMB-01', 'INT'),
    ('INT-13-CMB-02', 'INT'),
    ('INT-13-CMB-03', 'INT'),
    ('INT-13-CMB-04', 'INT'),
    ('INT-13-CMB-05', 'INT'),
    ('INT-13-CHK-01', 'INT'),
    ('INT-13-CHK-02', 'INT'),
    ('INT-13-CHK-03', 'INT'),
    ('INT-13-SPB-01', 'INT'),
    ('INT-13-SPB-02', 'INT'),
    ('INT-13-TBL-01', 'INT'),
    ('INT-13-GRD-01', 'INT'),
    ('INT-13-BTN-01', 'INT'),
    ('INT-13-BTN-02', 'INT'),
    ('INT-13-BTN-03', 'INT'),
    ('INT-13-BTN-04', 'INT'),
    ('INT-13-BTN-05', 'INT'),
    ('INT-13-MSG-01', 'INT'),
    ('INT-14-TXT-01', 'INT'),
    ('INT-14-TXT-02', 'INT'),
    ('INT-14-TXT-03', 'INT'),
    ('INT-14-TXT-04', 'INT'),
    ('INT-14-TXT-05', 'INT'),
    ('INT-14-TXT-08', 'INT'),
    ('INT-14-TXT-09', 'INT'),
    ('INT-14-TXT-10', 'INT'),
    ('INT-14-TXT-11', 'INT'),
    ('INT-14-TXT-12', 'INT'),
    ('INT-14-TXT-13', 'INT'),
    ('INT-14-TXT-14', 'INT'),
    ('INT-14-TXT-15', 'INT'),
    ('INT-14-TXT-16', 'INT'),
    ('INT-14-INP-01', 'INT'),
    ('INT-14-INP-02', 'INT'),
    ('INT-14-INP-03', 'INT'),
    ('INT-14-INP-04', 'INT'),
    ('INT-14-INP-05', 'INT'),
    ('INT-14-INP-06', 'INT'),
    ('INT-14-INP-07', 'INT'),
    ('INT-14-INP-08', 'INT'),
    ('INT-14-INP-09', 'INT'),
    ('INT-14-INP-10', 'INT'),
    ('INT-14-INP-11', 'INT'),
    ('INT-14-INP-12', 'INT'),
    ('INT-14-INP-13', 'INT'),
    ('INT-14-CMB-01', 'INT'),
    ('INT-14-CMB-02', 'INT'),
    ('INT-14-CMB-03', 'INT'),
    ('INT-14-CMB-04', 'INT'),
    ('INT-14-CMB-05', 'INT'),
    ('INT-14-CHK-01', 'INT'),
    ('INT-14-SPB-01', 'INT'),
    ('INT-14-SPB-02', 'INT'),
    ('INT-14-GRD-01', 'INT'),
    ('INT-14-BTN-01', 'INT'),
    ('INT-14-BTN-02', 'INT'),
    ('INT-14-BTN-03', 'INT'),
    ('INT-14-BTN-04', 'INT'),
    ('INT-15-TXT-01', 'INT'),
    ('INT-15-TXT-02', 'INT'),
    ('INT-15-TXT-03', 'INT'),
    ('INT-15-TXT-04', 'INT'),
    ('INT-15-TXT-05', 'INT'),
    ('INT-15-TXT-06', 'INT'),
    ('INT-15-TXT-07', 'INT'),
    ('INT-15-TXT-08', 'INT'),
    ('INT-15-TXT-09', 'INT'),
    ('INT-15-TXT-10', 'INT'),
    ('INT-15-TXT-11', 'INT'),
    ('INT-15-TXT-12', 'INT'),
    ('INT-15-TXT-13', 'INT'),
    ('INT-15-TXT-14', 'INT'),
    ('INT-15-TXT-15', 'INT'),
    ('INT-15-INP-01', 'INT'),
    ('INT-15-BTN-01', 'INT'),
    ('INT-15-BTN-02', 'INT'),
    ('INT-15-BTN-03', 'INT'),
    ('INT-15-BTN-04', 'INT'),
    ('INT-15-BTN-05', 'INT'),
    ('INT-15-MDL-01', 'INT'),
    ('INT-15-MDL-02', 'INT'),
    ('INT-16-TXT-01', 'INT'),
    ('INT-16-INP-01', 'INT'),
    ('INT-16-BTN-01', 'INT'),
    ('INT-16-BTN-02', 'INT'),
    ('INT-16-TBL-01', 'INT'),
    ('INT-16-BTN-03', 'INT'),
    ('INT-16-BTN-04', 'INT'),
    ('INT-16-BTN-05', 'INT'),
    ('INT-17-TXT-01', 'INT'),
    ('INT-17-TXT-02', 'INT'),
    ('INT-17-TXT-03', 'INT'),
    ('INT-17-TXT-04', 'INT'),
    ('INT-17-TXT-05', 'INT'),
    ('INT-17-TXT-06', 'INT'),
    ('INT-17-TXT-07', 'INT'),
    ('INT-17-TXT-08', 'INT'),
    ('INT-17-TXT-09', 'INT'),
    ('INT-17-TXT-10', 'INT'),
    ('INT-17-TXT-11', 'INT'),
    ('INT-17-TXT-12', 'INT'),
    ('INT-17-TXT-13', 'INT'),
    ('INT-17-TXT-14', 'INT'),
    ('INT-17-TXT-15', 'INT'),
    ('INT-17-INP-01', 'INT'),
    ('INT-17-BTN-01', 'INT'),
    ('INT-17-BTN-02', 'INT'),
    ('INT-17-BTN-03', 'INT'),
    ('INT-17-BTN-04', 'INT'),
    ('INT-17-BTN-05', 'INT'),
    ('INT-17-MDL-01', 'INT'),
    ('INT-17-MDL-02', 'INT'),
    ('INT-17-MDL-03', 'INT'),
    ('INT-18-MDL-01', 'INT'),
    ('INT-18-TXT-14', 'INT'),
    ('INT-18-TXT-15', 'INT'),
    ('INT-18-BTN-03', 'INT'),
    ('INT-18-BTN-04', 'INT'),
    ('INT-19-PNL-01', 'INT'),
    ('INT-19-BTN-01', 'INT'),
    ('INT-19-PNL-02', 'INT'),
    ('INT-19-PNL-03', 'INT'),
    ('INT-19-BTN-02', 'INT'),
    ('INT-19-TBL-01', 'INT'),
    ('INT-19-BTN-03', 'INT'),
    ('INT-19-PNL-04', 'INT'),
    ('INT-19-BTN-04', 'INT'),
    ('SDB-02', 'SDB'),
    ('INT-20-MOD-001', 'INT'),
    ('INT-20-TBL-001', 'INT'),
    ('INT-20-TXT-001', 'INT'),
    ('INT-20-TXT-002', 'INT'),
    ('INT-20-TXT-003', 'INT'),
    ('INT-20-TXT-004', 'INT'),
    ('INT-20-TXT-005', 'INT'),
    ('INT-20-TXT-006', 'INT'),
    ('INT-20-BTN-001', 'INT'),
    ('INT-20-BTN-002', 'INT'),
    ('INT-20-FUP-001', 'INT'),
    ('INT-21-MOD-001', 'INT'),
    ('INT-21-BTN-001', 'INT'),
    ('INT-21-BTN-002', 'INT'),
    ('INT-21-BTN-005', 'INT'),
    ('INT-21-BTN-006', 'INT'),
    ('INT-21-BTN-007', 'INT'),
    ('INT-21-BTN-008', 'INT'),
    ('INT-23-BTN-01', 'INT'),
    ('INT-22-MDL-01', 'INT'),
    ('INT-22-INP-01', 'INT'),
    ('INT-22-DPD-01', 'INT'),
    ('INT-22-INP-02', 'INT'),
    ('INT-22-CHK-01', 'INT'),
    ('INT-22-INP-03', 'INT'),
    ('INT-22-CHK-02', 'INT'),
    ('INT-22-CHK-03', 'INT'),
    ('INT-22-BTN-02', 'INT'),
    ('INT-22-TBL-01', 'INT'),
    ('INT-22-BTN-03', 'INT'),
    ('INT-22-BTN-04', 'INT'),
    ('INT-22-BTN-05', 'INT'),
    ('INT-22-BTN-01', 'INT'),
    ('INT-23-TXT-01', 'INT'),
    ('INT-23-INP-01', 'INT'),
    ('INT-23-DPD-01', 'INT'),
    ('INT-23-DPD-02', 'INT'),
    ('INT-23-BTN-03', 'INT'),
    ('INT-23-BTN-02', 'INT'),
    ('INT-23-TBL-01', 'INT'),
    ('INT-23-BTN-06', 'INT'),
    ('INT-23-BTN-05', 'INT'),
    ('INT-23-BTN-04', 'INT'),
    ('INT-24-MDL-01', 'INT'),
    ('INT-24-INP-01', 'INT'),
    ('INT-24-DPD-01', 'INT'),
    ('INT-24-INP-02', 'INT'),
    ('INT-24-CHK-01', 'INT'),
    ('INT-24-INP-03', 'INT'),
    ('INT-24-CHK-02', 'INT'),
    ('INT-24-CHK-03', 'INT'),
    ('INT-24-BTN-02', 'INT'),
    ('INT-24-TBL-01', 'INT'),
    ('INT-24-BTN-03', 'INT'),
    ('INT-24-BTN-04', 'INT'),
    ('INT-24-BTN-05', 'INT'),
    ('INT-24-BTN-01', 'INT'),
    ('INT-25-MDL-01', 'INT'),
    ('INT-25-TXT-01', 'INT'),
    ('INT-25-BTN-02', 'INT'),
    ('INT-25-BTN-03', 'INT'),
    ('INT-25-BTN-01', 'INT'),
    ('INT-26-PNL-01', 'INT'),
    ('INT-26-PNL-02', 'INT'),
    ('INT-26-PNL-03', 'INT'),
    ('INT-26-PNL-04', 'INT'),
    ('INT-26-TBL-01', 'INT'),
    ('INT-26-TBL-02', 'INT'),
    ('INT-26-TBL-03', 'INT'),
    ('INT-26-TBL-04', 'INT'),
    ('INT-027-IMG-01', 'INT'),
    ('INT-027-IMG-02', 'INT'),
    ('INT-027-IMG-03', 'INT'),
    ('INT-027-INP-01', 'INT'),
    ('INT-027-INP-02', 'INT'),
    ('INT-027-TXT-01', 'INT'),
    ('INT-027-TXT-02', 'INT'),
    ('INT-027-BTN-01', 'INT'),
    ('BTN-99', 'BTN'),
    ('INT-027', 'INT'),
    ('INT-100', 'INT'),
    ('INT-200', 'INT'),
    ('INT-300', 'INT'),
    ('INT-400', 'INT')
ON CONFLICT (codigo) DO NOTHING;

-- ============================================================
-- ILA-0001: Registro inicial de nuevo paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0001 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Registro inicial de nuevo paciente',
    '2026-06-13',
    'Vital',
    'Concluido',
    'Permite al recepcionista registrar nuevos pacientes dentro del sistema para su futura asignación de citas clínicas y gestión general, favoreciendo el la obtención de la información personal del paciente y como respaldo legal al aceptar el acta del consentimiento informado.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0001',
    'ESP-0001, ESP-0002',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Pacientes.
El usuario posee permisos para registrar nuevos pacientes.
El paciente no debe de existir previamente en la base de datos del sistema (validación por DNI/Documento de identidad) en la tabla “TABLE_PACIENTE”.',
    'El usuario ingresa al módulo de Gestión de Pacientes (INT-02) y hace clic en el botón Nuevo Registro (INT-02-BNT-03).
El sistema redirige al módulo de Registro de Nuevo Paciente (INT-01).
El usuario ingresa el DNI del paciente en el campo DNI (INT-01-INP-01). Este campo es obligatorio.
El usuario ingresa el nombre del paciente en el campo Nombres (INT-01-INP-02). Este campo es obligatorio.
El usuario ingresa los apellidos del paciente en el campo Apellidos (INT-01-INP-03). Este campo es obligatorio.
El usuario ingresa el teléfono del paciente en el campo Teléfono (INT-01-INP-04)
El usuario ingresa la fecha de nacimiento del paciente en el campo Fecha de nacimiento (INT-01-INP-05)
El usuario ingresa la dirección del paciente en el campo Dirección (INT-01-INP-06)
El usuario registra la aceptación del Consentimiento Informado en el checkbox Consentimiento Informado (INT-01-CHK-01).
El usuario hace clic en el botón Guardar (INT-01-BTN-01).
El sistema ejecuta validaciones estrictas. Verifica que no haya campos obligatorios vacíos (DNI, Nombres, Apellidos), no haya DNI duplicado, se haya aceptado el Consentimiento Firmado y se controla el uso de caracteres especiales.
Si la validación es correcta, el sistema almacena la información y confirma el registro exitoso, redirigiendo al módulo de Gestión de Pacientes (INT-02).
Si la validación es incorrecta, resalta los campos a corregir.',
    'El nuevo paciente queda registrado en el sistema en la tabla “TABLE_PACIENTE”.
El paciente se registra con un estado inicial Activo
El paciente queda habilitado para la asignación de citas clínicas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0001' AND av.version = '1.0.2' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-01', 'INT-01-INP-01', 'INT-01-INP-02', 'INT-01-INP-03', 'INT-01-INP-04', 'INT-01-INP-05', 'INT-01-INP-06', 'INT-01-CHK-01', 'BTN-01', 'BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0002: Consulta del perfil del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0002 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Consulta del perfil del paciente',
    '2026-06-13',
    'Vital',
    'Concluido',
    'El flujo prioriza la rapidez en la atención al cliente, permitiendo encontrar al paciente en pocos clics. Además, garantiza la lectura de datos incluso si el paciente está inactivo por cese o deceso (trazabilidad legal).',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0001',
    'ESP-0003, ESP-0004, ESP-0005',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Pacientes.
El usuario posee permisos para visualizar los pacientes del sistema.
El paciente debe de estar registrado en el sistema (tanto si tiene estado Activo o Inactivo/Archivo Histórico) en la tabla “TABLE_PACIENTE”.',
    'El usuario ingresa al módulo de "Gestión de Pacientes".
El usuario visualiza los registros de los pacientes del sistema en la tabla Grilla de Pacientes (INT-02-TBL-01).
El usuario se ubica en el campo Barra de Busqueda (INT-02-INP-01) e ingresa el parámetro de búsqueda (DNI, nombres o apellidos del paciente).
El sistema filtra en tiempo real y muestra los registros coincidentes de la búsqueda previa.
El usuario selecciona al paciente deseado.
El usuario hace clic en botón Ver Ficha (INT-02-BTN-02), siendo redirigido al módulo de Ficha del Paciente (INT-02-A).
El usuario hace clic en el botón Constancia (INT-02-BTN-01) para generar la constancia de atención del paciente.
El sistema emite el documento con respaldo legal listo para imprimirse o enviar.
El usuario hace clic en el botón Nuevo Registro (INT-02-BTN-03), siendo redirigido al módulo de Registro de Nuevo Paciente (INT-01).
El usuario puede visualizar toda la información personal del paciente (DNI, Nombres, Apellidos, Teléfono, Fecha de nacimiento, Dirección, Aceptó Consentimiento Firmado, Estado actual).
El usuario hace clic en el botón Editar Datos (INT-02-A-BTN-01), siendo redirigido al módulo Modificar Datos del Paciente (INT-03).
El usuario hace clic en el botón Archivar/Inactivar Paciente (INT-02-A-BTN-02), siendo redirigido al módulo Gestionar Estado del Paciente (INT-04).',
    'El usuario visualiza la información y/o emite los documentos requeridos
No se modifica ni altera ningún registro de la base de datos.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0002' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0002' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0002' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ILA-0002' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0002' AND av.version = '1.0.2' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-02', 'INT-02-INP-01', 'INT-02-TBL-01', 'INT-02-BTN-01', 'INT-02-BTN-02', 'INT-02-BTN-03', 'INT-02-A', 'INT-02-A-BTN-01', 'INT-02-A-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0003: Actualización de información del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0003 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Actualización de información del paciente',
    '2026-06-15',
    'Vital',
    'Concluido',
    'Permite al recepcionista mantener una actualización continua de información del paciente, siendo una operación crítica para mantener la precisión clínica y administrativa, especialmente ante cambios de contacto, evolución médica o correcciones registrales.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0003'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0001',
    'ESP-0006, ESP-0007',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Pacientes.
El usuario posee permisos para visualizar y editar registros de pacientes.
El paciente debe de estar registrado en el sistema (tanto si tiene estado Activo o Inactivo/Archivo Histórico) en la tabla “TABLE_PACIENTE”.',
    'El usuario ingresa al módulo de "Gestión de Pacientes".
El usuario visualiza los registros de los pacientes del sistema en la tabla Grilla de Pacientes (INT-02-TBL-01).
El usuario selecciona al paciente deseado.
El usuario hace clic en botón Ver Ficha (INT-02-BTN-02), siendo redirigido al módulo de Ficha del Paciente (INT-02-A).
El usuario hace clic en el botón Editar Datos (INT-02-A-BTN-01), siendo redirigido al módulo Modificar Datos del Paciente (INT-03).
El usuario puede modificar los nombres del paciente en el campo Nombres (INT-03-INP-01).
El usuario puede modificar los apellidos del paciente en el campo Apellidos (INT-03-INP-02).
El usuario puede modificar el teléfono del paciente en el campo Teléfono (INT-03-INP-03).
El usuario puede modificar la fecha de nacimiento del paciente en el campo Fecha de nacimiento (INT-03-INP-04).
El usuario puede modificar la dirección del paciente en el campo Dirección (INT-03-INP-05).
El usuario no puede modificar el DNI o la Aceptación del consentimiento informado.
El usuario hace clic en el botón Guardar Cambios (INT-03-BTN-01).
El sistema ejecuta validaciones estrictas verificando que no hayan campos obligatorios vacíos (Nombres, Apellidos) y consistencia de la información.
Si la validación es correcta, el sistema confirma la actualización exitosa, actualiza el registro de paciente, registra la fecha y usuario responsable del cambio, redirigiendo al módulo de Ficha del Paciente (INT-02-A).
Si la validación es incorrecta, resalta los campos a corregir.',
    'El registro del paciente queda actualizado en el sistema en la tabla “TABLE_PACIENTE”.
Se registra la fecha y usuario responsable del cambio del registro.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0003' AND av.version = '1.0.2' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-003', 'INT-003-INP-01', 'INT-003-INP-02', 'INT-003-INP-03', 'INT-003-INP-04', 'INT-003-INP-05', 'INT-003-BTN-01', 'INT-003-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0004: Baja lógica o archivado del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0004 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Baja lógica o archivado del paciente',
    '2026-06-15',
    'Vital',
    'Concluido',
    'Este procedimiento permite implementar una baja lógica y no un borrado físico, para la conservación documental exigida por normativas de salud.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0004'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0001',
    'ESP-0008, ESP-0009',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Pacientes.
El usuario posee permisos para visualizar y editar registros de pacientes.
El paciente debe de estar registrado en el sistema (tanto si tiene estado Activo o Inactivo/Archivo Histórico) en la tabla “TABLE_PACIENTE”.',
    'El usuario ingresa al módulo de "Gestión de Pacientes".
El usuario visualiza los registros de los pacientes del sistema en la tabla Grilla de Pacientes (INT-02-TBL-01).
El usuario selecciona al paciente deseado.
El usuario hace clic en botón Ver Ficha (INT-02-BTN-02), siendo redirigido al módulo de Ficha del Paciente (INT-02-A).
El usuario hace clic en el botón Archivar/Inactivar Paciente (INT-02-A-BTN-01), siendo redirigido al módulo Gestionar Estado del Paciente (INT-04).
El usuario selecciona el motivo del cambio de estado en el campo Motivo de cambio de estado (INT-01-DPD-01). Este campo es obligatorio.
El usuario ingresa las observaciones adicionales en el campo Observaciones adicionales (INT-01-INP-01).
El usuario no puede modificar el DNI, Nombre o Apellidos del paciente.
El usuario confirma la operación, haciendo clic en el botón Archivar/Inactivar Paciente (INT-04-BTN-01).
El sistema cambia el estado del paciente de Activo a Archivo Histórico / Inactivo o viceversa.
El sistema bloquea la programación de nuevas citas y mantiene disponible la consulta histórica del expediente.
El sistema registra fecha y usuario responsable de la acción, redirigiendo al módulo de Ficha del Paciente (INT-02-A).',
    'El registro del paciente queda actualizado en el sistema en la tabla “TABLE_PACIENTE” en el campo de estado.
Se registra la fecha y usuario responsable del cambio del registro.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0004' AND av.version = '1.0.2' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-004', 'INT-004-DPD-01', 'INT-004-INP-01', 'INT-003-BTN-01', 'INT-003-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0005: Registro inicial de nuevo paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0005 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Registro inicial de nuevo paciente',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Garantiza la atomicidad y consistencia en el agendamiento del itinerario de la clínica, impidiendo la duplicidad de horarios para un mismo fisioterapeuta en la base de datos transaccional.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0001',
    'ESP-0010',
    'El usuario ha iniciado sesión correctamente y cuenta con rol activo de Recepcionista (ACT-0003).
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente ya debe encontrarse registrado en el sistema para poder recuperar y enlazar de forma válida su identificador.',
    'El Recepcionista hace clic en el botón de nueva cita desde la bandeja de la agenda general (INT-06-BTN-03).
El sistema intercepta la petición y renderiza el formulario de Registro de Citas (INT-05).
Condicionalidad de Selección del Paciente: El actor selecciona o ingresa el dni del paciente en el buscador (INT-05-DPD-01), recuperando dinámicamente el código del paciente para enlazarlo de manera unívoca al registro de la cita.
Condicionalidad de Selección de Especialidad: El actor selecciona una opción en el dropdown de especialidades (INT-05-DPD-02). Al hacerlo, el sistema condiciona y filtra dinámicamente el siguiente selector para mostrar solo los profesionales de esa rama.
Establecimiento de Parámetros Temporales: El actor interactúa con el calendario (INT-05-INP-03) para definir la fecha (citaFecha) y selecciona el horario de inicio deseado (INT-05-INP-05) junto con la duración estándar en minutos (citaDuracion).
Condicionalidad de Asignación de Profesional: El actor selecciona el fisioterapeuta disponible en el dropdown (INT-05-DPD-04), capturando internamente su identificador fisioteraCod.
El actor hace clic en el botón "Guardar Cita" (INT-05-BTN-01).
Validaciones Estrictas del Sistema (Lógica de Negocio):
- El sistema verifica que no existan campos obligatorios vacíos (pacCod, fisioteraCod, citaFecha, citaHoraInicio).
- El sistema realiza una consulta transaccional instantánea para corroborar que el fisioteraCod no posea otra cita registrada en la misma combinación de fecha y hora (Validación de cruce de horarios).
Si las validaciones son correctas, el sistema almacena la información ejecutando una sentencia de inserción (INSERT INTO cita) con estado inicial "Programada" y redirige al usuario a la bandeja principal de la agenda.
Si la validación falla, el sistema aborta la inserción y despliega una alerta en pantalla mostrando el conflicto para su subsanación. (INT-05-TXT-02)
Si el actor desea abortar la operación presionara el botón Cancelar (INT-05-BTN-02), que lo redirigirá a la interfaz INT-06.',
    'Se inserta un nuevo registro de forma permanente en la tabla cita de la base de datos “OMVITAL_DB_PACIENTES”
El bloque horario seleccionado queda reservado y bloqueado para futuras consultas del fisioterapeuta asignado.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0005' AND av.version = '1.0.2' AND aa.codigo IN ('INT-05', 'INT-05-TXT-01', 'INT-05-TXT-02', 'INT-05-DPD-01', 'INT-05-DPD-02', 'INT-05-DPD-03', 'INT-05-DPD-04', 'INT-05-DPD-05', 'INT-05-BTN-01', 'INT-05-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0006: Consulta y visualización de la agenda de citas médicas
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0006 v1.0.2
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.2',
    'Consulta y visualización de la agenda de citas médicas',
    '2026-06-14',
    'Vital',
    'Concluido',
    'Permite centralizar la lectura del itinerario diario de la clínica. Los datos del paciente (pacCod) son de solo lectura y se enlazan desde el módulo externo administrado por el equipo paralelo.',
    act.id,
    ex.id,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
CROSS JOIN experto ex
WHERE a.codigo = 'ILA-0006' AND ex.codigo = 'EXP-001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0002',
    'ESP-0011',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista (ACT-0003).
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
Existe al menos un registro en la tabla cita.',
    'El Recepcionista hace clic en el botón de la barra lateral para ingresar al módulo de monitoreo.
El sistema intercepta la petición y renderiza la interfaz de la Bandeja de la Agenda (INT-06).
El sistema ejecuta una consulta automática (SELECT) a la tabla cita tomando como parámetro condicional por defecto la fecha actual del servidor (citaFecha).
El sistema carga y despliega el listado de citas programadas en la tabla (INT-06-TBL-01), ordenadas cronológicamente por el atributo citaHoraInicio.
Condicionalidad de filtros (Especialidad): El usuario puede seleccionar una opción en el selector de especialidades (INT-06-DPD-01). Si se selecciona, el sistema filtra dinámicamente el campo de profesionales (INT-06-DPD-02) para mostrar únicamente los fisioterapeutas pertenecientes a dicha rama.
Condicionalidad de filtros (Fisioterapeuta): El usuario puede refinar la búsqueda seleccionando un terapeuta específico (INT-06-DPD-02), lo que captura el identificador fisioteraCod para aislar su agenda.
Filtros Adicionales: El usuario puede seleccionar una fecha específica en el Date Picker (INT-06-INP-01) o un paciente enlazado en el buscador (INT-06-BTN-03).
Al pulsar el botón "Buscar" (INT-06-BTN-02), el sistema realiza un JOIN entre las tablas cita y fisioterapeuta usando el campo común fisioteraCod para procesar los filtros establecidos.
El sistema actualiza y muestra las citas coincidentes en la grilla (INT-06-TBL-01), visualizando de forma ordenada: Fecha (citaFecha), Hora (citaHoraInicio), Duración (citaDuracion), Paciente (nombre recuperado mediante el enlace pacCod), Especialidad y Fisioterapeuta Asignado.
El actor puede interactuar con el menú contextual de un registro (INT-06-BTN-06) para habilitar las acciones transaccionales de "Registrar Asistencia" (INT-06-BTN-07) o "Constancia de Asistencia" (INT-06-BTN-08).
(Flujos alternativos) El usuario puede pulsar en cualquier momento el botón "Nueva Cita" (INT-06-BTN-01), "Editar Cita" (INT-06-BTN-04) o "Eliminar Cita" (INT-06-BTN-05) para romper la consulta y navegar a sus respectivas interfaces de gestión',
    'El usuario visualiza la información filtrada y actualizada de la agenda en pantalla.
No se modifica ni altera ninguna información almacenada en las tablas de la base de datos durante este proceso de lectura.
Las citas listadas quedan disponibles para operaciones posteriores (como el proceso de Check-in).'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0006' AND av.version = '1.0.2'
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
WHERE a.codigo = 'ILA-0006' AND av.version = '1.0.2' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0006' AND av.version = '1.0.2' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0006' AND av.version = '1.0.2' AND f.codigo = 'FUE-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0006' AND av.version = '1.0.2' AND aa.codigo IN ('INT-06', 'INT-06-DPD-01', 'INT-06-DPD-02', 'INT-06-INP-01', 'INT-06-BTN-01', 'INT-06-BTN-02', 'INT-06-BTN-03', 'INT-06-BTN-04', 'INT-06-BTN-05', 'INT-06-BTN-06', 'INT-06-BTN-07', 'INT-06-BTN-08', 'INT-06-TBL-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0007: Modificación y reprogramación de citas médicas
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0007 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Modificación y reprogramación de citas médicas',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Permite la reprogramación ágil de turnos para optimizar la ocupación de la agenda transaccional sin intervenir en datos clínicos de evolución ni estados financieros de penalidades.',
    act.id,
    ex.id,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
CROSS JOIN experto ex
WHERE a.codigo = 'ILA-0007' AND ex.codigo = 'EXP-001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0002',
    'ESP-0012',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista (ACT-0003).
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
La cita seleccionada debe existir en la tabla cita con el estado ''Programada''.',
    'El Recepcionista selecciona una cita específica desde la tabla de la agenda (INT-06-TBL-01) en la pantalla de consulta principal (INT-06).
El actor hace clic en el botón EDITAR (INT-06-BTN-04) asociado al registro seleccionado dentro de la grilla.
El sistema intercepta la petición, recupera los datos transaccionales actuales de la fila e inicializa y renderiza la interfaz modal de Modificación de Cita (INT-07).
El sistema bloquea para edición el buscador del paciente (INT-07-DPD-01), mostrando el código original (pacCod) de forma estática para mantener la integridad referencial del enlace.
Condicionalidad de Selección de Especialidad: El usuario puede modificar la especialidad de la atención en el selector (INT-07-DPD-02). Si se altera, el sistema actualiza dinámicamente el listado del paso siguiente.
Condicionalidad de Selección de Fisioterapeuta: El usuario selecciona el nuevo terapeuta deseado (INT-07-DPD-04), capturando su identificador único (fisioteraCod).
Modificación Temporal: El usuario interactúa con el Date Picker (INT-07-DPD-03) para definir la nueva fecha (citaFecha) y selecciona el bloque de tiempo disponible en el Grid de horarios (INT-07-DPD-05) para actualizar citaHoraInicio
El usuario hace clic en el botón "Guardar" (INT-07-BTN-01).
Persistencia de Datos: Si la validación es correcta, el sistema ejecuta una sentencia de actualización (UPDATE) en la tabla cita, modificando únicamente los campos de tiempo y asignación (citaFecha, citaHoraInicio, fisioteraCod), registra la auditoría del cambio, cierra el modal y redirige a la bandeja principal (INT-06)
(Flujo alternativo) Si el horario seleccionado ya se encuentra ocupado por otro paciente, el sistema aborta el UPDATE y renderiza una alerta flotante de error en pantalla (INT-07-TXT-02) detallando el conflicto',
    'El sistema actualiza de forma permanente los atributos correspondientes del registro de la cita en la base de datos OMVITAL_DB_PACIENTES.
El bloque de tiempo previamente reservado se libera automáticamente en la base de datos y el nuevo horario seleccionado queda bloqueado para el fisioterapeuta asignado.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0007' AND av.version = '1.0.1'
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
WHERE a.codigo = 'ILA-0007' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0007' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0007' AND av.version = '1.0.1' AND f.codigo = 'FUE-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0007' AND av.version = '1.0.1' AND aa.codigo IN ('INT-07', 'INT-07-TXT-01', 'INT-07-TXT-02', 'INT-07-DPD-01', 'INT-07-DPD-02', 'INT-07-DPD-03', 'INT-07-DPD-04', 'INT-07-DPD-05', 'INT-07-BTN-01', 'INT-07-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0008: Cancelación de una cita
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0008 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Cancelación de una cita',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Cumple con la normativa de permitir cancelar citas programadas con confirmación previa y mediante eliminación lógica, evitando borrar asistencias pasadas o inconsistencias con el área financiera. Permite gestionar la regla de negocio que indica cancelaciones con al menos 6 horas de anticipación.',
    act.id,
    ex.id,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
CROSS JOIN experto ex
WHERE a.codigo = 'ILA-0008' AND ex.codigo = 'EXP-001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0002',
    'ESP-0013',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista (ACT-0003).
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
La cita seleccionada debe existir en la tabla cita con el estado ''Programada''.',
    'El Recepcionista selecciona una cita específica desde la tabla de la agenda (INT-06-TBL-01) en la pantalla de consulta.
El actor hace clic en el botón ELIMINAR CITA (INT-06-BTN-04) asociado al registro seleccionado.
El sistema intercepta la petición, recupera los datos actuales de la fila (pacCod, citaFecha, citaHoraInicio) y renderiza la interfaz modal de Confirmación de Anulación (INT-08)
El sistema muestra de forma estática una advertencia para la confirmación de la cancelación de la cita (INT-08-TXT-02)
El sistema muestra de forma estática y de solo lectura los detalles de la cita para garantizar que el actor esté cancelando el registro correcto (INT-08-TXT-02).
El usuario selecciona o ingresa el motivo de la cancelación en el campo obligatorio (INT-08-INP-01) para mantener la trazabilidad de la operación.
El usuario hace clic en el botón "Confirmar Anulación" (INT-08-BTN-01).
El sistema ejecuta una sentencia de actualización (UPDATE) en la tabla cita, cambiando el estado del registro a "Cancelada" (eliminación lógica) y guardando la fecha de la operación.
El sistema cierra la interfaz modal, libera la disponibilidad del horario en la base de datos y redirige al usuario de vuelta a la bandeja principal de la agenda (INT-06), la cual se actualiza automáticamente
En caso de que el actor quiera cancelar la operación presionara el botón CANCELAR (INT-08-BTN-01) que cancelara el proceso y lo llevara a la interfaz (INT-06).',
    'El sistema actualiza el estado de la cita a "Cancelada" en la base de datos “OMVITAL_DB_PACIENTES”.
No se realiza ningún borrado físico (DELETE) del registro, garantizando la persistencia del historial para auditorías.
El bloque de tiempo previamente ocupado queda liberado para poder agendar nuevas citas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0008' AND av.version = '1.0.1'
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
WHERE a.codigo = 'ILA-0008' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ILA-0008' AND av.version = '1.0.1' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0008' AND av.version = '1.0.1' AND f.codigo = 'FUE-0005'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0008' AND av.version = '1.0.1' AND aa.codigo IN ('INT-08', 'INT-08-TXT-01', 'INT-08-TXT-02', 'INT-08-INP-01', 'INT-08-BTN-01', 'INT-08-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0009: Registro de Seguimiento Clínico
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0009 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registro de Seguimiento Clínico',
    '2026-06-14',
    'Opcional',
    'Concluido',
    'Permite registrar indicadores clínicos de seguimiento antes de cada sesión terapéutica, facilitando la evaluación continua del progreso del paciente.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0005',
    'ESP-0014',
    'El usuario inicia sesión.
El usuario cuenta con rol y permisos.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario tiene permisos para modificar la tabla “SEGUIMIENTO_CLINICO”
El paciente se encuentra registrado en el sistema.
El paciente posee una cita activa en el Panel de Turno.
El usuario se encuentra en la interfaz Panel de Turno (INT-019).',
    'El usuario se encuentra en la INT-019
El usuario selecciona un paciente.
El usuario presiona BOTON REGISTRAR SEGUIMIENTO “INT-021-BTN-003”
El sistema muestra la información básica del paciente.
El usuario registra el valor EVA del paciente.
El usuario registra el nivel de fuerza.
El usuario registra el nivel de movilidad.
El usuario registra el nivel de resistencia.
El usuario selecciona Guardar Seguimiento (INT-009-BTN-01).
El sistema valida que todos los campos obligatorios hayan sido completados.
El sistema almacena la evaluación clínica en la base de datos.
El sistema confirma el registro exitoso del seguimiento.',
    'La evaluación de seguimiento queda registrada en el sistema.
La información queda disponible para futuras consultas.
Los datos podrán ser utilizados para la generación de gráficos de evolución.
El registro queda asociado al historial del paciente.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0009' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0009' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0009'
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
WHERE a.codigo = 'ILA-0009' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0009' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0009' AND av.version = '1.0.0' AND aa.codigo IN ('INT-021-BTN-003', 'INT-009-BTN-01', 'INT-009-IMG-01', 'INT-009-PNL-01', 'INT-009-DPD-01', 'INT-009-DTP-01', 'INT-009-CMB-01', 'INT-009-CMB-02', 'INT-009-CMB-03', 'INT-009-CMB-04', 'INT-009-IMP-01', 'INT-009-BTN-02', 'INT-009-BTN-03')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0010: Dashboard de Seguimiento Clínico
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0010 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Dashboard de Seguimiento Clínico',
    '2026-06-14',
    'Opcional',
    'Concluido',
    'Permite visualizar la evolución clínica del paciente mediante indicadores gráficos y registros históricos, facilitando el seguimiento terapéutico.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0010'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0005',
    'ESP-0015',
    'El usuario inició sesión correctamente.
El usuario cuenta con rol y permisos activos.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente posee registros de seguimiento clínico almacenados.
El sistema dispone de acceso a la información clínica almacenada.',
    'El usuario accede a la interfaz Panel de Turno.
El sistema muestra los pacientes asignados.
El usuario selecciona un paciente.
El usuario hace clic en el botón Ver Progreso (INT-019-BTN-01).
El sistema despliega la interfaz Visualización de Seguimiento Clínico (INT-010).
El sistema recupera el historial de seguimientos asociados al paciente.
El sistema genera el gráfico de evolución EVA.
El sistema genera el gráfico de evolución de movilidad.
El sistema genera el gráfico de evolución de fuerza.
El sistema genera el gráfico de evolución de resistencia.
El sistema muestra la tabla histórica de evaluaciones registradas.
El usuario analiza la evolución clínica del paciente.
El usuario puede generar un reporte PDF mediante el botón Generar Reporte.
El usuario puede exportar la información mediante el botón Exportar Evolución.',
    'El usuario visualiza la evolución clínica consolidada del paciente.
Los indicadores clínicos se muestran mediante gráficos y tablas.
El sistema permite generar reportes clínicos.
No se modifica información durante la consulta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0010' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ILA-0010' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0009'
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
WHERE a.codigo = 'ILA-0010' AND av.version = '2.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0010' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0010' AND av.version = '2.0.0' AND aa.codigo IN ('INT-021-BTN-04', 'INT-010-PNL-01', 'INT-010-BTN-01', 'INT-010-IMG-01', 'INT-010-GRD-01', 'INT-010-GRD-02', 'INT-010-GRD-03', 'INT-010-GRD-04', 'INT-010-TBL-01', 'INT-010-BTN-02', 'INT-010-BTN-03')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0011: Consulta y gestión de historias clínicas y selección de evaluación inicial
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0011 v3.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '3.0.0',
    'Consulta y gestión de historias clínicas y selección de evaluación inicial',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta gestionar las historias clínicas desde la interfaz INT-12, realizando búsquedas, consulta de fichas iniciales, visualización del historial clínico completo, actualización controlada y adición de nuevos registros. Cuando el paciente no tiene una evaluación inicial, el sistema muestra el modal INT-12-A para que el fisioterapeuta seleccione exclusivamente una evaluación traumatológica o una evaluación geronto-psicomotriz. Una vez registrada la ficha, los accesos posteriores redirigen directamente a la interfaz correspondiente. El flujo mantiene la vinculación con el paciente y la trazabilidad de la información clínica en OMVITAL_DB_PACIENTES, sin permitir el borrado permanente de registros.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0006',
    'ESP-0016',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos ACT-0001 (Fisioterapeuta).
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
Existen pacientes registrados en la tabla paciente y disponibles para consulta desde el directorio de historias clínicas.
El sistema puede consultar la relación entre paciente, historial_clinico y evaluacion_inicial para determinar si el paciente ya cuenta con una evaluación inicial registrada.
El usuario se encuentra en la interfaz INT-12 Gestión de Historias Clínicas, vinculada a la educción EDU-0006.
Los registros clínicos no se encuentran bloqueados por cierre administrativo ni anulados sin autorización.',
    'El Fisioterapeuta accede al módulo Historiales Clínicos mediante el botón Historiales Clínicos (BTN-03).
El sistema muestra la interfaz Gestión de Historias Clínicas, identificada por el título principal (INT-12-TXT-01).
El usuario ingresa el criterio de búsqueda del paciente en el campo de búsqueda (INT-12-INP-01).
Si necesita reiniciar los filtros de consulta, el usuario utiliza el botón Limpiar (INT-12-BTN-01).
El usuario ejecuta la búsqueda mediante el botón Buscar (INT-12-BTN-02).
El sistema presenta los pacientes encontrados en la tabla de historias clínicas (INT-12-TBL-01).
El usuario revisa la información básica del paciente dentro de la tabla de resultados (INT-12-TBL-01).
Si requiere consultar la evaluación inicial del paciente, el usuario selecciona el botón Ver Ficha (INT-12-BTN-03).
El sistema identifica al paciente seleccionado y verifica en la tabla evaluacion_inicial si existe una ficha de evaluación inicial asociada a su historial clínico.
Si ya existe una evaluación inicial, el sistema consulta el tipo de evaluación registrada y redirige directamente a la ficha correspondiente: evaluación traumatológica (INT-13) o evaluación geronto-psicomotriz (INT-14).
Si no existe una evaluación inicial, el sistema despliega el modal Evaluación Inicial (INT-12-A-MDL-01).
El usuario revisa el mensaje de selección mostrado en el modal (INT-12-A-TXT-01) y elige una sola alternativa de evaluación inicial.
Si el usuario selecciona Evaluación Geronto-Psicomotriz, el sistema utiliza el botón correspondiente (INT-12-A-BTN-02) y redirige a la interfaz INT-10.
Si el usuario selecciona Evaluación Traumatológica, el sistema utiliza el botón correspondiente (INT-12-A-BTN-03) y redirige a la interfaz INT-09.
El sistema impide registrar ambas modalidades como evaluación inicial del mismo paciente; el tipo elegido se consolida cuando la ficha correspondiente es guardada.
Si requiere rectificar información asociada a una ficha existente, el usuario utiliza el control Editar Ficha (INT-12-BTN-04).
Si requiere revisar el historial clínico completo del paciente, el usuario selecciona el botón Ver Historial (INT-12-BTN-05).
El sistema muestra los registros clínicos asociados al paciente, incluyendo sesiones, notas de evolución, tratamientos aplicados y observaciones, en la vista de detalle del historial (INT-11-TXT-01).
Si requiere añadir un nuevo registro clínico, el usuario selecciona el botón Agregar + (INT-12-BTN-06).
El sistema redirige a la sección Sesión de Paciente para registrar una nueva sesión, nota de evolución o tratamiento, manteniendo asociado el paciente seleccionado.
Si existen más resultados, el usuario navega entre páginas mediante los controles de paginación de la tabla (INT-12-TBL-01).
El sistema valida que la acción solicitada corresponda a un paciente registrado y a un usuario con rol autorizado.
El sistema registra la consulta, actualización o adición realizada en la base de datos “OMVITAL_DB_PACIENTES”, manteniendo la trazabilidad clínica.
El sistema mantiene la información clínica disponible para consulta posterior, actualización controlada, archivado o anulación justificada, sin permitir el borrado permanente.',
    'El listado de historias clínicas queda disponible para búsqueda y consulta por el fisioterapeuta autorizado.
La evaluación inicial consultada queda asociada al paciente seleccionado y se muestra directamente según su tipo cuando ya existe un registro.
Cuando no existe una ficha previa, el fisioterapeuta puede seleccionar una única modalidad: evaluación traumatológica o evaluación geronto-psicomotriz.
El historial clínico completo, sus sesiones, notas de evolución y tratamientos asociados quedan disponibles para seguimiento clínico.
Las acciones realizadas quedan almacenadas en la base de datos “OMVITAL_DB_PACIENTES” con trazabilidad y sin eliminación permanente de información clínica.
El registro queda disponible para actualización controlada, archivado, anulación justificada y generación de reportes posteriores.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0011' AND av.version = '3.0.0'
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
WHERE a.codigo = 'ILA-0011' AND av.version = '3.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ILA-0011' AND av.version = '3.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0011' AND av.version = '3.0.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0011' AND av.version = '3.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-12-TXT-01', 'INT-12-INP-01', 'INT-12-BTN-01', 'INT-12-BTN-02', 'INT-12-TBL-01', 'INT-12-BTN-03', 'INT-12-BTN-04', 'INT-12-BTN-05', 'INT-12-BTN-06', 'INT-12-A-MDL-01', 'INT-12-A-TXT-01', 'INT-12-A-BTN-02', 'INT-12-A-BTN-03', 'INT-13', 'INT-14')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0012: Consulta de Historial Clínico del Paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0012 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Consulta de Historial Clínico del Paciente',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta con rol ACT-0001 consultar el historial clínico detallado de un paciente desde la interfaz INT-11. La ilación integra la visualización de información del paciente, sesiones, observaciones y tratamientos, así como la aplicación de filtros, la creación de una nueva sesión, la actualización controlada de notas y la exportación del historial. La consulta se sustenta en las tablas paciente, historial_clinico, sesion, notas_sesion y fisioterapeuta de la base de datos omvital_db_pacients, asegurando trazabilidad y protección de la información clínica.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0006',
    'ESP-0017',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos ACT-0001 (Fisioterapeuta) para consultar información clínica del paciente y ejecutar las acciones autorizadas.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”.
El paciente seleccionado se encuentra registrado en la tabla paciente y posee una historia clínica asociada en la tabla historial_clinico.
El usuario se encuentra en la interfaz INT-11 Gestión de Historias Clínicas, vinculada a la educción EDU-0006.
Las sesiones y notas que se consultarán se encuentran disponibles en las tablas sesion y notas_sesion, vinculadas al paciente y al fisioterapeuta responsable.
La historia clínica no se encuentra anulada, archivada o bloqueada para el rol ACT-0001.',
    'El Fisioterapeuta ingresa al sistema con el rol ACT-0001 y accede al módulo Historiales Clínicos mediante el botón Historiales Clínicos (BTN-03).
El sistema muestra la interfaz Gestión de Historias Clínicas, identificada por el título principal (INT-11-TXT-01).
El sistema recupera el paciente seleccionado desde la tabla paciente y verifica su relación con la tabla historial_clinico.
El usuario visualiza el resumen del paciente en la tarjeta de identificación, que incluye nombre, edad, sesiones completadas, diagnóstico y última sesión (INT-11-TXT-02, INT-11-TXT-03).
El sistema recupera las sesiones vinculadas desde la tabla sesion y las notas registradas desde la tabla notas_sesion.
El sistema presenta las sesiones ordenadas en la línea de tiempo mediante las tarjetas de sesión (INT-11-TXT-04).
El usuario revisa el detalle de observaciones o tratamientos registrados en cada tarjeta del historial (INT-11-TXT-05).
El usuario verifica la fecha de última modificación del registro clínico mostrado (INT-11-TXT-06).
Si requiere limitar los registros visualizados, el usuario selecciona el botón Filtros (INT-11-BTN-02).
El sistema aplica el criterio seleccionado y actualiza la línea de tiempo con las sesiones que cumplen la condición indicada.
Si requiere registrar una atención adicional, el usuario selecciona el botón Nueva Sesión + (INT-11-BTN-01).
El sistema direcciona al registro de sesión correspondiente, manteniendo la asociación entre paciente, historial clínico, sesión y fisioterapeuta responsable.
Si requiere corregir una nota u observación permitida, el usuario utiliza el control Editar de la tarjeta de sesión (INT-11-BTN-03).
El sistema valida la autorización del rol ACT-0001 antes de permitir la actualización y conserva la trazabilidad de la modificación.
Si requiere un respaldo documental, el usuario selecciona el botón Exportar (INT-11-BTN-03).
El sistema genera el documento solicitado a partir del historial consultado, sin alterar los registros almacenados.
El sistema registra la consulta, los filtros aplicados y las actualizaciones autorizadas, preservando la integridad de los datos clínicos en “OMVITAL_DB_PACIENTES”.',
    'El historial clínico del paciente queda disponible para consulta por el fisioterapeuta autorizado.
Las sesiones y notas clínicas visualizadas permanecen vinculadas al paciente mediante las tablas historial_clinico, sesion y notas_sesion.
Las actualizaciones autorizadas quedan registradas con trazabilidad, sin eliminación permanente de información clínica.
Si se crea una nueva sesión, esta queda asociada al paciente, al historial clínico y al fisioterapeuta responsable.
Si se genera una exportación, se obtiene un respaldo documental del historial sin modificar los datos originales.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0012' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ILA-0012' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ILA-0012' AND av.version = '2.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0012' AND av.version = '2.0.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0012' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-11-TXT-01', 'INT-11-BTN-01', 'INT-11-BTN-02', 'INT-11-BTN-03', 'INT-11-IMG-04', 'INT-11-TXT-02', 'INT-11-TXT-03', 'INT-11-TXT-04', 'INT-11-TXT-05', 'INT-11-TXT-06')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0013: Creación de Ficha de Evaluación Traumatológica
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0013 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Creación de Ficha de Evaluación Traumatológica',
    '2026-06-16',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta con rol ACT-0001 registrar la ficha de evaluación traumatológica del paciente dentro del registro clínico integral. La ilación cubre la captura de datos médicos, dolor, zona de aplicación, agentes terapéuticos, anamnesis, inspección clínica, cicatriz, palpación, movilidad, fuerza, pruebas especiales, evaluación funcional, evaluación neurológica, impresión fisioterapéutica, objetivos, plan de tratamiento y signos de alarma, manteniendo trazabilidad clínica en la base de datos',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0013'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0006',
    'ESP-0018',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos ACT-0001 (Fisioterapeuta) para crear, editar, guardar como borrador, finalizar y generar la ficha clínica del paciente.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente se encuentra registrado en el sistema y seleccionado dentro de una sesión clínica activa.
El usuario se encuentra en la interfaz INT-13 Crear de Evaluación Inicial, vinculada a la educción EDU-0006.
El registro clínico del paciente no se encuentra archivado, anulado ni bloqueado por cierre administrativo.
El sistema dispone de los componentes de la interfaz INT-13 para registrar dolor, zona de aplicación, datos médicos de derivación, agentes, anamnesis, inspección, movilidad, fuerza, pruebas diagnósticas, evaluación funcional, evaluación neurológica, impresión fisioterapéutica, objetivos, plan de tratamiento, signos de alarma y firma digital.',
    'El Fisioterapeuta ingresa al sistema con el rol ACT-0001 y accede al módulo Sesión de Paciente mediante el botón Sesión de Paciente (BTN-02).
El sistema muestra la interfaz Crear de Evaluación Inicial, identificada por el título principal (INT-13-TXT-01).
El usuario verifica la información inicial en el bloque Datos del Paciente (INT-13-TXT-03), incluyendo paciente, sesión y fisioterapeuta responsable.
El usuario registra la fecha y hora de inicio de la atención en los campos superiores Fecha (INT-13-TXT-09) y Hora Inicio (INT-13-TXT-10).
El usuario llena la sección Evaluación inicial del Dolor (INT-13-TXT-11), registrando la escala EVA y el motivo de la sesión.
El usuario llena la sección Protocolo Terapéutico (INT-13-TXT-12), seleccionando el protocolo desde el selector correspondiente (INT-13-CMB-01).
Si corresponde, el usuario reutiliza el protocolo anterior mediante el botón Repetir Protocolo (INT-13-BTN-01).
El usuario llena la sección Zona de Aplicación (INT-13-TXT-02), indicando la zona corporal evaluada o intervenida.
El usuario llena la sección Datos Médicos de Derivación (INT-13-TXT-14), registrando la información clínica de derivación en los campos correspondientes (INT-13-INP-02).
El usuario llena la sección Agentes (INT-13-TXT-13) y, si aplica, agrega tratamientos mediante el botón Agregar Tratamiento (INT-13-BTN-05).
El sistema muestra los tratamientos agregados en la tabla de agentes o tratamientos (INT-13-TBL-01); si no existen registros, mantiene el mensaje informativo correspondiente (INT-13-MSG-01).
El usuario llena la sección Anamnesis Breve utilizando los campos numéricos de tiempo de evolución (INT-13-SPB-02) y los selectores clínicos de la sección (INT-13-CMB-03).
El usuario llena la sección Inspección Clínica mediante los selectores de estado general de la zona y ayuda externa (INT-13-CMB-04).
El usuario llena la sección Cicatriz Quirúrgica, indicando si aplica mediante el control de selección correspondiente (INT-13-CHK-03).
El usuario llena la sección Palpación, registrando los hallazgos y la zona dolorosa principal mediante los campos clínicos correspondientes (INT-13-INP-03).
El usuario llena la sección Movilidad Articular, registrando movilidad activa, pasiva, dolor y observaciones; la presencia de dolor se marca mediante el control Dolor (INT-13-CHK-01).
El usuario llena la sección Fuerza Muscular, registrando la escala de fuerza mediante el control Escala (INT-13-SPB-01) y la presencia de dolor mediante el control asociado (INT-13-CHK-02).
El usuario llena la sección Pruebas Especiales / Diagnósticas, registrando las pruebas aplicadas y sus resultados en los campos de pruebas (INT-13-INP-04).
El usuario llena la sección Evaluación Funcional Rápida mediante los selectores de función afectada y nivel funcional actual (INT-13-CMB-03).
El usuario llena la sección Neurológica Básica, indicando si aplica mediante el control correspondiente (INT-13-CHK-03) y registrando la observación clínica.
El usuario llena la sección Impresión Fisioterapéutica, registrando problemas principales y diagnóstico fisioterapéutico funcional en los campos de texto clínico (INT-13-INP-03).
El usuario llena las secciones Objetivos Iniciales, Plan de Tratamiento y Signos de Alarma / Derivación, usando los selectores clínicos correspondientes al plan y signos de alerta (INT-13-CMB-05).
El usuario registra la firma digital en el área Firma Digital (INT-13-BTN-01), si corresponde.
El usuario selecciona la acción final según corresponda: Guardar como borrador (INT-13-BTN-02), Guardar sesión (INT-13-BTN-04) o Cancelar (INT-13-BTN-03).
El sistema valida que los campos obligatorios de la ficha hayan sido completados correctamente.
El sistema almacena la información clínica de la evaluación traumatológica en la base de datos “OMVITAL_DB_PACIENTES”
El sistema deja la ficha asociada al historial clínico del paciente para consulta, actualización, generación de reporte y seguimiento posterior.',
    'La ficha de evaluación traumatológica queda registrada en el sistema y asociada al paciente evaluado.
Los datos médicos de derivación, anamnesis, dolor, zona de aplicación, agentes, inspección clínica, movilidad articular, fuerza muscular, pruebas diagnósticas, evaluación funcional, evaluación neurológica, impresión fisioterapéutica, objetivos, plan de tratamiento, signos de alarma y firma quedan almacenados en la base de datos “OMVITAL_DB_PACIENTES”
El registro queda disponible para consulta dentro del historial clínico del paciente por usuarios con rol autorizado.
La información queda protegida por trazabilidad clínica, permitiendo corrección o anulación justificada sin eliminación permanente.
El sistema conserva el estado de la ficha como borrador, guardada o finalizada según la acción ejecutada por el fisioterapeuta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0013' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0013' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ILA-0013' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0013' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0013' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-13-TXT-01', 'INT-13-TXT-02', 'INT-13-TXT-03', 'INT-13-TXT-04', 'INT-13-TXT-05', 'INT-13-TXT-06', 'INT-13-TXT-08', 'INT-13-TXT-09', 'INT-13-TXT-10', 'INT-13-TXT-11', 'INT-13-TXT-12', 'INT-13-TXT-13', 'INT-13-TXT-14', 'INT-13-TXT-15', 'INT-13-TXT-16', 'INT-13-INP-01', 'INT-13-INP-02', 'INT-13-INP-03', 'INT-13-INP-04', 'INT-13-INP-05', 'INT-13-CMB-01', 'INT-13-CMB-02', 'INT-13-CMB-03', 'INT-13-CMB-04', 'INT-13-CMB-05', 'INT-13-CHK-01', 'INT-13-CHK-02', 'INT-13-CHK-03', 'INT-13-SPB-01', 'INT-13-SPB-02', 'INT-13-TBL-01', 'INT-13-GRD-01', 'INT-13-BTN-01', 'INT-13-BTN-02', 'INT-13-BTN-03', 'INT-13-BTN-04', 'INT-13-BTN-05', 'INT-13-MSG-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0014: Creación de Ficha de Evaluación Geronto-Psicomotriz
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0014 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Creación de Ficha de Evaluación Geronto-Psicomotriz',
    '2026-06-15',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta con rol ACT-0001 registrar la ficha de evaluación geronto-psicomotriz del paciente dentro del registro clínico integral. La ilación cubre la captura de datos generales, motivo de atención, estado funcional, dolor, evaluación de marcha, equilibrio y riesgo de caídas, movilidad y fuerza funcional, coordinación y psicomotricidad, área cognitiva básica, área emocional-social, impresión geronto-psicomotriz, objetivos de intervención, plan de tratamiento y signos de alerta, manteniendo trazabilidad clínica en la base de datos.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0014'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0006',
    'ESP-0019',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos ACT-0001 (Fisioterapeuta) para crear, editar, guardar como borrador, finalizar y generar la ficha clínica geronto-psicomotriz del paciente.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente adulto mayor se encuentra registrado en el sistema y seleccionado dentro de una sesión clínica activa.
El usuario se encuentra en la interfaz INT-14 Crear de Evaluación Geronto-Psicomotriz, vinculada a la educción EDU-0006.
El registro clínico del paciente no se encuentra archivado, anulado ni bloqueado por cierre administrativo.
El sistema dispone de los componentes de la interfaz INT-14 para registrar datos generales, motivo de atención, estado funcional, dolor, marcha, equilibrio, movilidad, fuerza funcional, coordinación, área cognitiva, área emocional-social, impresión geronto-psicomotriz, objetivos, plan de tratamiento, signos de alerta, profesional evaluador y firma digital.',
    'El Fisioterapeuta ingresa al sistema con el rol ACT-0001 y accede al módulo Sesión de Paciente mediante el botón Sesión de Paciente (BTN-02).
El sistema muestra la interfaz Crear de Evaluación Geronto-Psicomotriz, identificada por el título principal (INT-14-TXT-01).
El usuario verifica la información inicial del adulto mayor en el bloque Datos del paciente, usando los campos de identificación y contacto correspondientes (INT-14-INP-03, INT-14-INP-04).
El usuario registra la fecha y hora de inicio de la evaluación en los campos superiores Fecha y Hora Inicio (INT-14-INP-01, INT-14-INP-02).
El usuario llena la sección Datos Generales, registrando convivencia, ocupación, diagnóstico principal y antecedentes mediante los selectores y campos clínicos correspondientes (INT-14-CMB-01, INT-14-INP-05).
El usuario indica si existe medicación actual en la sección Datos Generales mediante el control Sí/No y, si corresponde, escribe el detalle de la medicación (INT-14-CHK-01, INT-14-INP-05).
El usuario llena la sección Motivo de Atención Geronto-Psicomotriz, seleccionando el objetivo principal de atención y registrando el tiempo de evolución del problema (INT-14-CMB-03, INT-14-SPB-01).
El usuario llena la sección Estado Funcional Actual, registrando nivel de independencia, actividades afectadas y uso de ayuda externa mediante los selectores de la sección (INT-14-CMB-04, INT-14-INP-06).
El usuario llena la sección Dolor / Molestia Física, registrando el dolor actual en la escala EVA y seleccionando zona de dolor y condiciones de aparición (INT-14-GRD-01, INT-14-CMB-02).
El usuario llena la sección Evaluación de Marcha, registrando tipo de marcha, observación clínica y riesgo durante la marcha (INT-14-INP-08, INT-14-CMB-05).
El usuario llena la sección Equilibrio y Riesgo de Caídas, registrando antecedentes de caídas, miedo a caer, equilibrio, apoyo monopodal, Romberg y prueba Timed Up and Go - TUG (INT-14-CHK-01, INT-14-SPB-02, INT-14-CMB-05).
El usuario llena la sección Movilidad y Fuerza Funcional, registrando movilidad general, transferencias, fuerza funcional y prueba de sentarse y levantarse 5 veces (INT-14-TXT-08, INT-14-CMB-03).
El usuario llena la sección Coordinación y Psicomotricidad, seleccionando coordinación gruesa, coordinación fina, lateralidad, esquema corporal, orientación espacial, orientación temporal y ritmo o secuencia motora (INT-14-TXT-12, INT-14-CMB-03).
El usuario llena la sección Área Cognitiva Básica, registrando estado de alerta, orientación, memoria inmediata, comprensión de órdenes simples y atención durante la sesión (INT-14-TXT-14, INT-14-CMB-04).
El usuario llena la sección Área Emocional y Social, registrando estado emocional observado, participación social y motivación para la terapia (INT-14-TXT-09, INT-14-CMB-03).
El usuario llena la sección Impresión Geronto-Psicomotriz, seleccionando los principales hallazgos y redactando la impresión funcional del paciente (INT-14-TXT-10, INT-14-INP-12).
El usuario llena la sección Objetivos de Intervención, seleccionando los objetivos terapéuticos y redactando el objetivo principal (INT-14-TXT-15, INT-14-INP-13).
El usuario llena la sección Plan de Tratamiento, registrando frecuencia sugerida, intervención inicial, número estimado de sesiones e indicaciones domiciliarias (INT-14-TXT-11, INT-14-SPB-01, INT-14-INP-11).
El usuario llena la sección Signos de Alerta / Derivación, seleccionando los signos clínicos identificados durante la evaluación (INT-14-TXT-16, INT-14-CMB-03).
El usuario registra el nombre del profesional evaluador y la firma digital en los campos de cierre de la ficha (INT-14-INP-10, INT-14-BTN-04).
El usuario selecciona la acción final según corresponda: Guardar sesión (INT-14-BTN-01), Guardar como borrador (INT-14-BTN-02) o Cancelar (INT-14-BTN-03).
El sistema valida que los campos obligatorios de la ficha geronto-psicomotriz hayan sido completados correctamente.
El sistema almacena la información clínica de la evaluación geronto-psicomotriz en la base de datos “OMVITAL_DB_PACIENTES”
El sistema deja la ficha asociada al historial clínico del paciente para consulta, actualización, generación de reporte y seguimiento posterior.',
    'La ficha de evaluación geronto-psicomotriz queda registrada en el sistema y asociada al paciente evaluado.
Los datos generales, motivo de atención, estado funcional, dolor, marcha, equilibrio, movilidad, fuerza funcional, coordinación, área cognitiva, área emocional-social, impresión geronto-psicomotriz, objetivos, plan de tratamiento, signos de alerta, profesional evaluador y firma quedan almacenados en la base de datos “OMVITAL_DB_PACIENTES”
El registro queda disponible para consulta dentro del historial clínico del paciente por usuarios con rol autorizado.
La información queda protegida por trazabilidad clínica, permitiendo corrección o anulación justificada sin eliminación permanente.
El sistema conserva el estado de la ficha como borrador, guardada o finalizada según la acción ejecutada por el fisioterapeuta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0014' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0014' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ILA-0014' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ILA-0014' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0014' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-14-TXT-01', 'INT-14-TXT-02', 'INT-14-TXT-03', 'INT-14-TXT-04', 'INT-14-TXT-05', 'INT-14-TXT-08', 'INT-14-TXT-09', 'INT-14-TXT-10', 'INT-14-TXT-11', 'INT-14-TXT-12', 'INT-14-TXT-13', 'INT-14-TXT-14', 'INT-14-TXT-15', 'INT-14-TXT-16', 'INT-14-INP-01', 'INT-14-INP-02', 'INT-14-INP-03', 'INT-14-INP-04', 'INT-14-INP-05', 'INT-14-INP-06', 'INT-14-INP-07', 'INT-14-INP-08', 'INT-14-INP-09', 'INT-14-INP-10', 'INT-14-INP-11', 'INT-14-INP-12', 'INT-14-INP-13', 'INT-14-CMB-01', 'INT-14-CMB-02', 'INT-14-CMB-03', 'INT-14-CMB-04', 'INT-14-CMB-05', 'INT-14-CHK-01', 'INT-14-SPB-01', 'INT-14-SPB-02', 'INT-14-GRD-01', 'INT-14-BTN-01', 'INT-14-BTN-02', 'INT-14-BTN-03', 'INT-14-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0015: Crear Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0015 v1.1.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.1',
    'Crear Sesión Terapéutica',
    '2026-06-15',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta registrar una nueva sesión terapéutica asociada a un paciente previamente programado, almacenando las observaciones clínicas realizadas durante la atención y actualizando automáticamente el historial clínico del paciente.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0015'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0025',
    'ESP-0020',
    'El fisioterapeuta ha iniciado sesión correctamente en el sistema.
El fisioterapeuta cuenta con permisos activos para registrar sesiones terapéuticas.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente se encuentra registrado en el sistema.
El paciente cuenta con una cita terapéutica programada para el día actual.
El fisioterapeuta accede al módulo Sesión de Paciente desde el menú lateral principal.
El sistema muestra el listado de pacientes del día
El fisioterapeuta selecciona la opción Iniciar Sesión desde la tabla de pacientes.',
    'El sistema despliega la interfaz Crear Sesión Terapéutica (INT-15-TXT-01).
El sistema consulta y carga automáticamente desde la base de datos omvital_db_pacients la información del paciente:
Nombre del paciente (INT-15-TXT-02).
Edad del paciente (INT-15-TXT-03).
DNI del paciente (INT-15-TXT-04).
Teléfono del paciente (INT-15-TXT-05).
Número de sesión actual (INT-15-TXT-06).
Fisioterapeuta responsable (INT-15-TXT-07).
El sistema registra automáticamente la fecha de atención (INT-15-TXT-08).
El sistema registra automáticamente la hora de inicio de la sesión (INT-15-TXT-09).
El sistema muestra el diagnóstico clínico asociado al paciente (INT-15-TXT-10).
El sistema muestra los agentes terapéuticos asignados al tratamiento del paciente (INT-15-TXT-11).
El fisioterapeuta registra las observaciones clínicas de la sesión en el campo de Observaciones clinicas
Opción Guardar Sesión:
El fisioterapeuta selecciona la opción "Guardar Sesión" (INT-15-BTN-01).
El sistema registra la fecha y hora de finalización de la sesión terapéutica.
El sistema almacena en la TABLE_SESION de la base de datos omvital_db_pacients la información correspondiente a la sesión terapéutica, incluyendo el paciente, número de sesión, fisioterapeuta responsable, fecha de atención, hora de inicio, hora de finalización, diagnóstico, agentes terapéuticos y observaciones clínicas.
El sistema muestra un mensaje en el modal de confirmación indicando que la sesión terapéutica fue registrada exitosamente.(INT-15-MDL-01)
El sistema retorna a la interfaz Sesión de Pacientes.(INT -18)
Opción Cancelar Sesión
El fisioterapeuta selecciona la opción "Cancelar" (INT-15-BTN-02).
El sistema muestra un modal con el mensaje de confirmación para cancelar el registro de la sesión terapéutica.(INT-15-MDL-02)
Si el fisioterapeuta confirma la cancelación, presionando el botón de Si, cancelar (INT-15-BTN-04) el sistema descarta la información.
El sistema retorna a la interfaz Sesión de Pacientes sin registrar cambios en la base de datos.(INT -18)
Si el fisioterapeuta decide continuar con el registro (INT -15-BTN-03), el sistema permanece en la interfaz Crear Sesión Terapéutica.',
    'La sesión terapéutica queda asociada al paciente correspondiente.
El historial clínico del paciente queda actualizado con la nueva sesión terapéutica.
La información queda disponible para consulta, edición o desactivación posterior.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0015' AND av.version = '1.1.1'
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
WHERE a.codigo = 'ILA-0015' AND av.version = '1.1.1' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ILA-0015' AND av.version = '1.1.1' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ILA-0015' AND av.version = '1.1.1' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0015' AND av.version = '1.1.1' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-15-TXT-01', 'INT-15-TXT-02', 'INT-15-TXT-03', 'INT-15-TXT-04', 'INT-15-TXT-05', 'INT-15-TXT-06', 'INT-15-TXT-07', 'INT-15-TXT-08', 'INT-15-TXT-09', 'INT-15-TXT-10', 'INT-15-TXT-11', 'INT-15-TXT-12', 'INT-15-TXT-13', 'INT-15-TXT-14', 'INT-15-TXT-15', 'INT-15-INP-01', 'INT-15-BTN-01', 'INT-15-BTN-02', 'INT-15-BTN-03', 'INT-15-BTN-04', 'INT-15-BTN-05', 'INT-15-MDL-01', 'INT-15-MDL-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0016: Consultar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0016 v1.1.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.1',
    'Consultar Sesión Terapéutica',
    '2026-06-17',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta consultar los pacientes programados para atención diaria',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0016'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0025',
    'ESP-0021, ESP-0022, ESP-0023, ESP-0024',
    'El fisioterapeuta ha iniciado sesión correctamente en el sistema.
El fisioterapeuta cuenta con permisos activos para consultar sesiones terapéuticas.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El fisioterapeuta accede al módulo "Sesión de Pacientes" desde el menú lateral principal.',
    'El fisioterapeuta selecciona la opción "Sesión de Pacientes" (BTN-02).
El sistema ejecuta una consulta a las tablas “SESION”
El sistema muestra la interfaz "Pacientes del Día" (INT-16-TXT-01).
El sistema muestra el listado de pacientes programados para atención en la tabla de sesiones (INT-16-TBL-01).
El fisioterapeuta puede ingresar criterios de búsqueda mediante el campo de búsqueda (INT-16-INP-01).
El fisioterapeuta selecciona la opción "Buscar" (INT-16-BTN-02).
El sistema filtra y muestra los pacientes que cumplen los criterios ingresados.
El fisioterapeuta puede restablecer la búsqueda mediante la opción "Limpiar" (INT-16-BTN-01).
El fisioterapeuta consulta la información mostrada en la tabla (INT-16-TBL-01):
DNI del paciente.
Nombre del paciente.
Diagnóstico.
Última sesión registrada.
Número de sesiones restantes.',
    'El listado de pacientes programados para atención es visualizado correctamente.
La información de las sesiones terapéuticas se encuentra disponible para consulta.
El fisioterapeuta puede iniciar, editar o desactivar sesiones terapéuticas desde la tabla de pacientes.
La información visualizada corresponde a los registros almacenados en las tablas sesion de la base de datos “OMVITAL_DB_PACIENTES”.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0016' AND av.version = '1.1.1'
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
WHERE a.codigo = 'ILA-0016' AND av.version = '1.1.1' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ILA-0016' AND av.version = '1.1.1' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ILA-0016' AND av.version = '1.1.1' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0016' AND av.version = '1.1.1' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-16-TXT-01', 'INT-16-INP-01', 'INT-16-BTN-01', 'INT-16-BTN-02', 'INT-16-TBL-01', 'INT-16-BTN-03', 'INT-16-BTN-04', 'INT-16-BTN-05')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0017: Editar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0017 v1.0.1
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.1',
    'Editar Sesión Terapéutica',
    '2026-06-17',
    'Vital',
    'Concluido',
    'El sistema permite la edición de una sesión terapéutica',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0017'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0025',
    'ESP-0025',
    'El fisioterapeuta ha iniciado sesión correctamente en el sistema.
El fisioterapeuta cuenta con permisos activos para modificar sesiones terapéuticas.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El paciente se encuentra registrado en el sistema.
Existe al menos un registro en la TABLE_SESION
El fisioterapeuta accede al módulo "Sesión de Pacientes".
El sistema muestra el listado de pacientes.
El fisioterapeuta selecciona la opción "Editar Sesión" desde la tabla de sesiones.',
    'El fisioterapeuta accede al módulo "Sesión de Pacientes".
El sistema muestra el listado de pacientes y sesiones terapéuticas registradas.
El fisioterapeuta selecciona la opción "Editar Sesión" (INT-18-BTN-04).
El sistema despliega el modal "Editar Sesión Terapéutica" (INT-17-MDL-01).
El sistema ejecuta una consulta a la TABLE_SESION para recuperar la información de la sesión terapéutica seleccionada.
El sistema carga automáticamente los datos registrados de la sesión:
Fecha de atención.
Hora de atención.
Datos del paciente.
Número de sesión.
Fisioterapeuta responsable.
Diagnóstico.
Agentes terapéuticos.
Observaciones clínicas.
El fisioterapeuta actualiza las observaciones clínicas en el campo correspondiente (INT-17-INP-01).
Actualizar Sesión
El fisioterapeuta selecciona la opción "Actualizar Sesión" (INT-17-BTN-01).
El sistema valida la información modificada.
El sistema actualiza el registro correspondiente en la TABLE_SESION, almacenando las modificaciones realizadas en las observaciones clínicas de la sesión terapéutica.
El sistema muestra un mensaje en el modal de confirmación indicando que la sesión terapéutica fue actualizada correctamente.(INT-17-MDL-02)
El sistema cierra el modal de edición y retorna a la interfaz "Sesión de Pacientes".(INT-18)
Cancelar Edición
El fisioterapeuta selecciona la opción "Cancelar" (INT-17-BTN-02).
El sistema muestra el modal de confirmación de cancelación (INT-17-MDL-03).
Si el fisioterapeuta confirma la cancelación, presionando el botón de Si, cancelar (INT-17-BTN-04) el sistema descarta la información.
El sistema retorna a la interfaz Sesión de Pacientes sin registrar cambios en la base de datos.(INT -18)
Si el fisioterapeuta decide continuar con la edición (INT -17-BTN-03), el sistema permanece en la interfaz Editar Sesión Terapéutica.',
    'La información modificada de la sesión terapéutica queda actualizada en el historial clínico del paciente.
La información actualizada queda disponible para futuras consultas, modificaciones o desactivaciones.
Si la edición es cancelada, el registro de la TABLE_SESION conserva la información previamente almacenada sin modificaciones.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0017' AND av.version = '1.0.1'
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
WHERE a.codigo = 'ILA-0017' AND av.version = '1.0.1' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ILA-0017' AND av.version = '1.0.1' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ILA-0017' AND av.version = '1.0.1' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0017' AND av.version = '1.0.1' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-17-TXT-01', 'INT-17-TXT-02', 'INT-17-TXT-03', 'INT-17-TXT-04', 'INT-17-TXT-05', 'INT-17-TXT-06', 'INT-17-TXT-07', 'INT-17-TXT-08', 'INT-17-TXT-09', 'INT-17-TXT-10', 'INT-17-TXT-11', 'INT-17-TXT-12', 'INT-17-TXT-13', 'INT-17-TXT-14', 'INT-17-TXT-15', 'INT-17-INP-01', 'INT-17-BTN-01', 'INT-17-BTN-02', 'INT-17-BTN-03', 'INT-17-BTN-04', 'INT-17-BTN-05', 'INT-17-MDL-01', 'INT-17-MDL-02', 'INT-17-MDL-03')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0018: Desactivar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0018 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Desactivar Sesión Terapéutica',
    '2026-06-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0018'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0025',
    'ESP-0026',
    'El fisioterapeuta ha iniciado sesión correctamente en el sistema.
El fisioterapeuta cuenta con permisos para gestionar sesiones terapéuticas.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
Existe al menos una sesión terapéutica registrada y activa en la TABLE_SESION
El fisioterapeuta accede al módulo "Sesión de Pacientes".
El sistema muestra el listado de pacientes y sesiones terapéuticas registradas.
El fisioterapeuta selecciona la opción "Desactivar Sesión" desde la tabla de sesiones.',
    'El fisioterapeuta accede al módulo "Sesión de Pacientes".
El sistema muestra el listado de sesiones terapéuticas registradas.
El fisioterapeuta selecciona el botón "Desactivar Sesión" (INT-18-BTN-05).
El sistema muestra el modal de confirmación "Desactivar Sesión Terapéutica" (INT-18-MDL-01).
El fisioterapeuta selecciona la opción "Confirmar" (INT-18-BTN-01).
El sistema cambia el estado de la sesión terapéutica a "Desactivada".
El sistema actualiza el registro correspondiente en la TABLE_SESION cambiando el estado de la sesión terapéutica a "Desactivada" o “Cancelar”
El fisioterapeuta selecciona la opción "Cancelar" (INT-18-BTN-03).
El sistema cierra el modal de confirmación.
El sistema retorna al listado de sesiones terapéuticas sin realizar cambios.(INT-18)',
    'El registro correspondiente en la TABLE_SESION queda actualizado con estado "Desactivada".
La información clínica de la sesión permanece almacenada en la base de datos “OMVITAL_DB_PACIENTES”.
La sesión terapéutica conserva su asociación con el paciente correspondiente.
La sesión ya no se encuentra disponible para nuevas modificaciones operativas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0018' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0018' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ILA-0018' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ILA-0018' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0018' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-18-MDL-01', 'INT-18-TXT-14', 'INT-18-TXT-15', 'INT-18-BTN-03', 'INT-18-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0019: Visualizar organización interna de atención al paciente
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0019 v3.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '3.0.0',
    'Visualizar organización interna de atención al paciente',
    '2026-06-16',
    'Media',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0002'
WHERE a.codigo = 'ILA-0019'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0026',
    'ESP-0027, ESP-0028, ESP-0029',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Fisioterapeuta.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
Las tablas TABLE_PACIENTE, TABLE_CITAS, TABLE_HISTORIAL_CLINICO, TABLE_FISIOTERAPEUTA deben estar creadas con datos correctamente.
El usuario se encuentra en la interfaz INT-0008.',
    'El Fisioterapeuta accede a la interfaz a panel de turno; pantalla principal de su interfaz (INT-008).
Se muestra una vista rápida con:
Detalles del paciente del turno actual
Indicadores de turno
Próximos turnos en general.
Detalles de pacientes de agenda
La visualización se actualiza automáticamente sin recarga manual.
El usuario puede realizar:
Ver progreso del paciente
El usuario se encuentra en el panel DETALLES DEL TURNO ACTUAL (INT-8-PNL-1)
El usuario hace click en el botón ‘VER PROGRESO’ (INT-8-BTN-01) correspondiente al paciente enlazado.
El sistema recupera los datos de la tabla TABLE_SEGUIMIENTO_CLINICO del paciente del turno actual en la próxima interfaz progreso del paciente (INT-006).
Filtrar citas propias
El usuario se encuentra en el panel AGENDA (INT-8-PNL-3)
El usuario hace click en el botón ‘FILTRAR: MIS CITAS’ (INT-8-BTN-02) correspondiente al paciente enlazado.
El sistema recupera los datos de la tabla TABLE_CITAS de la base de datos solo del fisioterapeuta autenticado y es mostrado en la tabla de citas del panel (INT-8-TBL-01).
Ver información de paciente de agenda
El usuario se encuentra en el panel AGENDA (INT-8-PNL-3)
El usuario hace click en el botón ‘VER’ (INT-8-BTN-03) presente en todas las grillas: pacientes de la tabla (INT-8-TBL-1).
El sistema recupera y se actualiza con los datos en el próximo panel INFORMACIÓN DEL PACIENTE DE AGENDA (INT-8-PNL-4)
Ver progreso de paciente de agenda
El usuario se encuentra en el panel INFORMACIÓN DEL PACIENTE DE AGENDA (INT-8-PNL-4)
El usuario hace click en el botón ‘VER PROGRESO’ (INT-8-BTN-04) correspondiente al paciente enlazado de la agenda.
El sistema recupera los datos de la tabla TABLE_SEGUIMIENTO_CLINICO del paciente del turno actual en la próxima interfaz: progreso del paciente (INT-006).',
    'El fisioterapeuta revisa los avances de sus pacientes dinámicamente durante el día.
La información queda sincronizada con recepción sin necesidad de recarga manual.
Los cambios registrados se reflejan inmediatamente en la visualización del fisioterapeuta.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0019' AND av.version = '3.0.0'
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
WHERE a.codigo = 'ILA-0019' AND av.version = '3.0.0' AND aut.codigo = 'AUT-0008'
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
WHERE a.codigo = 'ILA-0019' AND av.version = '3.0.0' AND f.codigo = 'FUE-0003'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0019' AND av.version = '3.0.0' AND aa.codigo IN ('SDB-01', 'INT-19-PNL-01', 'INT-19-BTN-01', 'INT-19-PNL-02', 'INT-19-PNL-03', 'INT-19-BTN-02', 'INT-19-TBL-01', 'INT-19-BTN-03', 'INT-19-PNL-04', 'INT-19-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0020: Registrar asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0020 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registrar asistencia',
    '2026-06-17',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0020'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0029',
    'ESP-0030, ESP-0031',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Citas.
El usuario posee permisos para registrar asistencias en “TABLE_CITAS”',
    'El ACT-0003 presiona el botón INT-06-BTN-06.
Luego presiona el botón INT-06-BTN-07.
Luego se abrirá el INT-20-MOD-001.
Para registrar la asistencia se verifica que se haya realizado el pago en INT-20-TXT-006.
Si el estado es Pagado, puede presionar el botón INT-20-BTN-002.
Si necesita subir alguna firma para la asistencia puede subir un archivo pdf en INT-20-FUP-001.
Para registrar la asistencia presiona el botón INT-20-BTN-002.
Si el estado está en No Pagado, el ACT-0003 presiona el botón INT-20-BTN-001.
Se cierra el INT-20-MOD-001 presionando cualquiera de los dos botones.',
    'En caso de haberse presionado el INT-20-BTN-002, la asistencia quedará registrada en el sistema con firma o sin firma.
La cita cambiará de estado a en curso.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0020' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0020' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ILA-0020' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0020' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-02', 'INT-06-BTN-06', 'INT-06-BTN-07', 'INT-20-MOD-001', 'INT-20-TBL-001', 'INT-20-TXT-001', 'INT-20-TXT-002', 'INT-20-TXT-003', 'INT-20-TXT-004', 'INT-20-TXT-005', 'INT-20-TXT-006', 'INT-20-BTN-001', 'INT-20-BTN-002', 'INT-20-FUP-001')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0021: Obtener constancia de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0021 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Obtener constancia de asistencia',
    '2026-06-17',
    'Vital',
    'Concluido',
    'Detalles relevantes / Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0021'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0029',
    'ESP-0032, ESP-0033, ESP-0034, ESP-0035',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Citas.
El usuario posee permisos para generar una constancia de asistencias en “VISTA_CONSTANCIA_ASISTENCIA”.',
    'El ACT-0003 presiona el botón INT-06-BTN-06.
Luego presiona el botón INT-06-BTN-08.
Luego se abrirá el INT-21-MOD-001.
Dentro del modal, se podrá ver una vista previa de la constancia de asistencia.
Si quiere descargar la constancia de asistencia, presionar el INT-21-BTN-005.
Si quiere imprimir la constancia de asistencia, presionar el INT-21-BTN-006.
Si quiere enviar la constancia de asistencia por correo, presionar el INT-21-BTN-001.
Si quiere enviar la constancia de asistencia por whatsapp, presionar el INT-21-BTN-001.
Si quiere salir de la ventana presionar el botón INT-21-BTN-008.',
    'Se cierra la conexión con la base de datos “OMVITAL_DB_PACIENTES”'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0021' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0021' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ILA-0021' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0021' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-02', 'INT-06-BTN-06', 'INT-06-BTN-08', 'INT-21-MOD-001', 'INT-21-BTN-001', 'INT-21-BTN-002', 'INT-21-BTN-005', 'INT-21-BTN-006', 'INT-21-BTN-007', 'INT-21-BTN-008')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0022: Crear Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0022 v3.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '3.0.0',
    'Crear Protocolo de Tratamiento Estandarizado',
    '2026-06-12',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta registrar protocolos de tratamiento estandarizadas compuestas por información clínica, estado (activo/inactivo), etapa clínica (Aguda/Subaguda/Crónica), enfoques terapéuticos (Alivio del dolor, Fortalecimiento muscular, Psicología del dolor) y actividades terapéuticas reutilizables, favoreciendo la uniformidad en la planificación de sesiones y reduciendo los tiempos de configuración de tratamientos recurrentes.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0022'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0031',
    'ESP-0036',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Fisioterapeuta.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Protocolos de Tratamiento.
El usuario posee permisos para registrar nuevos protocolos en “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”.',
    'El Fisioterapeuta accede a la interfaz de Gestión de Protocolos de Tratamiento. (BTN-04)
El usuario hace clic en el botón "Nuevo Protocolo" (INT-23-BTN-01).
El sistema despliega el modal "Nuevo Protocolo" (INT-22-MDL-01).
El usuario ingresa el nombre del protocolo en el campo Nombre (INT-22-INP-01).
El usuario selecciona una especialidad desde la lista desplegable Especialidad (INT-22-DPD-01).
El usuario ingresa la duración estimada del tratamiento en el campo Duración (INT-22-INP-02).
El usuario selecciona el estado inicial del protocolo: Activo o Inactivo (INT-22-RBT-01 / INT-22-RBT-02).
El usuario registra una descripción clínica en el campo Descripción Clínica (INT-22-INP-03).
El usuario selecciona si el protocolo esta activo (INT-22-CHK-01)
El usuario selecciona la etapa clínica aplicable a la plantilla: Aguda, Subaguda o Crónica. (INT-22-CHK-02)
El usuario selecciona uno o más enfoques terapéuticos: Alivio del dolor, Fortalecimiento muscular, Psicología del dolor. (INT-22-CHK-03)
El usuario hace clic en el botón "Agregar Actividades" (INT-22-BTN-02).
El sistema habilita el registro de actividades asociadas al protocolo.
El usuario registra una o más actividades y estas son mostradas en la tabla de actividades (INT-22-TBL-01).
Si es necesario, el usuario puede modificar una actividad mediante el botón "Editar Actividad" (INT-22-BTN-03).
Si es necesario, el usuario puede eliminar una actividad mediante el botón "Eliminar Actividad" (INT-22-BTN-04).
Una vez completada la información requerida, el usuario selecciona "Guardar Protocolo" (INT-22-BTN-05) y confirma el registro del protocolo.
El sistema valida que los campos obligatorios hayan sido completados correctamente.
El sistema almacena la información del protocolo y sus actividades asociadas en la base de datos.
El sistema cierra el modal y actualiza el listado de protocolos disponibles.',
    'El nuevo protocolo de tratamiento queda registrado en el sistema.
Las actividades asociadas quedan vinculadas al protocolo creado.
La información se almacena permanentemente en la base de datos.
El protocolo aparece disponible para consultas, modificaciones y eliminación posteriores.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0022' AND av.version = '3.0.0'
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
WHERE a.codigo = 'ILA-0022' AND av.version = '3.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ILA-0022' AND av.version = '3.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0022' AND av.version = '3.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-01', 'INT-22-MDL-01', 'INT-22-INP-01', 'INT-22-DPD-01', 'INT-22-INP-02', 'INT-22-CHK-01', 'INT-22-INP-03', 'INT-22-CHK-02', 'INT-22-CHK-03', 'INT-22-BTN-02', 'INT-22-TBL-01', 'INT-22-BTN-03', 'INT-22-BTN-04', 'INT-22-BTN-05', 'INT-22-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0023: Consulta de Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0023 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Consulta de Protocolo de Tratamiento Estandarizado',
    '2026-06-03',
    'Vital',
    'Concluido',
    'Permite consultar protocolos clínicos estandarizados para garantizar uniformidad en la atención y facilitar la reutilización de tratamientos previamente definidos.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0023'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0031',
    'ESP-0037',
    'El usuario ha iniciado sesión correctamente
El usuario cuenta con rol y permisos activos de Fisioterapeuta.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
Existe al menos un registro en la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”',
    'El Fisioterapeuta hace clic en el botón de Protocolos (BTN-04) en la barra lateral (SDB-01).
El sistema intercepta la petición y renderiza la interfaz de Gestión de Protocolos de Tratamiento.
El sistema ejecuta una consulta a la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”.
El sistema carga y despliega el listado completo de protocolos en la tabla de la interfaz, junto con las barras de búsqueda y filtros.
El usuario ingresa un criterio de búsqueda, como nombre, duración, etc.
El sistema filtra dinámicamente o tras pulsar "Buscar" (INT-23-BTN-02) la lista de registros en pantalla.
El sistema muestra únicamente los protocolos que coinciden con el criterio.
El usuario selecciona (INT-23-BTN-06) un protocolo específico de la lista para revisar su contenido completo.',
    'El usuario visualiza la información actualizada de los protocolos registrados.
No se modifica información almacenada en el sistema.
El protocolo seleccionada queda disponible para operaciones posteriores.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0023' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ILA-0023' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ILA-0023' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0023' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-TXT-01', 'INT-23-BTN-01', 'INT-23-INP-01', 'INT-23-DPD-01', 'INT-23-DPD-02', 'INT-23-BTN-03', 'INT-23-BTN-02', 'INT-23-TBL-01', 'INT-23-BTN-06', 'INT-23-BTN-05', 'INT-23-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0024: Actualización del Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0024 v3.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '3.0.0',
    'Actualización del Protocolo de Tratamiento Estandarizado',
    '2026-06-12',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta mantener actualizadas los protocolos de tratamiento estandarizadas, modificando información clínica, estado (activo/inactivo), etapa clínica (Aguda/Subaguda/Crónica), enfoques terapéuticos (Alivio del dolor, Fortalecimiento muscular, Psicología del dolor) y actividades terapéuticas asociadas.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0024'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0031',
    'ESP-0038',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Fisioterapeuta.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”
El usuario se encuentra en la interfaz de Gestión de Plantillas de Tratamiento.
Existe al menos una plantilla registrada en la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”
El usuario posee permisos para modificar plantillas de tratamiento.',
    'El Fisioterapeuta accede a la interfaz de Gestión de Protocolos de Tratamiento.
El usuario localiza el protocolo que desea modificar dentro de la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”
El usuario hace clic en el botón "Editar" (INT-23-BTN-05) correspondiente al protocolo seleccionado.
El sistema recupera la información asociada al protocolo seleccionado desde la base de datos.
El sistema despliega el modal "Editar Protocolo" (INT-24-MDL-01) cargando los datos actuales de la plantilla.
El usuario modifica el nombre del protocolo en el campo Nombre (INT-24-INP-01), si es necesario.
El usuario actualiza la especialidad mediante el desplegable Especialidad (INT-24-DPD-01), si corresponde.
El usuario modifica la duración estimada del tratamiento en el campo Duración (INT-24-INP-02), si es necesario.
El usuario selecciona si el protocolo está activo mediante el checkbox Estado (INT-24-CHK-01).
El usuario modifica la información registrada en el campo Descripción Clínica (INT-24-INP-03).
El usuario selecciona la etapa clínica aplicable al protocolo: Aguda, Subaguda o Crónica mediante el checkbox Etapa Clínica (INT-24-CHK-02).
El usuario selecciona uno o más enfoques terapéuticos: Alivio del dolor, Fortalecimiento muscular, Psicología del dolor mediante el checkbox Enfoque Terapéutico (INT-24-CHK-03).
El usuario puede agregar nuevas actividades seleccionando el botón "Agregar Actividades" (INT-24-BTN-02).
El sistema habilita el registro de nuevas actividades asociadas al protocolo.
El usuario puede modificar una actividad existente mediante el botón "Editar Actividad" (INT-24-BTN-03).
El usuario puede eliminar una actividad existente mediante el botón "Eliminar Actividad" (INT-24-BTN-04).
El sistema actualiza dinámicamente la información mostrada en la tabla de actividades (INT-24-TBL-01).
Una vez completadas las modificaciones, el usuario selecciona "Guardar Protocolo" (INT-24-BTN-05) y confirma la actualización.
El sistema valida que los datos ingresados cumplan con las reglas de negocio y que los campos obligatorios estén completos.
El sistema actualiza la información del protocolo y sus actividades asociadas en la base de datos.
El sistema cierra el modal y actualiza el listado de protocolos disponibles.',
    'El protocolo de tratamiento seleccionado queda actualizado en el sistema.
Las modificaciones realizadas sobre las actividades asociadas son almacenadas correctamente.
La información actualizada queda disponible para consultas posteriores.
El historial de datos mantiene la integridad de la información registrada.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0024' AND av.version = '3.0.0'
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
WHERE a.codigo = 'ILA-0024' AND av.version = '3.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ILA-0024' AND av.version = '3.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0024' AND av.version = '3.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-05', 'INT-24-MDL-01', 'INT-24-INP-01', 'INT-24-DPD-01', 'INT-24-INP-02', 'INT-24-CHK-01', 'INT-24-INP-03', 'INT-24-CHK-02', 'INT-24-CHK-03', 'INT-24-BTN-02', 'INT-24-TBL-01', 'INT-24-BTN-03', 'INT-24-BTN-04', 'INT-24-BTN-05', 'INT-24-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0025: Eliminación del Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0025 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Eliminación del Protocolo de Tratamiento Estandarizado',
    '2026-06-12',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta eliminar plantillas de tratamiento estandarizadas que ya no son necesarias o que han sido reemplazadas por nuevas versiones. La confirmación previa evita eliminaciones accidentales y garantiza que únicamente se eliminen registros validados por el usuario responsable.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0025'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0031',
    'ESP-0039',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Fisioterapeuta.
El sistema tiene conexión estable con la base de datos “OMVITAL_DB_PACIENTES”.
El usuario se encuentra en la interfaz de Gestión de Protocolos de Tratamiento Estandarizado.
Existe al menos una plantilla registrada en la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”
El usuario posee permisos para eliminar protocolos de tratamiento.',
    'El Fisioterapeuta accede a la interfaz de Gestión de Protocolos de Tratamientos Estandarizados.
El usuario localiza el protocolo que desea eliminar dentro de la tabla “TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO”.
El usuario hace clic en el botón Eliminar (INT-23-BTN-04) correspondiente al protocolo seleccionado.
El sistema identifica el protocolo seleccionado y recupera su información básica.
El sistema despliega el modal de confirmación Eliminar Protocolo (INT-25-MDL-01).
El sistema muestra el mensaje de confirmación (INT-25-TXT-01) indicando el código o nombre del protocolo que será eliminado.
El usuario revisa la información presentada.
Si el usuario decide cancelar la operación, selecciona el botón Cancelar (INT-25-BTN-03).
El sistema cierra el modal de confirmación sin realizar modificaciones sobre la información almacenada.
Si el usuario confirma la operación, selecciona el botón Eliminar (INT-25-BTN-02).
El sistema valida que el protocolo exista y que el usuario tenga permisos para realizar la operación.
El sistema elimina el registro del protocolo seleccionado y sus relaciones asociadas según las reglas de negocio definidas.
El sistema actualiza la información almacenada en la base de datos.
El sistema cierra el modal de confirmación.
El sistema actualiza el listado de protocolos disponibles en la interfaz de Gestión de Protocolos de Tratamiento.',
    'El protocolo de tratamiento seleccionado es eliminado del sistema.
La información asociada al protocolo deja de estar disponible para consultas, modificaciones o reutilización.
El listado de protocolos refleja inmediatamente la eliminación realizada.
La integridad de la información almacenada en la base de datos se mantiene conforme a las reglas de negocio establecidas.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0025' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ILA-0025' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ILA-0025' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0025' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-04', 'INT-25-MDL-01', 'INT-25-TXT-01', 'INT-25-BTN-02', 'INT-25-BTN-03', 'INT-25-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0026: Visualización general del dashboard de monitoreo en recepción
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0026 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Visualización general del dashboard de monitoreo en recepción',
    '2026-06-14',
    'Media',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ILA-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0032',
    'ESP-0040',
    'El usuario ha iniciado sesión correctamente.
El usuario cuenta con rol y permisos activos de Recepcionista
El sistema tiene conexión estable con la base de datos "OMVITAL_DB_PACIENTES".
Las tablas TABLE_PACIENTE, TABLE_CITA, TABLE_CAMILLA y TABLA_FISIOTERAPEUTA deben estar creadas con datos correctamente',
    'El recepcionista accede al módulo "Flujo de Atención" del sistema (BTN-01)
El sistema carga de manera centralizada los cuatro componentes principales del panel en tiempo real para el monitoreo del establecimiento. (INT-26-PNL-01, INT-26-PNL-02, INT-26-PNL-03, INT-26-PNL-03)
El sistema lista en la sección "Citas Actuales por Fisioterapeuta" (INT-26-PNL-01) los fisioterapuetas activos, detallando el paciente actual en camilla con su respectiva hora de inicio y hora de fin de sesión (INT-26-TBL-01)
El sistema despliega el estado de ocupación física en el componente "Camillas" (INT-26-PNL-02), dividiéndolas dinámicamente en ocupadas (INT-26-TBL-02) y libres (INT-26-TBL-03), detallando los minutos restantes de terapia de manera informativa.
El recepcionista observa de forma cronológica la sección “Agenda del día” (INT-26-PNL-03), que muestra qué camilla y qué fisioterapeuta fueron asignados a cada paciente y a qué hora específica (INT-26-TBL-04).
Para gestionar contingencias y comunicar eventos imprevistos, el recepcionista consulta la sección de "Novedades" (INT-26-PNL-04)',
    'Los componentes del dashboard se encuentran cargados y sincronizados con los datos vigentes de la base de datos "omvital_db_pacients", quedando el sistema en estado de consulta activa.
La sección de Novedades y el de las Camillas permanecen habilitados en pantalla para la supervisión continua de contingencias por parte del Recepcionista.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0026' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ILA-0026' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0002'
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
WHERE a.codigo = 'ILA-0026' AND av.version = '2.0.0' AND f.codigo = 'ENT-0004'
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
WHERE a.codigo = 'ILA-0026' AND av.version = '2.0.0' AND f.codigo = 'FUE-0001'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0026' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-02', 'BTN-01', 'INT-26-PNL-01', 'INT-26-PNL-02', 'INT-26-PNL-03', 'INT-26-PNL-04', 'INT-26-TBL-01', 'INT-26-TBL-02', 'INT-26-TBL-03', 'INT-26-TBL-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ILA-0027: Ingreso al sistema
-- ============================================================

-- ------------------------------------------------------------
-- ILA-0027 v1.0.0
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
    'Permite a los usuarios (Administrador, Recepcionista, Coordinador y Fisioterapeuta) ingresar al sistema mediante correo y contraseña desde la interfaz INT-027. Autentica las credenciales, gestiona la sesión con validación por token, bloquea la cuenta tras 3 intentos fallidos, redirige a un panel distinto según el rol y permisos, y registra los eventos de ingreso y cierre de sesión en el log de auditoría.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ILA-0027'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO ilacion_version (
    artefacto_version_id, codigo_educcion, codigo_especificacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'EDU-0033',
    'ESP-0041, ESP-0042, ESP-0043, ESP-0044',
    'El sistema tiene conexión estable con la base de datos administrativa "OMVITAL_DB_ADMINISTRATIVO".
El usuario se encuentra en la página de inicio de sesión (INT-027).
El usuario no posee una sesión activa en el sistema.
La cuenta del usuario no se encuentra bloqueada.
Los paneles de redirección por rol están disponibles (INT-100, INT-200, INT-300, INT-400).',
    'El usuario ingresa a la página de inicio de sesión (INT-027).
El sistema valida automáticamente que no exista una sesión activa (INT-027).
El usuario ingresa su correo en el campo Correo (INT-027-INP-01).
El usuario ingresa su contraseña en el campo Contraseña (INT-027-INP-02).
El sistema valida que los campos obligatorios no estén vacíos y que el formato del correo sea válido.
El usuario hace clic en el botón Iniciar Sesión (INT-027-BTN-01).
El sistema verifica las credenciales del usuario. Si son incorrectas, incrementa el contador de intentos fallidos y, al alcanzar 3, bloquea la cuenta.
Si las credenciales son correctas, el sistema obtiene el rol del usuario, inicia la sesión y registra el ingreso en el log de auditoría.
El sistema valida el token de sesión en cada carga de página; si es inválido o expiró, redirige a INT-027.
El sistema redirige según el rol: Administrador (INT-100), Recepcionista (INT-200), Coordinador (INT-300) o Fisioterapeuta (INT-400), verificando los permisos del usuario para la página solicitada.
El usuario puede cerrar la sesión mediante el botón Cerrar Sesión (BTN-99), que invalida la autenticación, limpia los datos locales y redirige a INT-027.',
    'El usuario queda autenticado y redirigido al panel correspondiente a su rol.
La sesión activa se registra y se valida mediante token en cada página del sistema.
Los eventos de ingreso y cierre de sesión quedan registrados en el log de auditoría.
Si se exceden 3 intentos fallidos, la cuenta queda bloqueada.
Al cerrar sesión, la autenticación queda invalidada y el usuario regresa a INT-027.'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
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
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0' AND f.codigo = 'ENT-0005'
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
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
ON CONFLICT (artefacto_version_id, fuente_id) DO NOTHING;

INSERT INTO artefacto_version_artefacto_asociado (
    artefacto_version_id, artefacto_asociado_id
)
SELECT
    av.id,
    aa.id
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
CROSS JOIN artefacto_asociado aa
WHERE a.codigo = 'ILA-0027' AND av.version = '1.0.0' AND aa.codigo IN ('INT-027-IMG-01', 'INT-027-IMG-02', 'INT-027-IMG-03', 'INT-027-INP-01', 'INT-027-INP-02', 'INT-027-TXT-01', 'INT-027-TXT-02', 'INT-027-BTN-01', 'BTN-99', 'INT-027', 'INT-100', 'INT-200', 'INT-300', 'INT-400')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- FIN DE ILACIONES
-- ============================================================
