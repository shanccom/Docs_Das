# Diagrama C4 — Nivel 1: Contexto del Sistema

Vista de máximo nivel del **Sistema Integral de Pacientes, asistencias y citas*, mostrando quiénes operan la plataforma y con qué dispositivos externos interactúa, conforme a clean Arquiteture, Diagrama C4, y Arquitectura Hibrida.

```mermaid
---
title: "Diagrama C4 — Nivel 1: Contexto del Sistema"
config:
  flowchart:
    curve: linear
    nodeSpacing: 35
    rankSpacing: 55
---

flowchart TD
    %% =========================================================================
    %% COLUMNA PRINCIPAL: CAPAS 1 A 4 ALINEADAS VERTICALMENTE SIN CRUCES
    %% =========================================================================

    subgraph SUB_USUARIOS["1. Capa de Usuarios Internos del Negocio"]
        direction TB
        ACT_GER["<b>Gerente General</b><br/><i>[ACT-0001 | Rol Directivo]</i><br/>Supervisión y control de sedes<br/><b>[EDU-0033 | ILA-0027]</b>"]
        ACT_REC["<b>Recepcionista</b><br/><i>[ACT-0002 | Operador Admisión]</i><br/>Admisión, agenda y caja<br/><b>[EDU-0001, 0032 | ILA-0001..05]</b>"]
        ACT_FIS["<b>Fisioterapeuta</b><br/><i>[ACT-0003 | Personal Box]</i><br/>Atención y evolución clínica<br/><b>[EDU-0006, 0025 | ILA-0011..18]</b>"]
    end

    subgraph SUB_SEDE["2. Frontera de Red Local Clínica (LAN Sede)"]
        direction TB
        DEV_PC["<b>PC Recepción y Admin</b><br/><i>[SPA Navegador HTTPS]</i><br/>Agenda, caja y monitoreo<br/><b>[EDU-0001, 0032 | RNF-0017]</b>"]
        BUF_BIO[("<b>Buffer Local Offline</b><br/><i>[SQLite Integrado]</i><br/>Capacidad: 100k marcas<br/><b>[RNF-0012]</b>")]
        DEV_TAB["<b>Tablet Móvil Box</b><br/><i>[App Kotlin / Android]</i><br/>Evolución y plantillas en camilla<br/><b>[EDU-0006, 0031 | RNF-0016]</b>"]
    end

    subgraph SUB_VPS["3. Frontera del Sistema Central: VPS Autoalojado (Linux + Docker)"]
        direction TB
        SYS_API["<b>OMVITAL API Gateway</b><br/><i>[FastAPI / Python Docker]</i><br/>Orquestación, RBAC y multi-sede<br/><b>[EDU-0027, 0033 | RNF-0015]</b>"]
        SYS_WRK["<b>Worker Asíncrono</b><br/><i>[Celery / Python]</i><br/>Colas y generación de PDFs<br/><b>[EDU-0005, 0025 | RNF-0007]</b>"]
        SYS_WS["<b>Motor Tiempo Real</b><br/><i>[Python WebSockets]</i><br/>Sincronización de camillas/turnos<br/><b>[EDU-0026, 0032 | RNF-0006]</b>"]
        BD_PG[("<b>OMVITAL_DB</b><br/><i>[PostgreSQL 15 ACID]</i><br/>Persistencia clínica y auditoría<br/><b>[RNF-0001, RNF-0002, RNF-0018]</b>")]
    end

    subgraph SUB_EXT["4. Frontera de Servicios Externos y Actor Externo"]
        direction TB
        EXT_FIN["<b>S-EXT-01: Pasarela Financiera</b><br/><i>[API REST / HTTPS]</i><br/>Validación de cobros<br/><b>[EDU-0002 | ILA-0006..08]</b>"]
        EXT_FIRMA["<b>S-EXT-04: Firma Digital</b><br/><i>[PKI REST / HTTPS]</i><br/>Certificación legal<br/><b>[EDU-0025 | RNF-0003]</b>"]
        EXT_S3["<b>S-EXT-02: AWS S3 Storage</b><br/><i>[Cloud Object / HTTPS]</i><br/>Custodia de PDFs e historias<br/><b>[EDU-0031 | RNF-0001]</b>"]
        EXT_WSP["<b>S-EXT-03: Gateway WhatsApp</b><br/><i>[Meta Graph API / HTTPS]</i><br/>Despacho de recordatorios<br/><b>[EDU-0005 | ILA-0009..10]</b>"]
        ACT_PAC["<b>Paciente Rehabilitación</b><br/><i>[ACT-0004 | Actor Externo]</i><br/>Recepción de citas y alertas<br/><b>[EDU-0005 | ILA-0009..10]</b>"]
    end

    %% =========================================================================
    %% LEYENDA INFERIOR: LETRA MÍNIMA TIPO NOTA AL PIE DE DIAGRAMA
    %% =========================================================================

    subgraph SUB_AUDITORIA["Leyenda de Trazabilidad (C1)"]
        direction LR
        LEG_ACT["<small><small><b>[✓] EDU Activas (11/33):</b> Caja: EDU-0001, 0002, 0032 | Box: EDU-0006, 0025, 0031 | Red: EDU-0005, 0026, 0027, 0029, 0033 | ILA: 0001..0027</small></small>"]
        LEG_RNF["<small><small><b>[⚙] RNF Aplicados (10):</b> Seg/BD: RNF-0001..03, 0015, 0018 | Red/App: RNF-0006, 0007, 0012, 0016, 0017</small></small>"]
        LEG_DEP["<small><small><b>[✕] Depuradas (22/33):</b> Refinadas: EDU-0003, 0004, 0028, 0030 | Legacy: EDU-0007..0024 (18 mód.) | RNF Excluido: RNF-0010</small></small>"]
    end

    %% =========================================================================
    %% RELACIONES ORDENADAS DE IZQUIERDA A DERECHA PARA CERO CRUCES
    %% =========================================================================

    %% CAPA 1 -> CAPA 2
    ACT_GER -->|"HTTPS [EDU-0033]"| DEV_PC
    ACT_REC -->|"HTTPS / Admisión [EDU-0001]"| DEV_PC
    ACT_FIS -->|"Touch / Clínica [EDU-0006]"| DEV_TAB

    %% CAPA 2 -> CAPA 3 (Rutas directas hacia API Gateway y WebSockets)
    DEV_PC -->|"HTTPS + JWT [EDU-0001, 0002]"| SYS_API
    BUF_BIO -->|"TLS / Sync Lotes [EDU-0029]"| SYS_API
    DEV_TAB -->|"HTTPS + JWT [EDU-0006, 0025]"| SYS_API
    DEV_PC -->|"WSS / Monitoreo [EDU-0032]"| SYS_WS
    DEV_TAB -->|"WSS / Estado Box [EDU-0026]"| SYS_WS

    %% INTERACCIONES INTERNAS CAPA 3
    SYS_API -->|"IPC / Cola Tareas [RNF-0007]"| SYS_WRK
    SYS_API -->|"TCP / Pool ACID [RNF-0001]"| BD_PG
    SYS_WRK -->|"TCP / Logs y Lectura [RNF-0002]"| BD_PG
    SYS_WS -->|"TCP / Pub-Sub [RNF-0006]"| BD_PG

    %% CAPA 3 -> CAPA 4 Y PACIENTE (Abanico limpio inferior)
    SYS_API -->|"HTTPS <= 3s [EDU-0002]"| EXT_FIN
    SYS_API -->|"HTTPS / PKI [EDU-0025]"| EXT_FIRMA
    SYS_WRK -->|"HTTPS / PutObject [EDU-0031]"| EXT_S3
    SYS_WRK -->|"HTTPS / Webhook [EDU-0005]"| EXT_WSP
    EXT_WSP -->|"Notificación Móvil [ILA-0009..10]"| ACT_PAC

    %% ANCLAJE INVISIBLE PARA FORZAR LA LEYENDA ABAJO DEL TODO
    EXT_FIN ~~~ LEG_ACT
    EXT_FIRMA ~~~ LEG_RNF
    EXT_S3 ~~~ LEG_DEP
    ACT_PAC ~~~ LEG_DEP

    %% =========================================================================
    %% ESTILOS VISUALES COMPLETOS
    %% =========================================================================

    %% Contenedores Principales
    style SUB_USUARIOS fill:#F8FAFC,stroke:#334155,stroke-width:1.5px,color:#0F172A
    style SUB_SEDE fill:#F0F7FF,stroke:#1E40AF,stroke-width:1.5px,color:#0F172A
    style SUB_VPS fill:#EEF2FF,stroke:#3730A3,stroke-width:2px,color:#0F172A
    style SUB_EXT fill:#F9FAFB,stroke:#4B5563,stroke-width:1.5px,color:#0F172A
    style SUB_AUDITORIA fill:#FFFFFF,stroke:#CBD5E1,stroke-width:1px,stroke-dasharray: 2 2,color:#64748B,font-size:10px

    %% Actores
    style ACT_GER fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT_REC fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT_FIS fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000
    style ACT_PAC fill:#DBEAFE,stroke:#1E3A8A,stroke-width:1.5px,color:#000000

    %% Equipos de Sede
    style BUF_BIO fill:#7DD3FC,stroke:#0369A1,stroke-width:1.5px,color:#000000
    style DEV_PC fill:#BAE6FD,stroke:#0369A1,stroke-width:1.5px,color:#000000
    style DEV_TAB fill:#BAE6FD,stroke:#0369A1,stroke-width:1.5px,color:#000000

    %% Componentes VPS Central
    style SYS_API fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000
    style SYS_WS fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000
    style SYS_WRK fill:#C7D2FE,stroke:#312E81,stroke-width:1.5px,color:#000000
    style BD_PG fill:#A5B4FC,stroke:#312E81,stroke-width:1.5px,color:#000000

    %% Servicios Externos
    style EXT_FIN fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT_FIRMA fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT_S3 fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000
    style EXT_WSP fill:#E5E7EB,stroke:#374151,stroke-width:1.5px,color:#000000

    %% Leyenda Inferior Letra Mínima
    style LEG_ACT fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
    style LEG_RNF fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
    style LEG_DEP fill:#F8FAFC,stroke:#E2E8F0,stroke-width:0.5px,color:#475569,font-size:10px
```