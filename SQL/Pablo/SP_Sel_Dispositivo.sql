DROP PROCEDURE IF EXISTS Select_Dispositivo;
DELIMITER //
CREATE PROCEDURE Select_Dispositivo(ID_Dispositivo varchar(10), ID_Kiosco varchar(15), Descripcion_Dispositivo varchar(45), Serie_Dispositivo varchar(75))
BEGIN

	SELECT * FROM dispositivo;

END//
DELIMITER ;