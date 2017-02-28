<?php
	
	require("PHP/Funciones.php");

	session_start();

	$hoy = date("Y-m-d");

	$ID_KC = $_SESSION["Kiosco_Cod"];

	$queryCaja = "SELECT Fn_Efectivo_Caja('" . $ID_KC . "') Total;";

	$Caja_result = mquery($queryCaja);	
	$Caja_Data = mysqli_fetch_array($Caja_result);

	$Caja_Total = $Caja_Data["Total"];

	echo $Caja_Total;
?>