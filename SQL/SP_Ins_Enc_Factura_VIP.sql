DROP PROCEDURE IF EXISTS Inserta_Enc_Factura_VIP;
DELIMITER //
CREATE PROCEDURE Inserta_Enc_Factura_VIP(Kiosco_ID_Kioscos VARCHAR(15), ID_Empleado INT, Tipo_Pago INT, ID_Cliente INT, Num_Factura VARCHAR(30), Estudio INT, Descuento DECIMAL(8,2), Total DECIMAL(8,2))
BEGIN

DECLARE Encabezado_ID VARCHAR(30) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;
DECLARE Fecha_Fact DATETIME DEFAULT NOW();

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
				Num_Factura_Encabezado_Factura,
                Estudio_Mercado_ID_Estudio_Mercado,
                Descuento_Encabezado_Factura,
                Total_Venta_Encabezado_Factura,
                VIP_Encabezado_Factura)
	VALUES
				(Encabezado_ID,
                 Kiosco_ID_Kioscos,
                 ID_Empleado,
                 Tipo_Pago,
                 ID_Cliente,
                 Fecha_Fact,
                 Num_Factura,
                 Estudio,
                 Descuento,
                 Total,
                 's');

	SELECT 
		Num_Encabezado_Factura 
    FROM 
		encabezado_factura 
    WHERE 
		Kiosco_ID_Kiosco = Kiosco_ID_Kioscos 
    AND 
		Fecha_Encabezado_Factura = Fecha_Fact;

END//
DELIMITER ;