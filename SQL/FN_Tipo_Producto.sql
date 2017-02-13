DROP FUNCTION IF EXISTS Fn_Tipo_Producto;
DELIMITER //
CREATE FUNCTION Fn_Tipo_Producto(Cod_Producto VARCHAR(25)) RETURNS INT
BEGIN
	
    DECLARE Tipo_Prod INT DEFAULT 0;
    
    SET Tipo_Prod = ( SELECT 
								Tipo_Producto_ID_Tipo_Producto 
							FROM 
								producto_servicio 
							WHERE 
								Cod_Producto_Servicio = Cod_Producto);
    
    RETURN Tipo_Prod;
    
END//
DELIMITER ;