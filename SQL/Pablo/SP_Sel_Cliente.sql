DROP PROCEDURE IF EXISTS Select_All_Cliente;
DELIMITER //
CREATE PROCEDURE Select_All_Cliente(ID_Cliente int(11), Tipo_Cliente int(11), Nombre_Cliente varchar(50), Direccion_Cliente varchar(30), Nit_Cliente varchar(45), Telefono_Cliente varchar(15), Correo_Cliente varchar(75))
BEGIN
	SELECT * FROM cliente;
END//
DELIMITER ;