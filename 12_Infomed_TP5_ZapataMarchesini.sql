-- PUNTO 12
-- Mostrar paciente, fecha y diagnóstico de consultas de agosto de 2024

SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE c.fecha BETWEEN '2024-08-01' AND '2024-08-31';
