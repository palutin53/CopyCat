<?php
	
	require("PHP/Funciones.php");

	session_start();

	$ID_Proveedor = $_POST['idProveedor'];

	if($ID_Proveedor != 0){
		$ID_Proveedor = $ID_Proveedor;
	}
	else{
		$NITC = $_POST['nit'];
		$NombreC = $_POST['nombre'];
		$ContactoC = $_POST['contacto'];
		$TelefonoC = $_POST['telefono'];
		$MailC = $_POST['email'];

		$FN_Insert_Proveedor = "SELECT Fn_Select_ID_Proveedor('" . $NombreC . "', '" . $NITC . "', '" . $TelefonoC . "','" . $MailC . "','" . $ContactoC . "') ID_Proveedor;";

		$Proveedor_result = mquery($FN_Insert_Proveedor);	
		$Proveedor_Data = mysqli_fetch_array($Proveedor_result);

		$ID_Proveedor = $Proveedor_Data["ID_Proveedor"];
	}

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];
	$Tipo_Pago = $_POST['tipopago'];
	$Numero_Fac = $_POST['numfactura'];
	$Total = $_POST['total_factura'];
	$Uso = $_POST['usoc'];

	$SP_Encabezado_NI = "Inserta_Enc_NotaIngreso('" . $ID_KC . "'," . $ID_EMP . "," . $ID_Proveedor . ",'" . $Numero_Fac . "'," . $Total . ",'" . $Uso . "');";

	$Encabezado_NI_result = SPquery($SP_Encabezado_NI);	
	$Encabezado_NI_Data = mysqli_fetch_array($Encabezado_NI_result);

	$Encabezado_NI = $Encabezado_NI_Data["ID_Encabezado_Nota_Ingreso"];
	echo $Encabezado_NI;										   

?>