<?php
	
require("PHP/Funciones.php");

session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];

		$Codigo_Producto = $_POST['codigop'];
		$Tipo_Producto = 999;
		$Descripcion_Producto = $_POST['descripcionp'];
		$Precio_Producto = $_POST['preciop'];
		$Genera_Comision = "s";
		$Domicilio_Producto = "s";
		$Corte = "n";
		$Name_Foto = "no-image.png";

		$StoreProcedure = "Inserta_Producto_Servicio('" . $Codigo_Producto . "'," . $Tipo_Producto . ",'" . $Descripcion_Producto . 
													 "'," . $Precio_Producto . ",'" . $Genera_Comision . 
													 "','" . $Name_Foto . "','" . $Domicilio_Producto . 
													 "','" . $Corte . "');";

		SPquery($StoreProcedure);

		$Cantidad_Producto = '999';
		
		$SP_Existencia = "Inserta_Det_Existencia('" . $ID_KC . "','" . $Codigo_Producto . "', " . $Cantidad_Producto . ",'n');";
		SPquery($SP_Existencia);
?>