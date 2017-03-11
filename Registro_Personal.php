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

		if(isset($_GET['ID_EM'])){
			$ID_EM = $_GET['ID_EM'];
			$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado WHERE ID_Empleado = '" . $_GET['ID_EM'] . "';";
			$Personal_result = mquery($QueryPersonal);	
			$Personal_Data = mysqli_fetch_array($Personal_result);

			$Nombre_Personal = $Personal_Data["Nombre_Empleado"];
			$Apellido_Personal = $Personal_Data["Apellido_Empleado"];
			$DIP_Personal = $Personal_Data["DPI_Empleado"];
			$Telefono_Personal = $Personal_Data["Telefono_Empleado"];
			$Email_Personal = $Personal_Data["Email_Empleado"];
			$Salario_Personal = $Personal_Data['Salario_Base_Empleado'];
			$ID_Kiosco = $Personal_Data['Kiosco_ID_Kiosco'];
			$Descripcion_Kiosco = $Personal_Data['Descripcion_Kiosco'];
			$ID_Rol = $Personal_Data['Rol_ID_Rol'];
		}
		else{
			$ID_EM = "0";
			$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado;";
			$Personal_result = mquery($QueryPersonal);	

			$Nombre_Personal = "";
			$Apellido_Personal = "";
			$DIP_Personal = "";
			$Telefono_Personal = "";
			$Email_Personal = "";
			$Salario_Personal = "";
			$ID_Kiosco = "0";
			$ID_Rol = "0";
		}
	}
	else if($estado == 'u'){
		
		$valoresHTML = " value='";

		if(isset($_GET['ID_EM'])){
			$ID_EM = $_GET['ID_EM'];
			$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado WHERE ID_Empleado = '" . $_GET['ID_EM'] . "';";
			$Personal_result = mquery($QueryPersonal);	
			$Personal_Data = mysqli_fetch_array($Personal_result);

			$Nombre_Personal = $Personal_Data["Nombre_Empleado"];
			$Apellido_Personal = $Personal_Data["Apellido_Empleado"];
			$DIP_Personal = $Personal_Data["DPI_Empleado"];
			$Telefono_Personal = $Personal_Data["Telefono_Empleado"];
			$Email_Personal = $Personal_Data["Email_Empleado"];
			$Salario_Personal = $Personal_Data['Salario_Base_Empleado'];
			$ID_Kiosco = $Personal_Data['Kiosco_ID_Kiosco'];
			$Descripcion_Kiosco = $Personal_Data['Descripcion_Kiosco'];
			$ID_Rol = $Personal_Data['Rol_ID_Rol'];
		}
		else{
			$ID_EM = "0";
			$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado;";
			$Personal_result = mquery($QueryPersonal);	

			$Nombre_Personal = "";
			$Apellido_Personal = "";
			$DIP_Personal = "";
			$Telefono_Personal = "";
			$Email_Personal = "";
			$Salario_Personal = "";
			$ID_Kiosco = "0";
			$ID_Rol = "0";
		}
	}
	else if($estado == 'i'){
		$ID_EM = "0";
		$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado;";
		$Personal_result = mquery($QueryPersonal);
		
		$valoresHTML = " value='";

		$Nombre_Personal = "";
		$Apellido_Personal = "";
		$DIP_Personal = "";
		$Telefono_Personal = "";
		$Email_Personal = "";
		$Salario_Personal = "";
		$ID_Kiosco = "0";
		$ID_Rol = "0";
	}
	else if($estado == '0'){
		$ID_EM = "0";
		$QueryPersonal = "SELECT e.*, k.Descripcion_Kiosco, u.Rol_ID_Rol, u.Estado_Usuario FROM empleado e INNER JOIN kiosco k ON e.Kiosco_ID_Kiosco = k.ID_Kiosco INNER JOIN usuario u ON e.ID_Empleado = u.Empleado_ID_Empleado;";
		$Personal_result = mquery($QueryPersonal);
	}
	else{
		$QueryPersonal = "";
		$ID_EM = "0";
		
		$valoresHTML = "Readonly value='";

		$Nombre_Personal = "";
		$Apellido_Personal = "";
		$DIP_Personal = "";
		$Telefono_Personal = "";
		$Email_Personal = "";
		$Salario_Personal = "";
		$ID_Kiosco = "0";
		$ID_Rol = "0";
	}

$Kiosco_count = mysqli_num_rows($Personal_result);

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

	<h1 class="title">Personal COPYCAT</h1>
	<hr>
		<div class="linea"></div>
		<div class="clear1"></div>
			<table class="tableData">
				<tr class="TableHeader">
					<td><span class="ColumnHeader"><STRONG>ID Empleado</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Nombre Completo</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>DPI</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Teléfono</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Email</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Salario</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Kiosco Asignado</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Acciones</STRONG></span></td>
				</tr>

				<?php 
					$i = 0;
					while ($Personal_Data = mysqli_fetch_array($Personal_result)) :
						if ($i % 2 == 0) $tabledetailclass = "TableDetail1"; 
						else $tabledetailclass = "TableDetail2";
				?>
						<tr class="<?php echo($tabledetailclass); ?>">
							<td>
								<span class="ColumnHeader">
									<STRONG>
											<?php echo($Personal_Data["ID_Empleado"]); ?>
										</a>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo $Personal_Data["Nombre_Empleado"] . ' ' . $Personal_Data['Apellido_Empleado']; ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Personal_Data["DPI_Empleado"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
									<?php echo($Personal_Data["Telefono_Empleado"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Personal_Data["Email_Empleado"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Personal_Data["Salario_Base_Empleado"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Personal_Data["Descripcion_Kiosco"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<a href="Registro_Personal.php?STD=u&ID_EM=<?php echo($Personal_Data["ID_Empleado"]); ?>">
									<STRONG>Editar</STRONG>
								</a>
								<a href="Registro_Personal.php?STD=v&ID_EM=<?php echo($Personal_Data["ID_Empleado"]); ?>">
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
	<form class="forms" action="Operar_Empleado.php?estado=<?php echo $estado . "&ID_EM=" . $ID_EM;?>" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						DPI
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_DPI_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $DIP_Personal . "'"; ?>/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Nombres
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Nombres_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $Nombre_Personal . "'"; ?>/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Apellidos
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Apellidos_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $Apellido_Personal . "'"; ?>/>
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
								<input type="text" name="txt_Telefono_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $Telefono_Personal . "'"; ?>/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						E-mail
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Email_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $Email_Personal . "'"; ?>/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Kiosco Asignado
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Kiosco_Asignado">
								<?php
								 $SQL = "SELECT ID_Kiosco, Descripcion_Kiosco FROM kiosco;";
								 $ID = "ID_Kiosco";
								 $Data = "Descripcion_Kiosco";
								 Cargar_Combo($SQL,$ID,$Data,$ID_Kiosco);
								?>
							</select>
						</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Salario Base
					</td>
					<td class="campo">
						<ol>
							<li class="form-row text-input-row">
								<input type="text" name="txt_Salario_Empleado" class="text-input required" title="" <?php echo $valoresHTML . $Salario_Personal . "'"; ?>/>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Rol Asignado
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Rol">
								<?php
								 $SQL = "SELECT ID_Rol, Descripcion_Rol FROM rol;";
								 $ID = "ID_Rol";
								 $Data = "Descripcion_Rol";
								 Cargar_Combo($SQL,$ID,$Data,$ID_Rol);
								?>
							</select>
						</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Estado
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Estado">
								<?php
								 $SQL = "SELECT '1' AS ID_Estado, 'Activo' AS Descripcion_Estado UNION SELECT '2' AS ID_Estado, 'Inactivo' AS Descripcion_Estado";
								 $ID = "ID_Estado";
								 $Data = "Descripcion_Estado";
								 Cargar_Combo($SQL,$ID,$Data,$ID_Rol);
								?>
							</select>
						</label>
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