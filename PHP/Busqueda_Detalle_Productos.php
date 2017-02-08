<?php

	require("Funciones.php");

	session_start();

	$Encabezado_Existencia = $_SESSION["ID_Encabezado_Existencia"];

	$Descripcion = $_POST['des_prod'];

	list($Codigo_Prod, $Descripcion_Prod) = explode("|", $Descripcion);

	$respuesta = new stdClass();

	$SP_Producto = "Select_ProdServ_ID('" . $Codigo_Prod . "')";

	$DataP_Result = SPquery($SP_Producto);
	$Info_Prod = mysqli_fetch_array($DataP_Result);
	$Prod_count = mysqli_num_rows($DataP_Result);

	$Existencia_Result = mquery("SELECT Fn_Select_Cant_Existente('" . $Encabezado_Existencia . "','" . $Info_Prod['Cod_Producto_Servicio'] . "') Existencia;");
	$Info_Existencia = mysqli_fetch_array($Existencia_Result);

	if($Prod_count > 0){
		$respuesta->Codigo = $Info_Prod["Cod_Producto_Servicio"];
		$respuesta->Descripcion_Detalle = $Info_Prod["Descripcion_Producto_Servicio"];
		$respuesta->Precio = $Info_Prod["Precio_Producto_Servicio"];
		$respuesta->Img = "img_prod/" . $Info_Prod["Img_Producto_Servicio"];
		$respuesta->Existencia = $Info_Existencia['Existencia'];
	}
	else{
		$respuesta->Codigo = "N/D";
		$respuesta->Descripcion_Detalle = "N/D";
		$respuesta->Precio = "N/D";
		$respuesta->Img = "img_prod/no-image.png";
		$respuesta->Existencia = "N/D";
	}
	echo json_encode($respuesta);
?>