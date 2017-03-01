SET GLOBAL log_bin_trust_function_creators = 1;
SELECT * FROM empleado;
SELECT * FROM usuario;
CALL Actualiza_PASS(1,'jmazariegos11','11');
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
    
CALL Inserta_Tipo_Producto_Servicio('Cerrajeria');
SELECT * FROM tipo_producto;
CALL Inserta_Producto_Servicio('',1,'Llavin tipo B', 42.00,'0','/LlB.png','0','n');
SELECT * FROM producto_servicio;
CALL Inserta_Cortes('CJC-A','J11-1-FA21','J11-1',1);
SELECT * FROM cortes;

SELECT Cortes_Totales FROM cortes WHERE Encabezado_Factura_Kiosco_ID_Kiosco = 'J11-1' ORDER BY Fecha_Cortes DESC LIMIT 1;

SELECT Genera_Corte_Producto_Servicio FROM producto_servicio WHERE Cod_Producto_Servicio = 'CJA-A';

SELECT * FROM detalle_existencia;

SELECT 
    Cantidad_Anterior_Detalle_Existencia,
    Cantidad_Existente_Detalle_Existencia
FROM
    detalle_existencia
WHERE
	Encabezado_Existencia_ID_Encabezado_Existencia = 'J11-1-E18'
AND
	Producto_Servicio_Cod_Producto_Servicio = 'CJA-A'
ORDER BY ID_Detalle_Existencia DESC LIMIT 1;

SELECT 
    ID_Encabezado_Existencia
FROM
    encabezado_existencia
WHERE
    Kiosco_ID_Kiosco = 'Okla-1'
ORDER BY Fecha_Encabezado_Existencia DESC
LIMIT 1, 1;

SELECT 
    ID_Encabezado_Existencia
FROM
    encabezado_existencia
WHERE
    Kiosco_ID_Kiosco = 'Okla-1'
ORDER BY Fecha_Encabezado_Existencia DESC
LIMIT 1;

SELECT * FROM encabezado_existencia;
SELECT Fn_Select_ID_Enc_Existencia('J11-1');
SELECT Fn_Select_ID_Enc_Existencia_Anterior('J11-1');
SELECT Fn_Select_Cant_Anterior('J11-1-E18','CJA-B');
SELECT Fn_Select_Cant_Existente('J11-1-E21','CJA-B') Existencia;

SELECT 
    COUNT(ID_Detalle_Existencia) ID
FROM
    detalle_existencia
WHERE
    Encabezado_Existencia_id_Encabezado_Existencia = 'Okla-1-E5' AND Producto_Servicio_Cod_Producto_Servicio = 'CJA-A'; /* J11-1-E18 -- J11-1-E20 */

CALL Inserta_Det_Existencia('Okla-1','CJC-A',15,'n');
SELECT * FROM detalle_existencia; /* u->agregar -- d->quitar n->nuevo*/

SELECT NOW();

SELECT 
     Encabezado_Existencia_id_Encabezado_Existencia
FROM
    detalle_existencia
WHERE
    Producto_Servicio_Cod_Producto_Servicio = 'CJA-B'
        AND Encabezado_Existencia_Kiosco_ID_Kiosco = 'Okla-1'
ORDER BY Fecha_Movimiento_Detalle_Existencia DESC LIMIT 1;

SELECT 
     *
FROM
    detalle_existencia
WHERE
    Producto_Servicio_Cod_Producto_Servicio = 'CM-A'
        AND Encabezado_Existencia_Kiosco_ID_Kiosco = 'J11-1'
ORDER BY Fecha_Movimiento_Detalle_Existencia DESC;

SELECT 
    COALESCE(Cantidad_Existente_Detalle_Existencia, 0)
FROM
    detalle_existencia
WHERE
    Encabezado_Existencia_Kiosco_ID_Kiosco = 'Okla-1'
        AND Producto_Servicio_Cod_Producto_Servicio = 'LL-A'
ORDER BY Fecha_Movimiento_Detalle_Existencia DESC
LIMIT 1;

SELECT Fn_Select_Cant_Existente_Kiosco('J11-1','CM-A');

SELECT '0' AS ID_Tipo_Producto, '--SELECCIONE--' AS Descripcion_Tipo_Producto UNION SELECT * FROM tipo_producto;

CALL Inserta_Tipo_Actividad('Regreso Asistencia/Receso');
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

CALL Inserta_Enc_Factura('J11-1',1,1,1,'J11-123',1,0.00,100.00);
SELECT * FROM encabezado_factura;

CALL Inserta_Estudio_Mercado('Visual');
SELECT * FROM estudio_mercado;

CALL Select_ProdServ_Descripcion('Llavin tipo B');
CALL Select_ProdServ_ID('CJA-A');

SELECT 
    Fecha_Encabezado_Factura, Num_Encabezado_Factura, Kiosco_ID_Kiosco, Empleado_ID_Empleado
FROM
    encabezado_factura
ORDER BY Fecha_Encabezado_Factura DESC
LIMIT 1;
CALL Select_Info_Enc_Factura('J11-1');

SELECT COUNT(ID_Detalle_Encabezado_Factura) Registros FROM detalle_encabezado_factura WHERE Num_Encabezado_Factura = 'J11-1-FA18';

CALL Inserta_Det_Factura('J11-1-FA17','J11-1',1,'CJA-A',1,125.00,125.00);
SELECT * FROM encabezado_factura;
SELECT * FROM detalle_encabezado_factura;
SELECT * FROM linea_detalle_encabezado_factura;
/*LL-A 40.00 n --- CJA-A 125.00 s*/
SELECT Fn_Calcular_Comision('CJA-A') Comision;
SELECT Fn_Tipo_Producto('CJA-A') Tipo_Producto;

SELECT * FROM tipo_transaccion_monetaria;
SELECT * FROM concepto_transaccion_monetaria;

CALL Inserta_Transaccion_Monetaria('J11-1',1,1,'Factura No. TS-20','N/A',255.00);
SELECT * FROM transaccion_monetaria;

CALL Inserta_Proveedor('Proveedor Llavines 2', '1234567-9', '5555-4444','proveedor@hotmail.com','', @ID_C);
SELECT * FROM proveedor;
SELECT Fn_Select_ID_Proveedor('Proveedor Llavines 3', '1234567-10', '2222-1111','proveedor3@hotmail.com','Proveedor') ID_Proveedor;
CALL Select_Info_Proveedor('1234567-10');

CALL Inserta_Enc_NotaIngreso('J11-1',1,1,'E-123456',100.00,'Uso');
SELECT * FROM encabezado_nota_ingreso;
CALL Select_Info_Enc_NI('J11-1');
CALL Inserta_Det_NI('J11-1-NI5','J11-1','CM-A',2,250.00,125.00);
SELECT * FROM detalle_encabezado_ni;
SELECT * FROM linea_detalle_encabezado_ni;

SELECT 
    IFNULL(SUM(ef.Total_Venta_Encabezado_Factura), 0) Total
FROM
    encabezado_factura ef
WHERE
    ef.Fecha_Encabezado_Factura LIKE '2017-02-27%' AND Kiosco_ID_Kiosco = 'J11-1';
    
SELECT 
    SUM(tm.Monto_Transaccion_Monetaria) TOTAL_DIA
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria
WHERE
    tm.Kiosco_ID_Kiosco = 'J11-1'
        AND tm.ID_Tipo_Transaccion_Monetaria = 1;

SELECT 
    SUM(tm.Monto_Transaccion_Monetaria) TOTAL_RERITOS_CAJA
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria
WHERE
    tm.Kiosco_ID_Kiosco = 'J11-1'
        AND tm.ID_Tipo_Transaccion_Monetaria IN (4 , 5, 6, 7);

SELECT Fn_Efectivo_Caja('J11-1') Total;