DROP PROCEDURE IF EXISTS Inserta_Detalle_Incidencia;
DELIMITER //
CREATE PROCEDURE Inserta_Detalle_Incidencia(Cod_Producto VARCHAR(25), ID_Kiosco VARCHAR(15))
BEGIN

	DECLARE ID_Inc INT DEFAULT 0;
    
	SET ID_Inc = (SELECT 
					ID_Incidencia 
				  FROM 
					incidencia 
				  WHERE Encabezado_Factura_ID_Kiosco = ID_Kiosco 
                  ORDER BY Fecha_Incidencia DESC LIMIT 1);
    
	INSERT INTO copycat.producto_incidencia
			   (Incidencia_ID_Incidencia,
				Producto_Servicio_Cod_Producto_Servicio)
				VALUES
			   (ID_Inc,
                Cod_Producto
               );

END//
DELIMITER ;