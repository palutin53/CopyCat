<?php
include("PHP/db_connect.php");
require("PHP/Funciones.php");
/** Se agrega la libreria PHPExcel */
	require_once 'PHP/PHPExcel/classes/PHPExcel.php';

	if(isset($_POST['Buscar_Data'])){

			if(isset($_POST['txt_Busqueda_Empleado'])){
				$Dato = $_POST['txt_Busqueda_Empleado'];
				$data = 1;
				$WHERE_Info = "WHERE k.Descripcion_Kiosco LIKE '%" . $Dato . "%' ORDER BY tm.Fecha_Transaccion_Monetaria DESC;";
			}
			else
			{
				$Dato = "";
				$data = 0;
			}
	}
	else{
		$Dato = "";
		$data = 0;
	}

	if(isset($_POST['Descarga_Reporte'])){

			// Se crea el objeto PHPExcel
	 $objPHPExcel = new PHPExcel();

	 // Se asignan las propiedades del libro
	$objPHPExcel->getProperties()->setCreator("copycat") // Nombre del autor
    ->setLastModifiedBy("copycat") //Ultimo usuario que lo modificó
    ->setTitle("Reporte General Venta por Factura") // Titulo
    ->setSubject("Reporte General Venta por Factura") //Asunto
    ->setDescription("Reporte de Ventas por Factura") //Descripción
    ->setKeywords("Reporte de Ventas por Factura") //Etiquetas
    ->setCategory("Reporte de Ventas por Factura"); //Categorias

    $tituloReporte = "Reporte General de Ventas por Factura";
	$titulosColumnas = array('FACTURA_NUM_ENCABEZADO',  'TOTAL_VENTA');

	$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E1');

		$objPHPExcel->setActiveSheetIndex(0)
    	->setCellValue('A1', $tituloReporte) // Titulo del reporte
    	->setCellValue('A3', $titulosColumnas[0])  //Titulo de las columnas
    	->setCellValue('B3', $titulosColumnas[1]);
     $queryText_Reporte = "SELECT 
						    Factura_Encabezado_Factura_Num_Encabezado_Factura,
						    SUM(Precio_Unitario_Linea_Detalle_Encabezado_Factura) Total
						FROM
						    linea_detalle_encabezado_factura
						GROUP BY Factura_Encabezado_Factura_Num_Encabezado_Factura;";
	
	$Resultado_Data = mquery($queryText_Reporte) or die ("Error al intentar Conectar: " . mysql_error());

    $i = 4; //Numero de fila donde se va a comenzar a rellenar
	 while ($Data_Record = mysqli_fetch_array($Resultado_Data)) {
	     $objPHPExcel->setActiveSheetIndex(0)
	         ->setCellValue('A'.$i, $Data_Record['Factura_Encabezado_Factura_Num_Encabezado_Factura'])
	         ->setCellValue('D'.$i, $Data_Record['Total']);
	     $i++;
	 }


	  	$estiloTituloReporte = array(
		    	'font'		=> array(
		        'name'      => 'Verdana',
		        'bold'      => true,
		        'italic'    => false,
		        'strike'    => false,
		        'size' 		=> 16,
		        'color'     => array(
		        'rgb'		=> 'FFFFFF'
		        )
		    ),
		    'fill' => array(
		      'type'  => PHPExcel_Style_Fill::FILL_SOLID,
		      'color' => array(
		            'argb' => '20B2AA')
		  ),
		    'borders' => array(
		        'allborders' => array(
		            'style' => PHPExcel_Style_Border::BORDER_NONE
		        )
		    ),
		    'alignment' => array(
		        'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
		        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
		        'rotation' => 0,
		        'wrap' => TRUE
		    )
		);
		 
		$estiloTituloColumnas = array(
		    'font' => array(
		        'name'  => 'Arial',
		        'bold'  => true,
		        'color' => array(
		            'rgb' => 'FFFFFF'
		        )
		    ),
		    'fill' => array(
		        'type'       => PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
		  'rotation'   => 90,
		        'startcolor' => array(
		            'rgb' => '20B2AA'
		        ),
		        'endcolor' => array(
		            'argb' => '66CDAA'
		        )
		    ),
		    'borders' => array(
		        'top' => array(
		            'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
		            'color' => array(
		                'rgb' => 'B0E0E6'
		            )
		        ),
		        'bottom' => array(
		            'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
		            'color' => array(
		                'rgb' => 'B0E0E6'
		            )
		        )
		    ),
		    'alignment' =>  array(
		        'horizontal'=> PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
		        'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER,
		        'wrap'      => TRUE
		    )
		);
		 
		$estiloInformacion = new PHPExcel_Style();
		$estiloInformacion->applyFromArray( array(
		    'font' => array(
		        'name'  => 'Arial',
		        'color' => array(
		            'rgb' => '000000'
		        )
		    ),
		    'fill' => array(
		  'type'  => PHPExcel_Style_Fill::FILL_SOLID,
		  'color' => array(
		            'argb' => 'FFd9b7f4')
		  ),
		    'borders' => array(
		        'left' => array(
		            'style' => PHPExcel_Style_Border::BORDER_THIN ,
		      'color' => array(
		              'rgb' => '3a2a47'
		            )
		        )
		    )
		));
	
	$objPHPExcel->getActiveSheet()->getStyle('A1:E1')->applyFromArray($estiloTituloReporte);
	$objPHPExcel->getActiveSheet()->getStyle('A3:E3')->applyFromArray($estiloTituloColumnas);

	// Se asigna el nombre a la hoja
	$objPHPExcel->getActiveSheet()->setTitle('Venta_por_Factura');
	 
	// Se activa la hoja para que sea la que se muestre cuando el archivo se abre
	$objPHPExcel->setActiveSheetIndex(0);

	for($i = 'A'; $i <= 'E'; $i++){
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension($i)->setAutoSize(TRUE);
	}

	// Se manda el archivo al navegador web, con el nombre que se indica, en formato 2007
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment;filename="ReporteGeneralActividadEmpleados.xlsx"');
	header('Cache-Control: max-age=0');
	 
	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
	$objWriter->save('php://output');
	exit;

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
<div class="intro">COPYCAT</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Venta por Factura</h1>
	<hr>
<div class="form-container">
<form class="forms" action="" method="post">
<fieldset>
<!-- *********************TABS***************************** -->

<div class="body">
		
	<form class="forms" action="Reporte_General.php" method="post">
						    <table>
								<tr>
									<td class="nombrecampo">
										Buscar Empleado
									</td>
									<td class="campo">
										<input type="text" name="txt_Busqueda_Empleado" value="" class="text-input required" title="" />
									</td>
									<td class="campo">
										<input type="submit" value="Buscar" name="Buscar_Data" class="btn-submit" />
									</td>
									<td class="campo">
										<input type="submit" value="Descargar Reporte" name="Descarga_Reporte" class="btn-submit" />
									</td>
								</tr>								
							</table>
						  </form>

						  <table class="tableData">
										<tr class="TableHeader">
											<td><span class="ColumnHeader"><STRONG>NUM FACTURA</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>VENTA TOTAL</STRONG></span></td>
											
										</tr>
									<?php
									/*----------------------Consulta de Parqueos-------------------*/
									$queryText = "SELECT 
													    Factura_Encabezado_Factura_Num_Encabezado_Factura,
													    SUM(Precio_Unitario_Linea_Detalle_Encabezado_Factura) Total
													FROM
													    linea_detalle_encabezado_factura
													GROUP BY Factura_Encabezado_Factura_Num_Encabezado_Factura;";;

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
												<td><?php echo($Parqueo_Record["Factura_Encabezado_Factura_Num_Encabezado_Factura"]);?></td>
												<td><?php echo($Parqueo_Record["Total"]);?></td>												
											</tr>
									<?php
										$i++;
										endwhile;				
									?>
						  </table>			
			
</div>

<!-- *******************************************************-->
<li class="button-row">
<input type="submit" value="Descargar Reporte" name="Descarga_Reporte" class="btn-submit" />
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
	<div class="site-generator"></div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>