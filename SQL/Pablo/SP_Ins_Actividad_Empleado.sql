DROP PROCEDURE IF EXISTS Inserta_Actividad_Empleado;
DELIMITER //
CREATE PROCEDURE Inserta_Actividad_Empleado(Fecha_Actividad date, Tipo_Actividad int(11), Empleado_ID int(11))
BEGIN

	INSERT INTO acividad_empleado(Fecha_Actividad, Tipo_Actividad_ID_Tipo_Actividad, Empleado_ID_Empleado)
    VALUES (Fecha_Actividad, Tipo_Actividad, Empleado_ID);

END//
DELIMITER ;