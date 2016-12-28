DROP PROCEDURE IF EXISTS Inserta_Kiosco;
DELIMITER //
CREATE PROCEDURE Inserta_Kiosco(Descripcion VARCHAR(50), Telefono varchar(15), Horario_Ingreso TIME, Horario_Salida TIME, Horario_Max TIME)
BEGIN

DECLARE Kiosco_ID VARCHAR(10);
DECLARE ID_Nuevo INT DEFAULT 0;

	SET Kiosco_ID = SUBSTRING(Descripcion,1,4);
    SET ID_Nuevo = (SELECT count(ID_Kiosco) Registros FROM Kiosco WHERE ID_Kiosco LIKE CONCAT(Kiosco_ID,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Kiosco_ID = CONCAT(Kiosco_ID, '-',ID_Nuevo);
    ELSE
		SET Kiosco_ID = CONCAT(Kiosco_ID, '-','1');
    END IF;

	INSERT INTO Kiosco(ID_Kiosco, Descripcion_Kiosco, Telefono_Kiosco, Horario_Ingreso_Kiosco, Horario_Salida_Kiosco, Horario_Max_Ingreso_Kiosco)
    VALUES (Kiosco_ID, Descripcion, Telefono, Horario_Ingreso, Horario_Salida, Horario_Max);

END//
DELIMITER ;