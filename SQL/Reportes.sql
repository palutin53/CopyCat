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
    