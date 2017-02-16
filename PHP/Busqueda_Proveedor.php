<?php
	require("Funciones.php");

	$NIT_Proveedor =  $_POST['valorBusqueda'];

	$SP_Proveedor = "Select_Info_Proveedor('$NIT_Proveedor');";

	$DataC_Result = SPquery($SP_Proveedor);
	$Info_Proveedor = mysqli_fetch_array($DataC_Result);
	$Proveedor_count = mysqli_num_rows($DataC_Result);

	if($Proveedor_count > 0){
		$mensaje = $Info_Proveedor["ID_Proveedor"] . ";" . $Info_Proveedor["Descripcion_Proveedor"] . ";" . 
		     $Info_Proveedor["Nombre_Contacto_Proveedor"] . ";" . $Info_Proveedor["NIT_Proveedor"] . ";" . 
		     $Info_Proveedor["Telefono_Proveedor"] . ";" . $Info_Proveedor["Email_Proveedor"];
	}
	else{
		$mensaje = "0;N/D;N/D;N/D;N/D;N/D";
	}

	echo $mensaje;

?>