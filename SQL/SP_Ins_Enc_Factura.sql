DROP PROCEDURE IF EXISTS Inserta_Enc_Factura;
DELIMITER //
CREATE PROCEDURE Inserta_Enc_Factura(Kiosco_ID_Kioscos VARCHAR(15), ID_Empleado INT, Tipo_Pago INT, ID_Cliente INT, Num_Factura VARCHAR(30))
BEGIN

DECLARE Encabezado_ID VARCHAR(30) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;

    SET ID_Nuevo = (SELECT 
						count(Num_Encabezado_Factura) Registros 
					FROM Encabezado_Factura 
                    WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kioscos,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-FA',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-FA','1');
    END IF;

	INSERT INTO copycat.encabezado_factura
				(Num_Encabezado_Factura,
				Kiosco_ID_Kiosco,
				Empleado_ID_Empleado,
				Tipo_Pago_ID_Tipo_Pago,
				Cliente_ID_Cliente,
				Fecha_Encabezado_Factura,
				Num_Factura_Encabezado_Factura)
	VALUES
				(Encabezado_ID,
                 Kiosco_ID_Kioscos,
                 ID_Empleado,
                 Tipo_Pago,
                 ID_Cliente,
                 NOW(),
                 Num_Factura);


END//
DELIMITER ;