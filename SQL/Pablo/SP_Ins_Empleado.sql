DROP PROCEDURE IF EXISTS Inserta_Empleado;
DELIMITER //
CREATE PROCEDURE Inserta_Empleado(ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN

DECLARE Empleado_ID VARCHAR(11);
DECLARE ID_Nuevo INT DEFAULT 0;

	SET Empleado_ID = SUBSTRING(Nombre_Empleado,1,4);
    SET ID_Nuevo = (SELECT count(ID_Empleado) Registros FROM empleado WHERE ID_Empleado LIKE CONCAT(Empleado_ID,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Empleado_ID = CONCAT(Empleado_ID, '-',ID_Nuevo);
    ELSE
		SET Empleado_ID = CONCAT(Empleado_ID, '-','1');
    END IF;

	INSERT INTO empleado(ID_Empleado, Kiosco_ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base_Empleado)
    VALUES (Empleado_ID, ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base);

END//
DELIMITER ;