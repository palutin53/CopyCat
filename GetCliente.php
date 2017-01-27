<?php
	require("Funciones.php");

	$NIT_Cliente =  $_GET['NiC'];

	$SP_Cliente = "Select_Info_Cliente('$NIT_Cliente');";

	$DataC_Result = SPquery($SP_Cliente);
	$Info_Cliente = mysqli_fetch_array($DataC_Result);
	$Cliente_count = mysqli_num_rows($DataC_Result);

	if($Cliente_count > 0){
		echo "I" . ";" . $Info_Cliente["ID_Cliente"] . ";" . $Info_Cliente["Nombre_Cliente"] . ";" . 
		     $Info_Cliente["Direccion_Cliente"] . ";" . $Info_Cliente["Nit_Cliente"] . ";" . 
		     $Info_Cliente["Telefono_Cliente"] . ";" . $Info_Cliente["Correo_Cliente"];

		/*$Cadena = "I" . ";" . $Info_Cliente["ID_Cliente"] . ";" . $Info_Cliente["Nombre_Cliente"] . ";" . 
		     $Info_Cliente["Direccion_Cliente"] . ";" . $Info_Cliente["Nit_Cliente"] . ";" . 
		     $Info_Cliente["Telefono_Cliente"] . ";" . $Info_Cliente["Correo_Cliente"];*/
	}
	else{
		echo "I" . ";N/D;N/D;N/D;N/D;N/D;N/D";
		//$Cadena = "I" . ";N/D;N/D;N/D;N/D;N/D;N/D";
	}

	/*list($Operacion, $ID_Cliente, $NombreC, $DireccionC, $NitC, $TelefonoC, $CorreoC) = explode(";", $Cadena);
	echo "</br>" . $Operacion . "</br>"; 
	echo $ID_Cliente . "</br>";
	echo $NombreC . "</br>";
	echo $DireccionC . "</br>";
	echo $NitC . "</br>";
	echo $TelefonoC . "</br>";
	echo $CorreoC . "</br>";*/

?>