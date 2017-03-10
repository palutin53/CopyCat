<?php
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];

	$Cod_Producto = $_POST['codProducto'];

	$SP_Detalle_Incidencia = "Inserta_Detalle_Incidencia('" . $Cod_Producto . "','" . $ID_KC . "');";
	SPquery($SP_Detalle_Incidencia);

	$SP_Existencia = "Inserta_Det_Existencia('" . $ID_KC . "','" . $Cod_Producto . "', " . $Cantidad_Producto . ",'d');";

	SPquery($SP_Existencia);

	$SP_Cortes = "Inserta_Cortes('" . $Cod_Producto . "','" . $Encabezado_Fact . "','" . $ID_KC . "'," . $ID_EMP . ");";

	SPquery($SP_Cortes);
?>