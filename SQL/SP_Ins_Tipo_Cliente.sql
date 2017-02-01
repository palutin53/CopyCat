DROP PROCEDURE IF EXISTS Inserta_Tipo_Cliente;
DELIMITER //
CREATE PROCEDURE Inserta_Tipo_Cliente(Descripcion_Tipo_Cliente varchar(50))
BEGIN

	INSERT INTO tipo_actividad(Descripcion_Tipo_Cliente)
    VALUES(Descripcion_Tipo_Cliente);

END//
DELIMITER ;