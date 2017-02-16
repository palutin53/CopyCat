DROP FUNCTION IF EXISTS Fn_Select_ID_Proveedor;
DELIMITER //
CREATE FUNCTION Fn_Select_ID_Proveedor(Descripcion VARCHAR(75), NIT VARCHAR(15), Telefono VARCHAR(15), Email VARCHAR(75), Nombre_Contacto VARCHAR(75)) RETURNS INT
BEGIN
	DECLARE Existe INT;
    DECLARE ID INT;
    
    SET Existe = (SELECT 
						COUNT(ID_Proveedor)
					FROM
						proveedor
					WHERE
						NIT_Proveedor = NIT);
    
    IF Existe >= 1 THEN
		SET ID = (SELECT ID_Proveedor FROM proveedor WHERE NIT_Proveedor = NIT);
    ELSE
		CALL Inserta_Proveedor(Descripcion, NIT, Telefono, Email, Nombre_Contacto, @IDP);
        SELECT @IDP INTO ID;
    END IF;
    
    RETURN ID;
    
END//
DELIMITER ;