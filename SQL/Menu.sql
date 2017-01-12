INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('1', 'Inicio', 'Portada.php', '0', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('2', 'Ventas/Compras', '#', '1', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('3', 'Catalogo Productos', '#', '1', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('4', 'Registro Horarios', '#', '1', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('5', 'Administración', '#', '1', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('6', 'Contabilidad', '#', '1', '1');
INSERT INTO copycat.menu (ID_Menu, Nombre_Menu, Ruta_Menu, Tiene_Sub_Menu, Estado_Menu) VALUES ('7', 'Cerrar Sesión', 'Cerrar_Sesion.php', '0', '1');

/*-----------Sub Menus-----------*/
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('2', '1', 'Venta', 'Compra_Clientes.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('2', '2', 'Devolución', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('2', '3', 'Reclamo', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('2', '4', 'Nuevo Producto', 'Solicitud_Clientes.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('2', '5', 'Ingreso de Mercaderia', 'Compra_Proveedores.php', '1');

INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('3', '1', 'General', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('3', '2', 'Filtros', '#', '1');

INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('4', '1', 'Almuerzo', 'Registro_Almuerzo.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('4', '2', 'Salidas Varias', 'Registro_Salidas.php', '1');

INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '1', 'Registrar Personal', 'Registro_Personal.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '2', 'Registrar Proveedores', 'Ingreso_Proveedores.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '3', 'Registrar Clientes', 'Ingreso_Clientes.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '4', 'Registro Producto', 'Registro_Producto.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '5', 'Crear Usuario', 'Ingreso_Usuarios.php', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('5', '6', 'Reiniciar Contraseña', '#', '1');

INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('6', '1', 'Planilla Salarios', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('6', '2', 'Generar Recibos', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('6', '3', 'Libro Compra/Venta', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('6', '4', 'Planilla IGSS', '#', '1');
INSERT INTO copycat.sub_menu (Menu_ID_Menu, ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu, Estado_Sub_Menu) VALUES ('6', '5', 'Inventario', '#', '1');

INSERT INTO `copycat`.`sub_menu` (`Menu_ID_Menu`, `ID_Sub_Menu`, `Nombre_Sub_Menu`, `Ruta_Sub_Menu`, `Estado_Sub_Menu`) VALUES ('1', '0', 'Portada', '#', '1');
INSERT INTO `copycat`.`sub_menu` (`Menu_ID_Menu`, `ID_Sub_Menu`, `Nombre_Sub_Menu`, `Ruta_Sub_Menu`, `Estado_Sub_Menu`) VALUES ('7', '0', 'Salida', '#', '1');


/*-----------Rol-Menu-----------*/
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('6', '1', '3', '1');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('7', '1', '3', '2');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('8', '1', '5', '1');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('9', '1', '5', '2');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('10', '1', '5', '3');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('11', '1', '5', '4');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('12', '1', '5', '5');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('13', '1', '5', '6');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('14', '1', '6', '1');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('15', '1', '6', '2');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('16', '1', '6', '3');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('17', '1', '6', '4');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('18', '1', '6', '5');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('19', '1', '1', '0');
INSERT INTO `copycat`.`rol_menu` (`ID_Rol_Menu`, `Rol_ID_Rol`, `Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) VALUES ('20', '1', '7', '0');