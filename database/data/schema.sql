-- ============================================================
-- SISTEMA DE TRAZABILIDAD DE ARTEFACTOS
-- PostgreSQL
-- ============================================================


-- ============================================================
-- 1. LIMPIEZA
-- ============================================================

DROP TABLE IF EXISTS
    artefacto_version_artefacto_asociado,
    artefacto_asociado,
    trazabilidad,
    especificacion_version,
    ilacion_version,
    educcion_version,
    rnf_version,
    artefacto_version_fuente,
    artefacto_version_autor,
    artefacto_version,
    artefacto,
    fuente_version,
    fuente,
    experto,
    actor,
    autor_version,
    autor
CASCADE;


-- ============================================================
-- 2. AUTORES
-- ============================================================
-- autor representa la identidad del autor.
--
-- Ejemplo:
--
-- AUT-0002
--   ├── v1.0.0
--   └── v1.0.1
--
-- Las versiones se almacenan en autor_version.
-- ============================================================

CREATE TABLE autor (
    id              BIGSERIAL PRIMARY KEY,

    codigo          VARCHAR(20) NOT NULL UNIQUE
);


-- ============================================================
-- 3. VERSIONES DE AUTORES
-- ============================================================

CREATE TABLE autor_version (
    id                      BIGSERIAL PRIMARY KEY,

    autor_id                BIGINT NOT NULL,

    version                 VARCHAR(20) NOT NULL,

    nombres_apellidos       VARCHAR(200) NOT NULL,

    alias                   VARCHAR(100),

    fecha                   DATE NOT NULL,

    rol                     VARCHAR(150),

    organizacion            VARCHAR(30),

    autor_plantilla_codigo  VARCHAR(20),

    estado                  VARCHAR(50),

    comentario              TEXT,

    es_actual               BOOLEAN NOT NULL DEFAULT FALSE,

    fecha_registro          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_autor_version_autor
        FOREIGN KEY (autor_id)
        REFERENCES autor(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_autor_version
        UNIQUE (autor_id, version)
);


-- ============================================================
-- 4. GARANTIZAR UNA SOLA VERSIÓN ACTUAL DEL AUTOR
-- ============================================================

CREATE UNIQUE INDEX uq_una_version_actual_autor
ON autor_version (autor_id)
WHERE es_actual = TRUE;


-- ============================================================
-- 5. EXPERTOS
-- ============================================================

CREATE TABLE experto (
    id              BIGSERIAL PRIMARY KEY,

    codigo          VARCHAR(20) NOT NULL UNIQUE,

    nombre          VARCHAR(150) NOT NULL,

    especialidad    VARCHAR(150),

    descripcion     TEXT
);


-- ============================================================
-- 6. ACTORES
-- ============================================================

CREATE TABLE actor (
    id              BIGSERIAL PRIMARY KEY,

    codigo          VARCHAR(20) NOT NULL UNIQUE,

    nombre          VARCHAR(150) NOT NULL,

    descripcion     TEXT
);


-- ============================================================
-- 7. FUENTES
-- ============================================================
-- fuente representa la identidad de la fuente.
--
-- Ejemplo:
--
-- FUE-0002
--   ├── v1.0.0
--   └── v1.0.1
--
-- Las versiones se almacenan en fuente_version.
-- ============================================================

CREATE TABLE fuente (
    id              BIGSERIAL PRIMARY KEY,

    codigo          VARCHAR(30) NOT NULL UNIQUE
);


-- ============================================================
-- 8. VERSIONES DE FUENTES
-- ============================================================

CREATE TABLE fuente_version (
    id                      BIGSERIAL PRIMARY KEY,

    fuente_id               BIGINT NOT NULL,

    version                 VARCHAR(20) NOT NULL,

    nombre                  VARCHAR(300) NOT NULL,

    autores                 VARCHAR(250),

    fecha_fuente            DATE,

    fecha_plantilla         DATE NOT NULL,

    autor_plantilla_codigo  VARCHAR(20),

    estado                  VARCHAR(50),

    comentario              TEXT,

    es_actual               BOOLEAN NOT NULL DEFAULT FALSE,

    fecha_registro          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_fuente_version_fuente
        FOREIGN KEY (fuente_id)
        REFERENCES fuente(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_fuente_version
        UNIQUE (fuente_id, version)
);


-- ============================================================
-- 9. GARANTIZAR UNA SOLA VERSIÓN ACTUAL DE LA FUENTE
-- ============================================================

CREATE UNIQUE INDEX uq_una_version_actual_fuente
ON fuente_version (fuente_id)
WHERE es_actual = TRUE;



-- ============================================================
-- 10. ARTEFACTO
-- ============================================================
-- Representa la identidad del artefacto.
--
-- Ejemplos:
--
-- RNF-0001
-- EDU-0001
-- ILA-0001
-- ESP-0001
--
-- Las versiones se almacenan en artefacto_version.
-- ============================================================

CREATE TABLE artefacto (
    id              BIGSERIAL PRIMARY KEY,

    codigo          VARCHAR(30) NOT NULL UNIQUE,

    tipo            VARCHAR(20) NOT NULL,

    fecha_creacion  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_artefacto_tipo
        CHECK (
            tipo IN (
                'RNF',
                'EDUCCION',
                'ILACION',
                'ESPECIFICACION'
            )
        )
);


-- ============================================================
-- 11. VERSIONES DE LOS ARTEFACTOS
-- ============================================================
-- Aquí se conserva TODO el historial.
--
-- Ejemplo:
--
-- RNF-0001
--   ├── v1.0.0
--   ├── v1.0.1
--   └── v1.0.2
--
-- Nunca se debe sobrescribir una versión anterior.
-- ============================================================

CREATE TABLE artefacto_version (
    id                  BIGSERIAL PRIMARY KEY,

    artefacto_id        BIGINT NOT NULL,

    version             VARCHAR(20) NOT NULL,

    nombre              VARCHAR(250) NOT NULL,

    fecha               DATE NOT NULL,

    importancia         VARCHAR(50),

    estado              VARCHAR(50),

    comentario          TEXT,

    actor_id            BIGINT,

    experto_id          BIGINT,

    es_actual           BOOLEAN NOT NULL DEFAULT FALSE,

    fecha_registro      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_version_artefacto
        FOREIGN KEY (artefacto_id)
        REFERENCES artefacto(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_version_actor
        FOREIGN KEY (actor_id)
        REFERENCES actor(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_version_experto
        FOREIGN KEY (experto_id)
        REFERENCES experto(id)
        ON DELETE SET NULL,

    CONSTRAINT uq_artefacto_version
        UNIQUE (
            artefacto_id,
            version
        )
);


-- ============================================================
-- 12. GARANTIZAR UNA SOLA VERSIÓN ACTUAL DEL ARTEFACTO
-- ============================================================

CREATE UNIQUE INDEX uq_una_version_actual
ON artefacto_version (artefacto_id)
WHERE es_actual = TRUE;


-- ============================================================
-- 13. AUTORES DE CADA VERSIÓN DE ARTEFACTO
-- ============================================================
-- Una versión puede tener uno o varios autores.
--
-- Ejemplo:
--
-- EDU-0001 v1.0.2
--   ├── AUT-0006
--   └── AUT-0001
-- ============================================================

CREATE TABLE artefacto_version_autor (
    artefacto_version_id    BIGINT NOT NULL,

    autor_id                BIGINT NOT NULL,

    PRIMARY KEY (
        artefacto_version_id,
        autor_id
    ),

    CONSTRAINT fk_version_autor_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_version_autor_autor
        FOREIGN KEY (autor_id)
        REFERENCES autor(id)
        ON DELETE RESTRICT
);


-- ============================================================
-- 14. FUENTES DE CADA VERSIÓN
-- ============================================================
-- Una versión puede tener varias fuentes.
--
-- Ejemplo:
--
-- FUE-0004
-- ENT-0001
-- ============================================================

CREATE TABLE artefacto_version_fuente (
    artefacto_version_id    BIGINT NOT NULL,

    fuente_id               BIGINT NOT NULL,

    PRIMARY KEY (
        artefacto_version_id,
        fuente_id
    ),

    CONSTRAINT fk_version_fuente_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_version_fuente_fuente
        FOREIGN KEY (fuente_id)
        REFERENCES fuente(id)
        ON DELETE RESTRICT
);


-- ============================================================
-- 15. REQUERIMIENTOS NO FUNCIONALES (RNF)
-- ============================================================

CREATE TABLE rnf_version (
    artefacto_version_id    BIGINT PRIMARY KEY,

    atributo_calidad        VARCHAR(100) NOT NULL,

    descripcion             TEXT NOT NULL,

    CONSTRAINT fk_rnf_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE
);


-- ============================================================
-- 16. EDUCCIÓN
-- ============================================================

CREATE TABLE educcion_version (
    artefacto_version_id    BIGINT PRIMARY KEY,

    codigo_ilacion          VARCHAR(30),

    descripcion             TEXT NOT NULL,

    CONSTRAINT fk_educcion_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE
);


-- ============================================================
-- 17. ILACIÓN
-- ============================================================

CREATE TABLE ilacion_version (
    artefacto_version_id        BIGINT PRIMARY KEY,

    codigo_educcion              VARCHAR(30),

    codigo_especificacion        VARCHAR(30),

    precondicion                 TEXT,

    procedimiento                TEXT,

    postcondicion                TEXT,

    CONSTRAINT fk_ilacion_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE
);


-- ============================================================
-- 18. ESPECIFICACIÓN
-- ============================================================

CREATE TABLE especificacion_version (
    artefacto_version_id        BIGINT PRIMARY KEY,

    codigo_ilacion               VARCHAR(30),

    precondicion                 TEXT,

    procedimiento                TEXT,

    postcondicion                TEXT,

    CONSTRAINT fk_especificacion_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE
);


-- ============================================================
-- 19. TRAZABILIDAD
-- ============================================================
-- Relaciona VERSIONES de artefactos.
--
-- Ejemplo:
--
-- EDU-0001 v1.0.2
--       ↓
-- ILA-0001 v1.0.2
--       ↓
-- ESP-0001 v1.0.0
--
-- Esto permite reconstruir el estado histórico.
-- ============================================================

CREATE TABLE trazabilidad (
    id                      BIGSERIAL PRIMARY KEY,

    origen_version_id       BIGINT NOT NULL,

    destino_version_id      BIGINT NOT NULL,

    tipo_relacion            VARCHAR(50) NOT NULL,

    justificacion            TEXT,

    fecha                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_trazabilidad_origen
        FOREIGN KEY (origen_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_trazabilidad_destino
        FOREIGN KEY (destino_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_no_auto_trazabilidad
        CHECK (
            origen_version_id <> destino_version_id
        ),

    CONSTRAINT uq_trazabilidad
        UNIQUE (
            origen_version_id,
            destino_version_id,
            tipo_relacion
        )
);


-- ============================================================
-- 20. ARTEFACTOS ASOCIADOS
-- ============================================================
-- Ejemplos:
--
-- SDB-01
-- BTN-09
-- INT-01
-- INP-01
-- ============================================================

CREATE TABLE artefacto_asociado (
    id                  BIGSERIAL PRIMARY KEY,

    codigo              VARCHAR(50) NOT NULL UNIQUE,

    tipo                VARCHAR(50),

    nombre              VARCHAR(200),

    descripcion         TEXT
);


-- ============================================================
-- 21. RELACIÓN CON ARTEFACTOS ASOCIADOS
-- ============================================================

CREATE TABLE artefacto_version_artefacto_asociado (
    artefacto_version_id        BIGINT NOT NULL,

    artefacto_asociado_id       BIGINT NOT NULL,

    PRIMARY KEY (
        artefacto_version_id,
        artefacto_asociado_id
    ),

    CONSTRAINT fk_version_asociado_version
        FOREIGN KEY (artefacto_version_id)
        REFERENCES artefacto_version(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_version_asociado_artefacto
        FOREIGN KEY (artefacto_asociado_id)
        REFERENCES artefacto_asociado(id)
        ON DELETE RESTRICT
);


-- ============================================================
-- 22. ÍNDICES
-- ============================================================

CREATE INDEX idx_artefacto_tipo
ON artefacto(tipo);


CREATE INDEX idx_version_artefacto
ON artefacto_version(artefacto_id);


CREATE INDEX idx_version_fecha
ON artefacto_version(fecha);


CREATE INDEX idx_trazabilidad_origen
ON trazabilidad(origen_version_id);


CREATE INDEX idx_trazabilidad_destino
ON trazabilidad(destino_version_id);


CREATE INDEX idx_autor_version_autor
ON autor_version(autor_id);


CREATE INDEX idx_autor_version_fecha
ON autor_version(fecha);


CREATE INDEX idx_fuente_version_fuente
ON fuente_version(fuente_id);


CREATE INDEX idx_fuente_version_fecha
ON fuente_version(fecha_plantilla);


-- ============================================================
-- FIN DEL ESQUEMA
-- ============================================================
