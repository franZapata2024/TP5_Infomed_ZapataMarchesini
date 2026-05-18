-- PUNTO 8
-- Contar pacientes por ciudad

SELECT ciudad, COUNT(*) AS cantidad
FROM Pacientes
GROUP BY ciudad;
