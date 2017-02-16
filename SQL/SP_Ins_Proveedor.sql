DROP PROCEDURE IF EXISTS Inserta_Proveedor;
DELIMITER //
CREATE PROCEDURE Inserta_Proveedor(Descripcion VARCHAR(75), NIT VARCHAR(15), Telefono VARCHAR(15), Email VARCHAR(75), Nombre_Contacto VARCHAR(75), OUT ID_Proveedorx INT)
BEGIN

	DECLARE ID INT DEFAULT 0;

	INSERT INTO proveedor
			   (Descripcion_Proveedor, 
                NIT_Proveedor, 
                Telefono_Proveedor, 
                Email_Proveedor,
                Nombre_Contacto_Proveedor)
    VALUES 
			   (Descripcion, 
                NIT, 
                Telefono, 
                Email,
                Nombre_Contacto);
                
	SET ID_Proveedorx = LAST_INSERT_ID();
    SELECT ID_Proveedorx INTO ID;

END//
DELIMITER ;