-- PUNTO 16
-- Última consulta de cada paciente y su diagnóstico

SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE (c.id_paciente, c.fecha) IN (
    SELECT id_paciente, MAX(fecha)
    FROM Consultas
    GROUP BY id_paciente
)
ORDER BY p.nombre;
