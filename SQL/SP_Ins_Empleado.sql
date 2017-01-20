DROP PROCEDURE IF EXISTS Inserta_Empleado;
DELIMITER //
CREATE PROCEDURE Inserta_Empleado(ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN

	INSERT INTO empleado(Kiosco_ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base_Empleado)
    VALUES (ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base);

END//
DELIMITER ;