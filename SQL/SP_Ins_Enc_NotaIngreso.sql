DROP PROCEDURE IF EXISTS Inserta_Enc_NotaIngreso;
DELIMITER //
CREATE PROCEDURE Inserta_Enc_NotaIngreso(Kiosco_ID_Kioscos VARCHAR(15), ID_Empleado INT, Proveedor_ID INT, Num_Factura VARCHAR(45), Total DECIMAL(8,2), Uso VARCHAR(75))
BEGIN

DECLARE Encabezado_ID VARCHAR(30) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;
DECLARE Fecha_Fact DATETIME DEFAULT NOW();

    SET ID_Nuevo = (SELECT 
						count(ID_Encabezado_Nota_Ingreso) Registros 
					FROM encabezado_nota_ingreso 
                    WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kioscos,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-NI',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-NI','1');
    END IF;

	INSERT INTO copycat.encabezado_nota_ingreso
				(ID_Encabezado_Nota_Ingreso,
				Kiosco_ID_Kiosco,
				Empleado_ID_Empleado,
				Proveedor_ID_Proveedor,
				Fecha_Encabezado_Nota_Ingreso,
				Factura_Ref_Encabezado_Nota_Ingreso,
				Total_Compra_Encabezado_Nota_Ingreso,
                Uso_Encabezado_Nota_Ingreso)
	VALUES
				(Encabezado_ID,
                 Kiosco_ID_Kioscos,
                 ID_Empleado,
                 Proveedor_ID,
                 Fecha_Fact,
                 Num_Factura,
                 Total,
                 Uso);


	SELECT 
		ID_Encabezado_Nota_Ingreso 
    FROM 
		encabezado_nota_ingreso 
    WHERE 
		Kiosco_ID_Kiosco = Kiosco_ID_Kioscos 
    AND 
		Fecha_Encabezado_Nota_Ingreso = Fecha_Fact;

END//
DELIMITER ;