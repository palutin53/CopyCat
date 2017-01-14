DROP PROCEDURE IF EXISTS Select_All_Proveedor;
DELIMITER //
CREATE PROCEDURE Select_All_Proveedor(ID_Proveedor int(11), Descripcion_Proveedor varchar(75), NIT_Proveedor varchar(15), Telefono_Proveedor varchar(15), Email_Proveedor varchar(75))
BEGIN
	SELECT * FROM proveedor;
END//
DELIMITER ;