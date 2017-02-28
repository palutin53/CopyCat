DROP FUNCTION IF EXISTS Fn_Efectivo_Caja;
DELIMITER //
CREATE FUNCTION Fn_Efectivo_Caja(ID_Kiosco VARCHAR(15)) RETURNS DECIMAL(8,2)
BEGIN
	DECLARE Mov_Ingreso DECIMAL(8,2);
    DECLARE Mov_Retiro DECIMAL(8,2);
    DECLARE Total DECIMAL(8,2);
    
		SET Mov_Ingreso = (SELECT
								IFNULL(SUM(tm.Monto_Transaccion_Monetaria), 0) TOTAL_DIA
							FROM
								transaccion_monetaria tm
									INNER JOIN
								kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
									INNER JOIN
								tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
									INNER JOIN
								concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
							WHERE tm.Kiosco_ID_Kiosco = ID_Kiosco 
							AND tm.ID_Tipo_Transaccion_Monetaria = 1);
                                    
		SET Mov_Retiro = (SELECT
								IFNULL(SUM(tm.Monto_Transaccion_Monetaria), 0) TOTAL_RERITOS_CAJA
							FROM
								transaccion_monetaria tm
									INNER JOIN
								kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
									INNER JOIN
								tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
									INNER JOIN
								concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
							WHERE tm.Kiosco_ID_Kiosco = ID_Kiosco 
                            AND tm.ID_Tipo_Transaccion_Monetaria IN (4,5,6,7));
                            
		SET Total = Mov_Ingreso - Mov_Retiro;
    
    RETURN Total;
    
END//
DELIMITER ;