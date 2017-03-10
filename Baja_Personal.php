<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_POST['txt_Busqueda_Empleado'])){
		$Dato = $_POST['txt_Busqueda_Empleado'];
		$data = 1;
	}
	else
	{
		$Dato = "";
		$data = 0;
	}

?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		
		<link rel="stylesheet" href="style/Tabs.css">
		<link rel="stylesheet" href="style/Fonts-Tabs.css">
		<link rel="stylesheet" href="style/sky-tabs.css">
		
		<!--[if lt IE 9]>
			<link rel="stylesheet" href="css/sky-tabs-ie8.css">
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
			<script src="js/sky-tabs-ie8.js"></script>
		<![endif]-->

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
<script type="text/javascript">
	$.backstretch("style/images/bg/Movistar.jpg");
</script>
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

	<h1 class="title">Baja de Personal</h1>
	<hr>
<div class="form-container">
<form class="forms" action="" method="post">
<fieldset>
<!-- *********************TABS***************************** -->

<div class="body">
		
			<!-- tabs -->
			<div class="sky-tabs sky-tabs-pos-top-left sky-tabs-anim-flip sky-tabs-response-to-icons">
				<input type="radio" name="sky-tabs" checked id="sky-tab1" class="sky-tab-content-1">
				<label for="sky-tab1"><span><span><i class="fa fa-bolt"></i>Baja de Personal</span></span></label>
				
				<ul>
					<li class="sky-tab-content-1">					
						<div class="">
							<h4>Baja de Personal</h4>
							<form class="forms" action="Baja_Personal.php" method="post">
						  <table>
								<tr>
									<td class="nombrecampo">
										Buscar Empleado
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Busqueda_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>									
							</table>
						  </form>

						  <table class="tableData">
										<tr class="TableHeader">
											<td><span class="ColumnHeader"><STRONG>CODIGO EMPLEADO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>NOMBRE COMPLETO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>EMAIL</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>PUESTO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>PLANILLA</STRONG></span></td>
											<!--<td><span class="ColumnHeader"><STRONG>AREA</STRONG></span></td>-->
											<td><span class="ColumnHeader"><STRONG>CATEGORIA</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>FECHA ANTIGUEDAD</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>BAJA</STRONG></span></td>
										</tr>
									<?php
									/*----------------------Consulta de Parqueos-------------------*/
									if($data == 0){
									$queryText = "SELECT 
													    ie.ID_Empleado,
													    CONCAT(ie.Nombres_Informacion_Empleado, ' ', ie.Apellidos_Informacion_Empleado) Nombre,
													    ie.Correo_Empresa_Informacion_Empleado,
													    ie.Fecha_Antiguedad_Informacion_Empleado,
													    p.Nombre_Puesto,
													    cp.Descripcion_Categoria_Puesto,
													    pl.Descripcion_Planilla,
    													ar.Descripcion_Areas_RRHH
													FROM
													    informacion_empleado ie
													INNER JOIN empleado e ON ie.ID_Empleado = e.Informacion_Empleado_ID_Empleado
													INNER JOIN puesto p ON e.Puesto_ID_Puesto = p.ID_Puesto
													INNER JOIN planilla pl ON e.Planilla_ID_Planilla = pl.ID_Planilla
													INNER JOIN areas_rrhh ar ON e.Areas_RRHH_ID_Areas_RRHH = ar.ID_Areas_RRHH
													INNER JOIN categoria_puesto cp ON e.Categoria_Puesto_ID_Categoria_Puesto = cp.ID_Categoria_Puesto;";
									}
									else{
									$queryText = "SELECT 
													    ie.ID_Empleado,
													    CONCAT(ie.Nombres_Informacion_Empleado, ' ', ie.Apellidos_Informacion_Empleado) Nombre,
													    ie.Correo_Empresa_Informacion_Empleado,
													    ie.Fecha_Antiguedad_Informacion_Empleado,
													    p.Nombre_Puesto,
													    cp.Descripcion_Categoria_Puesto,
													    pl.Descripcion_Planilla,
													    ar.Descripcion_Areas_RRHH
													FROM
													    informacion_empleado ie
													INNER JOIN empleado e ON ie.ID_Empleado = e.Informacion_Empleado_ID_Empleado
													INNER JOIN puesto p ON e.Puesto_ID_Puesto = p.ID_Puesto
													INNER JOIN planilla pl ON e.Planilla_ID_Planilla = pl.ID_Planilla
													INNER JOIN areas_rrhh ar ON e.Areas_RRHH_ID_Areas_RRHH = ar.ID_Areas_RRHH
													INNER JOIN categoria_puesto cp ON e.Categoria_Puesto_ID_Categoria_Puesto = cp.ID_Categoria_Puesto
													WHERE ie.ID_Empleado LIKE '%" . $Dato . "%' OR ie.Nombres_Informacion_Empleado LIKE '%" . $Dato . "%' OR ie.Apellidos_Informacion_Empleado LIKE '%" . $Dato . "%';";	
									}

									$Paqueo_Result = mquery($queryText) or die ("Error al intentar Conectar: " . mysql_error());
									/*-----------------------------------------------------------*/

										$i = 0;
										while ($Parqueo_Record = mysqli_fetch_array($Paqueo_Result)) :
											//if ($i % 2 == 0) $tabledetailclass = "TableDetail1";
											if ($i % 2 == 0){
												$tabledetailclass = "TableDetail2";
											}
											else{
												$tabledetailclass = "TableDetail1";
											}					
									?>
											<tr class="<?php echo($tabledetailclass); ?>">
												<td><?php echo($Parqueo_Record["ID_Empleado"]);?></td>
												<td><?php echo(utf8_encode($Parqueo_Record["Nombre"]));?></td>
												<td><?php echo($Parqueo_Record["Correo_Empresa_Informacion_Empleado"]);?></td>
												<td><?php echo(utf8_encode($Parqueo_Record["Nombre_Puesto"]));?></td>
												<td><?php echo(utf8_encode($Parqueo_Record["Descripcion_Planilla"]));?></td>
												<!--<td><?php //echo(utf8_encode($Parqueo_Record["Descripcion_Areas_RRHH"]));?></td>-->
												<td><?php echo(utf8_encode($Parqueo_Record["Descripcion_Categoria_Puesto"]));?></td>
												<td><?php echo(utf8_encode($Parqueo_Record["Fecha_Antiguedad_Informacion_Empleado"]));?></td>
												<td><form><input type="submit" value="Baja" class="btn-submit"></form></td>
											</tr>
									<?php
										$i++;
										endwhile;				
									?>
						  </table>

						</div>
					</li>
				</ul>
			</div>
			<!--/ tabs -->
			
		</div>

<!-- *******************************************************-->
<li class="button-row"><input type="submit" value="Guardar" name="submit" class="btn-submit" />
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