<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];

	$queryCortes = "SELECT Cortes_Totales 
					FROM cortes 
					WHERE Encabezado_Factura_Kiosco_ID_Kiosco = '" . $ID_KC . "' 
					ORDER BY Fecha_Cortes DESC LIMIT 1;";

	$Cortes_result = mquery($queryCortes);	
	$Cortes_Data = mysqli_fetch_array($Cortes_result);

	$Cortes_Total = $Cortes_Data["Cortes_Totales"];

	echo $Cortes_Total;
?>