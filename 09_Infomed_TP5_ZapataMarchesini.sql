-- PUNTO 9
-- Contar pacientes por ciudad y sexo
SELECT ciudad, id_sexo, COUNT(*) AS cantidad
FROM Pacientes
GROUP BY ciudad, id_sexo
ORDER BY ciudad;
