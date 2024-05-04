CREATE DATABASE COLEGIO;

USE COLEGIO;

CREATE TABLE departamento(
	departamentoID INT(10) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50)
);

CREATE TABLE profesor(
	profesorID INT(10) PRIMARY KEY AUTO_INCREMENT,
	departamentoID INT(10),
	FOREIGN KEY (departamentoID) REFERENCES departamento(departamentoID)
);

CREATE TABLE grado(
	gradoID INT(10) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100)
);

CREATE TABLE persona(
	personaID INT(10) PRIMARY KEY AUTO_INCREMENT,
	nif VARCHAR(9),
	nombre VARCHAR(25),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25),
	direccion VARCHAR(50),
	telefono VARCHAR(9),
	fecha_nacimiento DATE,
	sexo ENUM("H","M"),
	tipo ENUM(...), -- REVISAR
	profesorID INT(10),
	FOREIGN KEY (profesorID) REFERENCES profesor(profesorID)
);

CREATE TABLE asignatura(
	asignaturaID INT(10) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
	creditos FLOAT,
	tipo ENUM(...), -- REVISAR
	curso TINYINT(3),
	cuatrimestre TINYINT(3),
	profesorID INT(10),
	gradoID INT(10),
	FOREIGN KEY (profesorID) REFERENCES profesor(profesorID),
	FOREIGN KEY (gradoID) REFERENCES grado(gradoID)
	
);

CREATE TABLE curso_escolar(
	cursoEscolarID INT(10) PRIMARY KEY AUTO_INCREMENT,
	anyo_inicio YEAR(4),
	anyo_fin YEAR(4)
);

CREATE TABLE alumno_se_matiricula_asignatura(
	alumnoID INT(10),
	asignaturaID INT(10),
	cursoEscolarID INT(10),
	FOREIGN KEY (alumnoID) REFERENCES alumno(alumnoID),
	FOREIGN KEY (asignaturaID) REFERENCES asignatura(asignaturaID),
	FOREIGN KEY (cursoEscolarID) REFERENCES curso_escolar(cursoEscolarID),
	PRIMARY KEY(alumnoID,asignaturaID,cursoEscolarID)
);

