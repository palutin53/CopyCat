DROP PROCEDURE IF EXISTS Select_ID_Enc_Existencia;
DELIMITER //
CREATE PROCEDURE Select_ID_Enc_Existencia(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT 
		ID_Encabezado_Existencia
	FROM
		encabezado_existencia
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Existencia DESC
	LIMIT 1;
END//
DELIMITER ;