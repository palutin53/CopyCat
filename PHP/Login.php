<?php
	session_start();

	require("Funciones.php");

	if(isset($_POST['submit'])){

		$user = $_POST['name'];
		$pass = $_POST['pass'];
		$key = $_POST['key'];

		$credenciales = "SELECT Empleado_ID_Empleado, Estado_Usuario 
						 FROM usuario 
						 WHERE User_Kiosco = '" .$user . "' AND 
						       Pswd_Usuario = AES_ENCRYPT('" . $pass ."', '" . $key . "');";

		$credenciales_result = mquery1rec($credenciales);

		//echo "Registros: " . count($credenciales_result) . "</br>";

		if($credenciales_result["Estado_Usuario"] == '1'){
			//echo "Logueo Exitoso";

			$Kiosco_Info = "SELECT 
							    E.ID_Empleado,
							    E.Kiosco_ID_Kiosco,
							    U.Rol_ID_Rol,
							    R.Descripcion_Rol,
							    CONCAT(E.Nombre_Empleado,
							            ' ',
							            E.Apellido_Empleado) AS Nombre_Empleado,
							    K.Descripcion_Kiosco,
							    K.Horario_Ingreso_Kiosco,
							    K.Horario_Max_Ingreso_Kiosco,
							    K.Horario_Salida_Kiosco
							FROM
							    empleado E
							INNER JOIN
							    kiosco K ON E.Kiosco_ID_Kiosco = K.ID_Kiosco
							INNER JOIN
								usuario U ON E.ID_Empleado = U.Empleado_ID_Empleado
							INNER JOIN
								rol R ON U.Rol_ID_Rol = R.ID_Rol
							WHERE ID_Empleado = " . $credenciales_result["Empleado_ID_Empleado"] .";";

			$Kiosco_result = mquery1rec($Kiosco_Info);

			$hoy = date("Y/m/d");

			$_SESSION["User"] = $Kiosco_result["Nombre_Empleado"];
			$_SESSION["Kiosco"] = $Kiosco_result["Descripcion_Kiosco"];
			$_SESSION["Horario_Ingreso"] = $Kiosco_result["Horario_Ingreso_Kiosco"];
			$_SESSION["Horario_Max"] = $Kiosco_result["Horario_Max_Ingreso_Kiosco"];
			$_SESSION["Horario_Salida"] = $Kiosco_result["Horario_Salida_Kiosco"];
			$_SESSION["Empleado_Cod"] = $Kiosco_result["ID_Empleado"];
			$_SESSION["Kiosco_Cod"] = $Kiosco_result["Kiosco_ID_Kiosco"];
			$_SESSION["Rol_Cod"] = $Kiosco_result["Rol_ID_Rol"];
			$_SESSION["Rol_Des"] = $Kiosco_result["Descripcion_Rol"];

			if($Kiosco_result["Kiosco_ID_Kiosco"] != 'Pivo-1'){

				$StoreProcedure = "Inserta_Enc_Existencia('" . $_SESSION["Kiosco_Cod"] . "','" . $hoy . " 00:00:00');";

				SPquery($StoreProcedure);

				$SP_Atencion_Kiosco = "Inserta_Atencion_Kiosco('" . $hoy . " 00:00:00','" . $_SESSION["Kiosco_Cod"] . "'," . $_SESSION["Empleado_Cod"] . ");";

				SPquery($SP_Atencion_Kiosco);

				$hora_ingreso = date("H:i:s");
				if($hora_ingreso < $_SESSION["Horario_Max"]){	
					$SP_Actividad = "Inserta_Actividad_Empleado(1," . $_SESSION["Empleado_Cod"] . ",'N/A');";

					SPquery($SP_Actividad);

					header("Location: ../Portada.php");
				}
				else{
					header("Location: ../Justificacion_Actividad.php?STD=i");
				}

			}
			else{
				header("Location: ../Registro_Kiosco_Cobertura.php");
			}

		}
		else{
			//echo "Logueo Fallido";
			header("Location: ../index.php?error=1");
		}
	}
?>