<?php
session_start();
$ID_KC = $_SESSION["Kiosco_Cod"];
/** Se agrega la libreria PHPExcel */
	require_once 'PHP/PHPExcel/classes/PHPExcel.php';

	if(isset($_POST['Descarga_Reporte'])){

			// Se crea el objeto PHPExcel
	 $objPHPExcel = new PHPExcel();

	 // Se asignan las propiedades del libro
	$objPHPExcel->getProperties()->setCreator("Recursos Humanos") // Nombre del autor
    ->setLastModifiedBy("Recursos Humanos") //Ultimo usuario que lo modificó
    ->setTitle("Reporte General Retiros de Caja por Kiosco") // Titulo
    ->setSubject("Reporte General Retiros de Caja por Kiosco") //Asunto
    ->setDescription("Reporte de Retiros de Caja por Kiosco") //Descripción
    ->setKeywords("Reporte de Retiros de Caja por Kiosco") //Etiquetas
    ->setCategory("Reporte de Retiros de Caja por Kiosco"); //Categorias

    $tituloReporte = "Reporte General de Retiros de Caja por Kiosco";
	$titulosColumnas = array('KIOSCO ID', 'DESCRIPCION_KIOSCO', 'MONTO_TOTAL_RETIROS');

	$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E1');

		$objPHPExcel->setActiveSheetIndex(0)
    	->setCellValue('A1', $tituloReporte) // Titulo del reporte
    	->setCellValue('A3', $titulosColumnas[0])  //Titulo de las columnas
    	->setCellValue('B3', $titulosColumnas[1])
    	->setCellValue('C3', $titulosColumnas[2])
    $queryText_Reporte = "
						SELECT 
						    tm.Kiosco_ID_Kiosco,
						    k.Descripcion_Kiosco,
						    SUM(tm.Monto_Transaccion_Monetaria) Total_Retiros_Caja
						FROM
						    transaccion_monetaria tm
						        INNER JOIN
						    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
						        INNER JOIN
						    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
						        INNER JOIN
						    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
						WHERE tm.Kiosco_ID_Kiosco = '".$ID_KC."' and tm.ID_Tipo_Transaccion_Monetaria IN (4,5,6,7);
   						";
	
	$Resultado_Data = mquery($queryText_Reporte) or die ("Error al intentar Conectar: " . mysql_error());

    $i = 4; //Numero de fila donde se va a comenzar a rellenar
	 while ($Data_Record = mysqli_fetch_array($Resultado_Data)) {
	     $objPHPExcel->setActiveSheetIndex(0)
	         ->setCellValue('A'.$i, $Data_Record['Kiosco_ID_Kiosco'])
	         ->setCellValue('B'.$i, $Data_Record['Descripcion_Kiosco'])
	         ->setCellValue('D'.$i, $Data_Record['Total_Retiros_Caja']);
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
	$objPHPExcel->getActiveSheet()->getStyle('A3:V3')->applyFromArray($estiloTituloColumnas);

	// Se asigna el nombre a la hoja
	$objPHPExcel->getActiveSheet()->setTitle('Retiros_Caja_por_Kiosco');
	 
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

		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		
		<link rel="stylesheet" href="style/Tabs.css">
		<link rel="stylesheet" href="style/Fonts-Tabs.css">
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
<div class="intro">Recursos Humanos</div>
<!-- End Intro --> 

<!-- Begin Container -->
<div class="box">

	<h1 class="title">Retiros de Caja por Kiosco</h1>
	<hr>
<div class="form-container">
<form class="forms" action="" method="post">
<fieldset>
<!-- *********************TABS***************************** -->

<div class="body">
		
			<!-- tabs -->
			<div class="sky-tabs sky-tabs-pos-top-left sky-tabs-anim-flip sky-tabs-response-to-icons">
				<input type="radio" name="sky-tabs" checked id="sky-tab1" class="sky-tab-content-1">
				<label for="sky-tab1"><span><span><i class="fa fa-bolt"></i>Reporte General Retiros de Caja por Kiosco</span></span></label>
				
				<ul>
					<li class="sky-tab-content-1">					
						<div class="">
							<h4>Reporte General Retiros de Caja por Kiosco</h4>
							<form class="forms" action="Reporte_General.php" method="post">
						  <table>
								<tr>
									<td class="nombrecampo">
										Buscar Kiosco
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Busqueda_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
									<td class="campo">
										<li class="button-row"><input type="submit" value="Buscar" name="Buscar_Data" class="btn-submit" />
									</td>
									<td class="campo">
										<li class="button-row"><input type="submit" value="Descargar Reporte" name="Descarga_Reporte" class="btn-submit" />
									</td>
								</tr>								
							</table>
						  </form>

						  <table class="tableData">
										<tr class="TableHeader">
											<td><span class="ColumnHeader"><STRONG>ID KIOSCO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>DESCRIPCION KIOSCO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>TOTAL MONTO</STRONG></span></td>
											
										</tr>
									<?php
									/*----------------------Consulta de Parqueos-------------------*/
									if($data == 0){
									$queryText = "
												SELECT 
												    tm.Kiosco_ID_Kiosco,
												    k.Descripcion_Kiosco,
												    SUM(tm.Monto_Transaccion_Monetaria) Total_Retiros_Caja
												FROM
												    transaccion_monetaria tm
												        INNER JOIN
												    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
												        INNER JOIN
												    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
												        INNER JOIN
												    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
												WHERE tm.Kiosco_ID_Kiosco = '".$ID_KC."' and tm.ID_Tipo_Transaccion_Monetaria IN (4,5,6,7);
						   						";
									}
									else{
									$queryText = "
												SELECT 
												    tm.Kiosco_ID_Kiosco,
												    k.Descripcion_Kiosco,
												    SUM(tm.Monto_Transaccion_Monetaria) Total_Retiros_Caja
												FROM
												    transaccion_monetaria tm
												        INNER JOIN
												    kiosco k ON tm.Kiosco_ID_Kiosco = k.ID_Kiosco
												        INNER JOIN
												    tipo_transaccion_monetaria ttm ON tm.ID_Tipo_Transaccion_Monetaria = ttm.ID_Tipo_Transaccion_Monetaria
												        INNER JOIN
												    concepto_transaccion_monetaria ctm ON tm.ID_Concepto_Transaccion_Monetaria = ctm.ID_Concepto_Transaccion_Monetaria 
												WHERE tm.Kiosco_ID_Kiosco = '".$ID_KC."' and tm.ID_Tipo_Transaccion_Monetaria IN (4,5,6,7);
						   						";. $WHERE_Info;
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
												<td><?php echo($Parqueo_Record["Kiosco_ID_Kiosco"]);?></td>
												<td><?php echo(utf8_encode($Parqueo_Record["Descripcion_Kiosco"]));?></td>
												<td><?php echo($Parqueo_Record["Total_Retiros_Caja"]);?></td>
												</td>												
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
<li class="button-row"><input type="submit" value="Descargar Reporte" name="submit" class="btn-submit" />
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