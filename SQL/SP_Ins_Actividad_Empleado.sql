DROP PROCEDURE IF EXISTS Inserta_Actividad_Empleado;
DELIMITER //
CREATE PROCEDURE Inserta_Actividad_Empleado(Tipo_Actividad INT, Empleado_ID INT, Justificacion VARCHAR(50))
BEGIN

	INSERT INTO copycat.actividad_empleado
				(Fecha_Actividad, Tipo_Actividad_ID_Tipo_Actividad, Empleado_ID_Empleado, Justificacion_Actividad_Empleado)
	VALUES
				(NOW(),Tipo_Actividad,Empleado_ID, Justificacion);

END//
DELIMITER ;