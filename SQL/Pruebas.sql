SET GLOBAL log_bin_trust_function_creators = 1;
select * from Kiosco;

SELECT SUBSTRING('Oakland', 1, 4);

SELECT count(ID_Kiosco) Registros FROM Kiosco WHERE ID_Kiosco LIKE 'Oakl%';

CALL Inserta_Kiosco('Peri-Rooselvet','2224-2526','08:00:00','20:00:00','08:10:00');

SELECT LAST_INSERT_ID();

SELECT count(ID_Encabezado_Existencia) Registros FROM encabezado_existencia WHERE Kiosco_ID_Kiosco LIKE 'Okla-1%' AND Fecha_Encabezado_Existencia = '2017-01-14 00:00:00';
SELECT count(ID_Encabezado_Existencia) Registros FROM encabezado_existencia WHERE Kiosco_ID_Kiosco LIKE 'Okla-1%';
SELECT count(ID_Encabezado_Existencia) Registros FROM encabezado_existencia WHERE Kiosco_ID_Kiosco LIKE CONCAT('Okla-1','%');

CALL Inserta_Enc_Existencia('Okla-1','2017-01-13 00:00:00');
call Inserta_Enc_Existencia('J11-1','2017-01-13 00:00:00');

SELECT * FROM encabezado_existencia;
SELECT 
    ID_Encabezado_Existencia
FROM
    encabezado_existencia
WHERE
    Kiosco_ID_Kiosco = 'J11-1'
ORDER BY Fecha_Encabezado_Existencia DESC
LIMIT 1;

CALL Select_ID_Enc_Existencia('J11-1');

SELECT 
    COUNT(ID_Detalle_Existencia) ID
FROM
    detalle_existencia
WHERE
    Encabezado_Existencia_id_Encabezado_Existencia = 'J11-1-E4';
    
CALL Inserta_Tipo_Producto_Servicio('Llavin');
SELECT * FROM tipo_producto;
CALL Inserta_Producto_Servicio(1,'Llavin tipo B', 42.00,'0','/LlB.png','0');
SELECT * FROM producto_servicio;

SELECT * FROM detalle_existencia;

SELECT 
    Cantidad_Anterior_Detalle_Existencia,
    Cantidad_Existente_Detalle_Existencia
FROM
    detalle_existencia
WHERE
	Encabezado_Existencia_ID_Encabezado_Existencia = 'J11-1-E4'
AND
	Producto_Servicio_Cod_Producto_Servicio = 1
ORDER BY ID_Detalle_Existencia DESC LIMIT 1;

SET GLOBAL log_bin_trust_function_creators = 1;

SELECT Fn_Select_ID_Enc_Existencia('J11-1');
SELECT Fn_Select_Cant_Anterior('J11-1-E4',1);
SELECT Fn_Select_Cant_Existente('J11-1-E4',1);

CALL Inserta_Det_Existencia('J11-1',2,0,'u');
SELECT * FROM detalle_existencia;

SELECT '0' AS ID_Tipo_Producto, '--SELECCIONE--' AS Descripcion_Tipo_Producto UNION SELECT * FROM tipo_producto;

CALL Inserta_Tipo_Actividad('Almuerzo Regreso');
SELECT * FROM Tipo_Actividad;

CALL Inserta_Actividad_Empleado(1,1,'N/A');
SELECT * FROM Actividad_Empleado;

CALL Inserta_Atencion_Kiosco();
SELECT * FROM atencion_kiosco;

SELECT e.*, k.Descripcion_Kiosco FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco;
SELECT 
    e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario
FROM
    empleado e
        INNER JOIN
    kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado;

SELECT SUBSTRING(REPLACE('barrondo',' ',''),1,10);
SELECT LOWER(SUBSTRING('Jearson Alexander',1,1));

SELECT CONCAT(LOWER(SUBSTRING('Jearson Alexander',1,1)),LOWER(SUBSTRING(REPLACE('Mazariegos Santa Cruz',' ',''),1,10)));
SELECT MAX(ID_Empleado) AS id FROM empleado;

SELECT e.ID_Empleado, CONCAT(e.Nombre_Empleado, ' ', e.Apellido_Empleado) Nombre FROM empleado e;

SELECT * FROM tipo_cliente;
CALL Inserta_Cliente(1,'Luis Salazar','Ciudad','9085608-9','1111-1111','beto.gordo@gmail.com', @ID);
SELECT @ID;
SELECT Fn_Select_ID_Cliente(1,'Elder Sacrab','Ciudad','4025638-9','1111-1111','beto.gordo@gmail.com') ID_Cliente;
SELECT * FROM cliente;

SELECT * FROM tipo_pago;

CALL Select_Info_Cliente('7051408-9');

CALL Inserta_Enc_Factura('J11-1',1,1,1,'J11-123');
SELECT * FROM encabezado_factura;