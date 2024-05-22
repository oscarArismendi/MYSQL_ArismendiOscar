-- ##############################
-- ###########DIA 10#############
-- ##############################


-- creacion y uso de la base de datos
show databases;
USE mysql;
-- Muestra de la tabla user
SELECT
	*
FROM 
	user;


-- Revisar los usuarios creados
SELECT 
	user,
	host 
FROM
	mysql.user;
CREATE DATABASE ejemploClaseDia10;
USE ejemploClaseDia10;
-- creacion de usuario
create user "pedro"@"localhost" identified by "pedro123";

-- Revisar los usuarios
SHOW GRANTS for "root"@"localhost";
create user 'pedro'@'172.16.101.132' identified by 'pedro123';
show GRANTS for 'pedro'@'172.16.101.132';

-- doy permisos
grant select , insert , update, delete on *.* to 'pedro'@'172.16.101.132';
flush privileges;

-- revocar todos los persmisos
revoke all  on *.*  from 'pedro'@'172.16.101.132';
-- Revisar procesos;
SHOW processlist;
-- quitar proceso
kill 238;
-- remover permisos
REVOKE ALL PRIVILEGES, GRANT OPTION FROM "pedro"@"172.16.101.132";
-- quitar un usuario
DROP USER 'pedro'@'172.16.101.132';



-- Creado por Oscar Fernando Arismendi C.C. 1*******32
