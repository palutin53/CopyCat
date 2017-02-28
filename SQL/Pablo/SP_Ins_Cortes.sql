DROP PROCEDURE IF EXISTS Inserta_Cortes;
DELIMITER //
CREATE PROCEDURE Inserta_Cortes(ID_Producto VARCHAR(15), Encabezado_Fact varchar(30), Kiosco_ID varchar(15), Empleado_ID int(11))
BEGIN

	DECLARE G_Corte CHAR(1);
    DECLARE T_Corte INT;
    
    SET G_Corte = ( SELECT 
						Genera_Corte_Producto_Servicio 
					FROM 
						producto_servicio 
					WHERE 
						Cod_Producto_Servicio = ID_Producto);
	
    IF G_Corte = 's' THEN
    
		SET T_Corte = (SELECT Cortes_Totales FROM cortes WHERE Encabezado_Factura_Kiosco_ID_Kiosco = Kiosco_ID ORDER BY Fecha_Cortes DESC LIMIT 1);
		SET T_Corte = T_Corte + 1;
        
        INSERT INTO copycat.cortes
			   (Encabezado_Factura_Num_Encabezado_Factura, 
                Encabezado_Factura_Kiosco_ID_Kiosco, 
                Encabezado_Factura_Empleado_ID_Empleado, 
                Fecha_Cortes, 
                Cortes_Totales)
		VALUES 
			   (Encabezado_Fact, 
                Kiosco_ID, 
                Empleado_ID, 
                NOW(), 
                T_Corte);
        
    END IF;
    

END//
DELIMITER ;