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
  CONSTRAINT `fk_Actividad_Empleado_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Empleado_Tipo_Actividad` FOREIGN KEY (`Tipo_Actividad_ID_Tipo_Actividad`) REFERENCES `tipo_actividad` (`ID_Tipo_Actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Cubierto_Kiosco_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cubierto_Kiosco_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Encabezado_Factura1` FOREIGN KEY (`Num_Encabezado_Factura`, `Factura_Kiosko_ID_Kiosko`, `Factura_Empleado_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Estudio_Mercado1` FOREIGN KEY (`Estudio_Mercado_ID_Estudio_Mercado`) REFERENCES `estudio_mercado` (`ID_Estudio_Mercado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_Factura_Producto_Servicio1` FOREIGN KEY (`Producto_Servicio_Cod_Producto_Servicio`) REFERENCES `producto_servicio` (`Cod_Producto_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Detalle_Encabezado_NI_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Encabezado_NI_Encabezado_Nota_Ingreso1` FOREIGN KEY (`Encabezado_NI_ID_Encabezado_NI`, `Encabezado_NI_Kiosco_ID_Kiosco`) REFERENCES `encabezado_nota_ingreso` (`ID_Encabezado_Nota_Ingreso`, `Kiosco_ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Encabezado_Factura_Cliente1` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Empleado1` FOREIGN KEY (`Empleado_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Factura_Tipo_Pago1` FOREIGN KEY (`Tipo_Pago_ID_Tipo_Pago`) REFERENCES `tipo_pago` (`ID_Tipo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Encabezado_Nota_Ingreso_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encabezado_Nota_Ingreso_Proveedor1` FOREIGN KEY (`Proveedor_ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Incidencia_Encabezado_Factura1` FOREIGN KEY (`Factura_Num_Encabezado_Factura`, `Encabezado_Factura_ID_Kiosco`, `Encabezado_Factura_ID_Empleado`) REFERENCES `encabezado_factura` (`Num_Encabezado_Factura`, `Kiosco_ID_Kiosco`, `Empleado_ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_Tipo_Incidencia1` FOREIGN KEY (`Tipo_Incidencia_ID_Tipo_Incidencia`) REFERENCES `tipo_incidencia` (`ID_Tipo_Incidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Domicilio_Producto_Servicio` char(1) NOT NULL,
  PRIMARY KEY (`Cod_Producto_Servicio`),
  KEY `fk_Producto_Servicio_Tipo_Producto1_idx` (`Tipo_Producto_ID_Tipo_Producto`),
  CONSTRAINT `fk_Producto_Servicio_Tipo_Producto1` FOREIGN KEY (`Tipo_Producto_ID_Tipo_Producto`) REFERENCES `tipo_producto` (`ID_Tipo_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_actividad` (
  `ID_Tipo_Actividad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_Tipo_Actividad` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_Transaccion_Monetaria_Concepto_Transaccion_Monetaria1` FOREIGN KEY (`ID_Concepto_Transaccion_Monetaria`) REFERENCES `concepto_transaccion_monetaria` (`ID_Concepto_Transaccion_Monetaria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Monetaria_Kiosko1` FOREIGN KEY (`Kiosco_ID_Kiosco`) REFERENCES `kiosco` (`ID_Kiosco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Monetaria_Tipo_Transaccion_Monetaria1` FOREIGN KEY (`ID_Tipo_Transaccion_Monetaria`) REFERENCES `tipo_transaccion_monetaria` (`ID_Tipo_Transaccion_Monetaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Dumping events for database 'copycat'
--

--
-- Dumping routines for database 'copycat'
--
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
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_Cant_Anterior`(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto INT) RETURNS int(11)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Select_Cant_Existente`(ID_Encabezado_Existencia VARCHAR(15), Cod_Producto INT) RETURNS int(11)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Det_Existencia`(Kiosco_ID VARCHAR(15), Cod_Producto INT, Cantidad_Movimiento INT, Tipo_Movimiento CHAR(1))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Enc_Existencia`(Kiosco_ID_Kiosco VARCHAR(15), Fecha_Encabezado_Existensia DATETIME)
BEGIN

DECLARE Existe INT DEFAULT 0;
DECLARE Encabezado_ID VARCHAR(10);
DECLARE ID_Nuevo INT DEFAULT 0;

SET Existe = (SELECT count(ID_Encabezado_Existencia) Cantidad FROM encabezado_existencia WHERE Kiosco_ID_Kiosco = Kiosco_ID_Kiosco AND Fecha_Encabezado_Existencia = Fecha_Encabezado_Existensia);

IF Existe = 0 THEN

    SET ID_Nuevo = (SELECT count(ID_Encabezado_Existencia) Registros FROM encabezado_existencia WHERE Kiosco_ID_Kiosco LIKE CONCAT(Kiosco_ID_Kiosco,'%'));
    
    IF ID_Nuevo >= 1 THEN
		SET ID_Nuevo = ID_Nuevo + 1;
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kiosco, '-E',ID_Nuevo);
    ELSE
		SET Encabezado_ID = CONCAT(Kiosco_ID_Kiosco, '-E','1');
    END IF;

	INSERT INTO copycat.encabezado_existencia(ID_Encabezado_Existencia,	Kiosco_ID_Kiosco, Fecha_Encabezado_Existencia)
	VALUES(Encabezado_ID, Kiosco_ID_Kiosco, Fecha_Encabezado_Existensia);
END IF;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserta_Producto_Servicio`(Tipo_Producto_ID_Tipo_Producto int(11), Descripcion_Producto_Servicio varchar(75), Precio_Producto_Servicio decimal(8,2), Genera_Comision_Producto_Servicio char(1), Img_Producto_Servicio varchar(75), Domicilio_Producto_Servicio char(1))
BEGIN

DECLARE ID_Nuevo INT DEFAULT 0;

    SET ID_Nuevo = (SELECT count(Cod_Producto_Servicio) Registros FROM producto_servicio);
    
    SET ID_Nuevo = ID_Nuevo + 1;

	INSERT INTO copycat.producto_servicio
			(Cod_Producto_Servicio, 
			 Tipo_Producto_ID_Tipo_Producto, 
			 Descripcion_Producto_Servicio, 
			 Precio_Producto_Servicio,
			 Genera_Comision_Producto_Servicio,
			 Img_Producto_Servicio,
			 Domicilio_Producto_Servicio)
	VALUES
			(ID_Nuevo, 
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-12 18:53:58
