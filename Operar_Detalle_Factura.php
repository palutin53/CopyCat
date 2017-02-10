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

	$SP_Detalle_Factura = "Inserta_Det_Factura('" . $Encabezado_Fact . "','" . $ID_KC . 
													"'," . $ID_EMP . ",'" . $Cod_Producto . 
													"'," . $Cantidad_Producto . "," . $Total_Linea . 
													"," . $Precio_Unitario . ");";
	$Detalle_Fact_Result = SPquery($SP_Detalle_Factura);

	$SP_Existencia = "Inserta_Det_Existencia('" . $ID_KC . "','" . $Cod_Producto . "', " . $Cantidad_Producto . ",'d');";

	SPquery($SP_Existencia);

	$SP_Cortes = "Inserta_Cortes('" . $Cod_Producto . "','" . $Encabezado_Fact . "','" . $ID_KC . "'," . $ID_EMP . ");";

	SPquery($SP_Cortes);

	

?>