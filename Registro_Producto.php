<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_GET['STD'])){
		if($_GET['STD'] == 'v'){
			echo "<script type='text/javascript'>alert('Producto ingresado con exito.')</script>";
		}
	}
	else{
		echo "<script type='text/javascript'>alert('Error al intentar guardar.')</script>";	
	}

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
<div class="intro">CopyCat</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Registro Productos Nuevos</h1>
	<hr>
<div class="form-container">
	<form enctype="multipart/form-data" class="forms" action="Operar_Registro_Producto.php" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Codigo Producto
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Codigo_Producto" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Descripción
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<textarea name="txt_Descripcion_Producto" rows="10" cols="50" maxlength="75"></textarea>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Tipo de Producto
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Tipo_Producto">
								<?php
								 $SQL = "SELECT * FROM tipo_producto;";
								 $ID = "ID_Tipo_Producto";
								 $Data = "Descripcion_Tipo_Producto";
								 Cargar_Combo($SQL,$ID,$Data,'0');
								?>
							</select>
						</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Precio Unitario
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Precio_Producto" value="" class="text-input required" title="" />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Genera Comisión
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Genera_Comision">
									<option value="">--SELECCIONE--</option>
									<option value="s">SI</option>
									<option value="n">NO</option>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						¿Se presta a Domicilio?
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Domicilio">
									<option value="">--SELECCIONE--</option>
									<option value="s">SI</option>
									<option value="n">NO</option>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						¿Utiliza Corte en Maquina?
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Corte">
									<option value="">--SELECCIONE--</option>
									<option value="s">SI</option>
									<option value="n">NO</option>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Imagen Producto
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input name="imgProducto" type="file" />
							</li>
						</ol>
					</td>
				</tr>

				

			</table>
			<li class="button-row">
				<input type="submit" value="Guardar" name="save" class="btn-submit" />
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