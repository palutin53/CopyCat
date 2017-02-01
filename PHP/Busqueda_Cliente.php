<?php
	require("Funciones.php");

	$NIT_Cliente =  $_POST['valorBusqueda'];

	$SP_Cliente = "Select_Info_Cliente('$NIT_Cliente');";

	$DataC_Result = SPquery($SP_Cliente);
	$Info_Cliente = mysqli_fetch_array($DataC_Result);
	$Cliente_count = mysqli_num_rows($DataC_Result);

	if($Cliente_count > 0){
		$mensaje = $Info_Cliente["ID_Cliente"] . ";" . $Info_Cliente["Nombre_Cliente"] . ";" . 
		     $Info_Cliente["Direccion_Cliente"] . ";" . $Info_Cliente["Nit_Cliente"] . ";" . 
		     $Info_Cliente["Telefono_Cliente"] . ";" . $Info_Cliente["Correo_Cliente"];
	}
	else{
		$mensaje = "0;N/D;N/D;N/D;N/D;N/D";
	}

	echo $mensaje;

?>