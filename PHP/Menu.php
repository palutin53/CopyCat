<?php



$encabezado = "<div class='header-wrapper opacity'>
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
					<li><a href='#'>REGISTRO DE VENTAS</a>
						<ul>
							<li><a href='Alta_Personal.php'>VENTA</a></li>
							<li><a href='Baja_Personal.php'>DEVOLUCIÓN</a></li>
							<li><a href='Baja_Personal.php'>RECLAMO</a></li>
							<li><a href='#'>SOLICITUD CLIENTES</a></li>
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
					<li><a href='index.php'>CERRAR SESIÓN</a></li>
				</ul>
			</div>
		</div>
		<div class='clear'></div>
		<!-- End Menu -->
	</div>
</div>";

echo $encabezado;

?>