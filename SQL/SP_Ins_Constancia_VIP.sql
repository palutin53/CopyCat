DROP PROCEDURE IF EXISTS Inserta_Constancia_VIP;
DELIMITER //
CREATE PROCEDURE Inserta_Constancia_VIP(Enc_Fac VARCHAR(30), ID_Kiosco VARCHAR(15), ID_Empleado INT, Ubicacion VARCHAR(75), Descripcion VARCHAR(150), Usuario_Final VARCHAR(50), Placa VARCHAR(15), Agente VARCHAR(50))
BEGIN
	
    INSERT INTO copycat.constancia_servicios_vip
				(Encabezado_Factura_Num_Encabezado_Factura,
				Encabezado_Factura_Kiosco_ID_Kiosco,
				Encabezado_Factura_Empleado_ID_Empleado,
				Fecha_Contancia_Servicios_VIP,
				Ubicacion_Contancia_Servicios_VIP,
				Descripcion_Contancia_Servicios_VIP,
				Usuario_Final_Contancia_Servicios_VIP,
				Placa_Contancia_Servicios_VIP,
				Agente_Contancia_Servicios_VIP)
	VALUES
				(Enc_Fac,
                 ID_Kiosco,
                 ID_Empleado,
                 NOW(),
                 Ubicacion,
                 Descripcion,
                 Usuario_Final,
                 Placa,
                 Agente);


END//
DELIMITER ;