<?php
	
require("PHP/Funciones.php");

	$ID_Kioscox = $_POST['Ddl_Kiosco'];
	$Codigo_Producto = $_POST['txt_ID_Producto'];
	$Cantidad = $_POST['txt_Cantidad_Mov'];
	$Tipo_Mov = $_POST['DDl_Tipo_Mov'];

	if($Tipo_Mov == 1){

		$SP_Existencia = "Inserta_Det_Existencia('" . $ID_Kioscox . "','" . $Codigo_Producto . "'," . $Cantidad . ",'u');";
		SPquery($SP_Existencia);

	}
	else{

		$SP_Existencia = "Inserta_Det_Existencia('" . $ID_Kioscox . "','" . $Codigo_Producto . "'," . $Cantidad . ",'d');";
		SPquery($SP_Existencia);

	}

	header("Location: Actualizar_Inventario.php?STD=v");

?>