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
<style>
	.clase1 {width: 10%; float: left; border:1px solid black;}
	.clear1 {width: 100%; height: ;float: left; border:1px solid black;}
</style>
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
<div class="intro">CopyCat</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Compras de Proveedores</h1>
	<hr>
<div class="form-container">
	<form class="forms" action="" method="post">
		<fieldset>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div style="width: 100%; height: 2px; background: black; float: left;"></div>
			<div style="padding: 10px;">
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio sub-div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
<!--				<div style="float: left; width: 70%; height: 100%; border:1px solid black;"> -->
					<div style="width: 70%; float: left;">
					<table name="DatosProveedor">
						<tr>
							<td class="nombrecampo">
								Nombre:
							</td>
							<td class="campo">
								<input type="text" name="" value="" class="text-input required" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Nombre:
							</td>
							<td class="campo">
								<input type="text" name="" value="" class="text-input required" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Dirección:
							</td>
							<td  class="campo" colspan="4">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Razón Social:
							</td>
							<td class="campo" colspan="4">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Teléfono:
							</td>
							<td class="campo" colspan="2">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								E-mail:
							</td>
							<td class="campo" colspan="3">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
					</table>
				</div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final sub-div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio sub-div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div style="float: right; width: 29%;height: 100%;">
					<table name="FacturaCompra">
						<tr>
							<td calss="nombrecampo">
								N.Factura
							</td>
							<td class="campo">
								<input type="text" name="" value="" class="text-input required=" title="" />						
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Serie
							</td>
							<td class="campo">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombreclase">
								Fecha
							</td>
							<td class="campo">
								<input type="date" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Dias Credito:
							</td>
							<td class="campo">
								<input type="text" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Vence:
							</td>
							<td class="campo">
								<input type="date" name="" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Pago:
							</td>
							<td class="campo">
								<select name="Forma de Pago" value="" class="text-input required=" title="">
									<option value="Seleccionar">
										Seleccionar
									</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final sub-div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div style="width: 100%; height: 2px; background: black; float: left;"></div>
		<div style="width: 100%; height: 15px; clear: both; float: left;"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div style="width: 100%; padding: 5%;">
						<div class="clase1">Articulo</div>
						<div class="clase1">Descripción</div>
						<div class="clase1">Cantidad</div>
						<div class="clase1">Embalaje</div>
						<div class="clase1">Unidad</div>
						<div class="clase1">Precio</div>
						<div class="clase1">Descuento</div>
						<div class="clase1">Impuesto</div>
						<div style="width: 10%; float: left; clear: both;"></div>
			</div>
			<div style="width: 100%; padding: 5%;">
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div class="clase1"><input type="text"></div>
						<div style="width: 10%; float: left;"><input type="submit" value="Enviar"></div>
			</div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div style="width: 100%; height: 15px; clear: both; float: left;"></div>
		<div style="width: 100%; height: 2px; background: black; float: left;"></div>
		<div style="width: 100%; height: 15px; clear: both; float: left;"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div style="width: 100%; padding: 5%;">
						<div class="clase1">Articulo</div>
						<div class="clase1">Descripción</div>
						<div class="clase1">Cantidad</div>
						<div class="clase1">Embalaje</div>
						<div class="clase1">Unidad</div>
						<div class="clase1">Precio</div>
						<div class="clase1">Descuento</div>
						<div class="clase1">Impuesto</div>
						<div class="clase1">Importe</div>
			</div>
			<div style="width: 100%; padding: 5%;">
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
						<div class="clase1"><input type="text" value="Dato de prueba" readonly></div>
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div style="width: 100%; height: 15px; clear: both; float: left;"></div>
		<div style="width: 100%; height: 2px; background: black; float: left;"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div style="width: 50%;float: left;"></div>
			<div style="width: 50%; padding: 10px; float: right;">
				<table name="EnviarCompra">
					<tr>
						<td class="nombrecampo">
							Importe
						</td>
						<td class="campo">
							<input type="text" class="text-input required" />
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Descuento
						</td>
						<td class="campo">
							<input type="text" class="text-input required" />
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Impuestos
						</td>
						<td class="campo">
							<input type="text" class="text-input required" />
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Total
						</td>
						<td class="campo">
							<input type="text" class="text-input required" />
						</td>
					</tr>
					<tr>
						<td class="boton">
							<input type="submit" value="Cancelar" class="text-input required" />
						</td>
						<td class="boton">
							<input type="submit" value="Procesar Compra" class="text-input required" />
						</td>
					</tr>
				</table>
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div style="width: 100%; height: 2px; background: black; float: left;"></div>
		</fieldset>
	</form>
	<br>
</div>
	<hr>
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