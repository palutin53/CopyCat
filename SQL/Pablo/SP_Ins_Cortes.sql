DROP PROCEDURE IF EXISTS Inserta_Cortes;
DELIMITER //
CREATE PROCEDURE Inserta_Cortes(ID_Cortes int(11), Factura_Num varchar(30), Factura_Kiosco_ID varchar(15), Factura_Empleado_ID int(11), Fecha_Cortes date, Cortes_Totales int(11))
BEGIN

	INSERT INTO dispositivo(ID_Cortes, Encabezado_Factura_Num_Encabezado_Factura, Encabezado_Factura_Kiosco_ID_Kiosco, Encabezado_Factura_Empleado_ID_Empleado, Fecha_Cortes, Cortes_Totales)
    VALUES (ID_Cortes, Factura_Num, Factura_Kiosco_ID, Factura_Empleado_ID, Fecha_Cortes, Cortes_Totales);

END//
DELIMITER ;