<?php

	require("Funciones.php");

	//get search term
	$searchTerm = $_GET['term'];
	//get matched data from skills table
	$query = mquery("SELECT * FROM producto_servicio WHERE Descripcion_Producto_Servicio LIKE '%" . $searchTerm . "%' OR Cod_Producto_Servicio LIKE '%" . $searchTerm . "%' ORDER BY Descripcion_Producto_Servicio ASC");
	
	while ($row = $query->fetch_assoc()) {
	    $data[] = $row['Cod_Producto_Servicio'] . "|" . $row['Descripcion_Producto_Servicio'];
	}
	//return json data
	echo json_encode($data);
?>