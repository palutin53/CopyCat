DROP FUNCTION IF EXISTS Fn_Select_Cant_Existente_Kiosco;
DELIMITER //
CREATE FUNCTION Fn_Select_Cant_Existente_Kiosco(ID_Kisco VARCHAR(15), Cod_Producto VARCHAR(25)) RETURNS INT
BEGIN
	DECLARE Cant_Existente_Kiosco INT;
    
    SET Cant_Existente_Kiosco = (  SELECT 
								Cantidad_Existente_Detalle_Existencia
							FROM
								detalle_existencia
							WHERE
								Encabezado_Existencia_Kiosco_ID_Kiosco = ID_Kisco
									AND Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
							ORDER BY Fecha_Movimiento_Detalle_Existencia DESC
							LIMIT 1);
    
    RETURN Cant_Existente_Kiosco;
    
END//
DELIMITER ;