<img width="571" height="197" alt="image" src="https://github.com/user-attachments/assets/a6bc99be-3fb5-4874-aaaf-243185db28b6" /># TP5 - Base de Datos

## Integrantes
- Franco Zapata
- Marchesini

## Parte 1 - Modelo de datos

### Diagrama Entidad-Relación

(ACA PEGÁS LA IMAGEN)

## Parte 2 - Consultas SQL

## Consigna 1
  
  ``sql
  CREATE INDEX idx_pacientes_ciudad
  ON Pacientes(ciudad);
  
  Se crea un índice sobre la columna ciudad para optimizar las búsquedas.

  <img width="575" height="200" alt="image" src="https://github.com/user-attachments/assets/0a8559b5-8ae1-4fc6-91a9-81acc5a0d6bb" />


## Consigna 2

``sql
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

Se crea una vista que calcula la edad de cada paciente dinámicamente.

<img width="577" height="200" alt="image" src="https://github.com/user-attachments/assets/e834694d-9d63-49cc-a9ed-1104260c9028" />

## Consigna 3

``sql
SELECT nombre, edad
FROM VistaPacientesEdad
WHERE edad < 18;

Se consulta la vista VistaPacientesEdad para obtener los pacientes menores de 18 años.
La condición WHERE edad < 18 filtra únicamente a los menores.

<img width="578" height="191" alt="image" src="https://github.com/user-attachments/assets/ba161d0a-f070-43f1-affa-398d92ce991c" />

## Consigna 4

``sql
UPDATE Pacientes
SET calle = 'Calle Corrientes',
    numero = '500',
    ciudad = 'Buenos Aires'
WHERE nombre = 'Luciana Gómez';




