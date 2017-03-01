<?php

	require("PHP/Funciones.php");

	session_start();

	$SP_Actividad = "Inserta_Actividad_Empleado(" . $_POST['Ddl_Tipo_Actividad'] . "," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_observaciones_Salida'] . "');";

	SPquery($SP_Actividad);

	if($_POST['Ddl_Tipo_Actividad'] != 8){
		header("Location: Portada.php?STD=sal");
	}
	else{
		header("Location: Retiro_Caja.php?STD=dep");	
	}
?>