<?php

function mquery( $queryText ){

	require("db_connect.php");
				
		$resultado = mysqli_query($connect, $queryText);
		$error = mysqli_error($connect);
		if ($error != "") echo "<b>" . $error . "</b><br>" . $queryText;
		return $resultado;
    mysqli_close();
}

function SPquery( $NameSP ){

  require("db_connect.php");
        
    $queryText = "CALL " . $NameSP;
    $resultado = mysqli_query($connect, $queryText);
    $error = mysqli_error($connect);
    if ($error != "") echo "<b>" . $error . "</b><br>" . $queryText;
    return $resultado;
    mysqli_close();
}

function mquery1rec ( $queryText ){
    $result = mquery($queryText);
    return mysqli_fetch_array($result);
}
  
function mquery1field ( $queryText){
    $result = mquery($queryText);
    $record = mysqli_fetch_array($result);
    return $record[0];
}
  
function mqueryid ( $queryText ){
    mquery($queryText);
    return mysql_insert_id();
}

function Cargar_Combo($queryText,$ID,$Name,$Default){

  require("db_connect.php");

  $Union = "SELECT '0' AS " . $ID . ", '--SELECCIONE--' AS " . $Name . " UNION ";
  $queryText = $Union . $queryText;

	$Data_Result = mquery($queryText) or die ("Error al intentar Conectar: " . mysql_error());

    	$ComboData="";

    	while ($Data_Record = mysqli_fetch_array($Data_Result)) :
        	 if($Data_Record[$ID] == $Default){
            $ComboData .=" <option selected value='".$Data_Record[$ID]."'>".$Data_Record[$Name]."</option>";
          }
          else{
            $ComboData .=" <option value='".$Data_Record[$ID]."'>".$Data_Record[$Name]."</option>"; //concatenamos el los options para luego ser insertado en el HTML
          }
    	endwhile;

echo $ComboData;

}

function Obtener_Combo($Name){

	$Dato = $_POST[$Name];

	echo $Dato;

}

function Insertar_Data($Tabla,$Campos,$Valores)
{
	$longC = count($Campos);
	$Info_Campos = "";
	$longV = count($Valores);
	$Info_Valores = "";

	for($i=0; $i<$longC; $i++){
      
      	if($i == ($longC - 1)){
      		$Info_Campos = $Info_Campos . $Campos[$i] . ') VALUES(';
      	}
      	else{
      		$Info_Campos = $Info_Campos . $Campos[$i] . ',';
      	}

    }

    for($i=0; $i<$longV; $i++){
      
      	if($i == ($longV - 1)){
      		$Info_Valores = $Info_Valores . $Valores[$i] . ');';
      	}
      	else{
      		$Info_Valores = $Info_Valores . $Valores[$i] . ',';
      	}

    }

	$SQL = "INSERT INTO " . $Tabla . "(" . $Info_Campos . $Info_Valores;
	
	$resultado = mquery($SQL);
	echo $resultado;

}



?>