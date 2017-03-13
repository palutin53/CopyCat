<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>- COPYCAT -</title>
<link rel="stylesheet" type="text/css" media="all" href="style.css" />
<link rel="stylesheet" type="text/css" href="style/css/media-queries.css" />
<link rel="stylesheet" type="text/css" media="all" href="style/Botones.css" />
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
	$ID_KC = $_SESSION["Kiosco_Cod"];
?>
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
<div class="intro">COPYCAT</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Constancia Servicios VIP</h1>
	<!-- <img src="style/images/bg/Logo2.jpg" id='logo'> -->
<div class="form-container">
	<form class="forms" action="Operar_Constancia_VIP.php" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Ubicación/Dirección
					</td>
					<td class="campo">
						<textarea title="" name="txt_Ubicacion_Cons" rows="10" cols="50" maxlength="75" required></textarea>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Descripción Servicio Realizado
					</td>
					<td class="campo">
						<textarea title="" name="txt_Descripcion_Cons" rows="10" cols="50" maxlength="150" required></textarea>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Nombre Usuario Final
					</td>
					<td class="campo">
						<input type="text" name="txt_Usuer_Final" id="txt_Usuer_Final" value="" class="text-input required=" title="" required/>
					</td>
				</tr>

				<?php

					if($ID_KC == 'Okla-1'){
						echo '  <tr>
									<td class="nombrecampo">
										No. Placa
									</td>
									<td class="campo">
										<input type="text" name="txt_No_Placa" id="txt_No_Placa" value="" class="text-input required=" title="" required/>
									</td>
								</tr>
								<tr>
									<td class="nombrecampo">
										Nombre de Agente
									</td>
									<td class="campo">
										<input type="text" name="txt_Agente" id="txt_Agente" value="" class="text-input required=" title="" required/>
									</td>
								</tr>';
					}

				?>

				<tr>
					<td>
						<input type="submit" value="Registrar" name="submit" class="button edit" />
					</td>
				</tr>
			</table>
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