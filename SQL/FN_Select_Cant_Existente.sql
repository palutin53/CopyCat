DROP FUNCTION IF EXISTS Fn_Select_Cant_Existente;
DELIMITER //
CREATE FUNCTION Fn_Select_Cant_Existente(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto VARCHAR(25)) RETURNS INT
BEGIN
	DECLARE Cant_Existente INT;
    
    SET Cant_Existente = (SELECT 
							Cantidad_Existente_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
    
    RETURN Cant_Existente;
    
END//
DELIMITER ;