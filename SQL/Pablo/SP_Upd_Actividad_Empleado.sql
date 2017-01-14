DROP PROCEDURE IF EXISTS Actualiza_Actividad_Empleado;
DELIMITER //
CREATE PROCEDURE Actualiza_Actividad_Empleado(Fecha_Actividad date, Tipo_Actividad int(11), Empleado_ID int(11))
BEGIN
	UPDATE 
		copycat.actividad_empleado
	SET		
		Tipo_Actividad_ID_Tipo_Actividad = Tipo_Actividad,
		Empleado_ID_Empleado = Empleado_ID
	WHERE 
		Fecha_Actividad = Fecha_Actividad;

END//
DELIMITER ;