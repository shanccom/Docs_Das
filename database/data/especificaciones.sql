-- ============================================================
-- ESPECIFICACIONES
-- Datos extraídos de las plantillas oficiales del proyecto
-- ============================================================

-- ============================================================
-- 1. IDENTIDADES DE ARTEFACTOS (ESPECIFICACIONES)
-- ============================================================

INSERT INTO artefacto (codigo, tipo)
VALUES
    ('ESP-0001', 'ESPECIFICACION'),
    ('ESP-0002', 'ESPECIFICACION'),
    ('ESP-0003', 'ESPECIFICACION'),
    ('ESP-0004', 'ESPECIFICACION'),
    ('ESP-0005', 'ESPECIFICACION'),
    ('ESP-0006', 'ESPECIFICACION'),
    ('ESP-0007', 'ESPECIFICACION'),
    ('ESP-0008', 'ESPECIFICACION'),
    ('ESP-0009', 'ESPECIFICACION'),
    ('ESP-0010', 'ESPECIFICACION'),
    ('ESP-0011', 'ESPECIFICACION'),
    ('ESP-0012', 'ESPECIFICACION'),
    ('ESP-0013', 'ESPECIFICACION'),
    ('ESP-0014', 'ESPECIFICACION'),
    ('ESP-0015', 'ESPECIFICACION'),
    ('ESP-0016', 'ESPECIFICACION'),
    ('ESP-0017', 'ESPECIFICACION'),
    ('ESP-0018', 'ESPECIFICACION'),
    ('ESP-0019', 'ESPECIFICACION'),
    ('ESP-0020', 'ESPECIFICACION'),
    ('ESP-0021', 'ESPECIFICACION'),
    ('ESP-0022', 'ESPECIFICACION'),
    ('ESP-0023', 'ESPECIFICACION'),
    ('ESP-0024', 'ESPECIFICACION'),
    ('ESP-0025', 'ESPECIFICACION'),
    ('ESP-0026', 'ESPECIFICACION'),
    ('ESP-0027', 'ESPECIFICACION'),
    ('ESP-0028', 'ESPECIFICACION'),
    ('ESP-0029', 'ESPECIFICACION'),
    ('ESP-0030', 'ESPECIFICACION'),
    ('ESP-0031', 'ESPECIFICACION'),
    ('ESP-0032', 'ESPECIFICACION'),
    ('ESP-0033', 'ESPECIFICACION'),
    ('ESP-0034', 'ESPECIFICACION'),
    ('ESP-0035', 'ESPECIFICACION'),
    ('ESP-0036', 'ESPECIFICACION'),
    ('ESP-0037', 'ESPECIFICACION'),
    ('ESP-0038', 'ESPECIFICACION'),
    ('ESP-0039', 'ESPECIFICACION'),
    ('ESP-0040', 'ESPECIFICACION'),
    ('ESP-0041', 'ESPECIFICACION'),
    ('ESP-0042', 'ESPECIFICACION'),
    ('ESP-0043', 'ESPECIFICACION'),
    ('ESP-0044', 'ESPECIFICACION')
ON CONFLICT (codigo) DO NOTHING;

-- ============================================================
-- 2. ARTEFACTOS ASOCIADOS REFERENCIADOS POR LAS ESPECIFICACIONES
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
    ('INT-01-BTN-01', 'INT'),
    ('INT-02', 'INT'),
    ('BTN-02', 'BTN'),
    ('INT-02-INP-01', 'INT'),
    ('INT-02-TBL-01', 'INT'),
    ('INT-02-BTN-02', 'INT'),
    ('INT-02-A', 'INT'),
    ('INT-02-BTN-01', 'INT'),
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
    ('INT-004-BTN-01', 'INT'),
    ('INT-004-BTN-02', 'INT'),
    ('INT-06-BTN-03', 'INT'),
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
    ('SDB-02', 'SDB'),
    ('LOG-01', 'LOG'),
    ('BTN-07', 'BTN'),
    ('BTN-08', 'BTN'),
    ('BTN-10', 'BTN'),
    ('BTN-11', 'BTN'),
    ('PRF-02', 'PRF'),
    ('BTN-12', 'BTN'),
    ('INT-021-BTN-04', 'INT'),
    ('INT-010-IMG-01', 'INT'),
    ('INT-010-BTN-01', 'INT'),
    ('INT-010-PNL-01', 'INT'),
    ('INT-010-GRD-01', 'INT'),
    ('INT-010-GRD-02', 'INT'),
    ('INT-010-GRD-03', 'INT'),
    ('INT-010-GRD-04', 'INT'),
    ('INT-010-TBL-01', 'INT'),
    ('INT-010-BTN-02', 'INT'),
    ('INT-010-BTN-03', 'INT'),
    ('BTN-01', 'BTN'),
    ('BTN-03', 'BTN'),
    ('BTN-04', 'BTN'),
    ('BTN-05', 'BTN'),
    ('BTN-06', 'BTN'),
    ('PRF-01', 'PRF'),
    ('INT-12', 'INT'),
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
    ('INT-09', 'INT'),
    ('INT-10', 'INT'),
    ('INT-13', 'INT'),
    ('INT-14', 'INT'),
    ('INT-11-TXT-01', 'INT'),
    ('INT-11', 'INT'),
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
    ('INT-16', 'INT'),
    ('INT-16-TXT-01', 'INT'),
    ('INT-16-INP-01', 'INT'),
    ('INT-16-BTN-01', 'INT'),
    ('INT-16-BTN-02', 'INT'),
    ('INT-16-TBL-01', 'INT'),
    ('INT-16-BTN-03', 'INT'),
    ('INT-16-BTN-04', 'INT'),
    ('INT-16-BTN-05', 'INT'),
    ('INT-008', 'INT'),
    ('INT-8-PNL-01', 'INT'),
    ('INT-8-PNL-02', 'INT'),
    ('INT-8-PNL-03', 'INT'),
    ('INT-8-TBL-01', 'INT'),
    ('TABLE_CITAS', 'TABLE_CITAS'),
    ('TABLE_PACIENTE', 'TABLE_PACIENTE'),
    ('TABLE_HISTORIAL_CLINICO', 'TABLE_HISTORIAL_CLINICO'),
    ('TABLE_FISIOTERAPEUTA', 'TABLE_FISIOTERAPEUTA'),
    ('INT-19', 'INT'),
    ('INT-19-PNL-01', 'INT'),
    ('INT-19-BTN-01', 'INT'),
    ('INT-006', 'INT'),
    ('TABLE_SEGUIMIENTO_CLINICO', 'TABLE_SEGUIMIENTO_CLINICO'),
    ('INT-0019', 'INT'),
    ('INT-19-PNL-03', 'INT'),
    ('INT-19-PNL-04', 'INT'),
    ('INT-19-TBL-01', 'INT'),
    ('INT-19-BTN-02', 'INT'),
    ('INT-19-BTN-03', 'INT'),
    ('INT-19-BTN-04', 'INT'),
    ('INT-20-FUP-0001', 'INT'),
    ('INT-20-BTN-002', 'INT'),
    ('INT-20-MOD-001', 'INT'),
    ('INT-20-BTN-001', 'INT'),
    ('INT-21-MOD-001', 'INT'),
    ('INT-21-BTN-001', 'INT'),
    ('INT-21-BTN-002', 'INT'),
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
    ('Todas', 'Todas'),
    ('INT-100', 'INT'),
    ('INT-200', 'INT'),
    ('INT-300', 'INT'),
    ('INT-400', 'INT')
ON CONFLICT (codigo) DO NOTHING;

-- ============================================================
-- ESP-0001: Registro inicial de nuevo paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0001 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registro inicial de nuevo paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0001'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0001',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para registrar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnPacientes(BTN-09)
)
Fin Precondiciones',
    'Inicio
String[8] str8_Dni
String[50] str_Nombres
String[50] str_Apellidos
String[9] str9_Telefono
Date date_FechaNacimiento
String[100] str_Direccion
Boolean bool_Consentimiento
Boolean bool_DniDuplicado
Paciente obj_PacienteNuevo

Si usuario.click(btnNuevoRegistro(INT-02-BNT-03)) Entonces
    RedirigirVista(INT-01)
FinSi

Si usuario.putIn(Input(INT-01-INP-01)) Entonces
    str8_Dni = obtenerValorTexto(INT-01-INP-01)
FinSi
Si usuario.putIn(Input(INT-01-INP-02)) Entonces
    str_Nombres = obtenerValorTexto(INT-01-INP-02)
FinSi
Si usuario.putIn(Input(INT-01-INP-03)) Entonces
    str_Apellidos = obtenerValorTexto(INT-01-INP-03)
FinSi
Si usuario.putIn(Input(INT-01-INP-04)) Entonces
    str9_Telefono = obtenerValorTexto(INT-01-INP-04)
FinSi
Si usuario.putIn(Input(INT-01-INP-05)) Entonces
    date_FechaNacimiento = obtenerValorFecha(INT-01-INP-05)
FinSi
Si usuario.putIn(Input(INT-01-INP-06)) Entonces
    str_Direccion = obtenerValorTexto(INT-01-INP-06)
FinSi
Si usuario.click(Checkbox(INT-01-CHK-01)) Entonces
    bool_Consentimiento = obtenerEstadoCheckbox(INT-01-CHK-01)
FinSi

Si usuario.click(btnGuardar(INT-01-BTN-01)) Entonces
    Si str8_Dni = null o str8_Dni = "" Entonces
        MostrarMensaje("El campo DNI es obligatorio.")
        ResaltarCampo(INT-01-INP-01)
        Finalizar procedimiento
    FinSi
    Si longitud(str8_Dni) <> 8 o validarSoloDigitos(str8_Dni) = false Entonces
        MostrarMensaje("El DNI debe contener exactamente 8 dígitos numéricos.")
        ResaltarCampo(INT-01-INP-01)
        Finalizar procedimiento
    FinSi
    bool_DniDuplicado = existeRegistro("TABLE_PACIENTE", str8_Dni)
    Si bool_DniDuplicado = true Entonces
        MostrarMensaje("El DNI ya pertenece a un paciente registrado.")
        ResaltarCampo(INT-01-INP-01)
        Finalizar procedimiento
    FinSi
    Si str_Nombres = "" o str_Nombres = null Entonces
        MostrarMensaje("Los Nombres son obligatorios.")
        ResaltarCampo(INT-01-INP-02)
        Finalizar procedimiento
    FinSi
    Si validarCaracteresEspeciales(str_Nombres) = true Entonces
        MostrarMensaje("Los Nombres no permiten caracteres especiales.")
        ResaltarCampo(INT-01-INP-02)
        Finalizar procedimiento
    FinSi
    Si str_Apellidos = "" o str_Apellidos = null Entonces
        MostrarMensaje("Los Apellidos son obligatorios.")
        ResaltarCampo(INT-01-INP-03)
        Finalizar procedimiento
    FinSi
    Si validarCaracteresEspeciales(str_Apellidos) = true Entonces
        MostrarMensaje("Los Apellidos no permiten caracteres especiales.")
        ResaltarCampo(INT-01-INP-03)
        Finalizar procedimiento
    FinSi
    Si str9_Telefono <> "" y str9_Telefono <> null Entonces
        Si longitud(str9_Telefono) <> 9 o validarSoloDigitos(str9_Telefono) = false Entonces
            MostrarMensaje("El Teléfono debe contener exactamente 9 dígitos numéricos.")
            ResaltarCampo(INT-01-INP-04)
            Finalizar procedimiento
        FinSi
    FinSi
    Si bool_Consentimiento = false Entonces
        MostrarMensaje("Debe aceptar el Consentimiento Informado.")
        ResaltarCampo(INT-01-CHK-01)
        Finalizar procedimiento
    FinSi

    obj_PacienteNuevo = new Paciente()
    obj_PacienteNuevo.setDni(str8_Dni)
    obj_PacienteNuevo.setNombres(str_Nombres)
    obj_PacienteNuevo.setApellidos(str_Apellidos)
    Si str9_Telefono <> "" Entonces
        obj_PacienteNuevo.setTelefono(str9_Telefono)
    FinSi
    Si date_FechaNacimiento <> null Entonces
        obj_PacienteNuevo.setFechaNacimiento(date_FechaNacimiento)
    FinSi
    Si str_Direccion <> "" Entonces
        obj_PacienteNuevo.setDireccion(str_Direccion)
    FinSi
    obj_PacienteNuevo.setConsentimiento(bool_Consentimiento)
    obj_PacienteNuevo.setEstado("ACTIVO")

    uInt32_NuevoId = registrarPaciente(obj_PacienteNuevo)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
Boolean bool_PacienteRegistrado
String[20] str_EstadoVerificado

bool_PacienteRegistrado = existeRegistroId("TABLE_PACIENTE", uInt32_NuevoId)
Si bool_PacienteRegistrado = true Entonces
    str_EstadoVerificado = obtenerEstadoPaciente(str8_Dni)
    Verificar str_EstadoVerificado = "ACTIVO"
    MostrarMensaje("El registro fue exitoso.")
    RedirigirVista(INT-02)
FinSi
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0001' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0001' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0001' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0001' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0001' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-01', 'INT-01-INP-01', 'INT-01-INP-02', 'INT-01-INP-03', 'INT-01-INP-04', 'INT-01-INP-05', 'INT-01-INP-06', 'INT-01-CHK-01', 'INT-01-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0002: Cancelar registro inicial de nuevo paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0002 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cancelar registro inicial de nuevo paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0002'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0001',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para registrar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnNuevoRegistro(INT-02-BNT-03)
)
Fin Precondiciones',
    'Inicio
Si usuario.click(btnCancelar(BTN-02)) Entonces
    limpiarCamposVista(INT-01)
    descartarCambiosTemporales()
    MostrarMensaje("Se canceló el registro del nuevo paciente.")
    RedirigirVista(INT-02)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Boolean bool_CambiosDescartados

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02"

bool_CambiosDescartados = verificarBufferVacio(INT-01)
Verificar bool_CambiosDescartados = true

MostrarMensaje("No se realizaron cambios en la base de datos.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0002' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0002' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0002' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0002' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0002' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-09', 'INT-02', 'INT-01', 'BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0003: Búsqueda y filtrado de pacientes en grilla
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0003 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Búsqueda y filtrado de pacientes en grilla',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0003'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0002',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para consultar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnPacientes(BTN-09)
)
Fin Precondiciones',
    'Inicio
String[50] str50_ParametroBusqueda
Unsigned int8 uInt8_LongitudBusqueda
Unsigned int8 uInt8_LimiteResultados
Unsigned int8 uInt8_IndiceFor
ListaPacientes obj_ListaPacientes

uInt8_LimiteResultados = 50

Si usuario.putIn(Input(INT-02-INP-01)) Entonces
    str50_ParametroBusqueda = obtenerValorTexto(INT-02-INP-01)
    uInt8_LongitudBusqueda = contarCaracteres(str50_ParametroBusqueda)

    Si uInt8_LongitudBusqueda < 3 y uInt8_LongitudBusqueda > 0 Entonces
        DetenerEjecucion() // Evita saturar la BD por cada letra, espera a 3 chars
    FinSi

    Si uInt8_LongitudBusqueda >= 3 Entonces
        obj_ListaPacientes = buscarRegistros("TABLE_PACIENTE", str50_ParametroBusqueda, uInt8_LimiteResultados)
    Sino
        obj_ListaPacientes = cargarPacientesRecientes("TABLE_PACIENTE", uInt8_LimiteResultados)
    FinSi

    limpiarGrilla(INT-02-TBL-01)

    Si obj_ListaPacientes.estaVacia() = true Entonces
        MostrarMensajeInteractivo("No se encontraron pacientes coincidentes.")
    Sino
        Para uInt8_IndiceFor = 0 Hasta (obj_ListaPacientes.longitud() - 1) con paso 1 Hacer
            agregarFilaGrilla(INT-02-TBL-01, obj_ListaPacientes.obtener(uInt8_IndiceFor).getIdInterno())
        FinPara
    FinSi
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
Unsigned int8 uInt8_FilasMostradas
Boolean bool_DatosModificados

uInt8_FilasMostradas = contarFilas(INT-02-TBL-01)
Verificar uInt8_FilasMostradas <= 50

bool_DatosModificados = verificarCambiosPendientesEnBD("TABLE_PACIENTE")
Verificar bool_DatosModificados = false

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0003' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0003' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0003' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0003' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-02', 'INT-02-INP-01', 'INT-02-TBL-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0004: Visualizar ficha del paciente seleccionado
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0004 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Visualizar ficha del paciente seleccionado',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0004'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0002',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para visualizar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnPacientes(BTN-09)
)
Fin Precondiciones',
    'Inicio
Unsigned int32 uInt32_IdPacienteSeleccionado
Paciente obj_PacienteFicha

Si usuario.click(btnVerFicha(INT-02-BTN-02)) Entonces
    uInt32_IdPacienteSeleccionado = obtenerIdFilaActiva(INT-02-TBL-01)

    Si uInt32_IdPacienteSeleccionado = 0 o uInt32_IdPacienteSeleccionado = null Entonces
        MostrarMensaje("Debe seleccionar un paciente de la grilla primero.")
        Finalizar procedimiento
    FinSi

    obj_PacienteFicha = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteSeleccionado)

    Si obj_PacienteFicha = null Entonces
        MostrarMensaje("El expediente del paciente seleccionado no se encuentra disponible.")
        Finalizar procedimiento
    FinSi

    poblarDatosVista(INT-02-A, obj_PacienteFicha)
    RedirigirVista(INT-02-A)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Boolean bool_DatosModificados

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

bool_DatosModificados = verificarCambiosPendientesEnBD("TABLE_PACIENTE")
Verificar bool_DatosModificados = false
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0004' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0004' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0004' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0004' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-02', 'INT-02-TBL-01', 'INT-02-BTN-02', 'INT-02-A')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0005: Generar constancia de atención del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0005 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Generar constancia de atención del paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0005'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0002',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para generar documentos.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnVerFicha(INT-02-BTN-02)
)
Fin Precondiciones',
    'Inicio
Unsigned int32 uInt32_IdPacienteActivo
Boolean bool_AtencionesValidas
ArchivoPDF obj_ConstanciaEnMemoria

uInt32_IdPacienteActivo = obtenerIdContextoVista(INT-02-A)
Si uInt32_IdPacienteActivo = 0 o uInt32_IdPacienteActivo = null Entonces
    MostrarMensaje("No se pudo identificar al paciente en la vista actual.")
    Finalizar procedimiento
FinSi

Si usuario.click(btnConstancia(INT-02-BTN-01)) Entonces
    bool_AtencionesValidas = verificarAtencionesPrevias("TABLE_CITAS", uInt32_IdPacienteActivo)
    Si bool_AtencionesValidas = false Entonces
        MostrarMensaje("El paciente no registra atenciones previas.")
        Finalizar procedimiento
    FinSi

    obj_ConstanciaEnMemoria = compilarConstanciaPDF(uInt32_IdPacienteActivo)
    Si obj_ConstanciaEnMemoria = null Entonces
        MostrarMensaje("Ocurrió un error al procesar el archivo PDF.")
        Finalizar procedimiento
    FinSi

    renderizarDocumentoEnPantalla(obj_ConstanciaEnMemoria)
    liberarBufferMemoria(obj_ConstanciaEnMemoria)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Boolean bool_DatosModificados

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

bool_DatosModificados = verificarCambiosPendientesEnBD("TABLE_PACIENTE")
Verificar bool_DatosModificados = false

MostrarMensaje("Documento generado con éxito.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0005' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0005' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0005' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0005' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-02-A', 'INT-02-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0006: Generar constancia de atención del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0006 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Generar constancia de atención del paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0006'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0003',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para editar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnEditarDatos(INT-02-A-BTN-01)
)
Fin Precondiciones',
    'Inicio
Unsigned int32 uInt32_IdPacienteActivo
Paciente obj_PacienteActual
String[50] str50_Nombres
String[50] str50_Apellidos
String[9] str9_Telefono
Date date_FechaNacimiento
String[100] str100_Direccion
Boolean bool_HayCambios

uInt32_IdPacienteActivo = obtenerIdContextoVista(INT-003)
obj_PacienteActual = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteActivo)
Si obj_PacienteActual = null Entonces
    MostrarMensaje("No se pudo cargar el perfil del paciente.")
    Finalizar procedimiento
FinSi

Si usuario.putIn(Input(INT-003-INP-01)) Entonces
    str50_Nombres = obtenerValorTexto(INT-003-INP-01)
FinSi
Si usuario.putIn(Input(INT-003-INP-02)) Entonces
    str50_Apellidos = obtenerValorTexto(INT-003-INP-02)
FinSi
Si usuario.putIn(Input(INT-003-INP-03)) Entonces
    str9_Telefono = obtenerValorTexto(INT-003-INP-03)
FinSi
Si usuario.putIn(Input(INT-003-INP-04)) Entonces
    date_FechaNacimiento = obtenerValorFecha(INT-003-INP-04)
FinSi
Si usuario.putIn(Input(INT-003-INP-05)) Entonces
    str100_Direccion = obtenerValorTexto(INT-003-INP-05)
FinSi

Si usuario.click(btnGuardarCambios(INT-003-BTN-01)) Entonces
    Si str50_Nombres = "" o str50_Nombres = null Entonces
        MostrarMensaje("Los Nombres son obligatorios.")
        ResaltarCampo(INT-003-INP-01)
        Finalizar procedimiento
    FinSi
    Si str50_Apellidos = "" o str50_Apellidos = null Entonces
        MostrarMensaje("Los Apellidos son obligatorios.")
        ResaltarCampo(INT-003-INP-02)
        Finalizar procedimiento
    FinSi
    Si str9_Telefono <> "" y str9_Telefono <> null Entonces
        Si longitud(str9_Telefono) <> 9 o validarSoloDigitos(str9_Telefono) = false Entonces
            MostrarMensaje("El Teléfono debe contener exactamente 9 dígitos numéricos.")
            ResaltarCampo(INT-003-INP-03)
            Finalizar procedimiento
        FinSi
    FinSi

    bool_HayCambios = false
    Si str50_Nombres <> obj_PacienteActual.getNombres() Entonces bool_HayCambios = true FinSi
    Si str50_Apellidos <> obj_PacienteActual.getApellidos() Entonces bool_HayCambios = true FinSi
    Si str9_Telefono <> obj_PacienteActual.getTelefono() Entonces bool_HayCambios = true FinSi
    Si date_FechaNacimiento <> obj_PacienteActual.getFechaNacimiento() Entonces bool_HayCambios = true FinSi
    Si str100_Direccion <> obj_PacienteActual.getDireccion() Entonces bool_HayCambios = true FinSi

    Si bool_HayCambios = false Entonces
        MostrarMensaje("No se detectaron modificaciones para actualizar.")
        RedirigirVista(INT-02-A)
        Finalizar procedimiento
    FinSi

    obj_PacienteActual.setNombres(str50_Nombres)
    obj_PacienteActual.setApellidos(str50_Apellidos)
    obj_PacienteActual.setTelefono(str9_Telefono)
    obj_PacienteActual.setFechaNacimiento(date_FechaNacimiento)
    obj_PacienteActual.setDireccion(str100_Direccion)
    obj_PacienteActual.setUsuarioModificacion(usuarioActual.getId())
    obj_PacienteActual.setFechaModificacion(obtenerFechaActual())

    actualizarRegistro("TABLE_PACIENTE", obj_PacienteActual)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Paciente obj_PacienteVerificacion

obj_PacienteVerificacion = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteActivo)
Verificar obj_PacienteVerificacion.getFechaModificacion() = obtenerFechaActual()

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

MostrarMensaje("Registro actualizado con éxito.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0006' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0006' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0006' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0006' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0006' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-02-A', 'INT-003', 'INT-003-INP-01', 'INT-003-INP-02', 'INT-003-INP-03', 'INT-003-INP-04', 'INT-003-INP-05', 'INT-003-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0007: Cancelar actualización de datos del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0007 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cancelar actualización de datos del paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0007'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0003',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para editar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnEditarDatos(INT-02-A-BTN-01)
)
Fin Precondiciones',
    'Inicio
Si usuario.click(btnCancelarCambios(INT-003-BTN-02)) Entonces
    limpiarCamposVista(INT-003)
    descartarCambiosTemporales()
    MostrarMensaje("Se canceló la actualización de datos.")
    RedirigirVista(INT-02-A)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Boolean bool_CambiosDescartados

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

bool_CambiosDescartados = verificarBufferVacio(INT-003)
Verificar bool_CambiosDescartados = true

MostrarMensaje("No se modificó ningún registro.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0007' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0007' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0007' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0007' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0007' AND av.version = '1.0.0' AND aa.codigo IN ('INT-02-A', 'INT-003', 'INT-003-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0008: Baja lógica / Archivo histórico de paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0008 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Baja lógica / Archivo histórico de paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0008'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0004',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para archivar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnArchivarPaciente(INT-02-A-BTN-02)
)
Fin Precondiciones',
    'Inicio
Unsigned int32 uInt32_IdPacienteActivo
Paciente obj_PacienteActual
Unsigned int8 uInt8_IdMotivo
String[200] str200_Observaciones
String[20] str20_NuevoEstado

uInt32_IdPacienteActivo = obtenerIdContextoVista(INT-04)
obj_PacienteActual = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteActivo)
Si obj_PacienteActual = null Entonces
    MostrarMensaje("No se pudo cargar el perfil del paciente.")
    Finalizar procedimiento
FinSi

Si usuario.click(Dropdown(INT-004-DPD-01)) Entonces
    uInt8_IdMotivo = obtenerSeleccionNumerica(INT-004-DPD-01)
FinSi
Si usuario.putIn(Input(INT-004-INP-01)) Entonces
    str200_Observaciones = obtenerValorTexto(INT-004-INP-01)
FinSi

Si usuario.click(btnConfirmarArchivar(INT-004-BTN-01)) Entonces
    Si uInt8_IdMotivo = 0 o uInt8_IdMotivo = null Entonces
        MostrarMensaje("Es obligatorio seleccionar un motivo de cambio de estado.")
        ResaltarCampo(INT-004-DPD-01)
        Finalizar procedimiento
    FinSi

    Si obj_PacienteActual.getEstado() = "ACTIVO" Entonces
        str20_NuevoEstado = "ARCHIVO_HISTORICO"
    Sino
        str20_NuevoEstado = "ACTIVO"
    FinSi

    obj_PacienteActual.setEstado(str20_NuevoEstado)
    obj_PacienteActual.setIdMotivoCambio(uInt8_IdMotivo)
    Si str200_Observaciones <> "" Entonces
        obj_PacienteActual.setObservacionesCambio(str200_Observaciones)
    FinSi
    obj_PacienteActual.setUsuarioResponsableCambio(usuarioActual.getId())
    obj_PacienteActual.setFechaCambioEstado(obtenerFechaActual())

    actualizarRegistro("TABLE_PACIENTE", obj_PacienteActual)

    Si str20_NuevoEstado = "ARCHIVO_HISTORICO" Entonces
        bloquearProgramacionCitas(uInt32_IdPacienteActivo)
    Sino
        habilitarProgramacionCitas(uInt32_IdPacienteActivo)
    FinSi
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Paciente obj_PacienteVerificacion

obj_PacienteVerificacion = consultarPacientePorId("TABLE_PACIENTE", uInt32_IdPacienteActivo)
Verificar obj_PacienteVerificacion.getEstado() = str20_NuevoEstado

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

MostrarMensaje("El estado del paciente fue actualizado correctamente.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0008' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0008' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0008' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0008' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0008' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-09', 'INT-004', 'INT-004-DPD-01', 'INT-004-INP-01', 'INT-004-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0009: Cancelar baja lógica / archivo de paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0009 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cancelar baja lógica / archivo de paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0009'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0004',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para archivar pacientes.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(
    btnArchivarPaciente(INT-02-A-BTN-02)
)
Fin Precondiciones',
    'Inicio
Si usuario.click(btnCancelarCambios(INT-004-BTN-02)) Entonces
    limpiarCamposVista(INT-004)
    descartarCambiosTemporales()
    MostrarMensaje("Se canceló el cambio de estado del paciente.")
    RedirigirVista(INT-02-A)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
String[15] str15_VistaActual
Boolean bool_CambiosDescartados

str15_VistaActual = obtenerVistaActiva()
Verificar str15_VistaActual = "INT-02-A"

bool_CambiosDescartados = verificarBufferVacio(INT-004)
Verificar bool_CambiosDescartados = true

MostrarMensaje("No se modificó ningún registro.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0009' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0009' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0009' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0009' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0009' AND av.version = '1.0.0' AND aa.codigo IN ('INT-02-A', 'INT-004', 'INT-004-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0010: Registro y programación de nueva cita médica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0010 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registro y programación de nueva cita médica',
    '2026-07-02',
    'Vital',
    'Concluido',
    'Estructura de pseudocódigo adaptada para garantizar el comportamiento transaccional del módulo de agendamiento de citas en base de datos.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0010'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0005',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"

sesionValida = validarSesion()

Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi

usuarioActual = obtenerUsuarioSesion()

permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")

Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para gestionar la agenda.")
    Finalizar procedimiento
FinSi

conexionBD = verificarConexionBD(BD_en_uso)

Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi

usuario.click(
    btnNuevaCita(INT-06-BTN-03)
)

Fin Precondiciones',
    'Inicio

String pacCod
String especialidad
Date citaFecha
Time citaHoraInicio
Integer citaDuracion
String fisioteraCod
Boolean camposCompletos
Boolean cruceHorarios
Cita nuevaCita

renderizarInterfaz("INT-05")
MostrarTextoEstatico(INT-05-TXT-01, "Programación de Nueva Cita Médica")

pacCod = usuario.select(INT-05-DPD-01)
especialidad = usuario.select(INT-05-DPD-02)

Si especialidad <> null Entonces
    filtrarFisioterapeutasDropdown(INT-05-DPD-04, especialidad)
FinSi

citaFecha = usuario.input(INT-05-DPD-03)
citaHoraInicio = usuario.select(INT-05-DPD-05).getHora()
citaDuracion = usuario.select(INT-05-DPD-05).getDuracion()
fisioteraCod = usuario.select(INT-05-DPD-04)

Si usuario.click(INT-05-BTN-02) Entonces
    limpiarCamposFormulario()
    Redirigir("INT-06")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-05-BTN-01) Entonces

        camposCompletos = verificarCamposObligatorios(pacCod, fisioteraCod, citaFecha, citaHoraInicio)
    
    Si camposCompletos = false Entonces
        MostrarMensaje(INT-05-TXT-02) // "Error no se puede crear la cita"
        Finalizar procedimiento
    FinSi

    cruceHorarios = verificarCruceHorariosTransaccional(fisioteraCod, citaFecha, citaHoraInicio, citaDuracion)
    
    Si cruceHorarios = true Entonces
        MostrarMensaje(INT-05-TXT-02)
        Finalizar procedimiento
    FinSi

    nuevaCita = new Cita()
    nuevaCita.setPacCod(pacCod)
    nuevaCita.setFisioteraCod(fisioteraCod)
    nuevaCita.setCitaFecha(citaFecha)
    nuevaCita.setCitaHoraInicio(citaHoraInicio)
    nuevaCita.setCitaDuracion(citaDuracion)
    nuevaCita.setEstado("Programada")

    INSERT INTO cita VALUES (nuevaCita)
    
    Redirigir("INT-06")

FinSi
Fin Procedimiento',
    'Inicio Postcondiciones

Boolean citaRegistrada
String estadoCita
Boolean bloqueHorarioBloqueado

citaRegistrada = existeRegistroCita(pacCod, fisioteraCod, citaFecha, citaHoraInicio)

Si citaRegistrada = true Entonces

    estadoCita = obtenerEstadoCita(pacCod, fisioteraCod, citaFecha, citaHoraInicio)
    Verificar estadoCita = "Programada"

    bloqueHorarioBloqueado = verificarBloqueoAgenda(fisioteraCod, citaFecha, citaHoraInicio, citaDuracion)
    Verificar bloqueHorarioBloqueado = true

FinSi

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0010' AND av.version = '1.0.0' AND aa.codigo IN ('INT-06-BTN-03', 'INT-05', 'INT-05-TXT-01', 'INT-05-TXT-02', 'INT-05-DPD-01', 'INT-05-DPD-02', 'INT-05-DPD-03', 'INT-05-DPD-04', 'INT-05-DPD-05', 'INT-05-BTN-01', 'INT-05-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0011: Consulta y visualización de la agenda de citas médicas
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0011 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Consulta y visualización de la agenda de citas médicas',
    '2026-07-02',
    'Vital',
    'Concluido',
    'Esta especificación asegura el comportamiento aislado de las lecturas relacionales de la agenda médica mediante sentencias controladas de tipo JOIN, impidiendo operaciones de escritura involuntarias en las entidades transaccionales.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0011'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0006',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
Integer conteoCitas
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"

sesionValida = validarSesion()

Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi

usuarioActual = obtenerUsuarioSesion()

permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")

Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para visualizar la agenda médica.")
    Finalizar procedimiento
FinSi

conexionBD = verificarConexionBD(BD_en_uso)

Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi

conteoCitas = ejecutarQuery("SELECT COUNT(*) FROM cita")

Si conteoCitas = 0 Entonces
    MostrarMensaje("No existen registros de citas en el sistema.")
    Finalizar procedimiento
FinSi

usuario.click(
    btnModuloMonitoreo()
)

Fin Precondiciones',
    'Inicio

Date fechaFiltro
String especialidadFiltro
String fisioteraCodFiltro
String pacCodFiltro
ResultSet listaCitas
Boolean botonPresionado

renderizarInterfaz("INT-06")

(Fecha actual del servidor)
fechaFiltro = obtenerFechaActualServidor()

listaCitas = ejecutarQuery("SELECT * FROM cita WHERE citaFecha = " + fechaFiltro + " ORDER BY citaHoraInicio ASC")
cargarDatosEnGrilla(INT-06-TBL-01, listaCitas)

especialidadFiltro = usuario.select(INT-06-DPD-01)

Si especialidadFiltro <> null Entonces
    filtrarFisioterapeutasDropdown(INT-06-DPD-02, especialidadFiltro)
FinSi

fisioteraCodFiltro = usuario.select(INT-06-DPD-02)
fechaFiltro = usuario.input(INT-06-INP-01)
pacCodFiltro = usuario.select(INT-06-BTN-03)

Si usuario.click(INT-06-BTN-02) Entonces
    
    listaCitas = ejecutarQuery("SELECT c.citaFecha, c.citaHoraInicio, c.citaDuracion, p.nombre, f.nombre 
                                FROM cita c 
                                JOIN fisioterapeuta f ON c.fisioteraCod = f.fisioteraCod 
                                JOIN paciente p ON c.pacCod = p.pacCod 
                                WHERE (c.citaFecha = fechaFiltro)
                                AND (fisioteraCodFiltro IS NULL OR c.fisioteraCod = fisioteraCodFiltro)
                                AND (pacCodFiltro IS NULL OR c.pacCod = pacCodFiltro)
                                ORDER BY c.citaHoraInicio ASC")
                                
    actualizarGrilla(INT-06-TBL-01, listaCitas)
FinSi

Si usuario.click(INT-06-TBL-01.filaSeleccionada.INT-06-BTN-06) Entonces
    desplegarOpcionesContextuales(INT-06-BTN-07, INT-06-BTN-08)
    
    Si usuario.click(INT-06-BTN-07) Entonces
        dispararFlujoCheckIn(INT-06-TBL-01.filaSeleccionada.idCita)
    FinSi
    
    Si usuario.click(INT-06-BTN-08) Entonces
        generarReportePDFAsistencia(INT-06-TBL-01.filaSeleccionada.idCita)
    FinSi
FinSi

Si usuario.click(INT-06-BTN-01) Entonces
    Redirigir("INT-05")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-06-BTN-04) Entonces
    Redirigir("INT-07")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-06-BTN-05) Entonces
    Redirigir("INT-08") 
    Finalizar procedimiento
FinSi

Fin Procedimiento',
    'Inicio Postcondiciones

Boolean grillaRenderizada
Boolean baseDeDatosIntacta

grillaRenderizada = verificarComponenteVisible(INT-06-TBL-01)
Verificar grillaRenderizada = true

baseDeDatosIntacta = verificarIntegridadTablas("cita", "fisioterapeuta", "paciente")
Verificar baseDeDatosIntacta = true

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0007'
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
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0' AND f.codigo = 'FUE-0005'
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
WHERE a.codigo = 'ESP-0011' AND av.version = '1.0.0' AND aa.codigo IN ('INT-06', 'INT-06-DPD-01', 'INT-06-DPD-02', 'INT-06-INP-01', 'INT-06-BTN-01', 'INT-06-BTN-02', 'INT-06-BTN-03', 'INT-06-BTN-04', 'INT-06-BTN-05', 'INT-06-BTN-06', 'INT-06-BTN-07', 'INT-06-BTN-08', 'INT-06-TBL-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0012: Modificación y reprogramación de citas médicas
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0012 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Modificación y reprogramación de citas médicas',
    '2026-07-14',
    'Vital',
    'Concluido',
    'Esta especificación Asegura que los cambios en la agenda mantengan la consistencia y eviten colisiones de turnos para un mismo especialista en tiempo real.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0012'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0007',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
Long idCitaSeleccionada
Cita citaOriginal
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"

sesionValida = validarSesion()

Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi

usuarioActual = obtenerUsuarioSesion()

permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")

Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para modificar la agenda.")
    Finalizar procedimiento
FinSi

conexionBD = verificarConexionBD(BD_en_uso)

Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi

idCitaSeleccionada = obtenerFilaSeleccionada(INT-06-TBL-01)

Si idCitaSeleccionada = null Entonces
    MostrarMensaje("Debe seleccionar una cita para modificar.")
    Finalizar procedimiento
FinSi

citaOriginal = obtenerCita(idCitaSeleccionada)

Si citaOriginal = null O citaOriginal.getEstado() <> "Programada" Entonces
    MostrarMensaje("La cita seleccionada no existe o no se encuentra en estado ''Programada''.")
    Finalizar procedimiento
FinSi

usuario.click(
    INT-06-BTN-04
)

Fin Precondiciones',
    'Inicio

Long idCita
String pacCodOriginal
String especialidadNueva
String fisioteraCodNuevo
Date citaFechaNueva
Time citaHoraInicioNueva
Integer citaDuracionNueva
Boolean cruceHorarios
Cita citaModificada

idCita = obtenerFilaSeleccionada(INT-06-TBL-01)
citaOriginal = obtenerCita(idCita)

renderizarInterfaz("INT-07")
MostrarTextoEstatico(INT-07-TXT-01, "Modificación de Cita Médica")

pacCodOriginal = citaOriginal.getPacCod()
establecerValorSoloLectura(INT-07-DPD-01, pacCodOriginal)

especialidadNueva = usuario.select(INT-07-DPD-02)

Si especialidadNueva <> null Entonces
    filtrarFisioterapeutasDropdown(INT-07-DPD-04, especialidadNueva)
FinSi

fisioteraCodNuevo = usuario.select(INT-07-DPD-04)
citaFechaNueva = usuario.input(INT-07-DPD-03)
citaHoraInicioNueva = usuario.select(INT-07-DPD-05).getHora()
citaDuracionNueva = usuario.select(INT-07-DPD-05).getDuracion()

Si usuario.click(INT-07-BTN-02) Entonces
    Redirigir("INT-06")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-07-BTN-01) Entonces

    cruceHorarios = verificarCruceHorariosTransaccional(
        fisioteraCodNuevo,
        citaFechaNueva,
        citaHoraInicioNueva,
        citaDuracionNueva,
        idCita
    )

    Si cruceHorarios = true Entonces
        MostrarMensaje(INT-07-TXT-02)
        Finalizar procedimiento
    FinSi

    citaModificada = new Cita()
    citaModificada.setId(idCita)
    citaModificada.setFisioteraCod(fisioteraCodNuevo)
    citaModificada.setCitaFecha(citaFechaNueva)
    citaModificada.setCitaHoraInicio(citaHoraInicioNueva)

    UPDATE cita
    SET fisioteraCod = citaModificada.fisioteraCod,
        citaFecha = citaModificada.citaFecha,
        citaHoraInicio = citaModificada.citaHoraInicio
    WHERE idCita = idCita

    registrarAuditoriaCambio(idCita, usuarioActual)
    cerrarModal("INT-07")
    Redirigir("INT-06")

FinSi

Fin Procedimiento',
    'Inicio Postcondiciones

Boolean citaActualizada
Boolean anteriorHorarioLiberado
Boolean nuevoHorarioBloqueado
Cita citaVerificacion

citaVerificacion = obtenerCita(idCita)

Si citaVerificacion.getFisioteraCod() = fisioteraCodNuevo Y citaVerificacion.getCitaFecha() = citaFechaNueva Y citaVerificacion.getCitaHoraInicio() = citaHoraInicioNueva Entonces
    citaActualizada = true
Sino
    citaActualizada = false
FinSi

Verificar citaActualizada = true

anteriorHorarioLiberado = verificarDisponibilidadHorario(
    citaOriginal.getFisioteraCod(),
    citaOriginal.getCitaFecha(),
    citaOriginal.getCitaHoraInicio(),
    citaOriginal.getCitaDuracion()
)

Verificar anteriorHorarioLiberado = true

nuevoHorarioBloqueado = verificarBloqueoAgenda(
    fisioteraCodNuevo,
    citaFechaNueva,
    citaHoraInicioNueva,
    citaDuracionNueva
)

Verificar nuevoHorarioBloqueado = true

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0012' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0012' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ESP-0012' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0012' AND av.version = '1.0.0' AND f.codigo = 'FUE-0005'
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
WHERE a.codigo = 'ESP-0012' AND av.version = '1.0.0' AND aa.codigo IN ('INT-06-BTN-04', 'INT-07', 'INT-07-TXT-01', 'INT-07-TXT-02', 'INT-07-DPD-01', 'INT-07-DPD-02', 'INT-07-DPD-03', 'INT-07-DPD-04', 'INT-07-DPD-05', 'INT-07-BTN-01', 'INT-07-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0013: Cancelación de una cita
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0013 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cancelación de una cita',
    '2026-07-14',
    'Vital',
    'Concluido',
    'Cumple con la regla de negocio de cancelación controlada mediante eliminación lógica y verificación temporal de 6 horas previas al bloque de reserva.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0013'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0008',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
Long idCitaSeleccionada
Cita citaOriginal
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"

sesionValida = validarSesion()

Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi

usuarioActual = obtenerUsuarioSesion()

permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")

Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para cancelar citas.")
    Finalizar procedimiento
FinSi

conexionBD = verificarConexionBD(BD_en_uso)

Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi

idCitaSeleccionada = obtenerFilaSeleccionada(INT-06-TBL-01)

Si idCitaSeleccionada = null Entonces
    MostrarMensaje("Debe seleccionar una cita para cancelar.")
    Finalizar procedimiento
FinSi

citaOriginal = obtenerCita(idCitaSeleccionada)

Si citaOriginal = null O citaOriginal.getEstado() <> "Programada" Entonces
    MostrarMensaje("La cita seleccionada no existe o no se encuentra activa.")
    Finalizar procedimiento
FinSi

usuario.click(
    INT-06-BTN-05
)

Fin Precondiciones',
    'Inicio

Long idCita
Cita citaOriginal
String motivoCancelacion
DateTime fechaHoraActual
DateTime fechaHoraCita
Decimal horasDiferencia

idCita = obtenerFilaSeleccionada(INT-06-TBL-01)
citaOriginal = obtenerCita(idCita)

renderizarInterfaz("INT-08")
MostrarTextoEstatico(INT-08-TXT-01, "¿Está seguro de que desea anular la siguiente cita?")
MostrarTextoEstatico(INT-08-TXT-02, citaOriginal.getResumenDetallado())

fechaHoraActual = obtenerFechaHoraActual()
fechaHoraCita = combinarFechaHora(citaOriginal.getCitaFecha(), citaOriginal.getCitaHoraInicio())
horasDiferencia = calcularDiferenciaHoras(fechaHoraActual, fechaHoraCita)

Si horasDiferencia < 6.0 Entonces
    MostrarMensaje("No es posible realizar la cancelación. La norma exige un mínimo de 6 horas de anticipación.")
    cerrarModal("INT-08")
    Redirigir("INT-06")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-08-BTN-02) Entonces
    cerrarModal("INT-08")
    Redirigir("INT-06")
    Finalizar procedimiento
FinSi

Si usuario.click(INT-08-BTN-01) Entonces

    motivoCancelacion = usuario.input(INT-08-INP-01)

    Si motivoCancelacion = null O motivoCancelacion = "" Entonces
        MostrarMensaje("El motivo de cancelación es obligatorio.")
        Finalizar procedimiento
    FinSi

    UPDATE cita
    SET estado = ''Cancelada'',
        motivoCancelacion = motivoCancelacion,
        fechaModificacion = obtenerFechaActual(),
        horaModificacion = obtenerHoraActual(),
        usuarioModificacion = usuarioActual.getNombre()
    WHERE idCita = idCita

    registrarAuditoriaCambio(idCita, usuarioActual)
    liberarHorarioAgenda(
        citaOriginal.getFisioteraCod(),
        citaOriginal.getCitaFecha(),
        citaOriginal.getCitaHoraInicio(),
        citaOriginal.getCitaDuracion()
    )

    cerrarModal("INT-08")
    Redirigir("INT-06")

FinSi

Fin Procedimiento',
    'Inicio Postcondiciones

Boolean estadoActualizado
Boolean horarioLiberado
Cita citaVerificacion

citaVerificacion = obtenerCita(idCita)

Si citaVerificacion.getEstado() = "Cancelada" Y citaVerificacion.getMotivoCancelacion() <> null Entonces
    estadoActualizado = true
Sino
    estadoActualizado = false
FinSi

Verificar estadoActualizado = true

horarioLiberado = verificarDisponibilidadHorario(
    citaOriginal.getFisioteraCod(),
    citaOriginal.getCitaFecha(),
    citaOriginal.getCitaHoraInicio(),
    citaOriginal.getCitaDuracion()
)

Verificar horarioLiberado = true

MostrarMensaje("La cita fue cancelada correctamente.")

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0013' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0013' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0003'
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
WHERE a.codigo = 'ESP-0013' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0013' AND av.version = '1.0.0' AND f.codigo = 'FUE-0005'
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
WHERE a.codigo = 'ESP-0013' AND av.version = '1.0.0' AND aa.codigo IN ('INT-06-TBL-01', 'INT-06-BTN-05', 'INT-08', 'INT-08-TXT-01', 'INT-08-TXT-02', 'INT-08-INP-01', 'INT-08-BTN-01', 'INT-08-BTN-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0014: Registro de Seguimiento Clínico
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0014 v00.01
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '00.01',
    'Registro de Seguimiento Clínico',
    '2026-07-09',
    'Opcional',
    'Concluido',
    'Permite registrar los indicadores clínicos de seguimiento antes de una sesión terapéutica. El sistema valida la información y la almacena en la tabla SEGUIMIENTO_CLINICO, de tal forma permite la generación de gráficos evolutivos para apoyar el monitoreo del paciente.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0014'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0009',
    'INICIO

    VALIDAR usuario.inicioSesion = ACTIVO
    VALIDAR usuario.rol = "Recepcionista"

    VALIDAR usuario.permisos incluye:
        "REGISTRAR_SEGUIMIENTO"

    VALIDAR conexionBaseDatos(
        "OMVITAL_DB_PACIENTS"
    ) = DISPONIBLE

    VALIDAR paciente = REGISTRADO

    VALIDAR cita.estado = ACTIVA

    VALIDAR accesoModulo =
        "Panel de Turno"

FIN',
    'INICIO

    Usuario accede al
    Panel de Turno.


    Usuario selecciona
    un paciente.


    Usuario presiona
    "Registrar Seguimiento".


    SISTEMA recupera la
    información básica del paciente.


    SISTEMA muestra la
    interfaz Registro de
    Seguimiento Clínico.


    Usuario selecciona:

        sesión terapéutica


    Usuario registra:

        EVA

        Fuerza

        Movilidad

        Resistencia

        Observaciones


    Usuario presiona
    "Guardar Seguimiento".


    SISTEMA valida:

        paciente registrado

        sesión seleccionada

        EVA válido

        Fuerza válida

        Movilidad válida

        Resistencia válida

        campos obligatorios


    SI validaciónCorrecta = VERDADERO ENTONCES


        SISTEMA registra
        la evaluación clínica.


        SISTEMA almacena
        la información en
        "SEGUIMIENTO_CLINICO".


        SISTEMA confirma
        el registro exitoso.


    SINO


        SISTEMA muestra
        mensajes de error.


    FIN SI

FIN',
    'SI registroExitoso = VERDADERO ENTONCES

    seguimiento.estado = REGISTRADO

    seguimiento.disponible = VERDADERO

    historial.actualizado = VERDADERO

    dashboard.actualizable = VERDADERO

SINO

    seguimiento.estado = NO_REGISTRADO

FIN SI'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0014' AND av.version = '00.01'
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
WHERE a.codigo = 'ESP-0014' AND av.version = '00.01' AND aut.codigo = 'AUT-0009'
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
WHERE a.codigo = 'ESP-0014' AND av.version = '00.01' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0014' AND av.version = '00.01' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0014' AND av.version = '00.01' AND aa.codigo IN ('INT-021-BTN-003', 'INT-009-BTN-01', 'INT-009-IMG-01', 'INT-009-PNL-01', 'INT-009-DPD-01', 'INT-009-DTP-01', 'INT-009-CMB-01', 'INT-009-CMB-02', 'INT-009-CMB-03', 'INT-009-CMB-04', 'INT-009-IMP-01', 'INT-009-BTN-02', 'INT-009-BTN-03')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0015: Visualización de Seguimiento Clínico
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0015 v00.01
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '00.01',
    'Visualización de Seguimiento Clínico',
    '2026-07-16',
    'Opcional',
    'Concluido',
    'Permite consultar la evolucion clinica mediante graficos y registro historico almacenado en la tabla SEGUIMIENTO_CLINICO. La especificación se encarga de la generación automática de gráficos de EVA, fuerza, movilidad y resistencia. Además, el sistema permite generar reportes clínicos en formato PDF con información del paciente y exportar la evolución en formato Excel para análisis posterior y seguimiento administrativo.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0015'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0010',
    'INICIO

    VALIDAR usuario.inicioSesion = ACTIVO

    VALIDAR usuario.rol = "Recepcionista"

    VALIDAR usuario.permisos incluye:
        "CONSULTAR_SEGUIMIENTO"

    VALIDAR conexionBaseDatos(
        "OMVITAL_DB_PACIENTS"
    ) = DISPONIBLE

    VALIDAR paciente = REGISTRADO

    VALIDAR existenRegistrosSeguimiento = VERDADERO

    VALIDAR accesoModulo =
        "Panel de Turno"

FIN',
    'INICIO

    Usuario accede al Panel de Turno.
    Usuario selecciona un paciente.

    Usuario presiona   "Ver Progreso".

    SISTEMA recupera la información del paciente.

    SISTEMA consulta la tabla
    "SEGUIMIENTO_CLINICO".

    SISTEMA obtiene las evaluaciones del paciente.

    SISTEMA ordena los registros por fecha de evaluación.


    SISTEMA genera:

        gráfico EVA
        gráfico Fuerza
        gráfico Movilidad
        gráfico Resistencia

    SISTEMA construye la tabla histórica de evaluaciones.
    SISTEMA muestra la interfaz visualización de Seguimiento Clínico.


    Usuario puede seleccionar:
        "Generar Reporte PDF"
        "Exportar Evolución"

    SI usuario selecciona
    "Generar Reporte PDF" ENTONCES
        SISTEMA genera documento PDF
        incluyendo:

            datos del paciente
            gráficos de evolución
            tabla histórica
            fecha de generación

    FIN SI


    SI usuario selecciona
    "Exportar Evolución" ENTONCES
        SISTEMA exporta la información
        en formato Excel (.xlsx).

    FIN SI
FIN',
    'SI consultaExitosa = VERDADERO ENTONCES

    panel.visible = VERDADERO
    reportes.habilitados = VERDADERO

SINO
    panel.visible = FALSO
    mostrarMensajeError

FIN SI'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0015' AND av.version = '00.01'
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
WHERE a.codigo = 'ESP-0015' AND av.version = '00.01' AND aut.codigo = 'AUT-0009'
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
WHERE a.codigo = 'ESP-0015' AND av.version = '00.01' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0015' AND av.version = '00.01' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0015' AND av.version = '00.01' AND aa.codigo IN ('SDB-02', 'LOG-01', 'BTN-07', 'BTN-08', 'BTN-09', 'BTN-10', 'BTN-11', 'PRF-02', 'BTN-12', 'INT-021-BTN-04', 'INT-010-IMG-01', 'INT-010-BTN-01', 'INT-010-PNL-01', 'INT-010-GRD-01', 'INT-010-GRD-02', 'INT-010-GRD-03', 'INT-010-GRD-04', 'INT-010-TBL-01', 'INT-010-BTN-02', 'INT-010-BTN-03')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0016: Consulta y gestión de historias clínicas y selección de evaluación inicial
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0016 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Consulta y gestión de historias clínicas y selección de evaluación inicial',
    '2026-06-18',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0016'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0011',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean existenPacientesBoolean registrosBloqueadosBoolean trazabilidadActivaUsuario fisioterapeutaActualString BD_en_usoBD_en_uso = "omvital_db_pacients"sesionValida = validarSesion()Si sesionValida = false Entonces  MostrarMensaje("La sesión ha expirado.")  Finalizar procedimientoFinSifisioterapeutaActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(  fisioterapeutaActual,  "FISIOTERAPEUTA")Si permisosValidos = false Entonces  MostrarMensaje("No posee permisos para gestionar historias clínicas.")  Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces  MostrarMensaje("No existe conexión con la base de datos.")  Finalizar procedimientoFinSiexistenPacientes = verificarPacientesRegistrados()Si existenPacientes = false Entonces  MostrarMensaje("No existen pacientes registrados para consultar.")  Finalizar procedimientoFinSiregistrosBloqueados = verificarBloqueoRegistrosClinicos()Si registrosBloqueados = true Entonces  MostrarMensaje("Los registros clínicos se encuentran bloqueados por cierre administrativo.")  Finalizar procedimientoFinSitrazabilidadActiva = verificarTrazabilidadClinica()Si trazabilidadActiva = false Entonces  MostrarMensaje("No se encuentra disponible el registro de trazabilidad clínica.")  Finalizar procedimientoFinSiusuario.click(BTN-03)MostrarInterfaz(INT-12)',
    'String criterioBusquedaLong idPacientePaciente pacienteSeleccionadoHistoriaClinica historiaClinicaEvaluacionInicial evaluacionInicialTipoEvaluacion tipoEvaluacionBoolean pacienteExisteBoolean evaluacionExisteBoolean accionRegistradaMostrarInterfaz(INT-12)MostrarTexto(INT-12-TXT-01, "Gestión de Historias Clínicas")criterioBusqueda = usuario.ingresarTexto(INT-12-INP-01)Si usuario.click(INT-12-BTN-01) Entonces  limpiarCampo(INT-12-INP-01)  limpiarResultados(INT-12-TBL-01)  retornarInterfaz(INT-12)FinSiSi usuario.click(INT-12-BTN-02) Entonces  Lista pacientesEncontrados  pacientesEncontrados = buscarPacientes(criterioBusqueda)  Si pacientesEncontrados.estaVacia() Entonces    MostrarMensaje("No se encontraron pacientes con el criterio ingresado.")  Sino    mostrarResultados(      INT-12-TBL-01,      pacientesEncontrados    )  FinSiFinSiidPaciente = obtenerPacienteSeleccionado(INT-12-TBL-01)pacienteSeleccionado = obtenerPaciente(idPaciente)pacienteExiste = pacienteSeleccionado <> nullSi pacienteExiste = false Entonces  MostrarMensaje("El paciente seleccionado no existe.")  Finalizar procedimientoFinSiSi usuario.click(INT-12-BTN-03) Entonces  evaluacionInicial = obtenerEvaluacionInicial(idPaciente)  evaluacionExiste = evaluacionInicial <> null  Si evaluacionExiste = true Entonces    tipoEvaluacion = obtenerTipoEvaluacion(evaluacionInicial)    Si tipoEvaluacion = TRAUMATOLOGICA Entonces      redirigirInterfaz(INT-13, idPaciente)    FinSi    Si tipoEvaluacion = GERONTO_PSICOMOTRIZ Entonces      redirigirInterfaz(INT-14, idPaciente)    FinSi  Sino    MostrarModal(INT-12-A-MDL-01)    MostrarTexto(      INT-12-A-TXT-01,      "Seleccione el tipo de evaluación inicial."    )    Si usuario.click(INT-12-A-BTN-02) Entonces      tipoEvaluacion = GERONTO_PSICOMOTRIZ      asociarTipoEvaluacionTemporal(        idPaciente,        tipoEvaluacion      )      cerrarModal()      redirigirInterfaz(INT-10, idPaciente)    FinSi    Si usuario.click(INT-12-A-BTN-03) Entonces      tipoEvaluacion = TRAUMATOLOGICA      asociarTipoEvaluacionTemporal(        idPaciente,        tipoEvaluacion      )      cerrarModal()      redirigirInterfaz(INT-09, idPaciente)    FinSi  FinSiFinSiSi usuario.click(INT-12-BTN-04) Entonces  evaluacionInicial = obtenerEvaluacionInicial(idPaciente)  Si evaluacionInicial = null Entonces    MostrarMensaje("El paciente no posee una ficha inicial para editar.")  Sino    tipoEvaluacion = obtenerTipoEvaluacion(evaluacionInicial)    Si tipoEvaluacion = TRAUMATOLOGICA Entonces      habilitarEdicion(INT-13, idPaciente)    FinSi    Si tipoEvaluacion = GERONTO_PSICOMOTRIZ Entonces      habilitarEdicion(INT-14, idPaciente)    FinSi  FinSiFinSiSi usuario.click(INT-12-BTN-05) Entonces  historiaClinica = obtenerHistoriaClinica(idPaciente)  Si historiaClinica = null Entonces    MostrarMensaje("El paciente no posee registros en su historial clínico.")  Sino    mostrarHistoriaClinica(      INT-11-TXT-01,      historiaClinica    )    mostrarSesiones(idPaciente)    mostrarNotasEvolucion(idPaciente)    mostrarTratamientos(idPaciente)    mostrarObservaciones(idPaciente)  FinSiFinSiSi usuario.click(INT-12-BTN-06) Entonces  mantenerPacienteSeleccionado(idPaciente)  redirigirModulo(BTN-02, idPaciente)FinSiSi existenMasResultados(INT-12-TBL-01) Entonces  usuario.seleccionarPagina(INT-12-TBL-01)  cargarPaginaSeleccionada()FinSiaccionRegistrada = registrarTrazabilidad(  fisioterapeutaActual,  idPaciente,  obtenerAccionRealizada(),  BD_en_uso)Si accionRegistrada = false Entonces  MostrarMensaje("No se pudo registrar la trazabilidad de la acción realizada.")FinSimantenerInformacionClinica(idPaciente)impedirBorradoPermanente(idPaciente)',
    'Inicio PostcondicionesPaciente pacienteHistoriaClinica historiaClinicaEvaluacionInicial evaluacionInicialBoolean trazabilidadRegistradaBoolean informacionDisponibleBoolean eliminacionPermanentepaciente = obtenerPaciente(idPaciente)historiaClinica = obtenerHistoriaClinica(idPaciente)evaluacionInicial = obtenerEvaluacionInicial(idPaciente)Si paciente <> null Entonces  Verificar paciente.getId() = idPaciente  Verificar pacienteDisponibleParaConsulta(idPaciente) = trueFinSiSi evaluacionInicial <> null Entonces  tipoEvaluacion = obtenerTipoEvaluacion(evaluacionInicial)  Verificar tipoEvaluacion = TRAUMATOLOGICA O tipoEvaluacion = GERONTO_PSICOMOTRIZ  Verificar evaluacionInicial.getPaciente() = pacienteFinSiSi historiaClinica <> null Entonces  Verificar historiaClinica.getPaciente() = paciente  Verificar registrosClinicosDisponibles(idPaciente) = true  Verificar sesionesDisponibles(idPaciente) = true  Verificar tratamientosDisponibles(idPaciente) = trueFinSitrazabilidadRegistrada = verificarTrazabilidad(idPaciente)informacionDisponible = verificarDisponibilidadClinica(idPaciente)eliminacionPermanente = verificarEliminacionPermanente(idPaciente)Verificar trazabilidadRegistrada = trueVerificar informacionDisponible = trueVerificar eliminacionPermanente = falseVerificar registroDisponibleParaActualizacion(idPaciente) = trueVerificar registroDisponibleParaArchivado(idPaciente) = trueVerificar registroDisponibleParaAnulacionJustificada(idPaciente) = trueVerificar registroDisponibleParaReportes(idPaciente) = true'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0016' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0016' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ESP-0016' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0016' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0016' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-12', 'INT-12-TXT-01', 'INT-12-INP-01', 'INT-12-BTN-01', 'INT-12-BTN-02', 'INT-12-TBL-01', 'INT-12-BTN-03', 'INT-12-BTN-04', 'INT-12-BTN-05', 'INT-12-BTN-06', 'INT-12-A-MDL-01', 'INT-12-A-TXT-01', 'INT-12-A-BTN-02', 'INT-12-A-BTN-03', 'INT-09', 'INT-10', 'INT-13', 'INT-14', 'INT-11-TXT-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0017: Consulta de Historial Clínico del Paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0017 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Consulta de Historial Clínico del Paciente',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0017'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0012',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean pacienteExisteBoolean historialExisteBoolean registrosDisponiblesBoolean historialDisponibleUsuario fisioterapeutaActualLong idPacienteString BD_en_usoBD_en_uso = "omvital_db_pacients"sesionValida = validarSesion()Si sesionValida = false Entonces  MostrarMensaje("La sesión ha expirado.")  Finalizar procedimientoFinSifisioterapeutaActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(  fisioterapeutaActual,  "FISIOTERAPEUTA")Si permisosValidos = false Entonces  MostrarMensaje("No posee permisos para consultar el historial clínico.")  Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces  MostrarMensaje("No existe conexión con la base de datos.")  Finalizar procedimientoFinSiidPaciente = obtenerPacienteSeleccionado()pacienteExiste = existePaciente(idPaciente)Si pacienteExiste = false Entonces  MostrarMensaje("El paciente seleccionado no se encuentra registrado.")  Finalizar procedimientoFinSihistorialExiste = existeHistoriaClinica(idPaciente)Si historialExiste = false Entonces  MostrarMensaje("El paciente no posee una historia clínica registrada.")  Finalizar procedimientoFinSiregistrosDisponibles = verificarSesionesYNotas(idPaciente)Si registrosDisponibles = false Entonces  MostrarMensaje("No existen sesiones ni notas clínicas disponibles.")  Finalizar procedimientoFinSihistorialDisponible = verificarEstadoHistoriaClinica(idPaciente)Si historialDisponible = false Entonces  MostrarMensaje("La historia clínica se encuentra anulada, archivada o bloqueada.")  Finalizar procedimientoFinSiusuario.click(BTN-03)MostrarInterfaz(INT-11)',
    'Long idPacienteLong idSesionPaciente pacienteHistoriaClinica historialClinicoLista sesionesClinicasLista notasClinicasString criterioFiltroBoolean actualizacionAutorizadaBoolean exportacionExitosaBoolean trazabilidadRegistradaidPaciente = obtenerPacienteSeleccionado()paciente = obtenerPaciente(idPaciente)historialClinico = obtenerHistoriaClinica(idPaciente)Si paciente = null Entonces  MostrarMensaje("El paciente seleccionado no existe.")  Finalizar procedimientoFinSiSi historialClinico = null Entonces  MostrarMensaje("No existe una historia clínica asociada al paciente.")  Finalizar procedimientoFinSiMostrarInterfaz(INT-11)MostrarTexto(INT-11-TXT-01, "Gestión de Historias Clínicas")MostrarImagen(INT-11-IMG-04, paciente.getImagenPerfil())MostrarTexto(INT-11-TXT-02, paciente.getNombreCompleto())MostrarTexto(  INT-11-TXT-03,  obtenerResumenClinico(idPaciente))sesionesClinicas = obtenerSesionesPaciente(idPaciente)notasClinicas = obtenerNotasSesiones(idPaciente)Si sesionesClinicas.estaVacia() Entonces  MostrarMensaje("El paciente no posee sesiones clínicas registradas.")Sino  ordenarSesionesPorFecha(sesionesClinicas)  mostrarLineaTiempo(sesionesClinicas)FinSiPara cada sesion En sesionesClinicas Hacer  MostrarTexto(    INT-11-TXT-04,    obtenerEncabezadoSesion(sesion)  )  MostrarTexto(    INT-11-TXT-05,    obtenerObservacionesYTratamiento(sesion)  )  MostrarTexto(    INT-11-TXT-06,    obtenerUltimaModificacion(sesion)  )FinParaSi usuario.click(INT-11-BTN-02) Entonces  criterioFiltro = obtenerCriterioFiltro()  sesionesClinicas = filtrarSesiones(    idPaciente,    criterioFiltro  )  Si sesionesClinicas.estaVacia() Entonces    MostrarMensaje("No existen sesiones que coincidan con el filtro aplicado.")  Sino    actualizarLineaTiempo(sesionesClinicas)  FinSiFinSiSi usuario.click(INT-11-BTN-01) Entonces  mantenerPacienteSeleccionado(idPaciente)  asociarHistoriaClinica(historialClinico)  asociarFisioterapeuta(fisioterapeutaActual)  redirigirModulo(BTN-02, idPaciente)FinSiidSesion = obtenerSesionSeleccionada()Si usuario.click(INT-11-BTN-03) Y obtenerAccionSeleccionada() = "EDITAR" Entonces  actualizacionAutorizada = validarPermisoActualizacion(    fisioterapeutaActual,    idSesion  )  Si actualizacionAutorizada = false Entonces    MostrarMensaje("No posee autorización para editar esta nota clínica.")  Sino    habilitarEdicionNota(idSesion)    actualizarNotaSesion(idSesion)    registrarModificacion(      idSesion,      fisioterapeutaActual    )    MostrarMensaje("La nota clínica fue actualizada correctamente.")  FinSiFinSiSi usuario.click(INT-11-BTN-03) Y obtenerAccionSeleccionada() = "EXPORTAR" Entonces  exportacionExitosa = generarHistorialPDF(    idPaciente,    historialClinico,    sesionesClinicas,    notasClinicas  )  Si exportacionExitosa = true Entonces    MostrarMensaje("El historial clínico fue exportado correctamente.")  Sino    MostrarMensaje("No se pudo exportar el historial clínico.")  FinSiFinSitrazabilidadRegistrada = registrarTrazabilidad(  fisioterapeutaActual,  idPaciente,  obtenerAccionRealizada(),  BD_en_uso)Si trazabilidadRegistrada = false Entonces  MostrarMensaje("No se pudo registrar la trazabilidad de la acción.")FinSipreservarIntegridadHistoriaClinica(idPaciente)impedirEliminacionPermanente(idPaciente)',
    'Paciente pacienteHistoriaClinica historialClinicoLista sesionesClinicasLista notasClinicasBoolean vinculacionValidaBoolean trazabilidadRegistradaBoolean datosOriginalesConservadosBoolean documentoGeneradopaciente = obtenerPaciente(idPaciente)historialClinico = obtenerHistoriaClinica(idPaciente)sesionesClinicas = obtenerSesionesPaciente(idPaciente)notasClinicas = obtenerNotasSesiones(idPaciente)Si paciente <> null Entonces  Verificar paciente.getId() = idPaciente  Verificar historialDisponibleParaConsulta(idPaciente) = trueFinSiSi historialClinico <> null Entonces  Verificar historialClinico.getPaciente() = paciente  Verificar historialClinico.getEstado() <> ELIMINADOFinSiPara cada sesion En sesionesClinicas Hacer  Verificar sesion.getPaciente() = paciente  Verificar sesion.getHistoriaClinica() = historialClinico  Verificar sesion.getFisioterapeuta() <> nullFinParaPara cada nota En notasClinicas Hacer  Verificar nota.getSesion() <> null  Verificar nota.getPaciente() = pacienteFinParavinculacionValida = verificarVinculacionClinica(idPaciente)trazabilidadRegistrada = verificarTrazabilidad(idPaciente)datosOriginalesConservados = verificarIntegridadDatos(idPaciente)Verificar vinculacionValida = trueVerificar trazabilidadRegistrada = trueVerificar datosOriginalesConservados = trueVerificar verificarEliminacionPermanente(idPaciente) = falseSi seCreoNuevaSesion() = true Entonces  Verificar nuevaSesion.getPaciente() = paciente  Verificar nuevaSesion.getHistoriaClinica() = historialClinico  Verificar nuevaSesion.getFisioterapeuta() = fisioterapeutaActualFinSiSi seSolicitoExportacion() = true Entonces  documentoGenerado = verificarDocumentoExportado(idPaciente)  Verificar documentoGenerado = true  Verificar datosOriginalesConservados = trueFinSi'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0017' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0017' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ESP-0017' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0017' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0017' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-11', 'INT-11-TXT-01', 'INT-11-BTN-01', 'INT-11-BTN-02', 'INT-11-BTN-03', 'INT-11-IMG-04', 'INT-11-TXT-02', 'INT-11-TXT-03', 'INT-11-TXT-04', 'INT-11-TXT-05', 'INT-11-TXT-06')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0018: Creación de Ficha de Evaluación Traumatológica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0018 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Creación de Ficha de Evaluación Traumatológica',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0018'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0013',
    'Inicio Boolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean pacienteExisteBoolean sesionClinicaActivaBoolean registroDisponibleBoolean componentesDisponiblesUsuario fisioterapeutaActualLong idPacienteLong idSesionString BD_en_usoBD_en_uso = "omvital_db_pacients_evaluacion_traumatologica"sesionValida = validarSesion()Si sesionValida = false Entonces  MostrarMensaje("La sesión ha expirado.")  Finalizar procedimientoFinSifisioterapeutaActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(  fisioterapeutaActual,  "FISIOTERAPEUTA")Si permisosValidos = false Entonces  MostrarMensaje("No posee permisos para crear una evaluación traumatológica.")  Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces  MostrarMensaje("No existe conexión con la base de datos.")  Finalizar procedimientoFinSiidPaciente = obtenerPacienteSeleccionado()pacienteExiste = existePaciente(idPaciente)Si pacienteExiste = false Entonces  MostrarMensaje("El paciente seleccionado no se encuentra registrado.")  Finalizar procedimientoFinSiidSesion = obtenerSesionClinicaActiva(idPaciente)sesionClinicaActiva = verificarSesionActiva(idSesion)Si sesionClinicaActiva = false Entonces  MostrarMensaje("El paciente no posee una sesión clínica activa.")  Finalizar procedimientoFinSiregistroDisponible = verificarEstadoRegistroClinico(idPaciente)Si registroDisponible = false Entonces  MostrarMensaje("El registro clínico se encuentra archivado, anulado o bloqueado.")  Finalizar procedimientoFinSicomponentesDisponibles = verificarComponentesInterfaz(INT-13)Si componentesDisponibles = false Entonces  MostrarMensaje("No se encuentran disponibles todos los componentes de la evaluación.")  Finalizar procedimientoFinSiusuario.click(BTN-02)MostrarInterfaz(INT-13)Fin',
    'InicioLong idPacienteLong idSesionPaciente pacienteSesionClinica sesionClinicaEvaluacionTraumatologica evaluacionString fechaAtencionString horaInicioInteger escalaEVAString motivoSesionString protocoloSeleccionadoString zonaAplicacionString datosDerivacionLista tratamientosString accionSeleccionadaBoolean camposValidosBoolean guardadoExitosoBoolean trazabilidadRegistradaidPaciente = obtenerPacienteSeleccionado()idSesion = obtenerSesionClinicaActiva(idPaciente)paciente = obtenerPaciente(idPaciente)sesionClinica = obtenerSesion(idSesion)Si paciente = null Entonces  MostrarMensaje("El paciente seleccionado no existe.")  Finalizar procedimientoFinSiSi sesionClinica = null Entonces  MostrarMensaje("No existe una sesión clínica activa asociada al paciente.")  Finalizar procedimientoFinSiMostrarInterfaz(INT-13)MostrarTexto(INT-13-TXT-01, "Crear Evaluación Inicial")MostrarTexto(INT-13-TXT-04, paciente.getNombreCompleto())MostrarTexto(INT-13-TXT-05, paciente.getDatosIdentificacion())MostrarTexto(INT-13-TXT-06, sesionClinica.getNumeroSesion())MostrarTexto(INT-13-TXT-08, fisioterapeutaActual.getNombreCompleto())fechaAtencion = usuario.ingresarFecha(INT-13-TXT-09)horaInicio = usuario.ingresarHora(INT-13-TXT-10)escalaEVA = usuario.ingresarEscalaDolor()motivoSesion = usuario.ingresarTextoClinico(INT-13-TXT-11)protocoloSeleccionado = usuario.seleccionar(INT-13-CMB-01)Si usuario.click(INT-13-BTN-01) Y obtenerAccionSeleccionada() = "REPETIR_PROTOCOLO" Entonces  protocoloSeleccionado = obtenerProtocoloAnterior(idPaciente)  Si protocoloSeleccionado = null Entonces    MostrarMensaje("No existe un protocolo anterior para reutilizar.")  Sino    cargarProtocolo(protocoloSeleccionado)  FinSiFinSizonaAplicacion = usuario.ingresarTextoClinico(INT-13-TXT-02)datosDerivacion = usuario.ingresarTexto(INT-13-INP-02)Si usuario.click(INT-13-BTN-05) Entonces  Tratamiento tratamiento  tratamiento = obtenerTratamientoIngresado()  Si tratamiento = null Entonces    MostrarMensaje("Debe ingresar los datos del tratamiento.")  Sino    tratamientos.agregar(tratamiento)    mostrarTratamientos(INT-13-TBL-01, tratamientos)  FinSiFinSiSi tratamientos.estaVacia() Entonces  MostrarMensaje(INT-13-MSG-01, "No existen tratamientos agregados.")FinSievaluacion = nueva EvaluacionTraumatologica()evaluacion.setPaciente(paciente)evaluacion.setSesion(sesionClinica)evaluacion.setFisioterapeuta(fisioterapeutaActual)evaluacion.setFecha(fechaAtencion)evaluacion.setHoraInicio(horaInicio)evaluacion.setEscalaEVA(escalaEVA)evaluacion.setMotivoSesion(motivoSesion)evaluacion.setProtocolo(protocoloSeleccionado)evaluacion.setZonaAplicacion(zonaAplicacion)evaluacion.setDatosDerivacion(datosDerivacion)evaluacion.setTratamientos(tratamientos)evaluacion.setTiempoEvolucion(  usuario.ingresarValor(INT-13-SPB-02))evaluacion.setAnamnesis(  usuario.seleccionarOpciones(INT-13-CMB-03))evaluacion.setInspeccionClinica(  usuario.seleccionarOpciones(INT-13-CMB-04))evaluacion.setCicatrizQuirurgica(  usuario.seleccionar(INT-13-CHK-03))evaluacion.setPalpacion(  usuario.ingresarTexto(INT-13-INP-03))evaluacion.setMovilidadActiva(obtenerMovilidadActiva())evaluacion.setMovilidadPasiva(obtenerMovilidadPasiva())evaluacion.setDolorMovilidad(usuario.seleccionar(INT-13-CHK-01))evaluacion.setObservacionesMovilidad(obtenerObservacionesMovilidad())evaluacion.setEscalaFuerza(  usuario.ingresarValor(INT-13-SPB-01))evaluacion.setDolorFuerza(  usuario.seleccionar(INT-13-CHK-02))evaluacion.setPruebasEspeciales(  usuario.ingresarTexto(INT-13-INP-04))evaluacion.setResultadosPruebas(  usuario.ingresarTexto(INT-13-INP-05))evaluacion.setEvaluacionFuncional(  usuario.seleccionarOpciones(INT-13-CMB-03))evaluacion.setEvaluacionNeurologicaAplica(  usuario.seleccionar(INT-13-CHK-03))evaluacion.setObservacionNeurologica(  usuario.ingresarTexto(INT-13-INP-03))evaluacion.setImpresionFisioterapeutica(  usuario.ingresarTexto(INT-13-INP-03))evaluacion.setObjetivosIniciales(obtenerObjetivosIniciales())evaluacion.setPlanTratamiento(  usuario.seleccionarOpciones(INT-13-CMB-05))evaluacion.setSignosAlarma(obtenerSignosAlarma())Si usuario.click(INT-13-BTN-01) Y obtenerAccionSeleccionada() = "FIRMA_DIGITAL" Entonces  FirmaDigital firma  firma = registrarFirmaDigital(fisioterapeutaActual)  evaluacion.setFirmaDigital(firma)FinSiSi usuario.click(INT-13-BTN-03) Entonces  descartarCambiosNoGuardados()  retornarInterfazAnterior()  Finalizar procedimientoFinSiSi usuario.click(INT-13-BTN-02) Entonces  accionSeleccionada = "BORRADOR"  evaluacion.setEstado(BORRADOR)  guardadoExitoso = guardarEvaluacion(evaluacion)  Si guardadoExitoso = true Entonces    MostrarMensaje("La evaluación fue guardada como borrador.")  Sino    MostrarMensaje("No se pudo guardar el borrador de la evaluación.")  FinSiFinSiSi usuario.click(INT-13-BTN-04) Entonces  accionSeleccionada = "GUARDAR_SESION"  camposValidos = validarCamposObligatorios(evaluacion)  Si camposValidos = false Entonces    MostrarMensaje("Complete correctamente los campos obligatorios.")  Sino    evaluacion.setEstado(GUARDADA)    guardadoExitoso = guardarEvaluacion(evaluacion)    Si guardadoExitoso = true Entonces      asociarEvaluacionHistorial(idPaciente, evaluacion)      MostrarMensaje("La evaluación traumatológica fue guardada correctamente.")      retornarHistorialClinico(idPaciente)    Sino      MostrarMensaje("No se pudo guardar la evaluación traumatológica.")    FinSi  FinSiFinSitrazabilidadRegistrada = registrarTrazabilidad(  fisioterapeutaActual,  idPaciente,  accionSeleccionada,  BD_en_uso)Si trazabilidadRegistrada = false Entonces  MostrarMensaje("No se pudo registrar la trazabilidad clínica.")FinSiimpedirEliminacionPermanente(evaluacion)Fin',
    'Inicio PostcondicionesEvaluacionTraumatologica evaluacionPaciente pacienteHistoriaClinica historialClinico'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0018' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0018' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ESP-0018' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0018' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0018' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-13', 'INT-13-TXT-01', 'INT-13-TXT-02', 'INT-13-TXT-03', 'INT-13-TXT-04', 'INT-13-TXT-05', 'INT-13-TXT-06', 'INT-13-TXT-08', 'INT-13-TXT-09', 'INT-13-TXT-10', 'INT-13-TXT-11', 'INT-13-TXT-12', 'INT-13-TXT-13', 'INT-13-TXT-14', 'INT-13-TXT-15', 'INT-13-TXT-16', 'INT-13-INP-01', 'INT-13-INP-02', 'INT-13-INP-03', 'INT-13-INP-04', 'INT-13-INP-05', 'INT-13-CMB-01', 'INT-13-CMB-02', 'INT-13-CMB-03', 'INT-13-CMB-04', 'INT-13-CMB-05', 'INT-13-CHK-01', 'INT-13-CHK-02', 'INT-13-CHK-03', 'INT-13-SPB-01', 'INT-13-SPB-02', 'INT-13-TBL-01', 'INT-13-GRD-01', 'INT-13-BTN-01', 'INT-13-BTN-02', 'INT-13-BTN-03', 'INT-13-BTN-04', 'INT-13-BTN-05', 'INT-13-MSG-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0019: Creación de Ficha de Evaluación Geronto-Psicomotriz
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0019 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Creación de Ficha de Evaluación Geronto-Psicomotriz',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0019'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0014',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean pacienteExisteBoolean pacienteAdultoMayorBoolean sesionClinicaActivaBoolean registroDisponibleBoolean componentesDisponiblesUsuario fisioterapeutaActualLong idPacienteLong idSesionString BD_en_usoBD_en_uso = "omvital_db_pacients_evaluacion_geronto_psicomotriz"sesionValida = validarSesion()Si sesionValida = false Entonces  MostrarMensaje("La sesión ha expirado.")  Finalizar procedimientoFinSifisioterapeutaActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(  fisioterapeutaActual,  "FISIOTERAPEUTA")Si permisosValidos = false Entonces  MostrarMensaje("No posee permisos para crear una evaluación geronto-psicomotriz.")  Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces  MostrarMensaje("No existe conexión con la base de datos.")  Finalizar procedimientoFinSiidPaciente = obtenerPacienteSeleccionado()pacienteExiste = existePaciente(idPaciente)Si pacienteExiste = false Entonces  MostrarMensaje("El paciente seleccionado no se encuentra registrado.")  Finalizar procedimientoFinSipacienteAdultoMayor = verificarPacienteAdultoMayor(idPaciente)Si pacienteAdultoMayor = false Entonces  MostrarMensaje("El paciente no corresponde a una evaluación geronto-psicomotriz.")  Finalizar procedimientoFinSiidSesion = obtenerSesionClinicaActiva(idPaciente)sesionClinicaActiva = verificarSesionActiva(idSesion)Si sesionClinicaActiva = false Entonces  MostrarMensaje("El paciente no posee una sesión clínica activa.")  Finalizar procedimientoFinSiregistroDisponible = verificarEstadoRegistroClinico(idPaciente)Si registroDisponible = false Entonces  MostrarMensaje("El registro clínico se encuentra archivado, anulado o bloqueado.")  Finalizar procedimientoFinSicomponentesDisponibles = verificarComponentesInterfaz(INT-14)Si componentesDisponibles = false Entonces  MostrarMensaje("No se encuentran disponibles todos los componentes de la evaluación.")  Finalizar procedimientoFinSiusuario.click(BTN-02)MostrarInterfaz(INT-14)',
    'Long idPacienteLong idSesionPaciente pacienteSesionClinica sesionClinicaEvaluacionGerontoPsicomotriz evaluacionString fechaEvaluacionString horaInicioString accionSeleccionadaBoolean medicacionActualBoolean camposValidosBoolean guardadoExitosoBoolean trazabilidadRegistradaidPaciente = obtenerPacienteSeleccionado()idSesion = obtenerSesionClinicaActiva(idPaciente)paciente = obtenerPaciente(idPaciente)sesionClinica = obtenerSesion(idSesion)Si paciente = null Entonces  MostrarMensaje("El paciente seleccionado no existe.")  Finalizar procedimientoFinSiSi sesionClinica = null Entonces  MostrarMensaje("No existe una sesión clínica activa asociada al paciente.")  Finalizar procedimientoFinSiMostrarInterfaz(INT-14)MostrarTexto(INT-14-TXT-01, "Crear Evaluación Geronto-Psicomotriz")MostrarDatosPaciente(  INT-14-INP-03,  paciente.getDatosIdentificacion())MostrarDatosContactoCuidador(  INT-14-INP-04,  paciente.getContactoFamiliar())fechaEvaluacion = usuario.ingresarFecha(INT-14-INP-01)horaInicio = usuario.ingresarHora(INT-14-INP-02)evaluacion = nueva EvaluacionGerontoPsicomotriz()evaluacion.setPaciente(paciente)evaluacion.setSesion(sesionClinica)evaluacion.setFisioterapeuta(fisioterapeutaActual)evaluacion.setFecha(fechaEvaluacion)evaluacion.setHoraInicio(horaInicio)evaluacion.setConvivencia(  usuario.seleccionar(INT-14-CMB-01))evaluacion.setOcupacion(  usuario.ingresarTexto(INT-14-INP-05))evaluacion.setDiagnosticoPrincipal(  usuario.ingresarTexto(INT-14-INP-05))evaluacion.setAntecedentes(  usuario.ingresarTexto(INT-14-INP-05))medicacionActual = usuario.seleccionar(INT-14-CHK-01)evaluacion.setMedicacionActual(medicacionActual)Si medicacionActual = true Entonces  evaluacion.setDetalleMedicacion(    usuario.ingresarTexto(INT-14-INP-05)  )FinSievaluacion.setMotivoAtencion(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setTiempoEvolucion(  usuario.ingresarValor(INT-14-SPB-01))evaluacion.setNivelIndependencia(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setActividadesAfectadas(  usuario.seleccionarOpciones(INT-14-CMB-04))evaluacion.setAyudaExterna(  usuario.ingresarTexto(INT-14-INP-06))evaluacion.setEscalaDolorEVA(  usuario.seleccionarValor(INT-14-GRD-01))evaluacion.setZonaDolor(  usuario.seleccionar(INT-14-CMB-02))evaluacion.setCondicionDolor(  usuario.seleccionarOpciones(INT-14-CMB-02))evaluacion.setTipoMarcha(  usuario.seleccionar(INT-14-CMB-05))evaluacion.setObservacionMarcha(  usuario.ingresarTexto(INT-14-INP-08))evaluacion.setRiesgoMarcha(  usuario.seleccionar(INT-14-CMB-05))evaluacion.setAntecedentesCaidas(  usuario.seleccionar(INT-14-CHK-01))evaluacion.setNumeroCaidas(  usuario.ingresarValor(INT-14-SPB-02))evaluacion.setMiedoCaer(  usuario.seleccionar(INT-14-CHK-01))evaluacion.setEquilibrio(  usuario.seleccionar(INT-14-CMB-05))evaluacion.setApoyoMonopodal(obtenerResultadoApoyoMonopodal())evaluacion.setPruebaRomberg(obtenerResultadoRomberg())evaluacion.setPruebaTUG(obtenerResultadoTUG())evaluacion.setMovilidadGeneral(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setTransferencias(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setFuerzaFuncional(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setPruebaSentarseLevantarse(  obtenerResultadoSentarseLevantarse())evaluacion.setCoordinacionGruesa(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setCoordinacionFina(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setLateralidad(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setEsquemaCorporal(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setOrientacionEspacial(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setOrientacionTemporal(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setRitmoSecuenciaMotora(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setEstadoAlerta(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setOrientacionCognitiva(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setMemoriaInmediata(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setComprensionOrdenes(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setAtencionSesion(  usuario.seleccionar(INT-14-CMB-04))evaluacion.setEstadoEmocional(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setParticipacionSocial(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setMotivacionTerapia(  usuario.seleccionar(INT-14-CMB-03))evaluacion.setHallazgosPrincipales(  usuario.seleccionarOpciones(INT-14-CMB-03))evaluacion.setImpresionFuncional(  usuario.ingresarTexto(INT-14-INP-12))evaluacion.setObjetivosIntervencion(  usuario.seleccionarOpciones(INT-14-CMB-03))evaluacion.setObjetivoPrincipal(  usuario.ingresarTexto(INT-14-INP-13))evaluacion.setFrecuenciaSugerida(  usuario.ingresarValor(INT-14-SPB-01))evaluacion.setIntervencionInicial(  usuario.seleccionarOpciones(INT-14-CMB-03))evaluacion.setNumeroSesionesEstimadas(  usuario.ingresarValor(INT-14-SPB-01))evaluacion.setIndicacionesDomiciliarias(  usuario.ingresarTexto(INT-14-INP-11))evaluacion.setSignosAlerta(  usuario.seleccionarOpciones(INT-14-CMB-03))evaluacion.setProfesionalEvaluador(  usuario.ingresarTexto(INT-14-INP-10))Si usuario.click(INT-14-BTN-04) Entonces  FirmaDigital firma  firma = registrarFirmaDigital(fisioterapeutaActual)  evaluacion.setFirmaDigital(firma)FinSiSi usuario.click(INT-14-BTN-03) Entonces  descartarCambiosNoGuardados()  retornarInterfazAnterior()  Finalizar procedimientoFinSiSi usuario.click(INT-14-BTN-02) Entonces  accionSeleccionada = "BORRADOR"  evaluacion.setEstado(BORRADOR)  guardadoExitoso = guardarEvaluacion(evaluacion)  Si guardadoExitoso = true Entonces    MostrarMensaje("La evaluación fue guardada como borrador.")  Sino    MostrarMensaje("No se pudo guardar el borrador de la evaluación.")  FinSiFinSiSi usuario.click(INT-14-BTN-01) Entonces  accionSeleccionada = "GUARDAR_SESION"  camposValidos = validarCamposObligatorios(evaluacion)  Si camposValidos = false Entonces    MostrarMensaje("Complete correctamente los campos obligatorios.")  Sino    evaluacion.setEstado(GUARDADA)    guardadoExitoso = guardarEvaluacion(evaluacion)    Si guardadoExitoso = true Entonces      asociarEvaluacionHistorial(idPaciente, evaluacion)      MostrarMensaje("La evaluación geronto-psicomotriz fue guardada correctamente.")      retornarHistorialClinico(idPaciente)    Sino      MostrarMensaje("No se pudo guardar la evaluación geronto-psicomotriz.")    FinSi  FinSiFinSitrazabilidadRegistrada = registrarTrazabilidad(  fisioterapeutaActual,  idPaciente,  accionSeleccionada,  BD_en_uso)Si trazabilidadRegistrada = false Entonces  MostrarMensaje("No se pudo registrar la trazabilidad clínica.")FinSiimpedirEliminacionPermanente(evaluacion)',
    'EvaluacionGerontoPsicomotriz evaluacionPaciente pacienteHistoriaClinica historialClinico'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0019' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0019' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0006'
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
WHERE a.codigo = 'ESP-0019' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0019' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0019' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'BTN-06', 'PRF-01', 'INT-14', 'INT-14-TXT-01', 'INT-14-TXT-02', 'INT-14-TXT-03', 'INT-14-TXT-04', 'INT-14-TXT-05', 'INT-14-TXT-08', 'INT-14-TXT-09', 'INT-14-TXT-10', 'INT-14-TXT-11', 'INT-14-TXT-12', 'INT-14-TXT-13', 'INT-14-TXT-14', 'INT-14-TXT-15', 'INT-14-TXT-16', 'INT-14-INP-01', 'INT-14-INP-02', 'INT-14-INP-03', 'INT-14-INP-04', 'INT-14-INP-05', 'INT-14-INP-06', 'INT-14-INP-07', 'INT-14-INP-08', 'INT-14-INP-09', 'INT-14-INP-10', 'INT-14-INP-11', 'INT-14-INP-12', 'INT-14-INP-13', 'INT-14-CMB-01', 'INT-14-CMB-02', 'INT-14-CMB-03', 'INT-14-CMB-04', 'INT-14-CMB-05', 'INT-14-CHK-01', 'INT-14-SPB-01', 'INT-14-SPB-02', 'INT-14-GRD-01', 'INT-14-BTN-01', 'INT-14-BTN-02', 'INT-14-BTN-03', 'INT-14-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0020: Conexión con la Base de Datos
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0020 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Conexión con la Base de Datos',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0020'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0015',
    'Boolean servidorDisponibleBoolean configuracionValidaString BD_en_usoBD_en_uso = "omvital_db_pacients"servidorDisponible = verificarServidorBD()Si servidorDisponible = false Entonces    MostrarMensaje("El servidor de la base de datos no está disponible.")    Finalizar procedimientoFinSiconfiguracionValida = verificarConfiguracionBD(BD_en_uso)Si configuracionValida = false Entonces    MostrarMensaje("La configuración de la base de datos es inválida.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Boolean conexionEstablecidaConexion conexionBDconexionBD = conectarBD(BD_en_uso)conexionEstablecida = conexionBD.estado()Si conexionEstablecida = true Entonces    habilitarConexion(conexionBD)    registrarEvento("Conexión establecida.")Sino    registrarErrorConexion()    MostrarMensaje("No fue posible establecer conexión con la base de datos.")    Finalizar procedimientoFinSiFin Procedimiento',
    'Boolean conexionActivaconexionActiva = verificarConexionActiva()Si conexionActiva = true Entonces    habilitarOperacionesBD()Sino    cancelarOperacion()FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0020' AND av.version = '1.1.0'
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
WHERE a.codigo = 'ESP-0020' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0020' AND av.version = '1.1.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0020' AND av.version = '1.1.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0020' AND av.version = '1.1.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-15-TXT-01', 'INT-15-TXT-02', 'INT-15-TXT-03', 'INT-15-TXT-04', 'INT-15-TXT-05', 'INT-15-TXT-06', 'INT-15-TXT-07', 'INT-15-TXT-08', 'INT-15-TXT-09', 'INT-15-TXT-10', 'INT-15-TXT-11', 'INT-15-TXT-12', 'INT-15-TXT-13', 'INT-15-TXT-14', 'INT-15-TXT-15', 'INT-15-INP-01', 'INT-15-BTN-01', 'INT-15-BTN-02', 'INT-15-BTN-03', 'INT-15-BTN-04', 'INT-15-BTN-05', 'INT-15-MDL-01', 'INT-15-MDL-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0021: Mostrar Interfaz de Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0021 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Mostrar Interfaz de Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0021'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0016',
    'Boolean conexionActivaBoolean sesionValidaUsuario fisioterapeutaActualsesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiconexionActiva = verificarConexionActiva()Si conexionActiva = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSifisioterapeutaActual = obtenerUsuarioSesion()Fin Precondiciones',
    'Boolean interfazDisponibleusuario.click(BTN-02)interfazDisponible = cargarInterfaz("Sesión de Pacientes")Si interfazDisponible = true Entonces    mostrarTitulo(INT-16-TXT-01)    mostrarTablaPacientes(INT-16-TBL-01)    mostrarBoton(INT-16-BTN-01)    mostrarBoton(INT-16-BTN-02)    mostrarBoton(INT-16-BTN-03)    mostrarBoton(INT-16-BTN-04)    mostrarBoton(INT-16-BTN-05)Sino    MostrarMensaje("No fue posible cargar la interfaz.")FinSiFin Procedimiento',
    'Boolean interfazCargadainterfazCargada = verificarInterfaz()Si interfazCargada = true Entonces    habilitarInteraccionUsuario()Sino    cancelarOperacion()FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0021' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0021' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0021' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0021' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0021' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-15-TXT-01', 'INT-15-TXT-02', 'INT-15-TXT-03', 'INT-15-TXT-04', 'INT-15-TXT-05', 'INT-15-TXT-06', 'INT-15-TXT-07', 'INT-15-TXT-08', 'INT-15-TXT-09', 'INT-15-TXT-10', 'INT-15-TXT-11', 'INT-15-TXT-12', 'INT-15-TXT-13', 'INT-15-TXT-14', 'INT-15-TXT-15', 'INT-15-INP-01', 'INT-15-BTN-01', 'INT-15-BTN-02', 'INT-15-BTN-03', 'INT-15-BTN-04', 'INT-15-BTN-05', 'INT-15-MDL-01', 'INT-15-MDL-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0022: Cargar Información de la Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0022 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Cargar Información de la Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0022'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0016',
    'Long idPacienteBoolean pacienteSeleccionadoidPaciente = obtenerPacienteSeleccionado()pacienteSeleccionado = existePaciente(idPaciente)Si pacienteSeleccionado = false Entonces    MostrarMensaje("No existe información del paciente seleccionado.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Paciente pacienteSesionTerapeutica sesionBoolean informacionCargadapaciente = consultarPaciente(idPaciente)sesion = consultarSesion(idPaciente)mostrarDato(INT-15-TXT-02, paciente.nombre)mostrarDato(INT-15-TXT-03, paciente.edad)mostrarDato(INT-15-TXT-04, paciente.dni)mostrarDato(INT-15-TXT-05, paciente.telefono)mostrarDato(INT-15-TXT-06, sesion.numeroSesion)mostrarDato(INT-15-TXT-07, sesion.fisioterapeuta)mostrarDato(INT-15-TXT-08, sesion.fecha)mostrarDato(INT-15-TXT-09, sesion.horaInicio)mostrarDato(INT-15-TXT-10, sesion.diagnostico)mostrarDato(INT-15-TXT-11, sesion.agentesTerapeuticos)informacionCargada = verificarCargaInformacion()Si informacionCargada = false Entonces    MostrarMensaje("No fue posible cargar la información de la sesión.")    Finalizar procedimientoFinSiFin Procedimiento',
    'Boolean datosDisponiblesdatosDisponibles = verificarCargaInformacion()Si datosDisponibles = true Entonces    habilitarRegistroSesion()Sino    cancelarOperacion()FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0022' AND av.version = '1.1.0'
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
WHERE a.codigo = 'ESP-0022' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0022' AND av.version = '1.1.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0022' AND av.version = '1.1.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0022' AND av.version = '1.1.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-17-TXT-01', 'INT-17-TXT-02', 'INT-17-TXT-03', 'INT-17-TXT-04', 'INT-17-TXT-05', 'INT-17-TXT-06', 'INT-17-TXT-07', 'INT-17-TXT-08', 'INT-17-TXT-09', 'INT-17-TXT-10', 'INT-17-TXT-11', 'INT-17-TXT-12', 'INT-17-TXT-13', 'INT-17-TXT-14', 'INT-17-TXT-15', 'INT-17-INP-01', 'INT-17-BTN-01', 'INT-17-BTN-02', 'INT-17-BTN-03', 'INT-17-BTN-04', 'INT-17-BTN-05', 'INT-17-MDL-01', 'INT-17-MDL-02')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0023: Registrar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0023 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Registrar Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0023'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0016',
    'Boolean informacionDisponibleBoolean observacionesValidasString observacionesClinicasinformacionDisponible = verificarCargaInformacion()Si informacionDisponible = false Entonces    MostrarMensaje("No se encuentra cargada la información de la sesión.")    Finalizar procedimientoFinSiobservacionesClinicas = obtenerObservaciones()observacionesValidas = validarObservaciones(observacionesClinicas)Si observacionesValidas = false Entonces    MostrarMensaje("Debe ingresar las observaciones clínicas.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Boolean registroExitosoHora horaFinusuario.click(INT-15-BTN-01)horaFin = obtenerHoraActual()registroExitoso = registrarSesion(                    idPaciente,                    numeroSesion,                    fisioterapeutaActual,                    fechaAtencion,                    horaInicio,                    horaFin,                    diagnostico,                    agentesTerapeuticos,                    observacionesClinicas                  )Si registroExitoso = true Entonces    MostrarModal(INT-15-MDL-01)    retornarInterfaz(INT-16)Sino    MostrarMensaje("No fue posible registrar la sesión terapéutica.")FinSiFin Procedimiento',
    'Boolean sesionRegistradasesionRegistrada = verificarRegistroSesion()Si sesionRegistrada = true Entonces    actualizarHistorialClinico(idPaciente)    habilitarConsultaSesion(idPaciente)FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0023' AND av.version = '1.1.0'
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
WHERE a.codigo = 'ESP-0023' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0023' AND av.version = '1.1.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0023' AND av.version = '1.1.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0023' AND av.version = '1.1.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-15-INP-01', 'INT-15-BTN-01', 'INT-15-MDL-01', 'INT-16')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0024: Consultar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0024 v1.1.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.1.0',
    'Consultar Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0024'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0016',
    'Boolean interfazDisponibleBoolean pacienteSeleccionadoLong idPacienteinterfazDisponible = verificarInterfaz()Si interfazDisponible = false Entonces    MostrarMensaje("La interfaz de sesión terapéutica no se encuentra disponible.")    Finalizar procedimientoFinSiidPaciente = obtenerPacienteSeleccionado()pacienteSeleccionado = existePaciente(idPaciente)Si pacienteSeleccionado = false Entonces    MostrarMensaje("Debe seleccionar un paciente.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Lista<SesionTerapeutica> sesionesBoolean sesionesEncontradasusuario.click(INT-16-BTN-06)sesiones = consultarSesiones(idPaciente)sesionesEncontradas = sesiones.noVacia()Si sesionesEncontradas = true Entonces    mostrarHistorialSesiones(sesiones)Sino    MostrarMensaje("El paciente no registra sesiones terapéuticas.")FinSiFin Procedimiento',
    'Boolean consultaRealizadaconsultaRealizada = verificarConsulta()Si consultaRealizada = true Entonces    habilitarVisualizacionHistorial()FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0024' AND av.version = '1.1.0'
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
WHERE a.codigo = 'ESP-0024' AND av.version = '1.1.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0024' AND av.version = '1.1.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0024' AND av.version = '1.1.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0024' AND av.version = '1.1.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-16-TXT-01', 'INT-16-INP-01', 'INT-16-BTN-01', 'INT-16-BTN-02', 'INT-16-TBL-01', 'INT-16-BTN-03', 'INT-16-BTN-04', 'INT-16-BTN-05')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0025: Actualizar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0025 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Actualizar Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    '',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0025'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0017',
    'Boolean sesionSeleccionadaBoolean datosCargadosLong idSesionidSesion = obtenerSesionSeleccionada()sesionSeleccionada = existeSesion(idSesion)Si sesionSeleccionada = false Entonces    MostrarMensaje("Debe seleccionar una sesión terapéutica.")    Finalizar procedimientoFinSidatosCargados = verificarCargaInformacion()Si datosCargados = false Entonces    MostrarMensaje("No fue posible cargar la información de la sesión.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Boolean datosValidosBoolean actualizacionExitosaString observacionesClinicasusuario.click(INT-17-BTN-02)observacionesClinicas = obtenerObservaciones()datosValidos = validarObservaciones(observacionesClinicas)Si datosValidos = true Entonces    actualizacionExitosa = actualizarSesion(                                idSesion,                                observacionesClinicas                           )    Si actualizacionExitosa = true Entonces        MostrarModal(INT-17-MDL-01)        retornarInterfaz(INT-16)    Sino        MostrarMensaje("No fue posible actualizar la sesión terapéutica.")    FinSiSino    MostrarMensaje("Los datos ingresados son inválidos.")FinSiFin Procedimiento',
    'Boolean sesionActualizadasesionActualizada = verificarActualizacion(idSesion)Si sesionActualizada = true Entonces    actualizarHistorialClinico(idSesion)    habilitarConsultaSesion(idSesion)FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0025' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0025' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0025' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0025' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0025' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-16-TXT-01', 'INT-16-INP-01', 'INT-16-BTN-01', 'INT-16-BTN-02', 'INT-16-TBL-01', 'INT-16-BTN-03', 'INT-16-BTN-04', 'INT-16-BTN-05')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0026: Desactivar Sesión Terapéutica
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0026 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Desactivar Sesión Terapéutica',
    '2026-07-16',
    'Vital',
    'Concluido',
    '',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0026'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0018',
    'Boolean sesionSeleccionadaLong idSesionidSesion = obtenerSesionSeleccionada()sesionSeleccionada = existeSesion(idSesion)Si sesionSeleccionada = false Entonces    MostrarMensaje("Debe seleccionar una sesión terapéutica.")    Finalizar procedimientoFinSiFin Precondiciones',
    'Boolean confirmacionUsuarioBoolean desactivacionExitosausuario.click(INT-16-BTN-03)confirmacionUsuario = mostrarConfirmacion(                        "¿Está seguro de desactivar la sesión terapéutica?"                      )Si confirmacionUsuario = true Entonces    desactivacionExitosa = desactivarSesion(idSesion)    Si desactivacionExitosa = true Entonces        MostrarModal(INT-16-MDL-02)        actualizarTablaSesiones()    Sino        MostrarMensaje("No fue posible desactivar la sesión terapéutica.")    FinSiFinSiFin Procedimiento',
    'Boolean sesionDesactivadasesionDesactivada = verificarEstadoSesion(idSesion)Si sesionDesactivada = true Entonces    ocultarSesionActiva(idSesion)    actualizarListadoSesiones()FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0026' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0026' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0005'
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
WHERE a.codigo = 'ESP-0026' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0026' AND av.version = '1.0.0' AND f.codigo = 'FUE-0006'
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
WHERE a.codigo = 'ESP-0026' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'LOG-01', 'BTN-01', 'BTN-02', 'BTN-03', 'BTN-04', 'BTN-05', 'PRF-01', 'BTN-06', 'INT-16-TXT-01', 'INT-16-INP-01', 'INT-16-BTN-01', 'INT-16-BTN-02', 'INT-16-TBL-01', 'INT-16-BTN-03', 'INT-16-BTN-04', 'INT-16-BTN-05')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0027: Acceso y carga inicial del dashboard de monitoreo
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0027 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Acceso y carga inicial del dashboard de monitoreo',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0027'
ON CONFLICT (artefacto_id, version) DO NOTHING;

-- Trazabilidad: la plantilla declara ILA-0023 pero ilaciones.sql
-- vincula estas especificaciones a ILA-0019.
INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0019',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean tablasCreadasUsuario usuarioActual String str_BD_EnUsostr_BD_EnUso = "OMVITAL_DB_PACIENTES"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado. Por favor, inicie sesión nuevamente.")    RedirigirVista(LOGIN)    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()bool_PermisosValidos = validarPermisos(    obj_UsuarioActual,    "FISIOTERAPEUTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para acceder al módulo de recepción.")    RedirigirVista(INICIO)    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos del establecimiento. Contacte al administrador del sistema.")    Finalizar procedimientoFinSitablasCreadas = verificarExistenciaTablas(BD_en_uso, ["TABLE_PACIENTE", "TABLE_CITA", "TABLE_FISIOTERAPEUTA","TABLE_SEGUIMIENTO_CLINICO"])Si tablasCreadas = false Entonces    MostrarMensaje("Error en la configuración del sistema. Faltan tablas esenciales en la base de datos.")    Finalizar procedimientoFinSi',
    'Vista obj_VistaPanelTurnoDatosTurno obj_DatosTurnoActualDatosIndicador[] arr_IndicadoresTurnoDatosCita[] arr_ProximasCitasDatosCita[] arr_AgendaCompletaDateTime date_FechaActualFisioterapeuta obj_FisioterapeutaAutenticadoString[50] str_BD_EnUsostr_BD_EnUso = obtenerBaseDatosActiva()Si usuario.click(    btnAccesoPanelTurno(BTN-05)) Entonces    obj_VistaPanelTurno = cargarVistaPanelTurno(        INT-008    )    date_FechaActual = obtenerFechaServidor()    obj_FisioterapeutaAutenticado = obtenerFisioterapeutaPorUsuario(        str_BD_EnUso,        obj_UsuarioActual    )    actualizarEncabezadoPanelTurno(        INT-008,        obj_FisioterapeutaAutenticado.nombres,        date_FechaActual    )    obj_DatosTurnoActual = consultarTurnoActual(        str_BD_EnUso,        obj_FisioterapeutaAutenticado.id_fisioterapeuta,        date_FechaActual    )    poblarPanelTurnoActual(        INT-8-PNL-01,        obj_DatosTurnoActual    )    arr_IndicadoresTurno = calcularIndicadoresTurno(        str_BD_EnUso,        obj_FisioterapeutaAutenticado.id_fisioterapeuta,        date_FechaActual    )    poblarPanelIndicadoresTurno(        INT-8-PNL-02,        arr_IndicadoresTurno    )    arr_AgendaCompleta = consultarAgendaCompleta(        str_BD_EnUso,        date_FechaActual    )    poblarPanelAgenda(        INT-8-PNL-03,        arr_AgendaCompleta,        INT-8-TBL-01    )    activarActualizacionAutomatica(        INT-008,        intervalo=30    )FinSi',
    'Boolean bool_PanelTurnoCargadoBoolean bool_PanelesCompletosString[15] str_VistaActualInteger int_TotalCitasAgendastr_VistaActual = obtenerVistaActiva()Verificar str_VistaActual = "INT-008"bool_PanelTurnoCargado = verificarControlesCargados(    INT-008)Verificar bool_PanelTurnoCargado = truebool_PanelesCompletos = verificarPanelesDesplegados(    [INT-8-PNL-01, INT-8-PNL-02, INT-8-PNL-03])Verificar bool_PanelesCompletos = trueint_TotalCitasAgenda = contarFilasTabla(    INT-8-TBL-01)Si obj_DatosTurnoActual <> null Entonces    MostrarMensaje("Panel de turno cargado correctamente. Turno actual asignado.")Sino    MostrarMensaje("Panel de turno cargado correctamente. Sin turno asignado en este momento.")FinSiQuedaHabilitado(    INT-008,    modo="CONSULTA_ACTIVA")activarSincronizacionRecepcion(    INT-008)'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0027' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0027' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
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
WHERE a.codigo = 'ESP-0027' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
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
WHERE a.codigo = 'ESP-0027' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-05', 'INT-008', 'INT-8-PNL-01', 'INT-8-PNL-02', 'INT-8-PNL-03', 'INT-8-TBL-01', 'TABLE_CITAS', 'TABLE_PACIENTE', 'TABLE_HISTORIAL_CLINICO', 'TABLE_FISIOTERAPEUTA')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0028: Visualización del turno actual y consulta de progreso del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0028 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Visualización del turno actual y consulta de progreso del paciente',
    '2026-07-16',
    'Vital',
    'Concluido',
    'El fisioterapeuta visualiza los detalles del paciente que le corresponde atender en el turno actual con indicadores de tiempo transcurrido y restante, y puede acceder al seguimiento clínico del paciente mediante el botón "VER PROGRESO".',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0028'
ON CONFLICT (artefacto_id, version) DO NOTHING;

-- Trazabilidad: la plantilla declara ILA-0023 pero ilaciones.sql
-- vincula estas especificaciones a ILA-0019.
INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0019',
    'iónBoolean bool_PanelTurnoCargadoBoolean bool_PanelTurnoActualVisibleVista obj_VistaActualobj_VistaActual = obtenerVistaActiva()bool_PanelTurnoCargado = validarVista(    obj_VistaActual,    "INT-008")Si bool_PanelTurnoCargado = false Entonces    MostrarMensaje("Debe encontrarse en el panel de turno para visualizar los detalles del turno actual.")    Finalizar procedimientoFinSibool_PanelTurnoActualVisible = verificarPanelDesplegado(    INT-8-PNL-01)Si bool_PanelTurnoActualVisible = false Entonces    desplegarPanel(INT-8-PNL-01)FinSi',
    'DatosTurno obj_TurnoActualDatosPaciente obj_PacienteTurnoDateTime date_ActualInteger int_MinutosTranscurridosInteger int_MinutosRestantesInteger int_DuracionTotalString[50] str_BD_EnUsoFisioterapeuta obj_FisioterapeutaAutenticadostr_BD_EnUso = obtenerBaseDatosActiva()date_Actual = obtenerFechaServidor()obj_FisioterapeutaAutenticado = obtenerFisioterapeutaPorUsuario(    str_BD_EnUso,    obtenerUsuarioSesion())obj_TurnoActual = ejecutarConsulta("    SELECT         p.id_paciente,        p.nombres || '' '' || p.apellidos AS nombre_paciente,        p.dni,        p.edad,        c.hora_inicio,        c.hora_fin,        c.estado,        c.motivo_consulta    FROM TABLE_CITAS c    INNER JOIN TABLE_PACIENTE p ON c.id_paciente = p.id_paciente    WHERE c.id_fisioterapeuta = :idFisioterapeuta    AND c.fecha = :fechaActual    AND c.estado IN (''EN_CURSO'', ''PROGRAMADA'')    ORDER BY c.hora_inicio ASC    LIMIT 1", [    ":idFisioterapeuta" => obj_FisioterapeutaAutenticado.id_fisioterapeuta,    ":fechaActual" => date_Actual])limpiarPanel(INT-8-PNL-01)Si obj_TurnoActual <> null Entonces    int_DuracionTotal = calcularDuracionMinutos(        obj_TurnoActual.hora_inicio,        obj_TurnoActual.hora_fin    )    Si obj_TurnoActual.estado = "EN_CURSO" Entonces        int_MinutosTranscurridos = calcularMinutosTranscurridos(            obj_TurnoActual.hora_inicio,            date_Actual        )        int_MinutosRestantes = calcularMinutosRestantes(            obj_TurnoActual.hora_fin,            date_Actual        )    Sino        int_MinutosTranscurridos = 0        int_MinutosRestantes = int_DuracionTotal    FinSi    actualizarCamposPanelTurnoActual(        INT-8-PNL-01,        obj_TurnoActual.nombre_paciente,        obj_TurnoActual.dni,        obj_TurnoActual.edad,        formatearHora(obj_TurnoActual.hora_inicio),        formatearHora(obj_TurnoActual.hora_fin),        obj_TurnoActual.estado,        obj_TurnoActual.motivo_consulta    )    actualizarIndicadorProgreso(        INT-8-PNL-01,        int_MinutosTranscurridos,        int_MinutosRestantes,        int_DuracionTotal    )    habilitarBoton(        INT-8-BTN-01,        "VER PROGRESO"    )Sino    mostrarMensajePanelVacio(        INT-8-PNL-01,        "No tiene un turno asignado en este momento."    )    deshabilitarBoton(        INT-8-BTN-01    )FinSiSi usuario.click(    btnVerProgreso(INT-8-BTN-01)) Entonces    Si obj_TurnoActual <> null Entonces        RedirigirVista(            INT-006,            parametros={                "id_paciente" => obj_TurnoActual.id_paciente,                "origen" => "TURNO_ACTUAL"            }        )        recuperarDatosSeguimientoClinico(            str_BD_EnUso,            obj_TurnoActual.id_paciente        )    FinSiFinSi',
    'Boolean bool_DatosTurnoCargadosString[15] str_AccionRealizadabool_DatosTurnoCargados = verificarPanelConDatos(    INT-8-PNL-01)Si usuario.realizoClick(INT-8-BTN-01) Entonces    str_AccionRealizada = "REDIRIGIDO_PROGRESO"    Verificar vistaActiva() = "INT-006"    MostrarMensaje("Cargando progreso del paciente: " + obj_TurnoActual.nombre_paciente + ".")Sino    str_AccionRealizada = "CONSULTA_ACTIVA"    Si bool_DatosTurnoCargados = true Entonces        MostrarMensaje("Turno actual visualizado correctamente.")    FinSiFinSiactivarRefrescoAutomatico(    INT-8-PNL-01,    intervalo=15)'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0028' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0028' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
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
WHERE a.codigo = 'ESP-0028' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
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
WHERE a.codigo = 'ESP-0028' AND av.version = '1.0.0' AND aa.codigo IN ('INT-19', 'INT-19-PNL-01', 'INT-19-BTN-01', 'INT-006', 'TABLE_CITAS', 'TABLE_PACIENTE', 'TABLE_SEGUIMIENTO_CLINICO', 'TABLE_FISIOTERAPEUTA')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0029: Consulta de la agenda diaria y visualización de información del paciente
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0029 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Consulta de la agenda diaria y visualización de información del paciente',
    '2026-07-16',
    'Vital',
    'Concluido',
    'El fisioterapeuta consulta la agenda diaria de citas con la posibilidad de filtrar solo sus propias citas. Desde cada fila puede acceder al panel de información detallada del paciente (diagnóstico, antecedentes, alergias) y desde allí navegar al seguimiento clínico completo del paciente.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0029'
ON CONFLICT (artefacto_id, version) DO NOTHING;

-- Trazabilidad: la plantilla declara ILA-0023 pero ilaciones.sql
-- vincula estas especificaciones a ILA-0019.
INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0019',
    'Boolean bool_PanelTurnoCargadoBoolean bool_PanelAgendaVisibleVista obj_VistaActualobj_VistaActual = obtenerVistaActiva()bool_PanelTurnoCargado = validarVista(    obj_VistaActual,    "INT-0019")Si bool_PanelTurnoCargado = false Entonces    MostrarMensaje("Debe encontrarse en el panel de turno para consultar la agenda.")    Finalizar procedimientoFinSibool_PanelAgendaVisible = verificarPanelDesplegado(    INT-19-PNL-03)Si bool_PanelAgendaVisible = false Entonces    desplegarPanel(INT-19-PNL-03)FinSi',
    'DatosCita[] arr_AgendaDatosPaciente obj_DatosPacienteAgendaDateTime date_ActualBoolean bool_FiltroMisCitasInteger int_TotalCitasString[50] str_BD_EnUsoFisioterapeuta obj_FisioterapeutaAutenticadostr_BD_EnUso = obtenerBaseDatosActiva()date_Actual = obtenerFechaServidor()obj_FisioterapeutaAutenticado = obtenerFisioterapeutaPorUsuario(    str_BD_EnUso,    obtenerUsuarioSesion())bool_FiltroMisCitas = obtenerEstadoFiltro(    INT-19-BTN-02)Si bool_FiltroMisCitas = true Entonces    arr_Agenda = ejecutarConsulta("        SELECT             c.id_cita,            p.id_paciente,            p.nombres || '' '' || p.apellidos AS nombre_paciente,            p.dni,            c.hora_inicio,            c.hora_fin,            c.estado,            c.motivo_consulta        FROM TABLE_CITAS c        INNER JOIN TABLE_PACIENTE p ON c.id_paciente = p.id_paciente        WHERE c.id_fisioterapeuta = :idFisioterapeuta        AND c.fecha = :fechaActual        ORDER BY c.hora_inicio ASC    ", [        ":idFisioterapeuta" => obj_FisioterapeutaAutenticado.id_fisioterapeuta,        ":fechaActual" => date_Actual    ])Sino    arr_Agenda = ejecutarConsulta("        SELECT             c.id_cita,            p.id_paciente,            p.nombres || '' '' || p.apellidos AS nombre_paciente,            p.dni,            f.nombres || '' '' || f.apellidos AS nombre_fisioterapeuta,            c.hora_inicio,            c.hora_fin,            c.estado,            c.motivo_consulta        FROM TABLE_CITAS c        INNER JOIN TABLE_PACIENTE p ON c.id_paciente = p.id_paciente        INNER JOIN TABLE_FISIOTERAPEUTA f ON c.id_fisioterapeuta = f.id_fisioterapeuta        WHERE c.fecha = :fechaActual        ORDER BY c.hora_inicio ASC    ", [        ":fechaActual" => date_Actual    ])FinSilimpiarTabla(INT-19-TBL-01)int_TotalCitas = longitud(arr_Agenda)Para Cada cita En arr_Agenda Hacer    Si bool_FiltroMisCitas = true Entonces        insertarFilaTabla(            INT-19-TBL-01,            [                cita.nombre_paciente,                cita.dni,                formatearHora(cita.hora_inicio),                formatearHora(cita.hora_fin),                cita.estado,                cita.motivo_consulta,                boton("VER", INT-19-BTN-03, cita.id_cita)            ]        )    Sino        insertarFilaTabla(            INT-19-TBL-01,            [                cita.nombre_paciente,                cita.dni,                cita.nombre_fisioterapeuta,                formatearHora(cita.hora_inicio),                formatearHora(cita.hora_fin),                cita.estado,                cita.motivo_consulta,                boton("VER", INT-19-BTN-03, cita.id_cita)            ]        )    FinSiFinParaSi arr_Agenda.estaVacio() Entonces    mostrarMensajeTablaVacia(        INT-19-TBL-01,        "No se encontraron citas programadas para el día de hoy."    )FinSiactualizarEncabezadoAgenda(    INT-19-PNL-03,    int_TotalCitas)Si usuario.click(    btnFiltrarMisCitas(INT-19-BTN-02)) Entonces    alternarEstadoFiltro(INT-19-BTN-02)    refrescarPanelAgenda(        INT-19-PNL-03    )FinSiPara Cada cita En arr_Agenda Hacer    Si usuario.click(        btnVerPaciente(INT-19-BTN-03, cita.id_cita)    ) Entonces        obj_DatosPacienteAgenda = ejecutarConsulta("            SELECT                 p.id_paciente,                p.nombres || '' '' || p.apellidos AS nombre_paciente,                p.dni,                p.edad,                p.telefono,                p.direccion,                hc.diagnostico,                hc.antecedentes,                hc.alergias            FROM TABLE_PACIENTE p            LEFT JOIN TABLE_HISTORIAL_CLINICO hc ON p.id_paciente = hc.id_paciente            WHERE p.id_paciente = :idPaciente        ", [            ":idPaciente" => cita.id_paciente        ])        actualizarPanelInformacionPaciente(            INT-19-PNL-04,            obj_DatosPacienteAgenda        )        desplegarPanel(INT-19-PNL-04)        habilitarBoton(            INT-19-BTN-04,            "VER PROGRESO"        )    FinSiFinParaSi usuario.click(    btnVerProgresoAgenda(INT-19-BTN-04)) Entonces    Si obj_DatosPacienteAgenda <> null Entonces        RedirigirVista(            INT-006,            parametros={                "id_paciente" => obj_DatosPacienteAgenda.id_paciente,                "origen" => "AGENDA"            }        )        recuperarDatosSeguimientoClinico(            str_BD_EnUso,            obj_DatosPacienteAgenda.id_paciente        )    FinSiFinSi',
    'Boolean bool_AgendaCargadaBoolean bool_PanelInfoVisibleInteger int_FilasAgendaString[15] str_AccionRealizadabool_AgendaCargada = verificarTablaConDatos(    INT-19-TBL-01)int_FilasAgenda = contarFilasTabla(    INT-19-TBL-01)Si usuario.realizoClick(INT-19-BTN-03) Entonces    bool_PanelInfoVisible = verificarPanelDesplegado(        INT-19-PNL-04    )    Verificar bool_PanelInfoVisible = true    MostrarMensaje("Información del paciente cargada correctamente.")Sino Si usuario.realizoClick(INT-19-BTN-04) Entonces    Verificar vistaActiva() = "INT-006"    MostrarMensaje("Cargando progreso del paciente: " + obj_DatosPacienteAgenda.nombre_paciente + ".")Sino Si usuario.realizoClick(INT-19-BTN-02) Entonces    Verificar ordenCronologico(INT-19-TBL-01, columna="Hora Inicio") = true    Si bool_FiltroMisCitas = true Entonces        MostrarMensaje("Agenda filtrada: mostrando solo sus citas. " + int_FilasAgenda + " citas encontradas.")    Sino        MostrarMensaje("Agenda completa cargada con " + int_FilasAgenda + " citas programadas.")    FinSiSino    Si bool_AgendaCargada = true Entonces        Verificar ordenCronologico(INT-19-TBL-01, columna="Hora Inicio") = true        MostrarMensaje("Agenda del día cargada con " + int_FilasAgenda + " citas.")    Sino        MostrarMensaje("No se encontraron citas agendadas para el día de hoy.")    FinSiFinSiactivarRefrescoAutomatico(    INT-19-PNL-03,    intervalo=30)'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0029' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0029' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0008'
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
WHERE a.codigo = 'ESP-0029' AND av.version = '1.0.0' AND f.codigo = 'FUE-0003'
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
WHERE a.codigo = 'ESP-0029' AND av.version = '1.0.0' AND aa.codigo IN ('INT-0019', 'INT-19-PNL-03', 'INT-19-PNL-04', 'INT-19-TBL-01', 'INT-19-BTN-02', 'INT-19-BTN-03', 'INT-19-BTN-04', 'INT-006', 'TABLE_CITAS', 'TABLE_PACIENTE', 'TABLE_HISTORIAL_CLINICO', 'TABLE_SEGUIMIENTO_CLINICO', 'TABLE_FISIOTERAPEUTA')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0030: Registro de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0030 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Registro de asistencia',
    '2026-07-06',
    'Vital',
    'Concluido',
    'Se planea usar para las firmas: Firma Perú',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0030'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0020',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
Long idCita
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"

sesionValida = validarSesion()

Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi

usuarioActual = obtenerUsuarioSesion()

permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")

Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para registrar asistencias.")
    Finalizar procedimiento
FinSi

conexionBD = verificarConexionBD(BD_en_uso)

Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi

usuario.click(
    btnCitas(BTN-08)
)

Fin Precondiciones',
    'Inicio

Long idCita
Cita cita
Asistencia asistencia
ArchivoPDF firmaPDF
EstadoPago estadoPago
EstadoCita estadoCita
Boolean asistenciaRegistrada
RutaArchivo rutaFirma

idCita = obtenerCitaSeleccionada()

cita = obtenerCita(idCita)

Si cita = null Entonces
    MostrarMensaje("La cita no existe.")
    Finalizar procedimiento
FinSi

estadoPago = obtenerEstadoPago(idCita)

Si estadoPago <> PAGADO Entonces
    MostrarMensaje("No es posible registrar la asistencia porque la cita aún no ha sido pagada.")
    Finalizar procedimiento
FinSi

asistenciaRegistrada = existeAsistencia(idCita)

Si asistenciaRegistrada = true Entonces
    MostrarMensaje("La asistencia ya fue registrada.")
    Finalizar procedimiento
FinSi

Si usuario.putIn(FileUpload(INT-20-FUP-0001)) Entonces
    firmaPDF = obtenerArchivoSubido()

    Si firmaPDF <> null Entonces
        validarFormatoArchivo(firmaPDF)
        validarTamanoArchivo(firmaPDF)
        rutaFirma = guardarArchivo(firmaPDF)
    Sino
        rutaFirma = null
    FinSi
Sino
    rutaFirma = null
FinSi

Si usuario.click(btnRegistrarAsistencia(INT-20-BTN-002)) Entonces
    asistencia = new Asistencia()
    asistencia.setIdCita(idCita)
    asistencia.setUsuarioRegistro(usuarioActual)
    asistencia.setFechaRegistro(obtenerFechaActual())
    asistencia.setHoraRegistro(obtenerHoraActual())
    asistencia.setRutaFirma(rutaFirma)

    registrarAsistencia(asistencia)
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones

Boolean asistenciaRegistrada
EstadoCita estadoCita
ArchivoPDF firmaPDF

asistenciaRegistrada = existeAsistencia(idCita)

Si asistenciaRegistrada = true Entonces
    estadoCita = obtenerEstadoCita(idCita)
    Verificar estadoCita = EN_CURSO

    Si rutaFirma <> null Entonces
        firmaPDF = obtenerFirmaAsistencia(idCita)
        Verificar firmaPDF <> null
    FinSi

    MostrarMensaje("La asistencia fue registrada correctamente.")
FinSi

Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0030' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0030' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0030' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0030' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-20-FUP-0001', 'INT-20-BTN-002')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0031: Cancelar registro de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0031 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cancelar registro de asistencia',
    '2026-07-08',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0031'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0020',
    'Boolean sesionValida
Boolean permisosValidos
Boolean conexionBD
Usuario usuarioActual
String BD_en_uso

BD_en_uso = "Omvital_Db_Pacientes"
sesionValida = validarSesion()
Si sesionValida = false Entonces
    MostrarMensaje("La sesión ha expirado.")
    Finalizar procedimiento
FinSi
usuarioActual = obtenerUsuarioSesion()
permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")
Si permisosValidos = false Entonces
    MostrarMensaje("No posee permisos para registrar asistencias.")
    Finalizar procedimiento
FinSi
conexionBD = verificarConexionBD(BD_en_uso)
Si conexionBD = false Entonces
    MostrarMensaje("No existe conexión con la base de datos.")
    Finalizar procedimiento
FinSi
usuario.click(btnCitas(BTN-08))
Fin Precondiciones',
    'Inicio
Long idCita
Cita cita

idCita = obtenerCitaSeleccionada()
cita = obtenerCita(idCita)
Si cita = null Entonces
    MostrarMensaje("La cita no existe.")
    Finalizar procedimiento
FinSi

MostrarModal(INT-20-MOD-001)

Si usuario.click(btnCancelar(INT-20-BTN-001)) Entonces
    cerrarModal(INT-20-MOD-001)
    descartarCambiosTemporales()
    MostrarMensaje("Se canceló el registro de asistencia.")
FinSi
Fin Procedimiento',
    'Inicio Postcondiciones
Boolean modalCerrado
Boolean asistenciaRegistrada

modalCerrado = verificarModalCerrado(INT-20-MOD-001)
Verificar modalCerrado = true

asistenciaRegistrada = existeAsistencia(idCita)
Verificar asistenciaRegistrada = false

MostrarMensaje("No se realizaron cambios en la asistencia.")
Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0031' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0031' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0031' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0031' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-20-MOD-001', 'INT-20-BTN-001')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0032: Visualizar constancia de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0032 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Visualizar constancia de asistencia',
    '2026-07-08',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0032'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0021',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDUsuario usuarioActualString BD_en_usoBD_en_uso = "Omvital_Db_Pacientes"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para visualizar constancias de asistencia.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiusuario.click(    btnCitas(BTN-08))Fin Precondiciones',
    'InicioLong idCitaCita citaConstanciaAsistencia constanciaBoolean asistenciaRegistradaidCita = obtenerCitaSeleccionada()cita = obtenerCita(idCita)Si cita = null Entonces    MostrarMensaje("La cita seleccionada no existe.")    Finalizar procedimientoFinSiasistenciaRegistrada = existeAsistencia(idCita)Si asistenciaRegistrada = false Entonces    MostrarMensaje("No existe una asistencia registrada para esta cita.")    Finalizar procedimientoFinSiconstancia = obtenerConstanciaAsistencia(idCita)Si constancia = null Entonces    MostrarMensaje("No fue posible generar la constancia de asistencia.")    Finalizar procedimientoFinSiMostrarModal(INT-21-MOD-001)mostrarVistaPrevia(    INT-21-MOD-001,    constancia)Fin Procedimiento',
    'Inicio PostcondicionesBoolean modalVisibleConstanciaAsistencia constanciamodalVisible =verificarModalVisible(INT-21-MOD-001)Verificar modalVisible = trueconstancia =obtenerConstanciaAsistencia(idCita)Verificar constancia <> nullMostrarMensaje("La constancia de asistencia se visualiza correctamente.")Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0032' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0032' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0032' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0032' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-06-BTN-06', 'INT-06-BTN-08', 'INT-21-MOD-001')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0033: Enviar constancia de asistencia por correo
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0033 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Enviar constancia de asistencia por correo',
    '2026-07-08',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0033'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0021',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDUsuario usuarioActualLong idCitaConstanciaAsistencia constanciaString correoPacienteBoolean modalVisibleString BD_en_usoBD_en_uso = "Omvital_Db_Pacientes"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para enviar constancias.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiusuario.click(    btnCitas(BTN-08))idCita = obtenerCitaSeleccionada()constancia = obtenerConstanciaAsistencia(idCita)Si constancia = null Entonces    MostrarMensaje("La constancia no se encuentra disponible.")    Finalizar procedimientoFinSimodalVisible =verificarModalVisible(INT-21-MOD-001)Si modalVisible = false Entonces    MostrarMensaje("La vista previa de la constancia no está abierta.")    Finalizar procedimientoFinSiFin Precondiciones',
    'InicioCorreo correoArchivoPDF archivoPDFBoolean envioCorrectocorreoPaciente =obtenerCorreoPaciente(idCita)Si correoPaciente = null Entonces    MostrarMensaje("El paciente no tiene un correo registrado.")    Finalizar procedimientoFinSiSi validarCorreo(correoPaciente) = false Entonces    MostrarMensaje("El correo registrado no es válido.")    Finalizar procedimientoFinSiSi usuario.click(    btnEnviarCorreo(INT-21-BTN-001)) Entonces    archivoPDF =    generarPDFConstancia(idCita)    correo = new Correo()    correo.setDestinatario(correoPaciente)    correo.setAsunto(        "Constancia de asistencia"    )    correo.setMensaje(        "Se adjunta la constancia de asistencia."    )    correo.adjuntarArchivo(archivoPDF)    envioCorrecto =    enviarCorreo(correo)    Si envioCorrecto = false Entonces        MostrarMensaje(        "No fue posible enviar la constancia."        )        Finalizar procedimiento    FinSiFinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean correoEnviadocorreoEnviado =verificarEnvioCorreo(idCita)Verificar correoEnviado = trueMostrarMensaje("La constancia fue enviada correctamente al correo del paciente.")Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0033' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0033' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0033' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0033' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-21-MOD-001', 'INT-21-BTN-001')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0034: Enviar constancia de asistencia por WhatsApp
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0034 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Enviar constancia de asistencia por WhatsApp',
    '2026-07-08',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0034'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0021',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDUsuario usuarioActualLong idCitaConstanciaAsistencia constanciaString telefonoPacienteBoolean modalVisibleString BD_en_usoBD_en_uso = "Omvital_Db_Pacientes"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para enviar constancias.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiusuario.click(    btnCitas(BTN-08))idCita = obtenerCitaSeleccionada()constancia = obtenerConstanciaAsistencia(idCita)Si constancia = null Entonces    MostrarMensaje("La constancia no se encuentra disponible.")    Finalizar procedimientoFinSimodalVisible =verificarModalVisible(INT-21-MOD-001)Si modalVisible = false Entonces    MostrarMensaje("La vista previa de la constancia no está abierta.")    Finalizar procedimientoFinSiFin Precondiciones',
    'InicioMensajeWhatsApp mensajeArchivoPDF archivoPDFBoolean envioCorrectotelefonoPaciente =obtenerTelefonoPaciente(idCita)Si telefonoPaciente = null Entonces    MostrarMensaje("El paciente no tiene un número de teléfono registrado.")    Finalizar procedimientoFinSiSi validarTelefono(telefonoPaciente) = false Entonces    MostrarMensaje("El número de teléfono registrado no es válido.")    Finalizar procedimientoFinSiSi usuario.click(    btnEnviarWhatsApp(INT-21-BTN-002)) Entonces    archivoPDF =    generarPDFConstancia(idCita)    mensaje = new MensajeWhatsApp()    mensaje.setDestinatario(telefonoPaciente)    mensaje.setTexto(        "Se adjunta la constancia de asistencia."    )    mensaje.adjuntarArchivo(archivoPDF)    envioCorrecto =    enviarWhatsApp(mensaje)    Si envioCorrecto = false Entonces        MostrarMensaje(        "No fue posible enviar la constancia por WhatsApp."        )        Finalizar procedimiento    FinSiFinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean mensajeEnviadomensajeEnviado =verificarEnvioWhatsApp(idCita)Verificar mensajeEnviado = trueMostrarMensaje("La constancia fue enviada correctamente por WhatsApp.")Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0034' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0034' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0034' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0034' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-21-MOD-001', 'INT-21-BTN-002')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0035: Cerrar vista previa de constancia de asistencia
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0035 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cerrar vista previa de constancia de asistencia',
    '2026-07-08',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0035'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0021',
    'Boolean sesionValidaBoolean permisosValidosBoolean conexionBDUsuario usuarioActualLong idCitaConstanciaAsistencia constanciaBoolean modalVisibleString BD_en_usoBD_en_uso = "Omvital_Db_Pacientes"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(usuarioActual, "RECEPCIONISTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para visualizar constancias.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiusuario.click(    btnCitas(BTN-08))idCita = obtenerCitaSeleccionada()constancia = obtenerConstanciaAsistencia(idCita)Si constancia = null Entonces    MostrarMensaje("La constancia no se encuentra disponible.")    Finalizar procedimientoFinSimodalVisible =verificarModalVisible(INT-21-MOD-001)Si modalVisible = false Entonces    MostrarMensaje("La vista previa de la constancia no está abierta.")    Finalizar procedimientoFinSiFin Precondiciones',
    'InicioBoolean modalCerradoSi usuario.click(    btnCerrar(INT-21-BTN-008)) Entonces    cerrarModal(INT-21-MOD-001)    liberarVistaPrevia()    modalCerrado =    verificarModalCerrado(INT-21-MOD-001)FinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean modalCerradoBoolean constanciaModificadamodalCerrado =verificarModalCerrado(INT-21-MOD-001)Verificar modalCerrado = trueconstanciaModificada =verificarModificacionesConstancia(idCita)Verificar constanciaModificada = falseMostrarMensaje("La vista previa de la constancia fue cerrada correctamente.")Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0035' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0035' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0001'
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
WHERE a.codigo = 'ESP-0035' AND av.version = '1.0.0' AND f.codigo = 'ENT-0001'
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
WHERE a.codigo = 'ESP-0035' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-08', 'INT-21-MOD-001', 'INT-21-BTN-008')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0036: Creación de Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0036 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Creación de Protocolo de Tratamiento Estandarizado',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta registrar protocolos de tratamiento estandarizadas compuestas por información clínica, estado (activo/inactivo), etapa clínica (Aguda/Subaguda/Crónica), enfoques terapéuticos (Alivio del dolor, Fortalecimiento muscular, Psicología del dolor) y actividades terapéuticas reutilizables, favoreciendo la uniformidad en la planificación de sesiones y reduciendo los tiempos de configuración de tratamientos recurrentes.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0036'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0022',
    'Boolean bool_SesionValidaBoolean bool_PermisosValidosBoolean bool_ConexionBDString[50] str_BD_EnUsoUsuario obj_UsuarioActualstr_BD_EnUso = "OMVITAL_DB_PACIENTES"bool_SesionValida = validarSesion()Si bool_SesionValida = false Entonces    MostrarMensaje("La sesión ha expirado. Por favor, inicie sesión nuevamente.")    RedirigirVista(LOGIN)    Finalizar procedimientoFinSiobj_UsuarioActual = obtenerUsuarioSesion()bool_PermisosValidos = validarPermisos(    obj_UsuarioActual,    "FISIOTERAPEUTA")Si bool_PermisosValidos = false Entonces    MostrarMensaje(        "No posee permisos para registrar protocolos de tratamiento."    )    Finalizar procedimientoFinSibool_ConexionBD = verificarConexionBD(    str_BD_EnUso)Si bool_ConexionBD = false Entonces    MostrarMensaje(        "No existe conexión con la base de datos."    )    Finalizar procedimientoFinSiSi usuario.click(    BTN-04) Entonces    RedirigirVista(        "Gestión de Protocolos de Tratamiento"    )FinSiFin Precondiciones',
    'Inicio ProcedimientoString[100] str_NombreProtocoloString[100] str_EspecialidadInteger int_DuracionTratamientoString[500] str_DescripcionClinicaBoolean bool_EstadoActivoString[20] str_EtapaClinicaLista<String> list_EnfoquesTerapeuticosLista<Actividad> list_ActividadesBoolean bool_ProtocoloDuplicadoBoolean bool_DatosValidosProtocoloTratamiento obj_NuevoProtocoloUInt32 uInt32_IdProtocoloRegistradoSi usuario.click(    btnNuevoProtocolo(INT-23-BTN-01)) Entonces    MostrarModal(        INT-22-MDL-01    )FinSiSi usuario.putIn(    Input(INT-22-INP-01)) Entonces    str_NombreProtocolo =        obtenerValorTexto(INT-22-INP-01)FinSiSi usuario.select(    Dropdown(INT-22-DPD-01)) Entonces    str_Especialidad =        obtenerValorSeleccionado(            INT-22-DPD-01        )FinSiSi usuario.putIn(    Input(INT-22-INP-02)) Entonces    int_DuracionTratamiento =        obtenerValorNumerico(            INT-22-INP-02        )FinSiSi usuario.click(    Checkbox(INT-22-CHK-01)) Entonces    bool_EstadoActivo =        obtenerEstadoCheckbox(            INT-22-CHK-01        )FinSiSi usuario.putIn(    Input(INT-22-INP-03)) Entonces    str_DescripcionClinica =        obtenerValorTexto(            INT-22-INP-03        )FinSiSi usuario.click(    Checkbox(INT-22-CHK-02)) Entonces    str_EtapaClinica =        obtenerValoresSeleccionados(            INT-22-CHK-02        )FinSiSi usuario.click(    Checkbox(INT-22-CHK-03)) Entonces    list_EnfoquesTerapeuticos =        obtenerListaSeleccionada(            INT-22-CHK-03        )FinSi',
    'Boolean bool_ProtocoloRegistradoBoolean bool_ActividadesVinculadasBoolean bool_DatosPersistidosString[20] str_EstadoProtocolobool_ProtocoloRegistrado =    existeRegistroId(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",        uInt32_IdProtocoloRegistrado    )Si bool_ProtocoloRegistrado = true Entonces    bool_ActividadesVinculadas =        verificarRelacionActividades(            uInt32_IdProtocoloRegistrado        )    bool_DatosPersistidos =        verificarPersistenciaDatos(            "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",            uInt32_IdProtocoloRegistrado        )    str_EstadoProtocolo =        obtenerEstadoProtocolo(            uInt32_IdProtocoloRegistrado        )    Verificar bool_ActividadesVinculadas = true    Verificar bool_DatosPersistidos = true    Verificar str_EstadoProtocolo =        "ACTIVO"    MostrarMensaje(        "El protocolo de tratamiento fue registrado correctamente."    )    RedirigirVista(        "Gestión de Protocolos de Tratamiento"    )Sino    MostrarMensaje(        "No fue posible registrar el protocolo de tratamiento."    )FinSi'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0036' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ESP-0036' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ESP-0036' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0036' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-01', 'INT-22-MDL-01', 'INT-22-INP-01', 'INT-22-DPD-01', 'INT-22-INP-02', 'INT-22-CHK-01', 'INT-22-INP-03', 'INT-22-CHK-02', 'INT-22-CHK-03', 'INT-22-BTN-02', 'INT-22-TBL-01', 'INT-22-BTN-03', 'INT-22-BTN-04', 'INT-22-BTN-05', 'INT-22-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0037: Consulta de Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0037 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Consulta de Protocolo de Tratamiento Estandarizado',
    '2026-07-13',
    'Vital',
    'Concluido',
    'Permite consultar protocolos clínicos estandarizados para garantizar uniformidad en la atención y facilitar la reutilización de tratamientos previamente definidos.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0037'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0023',
    'Inicio PrecondicionesBoolean bool_SesionValidaBoolean bool_PermisosValidosBoolean bool_ConexionBDBoolean bool_ExisteProtocolosString[50] str_BD_EnUsoUsuario obj_UsuarioActualstr_BD_EnUso = "OMVITAL_DB_PACIENTES"bool_SesionValida = validarSesion()Si bool_SesionValida = false Entonces    MostrarMensaje(        "La sesión ha expirado."    )    Finalizar procedimientoFinSiobj_UsuarioActual = obtenerUsuarioSesion()bool_PermisosValidos = validarPermisos(    obj_UsuarioActual,    "FISIOTERAPEUTA")Si bool_PermisosValidos = false Entonces    MostrarMensaje(        "No posee permisos para consultar protocolos de tratamiento."    )    Finalizar procedimientoFinSibool_ConexionBD = verificarConexionBD(    str_BD_EnUso)Si bool_ConexionBD = false Entonces    MostrarMensaje(        "No existe conexión con la base de datos."    )    Finalizar procedimientoFinSibool_ExisteProtocolos =    existeRegistro(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO"    )Si bool_ExisteProtocolos = false Entonces    MostrarMensaje(        "No existen protocolos de tratamiento registrados."    )    Finalizar procedimientoFinSiFin Precondiciones',
    'Inicio ProcedimientoLista<ProtocoloTratamiento> list_ProtocolosLista<ProtocoloTratamiento> list_ResultadoBusquedaString[100] str_CriterioBusquedaString[50] str_FiltroEspecialidadString[20] str_FiltroEstadoBoolean bool_BusquedaActivaBoolean bool_ProtocoloSeleccionadoUInt32 uInt32_IdProtocoloSeleccionadoProtocoloTratamiento obj_ProtocoloSeleccionadoSi usuario.click(    BTN-04) Entonces    RedirigirVista(        "Gestión de Protocolos de Tratamiento"    )FinSilist_Protocolos =    consultarRegistros(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO"    )MostrarTabla(    INT-23-TBL-01,    list_Protocolos)MostrarControlesBusqueda(    INT-23-INP-01,    INT-23-DPD-01,    INT-23-DPD-02)Si usuario.putIn(    Input(INT-23-INP-01)) Entonces    str_CriterioBusqueda =        obtenerValorTexto(            INT-23-INP-01        )    bool_BusquedaActiva = trueFinSiSi usuario.select(    Dropdown(INT-23-DPD-01)) Entonces    str_FiltroEspecialidad =        obtenerValorSeleccionado(            INT-23-DPD-01        )FinSiSi usuario.select(    Dropdown(INT-23-DPD-02)) Entonces    str_FiltroEstado =        obtenerValorSeleccionado(            INT-23-DPD-02        )FinSiSi usuario.click(    btnBuscar(INT-23-BTN-02)) Entonces    list_ResultadoBusqueda =        filtrarProtocolos(            list_Protocolos,            str_CriterioBusqueda,            str_FiltroEspecialidad,            str_FiltroEstado        )    MostrarTabla(        INT-23-TBL-01,        list_ResultadoBusqueda    )FinSiSi usuario.click(    btnLimpiarFiltros(INT-23-BTN-03)) Entonces    LimpiarCampo(        INT-23-INP-01    )    LimpiarFiltro(        INT-23-DPD-01    )    LimpiarFiltro(        INT-23-DPD-02    )    MostrarTabla(        INT-23-TBL-01,        list_Protocolos    )FinSiSi usuario.click(    btnVer(INT-23-BTN-06)) Entonces    uInt32_IdProtocoloSeleccionado =        obtenerIdSeleccionado(            INT-23-TBL-01        )    obj_ProtocoloSeleccionado =        consultarDetalleProtocolo(            uInt32_IdProtocoloSeleccionado        )    MostrarDetalle(        obj_ProtocoloSeleccionado    )    bool_ProtocoloSeleccionado = trueFinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean bool_ConsultaExitosaBoolean bool_DatosSinModificarProtocoloTratamiento obj_ProtocoloConsultadobool_ConsultaExitosa =    verificarExistenciaConsulta(        uInt32_IdProtocoloSeleccionado    )Si bool_ConsultaExitosa = true Entonces    bool_DatosSinModificar =        verificarIntegridadDatos(            "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO"        )    Verificar bool_DatosSinModificar = true    obj_ProtocoloConsultado =        obtenerProtocolo(            uInt32_IdProtocoloSeleccionado        )    MostrarMensaje(        "Consulta realizada correctamente."    )    Verificar obj_ProtocoloConsultado <> nullSino    MostrarMensaje(        "No fue posible consultar el protocolo seleccionado."    )FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0037' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ESP-0037' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ESP-0037' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0037' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-TXT-01', 'INT-23-BTN-01', 'INT-23-INP-01', 'INT-23-DPD-01', 'INT-23-DPD-02', 'INT-23-BTN-03', 'INT-23-BTN-02', 'INT-23-TBL-01', 'INT-23-BTN-06', 'INT-23-BTN-05', 'INT-23-BTN-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0038: Actualización del Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0038 v2.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '2.0.0',
    'Actualización del Protocolo de Tratamiento Estandarizado',
    '2026-07-13',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta mantener actualizadas los protocolos de tratamiento estandarizadas, modificando información clínica, estado (activo/inactivo), etapa clínica (Aguda/Subaguda/Crónica), enfoques terapéuticos (Alivio del dolor, Fortalecimiento muscular, Psicología del dolor) y actividades terapéuticas asociadas.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0038'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0024',
    'Inicio PrecondicionesBoolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean protocoloExisteUsuario usuarioActualString BD_en_usoBD_en_uso = "OMVITAL_DB_PACIENTES"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(    usuarioActual,    "FISIOTERAPEUTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para actualizar protocolos de tratamiento.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiprotocoloExiste = existeRegistro(    "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO")Si protocoloExiste = false Entonces    MostrarMensaje("No existen protocolos registrados para actualizar.")    Finalizar procedimientoFinSiusuario.click(    btnProtocolos(BTN-04))Fin Precondiciones',
    'Inicio ProcedimientoString[100] str_NombreProtocoloString[100] str_EspecialidadInteger int_DuracionTratamientoString[500] str_DescripcionClinicaBoolean bool_EstadoActivoString[20] str_EtapaClinicaLista<String> list_EnfoquesTerapeuticosLista<Actividad> list_ActividadesActualizadasBoolean bool_ProtocoloExisteBoolean bool_DatosValidosBoolean bool_ActividadModificadaProtocoloTratamiento obj_ProtocoloActualizarUInt32 uInt32_IdProtocoloActualizarSi usuario.click(    BTN-04) Entonces    RedirigirVista(        "Gestión de Protocolos de Tratamiento"    )FinSiSi usuario.click(    btnEditar(INT-23-BTN-05)) Entonces    uInt32_IdProtocoloActualizar =        obtenerIdSeleccionado(            INT-23-TBL-01        )    bool_ProtocoloExiste =        existeRegistroId(            "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",            uInt32_IdProtocoloActualizar        )    Si bool_ProtocoloExiste = false Entonces        MostrarMensaje(            "El protocolo seleccionado no existe."        )        Finalizar procedimiento    FinSi    obj_ProtocoloActualizar =        consultarDetalleProtocolo(            uInt32_IdProtocoloActualizar        )    MostrarModal(        INT-24-MDL-01    )    CargarDatosFormulario(        obj_ProtocoloActualizar    )FinSiSi usuario.putIn(    Input(INT-24-INP-01)) Entonces    str_NombreProtocolo =        obtenerValorTexto(            INT-24-INP-01        )FinSiSi usuario.select(    Dropdown(INT-24-DPD-01)) Entonces    str_Especialidad =        obtenerValorSeleccionado(            INT-24-DPD-01        )FinSiSi usuario.putIn(    Input(INT-24-INP-02)) Entonces    int_DuracionTratamiento =        obtenerValorNumerico(            INT-24-INP-02        )FinSiSi usuario.click(    Checkbox(INT-24-CHK-01)) Entonces    bool_EstadoActivo =        obtenerEstadoCheckbox(            INT-24-CHK-01        )FinSiSi usuario.putIn(    Input(INT-24-INP-03)) Entonces    str_DescripcionClinica =        obtenerValorTexto(            INT-24-INP-03        )FinSiSi usuario.click(    Checkbox(INT-24-CHK-02)) Entonces    str_EtapaClinica =        obtenerValoresSeleccionados(            INT-24-CHK-02        )FinSiSi usuario.click(    Checkbox(INT-24-CHK-03)) Entonces    list_EnfoquesTerapeuticos =        obtenerListaSeleccionada(            INT-24-CHK-03        )FinSiSi usuario.click(    btnAgregarActividad(INT-24-BTN-02)) Entonces    HabilitarRegistroActividades()    Mientras usuario.agregueActividades() Hacer        Actividad obj_NuevaActividad        obj_NuevaActividad =            registrarActividadTemporal()        agregarLista(            list_ActividadesActualizadas,            obj_NuevaActividad        )        MostrarTabla(            INT-24-TBL-01,            list_ActividadesActualizadas        )    FinMientrasFinSiSi usuario.click(    btnEditarActividad(INT-24-BTN-03)) Entonces    Actividad obj_ActividadEditar    obj_ActividadEditar =        obtenerActividadSeleccionada(            INT-24-TBL-01        )    modificarActividad(        obj_ActividadEditar    )    actualizarTabla(        INT-24-TBL-01    )FinSiSi usuario.click(    btnEliminarActividad(INT-24-BTN-04)) Entonces    Actividad obj_ActividadEliminar    obj_ActividadEliminar =        obtenerActividadSeleccionada(            INT-24-TBL-01        )    eliminarActividadTemporal(        obj_ActividadEliminar    )    actualizarTabla(        INT-24-TBL-01    )FinSiSi usuario.click(    btnGuardarProtocolo(INT-24-BTN-05)) Entonces    Si str_NombreProtocolo = null    o str_NombreProtocolo = "" Entonces        MostrarMensaje(            "El nombre del protocolo es obligatorio."        )        ResaltarCampo(            INT-24-INP-01        )        Finalizar procedimiento    FinSi    Si str_Especialidad = null    o str_Especialidad = "" Entonces        MostrarMensaje(            "Debe seleccionar una especialidad."        )        ResaltarCampo(            INT-24-DPD-01        )        Finalizar procedimiento    FinSi    Si int_DuracionTratamiento <= 0 Entonces        MostrarMensaje(            "La duración del tratamiento debe ser mayor a cero."        )        ResaltarCampo(            INT-24-INP-02        )        Finalizar procedimiento    FinSi    Si str_DescripcionClinica = null    o str_DescripcionClinica = "" Entonces        MostrarMensaje(            "La descripción clínica es obligatoria."        )        ResaltarCampo(            INT-24-INP-03        )        Finalizar procedimiento    FinSi    Si str_EtapaClinica = null Entonces        MostrarMensaje(            "Debe seleccionar una etapa clínica."        )        ResaltarCampo(            INT-24-CHK-02        )        Finalizar procedimiento    FinSi    Si longitud(list_EnfoquesTerapeuticos) = 0 Entonces        MostrarMensaje(            "Debe seleccionar al menos un enfoque terapéutico."        )        ResaltarCampo(            INT-24-CHK-03        )        Finalizar procedimiento    FinSi    obj_ProtocoloActualizar =        new ProtocoloTratamiento()    obj_ProtocoloActualizar.setId(        uInt32_IdProtocoloActualizar    )    obj_ProtocoloActualizar.setNombre(        str_NombreProtocolo    )    obj_ProtocoloActualizar.setEspecialidad(        str_Especialidad    )    obj_ProtocoloActualizar.setDuracion(        int_DuracionTratamiento    )    obj_ProtocoloActualizar.setDescripcionClinica(        str_DescripcionClinica    )    obj_ProtocoloActualizar.setEstado(        bool_EstadoActivo    )    obj_ProtocoloActualizar.setEtapaClinica(        str_EtapaClinica    )    obj_ProtocoloActualizar.setEnfoques(        list_EnfoquesTerapeuticos    )    actualizarProtocolo(        obj_ProtocoloActualizar    )    actualizarActividades(        uInt32_IdProtocoloActualizar,        list_ActividadesActualizadas    )    MostrarMensaje(        "El protocolo fue actualizado correctamente."    )    CerrarModal(        INT-24-MDL-01    )    ActualizarListado(        INT-23-TBL-01    )FinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean protocoloActualizadoBoolean actividadesActualizadasBoolean informacionDisponibleString str_EstadoProtocoloprotocoloActualizado = verificarActualizacionRegistro(    "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",    id_Protocolo)Si protocoloActualizado = true Entonces    actividadesActualizadas = verificarActualizacionActividades(        id_Protocolo    )    Si actividadesActualizadas = true Entonces        MostrarMensaje("Las actividades asociadas fueron actualizadas correctamente.")    FinSi    informacionDisponible = verificarDisponibilidadRegistro(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",        id_Protocolo    )    Si informacionDisponible = true Entonces        MostrarMensaje("El protocolo actualizado está disponible para consultas posteriores.")    FinSi    str_EstadoProtocolo = obtenerEstadoProtocolo(        id_Protocolo    )    Verificar str_EstadoProtocolo = "ACTUALIZADO"    MostrarMensaje("El protocolo de tratamiento fue actualizado correctamente.")Sino    MostrarMensaje("No se pudo actualizar el protocolo de tratamiento.")FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0038' AND av.version = '2.0.0'
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
WHERE a.codigo = 'ESP-0038' AND av.version = '2.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ESP-0038' AND av.version = '2.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0038' AND av.version = '2.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-05', 'INT-24-MDL-01', 'INT-24-INP-01', 'INT-24-DPD-01', 'INT-24-INP-02', 'INT-24-CHK-01', 'INT-24-INP-03', 'INT-24-CHK-02', 'INT-24-CHK-03', 'INT-24-BTN-02', 'INT-24-TBL-01', 'INT-24-BTN-03', 'INT-24-BTN-04', 'INT-24-BTN-05', 'INT-24-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0039: Eliminación del Protocolo de Tratamiento Estandarizado
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0039 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Eliminación del Protocolo de Tratamiento Estandarizado',
    '2026-07-13',
    'Vital',
    'Concluido',
    'Permite al fisioterapeuta eliminar plantillas de tratamiento estandarizadas que ya no son necesarias o que han sido reemplazadas por nuevas versiones. La confirmación previa evita eliminaciones accidentales y garantiza que únicamente se eliminen registros validados por el usuario responsable.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0039'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0025',
    'Inicio PrecondicionesBoolean sesionValidaBoolean permisosValidosBoolean conexionBDBoolean protocoloExisteUsuario usuarioActualString BD_en_usoBD_en_uso = "OMVITAL_DB_PACIENTES"sesionValida = validarSesion()Si sesionValida = false Entonces    MostrarMensaje("La sesión ha expirado.")    Finalizar procedimientoFinSiusuarioActual = obtenerUsuarioSesion()permisosValidos = validarPermisos(    usuarioActual,    "FISIOTERAPEUTA")Si permisosValidos = false Entonces    MostrarMensaje("No posee permisos para eliminar protocolos de tratamiento.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiprotocoloExiste = existeRegistro(    "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO")Si protocoloExiste = false Entonces    MostrarMensaje("No existen protocolos registrados para eliminar.")    Finalizar procedimientoFinSiusuario.click(    btnProtocolos(BTN-04))Fin Precondiciones',
    'Inicio ProcedimientoString[20] id_ProtocoloBoolean confirmacionEliminacionBoolean protocoloValidoBoolean permisosValidosBoolean eliminacionExitosaProtocolo obj_ProtocoloEliminarSi usuario.click(    btnProtocolos(BTN-04)) Entonces    RedirigirVista(        INT-23    )FinSiSi usuario.seleccionaRegistro(    TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO) Entonces    id_Protocolo = obtenerIdentificadorProtocoloSeleccionado()FinSiSi usuario.click(    btnEliminar(INT-23-BTN-04)) Entonces    obj_ProtocoloEliminar = obtenerInformacionProtocolo(        id_Protocolo    )    MostrarModal(        INT-25-MDL-01    )    MostrarMensajeConfirmacion(        INT-25-TXT-01,        obj_ProtocoloEliminar.nombre    )FinSiSi usuario.click(    btnCancelar(INT-25-BTN-03)) Entonces    CerrarModal(        INT-25-MDL-01    )    MostrarMensaje(        "La eliminación fue cancelada."    )    Finalizar procedimientoFinSiSi usuario.click(    btnConfirmarEliminar(INT-25-BTN-02)) Entonces    protocoloValido = existeRegistro(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",        id_Protocolo    )    Si protocoloValido = false Entonces        MostrarMensaje(            "El protocolo seleccionado no existe."        )        Finalizar procedimiento    FinSi    permisosValidos = validarPermisos(        usuarioActual,        "ELIMINAR_PROTOCOLO"    )    Si permisosValidos = false Entonces        MostrarMensaje(            "No posee permisos para eliminar protocolos."        )        Finalizar procedimiento    FinSi    eliminacionExitosa = eliminarRegistro(        "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",        id_Protocolo    )    Si eliminacionExitosa = true Entonces        eliminarRelacionesAsociadas(            id_Protocolo        )        actualizarBaseDatos(            "OMVITAL_DB_PACIENTES"        )        CerrarModal(            INT-25-MDL-01        )        ActualizarListado(            INT-23-TBL-01        )        MostrarMensaje(            "El protocolo fue eliminado correctamente."        )    Sino        MostrarMensaje(            "No fue posible eliminar el protocolo."        )    FinSiFinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean protocoloEliminadoBoolean relacionesEliminadasBoolean listadoActualizadoBoolean integridadBDString str_EstadoEliminacionprotocoloEliminado = verificarEliminacionRegistro(    "TABLE_PROTOCOLO_DE_TRATAMIENTO_ESTANDARIZADO",    id_Protocolo)Si protocoloEliminado = true Entonces    relacionesEliminadas = verificarEliminacionRelaciones(        id_Protocolo    )    Si relacionesEliminadas = true Entonces        MostrarMensaje("Las relaciones asociadas al protocolo fueron eliminadas correctamente.")    FinSi    listadoActualizado = actualizarListado(        "GESTION_PROTOCOLOS_TRATAMIENTO"    )    Si listadoActualizado = true Entonces        MostrarMensaje("El listado de protocolos fue actualizado.")    FinSi    integridadBD = verificarIntegridadBaseDatos(        "OMVITAL_DB_PACIENTES"    )    Si integridadBD = true Entonces        MostrarMensaje("La integridad de la información se mantiene correctamente.")    FinSi    str_EstadoEliminacion = obtenerEstadoEliminacion(        id_Protocolo    )    Verificar str_EstadoEliminacion = "ELIMINADO"    MostrarMensaje("El protocolo de tratamiento fue eliminado correctamente.")Sino    MostrarMensaje("No se pudo eliminar el protocolo de tratamiento.")FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0039' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0039' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ESP-0039' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0039' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-01', 'BTN-04', 'INT-23-BTN-04', 'INT-25-MDL-01', 'INT-25-TXT-01', 'INT-25-BTN-02', 'INT-25-BTN-03', 'INT-25-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0040: Visualización general del dashboard de monitoreo en recepción
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0040 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Visualización general del dashboard de monitoreo en recepción',
    '2026-07-16',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0003'
WHERE a.codigo = 'ESP-0040'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0026',
    'INICIO    VALIDAR usuario.inicioSesion == ACTIVO    VALIDAR usuario.rol == "Recepcionista"    VALIDAR usuario.permisos contiene:        "VISUALIZAR_DASHBOARD"        "CONSULTAR_MONITOREO_RECEPCION"    VALIDAR conexionInternet == DISPONIBLE    VALIDAR conexionBaseDatos ("OMVITAL_DB_PACIENTES") == DISPONIBLE    VALIDAR existenciaTablas:        TABLE_PACIENTE        TABLE_CITA        TABLE_CAMILLA        TABLE_FISIOTERAPEUTAFIN',
    'INICIO    Usuario hace click en boton "Flujo de Atención"         SISTEMA carga centralizadamente los componentes del panel         SISTEMA recupera datos de las tablas e inicia conexion de monitoreo en tiempo real        SISTEMA lista en panel "Citas Actuales por Fisioterapeuta" :        Fisioterapeutas activos        Paciente actual asignado a camilla        Hora de inicio de sesion        Hora de fin de sesion            SISTEMA despliega ocupacion en panel "Camillas":        Camillas ocupadas con minutos restantes de terapia        Camillas libres            SISTEMA despliega tabla cronologica en panel "Agenda del Dia":        Fisioterapeuta asignado        Camilla asignada        Paciente asignado        Hora especifica de cita            SISTEMA carga y mantiene habilitado panel "Novedades" para supervision de contingencias        SISTEMA actualiza automaticamente la informacion en pantalla sin recarga manualFIN',
    'SI operacion_carga == EXITOSA ENTONCES    dashboard.componentesCargados = VERDADERO    dashboard.sincronizadoBaseDatos = VERDADERO    recepcion.estadoConsulta = ACTIVO    panelNovedades.habilitado = VERDADERO    panelCamillas.habilitado = VERDADEROSINO    dashboard.componentesCargados = FALSO    dashboard.sincronizadoBaseDatos = FALSO    recepcion.estadoConsulta = INACTIVO    SISTEMA.mostrarMensajeError("Error de conexión o carga de datos")FIN SI'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0040' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0040' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0002'
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
WHERE a.codigo = 'ESP-0040' AND av.version = '1.0.0' AND f.codigo = 'ENT-0004'
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
WHERE a.codigo = 'ESP-0040' AND av.version = '1.0.0' AND f.codigo = 'FUE-0001'
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
WHERE a.codigo = 'ESP-0040' AND av.version = '1.0.0' AND aa.codigo IN ('SDB-02', 'BTN-01', 'INT-26-PNL-01', 'INT-26-PNL-02', 'INT-26-PNL-03', 'INT-26-PNL-04', 'INT-26-TBL-01', 'INT-26-TBL-02', 'INT-26-TBL-04')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0041: Ingreso al sistema
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0041 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Ingreso al sistema',
    '2026-07-09',
    'Vital',
    'Concluido',
    'Permite a los usuarios (Administrador, Recepcionista, Coordinador, Fisioterapeuta) ingresar al sistema mediante correo y contraseña. Una vez autenticados, el sistema redirige a una interfaz diferente según el rol y permisos del usuario. Se implementa bloqueo tras 3 intentos fallidos.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0041'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0027',
    'Boolean sesionIniciadaBoolean conexionBDString BD_en_usoString str_CorreoString str_ContraseniaString str_RolUsuarioint int_IntentosFallidosBD_en_uso = "OMVITAL_DB_ADMINISTRATIVO"sesionIniciada = obtenerSesionActual()Si sesionIniciada = true Entonces    MostrarMensaje("Ya existe una sesión activa.")    Finalizar procedimientoFinSiconexionBD = verificarConexionBD(BD_en_uso)Si conexionBD = false Entonces    MostrarMensaje("No existe conexión con la base de datos.")    Finalizar procedimientoFinSiint_IntentosFallidos = 0',
    'Inicio// Obtener credenciales del formularioSi usuario.putIn(Input(INT-027-INP-01)) Entonces    str_Correo = obtenerValorTexto(INT-027-INP-01)FinSiSi usuario.putIn(Input(INT-027-INP-02)) Entonces    str_Contrasenia = obtenerValorTexto(INT-027-INP-02)FinSi// Validar campos obligatoriosSi str_Correo = "" o str_Correo = null Entonces    MostrarMensaje("El campo Correo es obligatorio.")    ResaltarCampo(INT-027-INP-01)    Finalizar procedimientoFinSiSi str_Contrasenia = "" o str_Contrasenia = null Entonces    MostrarMensaje("El campo Contraseña es obligatorio.")    ResaltarCampo(INT-027-INP-02)    Finalizar procedimientoFinSi// Validar formato de correoSi validarFormatoCorreo(str_Correo) = false Entonces    MostrarMensaje("El formato del correo no es válido.")    ResaltarCampo(INT-027-INP-01)    Finalizar procedimientoFinSi// Verificar credenciales en base de datosSi usuario.click(btnIniciarSesion(INT-027-BTN-01)) Entonces    bool_UsuarioValido = validarCredenciales(str_Correo, str_Contrasenia)    Si bool_UsuarioValido = false Entonces        int_IntentosFallidos = int_IntentosFallidos + 1        MostrarMensaje("Correo o contraseña incorrectos.")        Si int_IntentosFallidos >= 3 Entonces            MostrarMensaje("Ha excedido el número de intentos permitidos.")            BloquearUsuario(str_Correo)            Finalizar procedimiento        FinSi        Finalizar procedimiento    FinSiFinSi// Obtener rol del usuariostr_RolUsuario = obtenerRolUsuario(str_Correo)// Iniciar sesióniniciarSesion(str_Correo)// Redirigir según el rolSi str_RolUsuario = "ADMINISTRADOR" Entonces    RedirigirVista(INT-100)FinSiSi str_RolUsuario = "RECEPCIONISTA" Entonces    RedirigirVista(INT-200)FinSiSi str_RolUsuario = "COORDINADOR" Entonces    RedirigirVista(INT-300)FinSiSi str_RolUsuario = "FISIOTERAPEUTA" Entonces    RedirigirVista(INT-400)FinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean sesionActivaString str_RolVerificadoString str_UsuarioLogueadosesionActiva = verificarSesionActiva()Si sesionActiva = true Entonces    str_UsuarioLogueado = obtenerUsuarioSesion()    str_RolVerificado = obtenerRolUsuario(str_UsuarioLogueado)    MostrarMensaje("Bienvenido " + str_UsuarioLogueado)    Verificar str_RolVerificado <> ""FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0041' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0041' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
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
WHERE a.codigo = 'ESP-0041' AND av.version = '1.0.0' AND f.codigo = 'ENT-0005'
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
WHERE a.codigo = 'ESP-0041' AND av.version = '1.0.0' AND aa.codigo IN ('INT-027-IMG-01', 'INT-027-IMG-02', 'INT-027-IMG-03', 'INT-027-INP-01', 'INT-027-INP-02', 'INT-027-TXT-01', 'INT-027-TXT-02', 'INT-027-BTN-01')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0042: Cierre de sesión
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0042 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Cierre de sesión',
    '2026-07-09',
    'Alta',
    'Concluido',
    'Permite a cualquier usuario cerrar su sesión de forma segura, invalidando su autenticación y redirigiéndolo a la página de inicio de sesión. Se registra el evento en el log de auditoría.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0042'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0027',
    'Boolean sesionActivaString str_UsuarioActualString BD_en_usoBD_en_uso = "OMVITAL_DB_ADMINISTRATIVO"sesionActiva = verificarSesionActiva()Si sesionActiva = false Entonces    MostrarMensaje("No hay una sesión activa para cerrar.")    Finalizar procedimientoFinSistr_UsuarioActual = obtenerUsuarioSesion()',
    'Inicio// El usuario hace clic en el botón de cierre de sesiónSi usuario.click(btnCerrarSesion(BTN-99)) Entonces    MostrarConfirmacion("¿Está seguro de que desea cerrar sesión?")FinSi// Si el usuario confirmaSi confirmacionAceptada = true Entonces    // Registrar el evento de cierre de sesión en el log    registrarEventoLog(str_UsuarioActual, "CIERRE_SESION")    // Invalidar la sesión en el servidor    invalidarSesion(str_UsuarioActual)    // Limpiar datos locales (cookies, localStorage, etc.)    limpiarDatosSesionLocal()    // Redirigir a la página de inicio de sesión    RedirigirVista(INT-027)    MostrarMensaje("Sesión cerrada exitosamente.")FinSi// Si el usuario cancelaSi confirmacionAceptada = false Entonces    MostrarMensaje("Operación cancelada.")    Finalizar procedimientoFinSiFin Procedimiento',
    'Inicio PostcondicionesBoolean sesionActivaPostsesionActivaPost = verificarSesionActiva()Si sesionActivaPost = false Entonces    Verificar sesionActivaPost = false    MostrarMensaje("Sesión cerrada exitosamente.")FinSiFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0042' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0042' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
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
WHERE a.codigo = 'ESP-0042' AND av.version = '1.0.0' AND f.codigo = 'ENT-0005'
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
WHERE a.codigo = 'ESP-0042' AND av.version = '1.0.0' AND aa.codigo IN ('BTN-99', 'INT-027')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0043: Validación de sesión activa
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0043 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Validación de sesión activa',
    '2026-07-09',
    'Alta',
    'Concluido',
    'Esta especificación se ejecuta automáticamente al cargar cualquier página del sistema. Valida que el usuario tenga una sesión activa y que tenga los permisos necesarios para acceder a la página solicitada. Si no tiene sesión, redirige al login. Si el usuario ya tiene sesión e intenta acceder al login, redirige automáticamente a su panel correspondiente.',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0043'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0027',
    'Boolean accesoDirectoString paginaActualString BD_en_usoBD_en_uso = "OMVITAL_DB_ADMINISTRATIVO"paginaActual = obtenerPaginaActual()accesoDirecto = false',
    'Inicio// Al cargar cualquier página del sistema, se ejecuta esta validaciónSi paginaActual <> "INT-027" Entonces    // Verificar si el usuario tiene sesión activa    Boolean sesionActiva = verificarSesionActiva()    Si sesionActiva = false Entonces        // El usuario no tiene sesión, redirigir al login        MostrarMensaje("Su sesión ha expirado. Por favor, inicie sesión nuevamente.")        RedirigirVista(INT-027)        Finalizar procedimiento    FinSi        // Verificar si el token de sesión es válido y no ha expirado    Boolean tokenValido = validarTokenSesion()    Si tokenValido = false Entonces        MostrarMensaje("Su sesión ha expirado. Por favor, inicie sesión nuevamente.")        RedirigirVista(INT-027)        Finalizar procedimiento    FinSi    // Verificar que el usuario tenga permisos para la página actual    String str_RolUsuario = obtenerRolUsuario(obtenerUsuarioSesion())    Boolean permisosPagina = verificarPermisosPagina(paginaActual, str_RolUsuario)    Si permisosPagina = false Entonces        MostrarMensaje("No tiene permisos para acceder a esta página.")        RedirigirVista(obtenerPanelPorRol(str_RolUsuario))        Finalizar procedimiento    FinSiFinSi// Si la página actual es la de login (INT-027)Si paginaActual = "INT-027" Entonces    Boolean sesionActiva = verificarSesionActiva()    Si sesionActiva = true Entonces        // Si el usuario ya tiene sesión, redirigir a su panel        String str_RolUsuario = obtenerRolUsuario(obtenerUsuarioSesion())        RedirigirVista(obtenerPanelPorRol(str_RolUsuario))        Finalizar procedimiento    FinSiFinSiFin Procedimiento',
    'Inicio PostcondicionesString str_VistaActualstr_VistaActual = obtenerPaginaActual()Verificar str_VistaActual <> ""Fin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0043' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0043' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0010'
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
WHERE a.codigo = 'ESP-0043' AND av.version = '1.0.0' AND f.codigo = 'ENT-0005'
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
WHERE a.codigo = 'ESP-0043' AND av.version = '1.0.0' AND aa.codigo IN ('INT-027', 'Todas')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- ESP-0044: Redirección según rol y permisos
-- ============================================================

-- ------------------------------------------------------------
-- ESP-0044 v1.0.0
-- ------------------------------------------------------------

INSERT INTO artefacto_version (
    artefacto_id, version, nombre, fecha, importancia, estado,
    comentario, actor_id, experto_id, es_actual
)
SELECT
    a.id,
    '1.0.0',
    'Redirección según rol y permisos',
    '2026-07-13',
    'Vital',
    'Concluido',
    'Ninguno',
    act.id,
    NULL,
    TRUE
FROM artefacto a
JOIN actor act ON act.codigo = 'ACT-0001'
WHERE a.codigo = 'ESP-0044'
ON CONFLICT (artefacto_id, version) DO NOTHING;

INSERT INTO especificacion_version (
    artefacto_version_id, codigo_ilacion,
    precondicion, procedimiento, postcondicion
)
SELECT
    av.id,
    'ILA-0027',
    'String str_RolUsuarioString str_UsuarioActualBoolean sesionActivasesionActiva = verificarSesionActiva()Si sesionActiva = false Entonces    MostrarMensaje("No hay sesión activa.")    Finalizar procedimientoFinSistr_UsuarioActual = obtenerUsuarioSesion()str_RolUsuario = obtenerRolUsuario(str_UsuarioActual)',
    'Inicio// Validar que el rol sea uno de los permitidosSi str_RolUsuario = "ADMINISTRADOR" o str_RolUsuario = "RECEPCIONISTA" o str_RolUsuario = "COORDINADOR" o str_RolUsuario = "FISIOTERAPEUTA" Entonces    // Rol válido, proceder con la redirecciónSiNo    MostrarMensaje("Rol de usuario no reconocido.")    CerrarSesion()    Finalizar procedimientoFinSi// Redirigir según el rol y los permisosSi str_RolUsuario = "ADMINISTRADOR" Entonces    // El administrador tiene acceso completo a todas las funcionalidades    RedirigirVista(INT-100)FinSiSi str_RolUsuario = "RECEPCIONISTA" Entonces    // El recepcionista solo ve módulo de pacientes, citas y agenda    RedirigirVista(INT-200)FinSiSi str_RolUsuario = "COORDINADOR" Entonces    // El coordinador supervisa pacientes y personal    RedirigirVista(INT-300)FinSiSi str_RolUsuario = "FISIOTERAPEUTA" Entonces    // El fisioterapeuta solo ve sus pacientes y sesiones    RedirigirVista(INT-400)FinSi// Registrar el ingreso en el log de auditoríaregistrarEventoLog(str_UsuarioActual, "INGRESO_SISTEMA")Fin Procedimiento',
    'Inicio PostcondicionesString str_VistaDestinoBoolean vistaCargadastr_VistaDestino = obtenerPaginaActual()vistaCargada = (str_VistaDestino <> "")Verificar vistaCargada = trueFin Postcondiciones'
FROM artefacto_version av
JOIN artefacto a ON av.artefacto_id = a.id
WHERE a.codigo = 'ESP-0044' AND av.version = '1.0.0'
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
WHERE a.codigo = 'ESP-0044' AND av.version = '1.0.0' AND aut.codigo = 'AUT-0004'
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
WHERE a.codigo = 'ESP-0044' AND av.version = '1.0.0' AND f.codigo = 'FUE-0004'
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
WHERE a.codigo = 'ESP-0044' AND av.version = '1.0.0' AND aa.codigo IN ('INT-100', 'INT-200', 'INT-300', 'INT-400')
ON CONFLICT (artefacto_version_id, artefacto_asociado_id) DO NOTHING;

-- ============================================================
-- FIN DE ESPECIFICACIONES
-- ============================================================
