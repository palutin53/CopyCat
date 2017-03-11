<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" media="all" href="style/Style_Login.css" />
<link type="image/x-icon" href="favicon-copycat.png" rel="shortcut icon" />
<title>- COPYCAT -</title>
</head>
<body>

<div id="wrapper">

	<form name="login-form" class="login-form" action="PHP/Login.php" method="post">
	
		<div class="header">
		<h1>Inicio de Sesión</h1>
		<span>Ingrese su usuario y contraseña, si presenta problemas pongase en contacto con el administrador.</span>
		</div>
	
		<div class="content">
		<?php
		  if(isset($_GET['error'])){
		  	if($_GET['error'] == 1){
		  		echo "<div class='error'>" . "Credenciales Incorrectas" . "</div>";
		  	}
		  	else if($_GET['error'] == 2){
		  		echo "<div class='error'>" . "Debe de iniciar Sesión" . "</div>";	
		  	}

		  }
		?>
		<input name="name" type="text" class="input username" placeholder="USUARIO" />
		<div class="user-icon"></div>
		<input name="pass" type="password" class="input password" placeholder="CONTRASEÑA" />
		<div class="pass-icon"></div>
		<input name="key" type="password" class="input password" placeholder="LLAVE" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		<input type="submit" name="submit" value="INGRESAR" class="button" />
		<img src="style/images/bg/Logo2.jpg" class="register">
		</div>
	
	</form>

</div>
<div class="gradient"></div>

</body>
</html>