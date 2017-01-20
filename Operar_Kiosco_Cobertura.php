<?php
	require("PHP/Funciones.php");

	session_start();

	$hoy = date("Y-m-d");

	$Kiosco_Info = "SELECT 
						E.ID_Empleado,
						K.ID_Kiosco,
						U.Rol_ID_Rol,
						R.Descripcion_Rol,
						CONCAT(E.Nombre_Empleado,' ',E.Apellido_Empleado) AS Nombre_Empleado,
						K.Descripcion_Kiosco,
						K.Horario_Ingreso_Kiosco,
						K.Horario_Max_Ingreso_Kiosco,
						K.Horario_Salida_Kiosco
					FROM
						empleado E
					INNER JOIN
						kiosco K ON K.ID_Kiosco = '" . $_POST['Ddl_Kiosco'] . "'
					INNER JOIN
						usuario U ON E.ID_Empleado = U.Empleado_ID_Empleado
					INNER JOIN
						rol R ON U.Rol_ID_Rol = R.ID_Rol
					WHERE ID_Empleado = " . $_SESSION["Empleado_Cod"] .";";

	$Kiosco_result = mquery1rec($Kiosco_Info);

			$_SESSION["User"] = $Kiosco_result["Nombre_Empleado"];
			$_SESSION["Kiosco"] = $Kiosco_result["Descripcion_Kiosco"];
			$_SESSION["Horario_Ingreso"] = $Kiosco_result["Horario_Ingreso_Kiosco"];
			$_SESSION["Horario_Max"] = $Kiosco_result["Horario_Max_Ingreso_Kiosco"];
			$_SESSION["Horario_Salida"] = $Kiosco_result["Horario_Salida_Kiosco"];
			$_SESSION["Empleado_Cod"] = $Kiosco_result["ID_Empleado"];
			$_SESSION["Kiosco_Cod"] = $Kiosco_result["ID_Kiosco"];
			$_SESSION["Rol_Cod"] = $Kiosco_result["Rol_ID_Rol"];
			$_SESSION["Rol_Des"] = $Kiosco_result["Descripcion_Rol"];

				$StoreProcedure = "Inserta_Enc_Existencia('" . $_SESSION["Kiosco_Cod"] . "','" . $hoy . " 00:00:00');";
				//echo $StoreProcedure;

				SPquery($StoreProcedure);

				$SP_Atencion_Kiosco = "Inserta_Atencion_Kiosco('" . $hoy . " 00:00:00','" . $_SESSION["Kiosco_Cod"] . "'," . $_SESSION["Empleado_Cod"] . ");";

				SPquery($SP_Atencion_Kiosco);

				$hora_ingreso = date("H:i:s");
				if($hora_ingreso < $_SESSION["Horario_Max"]){	
					$SP_Actividad = "Inserta_Actividad_Empleado(1," . $_SESSION["Empleado_Cod"] . ",'N/A');";

					SPquery($SP_Actividad);

					if($_SESSION["default"] == '0'){
						header("Location: Portada.php");
						$_SESSION[''];
					}
					else{
						header("Location: Reset_Credenciales.php?STD=u");
						$_SESSION[''];
					}
				}
				else{
					header("Location: Justificacion_Actividad.php?STD=i");
				}

?>