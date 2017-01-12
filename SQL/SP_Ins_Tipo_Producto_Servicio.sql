DROP PROCEDURE IF EXISTS Inserta_Tipo_Producto_Servicio;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Producto_Servicio(Descripcion_Tipo_Producto_Servicio varchar(30))
BEGIN

	INSERT INTO copycat.tipo_producto
			(Descripcion_Tipo_Producto)
	VALUES
			(Descripcion_Tipo_Producto_Servicio);

END//
DELIMITER ;