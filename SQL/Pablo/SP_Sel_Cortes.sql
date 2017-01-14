DROP PROCEDURE IF EXISTS Select_All_Cortes;
DELIMITER //
CREATE PROCEDURE Select_All_Cortes(ID_Cortes int(11), Factura_Num varchar(30), Factura_Kiosco_ID varchar(15), Factura_Empleado_ID int(11), Fecha_Cortes date, Cortes_Totales int(11))
BEGIN
	SELECT * FROM cortes;
END//
DELIMITER ;