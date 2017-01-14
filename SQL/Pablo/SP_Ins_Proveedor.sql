DROP PROCEDURE IF EXISTS Inserta_Proveedor;
DELIMITER //
CREATE PROCEDURE Inserta_Proveedor(ID_Proveedor int(11), Descripcion_Proveedor varchar(75), NIT_Proveedor varchar(15), Telefono_Proveedor varchar(15), Email_Proveedor varchar(75))
BEGIN

	INSERT INTO proveedor(ID_Proveedor, Descripcion_Proveedor, NIT_Proveedor, Telefono_Proveedor, Email_Proveedor)
    VALUES (ID_Proveedor, Descripcion_Proveedor, NIT_Proveedor, Telefono_Proveedor, Email_Proveedor);

END//
DELIMITER ;