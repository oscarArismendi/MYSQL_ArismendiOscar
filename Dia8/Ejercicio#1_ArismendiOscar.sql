
-- ##############################
-- ###########DIA 8##############
-- ##############################


-- creacion y uso de la base de datos
CREATE DATABASE dia8;
USE dia8;

CREATE TABLE productos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100),
	precio decimal(10,2)
);

insert into productos values
    (1,"Pepito",23.2),
    (2,"MousePad",100000.21),
    (3,"Espionap",2500.25),
    (4,"BOB-ESPONJA",1500.25),
    (5,"Cary",23540000.23),
    (6,"OvulAPP",198700.23),
    (7,"PapayAPP",2000.00),
    (8,"Menosprecio",3800.00),
    (9,"CariciasOlfer",2300.00),
    (10,"Perfume La Cumbre", 35000.25),
    (11,"Nevera M800",3000.12),
    (12,"Crema Suave", 2845.00),
    (13,"juego de mesa La Cabellera",9800.00);

CREATE FUNCTION totalConIVA(precio decimal(10,2)) returns decimal(10,2)
DETERMINISTIC
begin
	return precio+((precio*19)/100);
end;
drop FUNCTION totalConIVA;
select totalConIVA(25000.300);

SELECT nombre, totalConIVA(precio) as precioConIVA from productos;

CREATE FUNCTION totalConIva(precio decimal(10,2))
RETURNS VARCHAR(255) deterministic
begin
	if precio < 1000 THEN
		RETURN CONCAT('Tu precio con descuento es',precio+((precio*19)/100));
	else
		RETURN CONCAT('Tu precio completo es:',precio+((precio*19)/100));
	end if;
end;

CREATE FUNCTION buscarProducto(nombre_producto VARCHAR(100)) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE producto_precio decimal(10,2);
    DECLARE producto_nombre VARCHAR(100);
    DECLARE producto_id int;
    SELECT nombre,id,precio INTO producto_nombre, producto_id,producto_precio
   		   FROM productos WHERE nombre = nombre_producto LIMIT 1;
    RETURN CONCAT('id: ',producto_id,' nombre: ', producto_nombre, ' precio: ', producto_precio);
END;
DROP FUNCTION buscarProducto;
SELECT buscarProducto("Cary") AS datos_producto;


-- Creado por Oscar Fernando Arismendi C.C. 1*******32

