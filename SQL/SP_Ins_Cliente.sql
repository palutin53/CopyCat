DROP PROCEDURE IF EXISTS Inserta_Cliente;
DELIMITER //
CREATE PROCEDURE Inserta_Cliente(Tipo_Cliente int(11), Nombre_Clientes varchar(50), Direccion_Clientes varchar(30), Nit_Clientes varchar(45), Telefono_Clientes varchar(15), Correo_Clientes varchar(75), OUT ID_Clientes INT)
BEGIN
	DECLARE ID INT DEFAULT 0;
	INSERT INTO cliente
			   (Tipo_Cliente_ID_Tipo_Cliente, 
                Nombre_Cliente, 
                Direccion_Cliente, 
                Nit_Cliente, 
                Telefono_Cliente, 
                Correo_Cliente)
    VALUES 	   (Tipo_Cliente,
                Nombre_Clientes,
                Direccion_Clientes,
                Nit_Clientes,
                Telefono_Clientes,
                Correo_Clientes);

	SET ID_Clientes = LAST_INSERT_ID();
    SELECT ID_Clientes INTO ID;

END//
DELIMITER ;