DROP PROCEDURE IF EXISTS Inserta_Dispositivo;
DELIMITER //
CREATE PROCEDURE Inserta_Dispositivo(ID_Dispositivo varchar(10), ID_Kiosco varchar(15), Descripcion_Dispositivo varchar(45), Serie_Dispositivo varchar(75))
BEGIN

	INSERT INTO dispositivo(ID_Dispositivo, Kiosco_ID_Kiosco, Descripcion_Dispositivo, Serie_Dispositivo)
    VALUES (ID_Dispositivo, ID_Kiosco, Descripcion_Dispositivo, Serie_Dispositivo);

END//
DELIMITER ;