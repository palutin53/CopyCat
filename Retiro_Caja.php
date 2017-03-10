<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_GET['STD'])){
		$Estado = 1;
	}
	else{
		$Estado = 0;
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

	<h1 class="title">Retiro Efectivo de Caja</h1>
	<hr>
<div class="form-container">
	<form class="forms" action="Operar_Retiros.php?STD=<?php echo $Estado?>" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Fecha y Hora
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Fecha_Salida" value="<?php $time = time(); echo date("d-m-Y (H:i:s)", $time);?>" class="text-input required" title="" disabled/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Motivo
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Tipo_Transaccion">
									<?php
									 $SQL = "SELECT ID_Tipo_Transaccion_Monetaria, Descripcion_Tipo_Transaccion_Monetaria FROM tipo_transaccion_monetaria WHERE ID_Tipo_Transaccion_Monetaria >= 5 AND ID_Tipo_Transaccion_Monetaria <= 7;";
									 $ID = "ID_Tipo_Transaccion_Monetaria";
									 $Data = "Descripcion_Tipo_Transaccion_Monetaria";
									 Cargar_Combo($SQL,$ID,$Data,'0');
									?>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Concepto
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Concepto_Transaccion">
									<?php
									 $SQL = "SELECT ID_Concepto_Transaccion_Monetaria, Descripcion_Concepto_Transaccion_Monetaria FROM concepto_transaccion_monetaria WHERE ID_Concepto_Transaccion_Monetaria >= 7 AND ID_Concepto_Transaccion_Monetaria <> 11;";
									 $ID = "ID_Tipo_Transaccion_Monetaria";
									 $Data = "Descripcion_Tipo_Transaccion_Monetaria";
									 Cargar_Combo($SQL,$ID,$Data,'0');
									?>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Monto
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Monto_Retiro" value="" class="text-input required" title="" required />
							</li>
						</ol>
					</td>
				</tr>
				<?php
					if($Estado == 1){
						echo "<tr>
								<td class='nombrecampo'>
									No. Boleta
								</td>
								<td class='campo'>
									<ol>
										<li class='form-row text-input-row'>
											<input type='text' name='txt_Boleta_Deposito' value='' class='text-input required' title='' required />
										</li>
									</ol>
								</td>
							</tr>";
					}
				?>
				<tr>
					<td class="nombrecampo">
						Observaciones
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<textarea rows="10" cols="50" name="txt_Observaciones_Retiro" required></textarea>
							</li>
						</ol>
					</td>
				</tr>
			</table>
			<ol>
				<li class="button-row">
					<input type="submit" value="Guardar" name="submit" class="btn-submit" />
					<input type="submit" value="Cancelar" name="submit" class="btn-submit" />
					<input type="submit" value="Ayuda" name="submit" class="btn-submit" />
				</li>
				<hr>
			</ol>
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