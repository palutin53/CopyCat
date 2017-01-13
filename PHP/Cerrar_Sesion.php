<?php
	require("Funciones.php");

	session_start();
	$hora_actual = date("H:i:s");
	
	if($hora_actual >= $_SESSION["Horario_Salida"]){
		$SP_Actividad = "Inserta_Actividad_Empleado(2," . $_SESSION["Empleado_Cod"] . ",'N/A');";

		SPquery($SP_Actividad);

		$_SESSION = array();
		session_destroy();
		header("Location: ../index.php");
		mysqli_close();
		exit;
	}
	else{
		header("Location: ../Justificacion_Actividad.php?STD=s");
	}

	
?>