DROP PROCEDURE IF EXISTS Select_ID_Dispositivo;
DELIMITER //
CREATE PROCEDURE Select_ID_Dispositivo(Empleado_ID VARCHAR(15))
BEGIN
	SELECT * FROM dispositivo WHERE ID_Dispositivo = ID_Dispositivo;
END//
DELIMITER ;