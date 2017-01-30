<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="iso-8859-1" />
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
<script type="text/javascript" src="style/js/jquery-1.9.1.min.js"></script>

<script>
	
	/*function GetDataCliente(){		
		var obj = document.getElementById('txt_Nit_Cliente');
		loadXMLDoc('GetCliente.php?NiC=' + obj);
		alert(obj);
	}*/

	$(document).ready(function() {
    $("#resultadoBusqueda").html('');
    		$("input#txt_ID_Cliente").val('0');
     		$("input#txt_Nombre_Cliente").val('--');
	        $("input#txt_Direccion_Cliente").val('--');
	        $("input#txt_Telefono_Cliente").val('--');
	        $("input#txt_Email_Cliente").val('--');
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

	<h1 class="title">Ventas y/o Servicios</h1>
	<hr>
<div class="form-container">
	<form class="forms" action="" accept-charset="utf-8" method="POST">
		<fieldset>
		<table>
			<tr>
				<td calss="nombrecampo">
					N.Factura
				</td>
				<td class="campo">
					<input type="text" name="txt_Num_Factura" value="" class="text-input required=" title="" />
				</td>
				<td class="nombreclase">
					Fecha
				</td>
				<td class="campo">
					<input type="text" name="txt_Fecha_Factura" value="<?php $time = time(); echo date("d-m-Y (H:i:s)", $time);?>" class="text-input required" title="" disabled/>
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
								<input type="text" id="txt_Nit_Cliente" name="txt_Nit_Cliente" value="" class="text-input required" title="" onKeyUp="buscar();" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Nombre:
							</td>
							<td class="campo">
								<input type="text" id="txt_Nombre_Cliente" name="txt_Nombre_Cliente" value="" class="text-input required" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombrecampo">
								Dirección:
							</td>
							<td  class="campo" >
								<input type="text" id="txt_Direccion_Cliente" name="txt_Direccion_Cliente" value="" class="text-input required=" title="" />
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
								<input type="text" id="txt_Telefono_Cliente" name="txt_Telefono_Cliente" value="" class="text-input required=" title="" />
							</td>
						</tr>
						<tr>
							<td class="nombreclase">
								Email
							</td>
							<td class="campo" colspan="4">
								<input type="text" id="txt_Email_Cliente" name="txt_Email_Cliente" value="" class="text-input required=" title="" />
								<input type="hidden" name="txt_ID_Cliente" id="txt_ID_Cliente">
							</td>
						</tr>
						
					</table>
				</div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final sub-div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			</div>	
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="linea"></div>
		<div class="clear1"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			
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
			</table>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Final div 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="linea"></div>
		<div class="clear1"></div>
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Inicio div 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<table class="tableData">
				<tr class="TableHeader">
					<td><span class="ColumnHeader"><STRONG>Cantidad</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Cod Producto</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Descripción</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Precio Q.</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Total</STRONG></span></td>
				</tr>
				<tr class="TableDetail1">
					<td><span class="ColumnHeader"><STRONG>1</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>TEI 1 D</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Llavin de Casa</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>20.00</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>20.00</STRONG></span></td>
				</tr>
				<tr class="TableDetail2">
					<td><span class="ColumnHeader"><STRONG>2</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>CHI5</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>Llavin de Casa</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>21.50</STRONG></span></td>
					<td><span class="ColumnHeader"><STRONG>43.00</STRONG></span></td>
				</tr>
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
							Total
						</td>
						<td class="campo">
							<input type="text" class="text-input required" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="Cancelar Venta" name="Buscar_Data" class="btn-submit" />
						</td>
						<td class="campo">
							<input type="submit" value="Procesar Venta" name="Buscar_Data" class="btn-submit" />
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
						        	<table>
						        		<tr>
						        			<td class="nombrecampo">
												Tipo de Venta
											</td>
											<td class="campo">
												<label>
													<select name="ddl_Alergico">
														<option value="">--SELECCIONE--</option>
														<option value="1">PRODUCTO</option>
														<option value="0">SERVICIO</option>
														<option value="0">PRODUCTO/SERVICIO</option>
													</select>
												</label>
											</td>
											<td class="nombrecampo">
												Codigo
											</td>
											<td class="campo">
												<input type="text" class="text-input required" enabled/>
											</td>
											<td>
												<input type="submit" value="Buscar" name="Buscar_Data" class="btn-submit" />
											</td>
						        		</tr>
						        		<tr>
						        			<td class="nombrecampo">
												Cantidad
											</td>
											<td class="campo">
												<input type="text" class="text-input required" enabled/>
											</td>
											<td class="nombrecampo">
												Imagen
											</td>
											<td class="campo">
												<img src="" height="50px", width="50px">
											</td>
											<td class="nombrecampo">
												Descripción
											</td>
											<td class="campo">
												<input type="text" class="text-input required" enabled/>
											</td>

										</tr>
						        	</table>
						        </p>
						        <div class="cerrar">
							       <a href="#" class="cerrarmodal">
							       	<img src="style/images/cerrar.png" height="30px", width="30px">
							       </a>
						        </div>
						        <form>
						        	<input type="submit" value="Agregar" name="Agregar" class="btn-submit" />
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