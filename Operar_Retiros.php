<?php
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];
	$Tipo_Transaccion = $_POST['Ddl_Tipo_Transaccion'];
	$Concepto_Transaccion = $_POST['Ddl_Concepto_Transaccion'];
	$Monto = $_POST['txt_Monto_Retiro'];
	$Observaciones = $_POST['txt_Observaciones_Retiro'];
	
	if($_GET['STD'] == 0){
		$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "'," . $Tipo_Transaccion . "," . $Concepto_Transaccion . ",'Retiro de Efectivo de caja, Observaciones: " . $Observaciones . "','N/A'," . $Monto . ");";

		SPquery($SP_Transaccion);	
	}
	else{
		$Boleta = $_POST['txt_Boleta_Deposito'];

		$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "'," . $Tipo_Transaccion . "," . $Concepto_Transaccion . ",'Retiro de Efectivo de caja para Deposito Bancario, Observaciones: " . $Observaciones . "','" . $Boleta . "'," . $Monto . ");";

		SPquery($SP_Transaccion);

		$Tipo_Transaccion = 3;
		$Concepto_Transaccion = 11;

		$SP_Transaccion_Ingresa_Banco = "Inserta_Transaccion_Monetaria('" . $ID_KC . "'," . $Tipo_Transaccion . "," . $Concepto_Transaccion . ",'Deposito Bancario Según Boleta No.: " . $Boleta . "','" . $Boleta . "'," . $Monto . ");";

		SPquery($SP_Transaccion_Ingresa_Banco);
	}

	header("Location: Portada.php?STD=sal");
	
?>