DROP PROCEDURE IF EXISTS Actualiza_Menu;
DELIMITER //
CREATE PROCEDURE Actualiza_Menu(ID_Menu int(11), Nombre_Menu varchar(45), Ruta_Menu varchar(45), Tiene_Sub_Menu char(1), Estado_Menu char(1))
BEGIN
	UPDATE 
		copycat.menu
	SET		
		Nombre_Menu = Nombre_Menu,
		Ruta_Menu = Ruta_Menu,
		Tiene_Sub_Menu  = Tiene_Sub_Menu,
		Estado_Menu = Estado_Menu
	WHERE 
		ID_Menu = ID_Menu;

END//
DELIMITER ;