= Observaciones

- *Inconsistencia en RNF-0002:* la Arquitectura Genérica indica un tiempo de respuesta menor a 3 segundos y el Diagrama de Comportamiento indica t ≤ 500 ms. Debe unificarse en el catálogo, porque cambia el dimensionamiento de caché y base de datos. En este documento se usa la primera.
- *Inconsistencia en el código de persistencia:* DIA-CMP-0001 usa «RNF-01» para la inmutabilidad, mientras que la Arquitectura Genérica la registra como RNF-0010. Aquí se usa RNF-0010.
- *EDU-0027 fuera del catálogo de la Arquitectura Genérica:* la ficha de D-DP-001 cita EDU-0027 (sincronización multi-sede), pero la tabla de educciones de ese documento no la incluye. Conviene incorporarla.
- *Dependencia de la conectividad (RNF-0001):* aun con enlace secundario, una caída del proveedor en la nube deja sin acceso a la información. No se define aún un modo degradado u offline para el check-in ni para la validación financiera síncrona.
- *Datos sin confirmar:* las cantidades de equipos, los equipos del fisioterapeuta, las impresoras y los puertos están marcados con [CONFIRMAR].
- *Valores referenciales:* los dimensionamientos provienen de supuestos del Diagrama de Comportamiento y deben validarse con pruebas de carga.
- *Costos:* no se incluyen cotizaciones ni presupuesto de los dispositivos y servicios propuestos.
