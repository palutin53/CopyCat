DROP PROCEDURE IF EXISTS Select_Info_Proveedor;
DELIMITER //
CREATE PROCEDURE Select_Info_Proveedor(Nit_Proveedorx VARCHAR(15))
BEGIN
	SELECT 
		ID_Proveedor, Descripcion_Proveedor, NIT_Proveedor, Telefono_Proveedor, Email_Proveedor, Nombre_Contacto_Proveedor
	FROM 
		proveedor
	WHERE NIT_Proveedor = Nit_Proveedorx;
END//
DELIMITER ;