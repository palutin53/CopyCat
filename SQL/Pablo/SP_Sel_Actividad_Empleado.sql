DROP PROCEDURE IF EXISTS Select_Actividad_Empleado;
DELIMITER //
CREATE PROCEDURE Select_Actividad_Empleado(Fecha_Actividad date, Tipo_Actividad int(11), Empleado_ID int(11))
BEGIN

	SELECT * FROM actividad_empleado;

END//
DELIMITER ;