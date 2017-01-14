DROP PROCEDURE IF EXISTS Inserta_Tipo_Incidencia;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Incidencia(ID_Tipo_Incidencia int(11), Descripcion_Tipo_Incidencia varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Incidencia, Descripcion_Tipo_Incidencia)
    VALUES (ID_Tipo_Incidencia, Descripcion_Tipo_Incidencia);

END//
DELIMITER ;