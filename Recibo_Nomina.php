<?php

header('Content-Type: text/html; charset=UTF-8'); 

require_once('PHP/Inc1ud3s/db_connect.php');
require_once('PHP/pdf/mpdf.php');

$arc 	= file_get_contents('PHP/templates_recibo/master_recibo.html'); 
$estilo = file_get_contents('PHP/templates_recibo/css/recibo.css');

$Mes = $_POST['Ddl_Mes'];
$ID_EMP = $_POST['Ddl_Empleado'];

$rtrans = mysql_query("SELECT 
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
					    e.Salario_Base_Empleado - ((e.Salario_Base_Empleado * 4.83) / 100) - ((e.Salario_Base_Empleado * 1) / 100) - ((e.Salario_Base_Empleado * 1) / 100) + SUM(lf.Comision_Linea_Detalle_Encabezado_Factura) + 250 Monto_Efectivo
					FROM
					    empleado e
					        INNER JOIN
					    linea_detalle_encabezado_factura lf ON lf.Factura_Encabezado_Factura_Empleado_ID_Empleado = e.ID_Empleado
					        INNER JOIN
					    encabezado_factura ef ON lf.Factura_Encabezado_Factura_Num_Encabezado_Factura = ef.Num_Encabezado_Factura
					WHERE
					    ef.Fecha_Encabezado_Factura LIKE '%-" . $Mes . "-%' AND e.ID_Empleado = " . $ID_EMP . "
					GROUP BY lf.Factura_Encabezado_Factura_Empleado_ID_Empleado;") or die(mysql_error());

$total=0;
$descripcion="";

while($row = mysql_fetch_assoc($rtrans)){
  $descripcion .= "<tr>";
  $descripcion .= "<td><center>Q.".number_format($row['Salario_Base'], 2,'.',',')."</center></td>";
  $descripcion .= "<td><center>".number_format($row['IGSS'], 2,'.',',')."</center></td>";
  $descripcion .= "<td><center>".number_format($row['IRTRA'], 2,'.',',')."</center></td>";
  $descripcion .= "<td><center>Q.".number_format($row['INTECAP'], 2,'.',',')."</center></td>";
  $descripcion .= "<td><center>Q.".number_format($row['Comision'], 2,'.',',')."</center></td>";
  $descripcion .= "<td><center>Q.250.00</center></td>";
  $descripcion .= "</tr>";
  $total = number_format($row['Monto_Efectivo'], 2,'.',',');
  $nombre = $row['Nombre_Completo'];
  $date = $row['Fecha'];
  $dpi = $row['DPI_Empleado'];
}

$arc = str_replace('{{{fecha}}}', $date, $arc);
$arc = str_replace('{{{colegiado}}}', utf8_encode($nombre), $arc); 
$arc = str_replace('{{{no_recibo}}}', $idte, $arc); 
$arc = str_replace('{{{timbres_descripcion}}}', $descripcion, $arc); 
$arc = str_replace('{{{val_total}}}',"<strong>Q.".$total."</strong>",$arc);
$arc = str_replace('{{{DPI}}}',$dpi,$arc);
//$arc = str_replace('{{{no_nit}}}',$nit,$arc);
gen_pdf($arc,$idte,$estilo);

function gen_pdf($gen,$idte, $stylesheet){
	$mpdf = new mPDF();
	$mpdf->WriteHTML($stylesheet,1);
	$mpdf->WriteHTML($gen,2);
	$mpdf->Output('Recibos_Generados/Recibo_Nomina.pdf','F');
	$mpdf->Output();
	exit;
}
?>