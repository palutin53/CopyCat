SELECT * FROM empleado;

SELECT 
	NOW() Fecha,
	CONCAT(Nombre_Empleado, ' ', Apellido_Empleado) Nombre_Completo,
    DPI_Empleado,
    Salario_Base_Empleado Salario_Base,
    (Salario_Base_Empleado * 4.83) / 100 IGSS,
    (Salario_Base_Empleado * 1) / 100 IRTRA,
    (Salario_Base_Empleado * 1) / 100 INTECAP,
    Salario_Base_Empleado - ((Salario_Base_Empleado * 4.83) / 100) - ((Salario_Base_Empleado * 1) / 100) - ((Salario_Base_Empleado * 1) / 100) Monto_Efectivo
FROM
    empleado;
    
SELECT 
    NOW() Fecha,
    CONCAT(e.Nombre_Empleado,
            ' ',
            e.Apellido_Empleado) Nombre_Completo,
    e.DPI_Empleado,
    e.Salario_Base_Empleado Salario_Base,
    (e.Salario_Base_Empleado * 4.83) / 100 IGSS,
    (e.Salario_Base_Empleado * 1) / 100 IRTRA,
    (e.Salario_Base_Empleado * 1) / 100 INTECAP,
    SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Comision,
    e.Salario_Base_Empleado - ((e.Salario_Base_Empleado * 4.83) / 100) - ((e.Salario_Base_Empleado * 1) / 100) - ((e.Salario_Base_Empleado * 1) / 100) + SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Monto_Efectivo
FROM
    empleado e
        INNER JOIN
    linea_detalle_encabezado_factura lf ON lf.Factura_Encabezado_Factura_Empleado_ID_Empleado = e.ID_Empleado
        INNER JOIN
    encabezado_factura ef ON lf.Factura_Encabezado_Factura_Num_Encabezado_Factura = ef.Num_Encabezado_Factura
WHERE
    ef.Fecha_Encabezado_Factura LIKE '%-03-%'
GROUP BY lf.Factura_Encabezado_Factura_Empleado_ID_Empleado;