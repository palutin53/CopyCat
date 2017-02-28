DROP PROCEDURE IF EXISTS Inserta_Transaccion_Monetaria;
DELIMITER //
CREATE PROCEDURE Inserta_Transaccion_Monetaria(Kiosco_ID VARCHAR(15), Tipo_Transaccion INT, Concepto_Transaccion INT, Descripcion VARCHAR(200), No_Boleta VARCHAR(45), Monto DECIMAL(8,2))
BEGIN

	INSERT INTO copycat.transaccion_monetaria
			   (Kiosco_ID_Kiosco,
				ID_Tipo_Transaccion_Monetaria,
				ID_Concepto_Transaccion_Monetaria,
				Fecha_Transaccion_Monetaria,
				Descripcion_Transaccion_Monetaria,
				No_Boleta_Transaccion_Monetaria,
				Monto_Transaccion_Monetaria)
	VALUES
			   (Kiosco_ID,
                Tipo_Transaccion,
                Concepto_Transaccion,
                NOW(),
                Descripcion,
                No_Boleta,
                Monto);

END//
DELIMITER ;