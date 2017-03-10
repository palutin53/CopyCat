<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
	
	$Num_Fac = $_POST['txt_Num_Factura_Busqueda'];
	$Tipo_Inc = $_POST['DDl_Tipo_Inc'];

	$QueryEncabezado = "SELECT 
						    Num_Encabezado_Factura,
						    Fecha_Encabezado_Factura,
						    Tipo_Pago_ID_Tipo_Pago,
						    Estudio_Mercado_ID_Estudio_Mercado,
						    Descuento_Encabezado_Factura,
						    Total_Venta_Encabezado_Factura
						FROM
						    encabezado_factura
						WHERE
						    Num_Factura_Encabezado_Factura = '" . $Num_Fac . "';";
	$Encabezado_result = mquery($QueryEncabezado);	
	$Encabezado_Data = mysqli_fetch_array($Encabezado_result);

	$Num_Enc_Fac = $Encabezado_Data["Num_Encabezado_Factura"];
	$Fecha_Enc_Fac = $Encabezado_Data["Fecha_Encabezado_Factura"];
	$Tipo_Pa = $Encabezado_Data["Tipo_Pago_ID_Tipo_Pago"];
	$Estudio = $Encabezado_Data["Estudio_Mercado_ID_Estudio_Mercado"];
	$Desc_Enc = $Encabezado_Data["Descuento_Encabezado_Factura"];
	$Total_Fact = $Encabezado_Data["Total_Venta_Encabezado_Factura"];

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" src="style/js/modal.js"></script>

<script type="text/javascript" src="style/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="Tabla_Detalle_Reclamo.js"></script>

<script>

	$(document).ready(function() {
    	var textoBusqueda = $("input#txt_Nit_Cliente").val();
	 
	     if (textoBusqueda != "") {
	        $.post("PHP/Busqueda_Cliente.php", {valorBusqueda: textoBusqueda}, function(mensaje) {
	            //$("#resultadoBusqueda").html(mensaje);
	            var res = mensaje.split(";");
	            $("input#txt_ID_Cliente").val(res[0]);
    			$("input#txt_Nombre_Cliente").val(res[1]);
    			$("input#txt_Direccion_Cliente").val(res[2]);
    			$("input#txt_Telefono_Cliente").val(res[4]);
    			$("input#txt_Email_Cliente").val(res[5]);
	         }); 
	     }
	     else{ 
	        $("#resultadoBusqueda").html('<p>NIT VACIO</p>');
	        $("input#txt_ID_Cliente").val('0');
	        $("input#txt_Nombre_Cliente").val('--');
	        $("input#txt_Direccion_Cliente").val('--');
	        $("input#txt_Telefono_Cliente").val('--');
	        $("input#txt_Email_Cliente").val('--');
	     };
	});

	function buscar() {
	    var textoBusqueda = $("input#txt_Nit_Cliente").val();
	 
	     if (textoBusqueda != "") {
	        $.post("PHP/Busqueda_Cliente.php", {valorBusqueda: textoBusqueda}, function(mensaje) {
	            //$("#resultadoBusqueda").html(mensaje);
	            var res = mensaje.split(";");
	            $("input#txt_ID_Cliente").val(res[0]);
    			$("input#txt_Nombre_Cliente").val(res[1]);
    			$("input#txt_Direccion_Cliente").val(res[2]);
    			$("input#txt_Telefono_Cliente").val(res[4]);
    			$("input#txt_Email_Cliente").val(res[5]);
	         }); 
	     }
	     else{ 
	        $("#resultadoBusqueda").html('<p>NIT VACIO</p>');
	        $("input#txt_ID_Cliente").val('0');
	        $("input#txt_Nombre_Cliente").val('--');
	        $("input#txt_Direccion_Cliente").val('--');
	        $("input#txt_Telefono_Cliente").val('--');
	        $("input#txt_Email_Cliente").val('--');
	     };
	};

</script>


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

  <script>
  /*$(function() {
  	var tipo = $("select#Ddl_Tipo_Producto").val();
    $("#des_prod" ).autocomplete({
      source: 'PHP/Busqueda_Productos.php?tipo='+tipo,
      minLength: 2
    });
  });*/

  $(document).ready(function(){
  	//var tipo = $("select#Ddl_Tipo_Producto").val();
  	var tipo = $('select#Ddl_Tipo_Producto').val();
    $("#des_prod").autocomplete({
      source: "PHP/Busqueda_Productos.php?tipo=" + $('select#Ddl_Tipo_Producto').val(),
      minLength: 2
    });
 
    $("#des_prod").focusout(function(){
      $.ajax({
          url:'PHP/Busqueda_Detalle_Productos.php',
          type:'POST',
          dataType:'json',
          data:{ des_prod:$('#des_prod').val()}
      }).done(function(respuesta){
      	  $("input#txt_Codigo_Producto").val(respuesta.Codigo);
      	  $("textarea#txt_Descripcion_Producto").val(respuesta.Descripcion_Detalle);
          $("input#txt_Precio_Unitario").val(respuesta.Precio);
          $("#img_prod").attr("src",respuesta.Img);
          $("input#txt_Existencia").val(respuesta.Existencia);
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

	<h1 class="title">Reporte de Incidencias</h1>
	<hr>
<div class="form-container">
	<?php
		if($Tipo_Inc == 1){
			echo "<form class='forms' action='' accept-charset='utf-8' method='POST'>";
		}
		else{
			echo "<form class='forms' action='Operar_Incidencia_Devolucion.php' accept-charset='utf-8' method='POST'>";	
		}
	?>
	
		<fieldset>
		<table>
			<tr>
				<td calss="nombrecampo">
					N.Factura
				</td>
				<td class="campo">
					<input type="text" name="txt_Num_Factura" id="txt_Num_Factura" value="<?php echo $Num_Fac?>" class="text-input required=" title="" disabled/>
				</td>
				<td class="nombreclase">
					Fecha
				</td>
				<td class="campo">
					<input type="text" name="txt_Fecha_Factura" id="txt_Fecha_Factura" value="<?php echo $Fecha_Enc_Fac?>" class="text-input required" title="" disabled/>
				</td>
			</tr>
		</table>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div class="linea"></div>
			<div style="padding: 10px;">
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio sub-div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div id="resultadoBusqueda"></div>
					<div style="width: 50%; float: left;">
					<table name="DatosProveedor">						
						<tr>
							<td class="nombrecampo">
								NIT:
							</td>
							<td class="campo">
								<input type="text" id="txt_Nit_Cliente" name="txt_Nit_Cliente" value="7051408-9" class="text-input required" title="" onKeyUp="buscar();" disabled/>
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Nombre:
							</td>
							<td class="campo">
								<input type="text" id="txt_Nombre_Cliente" name="txt_Nombre_Cliente" value="" class="text-input required" title="" disabled/>
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Dirección:
							</td>
							<td  class="campo" >
								<input type="text" id="txt_Direccion_Cliente" name="txt_Direccion_Cliente" value="" class="text-input required=" title="" disabled/>
							</td>
						</tr>
					</table>
				</div>

		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final sub-div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio sub-div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div style="float: right; width: 50%; height:100%;">
					<table name="FacturaCompra">
						<tr>
							<td class="nombreclase">
								Telefono
							</td>
							<td class="campo" colspan="4">
								<input type="text" id="txt_Telefono_Cliente" name="txt_Telefono_Cliente" value="" class="text-input required=" title="" disabled/>
							</td>
						</tr>
						<tr>
							<td class="nombreclase">
								Email
							</td>
							<td class="campo" colspan="4">
								<input type="text" id="txt_Email_Cliente" name="txt_Email_Cliente" value="" class="text-input required=" title="" disabled/>
								<input type="hidden" name="txt_ID_Cliente" id="txt_ID_Cliente">
								<input type="hidden" name="txt_Encabezado_Fac" id="txt_Encabezado_Fac" value="<?php echo $Num_Enc_Fac?>">
							</td>
						</tr>
						
					</table>
				</div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final sub-div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<!--<div class="linea"></div>
		<div class="clear1"></div>
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			<table>
					<tr>
						<td class="campo">
							<div class="contenido">
								<a href="#" class="mostrarmodal">
									<img src="style/images/boton.png">
								</a>
							</div>
						</td>
					</tr>
			</table>-->
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="linea"></div>
		<div class="clear1"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<table class="tableData" id="">
				<tbody>
					<tr class="TableHeader">
						<td><span class="ColumnHeader"><STRONG>Cantidad</STRONG></span></td>
						<td><span class="ColumnHeader"><STRONG>Cod Producto</STRONG></span></td>
						<td><span class="ColumnHeader"><STRONG>Descripción</STRONG></span></td>
						<td><span class="ColumnHeader"><STRONG>Precio Q.</STRONG></span></td>
						<td><span class="ColumnHeader"><STRONG>Total</STRONG></span></td>
					</tr>

					<?php
					$QueryDetalle = "SELECT 
										'0.00' AS Total_Detalle_Encabezado_Factura, '--' AS 
										Cantidad_Producto_Detalle_Encabezado_Factura,
										'--' AS Producto_Servicio_Cod_Producto_Servicio, '--' AS Descripcion_Producto_Servicio,
										'--' AS Precio_Producto_Servicio, '0' AS ID_Detalle_Encabezado_Factura
									UNION 
									SELECT 
										def.Total_Detalle_Encabezado_Factura,
									    def.Cantidad_Producto_Detalle_Encabezado_Factura,
									    def.Producto_Servicio_Cod_Producto_Servicio,
									    p.Descripcion_Producto_Servicio,
									    p.Precio_Producto_Servicio,
									    def.ID_Detalle_Encabezado_Factura
									FROM
									    detalle_encabezado_factura def
									    INNER JOIN producto_servicio p ON def.Producto_Servicio_Cod_Producto_Servicio = p.Cod_Producto_Servicio
									WHERE
									    def.Num_Encabezado_Factura = '" . $Num_Enc_Fac . "';";
					$Detalle_result = mquery($QueryDetalle);	
					$Detalle_Data = mysqli_fetch_array($Detalle_result);

					$i = 0;
					while ($Detalle_Data = mysqli_fetch_array($Detalle_result)) :
						if ($i % 2 == 0) $tabledetailclass = "TableDetail1"; 
						else $tabledetailclass = "TableDetail2";
					?>
						<tr class="<?php echo($tabledetailclass); ?>">
							<td>
								<span class="ColumnHeader">
									<STRONG>
											<?php echo($Detalle_Data["Cantidad_Producto_Detalle_Encabezado_Factura"]); ?>
										</a>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Detalle_Data["Producto_Servicio_Cod_Producto_Servicio"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Detalle_Data["Descripcion_Producto_Servicio"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
									<?php echo($Detalle_Data["Precio_Producto_Servicio"]); ?>
									</STRONG>
								</span>
							</td>
							<td>
								<span class="ColumnHeader">
									<STRONG>
										<?php echo($Detalle_Data["Total_Detalle_Encabezado_Factura"]); ?>
									</STRONG>
								</span>
							</td>
						</tr>
				<?php
					$i++;
					endwhile;
				?>

				</tbody>
			</table>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="clear1"></div>
		<div class="linea"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div style="width: 50%;float: left;"></div>
			<div style="width: 80%;  float: right;">
				<table name="EnviarCompra">
					<tr>
						<td class="nombrecampo">
							Importe
						</td>
						<td class="campo">
							<input type="text" id="total_importe" name="total_importe" class="text-input required" disabled value="<?php echo $Total_Fact?>" />
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Descuento
						</td>
						<td class="campo">
							<input type="text" value="<?php echo $Desc_Enc?>" id="txt_Descuento" name="txt_Descuento" class="text-input required" disabled  />
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Total
						</td>
						<td class="campo">
							<input type="text" id="txt_Total_Venta" name="txt_Total_Venta" class="text-input required" disabled value="<?php echo $Total_Fact?>"/>
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Tipo de Pago
						</td>
						<td class="campo">
							<ol>
								<label>
									<select name="Ddl_Tipo_Pago" id="Ddl_Tipo_Pago" disabled>
										<?php
										 $SQL = "SELECT ID_Tipo_Pago, Descripcion_Tipo_Pago FROM tipo_pago";
										 $ID = "ID_Tipo_Pago";
										 $Data = "Descripcion_Tipo_Pago";
										 Cargar_Combo($SQL,$ID,$Data,$Tipo_Pa);
										?>
									</select>
								</label>
							</ol>
						</td>
					</tr>
					<tr>
						<td class="nombrecampo">
							¿Como se Entero?
						</td>
						<td class="campo">
							<ol>
								<label>
									<select name="Ddl_Estudio_Mercado" id="Ddl_Estudio_Mercado" disabled>
										<?php
										 $SQL = "SELECT ID_Estudio_Mercado, Detalle_Estudio_Mercado FROM estudio_mercado";
										 $ID = "ID_Estudio_Mercado";
										 $Data = "Detalle_Estudio_Mercado";
										 Cargar_Combo($SQL,$ID,$Data,$Estudio);
										?>
									</select>
								</label>
							</ol>
						</td>
					</tr>
				</table>
				<div class="clear1"></div>
				<div class="linea"></div>
				<table>
					<tr>
						<td class="nombrecampo">
							Tipo Incidencia
						</td>
						<td class="campo">
							<ol>
								<label>
									<select name="Ddl_Tipo_Inc" id="Ddl_Tipo_Inc" disabled>
										<?php
										 	$SQL = "SELECT ID_Tipo_Incidencia, Descripcion_Tipo_Incidencia FROM tipo_incidencia";
											$ID = "ID_Tipo_Incidencia";
											$Data = "Descripcion_Tipo_Incidencia";
										 	Cargar_Combo($SQL,$ID,$Data,$Tipo_Inc);
										?>
									</select>
								</label>
							</ol>
						</td>
					</tr>
					<?php
						if($Tipo_Inc == '1'){
							echo "	
									<tr>
										<td class='nombrecampo'>
											¿Se Entrega Nuevo Producto?
										</td>
										<td class='campo'>
											<label>
													<select name='Ddl_Aplica_Prod' id='Ddl_Aplica_Prod'>
														<option value='#'>--SELECCIONE--</option>
														<option value='s'>
															SI
														</option>
														<option value='n'>
															NO
														</option>
													</select>
											</label>
										</td>
									</tr>
									<tr>
										<td class='campo'>
											<div class='contenido'>
												<a href='#' class='mostrarmodal'>
													<img src='style/images/boton.png'>
												</a>
											</div>
										</td>
									</tr>
									<tr>
									<table class='tableData' id='myTable'>
											<tbody>
												<tr class='TableHeader'>
													<td><span class='ColumnHeader'><STRONG>Cantidad</STRONG></span></td>
													<td><span class='ColumnHeader'><STRONG>Cod Producto</STRONG></span></td>
													<td><span class='ColumnHeader'><STRONG>Descripción</STRONG></span></td>
													<td><span class='ColumnHeader'><STRONG>Precio Q.</STRONG></span></td>
													<td><span class='ColumnHeader'><STRONG>Total</STRONG></span></td>
												</tr>
											</tbody>
									</table>
									</tr>";
						}
						else{
							echo "	<tr>
										<td class='nombrecampo'>
											Total
										</td>
										<td class='campo'>
											<input type='text' id='txt_Devolucion_Venta' name='txt_Devolucion_Venta' class='text-input required'/>
										</td>
									</tr>";
						}
					?>
					<tr>
						<td><div class="clear1"></div></td>
						<td><div class="linea"></div></td>
					</tr>
					<tr>
						<td class="nombrecampo">
							Observaciones
						</td>
						<td class="campo">
							<textarea name="txt_Observaciones_Incidencia" id="txt_Observaciones_Incidencia" rows="10" cols="50" maxlength="100" required></textarea>
						</td>
					</tr>
					<tr>
						<td><div class="clear1"></div></td>
					</tr>
					<tr>
						<td class="campo">
							<?php
								if($Tipo_Inc == 1){
									echo "<input type='submit' value='Procesar' name='Buscar_Data' id='btnRecorrer' class='btn-submit' />";
								}
								else{
									echo "<input type='submit' value='Procesar' name='Buscar_Data' id='Buscar_Data' class='btn-submit' />";	
								}
							?>
							
						</td>
					</tr>
				</table>
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="linea"></div>
		</fieldset>
	</form>
	<br>

	<!-- *********** MODAL *********** -->
		<div class="cajaexterna">
			<div class="cajainterna animated">
			    <div class="cajacentrada">
		        <h2>Seleccionar Producto</h2>
		        <p>
		        	Producto o Servicio<br/> <br/>
	        		<form class="forms" action="#" accept-charset="utf-8" method="POST">
					<fieldset>
				    	<table style="width: 100%;">
				       		<tr>
								<td class="nombrecampo">
									Busqueda Producto
								</td>
								<td class="campo" colspan="4">
									<input id="des_prod" name="des_prod" type="text" class="text-input required" enabled/>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="linea"></div>
								</td>
							</tr>
							<tr>
								<td class="nombrecampo">
									Codigo Producto
								</td>
								<td class="campo">
									<input type="text" id="txt_Codigo_Producto" name="txt_Codigo_Producto" class="text-input required" disabled />
								</td>
								<td class="nombrecampo">
									Descripción Producto
								</td>
								<td class="campo">
									<textarea name="txt_Descripcion_Producto" id="txt_Descripcion_Producto" rows="10" cols="50" maxlength="75" disabled></textarea>
								</td>
							</tr>
							<tr>
								<td class="nombrecampo">
									Imagen
								</td>
								<td class="campo">
									<img src="" id="img_prod" name="img_prod" height="100px", width="100px">
								</td>
								<td class="nombrecampo">
									Precio Unitario
								</td>
								<td class="campo">
									<input id="txt_Precio_Unitario" name="txt_Precio_Unitario" type="text" class="text-input required" disabled="" />
								</td>
							</tr>
							<tr>
								<td class="nombrecampo">
									Existencia en Kiosco
								</td>
								<td class="campo">
									<input type="text" id="txt_Existencia" name="txt_Existencia" class="text-input required" disabled="" />
								</td>
								<td class="nombrecampo">
									Cantidad
								</td>
								<td class="campo">
									<input type="text" value="1" name="txt_Cantidad" id="txt_Cantidad" class="text-input required" enabled/>
								</td>
							</tr>
				     	</table>
			       	</fieldset>
					</form>
			    </p>
			    <div class="cerrar">
			        <a href="#" class="cerrarmodal">
			       	<img src="style/images/cerrar.png" height="30px", width="30px">
			        </a>
			    </div>
			    <form class="forms">
			      <fieldset>
			      	<a href="#" class="cerrarmodal">
			       	<img src="style/images/cerrar.png" height="30px", width="30px">
			        </a>
			        <button type="button" onclick="displayResult()" class="btn-submit">Agregar</button>
			      </fieldset>
			    </form>
				</div>
		</div>
	</div>
    <!-- *********** MODAL *********** --> 

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
	<div class="site-generator">COPYCAT 2016</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>