DROP PROCEDURE IF EXISTS Actualiza_Atencion_Kiosco;
DELIMITER //
CREATE PROCEDURE Actualiza_Atencion_Kiosco(Fecha_Atencion date, Kiosco_ID int(15), Empleado_ID int(11))
BEGIN

	UPDATE 
		copycat.atencion_kiosco
	SET		
		Fecha_Atencion_Kiosco = Fecha_Atencion,
		Kiosco_ID_Kiosco = Kiosco_ID
	WHERE 
		Empleado_ID_Empleado = Empleado_ID;

END//
DELIMITER ;