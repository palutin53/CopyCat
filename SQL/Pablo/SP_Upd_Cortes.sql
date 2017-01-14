DROP PROCEDURE IF EXISTS Actualiza_Cortes;
DELIMITER //
CREATE PROCEDURE Actualiza_Cortes(ID_Cortes int(11), Factura_Num varchar(30), Factura_Kiosco_ID varchar(15), Factura_Empleado_ID int(11), Fecha_Cortes date, Cortes_Totales int(11))
BEGIN
	UPDATE 
		copycat.cortes
	SET
		Encabezado_Factura_Num_Encabezado_Factura = Factura_Num,
		Encabezado_Factura_Kiosco_ID_Kiosco = Factura_Kiosco_ID,
		Encabezado_Factura_Empleado_ID_Empleado = Factura_Empleado_ID,
		Fecha_Cortes = Fecha_Cortes,
		Cortes_Totales = Cortes_Totales
	WHERE 
		ID_Cortes = ID_Cortes;

END//
DELIMITER ;