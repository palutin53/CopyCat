<?php
require("Funciones.php");

if($_GET['STD'] == 'a'){ //Si es administrador
	
	if($_POST['txt_Pass_Nuevo'] == $_POST['txt_Pass_Confirmacion']){//Si el nuevo pass se confirma

		$ID_Empleado = $_POST['Ddl_Empleado'];
		$SPC = "Actualiza_PASS($ID_Empleado,$_POST['txt_Pass_Nuevo'],$_POST['txt_llave']);";
		SPquery($SPC);

		header("Location: Portada.php?STD=cr");
	}
	else{ //Si el nuevo pass no se confirma
		header("Location: Reset_Credenciales.php?STD=$_GET['STD']&error=1");
	}
}
else if($_GET['STD'] == 'u'){ //Usuario normal

	$ID_Empleado = $_GET['ID_EM'];

		$pass = $_POST['txt_Pass_Actual'];
		$key = $_POST['txt_Llave_Actual'];

		$credenciales = "SELECT Empleado_ID_Empleado, Estado_Usuario 
						 FROM usuario 
						 WHERE Empleado_ID_Empleado = '" . $ID_Empleado . "' AND 
						       Pswd_Usuario = AES_ENCRYPT('" . $pass ."', '" . $key . "');";

		$credenciales_result = mquery1rec($credenciales);

	if($credenciales_result["Estado_Usuario"] == '1'){ //Concuerdan Credenciales

		if($_POST['txt_Pass_Nuevo'] != $_POST['txt_Pass_Actual']){ //Si el nuevo pass es distinto del actual

			if($_POST['txt_Pass_Nuevo'] == $_POST['txt_Pass_Confirmacion']){//Si el nuevo pass se confirma

				$SPC = "Actualiza_PASS($ID_Empleado,$_POST['txt_Pass_Nuevo'],$_POST['txt_llave']);";

				SPquery($SPC);

				header("Location: Portada.php?STD=cr");

			}
			else{ //Si el nuevo pass no se confirma
				header("Location: Reset_Credenciales.php?STD=$_GET['STD']&ID_EM=$ID_Empleado");	
			}

		}
		else{ //Si el nuevo pass es igual del actual
			header("Location: Reset_Credenciales.php?STD=$_GET['STD']&ID_EM=$ID_Empleado");
		}
	}
	else{ //No Concuerdan Credenciales
		header("Location: Reset_Credenciales.php?STD=$_GET['STD']&ID_EM=$ID_Empleado");
	}
}

?>