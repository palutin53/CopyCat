<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_Cliente = $_POST['idcliente'];

	if($ID_Cliente != 0){
		$ID_Cliente = $ID_Cliente;
	}
	else{
		$NITC = $_POST['nit'];
		$NombreC = $_POST['nombre'];
		$DireccionC = $_POST['direccion'];
		$TelefonoC = $_POST['telefono'];
		$MailC = $_POST['email'];

		$FN_Insert_Cliente = "SELECT Fn_Select_ID_Cliente(2,'" . 
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
	$Tipo_Pago = 4;
	$Numero_Fac = $_POST['numfactura'];
	$EstudioM = 999;
	$Total = $_POST['total_factura'];
	$Descuento = $_POST['descuento_factura'];

	$SP_Encabezado_Factura = "Inserta_Enc_Factura_VIP('" . $ID_KC . "'," . $ID_EMP . "," . 
													   $Tipo_Pago . "," . $ID_Cliente . ",'" . $Numero_Fac . "'," . 
													   $EstudioM . "," . $Descuento . "," . $Total . ")";

	$Encabezado_Fact_result = SPquery($SP_Encabezado_Factura);	
	$Encabezado_Fact_Data = mysqli_fetch_array($Encabezado_Fact_result);

	$Encabezado_Fact = $Encabezado_Fact_Data["Num_Encabezado_Factura"];
	echo $Encabezado_Fact;										   

?>