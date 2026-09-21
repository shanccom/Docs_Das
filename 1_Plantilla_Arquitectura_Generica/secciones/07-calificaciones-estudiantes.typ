= Tabla resumen de las calificaciones de los estudiantes

Insertar la tabla resumen donde de muestre la calificación del estudiante según la apreciación del jefe de proyecto.

#table(
  columns: (1fr, 3cm, 2.5cm, 2.5cm),
  align: (left + horizon, center + horizon, center + horizon, center + horizon),
  table.header(
    [*Estudiante*], [*Rol / Tarea*], [*Apreciación*], [*Calificación*]
  ),
  [Hancco Mullisaca Sergio Danilo], [Líder de Proyecto], [Excelente], [20],
  [Barrios Medina Mathias Alonso], [Arquitecto de Software], [Excelente], [20],
  [Boza Portilla Yordano Hernan], [Diseñador de Sistemas], [Excelente], [20],
  [Cuno Salazar Eduardo Joel], [Analista de Requisitos], [Excelente], [20],
  [Huacani Jara Denise Andrea], [Ingeniero de Calidad (QA)], [Excelente], [20],
  [Mollo Chuquicaña Dolly Yadhira], [DevOps Engineer], [Excelente], [20],
  [Nina Calizaya Rafael Diego], [Desarrollador Backend], [Excelente], [20],
  [Pacheco Palo, Fabiana Francinet], [Desarrollador Frontend], [Excelente], [20],
  [Quispe Madariaga Jeferson Jofre], [Administrador de Bases de Datos], [Excelente], [20],
  [Suclle Suca Michael Benjamin], [Especialista en Seguridad], [Excelente], [20],
)