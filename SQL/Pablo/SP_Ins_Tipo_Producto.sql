DROP PROCEDURE IF EXISTS Inserta_Tipo_Producto;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Producto(ID_Tipo_Producto int(11), Descripcion_Tipo_Producto varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Producto, Descripcion_Tipo_Producto)
    VALUES (ID_Tipo_Producto, Descripcion_Tipo_Producto);

END//
DELIMITER ;