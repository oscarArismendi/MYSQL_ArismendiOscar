

CREATE DATABASE dia6Ejercicio2;
USE dia6Ejercicio2;

CREATE TABLE estudiante(
	ID_estudiante int,
	nombre_estudiante varchar(50)
);

CREATE TABLE estudiante_curso(
	ID_estudiante int,
	ID_curso int
);

CREATE TABLE curso(
	nombre_curso varchar(50),
	ID_curso int,
	nombre_profesor VARCHAR(50)
);

INSERT INTO estudiante VALUES 
(1,"Oscar"),
(2,"Carlos"),
(3,"Luis");

INSERT INTO curso VALUES 
("Matematicas",1,"german"),
("Ingles",2,"Pedro"),
("Ciencias Naturales",3,"camilo");

SELECT * FROM estudiante
INNER JOIN curso;