DROP PROCEDURE IF EXISTS Inserta_Enc_Existencia;
DELIMITER //
CREATE PROCEDURE Inserta_Enc_Existencia(Kiosco_ID_Kioscos VARCHAR(15), Fecha_Encabezado_Existencias DATETIME)
BEGIN

DECLARE Existe INT DEFAULT 0;
DECLARE Encabezado_ID VARCHAR(10) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;

SET Existe = (SELECT 
				count(ID_Encabezado_Existencia) Cantidad 
			  FROM encabezado_existencia 
              WHERE Kiosco_ID_Kiosco = Kiosco_ID_Kioscos 
              AND Fecha_Encabezado_Existencia = Fecha_Encabezado_Existencias);

IF Existe = 0 THEN

    SET ID_Nuevo = (SELECT 
						count(ID_Encabezado_Existencia) Registros 
					FROM encabezado_existencia 
                    WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kioscos,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-E',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-E','1');
    END IF;

	INSERT INTO copycat.encabezado_existencia(ID_Encabezado_Existencia,	Kiosco_ID_Kiosco, Fecha_Encabezado_Existencia)
	VALUES(Encabezado_ID, Kiosco_ID_Kioscos, Fecha_Encabezado_Existencias);
END IF;

END//
DELIMITER ;