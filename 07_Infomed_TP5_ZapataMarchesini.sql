-- PUNTO 7
-- Detectar y corregir inconsistencias en nombres de ciudades


-- Ver valores distintos antes de corregir
SELECT DISTINCT ciudad
FROM Pacientes;

-- Unificar variantes de Buenos Aires
UPDATE Pacientes
SET ciudad = 'Buenos Aires'
WHERE ciudad IN (
    'Bs Aires',
    'buenos aires',
    'Buenos aires',
    'Buenos   Aires',
    'Buenos Aires ',
    '  Buenos Aires',
    'Buenos Aiers'
);

-- Unificar variantes de Córdoba
UPDATE Pacientes
SET ciudad = 'Córdoba'
WHERE ciudad IN (
    'Cordoba',
    'Córodba',
    'Córdoba'
);

-- Unificar variantes de Mendoza
UPDATE Pacientes
SET ciudad = 'Mendoza'
WHERE ciudad IN (
    'Mendzoa',
    'Mendoza'
);

-- Unificar variantes de Rosario
UPDATE Pacientes
SET ciudad = 'Rosario'
WHERE ciudad IN (
    'rosario',
    'Rosario'
);
