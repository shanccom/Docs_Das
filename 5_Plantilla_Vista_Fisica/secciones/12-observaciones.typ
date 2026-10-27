= Observaciones

- *Valor de RNF-0002 adoptado:* en el encabezado del archivo `10-descripcion-artefacto.typ` se registra un comentario pendiente de resolución sobre el tiempo de respuesta de la búsqueda por DNI; en esta vista física se utiliza el valor «menor a 3 segundos» (variable `#rnf2`). Este valor debe confirmarse con el equipo antes de publicar el documento, ya que condiciona el dimensionamiento del servicio de caché (B4) y de los índices de la base de datos (B3).

- *Puertos referenciales sin confirmar:* la tabla de comunicación entre nodos (sección «Comunicación entre nodos y acceso a la base de datos») indica explícitamente que los puertos son referenciales y deben confirmarse al desplegar la infraestructura. En particular, el puerto TCP 5432 expuesto directamente desde los contenedores de aplicación hacia PostgreSQL debe validarse contra la política de seguridad de red del proveedor de nube elegido.

- *Dependencia de conectividad sin modo degradado:* el diseño propuesto contempla un enlace de Internet secundario (A3) como contingencia ante la caída del proveedor principal, pero no se especifica el comportamiento de la aplicación en ausencia total de conectividad. No se define un modo degradado u offline para el check-in ni para la validación financiera síncrona contra la API Financiera (S-EXT-01).

- *Costos no incluidos:* el documento no incorpora cotizaciones ni estimaciones de presupuesto para los dispositivos físicos por sucursal (A1–A3) ni para los componentes de infraestructura en la nube (B1–B7). Los valores de dimensionamiento (tres sucursales, picos de más de 25 peticiones por segundo, más de 10 000 expedientes) son supuestos referenciales que deben validarse con pruebas de carga antes de definir el tamaño y costo de los nodos contratados.
