<?php
	
require("PHP/Funciones.php");

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
?>