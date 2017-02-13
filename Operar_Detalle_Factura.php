<?php
	require("PHP/Funciones.php");

	session_start();

	$ID_KC = $_SESSION["Kiosco_Cod"];
	$ID_EMP = $_SESSION["Empleado_Cod"];

	$SP_Encabezado_Factura = "Select_Info_Enc_Factura('" . $ID_KC . "')";

	$Encabezado_Fact_result = SPquery($SP_Encabezado_Factura);
	$Encabezado_Fact_Data = mysqli_fetch_array($Encabezado_Fact_result);

	$Encabezado_Fact = $Encabezado_Fact_Data["Num_Encabezado_Factura"];

	$Cod_Producto = $_POST['codProducto'];
	$Cantidad_Producto = $_POST['cantProducto'];
	$Total_Linea = $_POST['totProducto'];
	$Precio_Unitario = $_POST['precProducto'];
	$Tipo_Pago = $_POST['tipopago'];

	$SP_Detalle_Factura = "Inserta_Det_Factura('" . $Encabezado_Fact . "','" . $ID_KC . 
													"'," . $ID_EMP . ",'" . $Cod_Producto . 
													"'," . $Cantidad_Producto . "," . $Total_Linea . 
													"," . $Precio_Unitario . ");";
	$Detalle_Fact_Result = SPquery($SP_Detalle_Factura);

	$SP_Existencia = "Inserta_Det_Existencia('" . $ID_KC . "','" . $Cod_Producto . "', " . $Cantidad_Producto . ",'d');";

	SPquery($SP_Existencia);

	$SP_Cortes = "Inserta_Cortes('" . $Cod_Producto . "','" . $Encabezado_Fact . "','" . $ID_KC . "'," . $ID_EMP . ");";

	SPquery($SP_Cortes);

	
	$SP_Tipo_Prod = "SELECT Fn_Tipo_Producto('" . $Cod_Producto . "') Tipo_Producto";

	$SP_Tipo_Prod_result = mquery($SP_Tipo_Prod);
	$SP_Tipo_Prod_Data = mysqli_fetch_array($SP_Tipo_Prod_result);

	$Tipo_Prod = $SP_Tipo_Prod_Data["Tipo_Producto"];

	if($Tipo_Prod == 2){

		if($Tipo_Pago == 1){//Venta de Servicios en Efectivo

			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',1,2,'Factura No. " . $Encabezado_Fact . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		}
		else if($Tipo_Pago == 2 || $Tipo_Pago == 3){//Venta de Servicios con tarjeta o cheque

			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',2,4,'Factura No. " . $Encabezado_Fact . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		}
	}
	else{

		if($Tipo_Pago == 1){ //Venta de Mercaderia en Efectivo
			
			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',1,1,'Factura No. " . $Encabezado_Fact . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		}
		else if($Tipo_Pago == 2 || $Tipo_Pago == 3){//Venta de Mercaderia con tarjeta o cheque

			$SP_Transaccion = "Inserta_Transaccion_Monetaria('" . $ID_KC . "',2,3,'Factura No. " . $Encabezado_Fact . "','N/A'," . $Total_Linea . ");";

			SPquery($SP_Transaccion);

		}

	}

?>