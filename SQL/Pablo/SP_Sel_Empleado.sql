DROP PROCEDURE IF EXISTS Select_All_Empleado;
DELIMITER //
CREATE PROCEDURE Select_All_Empleado(ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN
	SELECT * FROM empleado;
END//
DELIMITER ;