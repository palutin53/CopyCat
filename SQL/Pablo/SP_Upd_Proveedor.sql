DROP PROCEDURE IF EXISTS Actualiza_Proveedor;
DELIMITER //
CREATE PROCEDURE Actualiza_Proveedor(ID_Proveedor int(11), Descripcion_Proveedor varchar(75), NIT_Proveedor varchar(15), Telefono_Proveedor varchar(15), Email_Proveedor varchar(75))
BEGIN
	UPDATE 
		copycat.cliente
	SET
		Descripcion_Proveedor = Descripcion_Proveedor,
		NIT_Proveedor = NIT_Proveedor,
		Telefono_Proveedor = Telefono_Proveedor,
		Email_Proveedor = Email_Proveedor
	WHERE 
		ID_Proveedor = ID_Proveedor;

END//
DELIMITER ;