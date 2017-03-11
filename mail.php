<?php
ini_set("max_execution_time", 0);
/*Lo primero es añadir al script la clase phpmailer desde la ubicación en que esté*/
/*require 'PHPMailer/class.phpmailer.php';
require 'PHPMailer/class.smtp.php';*/
require 'PHP/PHPMailer/PHPMailerAutoload.php';
 
//Crear una instancia de PHPMailer
$mail = new PHPMailer();
//Definir que vamos a usar SMTP
$mail->IsSMTP();
//Esto es para activar el modo depuración. En entorno de pruebas lo mejor es 2, en producción siempre 0
// 0 = off (producción)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug  = 4;
//Ahora definimos gmail como servidor que aloja nuestro SMTP
$mail->Host       = 'smtp.gmail.com';
//El puerto será el 587 ya que usamos encriptación TLS
$mail->Port       = 587;
//Definmos la seguridad como TLS
$mail->SMTPSecure = 'tls';
//Tenemos que usar gmail autenticados, así que esto a TRUE
$mail->SMTPAuth   = true;
//Definimos la cuenta que vamos a usar. Dirección completa de la misma
$mail->Username   = "jearson.developer11@gmail.com";
//Introducimos nuestra contraseña de gmail
$mail->Password   = "*******";
//Definimos el remitente (dirección y, opcionalmente, nombre)
$mail->SetFrom('jearson.developer11@gmail.com', 'Jeason Mazariegos');
//Esta línea es por si queréis enviar copia a alguien (dirección y, opcionalmente, nombre)
//$mail->AddReplyTo('replyto@correoquesea.com','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail->AddAddress('jearson1190291@hotmail.com', 'Jearson Mazariegos');
//Definimos el tema del email
$mail->Subject = 'Esto es un correo de prueba';
//Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
$mail->MsgHTML("Prueba envio mail");
//Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
$mail->AltBody = 'This is a plain-text message body';
//Enviamos el correo
if(!$mail->Send()) {
  echo "Error: " . $mail->ErrorInfo;
} else {
  echo "Enviado!";
}
?>