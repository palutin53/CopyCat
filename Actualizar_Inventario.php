<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");

	if(isset($_GET['STD'])){
		echo "<script type='text/javascript'>alert('Inventario Actualizado con exito.')</script>";
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

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

  <script>

  $(document).ready(function(){
  	//var tipo = $("select#Ddl_Tipo_Producto").val();
  	var tipo = $('select#Ddl_Tipo_Producto').val();
    $("#des_prod").autocomplete({
      source: "PHP/Busqueda_Productos.php",
      minLength: 2
    });
 
    $("#des_prod").focusout(function(){
      $.ajax({
          url:'PHP/Busqueda_Detalle_Productos.php',
          type:'POST',
          dataType:'json',
          data:{ des_prod:$('#des_prod').val()}
      }).done(function(respuesta){
      	  $("input#txt_ID_Producto").val(respuesta.Codigo);
      });
    });
});

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

	<h1 class="title">Actualizar Inventarios</h1>
	<!-- <img src="style/images/bg/Logo2.jpg" id='logo'> -->
<div class="form-container">
	<form class="forms" action="Operar_Actualizacion_Inventario.php" method="post">
		<fieldset>
			<table>
				<tr>
					<td class="nombrecampo">
						Producto/Servicio
					</td>
					<td class="campo">
						<input type="text" name="des_prod" id="des_prod" value="" class="text-input required=" title="" required/>
						<input type="hidden" name="txt_ID_Producto" id="txt_ID_Producto">
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Kiosco
					</td>
					<td class="campo">
						<ol>
						<label>
							<select name="Ddl_Kiosco">
								<?php
								 $SQL = "SELECT ID_Kiosco, Descripcion_Kiosco FROM kiosco;";
								 $ID = "ID_Kiosco";
								 $Data = "Descripcion_Kiosco";
								 Cargar_Combo($SQL,$ID,$Data,'0');
								?>
							</select>
						</label>
						</ol>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Tipo de Movimiento
					</td>
					<td class="campo">
						<label>
								<select name="DDl_Tipo_Mov">
									<option value="#">--SELECCIONE--</option>
									<option value="1">
										INCREMENTO
									</option>
									<option value="2">
										DECREMENTO
									</option>
								</select>
						</label>
					</td>
				</tr>
				<tr>
					<td class="nombrecampo">
						Cantidad de Movimiento
					</td>
					<td class="campo">
						<input type="text" name="txt_Cantidad_Mov" id="txt_Cantidad_Mov" value="" class="text-input required=" title="" required/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Actualizar" name="submit" class="button edit" />
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