DROP PROCEDURE IF EXISTS Select_All_Concepto_Transaccion_Monetaria;
DELIMITER //
CREATE PROCEDURE Select_All_Concepto_Transaccion_Monetaria(ID_Concepto int(11), Descripcion_Concepto varchar(50))
BEGIN
	SELECT * FROM concepto_transaccion_monetaria;
END//
DELIMITER ;