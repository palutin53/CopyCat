DROP FUNCTION IF EXISTS Fn_Select_ID_Cliente;
DELIMITER //
CREATE FUNCTION Fn_Select_ID_Cliente(Tipo_Cliente int(11), Nombre_Clientes varchar(50), Direccion_Clientes varchar(30), Nit_Clientes varchar(45), Telefono_Clientes varchar(15), Correo_Clientes varchar(75)) RETURNS INT
BEGIN
	DECLARE Existe INT;
    DECLARE ID INT;
    
    SET Existe = (SELECT 
		COUNT(ID_Cliente)
	FROM
		cliente
	WHERE
		Nit_Cliente = Nit_Clientes);
    
    IF Existe >= 1 THEN
		SET ID = (SELECT ID_Cliente FROM cliente WHERE Nit_Cliente = Nit_Clientes);
    ELSE
		CALL Inserta_Cliente(Tipo_Cliente, Nombre_Clientes, Direccion_Clientes, Nit_Clientes, Telefono_Clientes, Correo_Clientes, @IDC);
        SELECT @IDC INTO ID;
    END IF;
    
    RETURN ID;
    
END//
DELIMITER ;