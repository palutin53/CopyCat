<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_Cliente = $_POST['txt_ID_Cliente'];

	if($ID_Cliente != 0){
		$ID_Cliente = $ID_Cliente;
	}
	else{
		$NITC = $_POST['txt_Nit_Cliente'];
		$NombreC = $_POST['txt_Nombre_Cliente'];
		$DireccionC = $_POST['txt_Direccion_Cliente'];
		$TelefonoC = $_POST['txt_Telefono_Cliente'];
		$MailC = $_POST['txt_Email_Cliente'];

		$FN_Insert_Cliente = "SELECT Fn_Select_ID_Cliente(1,'" . 
														 $NombreC . "','" . 
														 $DireccionC . "','" . 
														 $NITC . "','" . 
														 $TelefonoC . "','" . 
														 $MailC . "') ID_Cliente;";

		$Cliente_result = mquery($FN_Insert_Cliente);	
		$Cliente_Data = mysqli_fetch_array($Cliente_result);

		$ID_Cliente = $Cliente_Data["ID_Cliente"];
	}

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];
	$Tipo_Pago = $_POST['Ddl_Tipo_Pago'];
	$Numero_Fac = $_POST['txt_Num_Factura'];
	$SP_Encabezado_Factura = "Inserta_Enc_Factura('" . $ID_KC . "'," . $ID_EMP . "," . 
													   $Tipo_Pago . "," . $ID_Cliente . ",'" . $Numero_Fac . "')";

	$Encabezado_Fact_result = SPquery($SP_Encabezado_Factura);	
	$Encabezado_Fact_Data = mysqli_fetch_array($Encabezado_Fact_result);

	$Encabezado_Fact = $Encabezado_Fact_Data["Num_Encabezado_Factura"];
	echo $Encabezado_Fact;											   

?>