-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: copycat
-- ------------------------------------------------------
-- Server version	5.5.8-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `concepto_transaccion_monetaria`
--

LOCK TABLES `concepto_transaccion_monetaria` WRITE;
/*!40000 ALTER TABLE `concepto_transaccion_monetaria` DISABLE KEYS */;
INSERT INTO `concepto_transaccion_monetaria` VALUES (1,'Venta de Mercaderia en Efectivo'),(2,'Cobro por Servicios en Efectivo'),(3,'Venta de Mercaderia con Tarjeta'),(4,'Cobro por Servicios con Tarjeta'),(5,'Venta de Mercaderia/Servicios al Credito'),(6,'Pago a Proveedor por Ingreso de Mercaderia'),(7,'Pago de Renta'),(8,'Pago de Servicio Telefonico'),(9,'Pago de Servicio Electrico'),(10,'Pago de Servicio de Agua'),(11,'Deposito Bancario por Ingresos'),(12,'Retiro de Efectivo para Deposito Bancario'),(13,'Retiro de Efectivo para Devolución al Cliente');
/*!40000 ALTER TABLE `concepto_transaccion_monetaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estudio_mercado`
--

LOCK TABLES `estudio_mercado` WRITE;
/*!40000 ALTER TABLE `estudio_mercado` DISABLE KEYS */;
INSERT INTO `estudio_mercado` VALUES (1,'Face'),(2,'Publicidad'),(3,'Visual'),(999,'VIP');
/*!40000 ALTER TABLE `estudio_mercado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Inicio','Portada.php','0','1'),(2,'Ventas/Compras','#','1','1'),(3,'Catalogo Productos','#','1','1'),(4,'Registro Horarios','#','1','1'),(5,'Administración','#','1','1'),(6,'Contabilidad','#','1','1'),(7,'Cerrar Sesión','PHP/Cerrar_Sesion.php','0','1');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Operador'),(3,'Reporteria'),(4,'Contabilidad');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol_menu`
--

LOCK TABLES `rol_menu` WRITE;
/*!40000 ALTER TABLE `rol_menu` DISABLE KEYS */;
INSERT INTO `rol_menu` VALUES (6,1,3,1),(7,1,3,2),(8,1,5,1),(9,1,5,2),(10,1,5,3),(11,1,5,4),(12,1,5,5),(13,1,5,6),(14,1,6,1),(15,1,6,2),(16,1,6,3),(17,1,6,4),(18,1,6,5),(19,1,1,0),(20,1,5,7),(21,1,7,0),(22,1,2,1),(23,1,2,2),(24,1,2,3),(25,1,2,4),(26,1,2,5),(27,1,4,1),(28,1,4,2),(57,1,2,6),(57,1,2,7),(59,1,5,8),(30,2,1,0),(31,2,7,0),(32,2,2,1),(33,2,2,2),(34,2,2,3),(35,2,2,4),(36,2,2,5),(37,2,3,1),(38,2,3,2),(39,2,4,1),(40,2,4,2),(58,2,2,6),(58,2,2,7),(41,3,1,0),(42,3,7,0),(43,3,3,1),(44,3,3,2),(45,4,1,0),(46,4,7,0),(47,4,2,5),(48,4,3,1),(49,4,3,2),(50,4,5,2),(51,4,5,4),(52,4,6,1),(53,4,6,2),(54,4,6,3),(55,4,6,4),(56,4,6,5);
/*!40000 ALTER TABLE `rol_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sub_menu`
--

LOCK TABLES `sub_menu` WRITE;
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;
INSERT INTO `sub_menu` VALUES (1,0,'Portada','#','1'),(2,1,'Venta','Compra_Clientes.php','1'),(2,2,'Devolución','Busqueda_Factura.php','1'),(2,3,'Reclamo','Busqueda_Factura.php','1'),(2,4,'Nuevo Producto','Solicitud_Clientes.php','1'),(2,5,'Ingreso de Mercaderia','Compra_Proveedores.php','1'),(2,6,'Venta VIP','Compra_Clientes_VIP.php','1'),(2,7,'Retiro Efectivo','Retiro_Caja.php','1'),(3,1,'General','#','1'),(3,2,'Filtros','#','1'),(4,1,'Almuerzo','Registro_Almuerzo.php','1'),(4,2,'Salidas Varias','Registro_Salidas.php','1'),(5,1,'Registrar Personal','Registro_Personal.php?STD=i','1'),(5,2,'Registrar Proveedores','Ingreso_Proveedores.php','1'),(5,3,'Registrar Clientes','Ingreso_Clientes.php','1'),(5,4,'Registro Producto','Registro_Producto.php?STD=i','1'),(5,5,'Crear Usuario','Ingreso_Usuarios.php','1'),(5,6,'Reiniciar Contraseña','Reset_Credenciales.php?STD=a','1'),(5,7,'Registrar Kiosko','Registro_Kiosco.php?STD=i','1'),(5,8,'Reportes','Menu_Reportes.php','1'),(6,1,'Planilla Salarios','Planilla_Salarios.php','1'),(6,2,'Generar Recibos','Generar_Recibo_Nomina.php','1'),(6,3,'Libro Compra/Venta','#','1'),(6,4,'Planilla IGSS','#','1'),(6,5,'Inventario','#','1'),(7,0,'Salida','#','1');
/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_actividad`
--

LOCK TABLES `tipo_actividad` WRITE;
/*!40000 ALTER TABLE `tipo_actividad` DISABLE KEYS */;
INSERT INTO `tipo_actividad` VALUES (1,'Ingreso'),(2,'Salida'),(3,'Almuerzo Salida'),(4,'Receso'),(5,'Gestión Bancaria'),(6,'Asistencia Tecnica'),(7,'Almuerzo Regreso'),(8,'Regreso Gestión Bancaria'),(9,'Regreso Asistencia/Receso');
/*!40000 ALTER TABLE `tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` VALUES (1,'Comun'),(2,'VIP');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_incidencia`
--

LOCK TABLES `tipo_incidencia` WRITE;
/*!40000 ALTER TABLE `tipo_incidencia` DISABLE KEYS */;
INSERT INTO `tipo_incidencia` VALUES (1,'Reclamo Productos'),(2,'Devolución Dinero');
/*!40000 ALTER TABLE `tipo_incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Efectivo'),(2,'Tarjeta'),(3,'Cheque'),(4,'Credito');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Llavin'),(2,'Servicio'),(3,'Cerrajeria'),(999,'Servicio VIP');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_transaccion_monetaria`
--

LOCK TABLES `tipo_transaccion_monetaria` WRITE;
/*!40000 ALTER TABLE `tipo_transaccion_monetaria` DISABLE KEYS */;
INSERT INTO `tipo_transaccion_monetaria` VALUES (1,'Ingreso a Caja por Venta/Servicios'),(2,'Ingreso a Banco por Venta/Servicios'),(3,'Ingreso a Banco por Deposito'),(4,'Retiro de Caja por Compra Mercaderia'),(5,'Retiro de Caja por Pago de Servicios'),(6,'Retiro de Caja por Devolucion'),(7,'Retiro de Caja para Deposito Bancario'),(8,'Retiro de Banco por Pago de Planilla'),(9,'Facturacion a Cliente VIP');
/*!40000 ALTER TABLE `tipo_transaccion_monetaria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-10 16:46:25
