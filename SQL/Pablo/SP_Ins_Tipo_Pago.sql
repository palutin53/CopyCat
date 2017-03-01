DROP PROCEDURE IF EXISTS Inserta_Tipo_Pago;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Pago(ID_Tipo_Pago int(11), Descripcion_Tipo_Pago varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Pago, Descripcion_Tipo_Pago)
    VALUES (ID_Tipo_Pago, Descripcion_Tipo_Pago);

END//
DELIMITER ;