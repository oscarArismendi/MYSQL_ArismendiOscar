CREATE DATABASE ParquesDelMinisterioAmbiental;

USE ParquesDelMinisterioAmbiental;
CREATE TABLE entidades(
	idEntidad int PRIMARY KEY,
	nombre varchar(45) NOT NULL
);

INSERT INTO entidades (idEntidad, nombre) VALUES
(1, 'Entity 1'),
(2, 'Entity 2'),
(3, 'Entity 3'),
(4, 'Entity 4'),
(5, 'Entity 5');

CREATE TABLE departamentos(
	idDepartamento int PRIMARY KEY,
	idEntidad int,
	FOREIGN KEY (idEntidad) REFERENCES entidades(idEntidad)
);
INSERT INTO departamentos (idDepartamento, idEntidad) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

CREATE TABLE parqueNaturales(
	idParqueNatural int PRIMARY KEY,
	nombre varchar(25),
	fecha datetime
);

INSERT INTO parqueNaturales (idParqueNatural, nombre,fecha) VALUES
(1, "parque 1","2000-04-20"),
(2, "parque 2","2003-03-25"),
(3, "parque 3","2020-01-21"),
(4, "parque 4","2022-11-20"),
(5, "parque 5","2013-06-13");

CREATE TABLE departamentoHasParqueNatural(
	idDepParque int PRIMARY KEY,
	idDepartamento int,
	idParqueNatural int,
	FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento),
	FOREIGN KEY (idParqueNatural) REFERENCES parqueNaturales(idParqueNatural)
);

INSERT INTO departamentoHasParqueNatural (idDepParque, idDepartamento,idParqueNatural) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

CREATE TABLE areaParque(
	idAreaParque INT PRIMARY KEY,
	nombre varchar(25),
	extension double,
	idParqueNatural int,
	FOREIGN KEY (idParqueNatural) REFERENCES parqueNaturales(idParqueNatural)
);

INSERT INTO areaParque (idAreaParque, nombre,extension,idParqueNatural) VALUES
(1, "area 1", 620 , 1),
(2, "area 2", 430, 2),
(3, "area 3", 153, 3),
(4, "area 4", 123, 4),
(5, "area 5", 22.3, 5);

CREATE TABLE tipoEspecie(
	idTipoEspecie int PRIMARY KEY,
	descripcion varchar(200)
);

INSERT INTO tipoEspecie  (idTipoEspecie,descripcion) VALUES
(1,"descripcion 1"),
(2,"descripcion 2"),
(3,"descripcion 3"),
(4,"descripcion 4"),
(5,"descripcion 5");

CREATE TABLE especie(
	idEspecie int PRIMARY KEY,
	denominacionCientifica varchar(45) NOT NULL,
	denominacionVulgar varchar(45) NOT NULL,
	numInventario int NOT NULL,
	idAreaParque int NOT NULL,
	idTipoEspecie int NOT NULL,
	FOREIGN KEY (idAreaParque) REFERENCES areaParque(idAreaParque),
	FOREIGN KEY (idTipoEspecie) REFERENCES tipoEspecie(idTipoEspecie)
);

INSERT INTO especie (idEspecie,denominacionCientifica,denominacionVulgar,numInventario,idAreaParque,idTipoEspecie) VALUES
(1,"denominacion cientifica 1","denominacion vulgar 1",32,1,1),
(2,"denominacion cientifica 2","denominacion vulgar 2",38,2,2),
(3,"denominacion cientifica 3","denominacion vulgar 3",67,3,3),
(4,"denominacion cientifica 4","denominacion vulgar 4",91,4,4),
(5,"denominacion cientifica 5","denominacion vulgar 5",23,5,5);

CREATE TABLE trabajador(
	idTrabajador int PRIMARY KEY,
	nombre varchar(45),
	cedula int,
	direcion varchar(45),
	sueldo double,
	idParqueNatural int NOT NULL,
	FOREIGN KEY (idParqueNatural) REFERENCES parqueNaturales(idParqueNatural)
);

INSERT INTO trabajador VALUES
(1,"nombre 1",1234567891,"direccion 1",3000000,1),
(2,"nombre 2",1234567892,"direccion 2",3500000,2),
(3,"nombre 3",1234567893,"direccion 3",3000000,3),
(4,"nombre 4",1234567894,"direccion 4",1720000,4),
(5,"nombre 5",1234567895,"direccion 5",2000000,5);

CREATE TABLE telefono(
	idTelefono int PRIMARY KEY,
	numFijo int NOT NULL,
	numMovil varchar(20) NOT NULL,
	idTrabajador int,
	FOREIGN KEY (idTrabajador) REFERENCES trabajador(idTrabajador)
);

INSERT INTO telefono VALUES
(1,6230593,"3187234519",1),
(2,6230573,"3177534139",2),
(3,6235594,"3137234519",3),
(4,6232599,"3167234519",4),
(5,6230692,"3187245529",5);

CREATE TABLE gestionTrabajador(
	idGestionTrabajador int PRIMARY KEY,
	entradaParque varchar(45),
	idTrabajador int,
	idAreaParque int,
	FOREIGN KEY (idTrabajador) REFERENCES trabajador(idTrabajador),
	FOREIGN KEY (idAreaParque) REFERENCES areaParque(idAreaParque)
);

CREATE TABLE entrada(
	idEntrada int PRIMARY KEY,
	numEntrada int NOT NULL,
	ubicacion varchar(45) NOT NULL,
	idParqueNatural int NOT NULL,
	FOREIGN KEY (idParqueNatural) REFERENCES parqueNaturales(idParqueNatural)
);