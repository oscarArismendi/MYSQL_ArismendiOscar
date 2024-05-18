
-- ##############################
-- ###########DIA 9##############
-- ##############################


-- creacion y uso de la base de datos
CREATE DATABASE dia9;
USE dia9;

-- Creación tablas:
CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 


CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);


INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

-- 1)Lista el primer apellido de todos los empleados.

CALL columna_tabla("empleado","apellido1"); 


-- 2) Lista el primer apellido de los empleados eliminando los apellidos que estén
-- repetidos.

	call distinct_columna_table("empleado", "apellido1"); 
-- 3) Lista todas las columnas de la tabla empleado.
SELECT 
	*
FROM 
	empleado;
-- 4) Lista el nombre y los apellidos de todos los empleados.	
	
SELECT
	e.nombre ,
	e.apellido1 ,
	e.apellido2 
FROM 
	empleado e ;

-- 5) Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.

SELECT 
	e.id_departamento 
FROM 
	empleado e 
WHERE 
	e.id_departamento IS NOT NULL;
-- 6) Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT
	e.id_departamento 
FROM 
	empleado e 
WHERE 
	e.id_departamento IS NOT NULL;
-- 7) Lista el nombre y apellidos de los empleados en una única columna.
SELECT 
	CONCAT(e.nombre," ",IFNULL(e.apellido1,"")," ",IFNULL(e.apellido2,"")) AS nombre_apellidos
FROM
	empleado e;
-- 8) Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.

SELECT 
	UPPER(CONCAT(e.nombre," ",IFNULL(e.apellido1,"")," ",IFNULL(e.apellido2,""))) AS nombre_apellidos
FROM
	empleado e;

-- 9) Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.

SELECT 
	LOWER(CONCAT(e.nombre," ",IFNULL(e.apellido1,"")," ",IFNULL(e.apellido2,""))) AS nombre_apellidos
FROM
	empleado e;



-- 10) Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.
SELECT
	e.id ,
	SUBSTR(e.nif,1,LENGTH(e.nif)-1) AS nif_numbers,
	SUBSTR(e.nif,LENGTH(e.nif),LENGTH(e.nif)) AS nif_letter
FROM
	empleado e ;

-- 11) Lista el nombre de cada departamento y el valor del presupuesto actual del
-- que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna
-- que está calculando.

SELECT 
	d.nombre,
	d.presupuesto - d.gastos AS presupuesto_actual
FROM 
	departamento d ;

-- 12) Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
SELECT 
	d.nombre, 
	d.presupuesto - d.gastos AS presupuesto_actual
FROM 
	departamento d 
ORDER BY
	presupuesto_actual ASC;

-- 13) Lista el nombre de todos los departamentos ordenados de forma
-- ascendente.

SELECT 
	d.nombre 
FROM
	departamento d
ORDER BY
	d.nombre ASC;

-- 14) Lista el nombre de todos los departamentos ordenados de forma
-- descendente.
SELECT 
	d.nombre 
FROM
	departamento d
ORDER BY
	d.nombre DESC;

/* 15) Lista los apellidos y el nombre de todos los empleados, ordenados de forma
alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
nombre.*/

SELECT 
	e.apellido1,
	e.apellido2 ,
	e.nombre 
FROM
	empleado e 
ORDER BY
	e.apellido1 ASC,
	e.apellido2,
	e.nombre ;

/* 16) Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen mayor presupuesto.*/

SELECT 
	d.nombre ,
	d.presupuesto  
FROM 
	departamento d 
ORDER BY
	d.presupuesto DESC
LIMIT
	3;

/* 17) Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen menor presupuesto.*/

SELECT 
	d.nombre ,
	d.presupuesto  
FROM 
	departamento d 
ORDER BY
	d.presupuesto ASC
LIMIT
	3;

/* 18) Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen mayor gasto.*/

SELECT 
	d.nombre ,
	d.gastos 
FROM 
	departamento d 
ORDER BY
	d.gastos DESC
LIMIT
	2;

/* 19) Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen menor gasto.*/

SELECT 
	d.nombre ,
	d.gastos 
FROM 
	departamento d 
ORDER BY
	d.gastos ASC
LIMIT
	2;

/* 20) Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
columnas de la tabla empleado.*/

SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.id > 2;

/* 21) Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto mayor o igual a 150000 euros.*/

SELECT 
	d.nombre ,
	d.presupuesto 
FROM 
	departamento d 
WHERE 
	d.presupuesto >= 150000;

/* 22) Devuelve una lista con el nombre de los departamentos y el gasto, de
aquellos que tienen menos de 5000 euros de gastos.*/

SELECT 
	d.nombre ,
	d.gastos 
FROM 
	departamento d 
WHERE 
	d.gastos < 5000;

/* 23) Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin
utilizar el operador BETWEEN.*/

SELECT 
	d.nombre,
	d.presupuesto 
FROM
	departamento d 
WHERE 
	d.presupuesto > 100000 
	AND 
	d.presupuesto < 200000;

/* 24) Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.*/

SELECT 
	d.nombre,
	d.presupuesto 
FROM
	departamento d 
WHERE 
	d.presupuesto < 100000 
	OR
	d.presupuesto > 200000;
/* 25) 25. Devuelve una lista con el nombre de los departamentos que tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/

SELECT 
	d.nombre,
	d.presupuesto
FROM
	departamento d 
WHERE 
	d.presupuesto BETWEEN 100000 AND 200000;

/* 26) Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/

SELECT 
	d.nombre,
	d.presupuesto
FROM
	departamento d 
WHERE 
	d.presupuesto NOT BETWEEN 100000 AND 200000;

/* 27) Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean mayores
que el presupuesto del que disponen.*/

SELECT 
	d.nombre ,
	d.gastos ,
	d.presupuesto 
FROM 
	departamento d
WHERE 
	d.presupuesto < d.gastos ;

/* 28) Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean menores
que el presupuesto del que disponen.*/
SELECT 
	d.nombre ,
	d.gastos ,
	d.presupuesto 
FROM 
	departamento d
WHERE 
	d.presupuesto > d.gastos ;

/* 29) Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean iguales al
presupuesto del que disponen.*/

SELECT 
	d.nombre ,
	d.gastos ,
	d.presupuesto 
FROM 
	departamento d
WHERE 
	d.presupuesto = d.gastos ;
/* 30) Lista todos los datos de los empleados cuyo segundo apellido sea NULL.*/
SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.apellido2 IS NULL;
/* 31) Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.*/
SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.apellido2 IS NOT NULL;
/* 32) Lista todos los datos de los empleados cuyo segundo apellido sea López.*/

SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.apellido2 = 'López';

/* 33) Lista todos los datos de los empleados cuyo segundo apellido
sea Díaz o Moreno. Sin utilizar el operador IN.*/
SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.apellido2 = 'Díaz' 
	OR
	e.apellido2 = 'Moreno' ;

/* 34) Lista todos los datos de los empleados cuyo segundo apellido
sea Díaz o Moreno. Utilizando el operador IN. */
SELECT 
	*
FROM 
	empleado e 
WHERE 
	e.apellido2 IN('Díaz','Moreno');
-- PROCEDURES --

/* 35) Lista los nombres, apellidos y nif de los empleados que trabajan en el
departamento 3. */

SELECT 
	e.nombre ,
	e.apellido1 ,
	e.apellido2 ,
	e.nif 
FROM 
	empleado e 
WHERE 
	e.id_departamento = 3;

/* 36) Lista los nombres, apellidos y nif de los empleados que trabajan en los
departamentos 2, 4 o 5.*/

SELECT 
	e.nombre ,
	e.apellido1 ,
	e.apellido2 ,
	e.nif 
FROM 
	empleado e 
WHERE 
	e.id_departamento IN(2,4,5);

-- Consultas multitabla (Composición interna)

-- 1) Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno.

SELECT 
	*
FROM 
	empleado e 
LEFT JOIN
	departamento d on e.id_departamento = d.id ;

/* 2) Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
del departamento (en orden alfabético) y en segundo lugar por los apellidos
y el nombre de los empleados.*/
SELECT 
	*
FROM 
	empleado e 
LEFT JOIN
	departamento d on e.id_departamento = d.id 
ORDER BY
	d.nombre ASC ,
	e.apellido1 asc,
	e.apellido2 asc,
	e.nombre asc;

/* 3) Devuelve un listado con el identificador y el nombre del departamento,
solamente de aquellos departamentos que tienen empleados.*/

SELECT  DISTINCT 
	d.id,
	d.nombre 
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento ;

/* 4) Devuelve un listado con el identificador, el nombre del departamento y el
valor del presupuesto actual del que dispone, solamente de aquellos
departamentos que tienen empleados. El valor del presupuesto actual lo
puede calcular restando al valor del presupuesto inicial
(columna presupuesto) el valor de los gastos que ha generado
(columna gastos).*/

SELECT  DISTINCT 
	d.id,
	d.nombre,
	d.presupuesto - d.gastos AS presupuesto_actual
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento ;

/* 5)Devuelve el nombre del departamento donde trabaja el empleado que tiene
el nif 38382980M.*/

SELECT   
	d.id,
	d.nombre
FROM 
	empleado e 
LEFT JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	e.nif = "38382980M";

/* 6) Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz
Santana.*/

SELECT  
	d.id,
	d.nombre
FROM 
	empleado e 
LEFT JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	e.nombre  = 'Pepe' 
	AND 
	e.apellido1 = 'Ruiz' 
	AND 
	e.apellido2 = 'Santana' ;

/* 7) Devuelve un listado con los datos de los empleados que trabajan en el
departamento de I+D. Ordena el resultado alfabéticamente.*/

SELECT 
	*
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	d.nombre = "I+D"
ORDER BY 
	e.nombre ASC;

/* 8)Devuelve un listado con los datos de los empleados que trabajan en el
departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
alfabéticamente.*/

SELECT 
	e.*
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	d.nombre = "I+D"
	or
	d.nombre = 'Sistemas' 
	OR
	d.nombre = 'Contabilidad' 
ORDER BY 
	e.nombre ASC;

/* 9) Devuelve una lista con el nombre de los empleados que tienen los
departamentos que no tienen un presupuesto entre 100000 y 200000 euros. */

SELECT 
	e.nombre 
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	d.presupuesto NOT BETWEEN 100000 AND 200000;

/* 10) Devuelve un listado con el nombre de los departamentos donde existe
algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no
debe mostrar nombres de departamentos que estén repetidos. */


SELECT DISTINCT
	d.nombre 
FROM 
	empleado e 
INNER JOIN
	departamento d on d.id = e.id_departamento 
WHERE 
	e.apellido2 IS NULL;


-- Consultas multitabla (Composición externa)

/* 1) Devuelve un listado con todos los empleados junto con los datos de los
departamentos donde trabajan. Este listado también debe incluir los
empleados que no tienen ningún departamento asociado.*/

SELECT 
	*
FROM 
	empleado e 
LEFT JOIN
	departamento d ON e.id_departamento = d.id ;

/* 2) Devuelve un listado donde sólo aparezcan aquellos empleados que no
tienen ningún departamento asociado. */
SELECT 
	e.*
FROM 
	empleado e 
LEFT JOIN
	departamento d ON e.id_departamento = d.id
WHERE 
	d.id IS NULL;

/* 3) Devuelve un listado donde sólo aparezcan aquellos departamentos que no
tienen ningún empleado asociado.*/
SELECT 
	d.*
FROM 
	empleado e 
RIGHT JOIN
	departamento d ON e.id_departamento = d.id
WHERE 
	e.id IS NULL;
/* 4) Devuelve un listado con todos los empleados junto con los datos de los
departamentos donde trabajan. El listado debe incluir los empleados que no
tienen ningún departamento asociado y los departamentos que no tienen
ningún empleado asociado. Ordene el listado alfabéticamente por el
nombre del departamento.*/
(SELECT 
	e.*,
	d.id,
	d.nombre as departamento_nombre	
FROM 
	empleado e 
LEFT JOIN
	departamento d ON e.id_departamento = d.id 
)

UNION 

(SELECT 
	e.*,
	d.id,
	d.nombre as departamento_nombre	
FROM 
	empleado e 
RIGHT JOIN
	departamento d ON e.id_departamento = d.id
)

ORDER BY
	departamento_nombre;

/* 5)Devuelve un listado con los empleados que no tienen ningún departamento
asociado y los departamentos que no tienen ningún empleado asociado.
Ordene el listado alfabéticamente por el nombre del departamento.*/ 

(SELECT 
	e.*,
	d.id,
	d.nombre as departamento_nombre	
FROM 
	empleado e 
LEFT JOIN
	departamento d ON e.id_departamento = d.id
WHERE 
	d.id IS NULL
)

UNION 

(SELECT 
	e.*,
	d.id,
	d.nombre as departamento_nombre	
FROM 
	empleado e 
RIGHT JOIN
	departamento d ON e.id_departamento = d.id
WHERE 
	e.id IS NULL 
	)

ORDER BY
	departamento_nombre;
-- Consultas resumen
-- 1) Calcula la suma del presupuesto de todos los departamentos.

SELECT 
	SUM(d.presupuesto) as suma_presupuestos 
FROM
	departamento d ;

-- 2) Calcula la media del presupuesto de todos los departamentos.
SELECT 
	AVG(d.presupuesto) as promedio_presupuestos 
FROM
	departamento d ;

-- 3) Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT 
	MIN(d.presupuesto) as promedio_presupuestos 
FROM
	departamento d ;

-- 4) Calcula el nombre del departamento y el presupuesto que tiene asignado,
-- del departamento con menor presupuesto.

-- tomo toda una columna de la tabla
CREATE PROCEDURE columna_tabla(IN table_name varchar(255),IN campo VARCHAR(255))
BEGIN
	SET @sql = CONCAT('SELECT ', campo, ' FROM ', table_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

	

-- toda una columna sin dublicado
CREATE PROCEDURE distinct_columna_table(IN table_name VARCHAR(255),
	IN column_name VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT DISTINCT ', column_name, ' FROM ', table_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
DROP PROCEDURE empleado_campo;


-- Creado por Oscar Fernando Arismendi C.C. 1*******32