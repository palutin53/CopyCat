DROP PROCEDURE IF EXISTS Select_Info_Cliente;
DELIMITER //
CREATE PROCEDURE Select_Info_Cliente(Nit_Clientes VARCHAR(45))
BEGIN
	SELECT 
		ID_Cliente, Nombre_Cliente, Direccion_Cliente, Nit_Cliente, Telefono_Cliente, Correo_Cliente 
	FROM 
		cliente
	WHERE Nit_Cliente = Nit_Clientes;
END//
DELIMITER ;