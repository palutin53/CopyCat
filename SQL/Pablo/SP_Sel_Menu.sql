DROP PROCEDURE IF EXISTS Select_Menu;
DELIMITER //
CREATE PROCEDURE Select_Menu(ID_Menu int(11), Nombre_Menu varchar(45), Ruta_Menu varchar(45), Tiene_Sub_Menu char(1), Estado_Menu char(1))
BEGIN

	SELECT * FROM menu;

END//
DELIMITER ;