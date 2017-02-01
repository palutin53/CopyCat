<?php
	
require("PHP/Funciones.php");

	if(isset($_POST['save'])){
		$Tipo_Producto = $_POST['Ddl_Tipo_Producto'];
		$Descripcion_Producto = $_POST['txt_Descripcion_Producto'];
		$Precio_Producto = $_POST['txt_Precio_Producto'];
		$Genera_Comision = $_POST['Ddl_Genera_Comision'];
		$Domicilio_Producto = $_POST['Ddl_Domicilio'];
		
		$Inicio_Foto_Clean = str_replace(' ', '', $Descripcion_Producto);
		$Inicio_Foto = substr($Inicio_Foto_Clean, 0, 11);

		if($_FILES['imgProducto']['name'] != ''){
			$target_path = "img_prod/";
			$Name_Foto = $Inicio_Foto . ".png";
			$target_path = $target_path . basename($Name_Foto); 
			if(move_uploaded_file($_FILES['imgProducto']['tmp_name'], $target_path)){
				echo "El archivo ". basename( $_FILES['imgProducto']['name']). " ha sido subido";
			}
			else{
				echo "Ha ocurrido un error, trate de nuevo!";
			}
		}
		else{
			$Name_Foto = "no-image.png";
		}

		$StoreProcedure = "Inserta_Producto_Servicio(" . $Tipo_Producto . ",'" . $Descripcion_Producto . 
													 "'," . $Precio_Producto . ",'" . $Genera_Comision . 
													 "','" . $Name_Foto . "','" . $Domicilio_Producto . "');";

		SPquery($StoreProcedure);

		header("Location: Registro_Producto.php?STD=v");
	}



//echo "Datos-" . $Genera_Comision . "--" . $Domicilio_Producto . "--" . $Tipo_Producto . "--" . $Descripcion_Producto . "--" . $Precio_Producto;

?>