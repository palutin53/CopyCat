DROP PROCEDURE IF EXISTS Inserta_Menu;
DELIMITER //
CREATE PROCEDURE Inserta_Menu(ID_Menu int(11), Nombre_Menu varchar(45), Ruta_Menu varchar(45), Tiene_Sub_Menu char(1), Estado_Menu char(1))
BEGIN

	INSERT INTO menu(ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu)
    VALUES (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu);

END//
DELIMITER ;