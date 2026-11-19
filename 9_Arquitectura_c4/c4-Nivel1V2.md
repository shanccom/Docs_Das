# Diagrama C4 — Nivel 1: Contexto del Sistema OMVITAL

**OMVITAL** (gestión clínica y administrativa de rehabilitación física multi-sede) se representa como una **caja negra**: solo se muestran las personas que lo usan y los sistemas externos con los que se integra. La arquitectura interna (MVC + Hexagonal, monolito modular) se detalla en los Niveles 2 y 3.

## 1. Alcance

* **Muestra:** 4 actores internos, 1 actor externo (Paciente), el sistema OMVITAL y 4 sistemas externos.
* **No muestra:** dispositivos, API, WebSockets, Celery, base de datos ni protocolos internos (pertenecen al Nivel 2).
* **Códigos de actores:** tomados del catálogo de la BD (`ACT-0001..0004`) y deben ser idénticos en los tres niveles.
* **Firma digital:** se nombra siempre **Firma Perú (RENIEC PKI)**.

## 2. Diagrama

```mermaid
---
title: "C4 Nivel 1 — Contexto del Sistema OMVITAL"
config:
  flowchart:
    curve: linear
    nodeSpacing: 40
    rankSpacing: 80
---
flowchart LR
    classDef persona fill:#08427B,stroke:#052E56,color:#FFF,rx:8,ry:8
    classDef sistema fill:#1168BD,stroke:#0B4884,stroke-width:2px,color:#FFF,rx:6,ry:6
    classDef ext fill:#6B7280,stroke:#4B5563,color:#FFF,rx:6,ry:6

    ACT1["<b>Fisioterapeuta</b><br/><i>[Persona: ACT-0001]</i><br/>Atención clínica y firma de sesiones"]:::persona
    ACT2["<b>Coordinador</b><br/><i>[Persona: ACT-0002]</i><br/>Coordinación de boxes y sedes"]:::persona
    ACT3["<b>Recepcionista</b><br/><i>[Persona: ACT-0003]</i><br/>Admisión, agenda, caja y asistencia"]:::persona
    ACT4["<b>Gerente</b><br/><i>[Persona: ACT-0004]</i><br/>Supervisión y auditoría multi-sede"]:::persona

    OMV["<b>OMVITAL</b><br/><i>[Sistema de Software]</i><br/>Gestión clínica y administrativa<br/>de rehabilitación física multi-sede"]:::sistema

    EXT1["<b>Pasarela Financiera</b><br/><i>[S-EXT-01 | Sistema externo]</i><br/>Validación de cobros"]:::ext
    EXT2["<b>AWS S3</b><br/><i>[S-EXT-02 | Sistema externo]</i><br/>Custodia de documentos clínicos"]:::ext
    EXT3["<b>WhatsApp (Meta Cloud API)</b><br/><i>[S-EXT-03 | Sistema externo]</i><br/>Recordatorios y constancias"]:::ext
    EXT4["<b>Firma Perú (RENIEC PKI)</b><br/><i>[S-EXT-04 | Sistema externo]</i><br/>Certificación de consentimientos"]:::ext

    PAC["<b>Paciente de Rehabilitación</b><br/><i>[Persona externa]</i><br/>Recibe recordatorios y constancias"]:::persona

    ACT1 -->|"Registra atención y firma sesiones"| OMV
    ACT2 -->|"Coordina boxes y sedes"| OMV
    ACT3 -->|"Admite, agenda y cobra"| OMV
    ACT4 -->|"Supervisa y audita"| OMV

    OMV -->|"Valida cobros<br/>[HTTPS, ≤ 3 s]"| EXT1
    OMV -->|"Almacena documentos<br/>[HTTPS]"| EXT2
    OMV -->|"Envía mensajes<br/>[HTTPS]"| EXT3
    OMV -->|"Certifica consentimientos<br/>[HTTPS / PKI]"| EXT4
    EXT3 -->|"Notifica<br/>[Móvil]"| PAC
```

## 3. Actores, sistemas externos y trazabilidad

| Código | Elemento | Responsabilidad en el contexto | EDU / ILA |
| :--- | :--- | :--- | :--- |
| `ACT-0001` | Fisioterapeuta | Atención clínica, evolución, plantillas y firma de sesiones. | `EDU-0006`, `0025`, `0031` · `ILA-0011..0018`, `0022..0025` |
| `ACT-0002` | Coordinador | Coordinación de boxes, camillas y sedes. *(confirmar contra catálogo)* | `EDU-0026`, `0027` · `ILA-0019` |
| `ACT-0003` | Recepcionista | Admisión, agenda, cobros, asistencia y monitoreo de turnos. | `EDU-0001`, `0002`, `0029`, `0032` · `ILA-0001..0008`, `0020..0021`, `0026` |
| `ACT-0004` | Gerente | Supervisión, auditoría y control de acceso (RBAC) multi-sede. | `EDU-0033` · `ILA-0027` |
| — | Paciente | Recibe recordatorios y constancias por móvil. *(sin código `ACT-` en la BD)* | `EDU-0005` · `ILA-0009..0010` |
| `S-EXT-01` | Pasarela Financiera | Validación bancaria de cobros (timeout ≤ 3 s). | `EDU-0002` · `ILA-0006..0008` |
| `S-EXT-02` | AWS S3 | Custodia de historias, plantillas y PDFs. | `EDU-0031` |
| `S-EXT-03` | WhatsApp (Meta Cloud API) | Recordatorios de citas y constancias. | `EDU-0005` |
| `S-EXT-04` | Firma Perú (RENIEC PKI) | Validez legal de consentimientos informados. | `EDU-0025` · `ILA-0015..0018` |

**Educciones activas (11 de 33):** `0001`, `0002`, `0005`, `0006`, `0025`, `0026`, `0027`, `0029`, `0031`, `0032`, `0033`.

**Requisitos no funcionales:** no se representan en el Nivel 1. Se documentan en los Niveles 2 y 3 usando solo los códigos existentes en el catálogo (`RNF-0001..0009` y `RNF-0011..0015`).

## 4. Fuera de alcance (22 de 33 EDU y 1 RNF)

| Elementos | Motivo |
| :--- | :--- |
| `EDU-0003`, `EDU-0004` | Depuradas en refinamiento *(definir motivo oficial)*. |
| `EDU-0007..0024` (18) | Módulos legacy (compras, proveeduría, inventario) ajenos al núcleo de rehabilitación. |
| `EDU-0028`, `EDU-0030` | Absorbidas por `EDU-0006` y `EDU-0002`. |
| `RNF-0010` | Excluido por obsolescencia tecnológica (compatibilidad con Internet Explorer 11). |

> El motivo de cada elemento debe ser idéntico en los Niveles 1, 2 y 3.

## 5. Pendientes de confirmación

1. Rol exacto de `ACT-0002` Coordinador y código del Paciente en el catálogo.
2. Motivos oficiales de depuración de `EDU-0003`, `0004`, `0028`, `0030` y `RNF-0010`.
3. Si el control de asistencia (`EDU-0029`) usa un reloj biométrico: de ser así, agregarlo como sistema externo en este nivel.
4. Confirmar que la pasarela financiera está respaldada por tus requisitos (el grupo de referencia usó pagos manuales).
5. Formalizar la convención `RSK-01..06` en los Niveles 2 y 3.