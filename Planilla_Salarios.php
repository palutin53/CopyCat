<?php
include("PHP/db_connect.php");
require("PHP/Funciones.php");
/** Se agrega la libreria PHPExcel */
	require_once 'PHP/PHPExcel/classes/PHPExcel.php';

	if(isset($_POST['Buscar_Data'])){

			if(isset($_POST['Ddl_Mes'])){
				$mes = $_POST['Ddl_Mes'];
			}
			else
			{
				$mes = date("m");
			}
	}
	else{
		$mes = "02";
	}

	if(isset($_POST['Descarga_Reporte'])){

			// Se crea el objeto PHPExcel
	 $objPHPExcel = new PHPExcel();

	 // Se asignan las propiedades del libro
	$objPHPExcel->getProperties()->setCreator("copycat") // Nombre del autor
    ->setLastModifiedBy("copycat") //Ultimo usuario que lo modificó
    ->setTitle("Planilla Empleados") // Titulo
    ->setSubject("Planilla Empleados") //Asunto
    ->setDescription("Planilla Empleados") //Descripción
    ->setKeywords("Planilla Empleados") //Etiquetas
    ->setCategory("Planilla Empleados"); //Categorias

    $tituloReporte = "Planilla Empleados";
	$titulosColumnas = array('FECHA','NOMBRE', 'DPI', 'SALARIO_BASE', 'IGSS', 'IRTRA', 'INTECAP', 'COMISION', 'MONTO_EFECTIVO');

	$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E1');

		$objPHPExcel->setActiveSheetIndex(0)
    	->setCellValue('A1', $tituloReporte) // Titulo del reporte
    	->setCellValue('A3', $titulosColumnas[0])  //Titulo de las columnas
    	->setCellValue('B3', $titulosColumnas[1])
    	->setCellValue('C3', $titulosColumnas[2])
    	->setCellValue('D3', $titulosColumnas[3])
    	->setCellValue('E3', $titulosColumnas[4])
    	->setCellValue('F3', $titulosColumnas[5])
    	->setCellValue('G3', $titulosColumnas[6])
    	->setCellValue('H3', $titulosColumnas[7])
    	->setCellValue('I3', $titulosColumnas[8]);
    $queryText_Reporte = "SELECT 
							    NOW() Fecha,
							    CONCAT(e.Nombre_Empleado,
							            ' ',
							            e.Apellido_Empleado) Nombre_Completo,
							    e.DPI_Empleado,
							    e.Salario_Base_Empleado Salario_Base,
							    (e.Salario_Base_Empleado * 4.83) / 100 IGSS,
							    (e.Salario_Base_Empleado * 1) / 100 IRTRA,
							    (e.Salario_Base_Empleado * 1) / 100 INTECAP,    
							    SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Comision,
							    e.Salario_Base_Empleado - ((e.Salario_Base_Empleado * 4.83) / 100) - ((e.Salario_Base_Empleado * 1) / 100) - ((e.Salario_Base_Empleado * 1) / 100) + SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Monto_Efectivo
							FROM
							    empleado e
							        INNER JOIN
							    linea_detalle_encabezado_factura lf ON lf.Factura_Encabezado_Factura_Empleado_ID_Empleado = e.ID_Empleado
							        INNER JOIN
							    encabezado_factura ef ON lf.Factura_Encabezado_Factura_Num_Encabezado_Factura = ef.Num_Encabezado_Factura
							WHERE
							    ef.Fecha_Encabezado_Factura LIKE '%-" . $mes . "-%'
							GROUP BY lf.Factura_Encabezado_Factura_Empleado_ID_Empleado;";
	
	$Resultado_Data = mquery($queryText_Reporte) or die ("Error al intentar Conectar: " . mysql_error());

    $i = 4; //Numero de fila donde se va a comenzar a rellenar
	 while ($Data_Record = mysqli_fetch_array($Resultado_Data)) {
	     $objPHPExcel->setActiveSheetIndex(0)
	         ->setCellValue('A'.$i, $Data_Record['Fecha'])
	         ->setCellValue('B'.$i, $Data_Record['Nombre_Completo'])
	         ->setCellValue('C'.$i, $Data_Record['DPI_Empleado'])
	         ->setCellValue('D'.$i, number_format($Data_Record['Salario_Base'], 2,'.',','))
	         ->setCellValue('E'.$i, number_format($Data_Record['IGSS'], 2,'.',','))
	         ->setCellValue('F'.$i, number_format($Data_Record['IRTRA'], 2,'.',','))
	         ->setCellValue('G'.$i, number_format($Data_Record['INTECAP'], 2,'.',','))
	         ->setCellValue('H'.$i, number_format($Data_Record['Comision'], 2,'.',','))
	         ->setCellValue('I'.$i, number_format($Data_Record['Monto_Efectivo'], 2,'.',','));
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
	
	$objPHPExcel->getActiveSheet()->getStyle('A1:I1')->applyFromArray($estiloTituloReporte);
	$objPHPExcel->getActiveSheet()->getStyle('A3:I3')->applyFromArray($estiloTituloColumnas);

	// Se asigna el nombre a la hoja
	$objPHPExcel->getActiveSheet()->setTitle('Planilla_Empleados');
	 
	// Se activa la hoja para que sea la que se muestre cuando el archivo se abre
	$objPHPExcel->setActiveSheetIndex(0);

	for($i = 'A'; $i <= 'I'; $i++){
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension($i)->setAutoSize(TRUE);
	}

	// Se manda el archivo al navegador web, con el nombre que se indica, en formato 2007
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment;filename="PlanillaSalarios.xlsx"');
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

	<h1 class="title">Planilla Empleados</h1>
	<hr>
<div class="form-container">
<form class="forms" action="" method="post">
<fieldset>
<!-- *********************TABS***************************** -->

<div class="body">
		
	<form class="forms" action="Planilla_Salarios.php" method="post">
						    <table>
								<tr>
									<td class="nombrecampo">
										Mes a Generar
									</td>
									<td class="campo">
										<select name="Ddl_Mes">
											<option value="#">--SELECCIONE--</option>
											<option value="01">
												ENERO
											</option>
											<option value="02">
												FEBRERO
											</option>
											<option value="03">
												MARZO
											</option>
											<option value="04">
												ABRIL
											</option>
											<option value="05">
												MAYO
											</option>
											<option value="06">
												JUNIO
											</option>
											<option value="07">
												JULIO
											</option>
											<option value="08">
												AGOSTO
											</option>
											<option value="09">
												SEPTIEMBRE
											</option>
											<option value="10">
												OCTUBRE
											</option>
											<option value="11">
												NOVIEMBRE
											</option>
											<option value="12">
												DICIEMBRE
											</option>
										</select>
									</td>
									<td class="campo">
										<input type="submit" value="Buscar" name="Buscar_Data" class="btn-submit" />
									</td>
									<td class="campo">
										<input type="submit" value="Descargar Planilla" name="Descarga_Reporte" class="btn-submit" />
									</td>
								</tr>								
							</table>
						  </form>

						  <table class="tableData">
										<tr class="TableHeader">
											<td><span class="ColumnHeader"><STRONG>FECHA</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>NOMBRE</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>DPI</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>SALARIO_BASE</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>IGSS</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>IRTRA</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>INTECAP</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>COMISION</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>SALARIO EFECTIVO</STRONG></span></td>
											
										</tr>
									<?php
									/*----------------------Consulta de Parqueos-------------------*/
									$queryText = "SELECT 
												    NOW() Fecha,
												    CONCAT(e.Nombre_Empleado,
												            ' ',
												            e.Apellido_Empleado) Nombre_Completo,
												    e.DPI_Empleado,
												    e.Salario_Base_Empleado Salario_Base,
												    (e.Salario_Base_Empleado * 4.83) / 100 IGSS,
												    (e.Salario_Base_Empleado * 1) / 100 IRTRA,
												    (e.Salario_Base_Empleado * 1) / 100 INTECAP,    
												    SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Comision,
												    e.Salario_Base_Empleado - ((e.Salario_Base_Empleado * 4.83) / 100) - ((e.Salario_Base_Empleado * 1) / 100) - ((e.Salario_Base_Empleado * 1) / 100) + SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) Monto_Efectivo
												FROM
												    empleado e
												        INNER JOIN
												    linea_detalle_encabezado_factura lf ON lf.Factura_Encabezado_Factura_Empleado_ID_Empleado = e.ID_Empleado
												        INNER JOIN
												    encabezado_factura ef ON lf.Factura_Encabezado_Factura_Num_Encabezado_Factura = ef.Num_Encabezado_Factura
												WHERE
												    ef.Fecha_Encabezado_Factura LIKE '%-" . $mes . "-%'
												GROUP BY lf.Factura_Encabezado_Factura_Empleado_ID_Empleado;";

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
												<td><?php echo($Parqueo_Record["Fecha"]);?></td>
												<td><?php echo($Parqueo_Record["Nombre_Completo"]);?></td>
												<td><?php echo($Parqueo_Record["DPI_Empleado"]);?></td>
												<td><?php echo number_format($Parqueo_Record["Salario_Base"], 2,'.',',');?></td>
												<td><?php echo number_format($Parqueo_Record["IGSS"], 2,'.',',');?></td>
												<td><?php echo number_format($Parqueo_Record["IRTRA"], 2,'.',',');?></td>
												<td><?php echo number_format($Parqueo_Record["INTECAP"], 2,'.',',');?></td>
												<td><?php echo number_format($Parqueo_Record["Comision"], 2,'.',',');?></td>
												<td><?php echo number_format($Parqueo_Record["Monto_Efectivo"], 2,'.',',');?></td>											
											</tr>
									<?php
										$i++;
										endwhile;
										echo $mes;			
									?>
						  </table>			
			
</div>

<!-- *******************************************************-->
<li class="button-row">
<input type="submit" value="Descargar Planilla" name="Descarga_Reporte" class="btn-submit" />
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