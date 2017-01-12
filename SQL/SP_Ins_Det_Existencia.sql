DROP PROCEDURE IF EXISTS Inserta_Det_Existencia;
DELIMITER //
CREATE PROCEDURE Inserta_Det_Existencia(Kiosco_ID VARCHAR(15), Cod_Producto INT, Cantidad_Movimiento INT, Tipo_Movimiento CHAR(1))
BEGIN
	
    DECLARE ID_Encabezado_Existencia VARCHAR(15);
    DECLARE ID_Detalle_Existencia INT DEFAULT 0;
    DECLARE Existe INT DEFAULT 0;
    DECLARE Cant_Anterior INT DEFAULT 0;
    DECLARE Cant_Existente INT DEFAULT 0;
    DECLARE Cant_Ins_Existencia INT DEFAULT 0;
    
    SET ID_Encabezado_Existencia = (CALL Select_ID_Enc_Existencia(Kiosco_ID));
    SET Existe = (SELECT 
						COUNT(ID_Detalle_Existencia) ID
				  FROM
						detalle_existencia
				  WHERE
						Encabezado_Existencia_id_Encabezado_Existencia = ID_Encabezado_Existencia);
	
    IF Existe >= 1 THEN
		SET ID_Detalle_Existencia = Existe + 1;
	ELSE
		SET ID_Detalle_Existencia = 0;
	END IF;
    
    SET Cant_Anterior = (SELECT 
							Cantidad_Anterior_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
                        
	SET Cant_Existente = (SELECT
							Cantidad_Existente_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
    
    IF Tipo_Movimiento = 'u' THEN
		SET Cant_Ins_Existencia = Cant_Existente + Cantidad_Movimiento;
    ELSE IF Tipo_Movimiento = 'd' THEN
		SET Cant_Ins_Existencia = Cant_Existente - Cantidad_Movimiento;
    END IF;
    
    INSERT INTO copycat.detalle_existencia
				(ID_Detalle_Existencia,
				Encabezado_Existencia_ID_Encabezado_Existencia,
				Encabezado_Existencia_Kiosco_ID_Kiosco,
				Producto_Servicio_Cod_Producto_Servicio,
				Cantidad_Anterior_Detalle_Existencia,
				Cantidad_Existente_Detalle_Existencia,
				Tipo_Mov_Detalle_Existencia)
	VALUES
				(ID_Detalle_Existencia,
                 ID_Encabezado_Existencia,
                 Kiosco_ID,
                 Cod_Producto,
                 Cant_Existente,
                 Cant_Ins_Existencia,
                 Tipo_Movimiento);

END//
DELIMITER ;
