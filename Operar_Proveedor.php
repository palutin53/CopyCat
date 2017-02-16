<?php
	require("PHP/Funciones.php");

	session_start();

	$Nit_Proveedor = $_POST['txt_Nit_Proveedor'];
	$Descripcion_Proveedor = $_POST['txt_Descripcion_Proveedor'];
	$Telefono_Proveedor = $_POST['txt_Telefono_Proveedor'];
	$Mail_Proveedor = $_POST['txt_Mail_Proveedor'];
	$Contacto = $_POST['txt_Nombre_Contacto'];

	$FN_Insert_Proveedor = "SELECT Fn_Select_ID_Proveedor('" . $Descripcion_Proveedor ."','" . 
														  $Nit_Proveedor . "','" . 
														  $Telefono_Proveedor . "','" . 
														  $Mail_Proveedor . "','" . 
														  $Contacto . "') ID_Proveedor;";

	$Proveedor_result = mquery($FN_Insert_Proveedor);	
	$Proveedor_Data = mysqli_fetch_array($Proveedor_result);

	$ID_Proveedor = $Proveedor_Data["ID_Proveedor"];

	//echo $ID_Cliente;

	header("Location: Ingreso_Proveedores.php?IDP=" . $ID_Proveedor);
?>