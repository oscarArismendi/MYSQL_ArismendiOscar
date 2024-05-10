-- ##############################
-- ## EXAMEN SORPRESA DIA 7######
-- ##############################


-- creacion y uso de la base de datos
CREATE DATABASE universidad;
USE universidad;

-- creacion tabla departamento

CREATE TABLE departamento(
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

-- creacion tabla profesor

CREATE TABLE profesor(
	id INT(10) PRIMARY KEY,
	nif VARCHAR(9),
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(9),
	fecha_nacimiento DATE NOT NULL,
	sexo ENUM("H","M"),
	id_departamento INT(10),
	FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- creacion tabla grado

CREATE TABLE grado(
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

-- creacion tabla asignatura

CREATE TABLE asignatura(
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	creditos FLOAT NOT NULL,
	tipo ENUM("básica","obligatoria","optativa") NOT NULL,
	curso TINYINT(3),
	cuatrimestre TINYINT(3) NOT NULL,
	id_profesor INT(10),
	id_grado INT(10),
	FOREIGN KEY (id_grado) REFERENCES grado(id),
	FOREIGN KEY (id_profesor) REFERENCES profesor(id)
);

-- creacion tabla curso_escolar

CREATE TABLE curso_escolar(
	id INT(10),
	anyo_inicio YEAR(4),
	anyo_fin YEAR(4)
);

-- creacion tabla alumno

CREATE TABLE alumno(
	id INT(10) PRIMARY KEY,
	nif VARCHAR(9),
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(9),
	fecha_nacimiento DATE NOT NULL,
	sexo ENUM("H","M") NOT NULL
);

-- creacion tabla alumnos_se_matricula_asignatura

CREATE TABLE alumno_se_matricula_asignatura(
	id_alumno INT(10),
	id_asignatura INT(10),
	id_curso_escolar INT(10)
);



-- Creado por Oscar Fernando Arismendi C.C. 1*******32