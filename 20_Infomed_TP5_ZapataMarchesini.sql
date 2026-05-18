- PUNTO 20
-- Cantidad de consultas a menores de edad por médico
SELECT 
    m.nombre AS medico,
    COUNT(*) AS total_consultas_menores
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
JOIN VistaPacientesEdad v ON c.id_paciente = v.id_paciente
WHERE v.edad < 18
GROUP BY m.nombre
ORDER BY total_consultas_menores DESC;
