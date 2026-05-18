-- PUNTO 6
-- Mostrar pacientes que viven en Buenos Aires

SELECT nombre, calle, numero, ciudad
FROM Pacientes
WHERE ciudad = 'Buenos Aires';
