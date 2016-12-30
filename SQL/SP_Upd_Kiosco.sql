DROP PROCEDURE IF EXISTS Actualiza_Kiosco;
DELIMITER //
CREATE PROCEDURE Actualiza_Kiosco(Kiosco_ID VARCHAR(15), Descripcion VARCHAR(50), Telefono varchar(15), Horario_Ingreso TIME, Horario_Salida TIME, Horario_Max TIME)
BEGIN
	UPDATE 
		copycat.kiosco
	SET
		Descripcion_Kiosco = Descripcion,
		Telefono_Kiosco = Telefono,
		Horario_Ingreso_Kiosco = Horario_Ingreso,
		Horario_Salida_Kiosco = Horario_Salida,
		Horario_Max_Ingreso_Kiosco = Horario_Max
	WHERE 
		ID_Kiosco = Kiosco_ID;

END//
DELIMITER ;