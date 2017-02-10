DROP PROCEDURE IF EXISTS Inserta_Producto_Servicio;
DELIMITER //
CREATE PROCEDURE Inserta_Producto_Servicio(ID_Producto VARCHAR(25), Tipo_Producto_ID_Tipo_Producto int(11), Descripcion_Producto_Servicio varchar(75), Precio_Producto_Servicio decimal(8,2), Genera_Comision_Producto_Servicio char(1), Img_Producto_Servicio varchar(75), Domicilio_Producto_Servicio char(1), Genera_Corte_Producto_Servicios char(1))
BEGIN

DECLARE ID_Nuevo INT DEFAULT 0;

	INSERT INTO copycat.producto_servicio
			(Cod_Producto_Servicio, 
			 Tipo_Producto_ID_Tipo_Producto, 
			 Descripcion_Producto_Servicio, 
			 Precio_Producto_Servicio,
			 Genera_Comision_Producto_Servicio,
			 Img_Producto_Servicio,
			 Domicilio_Producto_Servicio,
             Genera_Corte_Producto_Servicio)
	VALUES
			(ID_Producto, 
			Tipo_Producto_ID_Tipo_Producto, 
			Descripcion_Producto_Servicio, 
			Precio_Producto_Servicio, 
			Genera_Comision_Producto_Servicio, 
			Img_Producto_Servicio, 
			Domicilio_Producto_Servicio,
            Genera_Corte_Producto_Servicios);


END//
DELIMITER ;