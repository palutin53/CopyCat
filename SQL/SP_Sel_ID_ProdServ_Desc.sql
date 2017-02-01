DROP PROCEDURE IF EXISTS Select_ProdServ_Descripcion;
DELIMITER //
CREATE PROCEDURE Select_ProdServ_Descripcion(Descripcion_Prod varchar(75))
BEGIN

	SELECT * FROM producto_servicio
    WHERE Descripcion_Producto_Servicio = Descripcion_Prod;

END//
DELIMITER ;