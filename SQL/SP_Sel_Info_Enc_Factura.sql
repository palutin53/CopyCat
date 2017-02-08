DROP PROCEDURE IF EXISTS Select_Info_Enc_Factura;
DELIMITER //
CREATE PROCEDURE Select_Info_Enc_Factura(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT 
		Num_Encabezado_Factura
	FROM
		encabezado_factura
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Factura DESC
	LIMIT 1;
END//
DELIMITER ;