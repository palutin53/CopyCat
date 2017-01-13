DROP PROCEDURE IF EXISTS Inserta_Tipo_Actividad;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Actividad(Descripcion_Tipo_Actividad VARCHAR(50))
BEGIN

	INSERT INTO copycat.tipo_actividad
			(Descripcion_Tipo_Actividad)
	VALUES
			(Descripcion_Tipo_Actividad);

END//
DELIMITER ;