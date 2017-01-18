<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	$Estado = $_GET['STD'];

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
<div class="intro">COPYCAT</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Establecer Contraseña</h1>
		<div class="clear1"></div>
		<div class="linea"></div>
<div class="form-container">
<?php
	if($Estado == 'a'){
?>
	<form class="forms" action="Operar_Reset.php?STD=<?php echo $Estado;?>" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Empleado
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Empleado">
								<?php
								 $SQL = "SELECT e.ID_Empleado, CONCAT(e.Nombre_Empleado, ' ', e.Apellido_Empleado) Nombre FROM empleado e;";
								 $ID = "ID_Empleado";
								 $Data = "Nombre";
								 Cargar_Combo($SQL,$ID,$Data,'0');
								?>
							</select>
						</label>
						</ol>
					</td>
				</tr>
<?php
	}
	else{
?>
	<form class="forms" action="Operar_Reset.php?ID_EM=<?php echo $_SESSION["Empleado_Cod"] . "&STD=" . $Estado;?>" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Nombre Empleado
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Nombre_Personal" class="text-input required" value="<?php echo $_SESSION['User'];?>" readonly/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Contraseña Actual
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="password" name="txt_Pass_Actual" class="text-input required" value=""/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Llave Actual
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="password" name="txt_Llave_Actual" class="text-input required" value=""/>
							</li>
						</ol>
					</td>
				</tr>
<?php
	}
?>
				<tr>
					<td class="nombrecampo">
						Contraseña Nueva
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="password" name="txt_Pass_Nuevo" class="text-input required" value="">
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Confirmar Contraseña
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="password" name="txt_Pass_Confirmacion" class="text-input required" value="">
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Llave
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="password" name="txt_llave" class="text-input required" value="">
							</li>
						</ol>
					</td>
				</tr>
			</table>
			<li class="button-row">
				<input type="submit" value="Guardar" name="submit" class="btn-submit" />
				<input type="submit" value="Cancelar" name="submit" class="btn-submit" />
				<input type="submit" value="Ayuda" name="submit" class="btn-submit" />
			</li>
		</fieldset>
	</form>
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
	<div class="site-generator">CopyCat 2016</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>