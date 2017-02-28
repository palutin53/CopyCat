DROP PROCEDURE IF EXISTS Select_Info_Enc_NI;
DELIMITER //
CREATE PROCEDURE Select_Info_Enc_NI(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT 
		ID_Encabezado_Nota_Ingreso
	FROM
		encabezado_nota_ingreso
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Nota_Ingreso DESC
	LIMIT 1;
END//
DELIMITER ;