-- PUNTO 4
-- Actualizar dirección de Luciana Gómez

UPDATE Pacientes
SET calle = 'Calle Corrientes',
    numero = '500',
    ciudad = 'Buenos Aires'
WHERE nombre = 'Luciana Gómez';
