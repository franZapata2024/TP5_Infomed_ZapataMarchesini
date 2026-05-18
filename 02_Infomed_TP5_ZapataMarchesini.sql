-- PUNTO 2
-- Crear una vista para calcular la edad dinámicamente

CREATE VIEW VistaPacientesEdad AS
SELECT
    id_paciente,
    nombre,
    fecha_nacimiento,
    EXTRACT(YEAR FROM CURRENT_DATE) 
    - EXTRACT(YEAR FROM fecha_nacimiento)
    - CASE 
        WHEN EXTRACT(MONTH FROM CURRENT_DATE) < EXTRACT(MONTH FROM fecha_nacimiento)
        OR (EXTRACT(MONTH FROM CURRENT_DATE) = EXTRACT(MONTH FROM fecha_nacimiento)
        AND EXTRACT(DAY FROM CURRENT_DATE) < EXTRACT(DAY FROM fecha_nacimiento))
        THEN 1 ELSE 0
      END AS edad
FROM Pacientes;


-- Comprobación del punto 2
SELECT * FROM VistaPacientesEdad;
