<?php

	require("PHP/Funciones.php");

	session_start();

	$FN_Insert_Cliente = "SELECT Fn_Select_ID_Cliente(" . $_POST['Ddl_Tipo_Cliente'] .",'" . 
													 $_POST['txt_Nombre_Cliente'] . "','" . 
													 $_POST['txt_Direccion_Cliente'] . "','" . 
													 $_POST['txt_Nit_Cliente'] . "','" . 
													 $_POST['txt_Telefono_Cliente'] . "','" . 
													 $_POST['txt_Email_Cliente'] . "') ID_Cliente;";

	$Cliente_result = mquery($FN_Insert_Cliente);	
	$Cliente_Data = mysqli_fetch_array($Cliente_result);

	$ID_Cliente = $Cliente_Data["ID_Cliente"];

	//echo $ID_Cliente;

	header("Location: Ingreso_Clientes.php?IDC=" . $ID_Cliente);

?>