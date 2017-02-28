DROP FUNCTION IF EXISTS Fn_Calcular_Comision;
DELIMITER //
CREATE FUNCTION Fn_Calcular_Comision(Cod_Producto VARCHAR(25)) RETURNS DECIMAL(8,2)
BEGIN
	
    DECLARE Genera_Comision CHAR(1);
    DECLARE Total_Comision DECIMAL(8,2);
    DECLARE Precio_Producto DECIMAL(8,2);
    DECLARE comision DECIMAL(8,2) DEFAULT 0.05;
    
    SET Genera_Comision = ( SELECT 
								Genera_Comision_Producto_Servicio 
							FROM 
								producto_servicio 
							WHERE 
								Cod_Producto_Servicio = Cod_Producto);
                                
	IF Genera_Comision = 's' THEN
		
        SET Precio_Producto = (	SELECT 
									Precio_Producto_Servicio 
								FROM 
									producto_servicio 
								WHERE 
									Cod_Producto_Servicio = Cod_Producto);
                                    
		SET Total_Comision = Precio_Producto * comision;
                                    
	ELSE
		SET Total_Comision = 0.00;
    END IF;
    
    RETURN Total_Comision;
    
END//
DELIMITER ;