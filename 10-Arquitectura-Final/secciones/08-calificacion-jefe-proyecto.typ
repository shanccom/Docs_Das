= Tabla resumen de la calificación obtenida por el jefe de proyecto

Insertar la tabla con las calificaciones del jefe de proyecto desde el punto de vista de los integrantes.

#table(
  columns: (1fr, 3.5cm, 2.5cm, 2.5cm),
  align: (left + horizon, left + horizon, center + horizon, center + horizon),
  table.header(
    [*Integrante Evaluador*], [*Criterio Evaluado*], [*Apreciación*], [*Calificación*]
  ),
  [Integrante 1], [Liderazgo y gestión], [Excelente], [20],
  [Integrante 2], [Comunicación y apoyo], [Excelente], [20],
)
