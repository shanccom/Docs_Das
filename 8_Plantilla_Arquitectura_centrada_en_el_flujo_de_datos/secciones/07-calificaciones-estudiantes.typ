= Tabla resumen de las calificaciones de los estudiantes

Insertar la tabla resumen donde de muestre la calificación del estudiante según la apreciación del jefe de proyecto.

#table(
  columns: (1fr, 3cm, 2.5cm, 2.5cm),
  align: (left + horizon, center + horizon, center + horizon, center + horizon),
  table.header(
    [*Estudiante*], [*Rol / Tarea*], [*Apreciación*], [*Calificación*]
  ),
  [Estudiante 1], [Desarrollador], [Excelente], [20],
  [Estudiante 2], [Analista], [Excelente], [20],
)
