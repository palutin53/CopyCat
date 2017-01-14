DROP PROCEDURE IF EXISTS Actualiza_Concepto_Transaccion_Monetaria;
DELIMITER //
CREATE PROCEDURE Actualiza_Concepto_Transaccion_Monetaria(ID_Concepto int(11), Descripcion_Concepto varchar(50))
BEGIN
	UPDATE 
		copycat.concepto_transaccion_monetaria
	SET
		Descripcion_Concepto_Transaccion_Monetaria = Descripcion_Concepto
	WHERE 
		ID_Concepto = ID_Concepto;

END//
DELIMITER ;