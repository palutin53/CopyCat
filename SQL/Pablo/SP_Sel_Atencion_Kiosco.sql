DROP PROCEDURE IF EXISTS Select_Atencion_Kiosco;
DELIMITER //
CREATE PROCEDURE Select_Atencion_Kiosco(Fecha_Atencion date, Kiosco_ID int(15), Empleado_ID int(11))
BEGIN

	SELECT * FROM atencion_kiosco;

END//
DELIMITER ;