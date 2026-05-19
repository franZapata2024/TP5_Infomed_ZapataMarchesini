 TP5 - Base de Datos

## Integrantes
- Franco Zapata
- Marchesini

## Parte 1 - Modelo de datos

### Diagrama Entidad-Relación

(ACA PEGÁS LA IMAGEN)

## Parte 2 - Consultas SQL

## Consigna 1
  
  ```sql
  CREATE INDEX idx_pacientes_ciudad
  ON Pacientes(ciudad);
  
  Se crea un índice sobre la columna ciudad para optimizar las búsquedas.
```
  <img width="575" height="200" alt="image" src="https://github.com/user-attachments/assets/0a8559b5-8ae1-4fc6-91a9-81acc5a0d6bb" />

## Consigna 2

```sql
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
```
<img width="577" height="200" alt="image" src="https://github.com/user-attachments/assets/e834694d-9d63-49cc-a9ed-1104260c9028" />

## Consigna 3

```sql
SELECT nombre, edad
FROM VistaPacientesEdad
WHERE edad < 18;

Se consulta la vista VistaPacientesEdad para obtener los pacientes menores de 18 años.
La condición WHERE edad < 18 filtra únicamente a los menores.
```
<img width="578" height="191" alt="image" src="https://github.com/user-attachments/assets/ba161d0a-f070-43f1-affa-398d92ce991c" />

## Consigna 4

```sql
UPDATE Pacientes
SET calle = 'Calle Corrientes',
    numero = '500',
    ciudad = 'Buenos Aires'
WHERE nombre = 'Luciana Gómez';

Se actualizan los datos de dirección de la paciente "Luciana Gómez", modificando calle, número y ciudad.
```
<img width="464" height="178" alt="image" src="https://github.com/user-attachments/assets/57f01f07-2671-4dab-b0fc-bc12eca03650" />

## Consigna 5
```sql
SELECT nombre, matricula
FROM Medicos
WHERE especialidad_id = 4;

Se obtienen los nombres y matrículas de los médicos que pertenecen a la especialidad con id 4.
```
<img width="470" height="131" alt="image" src="https://github.com/user-attachments/assets/e9ad9200-ec62-483c-8eef-4206fd7f9c73" />

## Consigna 6
```sql
SELECT nombre, calle, numero, ciudad
FROM Pacientes
WHERE ciudad = 'Buenos Aires';

Se consultan los pacientes que viven en la ciudad de Buenos Aires mostrando sus datos de dirección.
```
<img width="470" height="108" alt="image" src="https://github.com/user-attachments/assets/667cdb86-9ddf-4ff3-9212-ad487ac88dad" />

## Consigna 7
```sql
SELECT DISTINCT ciudad
FROM Pacientes;

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

UPDATE Pacientes
SET ciudad = 'Córdoba'
WHERE ciudad IN (
    'Cordoba',
    'Córodba',
    'Córdoba'
);

UPDATE Pacientes
SET ciudad = 'Mendoza'
WHERE ciudad IN (
    'Mendzoa',
    'Mendoza'
);

UPDATE Pacientes
SET ciudad = 'Rosario'
WHERE ciudad IN (
    'rosario',
    'Rosario'
);

Se obtienen las distintas ciudades registradas en la tabla Pacientes, evitando repetir valores.
Se unifican distintas formas mal escritas de "Buenos Aires" en una única forma correcta.
Se corrigen distintas variantes mal escritas de "Córdoba" para mantener consistencia en los datos.
Se corrigen distintas variantes mal escritas de "Mendoza" para mantener consistencia en los datos.
Se corrigen distintas variantes mal escritas de "Rosario" para mantener consistencia en los datos.
```
<img width="474" height="194" alt="image" src="https://github.com/user-attachments/assets/dce09d8d-73f5-4395-bef8-034facfa8db3" />

## Consigna 8
```sql
SELECT ciudad, COUNT(*) AS cantidad
FROM Pacientes
GROUP BY ciudad;

Muestra los pacientes por ciudad
```
<img width="475" height="131" alt="image" src="https://github.com/user-attachments/assets/78fad61a-f15e-4fac-9591-4e7eb71f1e5f" />

## Consigna 9
```sql
SELECT ciudad, id_sexo, COUNT(*) AS cantidad
FROM Pacientes
GROUP BY ciudad, id_sexo
ORDER BY ciudad;
```
<img width="288" height="224" alt="image" src="https://github.com/user-attachments/assets/531e183b-fc02-4651-adf7-6705ff1e9861" />

## Consigna 10
```sql
SELECT id_medico, COUNT(*) AS cantidad_recetas
FROM Recetas
GROUP BY id_medico
ORDER BY id_medico;

Se obtienen las ciudades sin repetir valores utilizando DISTINCT, eliminando duplicados.
```
<img width="207" height="224" alt="image" src="https://github.com/user-attachments/assets/504f570c-c2eb-4ad6-b849-31f213bb8b08" />

## Consigna 11
```sql
SELECT *
FROM Consultas
WHERE id_medico = 3
AND fecha BETWEEN '2024-08-01' AND '2024-08-31';

Se crea una consulta que involucra relaciones entre tablas para obtener información más compleja (por ejemplo consultas realizadas por pacientes).
```
<img width="561" height="92" alt="image" src="https://github.com/user-attachments/assets/90d972e6-6cd0-40e1-b728-503d597295b0" />

## Consigna 12
```sql
SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE c.fecha BETWEEN '2024-08-01' AND '2024-08-31';

Se utiliza una subconsulta para filtrar datos en base a resultados obtenidos previamente.
```
<img width="355" height="510" alt="image" src="https://github.com/user-attachments/assets/bad726a7-1f82-4bfb-b133-701144f4fe75" />

## Consigna 13
```sql
SELECT m.nombre, COUNT(*) AS cantidad
FROM Recetas r
JOIN Medicamentos m ON r.id_medicamento = m.id_medicamento
WHERE r.id_medico = 2
GROUP BY m.nombre
HAVING COUNT(*) > 1;

Se combinan datos de varias tablas mediante JOIN para mostrar información completa de una entidad (por ejemplo paciente + médico + consulta).
```
<img width="218" height="49" alt="image" src="https://github.com/user-attachments/assets/1782ff3c-b6af-41b3-b278-fb4eccfbec12" />

## Consigna 14
```sql
SELECT p.nombre, COUNT(*) AS total_recetas
FROM Recetas r
JOIN Pacientes p ON r.id_paciente = p.id_paciente
GROUP BY p.nombre
ORDER BY total_recetas DESC;

Se aplican condiciones adicionales (WHERE, AND, OR) para restringir los resultados de la consulta
```
<img width="236" height="511" alt="image" src="https://github.com/user-attachments/assets/f0f2c6f6-b7ce-493e-8d30-02b841138315" />

## Consigna 15
```sql
SELECT m.nombre, COUNT(*) AS total_recetas
FROM Recetas r
JOIN Medicamentos m ON r.id_medicamento = m.id_medicamento
GROUP BY m.nombre
ORDER BY total_recetas DESC
LIMIT 1;

Se ordenan los resultados mediante ORDER BY para mejorar la visualización de los datos.
```
<img width="241" height="56" alt="image" src="https://github.com/user-attachments/assets/51a0d6ee-c513-4c57-9a82-0e357523c548" />

## Consigna 16
```sql
SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE (c.id_paciente, c.fecha) IN (
    SELECT id_paciente, MAX(fecha)
    FROM Consultas
    GROUP BY id_paciente
)
ORDER BY p.nombre;

Se crea una consulta avanzada que combina varias condiciones y relaciones entre tablas para obtener información más detallada.
```
<img width="383" height="508" alt="image" src="https://github.com/user-attachments/assets/a6ff137b-05f1-4117-b0fb-9c0535af5ef8" />

## Consigna 17
```sql
SELECT 
    m.nombre AS medico,
    p.nombre AS paciente,
    COUNT(*) AS total_consultas
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
JOIN Pacientes p ON c.id_paciente = p.id_paciente
GROUP BY m.nombre, p.nombre
ORDER BY m.nombre, p.nombre;

Se utilizan subconsultas o joins para analizar relaciones más complejas entre los datos.
```
<img width="381" height="597" alt="image" src="https://github.com/user-attachments/assets/7e3c9208-f1f9-4a33-b245-2e29dc9c3a39" />

## Consigna 18
```sql
SELECT 
    med.nombre AS medicamento,
    COUNT(*) AS total_recetas,
    m.nombre AS medico,
    p.nombre AS paciente
FROM Recetas r
JOIN Medicamentos med ON r.id_medicamento = med.id_medicamento
JOIN Medicos m ON r.id_medico = m.id_medico
JOIN Pacientes p ON r.id_paciente = p.id_paciente
GROUP BY med.nombre, m.nombre, p.nombre
ORDER BY total_recetas DESC;

Se aplican agrupamientos y funciones de agregación para obtener estadísticas relevantes del sistema.
```
<img width="484" height="557" alt="image" src="https://github.com/user-attachments/assets/7b3758fd-c4e8-4e97-b302-c0054b779e16" />

## Consigna 19
```sql
SELECT 
    m.nombre AS medico,
    COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
GROUP BY m.nombre
ORDER BY total_pacientes DESC;

Se filtran los resultados en base a condiciones específicas, como fechas o valores determinados.
```
<img width="247" height="214" alt="image" src="https://github.com/user-attachments/assets/f831db07-29f5-42ba-b67a-df0289ba22ab" />

## Consigna 20
```sql
SELECT 
    m.nombre AS medico,
    COUNT(*) AS total_consultas_menores
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
JOIN VistaPacientesEdad v ON c.id_paciente = v.id_paciente
WHERE v.edad < 18
GROUP BY m.nombre
ORDER BY total_consultas_menores DESC;

Se construye una consulta final integradora que resume y combina múltiples conceptos vistos, como joins, filtros y agregaciones.
```
<img width="286" height="58" alt="image" src="https://github.com/user-attachments/assets/2dde7f07-a561-406d-8949-09ec8dcd874b" />

