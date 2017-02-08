DROP PROCEDURE IF EXISTS Select_ProdServ_ID;
DELIMITER //
CREATE PROCEDURE Select_ProdServ_ID(ID_Prod VARCHAR(25))
BEGIN

	SELECT * FROM producto_servicio
    WHERE Cod_Producto_Servicio = ID_Prod;

END//
DELIMITER ;