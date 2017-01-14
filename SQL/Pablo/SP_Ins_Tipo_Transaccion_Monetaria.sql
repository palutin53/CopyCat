DROP PROCEDURE IF EXISTS Inserta_Tipo_Transaccion_Monetaria;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Actividad(ID_Tipo_Transaccion_Monetaria int(11), Descripcion_Tipo_Transaccion_Monetaria varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Transaccion_Monetaria, Descripcion_Tipo_Transaccion_Monetaria)
    VALUES (ID_Tipo_Transaccion_Monetaria, Descripcion_Tipo_Transaccion_Monetaria);

END//
DELIMITER ;