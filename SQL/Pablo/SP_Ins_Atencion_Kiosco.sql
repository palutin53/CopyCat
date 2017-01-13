DROP PROCEDURE IF EXISTS Inserta_Atencion_Kiosco;
DELIMITER //
CREATE PROCEDURE Inserta_Atencion_Kiosco(Fecha_Atencion date, Kiosco_ID int(15), Empleado_ID int(11))
BEGIN

	INSERT INTO acividad_empleado(Fecha_Atencion_Kiosco, Kiosco_ID_Kiosco, Empleado_ID_Empleado)
    VALUES (Fecha_Atencion, Kiosco_ID, Empleado_ID);

END//
DELIMITER ;