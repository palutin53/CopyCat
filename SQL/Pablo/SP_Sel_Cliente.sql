DROP PROCEDURE IF EXISTS Select_All_Cliente;
DELIMITER //
CREATE PROCEDURE Select_All_Cliente()
BEGIN
	SELECT * FROM cliente;
END//
DELIMITER ;