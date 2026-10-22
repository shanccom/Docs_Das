#pagebreak(weak: true)

= Anexos

== DIA-FLU-0001: Diagrama de Flujo de Procesos (Visión General de Ilaciones)

Este diagrama muestra el flujo general del paciente a través de las tres ilaciones principales del sistema OmVital Physio Control, integrando desde la llegada a recepción hasta el cierre de la atención médica:

#pagebreak(weak: true)

#figure(
  image("../imagenes/diagramas/diagrama-procesos-macro-anexo.png", width: 100%),
  kind: image,
  supplement: [Figura],
  caption: [_DIA-FLU-0001_: Diagrama de flujo de procesos. Visión general de las ilaciones ILA-0020, ILA-0019 e ILA-0017.],
)

#pagebreak(weak: true)

=== Descripción del flujo unificado:

1. *Admisión y Control de Asistencia (`ILA-0020`):*
   La recepcionista registra la llegada del paciente ingresando su DNI. El sistema verifica que cuente con saldo de sesiones ($t <= 3$ s), descuenta la sesión en la base de datos y cambia el estado de la cita a «En Sala». Al completarse, envía la señal para la asignación de camilla.

2. *Organización y Sincronización de Camillas (`ILA-0019`):*
   El sistema asigna una camilla libre y actualiza su estado a «Ocupada». Este cambio se difunde por WebSocket en menos de 1 segundo a las pantallas de recepción y a la tableta del fisioterapeuta en consultorio, habilitando el inicio de la sesión.

3. *Atención Terapéutica y Cierre Clínico (`ILA-0017`):*
   El fisioterapeuta registra la evolución clínica (notas SOAP) y captura la firma digital del paciente. Al guardar, la tableta se libera para el siguiente turno ($t <= 500$ ms), la camilla pasa a estado «En Desinfección» y el sistema genera en segundo plano la constancia en PDF, guardándola en la nube y notificando al paciente por WhatsApp.


