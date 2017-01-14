DROP PROCEDURE IF EXISTS Select_ID_Proveedor;
DELIMITER //
CREATE PROCEDURE Select_ID_Proveedor(Proveedor_ID int(11))
BEGIN
	SELECT * FROM proveedor WHERE ID_Proveedor = Proveedor_ID;
END//
DELIMITER ;