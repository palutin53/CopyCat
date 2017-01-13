DROP PROCEDURE IF EXISTS Actualiza_Empleado;
DELIMITER //
CREATE PROCEDURE Actualiza_Empleado(ID_Empleado int(11), ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN
	UPDATE 
		copycat.empleado
	SET
		Kiosco_ID_Kiosco = ID_Kiosco,
		Nombre_Empleado = Nombre_Empleado,
		Apellido_Empleado = Apellido_Empleado,
		DPI_Empleado = DPI_Empleado,
		Telefono_Empleado = Telefono_Empleado,
		Email_Empleado = Email_Empleado,
		Salario_Base_Empleado = Salario_Base,
	WHERE 
		ID_Empleado = ID_Empleado;

END//
DELIMITER ;