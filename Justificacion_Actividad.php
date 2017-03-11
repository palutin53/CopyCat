<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	echo "<script type='text/javascript'>alert('Fuera de Horario')</script>";

?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>COPYCAT</title>
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
	//require("PHP/Menu.php");
?>
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
<div class="intro">COPYCAT</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Justificación Fuera de Horario</h1>
	<hr>
<div class="form-container">
<?php
if($_GET['STD'] == 'i'){
	echo "<form enctype='multipart/form-data' class='forms' action='Operar_Justificacion.php?STD=i' method='post'>";
}
else if($_GET['STD'] == 's'){
	echo "<form enctype='multipart/form-data' class='forms' action='Operar_Justificacion.php?STD=s' method='post'>";
}
?>
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Justificación
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<textarea title="Ingresa una Justificación" name="txt_Justificacion" rows="10" cols="50" maxlength="75" required></textarea>
							</li>
						</ol>
					</td>
				</tr>
			</table>
			<li class="button-row">
				<input type="submit" value="Guardar" name="save" class="btn-submit" />
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