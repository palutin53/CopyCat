DROP PROCEDURE IF EXISTS Actualiza_PASS;
DELIMITER //
CREATE PROCEDURE Actualiza_PASS(ID_Empleado INT, NuevoPass VARCHAR(25), Llave VARCHAR(5))
BEGIN
	
    UPDATE usuario SET Pswd_Usuario = AES_ENCRYPT(NuevoPass,Llave) WHERE Empleado_ID_Empleado = ID_Empleado;
	
END//
DELIMITER ;