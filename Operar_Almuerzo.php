<?php

	require("PHP/Funciones.php");

	session_start();

	$SP_Actividad = "Inserta_Actividad_Empleado(3," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_observaciones_Salida'] . "');";

	SPquery($SP_Actividad);

	header("Location: Portada.php?STD=al");
?>