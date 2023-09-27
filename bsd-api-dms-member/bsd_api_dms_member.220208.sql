-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_member
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_market`
--

DROP TABLE IF EXISTS `tb_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_market` (
  `tbm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbm_create_date` datetime DEFAULT NULL,
  `tbm_create_id` int(11) DEFAULT NULL,
  `tbm_update_date` datetime DEFAULT NULL,
  `tbm_update_id` int(11) DEFAULT NULL,
  `tbm_role` varchar(255) DEFAULT NULL,
  `tbm_id_parent` int(11) DEFAULT NULL,
  `tbm_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_market`
--

LOCK TABLES `tb_market` WRITE;
/*!40000 ALTER TABLE `tb_market` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `tbm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbm_create_date` datetime DEFAULT NULL,
  `tbm_create_id` int(11) DEFAULT NULL,
  `tbm_update_date` datetime DEFAULT NULL,
  `tbm_update_id` int(11) DEFAULT NULL,
  `tbm_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'2021-07-31 15:26:21',0,NULL,NULL,'Product Registration'),(2,'2021-07-31 15:26:21',0,NULL,NULL,'Order'),(3,'2021-07-31 15:26:21',0,NULL,NULL,'Packing'),(4,'2021-07-31 15:26:21',0,NULL,NULL,'Confirm'),(5,'2021-07-31 15:26:21',0,NULL,NULL,'Report'),(6,'2021-07-31 15:26:21',0,NULL,NULL,'User');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `tbu_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbu_create_date` datetime DEFAULT NULL,
  `tbu_create_id` int(11) DEFAULT NULL,
  `tbu_update_date` datetime DEFAULT NULL,
  `tbu_update_id` int(11) DEFAULT NULL,
  `tbu_email` varchar(255) DEFAULT NULL,
  `tbu_password` varchar(32) DEFAULT NULL,
  `tbu_firstname` varchar(100) DEFAULT NULL,
  `tbu_lastname` varchar(100) DEFAULT NULL,
  `tbu_mobile_phone` varchar(100) DEFAULT NULL,
  `tbu_place_of_birth` varchar(100) DEFAULT NULL,
  `tbu_date_of_birth` datetime DEFAULT NULL,
  `tbu_status` varchar(20) DEFAULT NULL,
  `tbu_uid` varchar(100) DEFAULT NULL,
  `tbu_photo` varchar(1000) DEFAULT NULL,
  `tbu_token_salt` varchar(36) DEFAULT NULL,
  `tbu_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbu_id`),
  UNIQUE KEY `tb_user_tbu_email_uindex` (`tbu_email`),
  UNIQUE KEY `tb_user_tbu_uid_uindex` (`tbu_uid`),
  KEY `tb_user_tbu_status_index` (`tbu_status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'2019-09-03 15:42:44',0,'2022-02-07 09:45:02',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin','123','Jakarta','1981-08-19 00:00:00','active','xycnh1fzl8chkm8cqr20ni6zvh2ai52c3mvw2uwy0s86mscu9u80h6ylym2imghas6h6ffj05taecfoxfu3g0x8alwbt97q9je8f','1111343528-20q4jm5fw1-Cluster-Morizen-Bekasi-Indonesia.jpg','jnsr8q8t7dzgqv8qqmkfsffc5mqdn5fec4af','ADMIN'),(2,'2021-11-04 12:00:07',1,'2022-02-07 09:49:59',1,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','one',NULL,NULL,NULL,'active',NULL,NULL,'ng843n6ocg719kklqklb5814t9n2ahilj9zv','DISTRIBUTOR'),(3,'2021-11-04 12:12:24',1,'2022-02-07 09:50:03',1,'pic2@mail.com','202cb962ac59075b964b07152d234b70','pic','two',NULL,NULL,NULL,'active',NULL,NULL,'b3n95p03tsdpm9fya84cnelibj9u34xffz6j','SUBDIST'),(4,'2021-11-04 12:13:34',1,'2022-02-07 09:50:10',1,'pic3@mail.com','202cb962ac59075b964b07152d234b70','pic','three',NULL,NULL,NULL,'active',NULL,NULL,'zxfxjhji09xdf66s3usg6ro49l76ckrcmhyl','SUBDIST'),(5,'2022-02-07 09:12:43',1,'2022-02-07 09:49:26',1,'pic4@mail.com','202cb962ac59075b964b07152d234b70','pic','four',NULL,NULL,NULL,'active',NULL,NULL,'ni5ju0wgw0l4x3gxoq0cgh3jn3lyvejl5aq8','GROSIR'),(8,'2022-02-07 09:48:32',1,NULL,NULL,'pic6@mail.com','202cb962ac59075b964b07152d234b70','pic','six',NULL,NULL,NULL,'active',NULL,NULL,'onlidhsdmmgz9k8gxzq2dfazrhshyx9zv53p','GROSIR');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_brand`
--

DROP TABLE IF EXISTS `tb_user_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_brand` (
  `tbub_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbub_create_date` datetime DEFAULT NULL,
  `tbub_create_id` int(11) DEFAULT NULL,
  `tbub_update_date` datetime DEFAULT NULL,
  `tbub_update_id` int(11) DEFAULT NULL,
  `tbu_id` int(11) DEFAULT NULL,
  `tbb_brand` varchar(255) DEFAULT NULL,
  `tbb_brand_id` varchar(5) DEFAULT NULL,
  `tbb_brand_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (199,'2022-02-07 09:45:02',1,NULL,NULL,1,'Anessa','ANESS',1),(200,'2022-02-07 09:45:02',1,NULL,NULL,1,'BEBE','BEBEB',1),(201,'2022-02-07 09:45:02',1,NULL,NULL,1,'Cetaphil','CETAP',1),(202,'2022-02-07 09:45:02',1,NULL,NULL,1,'cocacola','COCAC',1),(203,'2022-02-07 09:45:02',1,NULL,NULL,1,'Combiphar','COMBH',1),(204,'2022-02-07 09:45:02',1,NULL,NULL,1,'Innisfree','INNIS',1),(205,'2022-02-07 09:45:02',1,NULL,NULL,1,'Interbat','INTER',1),(206,'2022-02-07 09:45:02',1,NULL,NULL,1,'Laneige','LANEI',1),(207,'2022-02-07 09:45:02',1,NULL,NULL,1,'Mamonde','MAMON',1),(208,'2022-02-07 09:45:02',1,NULL,NULL,1,'Mecard','MECAR',1),(209,'2022-02-07 09:45:02',1,NULL,NULL,1,'Mentos','MENTO',1),(210,'2022-02-07 09:45:02',1,NULL,NULL,1,'Mustela','MUSTE',1),(211,'2022-02-07 09:45:02',1,NULL,NULL,1,'Nestle','NESTL',1),(212,'2022-02-07 09:45:02',1,NULL,NULL,1,'Nutrition','NUTRI',1),(213,'2022-02-07 09:45:02',1,NULL,NULL,1,'P&G Health','PNGHE',1),(214,'2022-02-07 09:45:02',1,NULL,NULL,1,'Pillowpeople','PILLO',1),(215,'2022-02-07 09:45:02',1,NULL,NULL,1,'Purina','PURIN',1),(216,'2022-02-07 09:45:02',1,NULL,NULL,1,'Sulwhasoo','SULWH',1),(253,'2022-02-07 09:48:32',1,NULL,NULL,8,'Anessa','ANESS',1),(254,'2022-02-07 09:48:32',1,NULL,NULL,8,'BEBE','BEBEB',0),(255,'2022-02-07 09:48:32',1,NULL,NULL,8,'Cetaphil','CETAP',0),(256,'2022-02-07 09:48:32',1,NULL,NULL,8,'cocacola','COCAC',0),(257,'2022-02-07 09:48:32',1,NULL,NULL,8,'Combiphar','COMBH',0),(258,'2022-02-07 09:48:32',1,NULL,NULL,8,'Innisfree','INNIS',0),(259,'2022-02-07 09:48:32',1,NULL,NULL,8,'Interbat','INTER',0),(260,'2022-02-07 09:48:32',1,NULL,NULL,8,'Laneige','LANEI',0),(261,'2022-02-07 09:48:32',1,NULL,NULL,8,'Mamonde','MAMON',0),(262,'2022-02-07 09:48:32',1,NULL,NULL,8,'Mecard','MECAR',0),(263,'2022-02-07 09:48:32',1,NULL,NULL,8,'Mentos','MENTO',0),(264,'2022-02-07 09:48:32',1,NULL,NULL,8,'Mustela','MUSTE',0),(265,'2022-02-07 09:48:32',1,NULL,NULL,8,'Nestle','NESTL',0),(266,'2022-02-07 09:48:32',1,NULL,NULL,8,'Nutrition','NUTRI',0),(267,'2022-02-07 09:48:32',1,NULL,NULL,8,'Pillowpeople','PILLO',0),(268,'2022-02-07 09:48:32',1,NULL,NULL,8,'P&G Health','PNGHE',0),(269,'2022-02-07 09:48:32',1,NULL,NULL,8,'Purina','PURIN',0),(270,'2022-02-07 09:48:32',1,NULL,NULL,8,'Sulwhasoo','SULWH',0),(343,'2022-02-07 09:49:26',1,NULL,NULL,5,'Anessa','ANESS',1),(344,'2022-02-07 09:49:26',1,NULL,NULL,5,'BEBE','BEBEB',0),(345,'2022-02-07 09:49:26',1,NULL,NULL,5,'Cetaphil','CETAP',0),(346,'2022-02-07 09:49:26',1,NULL,NULL,5,'cocacola','COCAC',0),(347,'2022-02-07 09:49:26',1,NULL,NULL,5,'Combiphar','COMBH',0),(348,'2022-02-07 09:49:26',1,NULL,NULL,5,'Innisfree','INNIS',0),(349,'2022-02-07 09:49:26',1,NULL,NULL,5,'Interbat','INTER',0),(350,'2022-02-07 09:49:26',1,NULL,NULL,5,'Laneige','LANEI',0),(351,'2022-02-07 09:49:26',1,NULL,NULL,5,'Mamonde','MAMON',0),(352,'2022-02-07 09:49:26',1,NULL,NULL,5,'Mecard','MECAR',0),(353,'2022-02-07 09:49:26',1,NULL,NULL,5,'Mentos','MENTO',0),(354,'2022-02-07 09:49:26',1,NULL,NULL,5,'Mustela','MUSTE',0),(355,'2022-02-07 09:49:26',1,NULL,NULL,5,'Nestle','NESTL',0),(356,'2022-02-07 09:49:26',1,NULL,NULL,5,'Nutrition','NUTRI',0),(357,'2022-02-07 09:49:26',1,NULL,NULL,5,'P&G Health','PNGHE',0),(358,'2022-02-07 09:49:26',1,NULL,NULL,5,'Pillowpeople','PILLO',0),(359,'2022-02-07 09:49:26',1,NULL,NULL,5,'Purina','PURIN',0),(360,'2022-02-07 09:49:26',1,NULL,NULL,5,'Sulwhasoo','SULWH',0),(361,'2022-02-07 09:49:59',1,NULL,NULL,2,'Anessa','ANESS',1),(362,'2022-02-07 09:49:59',1,NULL,NULL,2,'BEBE','BEBEB',1),(363,'2022-02-07 09:49:59',1,NULL,NULL,2,'Cetaphil','CETAP',0),(364,'2022-02-07 09:49:59',1,NULL,NULL,2,'cocacola','COCAC',0),(365,'2022-02-07 09:49:59',1,NULL,NULL,2,'Combiphar','COMBH',0),(366,'2022-02-07 09:49:59',1,NULL,NULL,2,'Innisfree','INNIS',1),(367,'2022-02-07 09:49:59',1,NULL,NULL,2,'Interbat','INTER',0),(368,'2022-02-07 09:49:59',1,NULL,NULL,2,'Laneige','LANEI',0),(369,'2022-02-07 09:49:59',1,NULL,NULL,2,'Mamonde','MAMON',0),(370,'2022-02-07 09:49:59',1,NULL,NULL,2,'Mecard','MECAR',0),(371,'2022-02-07 09:49:59',1,NULL,NULL,2,'Mentos','MENTO',0),(372,'2022-02-07 09:49:59',1,NULL,NULL,2,'Mustela','MUSTE',0),(373,'2022-02-07 09:49:59',1,NULL,NULL,2,'Nestle','NESTL',0),(374,'2022-02-07 09:49:59',1,NULL,NULL,2,'Nutrition','NUTRI',0),(375,'2022-02-07 09:49:59',1,NULL,NULL,2,'P&G Health','PNGHE',0),(376,'2022-02-07 09:49:59',1,NULL,NULL,2,'Pillowpeople','PILLO',0),(377,'2022-02-07 09:49:59',1,NULL,NULL,2,'Purina','PURIN',0),(378,'2022-02-07 09:49:59',1,NULL,NULL,2,'Sulwhasoo','SULWH',0),(379,'2022-02-07 09:50:03',1,NULL,NULL,3,'Anessa','ANESS',1),(380,'2022-02-07 09:50:03',1,NULL,NULL,3,'BEBE','BEBEB',0),(381,'2022-02-07 09:50:03',1,NULL,NULL,3,'Cetaphil','CETAP',0),(382,'2022-02-07 09:50:03',1,NULL,NULL,3,'cocacola','COCAC',0),(383,'2022-02-07 09:50:03',1,NULL,NULL,3,'Combiphar','COMBH',0),(384,'2022-02-07 09:50:03',1,NULL,NULL,3,'Innisfree','INNIS',0),(385,'2022-02-07 09:50:03',1,NULL,NULL,3,'Interbat','INTER',0),(386,'2022-02-07 09:50:03',1,NULL,NULL,3,'Laneige','LANEI',0),(387,'2022-02-07 09:50:03',1,NULL,NULL,3,'Mamonde','MAMON',0),(388,'2022-02-07 09:50:03',1,NULL,NULL,3,'Mecard','MECAR',0),(389,'2022-02-07 09:50:03',1,NULL,NULL,3,'Mentos','MENTO',0),(390,'2022-02-07 09:50:03',1,NULL,NULL,3,'Mustela','MUSTE',0),(391,'2022-02-07 09:50:03',1,NULL,NULL,3,'Nestle','NESTL',0),(392,'2022-02-07 09:50:03',1,NULL,NULL,3,'Nutrition','NUTRI',0),(393,'2022-02-07 09:50:03',1,NULL,NULL,3,'P&G Health','PNGHE',0),(394,'2022-02-07 09:50:03',1,NULL,NULL,3,'Pillowpeople','PILLO',0),(395,'2022-02-07 09:50:03',1,NULL,NULL,3,'Purina','PURIN',0),(396,'2022-02-07 09:50:03',1,NULL,NULL,3,'Sulwhasoo','SULWH',0),(397,'2022-02-07 09:50:10',1,NULL,NULL,4,'Anessa','ANESS',1),(398,'2022-02-07 09:50:10',1,NULL,NULL,4,'BEBE','BEBEB',1),(399,'2022-02-07 09:50:10',1,NULL,NULL,4,'Cetaphil','CETAP',1),(400,'2022-02-07 09:50:10',1,NULL,NULL,4,'cocacola','COCAC',0),(401,'2022-02-07 09:50:10',1,NULL,NULL,4,'Combiphar','COMBH',0),(402,'2022-02-07 09:50:10',1,NULL,NULL,4,'Innisfree','INNIS',1),(403,'2022-02-07 09:50:10',1,NULL,NULL,4,'Interbat','INTER',0),(404,'2022-02-07 09:50:10',1,NULL,NULL,4,'Laneige','LANEI',0),(405,'2022-02-07 09:50:10',1,NULL,NULL,4,'Mamonde','MAMON',0),(406,'2022-02-07 09:50:10',1,NULL,NULL,4,'Mecard','MECAR',0),(407,'2022-02-07 09:50:10',1,NULL,NULL,4,'Mentos','MENTO',0),(408,'2022-02-07 09:50:10',1,NULL,NULL,4,'Mustela','MUSTE',0),(409,'2022-02-07 09:50:10',1,NULL,NULL,4,'Nestle','NESTL',0),(410,'2022-02-07 09:50:10',1,NULL,NULL,4,'Nutrition','NUTRI',0),(411,'2022-02-07 09:50:10',1,NULL,NULL,4,'P&G Health','PNGHE',0),(412,'2022-02-07 09:50:10',1,NULL,NULL,4,'Pillowpeople','PILLO',0),(413,'2022-02-07 09:50:10',1,NULL,NULL,4,'Purina','PURIN',0),(414,'2022-02-07 09:50:10',1,NULL,NULL,4,'Sulwhasoo','SULWH',0);
/*!40000 ALTER TABLE `tb_user_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_menu`
--

DROP TABLE IF EXISTS `tb_user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_menu` (
  `tbum_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbum_create_date` datetime DEFAULT NULL,
  `tbum_create_id` int(11) DEFAULT NULL,
  `tbum_update_date` datetime DEFAULT NULL,
  `tbum_update_id` int(11) DEFAULT NULL,
  `tbu_id` int(11) DEFAULT NULL,
  `tbm_id` int(11) DEFAULT NULL,
  `tbum_add` int(11) DEFAULT NULL,
  `tbum_edit` int(11) DEFAULT NULL,
  `tbum_delete` int(11) DEFAULT NULL,
  `tbum_view` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_menu`
--

LOCK TABLES `tb_user_menu` WRITE;
/*!40000 ALTER TABLE `tb_user_menu` DISABLE KEYS */;
INSERT INTO `tb_user_menu` VALUES (67,'2022-02-07 09:45:02',1,NULL,NULL,1,4,1,1,1,1),(68,'2022-02-07 09:45:02',1,NULL,NULL,1,2,1,1,1,1),(69,'2022-02-07 09:45:02',1,NULL,NULL,1,3,1,1,1,1),(70,'2022-02-07 09:45:02',1,NULL,NULL,1,1,1,1,1,1),(71,'2022-02-07 09:45:02',1,NULL,NULL,1,5,1,1,1,1),(72,'2022-02-07 09:45:02',1,NULL,NULL,1,6,1,1,1,1),(85,'2022-02-07 09:48:32',1,NULL,NULL,8,4,0,0,0,0),(86,'2022-02-07 09:48:32',1,NULL,NULL,8,2,0,0,0,0),(87,'2022-02-07 09:48:32',1,NULL,NULL,8,3,0,0,0,0),(88,'2022-02-07 09:48:32',1,NULL,NULL,8,1,0,0,0,0),(89,'2022-02-07 09:48:32',1,NULL,NULL,8,5,0,0,0,1),(90,'2022-02-07 09:48:32',1,NULL,NULL,8,6,0,0,0,0),(115,'2022-02-07 09:49:26',1,NULL,NULL,5,4,0,0,0,0),(116,'2022-02-07 09:49:26',1,NULL,NULL,5,2,0,0,0,1),(117,'2022-02-07 09:49:26',1,NULL,NULL,5,3,0,0,0,0),(118,'2022-02-07 09:49:26',1,NULL,NULL,5,1,0,0,0,0),(119,'2022-02-07 09:49:26',1,NULL,NULL,5,5,0,0,0,0),(120,'2022-02-07 09:49:26',1,NULL,NULL,5,6,0,0,0,0),(121,'2022-02-07 09:49:59',1,NULL,NULL,2,4,0,0,0,0),(122,'2022-02-07 09:49:59',1,NULL,NULL,2,2,0,0,0,1),(123,'2022-02-07 09:49:59',1,NULL,NULL,2,3,0,0,0,0),(124,'2022-02-07 09:49:59',1,NULL,NULL,2,1,0,0,0,0),(125,'2022-02-07 09:49:59',1,NULL,NULL,2,5,0,0,0,0),(126,'2022-02-07 09:49:59',1,NULL,NULL,2,6,0,0,0,0),(127,'2022-02-07 09:50:03',1,NULL,NULL,3,4,0,0,0,1),(128,'2022-02-07 09:50:03',1,NULL,NULL,3,2,0,0,0,0),(129,'2022-02-07 09:50:03',1,NULL,NULL,3,3,0,0,0,0),(130,'2022-02-07 09:50:03',1,NULL,NULL,3,1,0,0,0,0),(131,'2022-02-07 09:50:03',1,NULL,NULL,3,5,0,0,0,0),(132,'2022-02-07 09:50:03',1,NULL,NULL,3,6,0,0,0,0),(133,'2022-02-07 09:50:10',1,NULL,NULL,4,4,0,0,0,1),(134,'2022-02-07 09:50:10',1,NULL,NULL,4,2,0,0,0,1),(135,'2022-02-07 09:50:10',1,NULL,NULL,4,3,0,0,0,1),(136,'2022-02-07 09:50:10',1,NULL,NULL,4,1,0,0,0,1),(137,'2022-02-07 09:50:10',1,NULL,NULL,4,5,0,0,0,1),(138,'2022-02-07 09:50:10',1,NULL,NULL,4,6,0,0,0,1);
/*!40000 ALTER TABLE `tb_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_user_brand`
--

DROP TABLE IF EXISTS `view_user_brand`;
/*!50001 DROP VIEW IF EXISTS `view_user_brand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_brand` (
  `uuid` tinyint NOT NULL,
  `tbu_id` tinyint NOT NULL,
  `tbu_email` tinyint NOT NULL,
  `tbu_firstname` tinyint NOT NULL,
  `tbu_lastname` tinyint NOT NULL,
  `tbb_brand` tinyint NOT NULL,
  `tbb_brand_id` tinyint NOT NULL,
  `tbb_brand_check` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_menu`
--

DROP TABLE IF EXISTS `view_user_menu`;
/*!50001 DROP VIEW IF EXISTS `view_user_menu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_menu` (
  `uuid` tinyint NOT NULL,
  `tbu_id` tinyint NOT NULL,
  `tbu_email` tinyint NOT NULL,
  `tbu_firstname` tinyint NOT NULL,
  `tbu_lastname` tinyint NOT NULL,
  `tbm_id` tinyint NOT NULL,
  `tbm_name` tinyint NOT NULL,
  `tbum_add` tinyint NOT NULL,
  `tbum_edit` tinyint NOT NULL,
  `tbum_delete` tinyint NOT NULL,
  `tbum_view` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_user_brand`
--

/*!50001 DROP TABLE IF EXISTS `view_user_brand`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_brand` AS select uuid() AS `uuid`,`tbu`.`tbu_id` AS `tbu_id`,`tbu`.`tbu_email` AS `tbu_email`,`tbu`.`tbu_firstname` AS `tbu_firstname`,`tbu`.`tbu_lastname` AS `tbu_lastname`,`tbub`.`tbb_brand` AS `tbb_brand`,`tbub`.`tbb_brand_id` AS `tbb_brand_id`,`tbub`.`tbb_brand_check` AS `tbb_brand_check` from (`tb_user` `tbu` join `tb_user_brand` `tbub` on(`tbu`.`tbu_id` = `tbub`.`tbu_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_menu`
--

/*!50001 DROP TABLE IF EXISTS `view_user_menu`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_menu` AS select uuid() AS `uuid`,`tbu`.`tbu_id` AS `tbu_id`,`tbu`.`tbu_email` AS `tbu_email`,`tbu`.`tbu_firstname` AS `tbu_firstname`,`tbu`.`tbu_lastname` AS `tbu_lastname`,`tbm`.`tbm_id` AS `tbm_id`,`tbm`.`tbm_name` AS `tbm_name`,`tbum`.`tbum_add` AS `tbum_add`,`tbum`.`tbum_edit` AS `tbum_edit`,`tbum`.`tbum_delete` AS `tbum_delete`,`tbum`.`tbum_view` AS `tbum_view` from ((`tb_user` `tbu` join `tb_user_menu` `tbum` on(`tbu`.`tbu_id` = `tbum`.`tbu_id`)) join `tb_menu` `tbm` on(`tbum`.`tbm_id` = `tbm`.`tbm_id`)) */;
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

-- Dump completed on 2022-02-08 12:32:07
