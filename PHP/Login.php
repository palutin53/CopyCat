<?php
	if(isset($_POST['submit'])){

		$user = $_POST['name'];
		$pass = $_POST['pass'];

		if(($user == 'jmazariegos' && $pass == '123456') || ($user == 'lbarrondo' && $pass == '123456') || ($user == 'gmendez' && $pass == '123456') ){
			session_start();
			$_SESSION["User"] = $user;
			header("Location: ../Portada.php");
		}
		else{
			header("Location: ../index.php");
		}

	}

/*$nombre= $_POST[name];
$pass= $_POST[pass];
/*La busqueda en la base de datos se realiza de este modo para evitar las inyecciones sql*/
/*$query=("SELECT UsuarioLog,PassLog FROM Login "
         . "WHERE UsuarioLog='".mysql_real_escape_string($nombre)."' and "
         . "PassLog='".mysql_real_escape_string($pass)."'");
$rs= mysql_query($query);
$row=mysql_fetch_object($rs);
$nr = mysql_num_rows($rs);
if($nr == 1){
echo 'No ingreso';
}
else if($nr == 0) {
     header("Location:segundo.html");
}*/
?>