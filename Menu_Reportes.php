<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_GET['STD'])){
		if($_GET['STD'] == 'cr'){
			echo "<script type='text/javascript'>alert('Credenciales Actualizadas con Exito.');</script>";
		}
		else if($_GET['STD'] == 'al'){
			echo "<script type='text/javascript'>alert('Salida a almuerzo Registrada.');</script>";	
		}
		else if($_GET['STD'] == 'sal'){
			echo "<script type='text/javascript'>alert('Salida Registrada Correctamente.');</script>";	
		}
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
<link rel="stylesheet" type="text/css" media="all" href="style/Botones.css" />
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

	<h1 class="title">Reportes Administrativos</h1>
	<!-- <img src="style/images/bg/Logo2.jpg" id='logo'> -->
<div class="form-container">
	<form class="forms" action="Mostrar_Reporte.php" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Seleccione su Reporte
					</td>
					<td class="campo">
						<ol>
							<label>
								<select name="Ddl_Reporte">
									<option value="#">--SELECCIONE--</option>
									<option value="Reporte_Actividad_Empleados.php">
										Reporte Actividad Empleados
									</option>
									<option value="Reporte_Movimiento_Efectivo.php">
										Reporte Movimiento de Efectivo
									</option>
									<option value="Reporte_Venta_por_Kiosco.php">
										Reporte Venta por Kiosco
									</option>
									<option value="Reporte_Venta_por_Empleado.php">
										Reporte Venta por Empleado
									</option>
									<option value="Reporte_Venta_por_Factura.php">
										Reporte Venta por Factura
									</option>
									<option value="Reporte_Pagos_con_Tarjeta_Kiosco.php">
										Reporte Pagos con Tarjeta por Kiosco
									</option>
									<option value="Reporte_Retiros_Caja_Kiosco.php">
										Reporte Retiro de Efectivo por Kiosco
									</option>
									<option value="Reporte_Comisiones_por_Empleado_Anual.php">
										Reporte Comisiones por Empleado Anual
									</option>
									<option value="Reporte_Comisiones_por_Empleado_Mensual.php">
										Reporte Comisiones por Empleado Mensual
									</option>
									<option value="Reporte_Comisiones_por_Empleado_Diaria.php">
										Reporte Comisiones por Empleado Diario
									</option>
									<option value="Reporte_Movimiento_Efectivo_por_Factura.php">
										Reporte Movimiento de Efectivo por Factura
									</option>
									<option value="Reporte_Movimiento_Efectivo_Total_por_Factura.php">
										Reporte Movimiento de Efectivo Total por Factura
									</option>
									<option value="Reporte_Movimiento_Efectivo_Total_por_Kiosco.php">
										Reporte Movimiento de Efectivo Total por Kiosco
									</option>
									<option value="Reporte_Movimiento_Efectivo_por_Kiosco.php">
										Reporte Movimiento de Efectivo por Kiosco
									</option>
								</select>
							</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Generar" name="submit" class="button edit" />
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