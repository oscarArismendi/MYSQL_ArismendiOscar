
-- uso de la base datos que se creo en estructura_ArismendiOscar
USE universidad;

-- 1) Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

SELECT 
	departamento.nombre AS "nombre del departamento",
	profesor.apellido1 AS "primer apellido",
	profesor.apellido2 AS "segundo apellido",
	profesor.nombre AS "nombre del profesor"
FROM 
	profesor 
INNER JOIN 
	departamento ON profesor.id_departamento = departamento.id
ORDER BY 
	departamento.nombre ASC,
	profesor.apellido1 ASC,
	profesor.apellido2 ASC,
	profesor.nombre ASC;

-- 2) Devuelve un listado con los profesores que no están asociados a un departamento.

--	RTA: No aparece nada en el codigo de esta consulta porque todos los profesores deben tener un departamento porque en la tabla se declaro NOT NULL

SELECT 
	* 
FROM 
	profesor
WHERE
	profesor.id_departamento IS NULL ;

-- 3) Devuelve un listado con los departamentos que no tienen profesores asociados.

/* SELECT DISTINCT  
	*
FROM
	profesor
INNER JOIN
	departamento ON profesor.id_departamento != departamento.id;

Quedo mal porque inner join hace todas las fuciones posibles, debi haber elegido left join y solo mostrar las que profesor.id sea igual a null
**/
SELECT 
    departamento.id,
    departamento.nombre 
FROM 
    departamento
LEFT JOIN 
    profesor ON departamento.id = profesor.id_departamento
WHERE
	profesor.id IS NULL;


-- 4) Devuelve un listado con los profesores que no imparten ninguna asignatura.

SELECT
	profesor.*
FROM 
	asignatura
RIGHT JOIN
	profesor on profesor.id = asignatura.id_profesor 
WHERE 
	asignatura.id_profesor  IS NULL;

SELECT * FROM asignatura; -- la respuesta es todos excepto 3 y 14

/* 
 Me quedo mal  porque no supe juntar las tablas con left join o right join
 SELECT  DISTINCT 
	profesor.id  
FROM 
	profesor
INNER JOIN
	asignatura ON (asignatura.id_profesor != profesor.id) AND (asignatura.id_profesor IS NOT NULL);
	
*/

-- 5) Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT 
	* 
FROM 
	asignatura
WHERE 
	asignatura.id_profesor IS NULL;

-- 6) Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
-- El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

SELECT * FROM alumno_se_matricula_asignatura;

-- 7) Devuelve el número total de alumnas que hay.
-- RTA: como se puede ver en la tabla solo se tienen 3 alumnas
SELECT 
	COUNT(*) AS "numero total de alumnas"
FROM 
	alumno
WHERE 
	alumno.sexo = "M";



-- 8) Calcula cuántos alumnos nacieron en 1999.
-- RTA: Como se puede ver en la tabla solo dos cumplen la condicion de haber
-- 		nacido en 1999
SELECT 
	COUNT(*)  AS "Numero de alumnos nacidos en 1999"
FROM 
	alumno
WHERE 
 YEAR(alumno.fecha_nacimiento ) = 1999;


-- 9) Calcula cuántos profesores hay en cada departamento.
-- El resultado sólo debe mostrar dos columnas, una con el nombre del departamento
-- y otra con el número de profesores que hay en ese departamento. 
-- El resultado sólo debe incluir los departamentos que tienen profesores asociados
-- y deberá estar ordenado de mayor a menor por el número de profesores.

-- RTA: Como se puede ver en la consulta el departamento de informatica tiene 4 profesores,
-- 		el de matematicas 3 profesores, el de economia y empresa tiene 2 profesores, 
-- 		el de educacion 3 profesores, el de agronomia 1 profesores y el de
-- 		quimica y fisica 2 profesores
SELECT 
	departamento.nombre , COUNT(profesor.id_departamento) AS "profesores en el departamento"
FROM
	profesor
INNER JOIN
	departamento ON profesor.id_departamento = departamento.id 
GROUP BY 
	departamento.id
ORDER BY 
	departamento.id ASC;
/* Me quede a mitad de camino  porque no sabia hacer el group by y tampoco sabia contar
 SELECT 
	
FROM
	profesor
INNER JOIN
	departamento ON profesor.id_departamento = departamento.id 
ORDER BY departamento.id ASC;
 */


-- 10) Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
-- Estos departamentos también tienen que aparecer en el listado.

-- RTA: Como se puede ver en la consulta el departamento de informatica tiene 4 profesores,
-- 		el de matematicas 3 profesores, el de economia y empre tiene 2 profesores, 
-- 		el de educacion 3 profesores, el de agronomia 5 profesores, el de
-- 		quimica y fisica 2 profesores, ek de filologia 0 profesores, el de derecho 0 profesores
--		el de biologia y geologia 0 profesores

SELECT 
	departamento.nombre , COUNT(profesor.id_departamento) AS "profesores en el departamento"
FROM
	profesor
RIGHT JOIN
	departamento ON profesor.id_departamento = departamento.id 
GROUP BY 
	departamento.id
ORDER BY 
	departamento.id ASC;

/* Me quedo mal porque no sabia group by  y tampoco sabia count 
  
 SELECT 
	*
FROM
	profesor
RIGHT JOIN
	departamento ON profesor.id_departamento = departamento.id 
ORDER BY departamento.id ASC;
*/
-- 11) Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno.
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas.
--  Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

-- RTA: Como se puede ver en la consulta los departamentos 1,2,3,5,6,8,9,10 no tienen ningun grado, 
-- 		el departamento con la id 4 tiene 51 grados asociados, el departamento con id 7 tiene 32 grados asociados
SELECT
	grado.*,count(asignatura.id_grado) AS "numero de asignaturas"
FROM
	asignatura
RIGHT JOIN
	grado ON asignatura.id_grado  = grado.id
GROUP BY 
	grado.id
ORDER BY 
	grado.id ASC;

/* Me falto el group by y el count
 SELECT
	*
FROM
	asignatura
RIGHT JOIN
	grado ON asignatura.id_grado  = grado.id 
ORDER BY grado.id ASC;

 
 */


-- 12) Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, 
-- de los grados que tengan más de 40 asignaturas asociadas




-- RTA: Como se puede ver en la consulta los departamentos 1,2,3,5,6,8,9,10 no tienen ningun grado, 
-- 		el departamento con la id 4 tiene 50 grados asociados, el departamento con id 7 tiene 31 grados asociados
-- 		por lo tanto solo el departamento con id 4 se mostraria con el nombre Grado en ingenieria informatica(plan 2015)

SELECT
	grado.*,count(asignatura.id_grado) AS numero_de_asignaturas
FROM
	asignatura
RIGHT JOIN
	grado ON asignatura.id_grado  = grado.id
GROUP BY 
	grado.id
HAVING
	numero_de_asignaturas > 40 
ORDER BY 
	numero_de_asignaturas DESC
;


/* No lo termine porque no sabia de group by, y que el orden es group by, having y order by 
 * 
 SELECT
	*
FROM
	asignatura
RIGHT JOIN
	grado ON asignatura.id_grado  = grado.id 
ORDER BY grado.id ASC;
*/

-- 13) Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura.
--  El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
--  Ordene el resultado de mayor a menor por el número total de crédidos.

SELECT 
	grado.nombre AS nombre_grado,
	asignatura.tipo AS tipo_asignatura,
	SUM(asignatura.creditos) AS total_creditos
FROM 
	grado
INNER JOIN
	asignatura ON asignatura.id_grado = grado.id
GROUP BY
	grado.nombre,
	asignatura.tipo
ORDER BY
	total_creditos DESC;



-- 14) Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, 
-- una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.


-- 15) Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura.
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número
-- de asignaturas.

-- 16) Devuelve todos los datos del alumno más joven.

SELECT 
	* 
FROM 
	alumno
ORDER BY
	alumno.fecha_nacimiento DESC
LIMIT 
	1;
-- 17) Devuelve un listado con los profesores que no están asociados a un departamento.
-- RTA: No devuelve ninguno porque los profesores tienen que estar con un id de departamento obligatoriamente
SELECT
	*
FROM 
	profesor
WHERE 
	id_departamento IS NULL ;
	
-- 18) Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT 
	departamento.*
FROM 
	departamento
LEFT JOIN
	profesor ON profesor.id_departamento = departamento.id
WHERE 
	profesor.id IS NULl ;
-- 19) Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT 
	profesor.*
FROM 
	profesor
LEFT JOIN
	asignatura ON asignatura.id_profesor = profesor.id
WHERE 
	asignatura.id IS NULL;

-- 20) Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT
	*
FROM 
	asignatura
WHERE 
	asignatura.id_profesor IS NULL;
-- Creado por Oscar Fernando Arismendi C.C. 1*******32
