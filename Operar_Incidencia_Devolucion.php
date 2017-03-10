<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];
	$Tipo_inc = "2";
	$Aplica_Pro = "n";
	$Descripcion_inc = $_POST['txt_Observaciones_Incidencia'];
	$Encabezado_fact = $_POST['txt_Encabezado_Fac'];

	$SP_Incidencia = "Inserta_Incidencia(" . $Tipo_inc . ",'" . $Descripcion_inc . "','" . 
											  $Aplica_Pro . "','" . $Encabezado_fact . "','" . 
											  $ID_KC . "'," . $ID_EMP . ")";

	SPquery($SP_Incidencia);

	$Total_Devuelto = $_POST['txt_Devolucion_Venta'];

	$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',6,13,'Devolución Efectivo Ref. Factura No. " . $Encabezado_fact . "','N/A'," . $Total_Devuelto . ");";

	SPquery($SP_Transaccion);

?>