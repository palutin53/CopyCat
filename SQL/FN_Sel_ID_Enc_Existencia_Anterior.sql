DROP FUNCTION IF EXISTS Fn_Select_ID_Enc_Existencia_Anterior;
DELIMITER //
CREATE FUNCTION Fn_Select_ID_Enc_Existencia_Anterior(Kiosco_ID VARCHAR(15)) RETURNS VARCHAR(15)
BEGIN
	DECLARE Encabezado VARCHAR(15);
    
    SET Encabezado = (SELECT 
		ID_Encabezado_Existencia
	FROM
		encabezado_existencia
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Existencia DESC
	LIMIT 1, 1);
    
    RETURN Encabezado;
    
END//
DELIMITER ;