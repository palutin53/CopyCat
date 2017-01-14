DROP PROCEDURE IF EXISTS Inserta_Proveedor;
DELIMITER //
CREATE PROCEDURE Inserta_Proveedor(ID_Concepto int(11), Descripcion_Concepto varchar(50))
BEGIN

	INSERT INTO concepto_transaccion_monetaria(ID_Concepto_Transaccion_Monetaria, Descripcion_Concepto_Transaccion_Monetaria)
    VALUES (ID_Concepto, Descripcion_Concepto);

END//
DELIMITER ;