DROP FUNCTION IF EXISTS Fn_Select_Cant_Anterior;
DELIMITER //
CREATE FUNCTION Fn_Select_Cant_Anterior(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto INT) RETURNS INT
BEGIN
	DECLARE Cant_Anterior INT;
    
    SET Cant_Anterior = (SELECT 
							Cantidad_Anterior_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
    
    RETURN Cant_Anterior;
    
END//
DELIMITER ;