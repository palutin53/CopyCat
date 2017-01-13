DROP PROCEDURE IF EXISTS Inserta_Cliente;
DELIMITER //
CREATE PROCEDURE Inserta_Cliente(Tipo_Cliente int(11), Nombre_Cliente varchar(50), Direccion_Cliente varchar(30), Nit_Cliente varchar(45), Telefono_Cliente varchar(15), Correo_Cliente varchar(75))
BEGIN

DECLARE Cliente_ID VARCHAR(11);
DECLARE ID_Nuevo INT DEFAULT 0;

	SET Cliente_ID = SUBSTRING(Nombre_Cliente,1,4);
    SET ID_Nuevo = (SELECT count(ID_Cliente) Registros FROM cliente WHERE ID_Cliente LIKE CONCAT(Cliente_ID,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Cliente_ID = CONCAT(Cliente_ID, '-',ID_Nuevo);
    ELSE
		SET Cliente_ID = CONCAT(Cliente_ID, '-','1');
    END IF;

	INSERT INTO cliente(ID_Cliente, Tipo_Cliente_ID_Tipo_Cliente, Nombre_Cliente, Direccion_Cliente, Nit_Cliente, Telefono_Cliente, Correo_Cliente)
    VALUES (Tipo_Cliente, Nombre_Cliente, Direccion_Cliente, Nit_Cliente, Telefono_Cliente, Correo_Cliente);

END//
DELIMITER ;