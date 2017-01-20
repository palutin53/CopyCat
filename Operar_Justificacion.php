<?php
require("PHP/Funciones.php");

session_start();

if($_GET['STD'] == 'i'){
	$SP_Actividad = "Inserta_Actividad_Empleado(1," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_Justificacion'] . "');";

	SPquery($SP_Actividad);
	if($_SESSION["default"] == '0'){
		header("Location: Portada.php");
		$_SESSION[''];
	}
	else{
		header("Location: Reset_Credenciales.php?STD=u");
		$_SESSION[''];
	}
}
else{
	$SP_Actividad = "Inserta_Actividad_Empleado(2," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_Justificacion'] . "');";

	SPquery($SP_Actividad);

	$_SESSION = array();
	session_destroy();
	mysqli_close();
	header("Location: index.php");
	exit;
}

?>