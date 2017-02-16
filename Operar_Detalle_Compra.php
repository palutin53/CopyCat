<?php
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];

	$SP_Encabezado_NI = "Select_Info_Enc_NI('" . $ID_KC . "')";

	$Encabezado_NI_result = SPquery($SP_Encabezado_NI);
	$Encabezado_NI_Data = mysqli_fetch_array($Encabezado_NI_result);

	$Encabezado_NI = $Encabezado_NI_Data["ID_Encabezado_Nota_Ingreso"];

	$Cod_Producto = $_POST['codProducto'];
	$Cantidad_Producto = $_POST['cantProducto'];
	$Total_Linea = $_POST['totProducto'];
	$Precio_Unitario = $_POST['precProducto'];
	$Tipo_Pago = $_POST['tipopago'];

	$SP_Detalle_NI = "Inserta_Det_NI('" . $Encabezado_NI . "','" . $ID_KC . "','" . 
										  $Cod_Producto . "'," . $Cantidad_Producto . "," . 
										  $Total_Linea . "," . $Precio_Unitario . ");";
	$Detalle_NI_Result = SPquery($SP_Detalle_NI);

	$SP_Existencia = "Inserta_Det_Existencia('" . $ID_KC . "','" . $Cod_Producto . "', " . $Cantidad_Producto . ",'u');";

	SPquery($SP_Existencia);

		//if($Tipo_Pago == 1){ //Compra de Mercaderia en Efectivo
			
			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',4,6,'Compra a Proveedor Ref. Factura No. " . $Encabezado_NI . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		//}
		/*else if($Tipo_Pago == 2 || $Tipo_Pago == 3){//Compra de Mercaderia con Cheque

			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',2,3,'Factura No. " . $Encabezado_NI . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		}*/

?>