CREATE DATABASE  IF NOT EXISTS `copycat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `copycat`;
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
-- Table structure for table `actividad_empleado`
--

DROP TABLE IF EXISTS `actividad_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad_empleado` (
  `Fecha_Actividad` datetime NOT NULL,
  `Tipo_Actividad_ID_Tipo_Actividad` int(11) NOT NULL,
  `Empleado_ID_Empleado` int(11) NOT NULL,
  `Justificacion_Actividad_Empleado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Fecha_Actividad`,`Tipo_Actividad_ID_Tipo_Actividad`,`Empleado_ID_Empleado`),
  KEY `fk_Actividad_Empleado_Tipo_Actividad_idx` (`Tipo_Actividad_ID_Tipo_Actividad`),
  KEY `fk_Actividad_Empleado_Empleado1_idx` (`Empleado_ID_Empleado`),
  CONSTRAINT `fk_Actividad_Empleado_Tipo_Actividad` FOREIGN KEY (`Tipo_Actividad_ID_Tipo_Actividad`) REFERENCES `tipo_actividad` (`ID_Tipo_Actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Empleado_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_empleado`
--

LOCK TABLES `actividad_empleado` WRITE;
/*!40000 ALTER TABLE `actividad_empleado` DISABLE KEYS */;
INSERT INTO `actividad_empleado` VALUES ('2017-01-12 17:18:53',1,1,NULL),('2017-01-12 17:19:07',2,1,NULL),('2017-01-12 17:53:31',1,1,'Trafico'),('2017-01-12 18:13:15',1,1,'N/A'),('2017-01-12 18:13:25',2,1,''),('2017-01-12 18:13:40',1,1,'N/A'),('2017-01-12 18:15:13',2,1,'Permiso'),('2017-01-13 09:59:06',1,1,'Sin internet'),('2017-01-13 10:10:00',2,1,'prueba'),('2017-01-13 10:10:19',1,1,'prueba ingreso'),('2017-01-13 11:34:33',2,1,'prueba'),('2017-01-13 11:34:47',1,1,'test'),('2017-01-13 11:35:41',2,1,'zaaa'),('2017-01-13 12:36:40',1,1,'prueba oakland'),('2017-01-13 12:39:10',2,1,'Fin prueba oakland'),('2017-01-13 12:44:01',1,1,'prueba oakland 2'),('2017-01-13 13:01:39',2,1,'okland fin'),('2017-01-13 13:01:58',1,1,'Peri 1'),('2017-01-13 14:44:45',2,1,'aaaaa'),('2017-01-13 14:44:56',1,1,'xxxxx'),('2017-01-13 14:51:57',2,1,'aaaaaaaaaaaa'),('2017-01-13 14:52:37',1,1,'aaaaaa'),('2017-01-13 14:57:14',2,1,'bbbbbbb'),('2017-01-13 15:00:13',1,1,'prueba xxxx'),('2017-01-13 15:01:43',2,1,'sdfsdfsd'),('2017-01-13 15:03:24',1,1,'test 1'),('2017-01-13 15:07:04',2,1,'fin test'),('2017-01-13 15:24:29',1,1,'test 111'),('2017-01-16 09:06:32',1,1,'pruebas'),('2017-01-16 18:32:25',1,7,'aaaa'),('2017-01-16 18:32:46',1,1,'a'),('2017-01-17 09:48:48',1,1,'aaaa'),('2017-01-17 10:50:48',2,1,'aaaa'),('2017-01-17 10:51:40',1,1,'aaaaa'),('2017-01-17 10:52:14',1,1,'aaaaa'),('2017-01-17 10:52:21',2,1,'a'),('2017-01-17 10:52:43',1,1,'aaaa'),('2017-01-17 10:53:05',2,1,'aa'),('2017-01-17 10:57:55',1,1,'a'),('2017-01-17 10:58:20',2,1,'a'),('2017-01-17 11:00:47',1,1,'lsdjf'),('2017-01-18 11:49:36',1,1,'lsfjsdfsdfsd'),('2017-01-18 19:11:25',2,1,'N/A'),('2017-01-18 19:12:23',1,1,'aaaa'),('2017-01-18 19:12:46',2,1,'N/A'),('2017-01-18 19:15:59',1,1,'aa\r\n'),('2017-01-18 19:16:14',2,1,'N/A'),('2017-01-18 19:16:28',1,7,'dsafsdf'),('2017-01-25 12:48:05',1,1,'aaaa'),('2017-01-25 16:48:05',3,1,'Salida a almuerzo'),('2017-01-25 17:08:17',7,1,'regreso de almuerzo'),('2017-01-26 12:14:55',1,1,'pruebas'),('2017-01-27 11:37:24',1,1,'aaa'),('2017-01-30 12:10:45',1,1,'sdfsdfsdf'),('2017-01-30 12:35:08',1,1,'sdfsdaaaaaaaaaa'),('2017-01-31 10:49:48',1,1,'aaaaaaaaa'),('2017-01-31 17:51:47',2,1,'N/A'),('2017-01-31 17:51:58',1,1,'aaaaa'),('2017-02-01 12:20:30',1,1,'yyyyyy'),('2017-02-02 17:43:30',1,1,'a'),('2017-02-03 14:59:13',1,1,''),('2017-02-06 10:07:54',1,1,'123456'),('2017-02-06 11:06:49',1,1,'aaaaa'),('2017-02-06 17:25:03',2,1,'N/A'),('2017-02-06 17:25:17',1,1,'aaaa'),('2017-02-06 18:01:53',2,1,'N/A'),('2017-02-06 18:02:02',1,1,'sdfsdf'),('2017-02-06 18:36:34',2,1,'N/A'),('2017-02-06 18:36:47',1,1,'sfsdfd'),('2017-02-07 09:48:23',1,1,'aaaaa'),('2017-02-07 15:47:16',2,1,'aaaaaaaaa'),('2017-02-07 15:48:03',1,1,'aaaaaaa'),('2017-02-07 19:13:21',2,1,'N/A');
/*!40000 ALTER TABLE `actividad_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atencion_kiosco`
--

DROP TABLE IF EXISTS `atencion_kiosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atencion_kiosco` (
  `Fecha_Atencion_Kiosco` datetime NOT NULL,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Empleado_ID_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`Kiosco_ID_Kiosco`,`Empleado_ID_Empleado`,`Fecha_Atencion_Kiosco`),
  KEY `fk_Cubierto_Kiosco_Empleado1_idx` (`Empleado_ID_Empleado`),
  CONSTRAINT `fk_Cubierto_Kiosco_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cubierto_Kiosco_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencion_kiosco`
--

LOCK TABLES `atencion_kiosco` WRITE;
/*!40000 ALTER TABLE `atencion_kiosco` DISABLE KEYS */;
INSERT INTO `atencion_kiosco` VALUES ('2017-01-13 00:00:00','J11-1',1),('2017-01-13 10:10:11','J11-1',1),('2017-01-13 14:52:32','J11-1',1),('2017-01-16 00:00:00','J11-1',1),('2017-01-17 00:00:00','J11-1',1),('2017-01-18 00:00:00','J11-1',1),('2017-01-25 00:00:00','J11-1',1),('2017-01-26 00:00:00','J11-1',1),('2017-01-27 00:00:00','J11-1',1),('2017-01-30 00:00:00','J11-1',1),('2017-01-31 00:00:00','J11-1',1),('2017-02-01 00:00:00','J11-1',1),('2017-02-02 00:00:00','J11-1',1),('2017-02-03 00:00:00','J11-1',1),('2017-02-06 00:00:00','J11-1',1),('2017-02-07 00:00:00','J11-1',1),('2017-01-13 00:00:00','Okla-1',1),('2017-01-13 12:43:51','Okla-1',1),('2017-01-16 00:00:00','Okla-1',1),('2017-01-13 13:01:52','Peri-1',1),('2017-01-16 00:00:00','Okla-1',7),('2017-01-18 00:00:00','Okla-1',7);
/*!40000 ALTER TABLE `atencion_kiosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Cliente_ID_Tipo_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(50) NOT NULL,
  `Direccion_Cliente` varchar(30) NOT NULL,
  `Nit_Cliente` varchar(45) NOT NULL,
  `Telefono_Cliente` varchar(15) NOT NULL,
  `Correo_Cliente` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `fk_Cliente_Tipo_Cliente1_idx` (`Tipo_Cliente_ID_Tipo_Cliente`),
  CONSTRAINT `fk_Cliente_Tipo_Cliente1` FOREIGN KEY (`Tipo_Cliente_ID_Tipo_Cliente`) REFERENCES `tipo_cliente` (`ID_Tipo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'Jearson Mazariegos','Ciudad','7051408-9','5460-0923','jearson.developer11@gmail.com'),(2,1,'Jose Rodas','Ciudad','5055268-9','0000-0000','dr.rodas@gmail.com'),(3,1,'Leonardo Barrondo','Ciudad','7085456-9','0000-0000','lbarrondo.leo@gmail.com'),(4,1,'Luis Salazar','Ciudad','9085608-9','1111-1111','beto.gordo@gmail.com'),(5,1,'Elder Sacrab','Ciudad','4025638-9','1111-1111','beto.gordo@gmail.com'),(6,1,'Reyna Lopez','Villa Nueva','6057868-7','7777-8888','reyna@gmail.com'),(7,2,'La Cancha Cibernetica','Ciudad','7051408-11','+50254600923','jearson.developer11@gmail.com'),(9,1,'Beatriz Lopez','Ciudad','6089568-7','1234-9876','bea@gmail.com'),(10,1,'C/F','--','C/F','--','--'),(11,1,'CF','Ciudad','CF','--','--'),(15,1,'Raul Alvarado','Zona 12','8071508-4','5555-4444','N/D');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_transaccion_monetaria`
--

DROP TABLE IF EXISTS `concepto_transaccion_monetaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_transaccion_monetaria` (
  `ID_Concepto_Transaccion_Monetaria` int(11) NOT NULL,
  `Descripcion_Concepto_Transaccion_Monetaria` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Concepto_Transaccion_Monetaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_transaccion_monetaria`
--

LOCK TABLES `concepto_transaccion_monetaria` WRITE;
/*!40000 ALTER TABLE `concepto_transaccion_monetaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto_transaccion_monetaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cortes`
--

DROP TABLE IF EXISTS `cortes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cortes` (
  `ID_Cortes` int(11) NOT NULL,
  `Encabezado_Factura_Num_Encabezado_Factura` varchar(30) NOT NULL,
  `Encabezado_Factura_Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Encabezado_Factura_Empleado_ID_Empleado` int(11) NOT NULL,
  `Fecha_Cortes` datetime NOT NULL,
  `Cortes_Totales` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cortes`,`Encabezado_Factura_Num_Encabezado_Factura`,`Encabezado_Factura_Kiosco_ID_Kiosco`,`Encabezado_Factura_Empleado_ID_Empleado`),
  KEY `fk_Cortes_Encabezado_Factura1_idx` (`Encabezado_Factura_Num_Encabezado_Factura`,`Encabezado_Factura_Kiosco_ID_Kiosco`,`Encabezado_Factura_Empleado_ID_Empleado`),
  CONSTRAINT `fk_Cortes_Encabezado_Factura1` FOREIGN KEY (`Encabezado_Factura_Num_Encabezado_Factura`, `Encabezado_Factura_Kiosco_ID_Kiosco`, `Encabezado_Factura_Empleado_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cortes`
--

LOCK TABLES `cortes` WRITE;
/*!40000 ALTER TABLE `cortes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cortes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_encabezado_factura`
--

DROP TABLE IF EXISTS `detalle_encabezado_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_encabezado_factura` (
  `ID_Detalle_Encabezado_Factura` int(11) NOT NULL,
  `Num_Encabezado_Factura` varchar(30) NOT NULL,
  `Factura_Kiosko_ID_Kiosko` varchar(15) NOT NULL,
  `Factura_Empleado_ID_Empleado` int(11) NOT NULL,
  `Producto_Servicio_Cod_Producto_Servicio` varchar(25) NOT NULL,
  `Cantidad_Producto_Detalle_Encabezado_Factura` int(11) NOT NULL,
  `Total_Detalle_Encabezado_Factura` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ID_Detalle_Encabezado_Factura`,`Num_Encabezado_Factura`,`Factura_Kiosko_ID_Kiosko`,`Factura_Empleado_ID_Empleado`),
  KEY `fk_Detalle_Encabezado_Factura_Encabezado_Factura1_idx` (`Num_Encabezado_Factura`,`Factura_Kiosko_ID_Kiosko`,`Factura_Empleado_ID_Empleado`),
  KEY `fk_Detalle_Encabezado_Factura_Producto_Servicio1_idx` (`Producto_Servicio_Cod_Producto_Servicio`),
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Encabezado_Factura1` FOREIGN KEY (`Num_Encabezado_Factura`, `Factura_Kiosko_ID_Kiosko`, `Factura_Empleado_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Producto_Servicio1` FOREIGN KEY (`Producto_Servicio_Cod_Producto_Servicio`) REFERENCES `producto_servicio` (`Cod_Producto_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_encabezado_factura`
--

LOCK TABLES `detalle_encabezado_factura` WRITE;
/*!40000 ALTER TABLE `detalle_encabezado_factura` DISABLE KEYS */;
INSERT INTO `detalle_encabezado_factura` VALUES (1,'J11-1-FA17','J11-1',1,'LL-A',1,40.00),(1,'J11-1-FA18','J11-1',1,'CJA-A',1,125.00),(1,'J11-1-FA19','J11-1',1,'LL-A',1,40.00),(2,'J11-1-FA17','J11-1',1,'CJA-A',1,125.00),(2,'J11-1-FA18','J11-1',1,'CJA-B',2,260.00),(2,'J11-1-FA19','J11-1',1,'CJA-A',1,125.00);
/*!40000 ALTER TABLE `detalle_encabezado_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_encabezado_ni`
--

DROP TABLE IF EXISTS `detalle_encabezado_ni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_encabezado_ni` (
  `Linea_Detalle_Encabezado_NI` int(11) NOT NULL,
  `Encabezado_NI_ID_Encabezado_NI` int(11) NOT NULL,
  `Encabezado_NI_Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Empleado_ID_Empleado` int(11) NOT NULL,
  `Cantidad_Detalle_Encabezado_NI` int(11) NOT NULL,
  `Costo_Total_Detalle_Encabezado_NI` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Linea_Detalle_Encabezado_NI`,`Encabezado_NI_ID_Encabezado_NI`,`Encabezado_NI_Kiosco_ID_Kiosco`),
  KEY `fk_Detalle_Encabezado_NI_Empleado1_idx` (`Empleado_ID_Empleado`),
  KEY `fk_Detalle_Encabezado_NI_Encabezado_Nota_Ingreso1` (`Encabezado_NI_ID_Encabezado_NI`,`Encabezado_NI_Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Detalle_Encabezado_NI_Encabezado_Nota_Ingreso1` FOREIGN KEY (`Encabezado_NI_ID_Encabezado_NI`, `Encabezado_NI_Kiosco_ID_Kiosco`) REFERENCES `encabezado_nota_ingreso` (`ID_Encabezado_Nota_Ingreso`, `Kiosco_ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_NI_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_encabezado_ni`
--

LOCK TABLES `detalle_encabezado_ni` WRITE;
/*!40000 ALTER TABLE `detalle_encabezado_ni` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_encabezado_ni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_existencia`
--

DROP TABLE IF EXISTS `detalle_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_existencia` (
  `ID_Detalle_Existencia` int(11) NOT NULL,
  `Encabezado_Existencia_ID_Encabezado_Existencia` varchar(15) NOT NULL,
  `Encabezado_Existencia_Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Producto_Servicio_Cod_Producto_Servicio` varchar(25) NOT NULL,
  `Cantidad_Anterior_Detalle_Existencia` int(11) NOT NULL,
  `Cantidad_Existente_Detalle_Existencia` int(11) NOT NULL,
  `Tipo_Mov_Detalle_Existencia` char(1) NOT NULL,
  PRIMARY KEY (`ID_Detalle_Existencia`,`Encabezado_Existencia_ID_Encabezado_Existencia`,`Encabezado_Existencia_Kiosco_ID_Kiosco`),
  KEY `fk_Detalle_Existencia_Producto_Servicio1_idx` (`Producto_Servicio_Cod_Producto_Servicio`),
  KEY `fk_Detalle_Existencia_Encabezado_Existencia1` (`Encabezado_Existencia_ID_Encabezado_Existencia`,`Encabezado_Existencia_Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Detalle_Existencia_Encabezado_Existencia1` FOREIGN KEY (`Encabezado_Existencia_ID_Encabezado_Existencia`, `Encabezado_Existencia_Kiosco_ID_Kiosco`) REFERENCES `encabezado_existencia` (`ID_Encabezado_Existencia`, `Kiosco_ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Existencia_Producto_Servicio1` FOREIGN KEY (`Producto_Servicio_Cod_Producto_Servicio`) REFERENCES `producto_servicio` (`Cod_Producto_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_existencia`
--

LOCK TABLES `detalle_existencia` WRITE;
/*!40000 ALTER TABLE `detalle_existencia` DISABLE KEYS */;
INSERT INTO `detalle_existencia` VALUES (1,'J11-1-E4','J11-1','CJA-A',0,10,''),(2,'J11-1-E4','J11-1','CJA-A',10,12,''),(3,'J11-1-E18','J11-1','CJA-A',10,15,'u'),(3,'J11-1-E4','J11-1','CJA-B',5,11,''),(4,'J11-1-E18','J11-1','CJA-A',10,15,'u'),(4,'J11-1-E4','J11-1','CJA-B',11,22,''),(5,'J11-1-E18','J11-1','CJA-A',10,15,'u'),(5,'J11-1-E4','J11-1','CJA-A',10,13,'u'),(6,'J11-1-E18','J11-1','CJA-A',10,15,'u'),(6,'J11-1-E4','J11-1','CJA-A',10,13,'u'),(7,'J11-1-E4','J11-1','CJA-A',10,16,'u'),(8,'J11-1-E4','J11-1','CJA-A',10,16,'u'),(9,'J11-1-E4','J11-1','CJA-A',10,16,'u'),(10,'J11-1-E4','J11-1','CJA-A',10,4,'d'),(11,'J11-1-E4','J11-1','CJA-A',10,16,'u'),(12,'J11-1-E4','J11-1','CJA-A',16,20,'u'),(13,'J11-1-E18','J11-1','CJA-A',20,10,'d'),(14,'J11-1-E4','J11-1','CJA-B',22,20,'d'),(15,'J11-1-E4','J11-1','CJA-B',20,25,'u'),(16,'J11-1-E18','J11-1','CJA-B',25,25,'u');
/*!40000 ALTER TABLE `detalle_existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispositivo` (
  `ID_Dispositivo` varchar(10) NOT NULL,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Descripcion_Dispositivo` varchar(45) NOT NULL,
  `Serie_Dispositivo` varchar(75) NOT NULL,
  PRIMARY KEY (`ID_Dispositivo`),
  KEY `fk_Dispositivo_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Dispositivo_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivo`
--

LOCK TABLES `dispositivo` WRITE;
/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Nombre_Empleado` varchar(50) NOT NULL,
  `Apellido_Empleado` varchar(50) NOT NULL,
  `DPI_Empleado` varchar(45) NOT NULL,
  `Telefono_Empleado` varchar(15) NOT NULL,
  `Email_Empleado` varchar(75) NOT NULL,
  `Salario_Base_Empleado` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  KEY `fk_Empleado_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Empleado_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'J11-1','Jearson','Mazariegos','2604-79674-0101','5460-0923','jearson.developer11@gmail.com',2750.00),(7,'Okla-1','Diego JosÃÂÃÂ©','Rodas','2604-89578-0101','1111-1111','drodas@gmail.com',2500.00);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encabezado_existencia`
--

DROP TABLE IF EXISTS `encabezado_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encabezado_existencia` (
  `ID_Encabezado_Existencia` varchar(15) NOT NULL COMMENT 'ID compuesto por la fecha-IDKiosko',
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Fecha_Encabezado_Existencia` datetime NOT NULL,
  PRIMARY KEY (`ID_Encabezado_Existencia`,`Kiosco_ID_Kiosco`),
  KEY `fk_Encabezado_Existencia_Kiosko1` (`Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Encabezado_Existencia_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encabezado_existencia`
--

LOCK TABLES `encabezado_existencia` WRITE;
/*!40000 ALTER TABLE `encabezado_existencia` DISABLE KEYS */;
INSERT INTO `encabezado_existencia` VALUES ('J11-1-E1','J11-1','2017-01-08 00:00:00'),('J11-1-E10','J11-1','2017-01-25 00:00:00'),('J11-1-E11','J11-1','2017-01-26 00:00:00'),('J11-1-E12','J11-1','2017-01-27 00:00:00'),('J11-1-E13','J11-1','2017-01-30 00:00:00'),('J11-1-E14','J11-1','2017-01-31 00:00:00'),('J11-1-E15','J11-1','2017-02-01 00:00:00'),('J11-1-E16','J11-1','2017-02-02 00:00:00'),('J11-1-E17','J11-1','2017-02-03 00:00:00'),('J11-1-E18','J11-1','2017-02-06 00:00:00'),('J11-1-E19','J11-1','2017-02-07 00:00:00'),('J11-1-E2','J11-1','2017-01-09 00:00:00'),('J11-1-E3','J11-1','2017-01-10 00:00:00'),('J11-1-E4','J11-1','2017-01-11 00:00:00'),('J11-1-E5','J11-1','2017-01-12 00:00:00'),('J11-1-E6','J11-1','2017-01-13 00:00:00'),('J11-1-E7','J11-1','2017-01-16 00:00:00'),('J11-1-E8','J11-1','2017-01-17 00:00:00'),('J11-1-E9','J11-1','2017-01-18 00:00:00'),('Okla-1-E1','Okla-1','2017-01-13 00:00:00'),('Okla-1-E2','Okla-1','2017-01-16 00:00:00'),('Okla-1-E3','Okla-1','2017-01-18 00:00:00');
/*!40000 ALTER TABLE `encabezado_existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encabezado_factura`
--

DROP TABLE IF EXISTS `encabezado_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encabezado_factura` (
  `Num_Encabezado_Factura` varchar(30) NOT NULL,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Empleado_ID_Empleado` int(11) NOT NULL,
  `Tipo_Pago_ID_Tipo_Pago` int(11) NOT NULL,
  `Cliente_ID_Cliente` int(11) NOT NULL,
  `Fecha_Encabezado_Factura` datetime NOT NULL,
  `Num_Factura_Encabezado_Factura` varchar(45) NOT NULL,
  `Estudio_Mercado_ID_Estudio_Mercado` int(11) NOT NULL,
  `Descuento_Encabezado_Factura` decimal(8,2) NOT NULL DEFAULT '0.00',
  `Total_Venta_Encabezado_Factura` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Num_Encabezado_Factura`,`Kiosco_ID_Kiosco`,`Empleado_ID_Empleado`),
  KEY `fk_Encabezado_Factura_Tipo_Pago1_idx` (`Tipo_Pago_ID_Tipo_Pago`),
  KEY `fk_Encabezado_Factura_Cliente1_idx` (`Cliente_ID_Cliente`),
  KEY `fk_Encabezado_Factura_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  KEY `fk_Encabezado_Factura_Empleado1_idx` (`Empleado_ID_Empleado`),
  KEY `fk_Encabezado_Factura_Estudio_Mercado1_idx` (`Estudio_Mercado_ID_Estudio_Mercado`),
  CONSTRAINT `fk_Encabezado_Factura_Cliente1` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Estudio_Mercado1` FOREIGN KEY (`Estudio_Mercado_ID_Estudio_Mercado`) REFERENCES `estudio_mercado` (`ID_Estudio_Mercado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Tipo_Pago1` FOREIGN KEY (`Tipo_Pago_ID_Tipo_Pago`) REFERENCES `tipo_pago` (`ID_Tipo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encabezado_factura`
--

LOCK TABLES `encabezado_factura` WRITE;
/*!40000 ALTER TABLE `encabezado_factura` DISABLE KEYS */;
INSERT INTO `encabezado_factura` VALUES ('J11-1-FA1','J11-1',1,1,1,'2017-01-30 18:02:54','J11-123',0,0.00,0.00),('J11-1-FA10','J11-1',1,1,7,'2017-02-07 11:55:03','TS-07',0,0.00,0.00),('J11-1-FA11','J11-1',1,2,6,'2017-02-07 11:57:20','TS-08',0,0.00,0.00),('J11-1-FA12','J11-1',1,1,1,'2017-02-07 12:07:39','TS-09',0,0.00,0.00),('J11-1-FA13','J11-1',1,1,9,'2017-02-07 12:37:45','TS-10',0,0.00,0.00),('J11-1-FA14','J11-1',1,1,1,'2017-02-07 12:40:53','TS-11',0,0.00,0.00),('J11-1-FA15','J11-1',1,1,1,'2017-02-07 12:46:37','TS-12',0,0.00,0.00),('J11-1-FA16','J11-1',1,1,7,'2017-02-07 12:52:32','TS-13',0,0.00,0.00),('J11-1-FA17','J11-1',1,1,1,'2017-02-07 15:55:53','TS-14',1,0.00,0.00),('J11-1-FA18','J11-1',1,1,1,'2017-02-07 17:08:17','TS-15',2,0.00,175.00),('J11-1-FA19','J11-1',1,1,1,'2017-02-07 19:00:14','TS-16',1,0.00,165.00),('J11-1-FA2','J11-1',1,1,9,'2017-01-30 18:09:45','123456',0,0.00,0.00),('J11-1-FA3','J11-1',1,1,1,'2017-02-06 17:09:07','987654',0,0.00,0.00),('J11-1-FA4','J11-1',1,1,7,'2017-02-07 10:32:31','TS-01',0,0.00,0.00),('J11-1-FA5','J11-1',1,1,6,'2017-02-07 10:52:55','TS-02',0,0.00,0.00),('J11-1-FA6','J11-1',1,1,11,'2017-02-07 10:55:54','TS-03',0,0.00,0.00),('J11-1-FA7','J11-1',1,1,15,'2017-02-07 11:17:33','TS-04',0,0.00,0.00),('J11-1-FA8','J11-1',1,1,7,'2017-02-07 11:48:07','TS-05',0,0.00,0.00),('J11-1-FA9','J11-1',1,1,1,'2017-02-07 11:52:57','TS-06',0,0.00,0.00);
/*!40000 ALTER TABLE `encabezado_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encabezado_nota_ingreso`
--

DROP TABLE IF EXISTS `encabezado_nota_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encabezado_nota_ingreso` (
  `ID_Encabezado_Nota_Ingreso` int(11) NOT NULL,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `Proveedor_ID_Proveedor` int(11) NOT NULL,
  `Fecha_Encabezado_Nota_Ingreso` datetime NOT NULL,
  `Factura_Ref_Encabezado_Nota_Ingreso` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Encabezado_Nota_Ingreso`,`Kiosco_ID_Kiosco`),
  KEY `fk_Encabezado_Nota_Ingreso_Proveedor1_idx` (`Proveedor_ID_Proveedor`),
  KEY `fk_Encabezado_Nota_Ingreso_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Encabezado_Nota_Ingreso_Proveedor1` FOREIGN KEY (`Proveedor_ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Nota_Ingreso_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encabezado_nota_ingreso`
--

LOCK TABLES `encabezado_nota_ingreso` WRITE;
/*!40000 ALTER TABLE `encabezado_nota_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_nota_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudio_mercado`
--

DROP TABLE IF EXISTS `estudio_mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudio_mercado` (
  `ID_Estudio_Mercado` int(11) NOT NULL AUTO_INCREMENT,
  `Detalle_Estudio_Mercado` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Estudio_Mercado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio_mercado`
--

LOCK TABLES `estudio_mercado` WRITE;
/*!40000 ALTER TABLE `estudio_mercado` DISABLE KEYS */;
INSERT INTO `estudio_mercado` VALUES (1,'Face'),(2,'Publicidad'),(3,'Visual');
/*!40000 ALTER TABLE `estudio_mercado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencia`
--

DROP TABLE IF EXISTS `incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidencia` (
  `ID_Incidencia` int(11) NOT NULL,
  `Tipo_Incidencia_ID_Tipo_Incidencia` int(11) NOT NULL,
  `Fecha_Incidencia` datetime NOT NULL,
  `Descripcion_Incidencia` varchar(100) NOT NULL,
  `Aplica_Producto_Incidencia` char(1) NOT NULL,
  `Factura_Num_Encabezado_Factura` varchar(30) NOT NULL,
  `Encabezado_Factura_ID_Kiosco` varchar(15) NOT NULL,
  `Encabezado_Factura_ID_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`ID_Incidencia`),
  KEY `fk_Incidencia_Tipo_Incidencia1_idx` (`Tipo_Incidencia_ID_Tipo_Incidencia`),
  KEY `fk_Incidencia_Encabezado_Factura1_idx` (`Factura_Num_Encabezado_Factura`,`Encabezado_Factura_ID_Kiosco`,`Encabezado_Factura_ID_Empleado`),
  CONSTRAINT `fk_Incidencia_Tipo_Incidencia1` FOREIGN KEY (`Tipo_Incidencia_ID_Tipo_Incidencia`) REFERENCES `tipo_incidencia` (`ID_Tipo_Incidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_Encabezado_Factura1` FOREIGN KEY (`Factura_Num_Encabezado_Factura`, `Encabezado_Factura_ID_Kiosco`, `Encabezado_Factura_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencia`
--

LOCK TABLES `incidencia` WRITE;
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiosco`
--

DROP TABLE IF EXISTS `kiosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiosco` (
  `ID_Kiosco` varchar(15) NOT NULL,
  `Descripcion_Kiosco` varchar(50) NOT NULL,
  `Telefono_Kiosco` varchar(15) NOT NULL,
  `Horario_Ingreso_Kiosco` time NOT NULL,
  `Horario_Salida_Kiosco` time NOT NULL,
  `Horario_Max_Ingreso_Kiosco` time NOT NULL,
  PRIMARY KEY (`ID_Kiosco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiosco`
--

LOCK TABLES `kiosco` WRITE;
/*!40000 ALTER TABLE `kiosco` DISABLE KEYS */;
INSERT INTO `kiosco` VALUES ('J11-1','Kiosco J11','5460-0923','08:00:00','17:00:00','08:10:00'),('Okla-1','Okland Mall','2777-0000','08:00:00','20:00:00','08:05:00'),('Peri-1','Peri-Rooselvet','2224-2526','08:00:00','20:00:00','08:10:00'),('Pivo-1','Pivote','0000-0000','08:00:00','20:00:00','08:05:00'),('Prad-1','Pradera Z10','1234-5678','08:00:00','20:00:00','08:05:00');
/*!40000 ALTER TABLE `kiosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_detalle_encabezado_factura`
--

DROP TABLE IF EXISTS `linea_detalle_encabezado_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_detalle_encabezado_factura` (
  `Num_Linea_Linea_Detalle_Encabezado_Factura` int(11) NOT NULL,
  `Factura_ID_Detalle_Encabezado_Factura` int(11) NOT NULL,
  `Factura_Encabezado_Factura_Num_Encabezado_Factura` varchar(30) NOT NULL,
  `Factura_Encabezado_Factura_Kiosko_ID_Kiosko` varchar(15) NOT NULL,
  `Factura_Encabezado_Factura_Empleado_ID_Empleado` int(11) NOT NULL,
  `Precio_Unitario_Linea_Detalle_Encabezado_Factura` decimal(8,2) NOT NULL,
  `Comision_Linea_Detalle_Encabezado_Factura` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Num_Linea_Linea_Detalle_Encabezado_Factura`,`Factura_ID_Detalle_Encabezado_Factura`,`Factura_Encabezado_Factura_Num_Encabezado_Factura`,`Factura_Encabezado_Factura_Kiosko_ID_Kiosko`,`Factura_Encabezado_Factura_Empleado_ID_Empleado`),
  KEY `fk_Linea_Detalle_Encabezado_Factura_Detalle_Encabezado_Fact_idx` (`Factura_ID_Detalle_Encabezado_Factura`,`Factura_Encabezado_Factura_Num_Encabezado_Factura`,`Factura_Encabezado_Factura_Kiosko_ID_Kiosko`,`Factura_Encabezado_Factura_Empleado_ID_Empleado`),
  CONSTRAINT `fk_Linea_Detalle_Encabezado_Factura_Detalle_Encabezado_Factura1` FOREIGN KEY (`Factura_ID_Detalle_Encabezado_Factura`, `Factura_Encabezado_Factura_Num_Encabezado_Factura`, `Factura_Encabezado_Factura_Kiosko_ID_Kiosko`, `Factura_Encabezado_Factura_Empleado_ID_Empleado`) REFERENCES `detalle_encabezado_factura` (`ID_Detalle_Encabezado_Factura`, `Num_Encabezado_Factura`, `Factura_Kiosko_ID_Kiosko`, `Factura_Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_detalle_encabezado_factura`
--

LOCK TABLES `linea_detalle_encabezado_factura` WRITE;
/*!40000 ALTER TABLE `linea_detalle_encabezado_factura` DISABLE KEYS */;
INSERT INTO `linea_detalle_encabezado_factura` VALUES (1,1,'J11-1-FA17','J11-1',1,40.00,0.00),(1,1,'J11-1-FA18','J11-1',1,125.00,0.00),(1,1,'J11-1-FA19','J11-1',1,40.00,0.00),(1,2,'J11-1-FA17','J11-1',1,125.00,6.25),(1,2,'J11-1-FA18','J11-1',1,130.00,0.00),(1,2,'J11-1-FA19','J11-1',1,125.00,6.25),(2,2,'J11-1-FA18','J11-1',1,130.00,0.00);
/*!40000 ALTER TABLE `linea_detalle_encabezado_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_detalle_encabezado_ni`
--

DROP TABLE IF EXISTS `linea_detalle_encabezado_ni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_detalle_encabezado_ni` (
  `Detalle_Encabezado_NI_ID_Encabezado_Nota_Ingreso` int(11) NOT NULL,
  `Detalle_Encabezado_NI_Kiosko_ID_Kiosko` varchar(15) NOT NULL,
  `Detalle_Encabezado_NI_Linea_Detalle_Encabezado_NI` int(11) NOT NULL,
  `Producto_Servicio_Cod_Producto_Servicio` varchar(25) NOT NULL,
  `Precio_Unitario_Linea_Detalle_Encabezado_NI` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Detalle_Encabezado_NI_ID_Encabezado_Nota_Ingreso`,`Detalle_Encabezado_NI_Kiosko_ID_Kiosko`,`Detalle_Encabezado_NI_Linea_Detalle_Encabezado_NI`),
  KEY `fk_Linea_Detalle_Encabezado_NI_Producto_Servicio1_idx` (`Producto_Servicio_Cod_Producto_Servicio`),
  CONSTRAINT `fk_Linea_Detalle_Encabezado_NI_Detalle_Encabezado_NI1` FOREIGN KEY (`Detalle_Encabezado_NI_ID_Encabezado_Nota_Ingreso`, `Detalle_Encabezado_NI_Kiosko_ID_Kiosko`, `Detalle_Encabezado_NI_Linea_Detalle_Encabezado_NI`) REFERENCES `detalle_encabezado_ni` (`Encabezado_NI_ID_Encabezado_NI`, `Encabezado_NI_Kiosco_ID_Kiosco`, `Linea_Detalle_Encabezado_NI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_Detalle_Encabezado_NI_Producto_Servicio1` FOREIGN KEY (`Producto_Servicio_Cod_Producto_Servicio`) REFERENCES `producto_servicio` (`Cod_Producto_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_detalle_encabezado_ni`
--

LOCK TABLES `linea_detalle_encabezado_ni` WRITE;
/*!40000 ALTER TABLE `linea_detalle_encabezado_ni` DISABLE KEYS */;
/*!40000 ALTER TABLE `linea_detalle_encabezado_ni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `ID_Menu` int(11) NOT NULL,
  `Nombre_Menu` varchar(45) NOT NULL,
  `Ruta_Menu` varchar(45) NOT NULL,
  `Tiene_Sub_Menu` char(1) NOT NULL,
  `Estado_Menu` char(1) NOT NULL,
  PRIMARY KEY (`ID_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Inicio','Portada.php','0','1'),(2,'Ventas/Compras','#','1','1'),(3,'Catalogo Productos','#','1','1'),(4,'Registro Horarios','#','1','1'),(5,'Administración','#','1','1'),(6,'Contabilidad','#','1','1'),(7,'Cerrar Sesión','PHP/Cerrar_Sesion.php','0','1');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilla`
--

DROP TABLE IF EXISTS `planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planilla` (
  `Empleado_ID_Empleado` int(11) NOT NULL,
  `Fecha_Planilla` datetime NOT NULL,
  `IGSS_Planilla` decimal(8,2) NOT NULL,
  `Irtra_Planilla` decimal(8,2) NOT NULL,
  `Intecap_Planilla` decimal(8,2) NOT NULL,
  `Bonificacion_Planilla` decimal(8,2) NOT NULL,
  `Descuento_Planilla` decimal(8,2) NOT NULL,
  `Comicion_Planilla` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Empleado_ID_Empleado`,`Fecha_Planilla`),
  KEY `fk_Planilla_Empleado1_idx` (`Empleado_ID_Empleado`),
  CONSTRAINT `fk_Planilla_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilla`
--

LOCK TABLES `planilla` WRITE;
/*!40000 ALTER TABLE `planilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_servicio`
--

DROP TABLE IF EXISTS `producto_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_servicio` (
  `Cod_Producto_Servicio` varchar(25) NOT NULL,
  `Tipo_Producto_ID_Tipo_Producto` int(11) NOT NULL,
  `Descripcion_Producto_Servicio` varchar(75) NOT NULL,
  `Precio_Producto_Servicio` decimal(8,2) NOT NULL,
  `Genera_Comision_Producto_Servicio` char(1) NOT NULL,
  `Img_Producto_Servicio` varchar(75) DEFAULT NULL,
  `Domicilio_Producto_Servicio` char(1) NOT NULL,
  PRIMARY KEY (`Cod_Producto_Servicio`),
  KEY `fk_Producto_Servicio_Tipo_Producto1_idx` (`Tipo_Producto_ID_Tipo_Producto`),
  CONSTRAINT `fk_Producto_Servicio_Tipo_Producto1` FOREIGN KEY (`Tipo_Producto_ID_Tipo_Producto`) REFERENCES `tipo_producto` (`ID_Tipo_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_servicio`
--

LOCK TABLES `producto_servicio` WRITE;
/*!40000 ALTER TABLE `producto_servicio` DISABLE KEYS */;
INSERT INTO `producto_servicio` VALUES ('CJA-A',1,'Cerrajeria',125.00,'s','J11.png','s'),('CJA-B',1,'Cerrajeria B',130.00,'s','CerrajeriaB.png','s'),('CM-A',1,'Cerrajeria para Mueble',125.00,'s','Cerrajeriap.png','s'),('LL-A',1,'Llavin tipo A',40.00,'n','no-image.png','n'),('LL-B',1,'Llavin tipo B',42.00,'n','no-image.png','n'),('LL-C',1,'llave C',50.00,'n','J11.png','n');
/*!40000 ALTER TABLE `producto_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Descripcion_Proveedor` varchar(75) NOT NULL,
  `NIT_Proveedor` varchar(15) NOT NULL,
  `Telefono_Proveedor` varchar(15) NOT NULL,
  `Email_Proveedor` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `ID_Rol` int(11) NOT NULL,
  `Descripcion_Rol` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Operador'),(3,'Reporteria'),(4,'Contabilidad');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_menu`
--

DROP TABLE IF EXISTS `rol_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_menu` (
  `ID_Rol_Menu` int(11) NOT NULL,
  `Rol_ID_Rol` int(11) NOT NULL,
  `Sub_Menu_Menu_ID_Menu` int(11) NOT NULL,
  `Sub_Menu_ID_Sub_Menu` int(11) NOT NULL,
  PRIMARY KEY (`ID_Rol_Menu`,`Rol_ID_Rol`,`Sub_Menu_Menu_ID_Menu`,`Sub_Menu_ID_Sub_Menu`),
  KEY `fk_Rol_Menu_Rol1_idx` (`Rol_ID_Rol`),
  KEY `fk_Rol_Menu_Sub_Menu1_idx` (`Sub_Menu_Menu_ID_Menu`,`Sub_Menu_ID_Sub_Menu`),
  CONSTRAINT `fk_Rol_Menu_Rol1` FOREIGN KEY (`Rol_ID_Rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_Menu_Sub_Menu1` FOREIGN KEY (`Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) REFERENCES `sub_menu` (`Menu_ID_Menu`, `ID_Sub_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_menu`
--

LOCK TABLES `rol_menu` WRITE;
/*!40000 ALTER TABLE `rol_menu` DISABLE KEYS */;
INSERT INTO `rol_menu` VALUES (6,1,3,1),(7,1,3,2),(8,1,5,1),(9,1,5,2),(10,1,5,3),(11,1,5,4),(12,1,5,5),(13,1,5,6),(14,1,6,1),(15,1,6,2),(16,1,6,3),(17,1,6,4),(18,1,6,5),(19,1,1,0),(20,1,5,7),(21,1,7,0),(22,1,2,1),(23,1,2,2),(24,1,2,3),(25,1,2,4),(26,1,2,5),(27,1,4,1),(28,1,4,2);
/*!40000 ALTER TABLE `rol_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_menu`
--

DROP TABLE IF EXISTS `sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_menu` (
  `Menu_ID_Menu` int(11) NOT NULL,
  `ID_Sub_Menu` int(11) NOT NULL,
  `Nombre_Sub_Menu` varchar(50) NOT NULL,
  `Ruta_Sub_Menu` varchar(45) NOT NULL,
  `Estado_Sub_Menu` char(1) NOT NULL,
  PRIMARY KEY (`Menu_ID_Menu`,`ID_Sub_Menu`),
  KEY `fk_Sub_Menu_Menu1_idx` (`Menu_ID_Menu`),
  CONSTRAINT `fk_Sub_Menu_Menu1` FOREIGN KEY (`Menu_ID_Menu`) REFERENCES `menu` (`ID_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menu`
--

LOCK TABLES `sub_menu` WRITE;
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;
INSERT INTO `sub_menu` VALUES (1,0,'Portada','#','1'),(2,1,'Venta','Compra_Clientes.php','1'),(2,2,'Devolución','#','1'),(2,3,'Reclamo','#','1'),(2,4,'Nuevo Producto','Solicitud_Clientes.php','1'),(2,5,'Ingreso de Mercaderia','Compra_Proveedores.php','1'),(3,1,'General','#','1'),(3,2,'Filtros','#','1'),(4,1,'Almuerzo','Registro_Almuerzo.php','1'),(4,2,'Salidas Varias','Registro_Salidas.php','1'),(5,1,'Registrar Personal','Registro_Personal.php?STD=i','1'),(5,2,'Registrar Proveedores','Ingreso_Proveedores.php','1'),(5,3,'Registrar Clientes','Ingreso_Clientes.php','1'),(5,4,'Registro Producto','Registro_Producto.php?STD=i','1'),(5,5,'Crear Usuario','Ingreso_Usuarios.php','1'),(5,6,'Reiniciar Contraseña','Reset_Credenciales.php?STD=a','1'),(5,7,'Registrar Kiosko','Registro_Kiosco.php?STD=i','1'),(6,1,'Planilla Salarios','#','1'),(6,2,'Generar Recibos','#','1'),(6,3,'Libro Compra/Venta','#','1'),(6,4,'Planilla IGSS','#','1'),(6,5,'Inventario','#','1'),(7,0,'Salida','#','1');
/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_actividad` (
  `ID_Tipo_Actividad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_Tipo_Actividad` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_actividad`
--

LOCK TABLES `tipo_actividad` WRITE;
/*!40000 ALTER TABLE `tipo_actividad` DISABLE KEYS */;
INSERT INTO `tipo_actividad` VALUES (1,'Ingreso'),(2,'Salida'),(3,'Almuerzo Salida'),(4,'Receso'),(5,'GestiÃÂ³n Bancaria'),(6,'Asistencia Tecnica'),(7,'Almuerzo Regreso');
/*!40000 ALTER TABLE `tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cliente` (
  `ID_Tipo_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_Tipo_Cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` VALUES (1,'Comun'),(2,'VIP');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_incidencia`
--

DROP TABLE IF EXISTS `tipo_incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_incidencia` (
  `ID_Tipo_Incidencia` int(11) NOT NULL,
  `Descripcion_Tipo_Incidencia` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_incidencia`
--

LOCK TABLES `tipo_incidencia` WRITE;
/*!40000 ALTER TABLE `tipo_incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pago` (
  `ID_Tipo_Pago` int(11) NOT NULL,
  `Descripcion_Tipo_Pago` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Efectivo'),(2,'Tarjeta'),(3,'Credito'),(4,'Cheque');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_producto` (
  `ID_Tipo_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_Tipo_Producto` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Llavin');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_transaccion_monetaria`
--

DROP TABLE IF EXISTS `tipo_transaccion_monetaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_transaccion_monetaria` (
  `ID_Tipo_Transaccion_Monetaria` int(11) NOT NULL,
  `Descripcion_Tipo_Transaccion_Monetaria` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Transaccion_Monetaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transaccion_monetaria`
--

LOCK TABLES `tipo_transaccion_monetaria` WRITE;
/*!40000 ALTER TABLE `tipo_transaccion_monetaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_transaccion_monetaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion_monetaria`
--

DROP TABLE IF EXISTS `transaccion_monetaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion_monetaria` (
  `ID_Transaccion_Monetaria` int(11) NOT NULL,
  `Kiosco_ID_Kiosco` varchar(15) NOT NULL,
  `ID_Tipo_Transaccion_Monetaria` int(11) NOT NULL,
  `ID_Concepto_Transaccion_Monetaria` int(11) NOT NULL,
  `Fecha_Transaccion_Monetaria` datetime NOT NULL,
  `Descripcion_Transaccion_Monetaria` varchar(200) DEFAULT NULL,
  `No_Boleta_Transaccion_Monetaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Transaccion_Monetaria`),
  KEY `fk_Transaccion_Monetaria_Tipo_Transaccion_Monetaria1_idx` (`ID_Tipo_Transaccion_Monetaria`),
  KEY `fk_Transaccion_Monetaria_Concepto_Transaccion_Monetaria1_idx` (`ID_Concepto_Transaccion_Monetaria`),
  KEY `fk_Transaccion_Monetaria_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  CONSTRAINT `fk_Transaccion_Monetaria_Tipo_Transaccion_Monetaria1` FOREIGN KEY (`ID_Tipo_Transaccion_Monetaria`) REFERENCES `tipo_transaccion_monetaria` (`ID_Tipo_Transaccion_Monetaria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Monetaria_Concepto_Transaccion_Monetaria1` FOREIGN KEY (`ID_Concepto_Transaccion_Monetaria`) REFERENCES `concepto_transaccion_monetaria` (`ID_Concepto_Transaccion_Monetaria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Monetaria_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_monetaria`
--

LOCK TABLES `transaccion_monetaria` WRITE;
/*!40000 ALTER TABLE `transaccion_monetaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion_monetaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Empleado_ID_Empleado` int(11) NOT NULL,
  `User_Kiosco` varchar(25) NOT NULL,
  `Rol_ID_Rol` int(11) NOT NULL,
  `Pswd_Usuario` blob NOT NULL,
  `Fecha_Alta_Usuario` datetime NOT NULL,
  `Estado_Usuario` char(1) NOT NULL,
  `PassStandar_Usuario` char(1) NOT NULL,
  PRIMARY KEY (`Empleado_ID_Empleado`,`User_Kiosco`),
  KEY `fk_Usuario_Empleado1_idx` (`Empleado_ID_Empleado`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_ID_Rol`),
  CONSTRAINT `fk_Usuario_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_ID_Rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jmazariegos',1,'�m�7�y�f�K�L���','2017-01-06 11:42:30','1','0'),(7,'drodas',2,'ilcÂÂÂCy}QeÂÃ¡|','2017-01-16 18:31:44','1','0');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'copycat'
--

--
-- Dumping routines for database 'copycat'
--
/*!50003 DROP FUNCTION IF EXISTS `Fn_Calcular_Comision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Calcular_Comision`(Cod_Producto VARCHAR(25)) RETURNS decimal(8,2)
BEGIN
	
    DECLARE Genera_Comision CHAR(1);
    DECLARE Total_Comision DECIMAL(8,2);
    DECLARE Precio_Producto DECIMAL(8,2);
    DECLARE comision DECIMAL(8,2) DEFAULT 0.05;
    
    SET Genera_Comision = ( SELECT 
								Genera_Comision_Producto_Servicio 
							FROM 
								producto_servicio 
							WHERE 
								Cod_Producto_Servicio = Cod_Producto);
                                
	IF Genera_Comision = 's' THEN
		
        SET Precio_Producto = (	SELECT 
									Precio_Producto_Servicio 
								FROM 
									producto_servicio 
								WHERE 
									Cod_Producto_Servicio = Cod_Producto);
                                    
		SET Total_Comision = Precio_Producto * comision;
                                    
	ELSE
		SET Total_Comision = 0.00;
    END IF;
    
    RETURN Total_Comision;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_Select_Cant_Anterior` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_Cant_Anterior`(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto VARCHAR(25)) RETURNS int(11)
BEGIN
	DECLARE Cant_Anterior INT;
    
    SET Cant_Anterior = (SELECT 
							Cantidad_Anterior_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
    
    RETURN Cant_Anterior;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_Select_Cant_Existente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_Cant_Existente`(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto VARCHAR(25)) RETURNS int(11)
BEGIN
	DECLARE Cant_Existente INT;
    
    SET Cant_Existente = (SELECT 
							Cantidad_Existente_Detalle_Existencia
						FROM
							detalle_existencia
						WHERE
							Encabezado_Existencia_ID_Encabezado_Existencia = ID_Encabezado_Existencia
						AND
							Producto_Servicio_Cod_Producto_Servicio = Cod_Producto
						ORDER BY ID_Detalle_Existencia DESC LIMIT 1);
    
    RETURN Cant_Existente;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_Select_ID_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_ID_Cliente`(Tipo_Cliente int(11), Nombre_Clientes varchar(50), Direccion_Clientes varchar(30), Nit_Clientes varchar(45), Telefono_Clientes varchar(15), Correo_Clientes varchar(75)) RETURNS int(11)
BEGIN
	DECLARE Existe INT;
    DECLARE ID INT;
    
    SET Existe = (SELECT 
		COUNT(ID_Cliente)
	FROM
		cliente
	WHERE
		Nit_Cliente = Nit_Clientes);
    
    IF Existe >= 1 THEN
		SET ID = (SELECT ID_Cliente FROM cliente WHERE Nit_Cliente = Nit_Clientes);
    ELSE
		CALL Inserta_Cliente(Tipo_Cliente, Nombre_Clientes, Direccion_Clientes, Nit_Clientes, Telefono_Clientes, Correo_Clientes, @IDC);
        SELECT @IDC INTO ID;
    END IF;
    
    RETURN ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_Select_ID_Enc_Existencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_ID_Enc_Existencia`(Kiosco_ID VARCHAR(15)) RETURNS varchar(15) CHARSET utf8
BEGIN
	DECLARE Encabezado VARCHAR(15);
    
    SET Encabezado = (SELECT 
		ID_Encabezado_Existencia
	FROM
		encabezado_existencia
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Existencia DESC
	LIMIT 1);
    
    RETURN Encabezado;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualiza_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualiza_Empleado`(Empleado_ID int(11), ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN
	UPDATE 
		copycat.empleado
	SET
		Kiosco_ID_Kiosco = ID_Kiosco,
		Nombre_Empleado = Nombre_Empleado,
		Apellido_Empleado = Apellido_Empleado,
		DPI_Empleado = DPI_Empleado,
		Telefono_Empleado = Telefono_Empleado,
		Email_Empleado = Email_Empleado,
		Salario_Base_Empleado = Salario_Base
	WHERE 
		ID_Empleado = Empleado_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualiza_Kiosco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualiza_Kiosco`(Kiosco_ID VARCHAR(15), Descripcion VARCHAR(50), Telefono varchar(15), Horario_Ingreso TIME, Horario_Salida TIME, Horario_Max TIME)
BEGIN
	UPDATE 
		copycat.kiosco
	SET
		Descripcion_Kiosco = Descripcion,
		Telefono_Kiosco = Telefono,
		Horario_Ingreso_Kiosco = Horario_Ingreso,
		Horario_Salida_Kiosco = Horario_Salida,
		Horario_Max_Ingreso_Kiosco = Horario_Max
	WHERE 
		ID_Kiosco = Kiosco_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualiza_PASS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualiza_PASS`(ID_Empleado INT, NuevoPass VARCHAR(25), Llave VARCHAR(5))
BEGIN
	
    UPDATE usuario SET Pswd_Usuario = AES_ENCRYPT(NuevoPass,Llave) WHERE Empleado_ID_Empleado = ID_Empleado;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Actividad_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Actividad_Empleado`(Tipo_Actividad INT, Empleado_ID INT, Justificacion VARCHAR(50))
BEGIN

	INSERT INTO copycat.actividad_empleado
				(Fecha_Actividad, Tipo_Actividad_ID_Tipo_Actividad, Empleado_ID_Empleado, Justificacion_Actividad_Empleado)
	VALUES
				(NOW(),Tipo_Actividad,Empleado_ID, Justificacion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Atencion_Kiosco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Atencion_Kiosco`(Fecha DATETIME, Kiosco_ID VARCHAR(15), Empleado_ID INT)
BEGIN

	INSERT INTO copycat.atencion_kiosco
				(Fecha_Atencion_Kiosco, Kiosco_ID_Kiosco, Empleado_ID_Empleado)
	VALUES
				(Fecha,Kiosco_ID,Empleado_ID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Cliente`(Tipo_Cliente int(11), Nombre_Clientes varchar(50), Direccion_Clientes varchar(30), Nit_Clientes varchar(45), Telefono_Clientes varchar(15), Correo_Clientes varchar(75), OUT ID_Clientes INT)
BEGIN
	DECLARE ID INT DEFAULT 0;
	INSERT INTO cliente
			   (Tipo_Cliente_ID_Tipo_Cliente, 
                Nombre_Cliente, 
                Direccion_Cliente, 
                Nit_Cliente, 
                Telefono_Cliente, 
                Correo_Cliente)
    VALUES 	   (Tipo_Cliente,
                Nombre_Clientes,
                Direccion_Clientes,
                Nit_Clientes,
                Telefono_Clientes,
                Correo_Clientes);

	SET ID_Clientes = LAST_INSERT_ID();
    SELECT ID_Clientes INTO ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Det_Existencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Det_Existencia`(Kiosco_ID VARCHAR(15), Cod_Producto VARCHAR(25), Cantidad_Movimiento INT, Tipo_Movimiento CHAR(1))
BEGIN
	
    DECLARE ID_Encabezado_Existencia VARCHAR(15);
    DECLARE ID_Detalle_Existencia INT DEFAULT 0;
    DECLARE Existe INT DEFAULT 0;
    DECLARE Cant_Anterior INT DEFAULT 0;
    DECLARE Cant_Existente INT DEFAULT 0;
    DECLARE Cant_Ins_Existencia INT DEFAULT 0;
    
    SET ID_Encabezado_Existencia = (SELECT Fn_Select_ID_Enc_Existencia(Kiosco_ID));
    SET Existe = (SELECT 
						COUNT(ID_Detalle_Existencia) ID
				  FROM
						detalle_existencia
				  WHERE
						Encabezado_Existencia_id_Encabezado_Existencia = ID_Encabezado_Existencia);
	
    IF Existe >= 1 THEN
		SET ID_Detalle_Existencia = Existe + 1;
	ELSE
		SET ID_Detalle_Existencia = 0;
	END IF;
    
    SET Cant_Anterior = (SELECT Fn_Select_Cant_Anterior(ID_Encabezado_Existencia,Cod_Producto));
                        
	SET Cant_Existente = (SELECT Fn_Select_Cant_Existente(ID_Encabezado_Existencia,Cod_Producto));
    
    IF Tipo_Movimiento = 'u' THEN
		SET Cant_Ins_Existencia = Cant_Existente + Cantidad_Movimiento;
    ELSE
		SET Cant_Ins_Existencia = Cant_Existente - Cantidad_Movimiento;
    END IF;
    
    INSERT INTO copycat.detalle_existencia
				(ID_Detalle_Existencia,
				Encabezado_Existencia_ID_Encabezado_Existencia,
				Encabezado_Existencia_Kiosco_ID_Kiosco,
				Producto_Servicio_Cod_Producto_Servicio,
				Cantidad_Anterior_Detalle_Existencia,
				Cantidad_Existente_Detalle_Existencia,
				Tipo_Mov_Detalle_Existencia)
	VALUES
				(ID_Detalle_Existencia,
                 ID_Encabezado_Existencia,
                 Kiosco_ID,
                 Cod_Producto,
                 Cant_Existente,
                 Cant_Ins_Existencia,
                 Tipo_Movimiento);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Det_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Det_Factura`(Num_Encabezado VARCHAR(30), ID_Kiosco VARCHAR(15), Empleado_ID INT, Cod_Producto VARCHAR(25), Cantidad INT, Total_Detalle DECIMAL(8,2), Precio_Unit DECIMAL(8,2))
BEGIN
	
    DECLARE Existe INT DEFAULT 0;
    DECLARE Num_Detalle INT DEFAULT 0;
    DECLARE Comision DECIMAL(8,2) DEFAULT 0.00;
    DECLARE i INT;
    
    SET Existe = (SELECT 
					COUNT(ID_Detalle_Encabezado_Factura) Registros 
				  FROM 
					detalle_encabezado_factura 
				  WHERE 
					Num_Encabezado_Factura = Num_Encabezado);
                    
	IF Existe = 0 THEN
		SET Num_Detalle = 1;
	ELSE
		SET Num_Detalle = Existe + 1;
    END IF;
    
    INSERT INTO detalle_encabezado_factura
				(ID_Detalle_Encabezado_Factura,
				Num_Encabezado_Factura,
				Factura_Kiosko_ID_Kiosko,
				Factura_Empleado_ID_Empleado,
				Producto_Servicio_Cod_Producto_Servicio,
				Cantidad_Producto_Detalle_Encabezado_Factura,
				Total_Detalle_Encabezado_Factura)
	VALUES
				(Num_Detalle,
                 Num_Encabezado,
                 ID_Kiosco,
                 Empleado_ID,
                 Cod_Producto,
                 Cantidad,
                 Total_Detalle);
    
    SET i = 1;
    WHILE i <= Cantidad DO
		
		SET Comision = (SELECT Fn_Calcular_Comision(Cod_Producto) Comision);
        
        INSERT INTO copycat.linea_detalle_encabezado_factura
				(Num_Linea_Linea_Detalle_Encabezado_Factura,
				Factura_ID_Detalle_Encabezado_Factura,
				Factura_Encabezado_Factura_Num_Encabezado_Factura,
				Factura_Encabezado_Factura_Kiosko_ID_Kiosko,
				Factura_Encabezado_Factura_Empleado_ID_Empleado,
				Precio_Unitario_Linea_Detalle_Encabezado_Factura,
				Comision_Linea_Detalle_Encabezado_Factura)
		VALUES
				(i,
                 Num_Detalle,
                 Num_Encabezado,
                 ID_Kiosco,
                 Empleado_ID,
                 Precio_Unit,
                 Comision
				);
		SET i = i + 1;
        
    END WHILE;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Empleado`(ID_Kiosco varchar(15), Nombre_Empleado varchar(50), Apellido_Empleado varchar(50), DPI_Empleado varchar(45), Telefono_Empleado varchar(50), Email_Empleado varchar(75), Salario_Base decimal(8,2))
BEGIN

	INSERT INTO empleado(Kiosco_ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base_Empleado)
    VALUES (ID_Kiosco, Nombre_Empleado, Apellido_Empleado, DPI_Empleado, Telefono_Empleado, Email_Empleado, Salario_Base);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Enc_Existencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Enc_Existencia`(Kiosco_ID_Kioscos VARCHAR(15), Fecha_Encabezado_Existencias DATETIME)
BEGIN

DECLARE Existe INT DEFAULT 0;
DECLARE Encabezado_ID VARCHAR(10) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;

SET Existe = (SELECT 
				count(ID_Encabezado_Existencia) Cantidad 
			  FROM encabezado_existencia 
              WHERE Kiosco_ID_Kiosco = Kiosco_ID_Kioscos 
              AND Fecha_Encabezado_Existencia = Fecha_Encabezado_Existencias);

IF Existe = 0 THEN

    SET ID_Nuevo = (SELECT 
						count(ID_Encabezado_Existencia) Registros 
					FROM encabezado_existencia 
                    WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kioscos,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-E',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-E','1');
    END IF;

	INSERT INTO copycat.encabezado_existencia(ID_Encabezado_Existencia,	Kiosco_ID_Kiosco, Fecha_Encabezado_Existencia)
	VALUES(Encabezado_ID, Kiosco_ID_Kioscos, Fecha_Encabezado_Existencias);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Enc_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Enc_Factura`(Kiosco_ID_Kioscos VARCHAR(15), ID_Empleado INT, Tipo_Pago INT, ID_Cliente INT, Num_Factura VARCHAR(30), Estudio INT, Descuento DECIMAL(8,2), Total DECIMAL(8,2))
BEGIN

DECLARE Encabezado_ID VARCHAR(30) DEFAULT '';
DECLARE ID_Nuevo INT DEFAULT 0;
DECLARE Fecha_Fact DATETIME DEFAULT NOW();

    SET ID_Nuevo = (SELECT 
						count(Num_Encabezado_Factura) Registros 
					FROM Encabezado_Factura 
                    WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kioscos,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-FA',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kioscos, '-FA','1');
    END IF;

	INSERT INTO copycat.encabezado_factura
				(Num_Encabezado_Factura,
				Kiosco_ID_Kiosco,
				Empleado_ID_Empleado,
				Tipo_Pago_ID_Tipo_Pago,
				Cliente_ID_Cliente,
				Fecha_Encabezado_Factura,
				Num_Factura_Encabezado_Factura,
                Estudio_Mercado_ID_Estudio_Mercado,
                Descuento_Encabezado_Factura,
                Total_Venta_Encabezado_Factura)
	VALUES
				(Encabezado_ID,
                 Kiosco_ID_Kioscos,
                 ID_Empleado,
                 Tipo_Pago,
                 ID_Cliente,
                 Fecha_Fact,
                 Num_Factura,
                 Estudio,
                 Descuento,
                 Total);

	SELECT 
		Num_Encabezado_Factura 
    FROM 
		encabezado_factura 
    WHERE 
		Kiosco_ID_Kiosco = Kiosco_ID_Kioscos 
    AND 
		Fecha_Encabezado_Factura = Fecha_Fact;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Estudio_Mercado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Estudio_Mercado`(Descripcion_Estudio varchar(50))
BEGIN

	INSERT INTO copycat.estudio_mercado
				(Detalle_Estudio_Mercado)
	VALUES
				(Descripcion_Estudio);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Kiosco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Kiosco`(Descripcion VARCHAR(50), Telefono varchar(15), Horario_Ingreso TIME, Horario_Salida TIME, Horario_Max TIME)
BEGIN

DECLARE Kiosco_ID VARCHAR(10);
DECLARE ID_Nuevo INT DEFAULT 0;

	SET Kiosco_ID = SUBSTRING(Descripcion,1,4);
    SET ID_Nuevo = (SELECT count(ID_Kiosco) Registros FROM Kiosco WHERE ID_Kiosco LIKE CONCAT(Kiosco_ID,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Kiosco_ID = CONCAT(Kiosco_ID, '-',ID_Nuevo);
    ELSE
		SET Kiosco_ID = CONCAT(Kiosco_ID, '-','1');
    END IF;

	INSERT INTO Kiosco(ID_Kiosco, Descripcion_Kiosco, Telefono_Kiosco, Horario_Ingreso_Kiosco, Horario_Salida_Kiosco, Horario_Max_Ingreso_Kiosco)
    VALUES (Kiosco_ID, Descripcion, Telefono, Horario_Ingreso, Horario_Salida, Horario_Max);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Producto_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Producto_Servicio`(ID_Producto VARCHAR(25), Tipo_Producto_ID_Tipo_Producto int(11), Descripcion_Producto_Servicio varchar(75), Precio_Producto_Servicio decimal(8,2), Genera_Comision_Producto_Servicio char(1), Img_Producto_Servicio varchar(75), Domicilio_Producto_Servicio char(1))
BEGIN

DECLARE ID_Nuevo INT DEFAULT 0;

	INSERT INTO copycat.producto_servicio
			(Cod_Producto_Servicio, 
			 Tipo_Producto_ID_Tipo_Producto, 
			 Descripcion_Producto_Servicio, 
			 Precio_Producto_Servicio,
			 Genera_Comision_Producto_Servicio,
			 Img_Producto_Servicio,
			 Domicilio_Producto_Servicio)
	VALUES
			(ID_Producto, 
			Tipo_Producto_ID_Tipo_Producto, 
			Descripcion_Producto_Servicio, 
			Precio_Producto_Servicio, 
			Genera_Comision_Producto_Servicio, 
			Img_Producto_Servicio, 
			Domicilio_Producto_Servicio);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Tipo_Actividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Tipo_Actividad`(Descripcion_Tipo_Actividad VARCHAR(50))
BEGIN

	INSERT INTO copycat.tipo_actividad
			(Descripcion_Tipo_Actividad)
	VALUES
			(Descripcion_Tipo_Actividad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Tipo_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Tipo_Cliente`(Descripcion_Tipo_Cliente varchar(50))
BEGIN

	INSERT INTO tipo_actividad(Descripcion_Tipo_Cliente)
    VALUES(Descripcion_Tipo_Cliente);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Tipo_Pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Tipo_Pago`(Descripcion_Tipo_Pago varchar(50))
BEGIN

	INSERT INTO tipo_actividad(Descripcion_Tipo_Pago)
    VALUES(Descripcion_Tipo_Pago);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_Tipo_Producto_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Tipo_Producto_Servicio`(Descripcion_Tipo_Producto_Servicio varchar(30))
BEGIN

	INSERT INTO copycat.tipo_producto
			(Descripcion_Tipo_Producto)
	VALUES
			(Descripcion_Tipo_Producto_Servicio);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserta_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_User`(Rol INT, Nombre VARCHAR(50), Apellido VARCHAR(50))
BEGIN
	
    DECLARE user VARCHAR(25);
    DECLARE pass VARCHAR(20);
    DECLARE Empleado_ID INT;
    
	SET user = (SELECT CONCAT(LOWER(SUBSTRING(Nombre,1,1)),LOWER(SUBSTRING(REPLACE(Apellido,' ',''),1,10))));
    SET pass = CONCAT(user,'123');
    SET Empleado_ID = (SELECT MAX(ID_Empleado) AS id FROM empleado);
    
    INSERT INTO copycat.usuario
				(Empleado_ID_Empleado,
				User_Kiosco,
				Rol_ID_Rol,
				Pswd_Usuario,
				Fecha_Alta_Usuario,
				Estado_Usuario,
                PassStandar_Usuario)
	VALUES
			    (Empleado_ID, user, Rol, AES_ENCRYPT(pass,'11'), now(),'1','1');

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_All_Kiosco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_All_Kiosco`()
BEGIN
	SELECT * FROM Kiosco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_ID_Enc_Existencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_ID_Enc_Existencia`(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT 
		ID_Encabezado_Existencia
	FROM
		encabezado_existencia
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Existencia DESC
	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_ID_Kiosco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_ID_Kiosco`(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT * FROM Kiosco WHERE ID_Kiosco = Kiosco_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_Info_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_Info_Cliente`(Nit_Clientes VARCHAR(45))
BEGIN
	SELECT 
		ID_Cliente, Nombre_Cliente, Direccion_Cliente, Nit_Cliente, Telefono_Cliente, Correo_Cliente 
	FROM 
		cliente
	WHERE Nit_Cliente = Nit_Clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_Info_Enc_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_Info_Enc_Factura`(Kiosco_ID VARCHAR(15))
BEGIN
	SELECT 
		Num_Encabezado_Factura
	FROM
		encabezado_factura
	WHERE
		Kiosco_ID_Kiosco = Kiosco_ID
	ORDER BY Fecha_Encabezado_Factura DESC
	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_ProdServ_Descripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_ProdServ_Descripcion`(Descripcion_Prod varchar(75))
BEGIN

	SELECT * FROM producto_servicio
    WHERE Descripcion_Producto_Servicio = Descripcion_Prod;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Select_ProdServ_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_ProdServ_ID`(ID_Prod VARCHAR(25))
BEGIN

	SELECT * FROM producto_servicio
    WHERE Cod_Producto_Servicio = ID_Prod;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-08 15:45:12
