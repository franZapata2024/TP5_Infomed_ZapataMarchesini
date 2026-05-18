-- PUNTO 11
-- Consultas del médico ID 3 durante agosto de 2024

SELECT *
FROM Consultas
WHERE id_medico = 3
AND fecha BETWEEN '2024-08-01' AND '2024-08-31';
