-- #############################
-- ###### EJERCICIO DIA 4 ######
-- #############################
-- Basado en el archivo tabla1.webp
-- Creacion y uso de la BBDD "dia4"

CREATE DATABASE dia4;
USE dia4;

-- Creacion tabla pais
CREATE TABLE pais(
	paisID INT PRIMARY KEY,
	nombre VARCHAR(20),
	continente VARCHAR(50),
	poblacion INT
);

-- Insercion de datos a pais

INSERT INTO pais VALUES
(1, 'COLOMBIA',"America",51000000),
(2, 'ALEMANIA',"Europa",81000000),
(3, 'FRANCIA',"Europa",67000000), 
(4, 'VENEZUELA',"America",28000000),
(5, 'ESTADOS UNIDOS',"America",301000000),
(6, 'CANADA',"America",38000000),
(7, 'PERU',"America",34000000),
(8, 'CHILE',"America",19000000), 
(9, 'BRAZIL',"America",215000000),
(10, 'ARGENTINA',"America",46000000),
(11, 'PARAGUAY',"America",25000000);

-- Creacion tabla ciudad
CREATE TABLE ciudad(
	ciudadID INT PRIMARY KEY,
	NOMBRE VARCHAR(20),
	paisID INT,
	FOREIGN KEY (paisID) REFERENCES pais(paisID)
);

-- Insercion de datos a ciudad

INSERT INTO ciudad VALUES
(1, 'BOGOTA',1),
(2, 'BERLIN',2),
(3, 'PARIS',3), 
(4, 'CARACAS',4),
(5, 'WASHITONG DC',5),
(6, 'OTAWA',6),
(7, 'LIMA',7),
(8, 'SANTIAGO',8), 
(9, 'São PAULO',9),
(10, 'BUENOS AIRES',10),
(11,"TOKYO",NULL);

-- Creacion tabla idioma

CREATE TABLE idioma(
	idiomaID INT PRIMARY KEY,
	idioma VARCHAR(50)
);

-- Insercion de datos a idioma

INSERT INTO idioma VALUES
(1,"ESPAÑOL"),
(2,"ALEMAN"),
(3,"FRANCES"), 
(4, "INGLES"),
(5, "PORTUGES"),
(6, "JAPONES"),
(7, "MANDARIN"),
(8, "COREANO"), 
(9, "RUSO"),
(10, "INDU");


-- Creacion tabla idiomaPais

CREATE TABLE idiomaPais(
	esOficial TINYINT(1), 
	idiomaID INT,
	paisID INT,
	FOREIGN KEY (idiomaID) REFERENCES idioma(idiomaID),
	FOREIGN KEY (paisID) REFERENCES pais(paisID)
);

-- Insercion de datos a idiomaPais
INSERT INTO idiomaPais VALUES
(1,1,1),
(1,2,2),
(1,3,3),
(1,4,4),
(1,5,5),
(1,6,6),
(1,7,7),
(1,8,8),
(1,9,9),
(1,10,10);

-- consulta general por ciudades

SELECT * FROM ciudad;

-- consulta general por paises
SELECT * FROM pais;

-- Consulta de tipo inner join para obtener las ciudades
-- que estan especificamente asignadas a un pais
-- select tabla.columna1 as variable 1, tabla2.columna2 as variable2

SELECT pais.nombre AS NombrePais,ciudad.nombre AS NombrePais
FROM pais INNER JOIN ciudad  -- 2. Selecionar de que tabla a que table hacer x tipo de relacion
on pais.paisID = ciudad.paisID ; -- 3. selecionar de que llave primaria o dato principal relacionarse 

-- Consulta de tipo LEFT JOIN para obtener las ciudades
-- junta con su pais, incluso si alguna ciudad no esta asignada a esta misma 

SELECT pais.nombre AS NombrePais,ciudad.nombre AS NombrePais
FROM pais LEFT JOIN ciudad  -- 2. Selecionar de que tabla a que table hacer x tipo de relacion
on pais.paisID = ciudad.paisID ; -- 3. selecionar de que llave primaria o dato principal relacionarse 

-- Consulta de tipo RIGHT JOIN para obtener las ciudades
-- junta con su pais, incluso los paises que no tienen una ciudad selecionada

SELECT pais.nombre AS NombrePais,ciudad.nombre AS NombrePais
FROM pais RIGHT JOIN ciudad  -- 2. Selecionar de que tabla a que table hacer x tipo de relacion
on pais.paisID = ciudad.paisID ; -- 3. selecionar de que llave primaria o dato principal relacionarse 


-- Consulta de tipo OUTER JOIN para obtener las ciudades

SELECT pais.nombre AS NombrePais,ciudad.nombre AS NombrePais
FROM pais RIGHT JOIN ciudad  -- 2. Selecionar de que tabla a que table hacer x tipo de relacion
on pais.paisID = ciudad.paisID
UNION 
SELECT pais.nombre AS NombrePais,ciudad.nombre AS NombrePais
FROM pais LEFT JOIN ciudad  -- 2. Selecionar de que tabla a que table hacer x tipo de relacion
on pais.paisID = ciudad.paisID ;

-- Creado por Oscar Fernando Arismendi C.C. 1*******32