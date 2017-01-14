DROP PROCEDURE IF EXISTS Inserta_Planilla;
DELIMITER //
CREATE PROCEDURE Inserta_Planilla(Empleado_ID int(11), Fecha_Planilla date, IGGS_Planilla decimal(8.2), Irtra_Planilla decimal(8.2), Intecap_Planilla decimal(8.2), Bonificacion_Planilla decimal(8.2), Descuento_Planilla decimal(8.2), Comision_Planilla decimal(8.2))
BEGIN

	INSERT INTO acividad_empleado(Empleado_ID_Empleado, Fecha_Planilla, IGGS_Planilla, Irtra_Planilla, Intecap_Planilla, Bonificacion_Planilla, Descuento_Planilla, Comision_Planilla)
    VALUES (Empleado_ID, Fecha_Planilla, IGGS_Planilla, Irtra_Planilla, Intecap_Planilla, Bonificacion_Planilla, Descuento_Planilla, Comision_Planilla);

END//
DELIMITER ;