<?php

session_start();
if(!isset($_SESSION["User"])){
	header("Location: index.php?error=2");
}
else{
	$hoy = date("Y/m/d");
	$hora_ingreso = date("H:i:s");
	//<th>Ingreso: " . $hoy . " " . $hora_ingreso . "</th>
	$Table_Info = 	"<table style='width: 100%;'>
						<tr>
							<th>Bienvenido: " . $_SESSION["User"] . "</th>
							<th>Kiosco: " . $_SESSION["Kiosco"] . "</th>
							<th>Rol: " . $_SESSION["Rol_Des"] . "</th>
							<th>
								<button type='button' onclick='CajaKiosco()'' class='button save'>Caja</button>
								<button type='button' onclick='VentasKiosco()'' class='button edit'>Ventas</button>
								<button type='button' onclick='CortesKiosco()'' class='button spark'>Cortes</button>
							</th>
							
						</tr>
					 </table>";

	echo $Table_Info;
}

$Menu = "";

$Query_Menu = " SELECT 
				    *
				FROM
				    MENU
				WHERE
				    ID_Menu IN (SELECT DISTINCT
				            Sub_Menu_Menu_ID_Menu
				        FROM
				            rol_menu
				        WHERE
				            Rol_ID_Rol = " . $_SESSION["Rol_Cod"] . ")
				        AND Estado_Menu = 1;";

$Data_Menu = mquery($Query_Menu) or die ("Error al intentar Conectar: " . mysqli_error());

while ($Data_Menu_Record = mysqli_fetch_array($Data_Menu)) :
        	$Menu .="<li><a href='".$Data_Menu_Record["Ruta_Menu"]."'>".utf8_encode($Data_Menu_Record["Nombre_Menu"]);
        	if($Data_Menu_Record["Tiene_Sub_Menu"] == '0'){ //Si no tiene SubMenu cierro la etiqueta <li>
        		$Menu .= "</a></li>";
        	}
        	else{ //Si tiene SubMenu concateno el submenu
        		$Query_IDs_SubMenu = "   SELECT 
										    ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu
										FROM
										    sub_menu
										WHERE
										    Estado_Sub_Menu = 1 AND Menu_ID_Menu = " . $Data_Menu_Record["ID_Menu"] . "
										        AND ID_Sub_Menu IN (SELECT 
										            Sub_Menu_ID_Sub_Menu
										        FROM
										            rol_menu
										        WHERE
										            Sub_Menu_Menu_ID_Menu = " . $Data_Menu_Record["ID_Menu"] . ");";

				$Data_IDs_SubMenu = mquery($Query_IDs_SubMenu) or die ("Error al intentar Conectar: " . mysqli_error());
        		
        			$Menu .= "</a><ul>";
        		while($Data_SubMenu_Record = mysqli_fetch_array($Data_IDs_SubMenu)) :
        					  $Menu	.= "<li><a href='" . $Data_SubMenu_Record["Ruta_Sub_Menu"] . "'>" .utf8_encode($Data_SubMenu_Record["Nombre_Sub_Menu"]) . "</a></li>";
        		endwhile;
        			$Menu .= "</ul></li>";
        	}
endwhile;

//echo $Menu;

$Encabezado_Menu = "<script type='text/javascript' src='InfoKiosco.js'></script>
					<link rel='stylesheet' type='text/css' media='all' href='style/Botones.css' />
					<link type='image/x-icon' href='favicon-copycat.png' rel='shortcut icon' />
	<div class='header-wrapper opacity'>
	<div class='header'>
		<!-- Begin Logo -->
		<div class='logo'>
		    <a href='index.html'>
				<img src='style/images/Logo1.jpg' alt='' />
			</a>
	    </div>
		<!-- End Logo -->
		<!-- Begin Menu -->
		<div id='menu-wrapper'>
			<div id='menu' class='menu'>
				<ul id='tiny'>";

$Footer_Menu = "</div>
		</div>
		<div class='clear'></div>
		<!-- End Menu -->
	</div>
</div>";			

$encabezado = $Encabezado_Menu . $Menu . $Footer_Menu;

/*$encabezado = "<div class='header-wrapper opacity'>
	<div class='header'>
		<!-- Begin Logo -->
		<div class='logo'>
		    <a href='index.html'>
				<img src='style/images/Logo1.jpg' alt='' />
			</a>
	    </div>
		<!-- End Logo -->
		<!-- Begin Menu -->
		<div id='menu-wrapper'>
			<div id='menu' class='menu'>
				<ul id='tiny'>
					<li class='active'><a href='Portada.php'>INICIO</a></li>
					<li><a href='#'>VENTAS/COMPRAS</a>
						<ul>
							<li><a href='Compra_Clientes.php'>VENTA</a></li>
							<li><a href='#'>DEVOLUCIÓN</a></li>
							<li><a href='#'>RECLAMO</a></li>
							<li><a href='Solicitud_Clientes.php'>NUEVO PRODUCTO</a></li>
							<li><a href='Compra_Proveedores.php'>INGRESO DE MERCADERIA</a></li>
						</ul>
					</li>
					<li><a href='#'>CATALOGO PRODUCTOS</a>
						<ul>
							<li><a href='Reporte_Filtro.php'>GENERAL</a></li>
							<li><a href='Reporte_General.php'>FILTROS</a></li>
						</ul>
					</li>
					<li><a href='#'>REGISTRO HORARIOS</a>
						<ul>
							<li><a href='Registro_Almuerzo.php'>ALMUERZO</a></li>
							<li><a href='Registro_Salidas.php'>SALIDAS VARIAS</a></li>
						</ul>
					</li>
					<li><a href='#'>ADMINISTRACIÓN</a>
						<ul>
							<li><a href='Registro_Personal.php'>REGISTRAR PERSONAL</a></li>
							<li><a href='Ingreso_Proveedores.php'>REGISTRAR PROVEEDOR</a></li>
							<li><a href='Ingreso_Clientes.php'>REGISTRAR CLIENTES</a></li>
							<li><a href='Registro_Producto.php'>REGISTRO PRODUCTO</a></li>
							<li><a href='Ingreso_Usuarios.php'>CREAR USUARIO</a></li>
							<li><a href='#'>REINICIAR CONTRASEÑA</a></li>
						</ul>			
					</li>
					<li><a href='PHP/Cerrar_Sesion.php'>CERRAR SESIÓN</a></li>
				</ul>
			</div>
		</div>
		<div class='clear'></div>
		<!-- End Menu -->
	</div>
</div>";*/

echo $encabezado;

?>