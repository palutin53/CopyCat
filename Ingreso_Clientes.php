<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_GET['IDC'])){
		echo "<script type='text/javascript'>alert('Cliente Ingresado Correctamente.');</script>";	
	}

?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>- COPYCAT -</title>
<link rel="stylesheet" type="text/css" media="all" href="style.css" />
<link rel="stylesheet" type="text/css" href="style/css/media-queries.css" />
<link type="image/x-icon" href="favicon-copycat.png" rel="shortcut icon" />
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

	<h1 class="title">Ingreso de Clientes</h1>
	<hr>
	<div class="linea"></div>
	<div class="clear1"></div>
<div class="form-container">
	<form class="forms" action="Operar_Cliente.php" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Tipo de Cliente
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Tipo_Cliente">
									<?php
									 $SQL = "SELECT ID_Tipo_Cliente, Descripcion_Tipo_Cliente FROM tipo_cliente";
									 $ID = "ID_Tipo_Cliente";
									 $Data = "Descripcion_Tipo_Cliente";
									 Cargar_Combo($SQL,$ID,$Data,'0');
									?>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						NIT
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Nit_Cliente" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Nombres y Apellidos
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Nombre_Cliente" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Dirección
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Direccion_Cliente" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Teléfono
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Telefono_Cliente" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Email
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Email_Cliente" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo" colspan=2>
						<input type="submit" value="Guardar" name="submit" class="btn-submit"/>
						<input type="submit" value="Cancelar" name="submit" class="btn-submit"/>
						<input type="submit" value="Ayuda" name="submit" class="btn-submit"/>
					</td>
				</tr>					
			</table>
			<hr>
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
	<div class="site-generator">Telefonica 2016</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>