DROP PROCEDURE IF EXISTS Inserta_Tipo_Pago;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Pago(Descripcion_Tipo_Pago varchar(50))
BEGIN

	INSERT INTO tipo_actividad(Descripcion_Tipo_Pago)
    VALUES(Descripcion_Tipo_Pago);

END//
DELIMITER ;