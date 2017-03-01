DROP PROCEDURE IF EXISTS Inserta_Tipo_Cliente;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Cliente(ID_Tipo_Cliente int(11), Descripcion_Tipo_Cliente varchar(50))
BEGIN

	INSERT INTO tipo_actividad(ID_Tipo_Cliente, Descripcion_Tipo_Cliente)
    VALUES (ID_Tipo_Cliente, Descripcion_Tipo_Cliente);

END//
DELIMITER ;