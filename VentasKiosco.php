<?php
	
	require("PHP/Funciones.php");

	session_start();

	$hoy = date("Y-m-d");

	$ID_KC = $_SESSION["Kiosco_Cod"];

	$queryVentas = "SELECT 
					    IFNULL(SUM(ef.Total_Venta_Encabezado_Factura), 0) Total
					FROM
					    encabezado_factura ef
					WHERE
					    ef.Fecha_Encabezado_Factura LIKE '" . $hoy . "%' AND Kiosco_ID_Kiosco = '" . $ID_KC . "';";

	$Ventas_result = mquery($queryVentas);	
	$Ventas_Data = mysqli_fetch_array($Ventas_result);

	$Ventas_Total = $Ventas_Data["Total"];

	echo $Ventas_Total;
?>