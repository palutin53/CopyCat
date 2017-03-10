<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];
	$Tipo_inc = $_POST['tipoinci'];
	$Aplica_Pro = $_POST['aplicap'];
	$Descripcion_inc = $_POST['descripcionin'];
	$Encabezado_fact = $_POST['enc_fact'];

	$SP_Incidencia = "Inserta_Incidencia(" . $Tipo_inc . ",'" . $Descripcion_inc . "','" . 
											  $Aplica_Pro . "','" . $Encabezado_fact . "','" . 
											  $ID_KC . "'," . $ID_EMP . ")";

	SPquery($SP_Incidencia);

?>