DROP PROCEDURE IF EXISTS Select_Planilla;
DELIMITER //
CREATE PROCEDURE Select_Planilla(Empleado_ID int(11), Fecha_Planilla date, IGGS_Planilla decimal(8.2), Irtra_Planilla decimal(8.2), Intecap_Planilla decimal(8.2), Bonificacion_Planilla decimal(8.2), Descuento_Planilla decimal(8.2), Comision_Planilla decimal(8.2))
BEGIN

	SELECT * FROM planilla;

END//
DELIMITER ;