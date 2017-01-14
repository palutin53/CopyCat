DROP PROCEDURE IF EXISTS Actualiza_Cliente;
DELIMITER //
CREATE PROCEDURE Actualiza_Cliente(ID_Cliente int(11), Tipo_Cliente int(11), Nombre_Cliente varchar(50), Direccion_Cliente varchar(30), Nit_Cliente varchar(45), Telefono_Cliente varchar(15), Correo_Cliente varchar(75))
BEGIN
	UPDATE 
		copycat.cliente
	SET
		Kiosco_ID_Kiosco = ID_Kiosco,
		Nombre_Empleado = Nombre_Empleado,
		Apellido_Empleado = Apellido_Empleado,
		DPI_Empleado = DPI_Empleado,
		Telefono_Empleado = Telefono_Empleado,
		Email_Empleado = Email_Empleado,
		Salario_Base_Empleado = Salario_Base
	WHERE 
		ID_Empleado = ID_Empleado;

END//
DELIMITER ;