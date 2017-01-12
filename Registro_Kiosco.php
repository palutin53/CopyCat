<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
	/*
	STD
	i = Insert
	u = Update
	v = View
	*/
	if(isset($_GET['STD'])){
		$estado = $_GET['STD'];
	}
	else{
		$estado = "0";
	}

	if($estado == 'v'){

		$valoresHTML = "Readonly value='";

		if(isset($_GET['ID_KC'])){
			$QueryKiosco = "SELECT * FROM Kiosco WHERE ID_Kiosco = '" . $_GET['ID_KC'] . "'";
			$Kiosco_result = mquery($QueryKiosco);	
			$Kiosco_Data = mysqli_fetch_array($Kiosco_result);

			$Descripcion_Kiosco = $Kiosco_Data["Descripcion_Kiosco"];
			$Tel_Kiosco = $Kiosco_Data["Telefono_Kiosco"];
			$Hora_Ingreso = $Kiosco_Data["Horario_Ingreso_Kiosco"];
			$Hora_Salida = $Kiosco_Data["Horario_Salida_Kiosco"];
			$Hora_Max_Ingreso = $Kiosco_Data["Horario_Max_Ingreso_Kiosco"];
		}
		else{
			$QueryKiosco = "SELECT * FROM Kiosco";
			$Kiosco_result = mquery($QueryKiosco);	

			$Descripcion_Kiosco = "";
			$Tel_Kiosco = "";
			$Hora_Ingreso = "";
			$Hora_Salida = "";
			$Hora_Max_Ingreso = "";
		}
	}
	else if($estado == 'u'){
		
		$valoresHTML = " value='";

		if(isset($_GET['ID_KC'])){
			$QueryKiosco = "SELECT * FROM Kiosco WHERE ID_Kiosco = '" . $_GET['ID_KC'] . "'";
			$Kiosco_result = mquery($QueryKiosco);	
			$Kiosco_Data = mysqli_fetch_array($Kiosco_result);

			$Descripcion_Kiosco = $Kiosco_Data["Descripcion_Kiosco"];
			$Tel_Kiosco = $Kiosco_Data["Telefono_Kiosco"];
			$Hora_Ingreso = $Kiosco_Data["Horario_Ingreso_Kiosco"];
			$Hora_Salida = $Kiosco_Data["Horario_Salida_Kiosco"];
			$Hora_Max_Ingreso = $Kiosco_Data["Horario_Max_Ingreso_Kiosco"];
		}
		else{
			$QueryKiosco = "SELECT * FROM Kiosco";
			$Kiosco_result = mquery($QueryKiosco);	

			$Descripcion_Kiosco = "";
			$Tel_Kiosco = "";
			$Hora_Ingreso = "";
			$Hora_Salida = "";
			$Hora_Max_Ingreso = "";
		}
	}
	else if($estado == 'i'){

		$QueryKiosco = "SELECT * FROM Kiosco";
		$Kiosco_result = mquery($QueryKiosco);
		
		$valoresHTML = " value='";

		$Descripcion_Kiosco = "";
		$Tel_Kiosco = "";
		$Hora_Ingreso = "";
		$Hora_Salida = "";
		$Hora_Max_Ingreso = "";
	}
	else if($estado == '0'){
		$QueryKiosco = "SELECT * FROM Kiosco";
		$Kiosco_result = mquery($QueryKiosco);
	}
	else{
		$QueryKiosco = "";
		
		$valoresHTML = "Readonly value='";

		$Descripcion_Kiosco = "";
		$Tel_Kiosco = "";
		$Hora_Ingreso = "";
		$Hora_Salida = "";
		$Hora_Max_Ingreso = "";
	}

$Kiosco_count = mysqli_num_rows($Kiosco_result);
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

	<h1 class="title">Kioscos COPYCAT</h1>
	<hr>
		<div class="linea"></div>
		<div class="clear1"></div>
			<table class="tableData">
				<tr class="TableHeader">
					<td><span class="ColumnHeader"><STRONG>ID Kiosco</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Descripción</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Teléfono</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Hora de Ingreso</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Horas de Cierre</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Horas Max de Ingreso</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Acciones</STRONG></span></td>
				</tr>

				<?php 
					$i = 0;
					while ($Kiosco_Data = mysqli_fetch_array($Kiosco_result)) :
						if ($i % 2 == 0) $tabledetailclass = "TableDetail1"; 
						else $tabledetailclass = "TableDetail2";
				?>
						<tr class="<?php echo($tabledetailclass); ?>">
							<td>
								<span class="ColumnHeader">
									<STRONG>
											<?php echo($Kiosco_Data["ID_Kiosco"]); ?>
										</a>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Kiosco_Data["Descripcion_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Kiosco_Data["Telefono_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
									<?php echo($Kiosco_Data["Horario_Ingreso_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Kiosco_Data["Horario_Salida_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Kiosco_Data["Horario_Max_Ingreso_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<a href="Registro_Kiosco.php?STD=u&ID_KC=<?php echo($Kiosco_Data["ID_Kiosco"]); ?>">
									<STRONG>Editar</STRONG>
								</a>
								<a href="Registro_Kiosco.php?STD=v&ID_KC=<?php echo($Kiosco_Data["ID_Kiosco"]); ?>">
									<STRONG>-- Ver</STRONG>
								</a>
							</td>
						</tr>
				<?php
					$i++;
					endwhile;
				?>
			</table>

		<div class="clear1">
			<?php
				echo "Kioscos Registrados: " . $Kiosco_count;
			?>
		</div>
		<div class="clear1"></div>
		<div class="linea"></div>
<div class="form-container">

<?php
	if($estado != "0"){
?>
	<form class="forms" action="Operar_Kiosco.php?estado= <?php echo $estado . "&ID_KC=" . $Kiosco_Data["ID_Kiosco"];?>" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Nombre Kiosco
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Nombre_Kiosco" class="text-input required" <?php echo $valoresHTML . $Descripcion_Kiosco . "'"; ?>/>
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
								<input type="text" name="txt_Num_Telefono_Kiosco" class="text-input required" <?php echo $valoresHTML . $Tel_Kiosco . "'"; ?> />
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Horario de Apertura
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="time" name="txt_Horario_Ingreso_Kiosco" max="23:59:00" min="07:30:00" step="1" <?php echo $valoresHTML . $Hora_Ingreso . "'"; ?>>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Horario de Cierre
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="time" name="txt_Horario_Cierre_Kiosco" max="23:59:00" min="07:30:00" step="1" <?php echo $valoresHTML . $Hora_Salida . "'"; ?>>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Horario Maximo de Apertura
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="time" name="txt_Horario_Max_Ingreso_Kiosco" max="23:59:00" min="07:30:00" step="1" <?php echo $valoresHTML . $Hora_Max_Ingreso . "'"; ?>>
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
	<?php
		}
		else{
			echo "<form></form>";
		}
	?>
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