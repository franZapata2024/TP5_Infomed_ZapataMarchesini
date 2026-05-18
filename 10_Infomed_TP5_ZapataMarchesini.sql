-- PUNTO 10
-- Contar recetas emitidas por cada médico

SELECT id_medico, COUNT(*) AS cantidad_recetas
FROM Recetas
GROUP BY id_medico
ORDER BY id_medico;
