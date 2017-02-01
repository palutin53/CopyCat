DROP PROCEDURE IF EXISTS Inserta_Estudio_Mercado;
DELIMITER //
CREATE PROCEDURE Inserta_Estudio_Mercado(Descripcion_Estudio varchar(50))
BEGIN

	INSERT INTO copycat.estudio_mercado
				(Detalle_Estudio_Mercado)
	VALUES
				(Descripcion_Estudio);


END//
DELIMITER ;