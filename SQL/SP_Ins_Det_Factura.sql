DROP PROCEDURE IF EXISTS Inserta_Det_Factura;
DELIMITER //
CREATE PROCEDURE Inserta_Det_Factura(Num_Encabezado VARCHAR(30), ID_Kiosco VARCHAR(15), Empleado_ID INT, Cod_Producto VARCHAR(25), Cantidad INT, Total_Detalle DECIMAL(8,2), Precio_Unit DECIMAL(8,2))
BEGIN
	
    DECLARE Existe INT DEFAULT 0;
    DECLARE Num_Detalle INT DEFAULT 0;
    DECLARE Comision DECIMAL(8,2) DEFAULT 0.00;
    DECLARE i INT;
    
    SET Existe = (SELECT 
					COUNT(ID_Detalle_Encabezado_Factura) Registros 
				  FROM 
					detalle_encabezado_factura 
				  WHERE 
					Num_Encabezado_Factura = Num_Encabezado);
                    
	IF Existe = 0 THEN
		SET Num_Detalle = 1;
	ELSE
		SET Num_Detalle = Existe + 1;
    END IF;
    
    INSERT INTO detalle_encabezado_factura
				(ID_Detalle_Encabezado_Factura,
				Num_Encabezado_Factura,
				Factura_Kiosko_ID_Kiosko,
				Factura_Empleado_ID_Empleado,
				Producto_Servicio_Cod_Producto_Servicio,
				Cantidad_Producto_Detalle_Encabezado_Factura,
				Total_Detalle_Encabezado_Factura)
	VALUES
				(Num_Detalle,
                 Num_Encabezado,
                 ID_Kiosco,
                 Empleado_ID,
                 Cod_Producto,
                 Cantidad,
                 Total_Detalle);
    
    SET i = 1;
    WHILE i <= Cantidad DO
		
		SET Comision = (SELECT Fn_Calcular_Comision(Cod_Producto) Comision);
        
        INSERT INTO copycat.linea_detalle_encabezado_factura
				(Num_Linea_Linea_Detalle_Encabezado_Factura,
				Factura_ID_Detalle_Encabezado_Factura,
				Factura_Encabezado_Factura_Num_Encabezado_Factura,
				Factura_Encabezado_Factura_Kiosko_ID_Kiosko,
				Factura_Encabezado_Factura_Empleado_ID_Empleado,
				Precio_Unitario_Linea_Detalle_Encabezado_Factura,
				Comision_Linea_Detalle_Encabezado_Factura)
		VALUES
				(i,
                 Num_Detalle,
                 Num_Encabezado,
                 ID_Kiosco,
                 Empleado_ID,
                 Precio_Unit,
                 Comision
				);
		SET i = i + 1;
        
    END WHILE;
    
END//
DELIMITER ;