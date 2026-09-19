# DAS - Plantillas de Arquitectura (Typst)

Manual rápido para compilar los PDF de las plantillas.

## Requisitos

**Windows**:

```bash
winget install Typst.Typst
```

**Linux** (Debian/Ubuntu):

```bash
sudo apt install typst
```

Verificar la instalación:

```bash
typst --version
```

## Compilar

Cada carpeta `N_Nombre_de_plantilla` contiene un archivo `main.typ`. Para generar el PDF:

```bash
cd 1_Plantilla_Arquitectura_Generica
typst compile main
```

El PDF resultante se llama `main.pdf`, dentro de la misma carpeta.

## Compilar y ver en tiempo real

Cada vez que guardes cambios, el PDF se regenera solo:

```bash
cd 1_Plantilla_Arquitectura_Generica
typst watch main
```

Cierra con `Ctrl + C`.

## Base de datos (`database/`)

Base de datos PostgreSQL con los datos del proyecto. Actualmente tiene **autores**, **expertos**, **actores**, **fuentes**, **artefactos**, **RNF** y **educiones**, y un script para probar la conexión (`scripts/test_db.py`).

Pendiente: implementar **ilaciones** y **especificaciones** (tablas definidas en el esquema, sin datos ni interfaz).

## Lista de plantillas

| Carpeta | Plantilla |
| --- | --- |
| `1_Plantilla_Arquitectura_Generica` | Arquitectura genérica |
| `2_Plantilla_Diagrama_Comportamiento` | Diagrama de comportamiento |
| `3_Plantilla_Vista_Logica` | Vista lógica |
| `4_Plantilla_Vista_Procesos` | Vista de procesos |
| `5_Plantilla_Vista_Fisica` | Vista física |
| `6_Plantilla_Arquitectura_centrada_en_datos` | Arquitectura centrada en datos |
| `7_Plantilla_GUIS` | Interfaces gráficas de usuario |
| `8_Plantilla_Arquitectura_centrada_en_el_flujo_de_datos` | Arquitectura centrada en flujo de datos |