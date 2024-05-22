-- ##############################
-- ###########DIA 12##############
-- ##############################

-- Creacion y uso de base de datos

CREATE DATABASE dia12;
USE dia12;


-- Creacion tabla fabricante
CREATE TABLE fabricante(
	codigo INT(10) PRIMARY KEY,
	nombre VARCHAR(100)
);
-- Creacion tabla producto
CREATE TABLE producto(
	codigo INT(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	precio DOUBLE NOT NULL,
	codigo_fabricante INT(10) NOT NULL,
	FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

-- Insercion de datos a  tabla fabricante
INSERT fabricante VALUES
(1,"Asus"),
(2,"Lenovo"),
(3,"Hewlett-Packard"),
(4,"Samsung"),
(5,"Seagate"),
(6,"Crucial"),
(7,"Gigabyte"),
(8,"Huawei"),
(9,"Xiaomi");

-- Insercion de datos a  tabla producto
INSERT producto VALUES
(1,"Disco duro SATA3 1TB",86.99,5),
(2,"Memoria RAM DDR4 8GB",120,6),
(3,"Disco SSD 1 TB",150.99,4),
(4,"GeForce GTX 1050Ti",185,7),
(5,"GeForce GTX 1080 Xtreme",755,6),
(6,"Monitor 24 LED Full HD",202,1),
(7,"Portatil Yoga 520",559,2),
(8,"Portatil Ideapd 320",44,2),
(9,"Portatil Ideapd 320",444,2),
(10,"Impresora HP Deskjet 3720",59.99,3),
(11,"Impresora HP Laserjet Pro M26nw",180,3);

-- 1) Lista el nombre de todos los productos que hay en la tabla producto.
SELECT 
	p.nombre 
FROM
	producto p;

-- 2) Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT 
	p.nombre,
	p.precio 
FROM
	producto p;

-- 3) Lista todas las columnas de la tabla producto.
SELECT 
	* 
FROM
	producto p;
-- 4) Lista el nombre de los productos, el precio en euros y el precio en dólares
-- estadounidenses (USD).

-- Verificar en que esta el precio

/* 5) Lista el nombre de los productos, el precio en euros y el precio en dólares
estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre
de producto, euros, dólares. */

-- Verificar en que esta el precio

/* 6) Lista los nombres y los precios de todos los productos de la tabla producto,
convirtiendo los nombres a mayúscula.*/

SELECT 
	UCASE(p.nombre) AS nombre,
	p.precio 
FROM
	producto p;

/* 7) Lista los nombres y los precios de todos los productos de la tabla producto,
convirtiendo los nombres a minúscula.*/

SELECT 
	LCASE(p.nombre) AS nombre,
	p.precio 
FROM
	producto p;

/* 8) Lista el nombre de todos los fabricantes en una columna, y en otra columna
obtenga en mayúsculas los dos primeros caracteres del nombre del
fabricante.*/
SELECT 
	p.nombre,
	UCASE(SUBSTR(p.nombre,1,2)) AS iniciales
FROM
	producto p;
/* 9) Lista los nombres y los precios de todos los productos de la tabla producto,
redondeando el valor del precio.*/
SELECT 
	p.nombre,
	ROUND(p.precio,1)
FROM
	producto p;

/* 10) Lista los nombres y los precios de todos los productos de la tabla producto,
truncando el valor del precio para mostrarlo sin ninguna cifra decimal. */
SELECT 
	p.nombre,
	ROUND(p.precio,0)
FROM
	producto p;

