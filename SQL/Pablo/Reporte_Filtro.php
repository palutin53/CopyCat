<?php
	include("PHP/db_connect.php");
	require("PHP/Funciones.php");
	/** Se agrega la libreria PHPExcel */
	require_once 'PHP/PHPExcel/classes/PHPExcel.php';
	
	if(isset($_POST['Buscar_Data'])){

			if(isset($_POST['txt_Busqueda_Empleado'])){
				$Dato = $_POST['txt_Busqueda_Empleado'];
				$data = 1;
				$WHERE_Info = "WHERE ie.ID_Empleado LIKE '%" . $Dato . "%' OR ie.Nombres_Informacion_Empleado LIKE '%" . $Dato . "%' OR ie.Apellidos_Informacion_Empleado LIKE '%" . $Dato . "%' ";
			}
			else
			{
				$Dato = "";
				$data = 0;
			}

			if(isset($_POST['ddl_Genero'])){
				$WHERE_Info .= "AND gn.ID_Genero = " . $_POST['ddl_Genero'];
			}

	}

	if(isset($_POST['Descarga_Reporte'])){

		if(isset($_POST['txt_Busqueda_Empleado'])){
				$Dato = $_POST['txt_Busqueda_Empleado'];
				$data = 1;
				$WHERE_Info = "WHERE ie.ID_Empleado LIKE '%" . $Dato . "%' OR ie.Nombres_Informacion_Empleado LIKE '%" . $Dato . "%' OR ie.Apellidos_Informacion_Empleado LIKE '%" . $Dato . "%'";
		}
		else
		{
				$Dato = "";
				$data = 0;
		}

			// Se crea el objeto PHPExcel
	 $objPHPExcel = new PHPExcel();

	 // Se asignan las propiedades del libro
	$objPHPExcel->getProperties()->setCreator("Recursos Humanos") // Nombre del autor
    ->setLastModifiedBy("Recursos Humanos") //Ultimo usuario que lo modificó
    ->setTitle("Reporte General") // Titulo
    ->setSubject("Reporte General") //Asunto
    ->setDescription("Reporte de Empleados") //Descripción
    ->setKeywords("Reporte de Empleados") //Etiquetas
    ->setCategory("Reporte de Empleados"); //Categorias

    $tituloReporte = "Reporte General de Empleados";
	$titulosColumnas = array('CODIGO_EMPLEADO', 'FECHA_ANTIGUEDAD', 'ANTIGUEDAD', 'FECHA_ALTA', 'ANTIGUEDAD_ALTA', 'APELLIDOS', 'NOMBRES', 'ID_UNIDAD_ORGANIZATIVA', 'UNIDAD_ORGANIZATIVA', 'CODIGO_PUESTO', 'PUESTO', 'GENERO', 'FECHA_NACIMIENTO', 'EDAD', 'CORREO', 'ID_AREA_M4', 'ID_CENTRO_COSTO', 'ACTIVIDAD_RH', 'AREA_FUNCIONAL', 'CATEGORIA_PUESTO', 'EMPRESA', 'PAIS_NACIMIENTO');

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
    	->setCellValue('I3', $titulosColumnas[8])
    	->setCellValue('J3', $titulosColumnas[9])
    	->setCellValue('K3', $titulosColumnas[10])
    	->setCellValue('L3', $titulosColumnas[11])
    	->setCellValue('M3', $titulosColumnas[12])
    	->setCellValue('N3', $titulosColumnas[13])
    	->setCellValue('O3', $titulosColumnas[14])
    	->setCellValue('P3', $titulosColumnas[15])
    	->setCellValue('Q3', $titulosColumnas[16])
    	->setCellValue('R3', $titulosColumnas[17])
    	->setCellValue('S3', $titulosColumnas[18])
    	->setCellValue('T3', $titulosColumnas[19])
    	->setCellValue('U3', $titulosColumnas[20])
    	->setCellValue('V3', $titulosColumnas[21]);
    if($data == 0){
    	$queryText_Reporte = "SELECT 
							    ie.ID_Empleado,
							    ie.Nombres_Informacion_Empleado, 
							    ie.Apellidos_Informacion_Empleado,
							    ie.Correo_Empresa_Informacion_Empleado,
							    ie.Fecha_Antiguedad_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Antiguedad_Informacion_Empleado)  AS Antiguedad,
							    ie.Fecha_Alta_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Alta_Informacion_Empleado)  AS Antiguedad_Alta,
							    uo.ID_Unidad_Organizacional,
							    uo.Nombre_Unidad_Organizacional,
							    p.ID_Puesto,
							    p.Nombre_Puesto,
							    ie.Fecha_Nacimiento_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Nacimiento_Informacion_Empleado)  AS Edad,
							    am.ID_Area_M4,
							    cc.ID_CENTRO_COSTO,
							    arh.Descripcion_Actividad_RRHH,
							    cp.Descripcion_Categoria_Puesto,
							    pl.Descripcion_Planilla,
							    ar.Descripcion_Areas_RRHH,
							    af.Descripcion_Area_Funcional,
							    em.Descripcion_Empresa,
							    gn.Descripcion_Genero,
							    nc.Descripcion_Nacionalidad
							FROM
							    informacion_empleado ie
							INNER JOIN empleado e ON ie.ID_Empleado = e.Informacion_Empleado_ID_Empleado
							INNER JOIN puesto p ON e.Puesto_ID_Puesto = p.ID_Puesto
							INNER JOIN planilla pl ON e.Planilla_ID_Planilla = pl.ID_Planilla
							INNER JOIN areas_rrhh ar ON e.Areas_RRHH_ID_Areas_RRHH = ar.ID_Areas_RRHH
							INNER JOIN categoria_puesto cp ON e.Categoria_Puesto_ID_Categoria_Puesto = cp.ID_Categoria_Puesto
							INNER JOIN unidad_organizacional uo ON e.Unidad_Organizacional_ID_Unidad_Organizacional = uo.ID_Unidad_Organizacional
							INNER JOIN area_m4 am ON e.Area_M4_ID_Area_M4 = am.ID_Area_M4
							INNER JOIN centro_costo cc ON e.Centro_Costo_ID_Centro_Costo = cc.ID_Centro_Costo
							INNER JOIN actividad_rrhh arh ON e.Actividad_RRHH_ID_Actividad_RRHH = arh.ID_Actividad_RRHH
							INNER JOIN area_funcional af ON e.Area_Funcional_ID_Area_Funcional = af.ID_Area_Funcional
							INNER JOIN empresa em ON e.Empresa_ID_Empresa = em.ID_Empresa
							INNER JOIN genero gn ON ie.Genero_ID_Genero = gn.ID_Genero
							INNER JOIN nacionalidad nc ON ie.Nacionalidad_ID_Nacionalidad = nc.ID_Nacionalidad";
	}
	else{
		$queryText_Reporte = "SELECT 
							    ie.ID_Empleado,
							    ie.Nombres_Informacion_Empleado, 
							    ie.Apellidos_Informacion_Empleado,
							    ie.Correo_Empresa_Informacion_Empleado,
							    ie.Fecha_Antiguedad_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Antiguedad_Informacion_Empleado)  AS Antiguedad,
							    ie.Fecha_Alta_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Alta_Informacion_Empleado)  AS Antiguedad_Alta,
							    uo.ID_Unidad_Organizacional,
							    uo.Nombre_Unidad_Organizacional,
							    p.ID_Puesto,
							    p.Nombre_Puesto,
							    ie.Fecha_Nacimiento_Informacion_Empleado,
							    YEAR(CURDATE())-YEAR(ie.Fecha_Nacimiento_Informacion_Empleado)  AS Edad,
							    am.ID_Area_M4,
							    cc.ID_CENTRO_COSTO,
							    arh.Descripcion_Actividad_RRHH,
							    cp.Descripcion_Categoria_Puesto,
							    pl.Descripcion_Planilla,
							    ar.Descripcion_Areas_RRHH,
							    af.Descripcion_Area_Funcional,
							    em.Descripcion_Empresa,
							    gn.Descripcion_Genero,
							    nc.Descripcion_Nacionalidad
							FROM
							    informacion_empleado ie
							INNER JOIN empleado e ON ie.ID_Empleado = e.Informacion_Empleado_ID_Empleado
							INNER JOIN puesto p ON e.Puesto_ID_Puesto = p.ID_Puesto
							INNER JOIN planilla pl ON e.Planilla_ID_Planilla = pl.ID_Planilla
							INNER JOIN areas_rrhh ar ON e.Areas_RRHH_ID_Areas_RRHH = ar.ID_Areas_RRHH
							INNER JOIN categoria_puesto cp ON e.Categoria_Puesto_ID_Categoria_Puesto = cp.ID_Categoria_Puesto
							INNER JOIN unidad_organizacional uo ON e.Unidad_Organizacional_ID_Unidad_Organizacional = uo.ID_Unidad_Organizacional
							INNER JOIN area_m4 am ON e.Area_M4_ID_Area_M4 = am.ID_Area_M4
							INNER JOIN centro_costo cc ON e.Centro_Costo_ID_Centro_Costo = cc.ID_Centro_Costo
							INNER JOIN actividad_rrhh arh ON e.Actividad_RRHH_ID_Actividad_RRHH = arh.ID_Actividad_RRHH
							INNER JOIN area_funcional af ON e.Area_Funcional_ID_Area_Funcional = af.ID_Area_Funcional
							INNER JOIN empresa em ON e.Empresa_ID_Empresa = em.ID_Empresa
							INNER JOIN genero gn ON ie.Genero_ID_Genero = gn.ID_Genero
							INNER JOIN nacionalidad nc ON ie.Nacionalidad_ID_Nacionalidad = nc.ID_Nacionalidad 
							" . $WHERE_Info;
	}

	$Resultado_Data = mquery($queryText_Reporte) or die ("Error al intentar Conectar: " . mysql_error());

    $i = 4; //Numero de fila donde se va a comenzar a rellenar
	 while ($Data_Record = mysqli_fetch_array($Resultado_Data)) {
	     $objPHPExcel->setActiveSheetIndex(0)
	         ->setCellValue('A'.$i, $Data_Record['ID_Empleado'])
	         ->setCellValue('B'.$i, $Data_Record['Fecha_Antiguedad_Informacion_Empleado'])
	         ->setCellValue('C'.$i, $Data_Record['Antiguedad'])
	         ->setCellValue('D'.$i, $Data_Record['Fecha_Antiguedad_Informacion_Empleado'])
	         ->setCellValue('E'.$i, $Data_Record['Antiguedad_Alta'])
	         ->setCellValue('F'.$i, $Data_Record['Nombres_Informacion_Empleado'])
	         ->setCellValue('G'.$i, $Data_Record['Apellidos_Informacion_Empleado'])
	         ->setCellValue('H'.$i, $Data_Record['ID_Unidad_Organizacional'])
	         ->setCellValue('I'.$i, $Data_Record['Nombre_Unidad_Organizacional'])
	         ->setCellValue('J'.$i, $Data_Record['ID_Puesto'])
	         ->setCellValue('K'.$i, $Data_Record['Nombre_Puesto'])
	         ->setCellValue('L'.$i, $Data_Record['Descripcion_Genero'])
	         ->setCellValue('M'.$i, $Data_Record['Fecha_Nacimiento_Informacion_Empleado'])
	         ->setCellValue('N'.$i, $Data_Record['Edad'])
	         ->setCellValue('O'.$i, $Data_Record['Correo_Empresa_Informacion_Empleado'])
	         ->setCellValue('P'.$i, $Data_Record['ID_Area_M4'])
	         ->setCellValue('Q'.$i, $Data_Record['ID_CENTRO_COSTO'])
	         ->setCellValue('R'.$i, $Data_Record['Descripcion_Actividad_RRHH'])
	         ->setCellValue('S'.$i, $Data_Record['Descripcion_Area_Funcional'])
	         ->setCellValue('T'.$i, $Data_Record['Descripcion_Categoria_Puesto'])
	         ->setCellValue('U'.$i, $Data_Record['Descripcion_Empresa'])
	         ->setCellValue('V'.$i, $Data_Record['Descripcion_Nacionalidad']);
	     $i++;
	 }


	  	$estiloTituloReporte = array(
		    'font' => array(
		        'name'      => 'Verdana',
		        'bold'      => true,
		        'italic'    => false,
		        'strike'    => false,
		        'size' =>16,
		        'color'     => array(
		            'rgb' => 'FFFFFF'
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
	$objPHPExcel->getActiveSheet()->setTitle('Empleados');
	 
	// Se activa la hoja para que sea la que se muestre cuando el archivo se abre
	$objPHPExcel->setActiveSheetIndex(0);

	for($i = 'A'; $i <= 'E'; $i++){
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension($i)->setAutoSize(TRUE);
	}

	// Se manda el archivo al navegador web, con el nombre que se indica, en formato 2007
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment;filename="ReporteGeneral.xlsx"');
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
				<label for="sky-tab1"><span><span><i class="fa fa-bolt"></i>Reporte General</span></span></label>
				
				<ul>
					<li class="sky-tab-content-1">					
						<div class="">
							<h4>Reporte General</h4>
							<form class="forms" action="Reporte_Filtro.php" method="post">
						  <table>
								<tr>
									<td class="nombrecampo">
										Codigo, Nombre, Apellido
									</td>
									<td class="campo">
										<ol>
										<li class="form-row text-input-row">
										<input type="text" name="txt_Busqueda_Empleado" value="" class="text-input required" title="" />
										</li>
										</ol>
									</td>
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
											<td><span class="ColumnHeader"><STRONG>CODIGO EMPLEADO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>NOMBRE COMPLETO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>EMAIL</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>PUESTO</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>PLANILLA</STRONG></span></td>
											<!--<td><span class="ColumnHeader"><STRONG>AREA</STRONG></span></td>-->
											<td><span class="ColumnHeader"><STRONG>CATEGORIA</STRONG></span></td>
											<td><span class="ColumnHeader"><STRONG>FECHA ANTIGUEDAD</STRONG></span></td>
											
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
													INNER JOIN genero gn ON ie.Genero_ID_Genero = gn.ID_Genero
													INNER JOIN areas_rrhh ar ON e.Areas_RRHH_ID_Areas_RRHH = ar.ID_Areas_RRHH
													INNER JOIN categoria_puesto cp ON e.Categoria_Puesto_ID_Categoria_Puesto = cp.ID_Categoria_Puesto " . $WHERE_Info;	
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
	<div class="site-generator">Telefonica 2016</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>