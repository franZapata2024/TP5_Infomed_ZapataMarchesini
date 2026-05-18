-- PUNTO 19
-- Total de pacientes distintos atendidos por cada médico

SELECT 
    m.nombre AS medico,
    COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
GROUP BY m.nombre
ORDER BY total_pacientes DESC;
