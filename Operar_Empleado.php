<?php
	require('PHP/Funciones.php');
	
	$estado = $_GET['estado'];

	if($estado == 'i'){

		$Nombre_Personal = $_POST['txt_Nombres_Empleado'];
		$Apellido_Personal = $_POST['txt_Apellidos_Empleado'];
		$DIP_Personal = $_POST['txt_DPI_Empleado'];
		$Telefono_Personal = $_POST['txt_Telefono_Empleado'];
		$Email_Personal = $_POST['txt_Email_Empleado'];
		$Salario_Personal = $_POST['txt_Salario_Empleado'];
		$ID_Kiosco = $_POST['Ddl_Kiosco_Asignado'];
		$ID_Rol = $_POST['Ddl_Rol'];
		$StoreProcedure = "Inserta_Empleado('" . $ID_Kiosco . "','" . $Nombre_Personal . "','" . $Apellido_Personal . "','" . $DIP_Personal . "','" . $Telefono_Personal . "','" . $Email_Personal . "'," . $Salario_Personal . ");";
		
		SPquery($StoreProcedure);

		$SP_User = "Inserta_User(" . $ID_Rol . ",'" . $Nombre_Personal . "','" . $Apellido_Personal . "');";

		SPquery($SP_User);

		//echo $StoreProcedure;
	
	}
	else if($estado == 'u'){

		$Nombre_Personal = $_POST['txt_Nombres_Empleado'];
		$Apellido_Personal = $_POST['txt_Apellidos_Empleado'];
		$DIP_Personal = $_POST['txt_DPI_Empleado'];
		$Telefono_Personal = $_POST['txt_Telefono_Empleado'];
		$Email_Personal = $_POST['txt_Email_Empleado'];
		$Salario_Personal = $_POST['txt_Salario_Empleado'];
		$ID_Kiosco = $_POST['Ddl_Kiosco_Asignado'];
		$StoreProcedure = "Actualiza_Empleado('" . $_GET['ID_EM'] . "','" . $ID_Kiosco . "','" . $Nombre_Personal . "','" . $Apellido_Personal . "','" . $DIP_Personal . "','" . $Telefono_Personal . "','" . $Email_Personal . "'," . $Salario_Personal . ");";
		
		SPquery($StoreProcedure);
		echo $StoreProcedure;
	}

	//header('Location: Registro_Personal.php?STD=v');

?>