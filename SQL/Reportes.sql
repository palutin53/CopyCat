/*Actividad Empleado*/
SELECT 
    ae.Fecha_Actividad,
    CONCAT(e.Nombre_Empleado,
            ' ',
            e.Apellido_Empleado),
    ta.Descripcion_Tipo_Actividad,
    IFNULL(ae.Justificacion_Actividad_Empleado, 'N/A') Justificacion,
    k.Descripcion_Kiosco
FROM
    actividad_empleado ae
        INNER JOIN
    empleado e ON ae.Empleado_ID_Empleado = e.ID_Empleado
        INNER JOIN
    tipo_actividad ta ON ta.ID_Tipo_Actividad = ae.Tipo_Actividad_ID_Tipo_Actividad
		INNER JOIN
	kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco ORDER BY ae.Fecha_Actividad;

/*Ventas por factura*/
SELECT 
    Factura_Encabezado_Factura_Num_Encabezado_Factura,
    SUM(Precio_Unitario_Linea_Detalle_Encabezado_Factura)
FROM
    linea_detalle_encabezado_factura
GROUP BY Factura_Encabezado_Factura_Num_Encabezado_Factura;

SELECT k.Descripcion_Kiosco, SUM(ef.Total_Venta_Encabezado_Factura) FROM encabezado_factura ef
INNER JOIN kiosco k ON ef.Kiosco_ID_Kiosco = k.ID_Kiosco GROUP BY Kiosco_ID_Kiosco;

/*Movimiento Efectivo*/
SELECT 
    tm.Kiosco_ID_Kiosco,
    k.Descripcion_Kiosco,
    tm.Fecha_Transaccion_Monetaria,
    ttm.Descripcion_Tipo_Transaccion_Monetaria,
    ctm.Descripcion_Concepto_Transaccion_Monetaria,
    tm.Descripcion_Transaccion_Monetaria,
    tm.No_Boleta_Transaccion_Monetaria,
    tm.Monto_Transaccion_Monetaria
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria;
    
/*Movimiento Efectivo por Kiosco*/
SELECT 
    tm.Kiosco_ID_Kiosco,
    k.Descripcion_Kiosco,
    tm.Fecha_Transaccion_Monetaria,
    ttm.Descripcion_Tipo_Transaccion_Monetaria,
    ctm.Descripcion_Concepto_Transaccion_Monetaria,
    tm.Descripcion_Transaccion_Monetaria,
    tm.No_Boleta_Transaccion_Monetaria,
    tm.Monto_Transaccion_Monetaria
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
WHERE tm.Kiosco_ID_Kiosco = 'J11-1';

/*Movimiento Efectivo por Num Factura*/
SELECT 
    tm.Kiosco_ID_Kiosco,
    k.Descripcion_Kiosco,
    tm.Fecha_Transaccion_Monetaria,
    ttm.Descripcion_Tipo_Transaccion_Monetaria,
    ctm.Descripcion_Concepto_Transaccion_Monetaria,
    tm.Descripcion_Transaccion_Monetaria,
    tm.No_Boleta_Transaccion_Monetaria,
    tm.Monto_Transaccion_Monetaria
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
WHERE tm.Descripcion_Transaccion_Monetaria LIKE '%J11-1-FA25%';

/*Movimiento Total Efectivo por Num Factura*/
SELECT 
    tm.Kiosco_ID_Kiosco,
    k.Descripcion_Kiosco,
    SUM(tm.Monto_Transaccion_Monetaria)
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
WHERE tm.Descripcion_Transaccion_Monetaria LIKE '%J11-1-FA25%';

/*Movimiento Total Efectivo por Kiosco*/
SELECT 
    tm.Kiosco_ID_Kiosco,
    k.Descripcion_Kiosco,
    SUM(tm.Monto_Transaccion_Monetaria) TOTAL_DIA
FROM
    transaccion_monetaria tm
        INNER JOIN
    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
        INNER JOIN
    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
        INNER JOIN
    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
WHERE tm.Kiosco_ID_Kiosco = 'J11-1';