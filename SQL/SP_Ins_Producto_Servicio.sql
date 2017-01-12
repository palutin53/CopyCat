DROP PROCEDURE IF EXISTS Inserta_Producto_Servicio;
DELIMITER //
CREATE PROCEDURE Inserta_Producto_Servicio(Tipo_Producto_ID_Tipo_Producto int(11), Descripcion_Producto_Servicio varchar(75), Precio_Producto_Servicio decimal(8,2), Genera_Comision_Producto_Servicio char(1), Img_Producto_Servicio varchar(75), Domicilio_Producto_Servicio char(1))
BEGIN

DECLARE ID_Nuevo INT DEFAULT 0;

    SET ID_Nuevo = (SELECT count(Cod_Producto_Servicio) Registros FROM producto_servicio);
    
    SET ID_Nuevo = ID_Nuevo + 1;

	INSERT INTO copycat.producto_servicio
			(Cod_Producto_Servicio, 
			 Tipo_Producto_ID_Tipo_Producto, 
			 Descripcion_Producto_Servicio, 
			 Precio_Producto_Servicio,
			 Genera_Comision_Producto_Servicio,
			 Img_Producto_Servicio,
			 Domicilio_Producto_Servicio)
	VALUES
			(ID_Nuevo, 
			Tipo_Producto_ID_Tipo_Producto, 
			Descripcion_Producto_Servicio, 
			Precio_Producto_Servicio, 
			Genera_Comision_Producto_Servicio, 
			Img_Producto_Servicio, 
			Domicilio_Producto_Servicio);


END//
DELIMITER ;

