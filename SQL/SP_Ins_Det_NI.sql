DROP PROCEDURE IF EXISTS Inserta_Det_NI;
DELIMITER //
CREATE PROCEDURE Inserta_Det_NI(ID_Encabezado_NI VARCHAR(30), ID_Kiosco VARCHAR(15), Cod_Producto VARCHAR(25), Cantidad INT, Total_Detalle DECIMAL(8,2), Precio_Unit DECIMAL(8,2))
BEGIN
	
    DECLARE Existe INT DEFAULT 0;
    DECLARE Num_Detalle INT DEFAULT 0;
    DECLARE i INT;
    
    SET Existe = (SELECT 
					COUNT(Linea_Detalle_Encabezado_NI) Registros 
				  FROM 
					detalle_encabezado_ni 
				  WHERE 
					Encabezado_NI_ID_Encabezado_NI = ID_Encabezado_NI);
                    
	IF Existe = 0 THEN
		SET Num_Detalle = 1;
	ELSE
		SET Num_Detalle = Existe + 1;
    END IF;
    
    INSERT INTO copycat.detalle_encabezado_ni
				(Linea_Detalle_Encabezado_NI,
				Encabezado_NI_ID_Encabezado_NI,
				Encabezado_NI_Kiosco_ID_Kiosco,
				Producto_Servicio_Cod_Producto_Servicio,
				Cantidad_Detalle_Encabezado_NI,
				Costo_Total_Detalle_Encabezado_NI)
	VALUES
				(Num_Detalle,
                 ID_Encabezado_NI,
                 ID_Kiosco,
                 Cod_Producto,
                 Cantidad,
                 Total_Detalle);

    
    SET i = 1;
    WHILE i <= Cantidad DO
        
        INSERT INTO copycat.linea_detalle_encabezado_ni
				   (Num_Linea_Detalle_Encabezado_NI,
					Detalle_Encabezado_NI_ID_Encabezado_Nota_Ingreso,
					Detalle_Encabezado_NI_Kiosko_ID_Kiosko,
					Detalle_Encabezado_NI_Linea_Detalle_Encabezado_NI,
					Precio_Unitario_Linea_Detalle_Encabezado_NI)
					VALUES
				   (i,
                   ID_Encabezado_NI,
                   ID_Kiosco,
                   Num_Detalle,
                   Precio_Unit);

		SET i = i + 1;
        
    END WHILE;
    
END//
DELIMITER ;