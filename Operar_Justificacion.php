<?php
require("PHP/Funciones.php");

session_start();

if($_GET['STD'] == 'i'){
	$SP_Actividad = "Inserta_Actividad_Empleado(1," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_Justificacion'] . "');";

	SPquery($SP_Actividad);
	if($_SESSION["default"] == '0'){
		header("Location: Portada.php");
		$_SESSION[''];
		//-----------------------------------------------------------------------------Notificacion
		$mensaje = "Empleado: ".$_SESSION["Empleado_Cod"]."<br>"."Motivo: ".$_POST['txt_Justificacion'];
			require_once('PHPMailer/class.phpmailer.php');
			include("PHPMailer/class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded
			$mail = new PHPMailer();
			//$body = file_get_contents('contents.html');
			//$body = eregi_replace("[\]",'',$body);
			$body = $mensaje;
			$mail->IsSMTP();	// telling the class to use SMTP
			$mail->Host = "smtp.gmail.com";	// SMTP server
			$mail->SMTPDebug = 2;	// enables SMTP debug information (for testing)
									// 1 = errors and messages
									// 2 = messages only
			$mail->SMTPAuth = true;	// enable SMTP authentication
			$mail->SMTPSecure = "tls";	// sets the prefix to the servier
			$mail->Host = "smtp.gmail.com";	// sets GMAIL as the SMTP server
			$mail->Port = 587;	// set the SMTP port for the GMAIL server
			$mail->Username = "palutin31@gmail.com";	// GMAIL username
			$mail->Password = "Palutin53";	// GMAIL password
			$mail->SetFrom('palutin31@gmail.com', 'Pablo lutin');
			$mail->AddReplyTo("palutin31@gmail.com","Pablo Lutin");
			$mail->Subject = "ENTRADA TARDE";
			$mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
			$mail->MsgHTML($body);
			$address = "davidlutin3@gmail.com";
			$mail->AddAddress($address, "David Lutin");
			//$mail->AddAttachment("images/phpmailer.gif");	// attachment
			//$mail->AddAttachment("images/phpmailer_mini.gif");	// attachment
			if(!$mail->Send()) {
				echo "Mailer Error: " . $mail->ErrorInfo;
			} else {
			echo "Message sent!";
			}
		//-----------------------------------------------------------------------------------------
	}
	else{
		header("Location: Reset_Credenciales.php?STD=u");
		$_SESSION[''];
	}
}
else{
	$SP_Actividad = "Inserta_Actividad_Empleado(2," . $_SESSION["Empleado_Cod"] . ",'" . $_POST['txt_Justificacion'] . "');";

	SPquery($SP_Actividad);

	$_SESSION = array();
	session_destroy();
	mysqli_close();
	header("Location: index.php");
	exit;
}

?>