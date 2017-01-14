DROP PROCEDURE IF EXISTS Actualiza_Planilla;
DELIMITER //
CREATE PROCEDURE Actualiza_Planilla(Empleado_ID int(11), Fecha_Planilla date, IGGS_Planilla decimal(8.2), Irtra_Planilla decimal(8.2), Intecap_Planilla decimal(8.2), Bonificacion_Planilla decimal(8.2), Descuento_Planilla decimal(8.2), Comision_Planilla decimal(8.2))
BEGIN
	UPDATE 
		copycat.planilla
	SET		
		Fecha_Planilla = Fecha_Planilla,
		IGGS_Planilla = IGGS_Planilla,
		Irtra_Planilla = Irtra_Planilla,
		Intecap_Planilla = Intecap_Planilla,
		Bonificacion_Planilla = Bonificacion_Planilla,
		Descuento_Planilla = Descuento_Planilla,
		Comision_Planilla = Comision_Planilla
	WHERE 
		Empleado_ID_Empleado = Empleado_ID;

END//
DELIMITER ;