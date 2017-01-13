DROP PROCEDURE IF EXISTS Inserta_Atencion_Kiosco;
DELIMITER //
CREATE PROCEDURE Inserta_Atencion_Kiosco(Kiosco_ID VARCHAR(15), Empleado_ID INT)
BEGIN

	INSERT INTO copycat.atencion_kiosco
				(Fecha_Atencion_Kiosco, Kiosco_ID_Kiosco, Empleado_ID_Empleado)
	VALUES
				(NOW(),Kiosco_ID,Empleado_ID);

END//
DELIMITER ;