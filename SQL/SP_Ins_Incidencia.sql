DROP PROCEDURE IF EXISTS Inserta_Incidencia;
DELIMITER //
CREATE PROCEDURE Inserta_Incidencia(Tipo_Incidencia INT, Descripcion varchar(100), Aplica_Producto CHAR(1), Factura_Num VARCHAR(30), ID_Kiosco VARCHAR(15), ID_Empleado INT)
BEGIN

	INSERT INTO copycat.incidencia
			   (Tipo_Incidencia_ID_Tipo_Incidencia,
				Fecha_Incidencia,
				Descripcion_Incidencia,
				Aplica_Producto_Incidencia,
				Factura_Num_Encabezado_Factura,
				Encabezado_Factura_ID_Kiosco,
				Encabezado_Factura_ID_Empleado)
				VALUES
				(
                Tipo_Incidencia,
                NOW(),
                Descripcion,
                Aplica_Producto,
                Factura_Num,
                ID_Kiosco,
                ID_Empleado
                );

END//
DELIMITER ;