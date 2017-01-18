DROP PROCEDURE IF EXISTS Inserta_User;
DELIMITER //
CREATE PROCEDURE Inserta_User(Rol INT, Nombre VARCHAR(50), Apellido VARCHAR(50))
BEGIN
	
    DECLARE user VARCHAR(25);
    DECLARE pass VARCHAR(20);
    DECLARE Empleado_ID INT;
    
	SET user = (SELECT CONCAT(LOWER(SUBSTRING(Nombre,1,1)),LOWER(SUBSTRING(REPLACE(Apellido,' ',''),1,10))));
    SET pass = CONCAT(user,'123');
    SET Empleado_ID = (SELECT MAX(ID_Empleado) AS id FROM empleado);
    
    INSERT INTO copycat.usuario
				(Empleado_ID_Empleado,
				User_Kiosco,
				Rol_ID_Rol,
				Pswd_Usuario,
				Fecha_Alta_Usuario,
				Estado_Usuario,
                PassStandar_Usuario)
	VALUES
			    (Empleado_ID, user, Rol, AES_ENCRYPT(pass,'11'), now(),'1','1');

	
END//
DELIMITER ;