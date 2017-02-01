<?php

	require("Funciones.php");

	$Descripcion = $_POST['des_prod'];

	$respuesta = new stdClass();

	$SP_Producto = "Select_ProdServ_Descripcion('" . $Descripcion . "')";

	$DataP_Result = SPquery($SP_Producto);
	$Info_Prod = mysqli_fetch_array($DataP_Result);
	$Prod_count = mysqli_num_rows($DataP_Result);

	$Existencia_Result = mquery("SELECT Fn_Select_Cant_Existente('J11-1-E4'," . $Info_Prod['Cod_Producto_Servicio'] . ") Existencia;");
	$Info_Existencia = mysqli_fetch_array($Existencia_Result);

	if($Prod_count > 0){
		$respuesta->Precio = $Info_Prod["Precio_Producto_Servicio"];
		$respuesta->Img = "img_prod/" . $Info_Prod["Img_Producto_Servicio"];
		$respuesta->Existencia = $Info_Existencia['Existencia'];
	}
	else{
		$respuesta->Precio = "N/D";
		$respuesta->Img = "img_prod/no-image.png";
		$respuesta->Existencia = "N/D";
	}
	echo json_encode($respuesta);
?>