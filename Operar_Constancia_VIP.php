<?php
	
require("PHP/Funciones.php");

session_start();

$ID_KC = $_SESSION["Kiosco_Cod"];
$ID_EMP = $_SESSION["Empleado_Cod"];
$Ubicacion = $_POST['txt_Ubicacion_Cons'];
$Descripcion = $_POST['txt_Descripcion_Cons'];
$Usuario_Final = $_POST['txt_Usuer_Final'];

	$SP_Encabezado_Factura = "Select_Info_Enc_Factura('" . $ID_KC . "')";

	$Encabezado_Fact_result = SPquery($SP_Encabezado_Factura);
	$Encabezado_Fact_Data = mysqli_fetch_array($Encabezado_Fact_result);

	$Encabezado_Fact = $Encabezado_Fact_Data["Num_Encabezado_Factura"];

	if($ID_KC != 'Okla-1'){

		$SP_Constancia = "Inserta_Constancia_VIP('" . $Encabezado_Fact . "','" . $ID_KC . "'," . 
												  $ID_EMP . ",'" . $Ubicacion . "','" . 
												  $Descripcion . "','" . $Usuario_Final . "','N/A','N/A')";

		SPquery($SP_Constancia);	

	}
	else{

		$Placa = $_POST['txt_No_Placa'];
		$Agente = $_POST['txt_Agente'];

		$SP_Constancia = "Inserta_Constancia_VIP('" . $Encabezado_Fact . "','" . $ID_KC . "'," . 
												  $ID_EMP . ",'" . $Ubicacion . "','" . 
												  $Descripcion . "','" . $Usuario_Final . "','" . 
												  $Placa . "','" . $Agente . "')";

		SPquery($SP_Constancia);

	}

	header("Location: Portada.php");

?>