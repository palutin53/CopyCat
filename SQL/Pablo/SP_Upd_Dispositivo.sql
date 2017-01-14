DROP PROCEDURE IF EXISTS Actualiza_Dispositivo;
DELIMITER //
CREATE PROCEDURE Actualiza_Dispositivo(ID_Dispositivo varchar(10), ID_Kiosco varchar(15), Descripcion_Dispositivo varchar(45), Serie_Dispositivo varchar(75))
BEGIN
	UPDATE 
		copycat.dispositivo
	SET	
		Kiosco_ID_Kiosco = ID_Kiosco,	
		Descripcion_Dispositivo = Descripcion_Dispositivo,
		Serie_Dispositivo = Serie_Dispositivo
	WHERE 
		ID_Dispositivo = ID_Dispositivo;

END//
DELIMITER ;