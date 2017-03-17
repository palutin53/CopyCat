<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
	
?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>CopyCat</title>
<link rel="stylesheet" type="text/css" media="all" href="style.css" />
<link rel="stylesheet" type="text/css" href="style/css/media-queries.css" />
<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,300italic,300,700,700italic|Open+Sans+Condensed:300,700' rel="stylesheet" type='text/css'>-->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="style/css/ie8.css" media="all" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="style/css/ie9.css" media="all" />
<![endif]-->
<script type="text/javascript" src="style/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/retina.js"></script>
<script type="text/javascript" src="style/js/selectnav.js"></script>
<script type="text/javascript" src="style/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="style/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="style/js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="style/js/jquery.dcflickr.1.0.js"></script>
<script type="text/javascript" src="style/js/twitter.min.js"></script>

</head>
<body>
<div class="scanlines"></div>

<!-- Begin Header -->
<?php
	require("PHP/Menu.php");
?>
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
<div class="intro">Copycat</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Envio de Solicitudes</h1>
	<hr>
<div class="form-container">
	<?php
	// -----------------------------------------------------------------------------------------------
		$destino = 'davidlutin3@gmail.com';
		$asunto = $_POST['tipo_solicitud'];
		$motivo = $_POST['motivo'];
		$cod_Producto = $_POST['cod_Producto'];
		$observaciones = $_POST['observaciones'];
<<<<<<< HEAD
		$mensaje = "Motivo: ".$motivo."<br>"."Codigo de Producto Solicitado: ".$cod_Producto."<br>"."Observaciones: ".$observaciones;
		$kiosco = $_SESSION["Kiosco"];
	// ------------------------------------Enviar correos----------------------------------------------
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
		$mail->Subject = $asunto;
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
	//-------------------------------------------------------------------------------------------------
		header("Location: Portada.php");
=======
		$mensaje = 'SOLICITUD DE DE PRODUCTO'."\r\n".'</b></b>Motivo: '.$motivo."\r\n".'</b>Codigo de Producto Solicitado: '.$cod_Producto."\r\n".'</b>Observaciones: '.$observaciones;
		$kiosco = $_SESSION["Kiosco"];
	// ------------------------------------Enviar correos----------------------------------------------
		require ("PHP/PHPMailer/PHPMailerAutoload.php");

		$mail = new PHPMailer;

		//$mail->SMTPDebug = 3;                               // Enable verbose debug output

		$mail->isSMTP();                                      // Set mailer to use SMTP
		$mail->Host = 'smtp1.gmail.com;smtp2.gmail.com';  // Specify main and backup SMTP servers
		$mail->SMTPAuth = false;                               // Enable SMTP authentication
		$mail->Username = 'palutin31@gmail.com';                 // SMTP username
		$mail->Password = '';                           // SMTP password
		$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
		$mail->Port = 587;                                    // TCP port to connect to

		$mail->setFrom('palutin31@gmail.com', 'Pablo Lutín');
		$mail->addAddress('davidlutin3@gmail.com', 'Envio');     // Add a recipient
		//$mail->addAddress('ellen@example.com');               // Name is optional
		//$mail->addReplyTo('info@example.com', 'Information');
		//$mail->addCC('cc@example.com');
		//$mail->addBCC('bcc@example.com');

		//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
		//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
		//$mail->isHTML(true);                                  // Set email format to HTML

		$mail->Subject = $motivo;
		$mail->Body    = $mensaje;
		$mail->AltBody = 'CopyCat';

		if(!$mail->send()) {
		    echo 'Message could not be sent.';
		    echo 'Mailer Error: ' . $mail->ErrorInfo;
		} else {
		    echo 'Message has been sent';
		}
	//-------------------------------------------------------------------------------------------------
>>>>>>> origin/master
	?>
	<br>
</div>

</div>
<!-- End Container -->
<div class="clear"></div>

</div>
<!-- End Wrapper -->

<!-- Begin Footer -->
<div class="footer-wrapper">
<div id="footer" class="four">
		
	</div>
</div>
<div class="site-generator-wrapper">
	<div class="site-generator">Copycat</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>