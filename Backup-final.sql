CREATE DATABASE  IF NOT EXISTS `Inventario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Inventario`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: Inventario
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ARTICULO`
--

DROP TABLE IF EXISTS `ARTICULO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARTICULO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FK_PROVEEDOR` int NOT NULL,
  `CODIGO` int NOT NULL,
  `DESCR` varchar(100) DEFAULT NULL,
  `COSTO` decimal(10,2) NOT NULL,
  `EXISTENCIA` int NOT NULL,
  `FK_CATEGORIA` int NOT NULL,
  `FK_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PROVEEDOR` (`FK_PROVEEDOR`),
  KEY `FK_CATEGORIA` (`FK_CATEGORIA`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  CONSTRAINT `ARTICULO_ibfk_1` FOREIGN KEY (`FK_PROVEEDOR`) REFERENCES `PROVEEDOR` (`ID`),
  CONSTRAINT `ARTICULO_ibfk_2` FOREIGN KEY (`FK_CATEGORIA`) REFERENCES `CATEGORIA` (`ID`),
  CONSTRAINT `ARTICULO_ibfk_3` FOREIGN KEY (`FK_USUARIO`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTICULO`
--

LOCK TABLES `ARTICULO` WRITE;
/*!40000 ALTER TABLE `ARTICULO` DISABLE KEYS */;
INSERT INTO `ARTICULO` VALUES (1,2,10,'Gabinete para PC chica',1200.00,1,2,3),(2,1,11,'Teclado con conexion USB C',200.00,0,1,2);
/*!40000 ALTER TABLE `ARTICULO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PRECIO` decimal(10,2) NOT NULL,
  `DESCR` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,120.50,'Teclado mecanico'),(2,770.00,'Gabinete para PC');
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENTRADA`
--

DROP TABLE IF EXISTS `ENTRADA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENTRADA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FK_USUARIO` int NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  CONSTRAINT `ENTRADA_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTRADA`
--

LOCK TABLES `ENTRADA` WRITE;
/*!40000 ALTER TABLE `ENTRADA` DISABLE KEYS */;
INSERT INTO `ENTRADA` VALUES (1,1,'2022-12-20 14:05:39'),(2,3,'2022-12-22 19:05:39');
/*!40000 ALTER TABLE `ENTRADA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOG_USUARIO`
--

DROP TABLE IF EXISTS `LOG_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOG_USUARIO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG_USUARIO`
--

LOCK TABLES `LOG_USUARIO` WRITE;
/*!40000 ALTER TABLE `LOG_USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOG_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVEEDOR`
--

DROP TABLE IF EXISTS `PROVEEDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROVEEDOR` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `RFC` varchar(10) DEFAULT NULL,
  `FK_UBI` int NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TEL` varchar(12) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_UBI` (`FK_UBI`),
  CONSTRAINT `PROVEEDOR_ibfk_1` FOREIGN KEY (`FK_UBI`) REFERENCES `UBICACION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVEEDOR`
--

LOCK TABLES `PROVEEDOR` WRITE;
/*!40000 ALTER TABLE `PROVEEDOR` DISABLE KEYS */;
INSERT INTO `PROVEEDOR` VALUES (1,'27PC','AAA129DA90',1,'27PC@correo.com','332244556688'),(2,'ArmaPC','AAA129CF90',2,'ArmaPC@correo.com','307046544633');
/*!40000 ALTER TABLE `PROVEEDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALIDA`
--

DROP TABLE IF EXISTS `SALIDA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALIDA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FK_USUARIO` int NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  CONSTRAINT `SALIDA_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALIDA`
--

LOCK TABLES `SALIDA` WRITE;
/*!40000 ALTER TABLE `SALIDA` DISABLE KEYS */;
INSERT INTO `SALIDA` VALUES (1,1,'2022-12-25 10:01:19'),(2,3,'2022-12-26 12:15:59');
/*!40000 ALTER TABLE `SALIDA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UBICACION`
--

DROP TABLE IF EXISTS `UBICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UBICACION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CALLE` varchar(50) NOT NULL,
  `COLONIA` varchar(50) DEFAULT NULL,
  `NUM` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UBICACION`
--

LOCK TABLES `UBICACION` WRITE;
/*!40000 ALTER TABLE `UBICACION` DISABLE KEYS */;
INSERT INTO `UBICACION` VALUES (1,'Calle 1','Colonia 33',432),(2,'Calle 12','Colonia 1',983);
/*!40000 ALTER TABLE `UBICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `LastNamep` varchar(50) NOT NULL,
  `LastNamem` varchar(50) NOT NULL,
  `Rol` varchar(10) NOT NULL,
  `Tel` varchar(12) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'Hector','Llanos','Banuelos','Admin','5519941429','correo@hotmail.com'),(2,'Esmeralda','Calvario','Avalos','Usuario','5516641429','correo1@hotmail.com'),(3,'Oscar','Llanos','Banuelos','Usuario','2219941429','correo3@hotmail.com');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LOG_TABLA_USUARIO` AFTER INSERT ON `USUARIO` FOR EACH ROW INSERT INTO LOG_USUARIO (ID, ACCION) VALUES(1,'Dato insertado'); */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_productos_total`
--

DROP TABLE IF EXISTS `vista_productos_total`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_total` AS SELECT 
 1 AS `COUNT(ARTICULO.ID)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_proveedor_producto`
--

DROP TABLE IF EXISTS `vista_proveedor_producto`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedor_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedor_producto` AS SELECT 
 1 AS `NAME`,
 1 AS `DESCR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuario_proIN`
--

DROP TABLE IF EXISTS `vista_usuario_proIN`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario_proIN`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuario_proIN` AS SELECT 
 1 AS `Usuarios que registran la Entrada de productos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuario_proOUT`
--

DROP TABLE IF EXISTS `vista_usuario_proOUT`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario_proOUT`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuario_proOUT` AS SELECT 
 1 AS `Usuarios que registran la Salida de productos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios_noAdmin`
--

DROP TABLE IF EXISTS `vista_usuarios_noAdmin`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios_noAdmin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios_noAdmin` AS SELECT 
 1 AS `COUNT(USUARIO.ID)`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'Inventario'
--

--
-- Dumping routines for database 'Inventario'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario`(
	IN id INT,
    IN nombre VARCHAR(50),
    IN apellidop VARCHAR(50),
    IN apellidom VARCHAR(50),
    IN rol VARCHAR(10),
    IN tel VARCHAR(12),
    IN email VARCHAR(20)
)
BEGIN
	INSERT INTO USUARIO (ID, NAME, LastNamep, LastNamem, Rol, Tel, Email) VALUES
	(id, nombre, apellidop, apellidom, rol, tel, email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ordenar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ordenar`(
	IN columna VARCHAR(2)
)
BEGIN
	SELECT * FROM USUARIO ORDER BY columna ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_productos_total`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_total` AS select count(`ARTICULO`.`ID`) AS `COUNT(ARTICULO.ID)` from `ARTICULO` where (`ARTICULO`.`EXISTENCIA` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedor_producto`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedor_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedor_producto` AS select `PROVEEDOR`.`NAME` AS `NAME`,`ARTICULO`.`DESCR` AS `DESCR` from (`ARTICULO` left join `PROVEEDOR` on((`PROVEEDOR`.`ID` = `ARTICULO`.`FK_PROVEEDOR`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuario_proIN`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuario_proIN`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario_proIN` AS select `USUARIO`.`NAME` AS `Usuarios que registran la Entrada de productos` from (`ENTRADA` left join `USUARIO` on((`USUARIO`.`ID` = `ENTRADA`.`FK_USUARIO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuario_proOUT`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuario_proOUT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario_proOUT` AS select `USUARIO`.`NAME` AS `Usuarios que registran la Salida de productos` from (`SALIDA` left join `USUARIO` on((`USUARIO`.`ID` = `SALIDA`.`FK_USUARIO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios_noAdmin`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios_noAdmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios_noAdmin` AS select count(`USUARIO`.`ID`) AS `COUNT(USUARIO.ID)` from `USUARIO` where (`USUARIO`.`Rol` = 'Usuario') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-02 18:45:25
