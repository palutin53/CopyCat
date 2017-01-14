DROP PROCEDURE IF EXISTS Inserta_Tipo_Actividad;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Actividad(ID_Tipo_Actividad int(11), Descripcion_Tipo_Actividad varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Actividad, Descripcion_Tipo_Actividad)
    VALUES (ID_Tipo_Actividad, Descripcion_Tipo_Actividad);

END//
DELIMITER ;