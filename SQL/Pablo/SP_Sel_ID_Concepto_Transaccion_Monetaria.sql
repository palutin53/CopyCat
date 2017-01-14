DROP PROCEDURE IF EXISTS Select_ID_Concepto_Transaccion_Monetaria;
DELIMITER //
CREATE PROCEDURE Select_ID_Concepto_Transaccion_Monetaria(ID_Concepto int(11))
BEGIN
	SELECT * FROM concepto_transaccion_monetaria WHERE ID_Concepto = ID_Concepto;
END//
DELIMITER ;