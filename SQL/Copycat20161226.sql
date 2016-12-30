create database copycat;
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
  PRIMARY KEY (`Kiosco_ID_Kiosco`,`Empleado_ID_Empleado`),
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
/*!40000 ALTER TABLE `atencion_kiosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Tipo_Cliente_ID_Tipo_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(50) NOT NULL,
  `Direccion_Cliente` varchar(30) NOT NULL,
  `Nit_Cliente` varchar(45) NOT NULL,
  `Telefono_Cliente` varchar(15) NOT NULL,
  `Correo_Cliente` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `fk_Cliente_Tipo_Cliente1_idx` (`Tipo_Cliente_ID_Tipo_Cliente`),
  CONSTRAINT `fk_Cliente_Tipo_Cliente1` FOREIGN KEY (`Tipo_Cliente_ID_Tipo_Cliente`) REFERENCES `tipo_cliente` (`ID_Tipo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
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
  `Producto_Servicio_Cod_Producto_Servicio` int(11) NOT NULL,
  `Cantidad_Producto_Detalle_Encabezado_Factura` int(11) NOT NULL,
  `Total_Detalle_Encabezado_Factura` decimal(8,2) NOT NULL,
  `Estudio_Mercado_ID_Estudio_Mercado` int(11) NOT NULL,
  PRIMARY KEY (`ID_Detalle_Encabezado_Factura`,`Num_Encabezado_Factura`,`Factura_Kiosko_ID_Kiosko`,`Factura_Empleado_ID_Empleado`),
  KEY `fk_Detalle_Encabezado_Factura_Producto_Servicio1_idx` (`Producto_Servicio_Cod_Producto_Servicio`),
  KEY `fk_Detalle_Encabezado_Factura_Encabezado_Factura1_idx` (`Num_Encabezado_Factura`,`Factura_Kiosko_ID_Kiosko`,`Factura_Empleado_ID_Empleado`),
  KEY `fk_Detalle_Encabezado_Factura_Estudio_Mercado1_idx` (`Estudio_Mercado_ID_Estudio_Mercado`),
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Producto_Servicio1` FOREIGN KEY (`Producto_Servicio_Cod_Producto_Servicio`) REFERENCES `producto_servicio` (`Cod_Producto_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Encabezado_Factura1` FOREIGN KEY (`Num_Encabezado_Factura`, `Factura_Kiosko_ID_Kiosko`, `Factura_Empleado_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Estudio_Mercado1` FOREIGN KEY (`Estudio_Mercado_ID_Estudio_Mercado`) REFERENCES `estudio_mercado` (`ID_Estudio_Mercado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_encabezado_factura`
--

LOCK TABLES `detalle_encabezado_factura` WRITE;
/*!40000 ALTER TABLE `detalle_encabezado_factura` DISABLE KEYS */;
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
  `Producto_Servicio_Cod_Producto_Servicio` int(11) NOT NULL,
  `Cantidad_Anterior_Detalle_Existencia` int(11) NOT NULL,
  `Cantidad_Existente_Detalle_Existenciacol` int(11) NOT NULL,
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
  `ID_Empleado` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'J11-1','Jearson','Mazariegos','2606-79674-0101','5460-0923','jearson.developer11@gmail.com',2750.00);
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
  PRIMARY KEY (`Num_Encabezado_Factura`,`Kiosco_ID_Kiosco`,`Empleado_ID_Empleado`),
  KEY `fk_Encabezado_Factura_Tipo_Pago1_idx` (`Tipo_Pago_ID_Tipo_Pago`),
  KEY `fk_Encabezado_Factura_Cliente1_idx` (`Cliente_ID_Cliente`),
  KEY `fk_Encabezado_Factura_Kiosko1_idx` (`Kiosco_ID_Kiosco`),
  KEY `fk_Encabezado_Factura_Empleado1_idx` (`Empleado_ID_Empleado`),
  CONSTRAINT `fk_Encabezado_Factura_Tipo_Pago1` FOREIGN KEY (`Tipo_Pago_ID_Tipo_Pago`) REFERENCES `tipo_pago` (`ID_Tipo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Cliente1` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encabezado_factura`
--

LOCK TABLES `encabezado_factura` WRITE;
/*!40000 ALTER TABLE `encabezado_factura` DISABLE KEYS */;
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
  `ID_Estudio_Mercado` int(11) NOT NULL,
  `Detalle_Estudio_Mercado` varchar(4) NOT NULL,
  PRIMARY KEY (`ID_Estudio_Mercado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio_mercado`
--

LOCK TABLES `estudio_mercado` WRITE;
/*!40000 ALTER TABLE `estudio_mercado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudio_mercado` ENABLE KEYS */;
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
INSERT INTO `kiosco` VALUES ('J11-1','Kiosco J11','5460-0923','08:00:00','17:00:00','08:05:00');
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
  `Producto_Servicio_Cod_Producto_Servicio` int(11) NOT NULL,
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
INSERT INTO `menu` VALUES (1,'Inicio','Portada.php','0','1'),(2,'Ventas/Compras','#','1','1'),(3,'Catalogo Productos','#','1','1'),(4,'Registro Horarios','#','1','1'),(5,'AdministraciÃ³n','#','1','1'),(6,'Contabilidad','#','1','1'),(7,'Cerrar SesiÃ³n','Cerrar_Sesion.php','0','1');
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
  `Cod_Producto_Servicio` int(11) NOT NULL,
  `Tipo_Producto_ID_Tipo_Producto` int(11) NOT NULL,
  `Descripcion_Producto_Servicio` varchar(75) NOT NULL,
  `Precio_Producto_Servicio` decimal(8,2) NOT NULL,
  `Genera_Comision_Producto_Servicio` char(1) NOT NULL,
  `Img_Producto_Servicio` varchar(75) DEFAULT NULL,
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
  CONSTRAINT `fk_Rol_Menu_Rol1` FOREIGN KEY (`Rol_ID_Rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Rol_Menu_Sub_Menu1` FOREIGN KEY (`Sub_Menu_Menu_ID_Menu`, `Sub_Menu_ID_Sub_Menu`) REFERENCES `sub_menu` (`Menu_ID_Menu`, `ID_Sub_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_menu`
--

LOCK TABLES `rol_menu` WRITE;
/*!40000 ALTER TABLE `rol_menu` DISABLE KEYS */;
INSERT INTO `rol_menu` VALUES (1,1,2,1),(2,1,2,2),(3,1,2,3),(4,1,2,4),(5,1,2,5),(6,1,3,1),(7,1,3,2),(8,1,5,1),(9,1,5,2),(10,1,5,3),(11,1,5,4),(12,1,5,5),(13,1,5,6),(14,1,6,1),(15,1,6,2),(16,1,6,3),(17,1,6,4),(18,1,6,5),(19,1,1,0),(20,1,7,0);
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
INSERT INTO `sub_menu` VALUES (1,0,'Portada','#','1'),(2,1,'Venta','Compra_Clientes.php','1'),(2,2,'DevoluciÃ³n','#','1'),(2,3,'Reclamo','#','1'),(2,4,'Nuevo Producto','Solicitud_Clientes.php','1'),(2,5,'Ingreso de Mercaderia','Compra_Proveedores.php','1'),(3,1,'General','#','1'),(3,2,'Filtros','#','1'),(4,1,'Almuerzo','Registro_Almuerzo.php','1'),(4,2,'Salidas Varias','Registro_Salidas.php','1'),(5,1,'Registrar Personal','Registro_Personal.php','1'),(5,2,'Registrar Proveedores','Ingreso_Proveedores.php','1'),(5,3,'Registrar Clientes','Ingreso_Clientes.php','1'),(5,4,'Registro Producto','Registro_Producto.php','1'),(5,5,'Crear Usuario','Ingreso_Usuarios.php','1'),(5,6,'Reiniciar ContraseÃ±a','#','1'),(6,1,'Planilla Salarios','#','1'),(6,2,'Generar Recibos','#','1'),(6,3,'Libro Compra/Venta','#','1'),(6,4,'Planilla IGSS','#','1'),(6,5,'Inventario','#','1'),(7,0,'Salida','#','1');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_actividad`
--

LOCK TABLES `tipo_actividad` WRITE;
/*!40000 ALTER TABLE `tipo_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cliente` (
  `ID_Tipo_Cliente` int(11) NOT NULL,
  `Descripcion_Tipo_Cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
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
INSERT INTO `usuario` VALUES (1,'jmazariegos',1,'ÖmÌ7èyf»KßLÈüí','2016-12-26 17:00:50','1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-26 18:50:38
