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