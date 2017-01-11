<?php
	require("PHP/Funciones.php");
	
	$estado = $_GET[estado];

	if($estado == 'i'){

		$Descripcion_Kiosco = $_POST['txt_Nombre_Kiosco'];
		$Tel_Kiosco = $_POST['txt_Num_Telefono_Kiosco'];
		$Hora_Ingreso = $_POST['txt_Horario_Ingreso_Kiosco'] . ":00";
		$Hora_Salida = $_POST['txt_Horario_Cierre_Kiosco'] . ":00";
		$Hora_Max_Ingreso = $_POST['txt_Horario_Max_Ingreso_Kiosco'] . ":00";
		$StoreProcedure = "Inserta_Kiosco('" . $Descripcion_Kiosco . "','" . $Tel_Kiosco .
										"','" . $Hora_Ingreso . "','" . $Hora_Salida ."','" . $Hora_Max_Ingreso . "');";
		
		SPquery($StoreProcedure);
	
	}
	else if($estado == 'u'){

		$ID_Kiosco = $_GET['ID_KC'];
		$Descripcion_Kiosco = $_POST['txt_Nombre_Kiosco'];
		$Tel_Kiosco = $_POST['txt_Num_Telefono_Kiosco'];
		$Hora_Ingreso = $_POST['txt_Horario_Ingreso_Kiosco'] . ":00";
		$Hora_Salida = $_POST['txt_Horario_Cierre_Kiosco'] . ":00";
		$Hora_Max_Ingreso = $_POST['txt_Horario_Max_Ingreso_Kiosco'] . ":00";
		$StoreProcedure = "Actualiza_Kiosco('" . $ID_Kiosco . "','" . $Descripcion_Kiosco . "','" . $Tel_Kiosco .
										"','" . $Hora_Ingreso . "','" . $Hora_Salida ."','" . $Hora_Max_Ingreso . "');";
		
		SPquery($StoreProcedure);
	}

?>