<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		
		<link rel="stylesheet" href="style/Tabs.css">
		<link rel="stylesheet" href="style/Fonts_Tabs.css">
		<link rel="stylesheet" href="style/sky-tabs.css">
		
		<!--[if lt IE 9]>
			<link rel="stylesheet" href="css/sky-tabs-ie8.css">
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
			<script src="js/sky-tabs-ie8.js"></script>
		<![endif]-->

<title>Recursos Humanos</title>
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
<script type="text/javascript">
	$.backstretch("style/images/bg/Fondo_Login.jpg");
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
<div class="intro">CopyCat</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Alta de Personal</h1>
	<hr>
<div class="form-container">
<form class="forms" action="" method="post">
<fieldset>
<!-- *********************TABS***************************** -->

<div class="body">
		
			<!-- tabs -->
			<div class="sky-tabs sky-tabs-pos-top-left sky-tabs-anim-flip sky-tabs-response-to-icons">
				<input type="radio" name="sky-tabs" checked id="sky-tab1" class="sky-tab-content-1">
				<label for="sky-tab1"><span><span><i class="fa fa-bolt"></i>Información Personal</span></span></label>
				
				<input type="radio" name="sky-tabs" id="sky-tab2" class="sky-tab-content-2">
				<label for="sky-tab2"><span><span><i class="fa fa-picture-o"></i>Información Personal</span></span></label>
				
				<input type="radio" name="sky-tabs" id="sky-tab3" class="sky-tab-content-3">
				<label for="sky-tab3"><span><span><i class="fa fa-cogs"></i>Información Medica</span></span></label>
				
				<input type="radio" name="sky-tabs" id="sky-tab4" class="sky-tab-content-4">
				<label for="sky-tab4"><span><span><i class="fa fa-globe"></i>Redes Sociales</span></span></label>

				<input type="radio" name="sky-tabs" id="sky-tab5" class="sky-tab-content-5">
				<label for="sky-tab5"><span><span><i class="fa fa-globe"></i>Información Laboral</span></span></label>
				
				<ul>
					<li class="sky-tab-content-1">					
						<div class="">
							<h4>Información Personal</h4>
							<table>
								<tr>
									<td class="nombrecampo">
										Nombres
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Nombre_Empleado" value="" class="text-input required" title="" />
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
										<input type="text" name="txt_Apellidos_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Fecha de Nacimientos
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="date" name="txt_Fecha_Nacimiento_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Genero
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Genero">
											<?php
											 $SQL = "SELECT * FROM genero";
											 $ID = "ID_Genero";
											 $Data = "Descripcion_Genero";
											 Cargar_Combo($SQL,$ID,$Data);
											?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Nacionalidad
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Nacionalidad">
											<?php
											 $SQL = "SELECT * FROM nacionalidad";
											 $ID = "ID_Nacionalidad";
											 $Data = "Descripcion_Nacionalidad";
											 Cargar_Combo($SQL,$ID,$Data);
											?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Estado Civil
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Estado_Civil">
											<?php
											 $SQL = "SELECT * FROM estado_civil";
											 $ID = "ID_Estado_Civil";
											 $Data = "Descripcion_Estado_Civil";
											 Cargar_Combo($SQL,$ID,$Data);
											?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Religión
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Religion">
											<?php
											 $SQL = "SELECT * FROM religion";
											 $ID = "ID_Religion";
											 $Data = "Descripcion_Religion";
											 Cargar_Combo($SQL,$ID,$Data);
											?>
										</select>
										</label>
										</ol>
									</td>
								</tr>									

							</table>

						</div>
					</li>
					
					<li class="sky-tab-content-2">
						<div class="">
							<h4>Información Personal</h4>
							
							<table>
		  	
								<tr>
									<td class="nombrecampo">
										Nivel Academico
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Nivel_Academico">
												<?php
												 $SQL = "SELECT * FROM nivel_academico";
												 $ID = "ID_Nivel_Academico";
												 $Data = "Descripcion_Nivel_Academico";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Titulo Obtenido
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Titulo_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Tipo de Sangre
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Tipo_Sangre">
												<?php
												 $SQL = "SELECT * FROM tipo_sangre";
												 $ID = "ID_Tipo_Sangre";
												 $Data = "Descripcion_Tipo_Sangre";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Tipo de Licencia de Conducir
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Tipo_Licencia">
												<?php
												 $SQL = "SELECT * FROM tipo_licencia_conducir";
												 $ID = "ID_Tipo_Licencia_Conducir";
												 $Data = "Descripcion_Tipo_Licencia_Conducir";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Fecha de Alta
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="date" name="txt_Fecha_Alta_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Fecha de Antiguedad
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="date" name="txt_Fecha_Antiguedad_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Correo Interno
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Correo_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

							</table>

						</div>
					</li>
					
					<li class="sky-tab-content-3">
						<div class="">
							<h4>Información Medica</h4>
							
							<table>
		  	
								<tr>
									<td class="nombrecampo">
										¿Es Alergico?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Alergico">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Alerico a
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Alergico_A_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Talla de Camisa
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Talla_Empleado">
												<?php
												 $SQL = "SELECT * FROM talla_cm";
												 $ID = "ID_Talla_CM";
												 $Data = "Descripcion_Talla_CM";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										¿Tiene Algún Impedimento Fisico?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Impedimento">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Descripción Impedimento Fisico
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Fecha_Alta_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

								<tr>
									<td class="nombrecampo">
										Hobby
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Hobby_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
								</tr>

							</table>

						</div>
					</li>
					
					<li class="sky-tab-content-4">
						<div class="">
							<h4>Redes Sociales</h4>
						<table>	
							<tr>
									<td class="nombrecampo">
										¿Tiene Redes Sociales?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Red_Social_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene Facebook?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Facebook_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene Twitter?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Twitter_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene Skype?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Skype_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene Yammer?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Yammer_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene Linkedin?
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Linkedin_Empleado">
												<option value="">--SELECCIONE--</option>
												<option value="1">SI</option>
												<option value="0">NO</option>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										¿Tiene otra Red Social?
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Otra_Red_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
							</tr>

						</table>

						</div>
					</li>

					<li class="sky-tab-content-5">
						<div class="">
							<h4>Información Laboral</h4>
							
						<table>

							<tr>
									<td class="nombrecampo">
										Codigo de Empleado
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_cod_empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Empresa
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Empresa_Empleado">
												<?php
												 $SQL = "SELECT * FROM Empresa";
												 $ID = "ID_Empresa";
												 $Data = "Descripcion_Empresa";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Planilla
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Plantilla_Empleado">
												<?php
												 $SQL = "SELECT * FROM Planilla";
												 $ID = "ID_Planilla";
												 $Data = "Descripcion_Planilla";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Generalista
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Generalista_Empleado">
												<?php
												 $SQL = "SELECT * FROM Generalista";
												 $ID = "ID_Generalista";
												 $Data = "Descripcion_Generalista";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Ambito de Puesto
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Ambito_Empleado">
												<?php
												 $SQL = "SELECT * FROM Ambito";
												 $ID = "ID_Ambito";
												 $Data = "Descripcion_Ambito";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Categoria de Puesto
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Categoria_Puesto_Empleado">
												<?php
												 $SQL = "SELECT * FROM Categoria_Puesto";
												 $ID = "ID_Categoria_Puesto";
												 $Data = "Descripcion_Categoria_Puesto";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Puesto
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Puesto">
												<?php
												 $SQL = "SELECT * FROM Puesto";
												 $ID = "ID_Puesto";
												 $Data = "Nombre_Puesto";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Mando
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Puesto">
												<?php
												 $SQL = "SELECT * FROM Mando";
												 $ID = "ID_Mando";
												 $Data = "Descripcion_Mando";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Área Funcional
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Area_Funcional">
												<?php
												 $SQL = "SELECT * FROM Area_Funcional";
												 $ID = "ID_Area_Funcional";
												 $Data = "Descripcion_Area_Funcional";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Actividad RRHH
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Activdad_rrhh">
												<?php
												 $SQL = "SELECT * FROM Actividad_RRHH";
												 $ID = "ID_Actividad_RRHH";
												 $Data = "Descripcion_Actividad_RRHH";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Area RRHH
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Area_rrhh">
												<?php
												 $SQL = "SELECT * FROM Areas_RRHH";
												 $ID = "ID_Areas_RRHH";
												 $Data = "Descripcion_Areas_RRHH";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Unidad Organizacional
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Unidad_Organizacional">
												<?php
												 $SQL = "SELECT * FROM Unidad_Organizacional";
												 $ID = "ID_Unidad_Organizacional";
												 $Data = "Nombre_Unidad_Organizacional";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Posicion
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Posicion">
												<?php
												 $SQL = "SELECT * FROM Posicion";
												 $ID = "ID_Posicion";
												 $Data = "Descripcion_Posicion";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

							<tr>
									<td class="nombrecampo">
										Ubicación Fisica
									</td>
									<td class="campo">
										<ol>
										<label>
											<select name="ddl_Ubicacion_Fisica">
												<?php
												 $SQL = "SELECT * FROM Ubicacion_Fisica";
												 $ID = "ID_Ubicacion_Fisica";
												 $Data = "Descripcion_Ubicacion_Fisica";
												 Cargar_Combo($SQL,$ID,$Data);
												?>
											</select>
										</label>
										</ol>
									</td>
							</tr>

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


<!--
	<form class="forms" action="" method="post">
		<fieldset>
			<ol>
				<li class="form-row text-input-row">
					Usuario
					<input type="text" name="name" value="" class="text-input required" title="" />
				</li>
				<li class="form-row text-input-row">
					Contraseña
					<input type="password" name="name" value="" class="text-input required" title="" />
				</li> 
				<li class="form-row text-input-row">
					Confirmar Contraseña
					<input type="password" name="name" value="" class="text-input required" title="" />
				</li>

				<li>
					<label>Perfil
						<select>
							<?php
							 $SQL = "SELECT * FROM departamento";
							 $ID = "ID_Depto";
							 $Data = "Descripcion_Depto";
							 Cargar_Combo($SQL,$ID,$Data);
							?>
						</select>
					</label>
				</li>

				<li>
					<label>Estado
						<select>
							<option value="">--SELECCIONE--</option>
							<option value="1">ACTIVO</option>
							<option value="0">INACTIVO</option>
						</select>
					</label>
				</li>
				<?php
				echo $_SESSION["User"];
					/*$Campos = array("ID_Usuario","Perfil_ID_Perfil","Password","Fecha_Creacion_Usuario","Fecha_Expiracion_Usuario","Estado_Usuario");
					$Valores = array("'JR111227'","1","'1211'","NOW()","DATE_ADD(NOW(), interval 12 month)","'1'");
					echo Insertar_Data("Usuario", $Campos, $Valores);*/
				?>
				<hr>
				<li class="button-row"><input type="submit" value="Guardar" name="submit" class="btn-submit" /></li>
			</ol>
		</fieldset>
	</form>
	-->
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