-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_member
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
  `tbm_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'2021-07-31 15:26:21',0,NULL,NULL,'Product',2),(2,'2021-07-31 15:26:21',0,NULL,NULL,'Order',3),(3,'2021-07-31 15:26:21',0,NULL,NULL,'Packing',4),(4,'2021-07-31 15:26:21',0,NULL,NULL,'Confirm',5),(5,'2021-07-31 15:26:21',0,NULL,NULL,'Report',6),(6,'2021-07-31 15:26:21',0,NULL,NULL,'User',7),(7,'2021-07-31 15:26:21',0,NULL,NULL,'Market',1),(8,'2021-07-31 15:26:21',0,NULL,NULL,'Dashboard',8);
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
  KEY `tb_user_tbu_status_index` (`tbu_status`),
  KEY `tb_user_tbu_password_index` (`tbu_password`),
  KEY `tb_user_tbu_firstname_index` (`tbu_firstname`),
  KEY `tb_user_tbu_lastname_index` (`tbu_lastname`),
  KEY `tb_user_tbu_token_salt_index` (`tbu_token_salt`),
  KEY `tb_user_tbu_role_index` (`tbu_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-12 02:31:45',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'mkn2u7aadygkdry49zs8qi8140umahapfb1m','ADMIN'),(2,NULL,NULL,'2023-10-12 02:29:06',2,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','one',NULL,NULL,NULL,'active',NULL,NULL,'fmy9zns76y678ct4awen83ygjcbjmke688y8','PRINCIPAL'),(3,NULL,NULL,'2023-10-08 12:42:12',4,'pic2@mail.com','202cb962ac59075b964b07152d234b70','pic','pic',NULL,NULL,NULL,'active',NULL,NULL,'b3n95p03tsdpm9fya84cnelibj9u34xffz6j','DISTRIBUTOR'),(4,'2023-10-01 11:49:59',1,'2023-10-08 12:42:40',4,'pic3@mail.com','202cb962ac59075b964b07152d234b70','pic','three',NULL,NULL,NULL,'active',NULL,NULL,'ur2r10iu2jq6smbzo7gtfhkhy0zjc61fpkev','SUBDIST');
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
  PRIMARY KEY (`tbub_id`),
  KEY `tb_user_brand_tbu_id_index` (`tbu_id`),
  KEY `tb_user_brand_tbb_brand_index` (`tbb_brand`),
  KEY `tb_user_brand_tbb_brand_id_index` (`tbb_brand_id`),
  KEY `tb_user_brand_tbb_brand_check_index` (`tbb_brand_check`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,NULL,1,NULL,NULL,1,'Mamasuka','MAMAS',1),(10,'2023-10-08 12:41:53',4,NULL,NULL,2,'Mamasuka','MAMAS',1),(11,'2023-10-08 12:42:12',4,NULL,NULL,3,'Mamasuka','MAMAS',1),(12,'2023-10-08 12:42:17',4,NULL,NULL,4,'Mamasuka','MAMAS',1);
/*!40000 ALTER TABLE `tb_user_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_market`
--

DROP TABLE IF EXISTS `tb_user_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_market` (
  `tbum_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbum_create_date` datetime DEFAULT NULL,
  `tbum_create_id` int(11) DEFAULT NULL,
  `tbum_update_date` datetime DEFAULT NULL,
  `tbum_update_id` int(11) DEFAULT NULL,
  `tbu_id` int(11) DEFAULT NULL,
  `tbm_market` varchar(255) DEFAULT NULL,
  `tbm_market_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbum_id`),
  KEY `tb_user_market_tbu_id_index` (`tbu_id`),
  KEY `tb_user_market_tbm_market_index` (`tbm_market`),
  KEY `tb_user_market_tbm_market_check_index` (`tbm_market_check`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (8,'2023-09-26 15:05:34',1,NULL,NULL,1,'TREC',1),(9,'2023-09-26 15:05:34',1,NULL,NULL,1,'SUKANDA',1),(10,'2023-09-26 15:05:34',1,NULL,NULL,1,'Distributor A',1),(11,'2023-09-26 15:05:34',1,NULL,NULL,1,'Subdist A',1),(12,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir A',1),(13,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir B',1),(14,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir C',1),(15,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir D',1),(16,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir F',1),(17,'2023-09-26 15:05:34',1,NULL,NULL,1,'Grosir G',1),(18,'2023-09-26 15:05:34',1,NULL,NULL,1,'Subdist B',1),(19,'2023-09-26 15:05:34',1,NULL,NULL,1,'Subdist C',1),(20,'2023-09-26 15:05:34',1,NULL,NULL,1,'Subdist D',1),(21,'2023-09-26 15:05:34',1,NULL,NULL,1,'Subdist E',1),(22,'2023-09-26 15:05:34',1,NULL,NULL,1,'Distributor B',1),(113,'2023-10-08 12:41:53',4,NULL,NULL,2,'TREC',1),(114,'2023-10-08 12:41:53',4,NULL,NULL,2,'SUKANDA',1),(115,'2023-10-08 12:41:53',4,NULL,NULL,2,'Distributor A',0),(116,'2023-10-08 12:41:53',4,NULL,NULL,2,'Subdist A',0),(117,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir A',0),(118,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir B',0),(119,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir C',0),(120,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir D',0),(121,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir F',0),(122,'2023-10-08 12:41:53',4,NULL,NULL,2,'Grosir G',0),(123,'2023-10-08 12:41:53',4,NULL,NULL,2,'Subdist B',0),(124,'2023-10-08 12:41:53',4,NULL,NULL,2,'Subdist C',0),(125,'2023-10-08 12:41:53',4,NULL,NULL,2,'Subdist D',0),(126,'2023-10-08 12:41:53',4,NULL,NULL,2,'Subdist E',0),(127,'2023-10-08 12:41:53',4,NULL,NULL,2,'Distributor B',0),(128,'2023-10-08 12:42:12',4,NULL,NULL,3,'Distributor A',0),(129,'2023-10-08 12:42:12',4,NULL,NULL,3,'Distributor B',0),(130,'2023-10-08 12:42:12',4,NULL,NULL,3,'SUKANDA',1),(131,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist A',0),(132,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir A',0),(133,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir B',0),(134,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir C',0),(135,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir D',0),(136,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir F',0),(137,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir G',0),(138,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist B',0),(139,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist C',0),(140,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist D',0),(141,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist E',0),(142,'2023-10-08 12:42:12',4,NULL,NULL,3,'Distributor A',0),(143,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist A',0),(144,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir A',0),(145,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir B',0),(146,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir C',0),(147,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir D',0),(148,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir F',0),(149,'2023-10-08 12:42:12',4,NULL,NULL,3,'Grosir G',0),(150,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist B',0),(151,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist C',0),(152,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist D',0),(153,'2023-10-08 12:42:12',4,NULL,NULL,3,'Subdist E',0),(154,'2023-10-08 12:42:12',4,NULL,NULL,3,'Distributor B',0),(155,'2023-10-08 12:42:17',4,NULL,NULL,4,'Subdist A',1),(156,'2023-10-08 12:42:17',4,NULL,NULL,4,'Subdist B',1),(157,'2023-10-08 12:42:17',4,NULL,NULL,4,'Subdist C',1),(158,'2023-10-08 12:42:17',4,NULL,NULL,4,'Subdist D',1),(159,'2023-10-08 12:42:17',4,NULL,NULL,4,'Subdist E',1),(160,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir A',1),(161,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir B',1),(162,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir C',1),(163,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir D',1),(164,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir F',1),(165,'2023-10-08 12:42:17',4,NULL,NULL,4,'Grosir G',1);
/*!40000 ALTER TABLE `tb_user_market` ENABLE KEYS */;
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
  PRIMARY KEY (`tbum_id`),
  KEY `tb_user_menu_tbu_id_index` (`tbu_id`),
  KEY `tb_user_menu_tbm_id_index` (`tbm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_menu`
--

LOCK TABLES `tb_user_menu` WRITE;
/*!40000 ALTER TABLE `tb_user_menu` DISABLE KEYS */;
INSERT INTO `tb_user_menu` VALUES (22,'2023-09-26 15:05:34',1,NULL,NULL,1,4,1,1,1,1),(23,'2023-09-26 15:05:34',1,NULL,NULL,1,7,1,1,1,1),(24,'2023-09-26 15:05:34',1,NULL,NULL,1,2,1,1,1,1),(25,'2023-09-26 15:05:34',1,NULL,NULL,1,3,1,1,1,1),(26,'2023-09-26 15:05:34',1,NULL,NULL,1,1,1,1,1,1),(27,'2023-09-26 15:05:34',1,NULL,NULL,1,5,1,1,1,1),(28,'2023-09-26 15:05:34',1,NULL,NULL,1,6,1,1,1,1),(29,'2023-09-26 15:05:34',NULL,NULL,NULL,1,8,NULL,NULL,NULL,NULL),(80,'2023-10-08 12:41:53',4,NULL,NULL,2,4,1,1,1,1),(81,'2023-10-08 12:41:53',4,NULL,NULL,2,8,0,0,0,1),(82,'2023-10-08 12:41:53',4,NULL,NULL,2,7,1,1,1,1),(83,'2023-10-08 12:41:53',4,NULL,NULL,2,2,1,1,1,1),(84,'2023-10-08 12:41:53',4,NULL,NULL,2,3,1,1,1,0),(85,'2023-10-08 12:41:53',4,NULL,NULL,2,1,1,1,1,1),(86,'2023-10-08 12:41:53',4,NULL,NULL,2,5,1,1,1,1),(87,'2023-10-08 12:41:53',4,NULL,NULL,2,6,1,1,1,1),(88,'2023-10-08 12:42:12',4,NULL,NULL,3,4,1,1,1,1),(89,'2023-10-08 12:42:12',4,NULL,NULL,3,8,0,0,0,1),(90,'2023-10-08 12:42:12',4,NULL,NULL,3,7,1,1,1,1),(91,'2023-10-08 12:42:12',4,NULL,NULL,3,2,1,1,1,1),(92,'2023-10-08 12:42:12',4,NULL,NULL,3,3,1,1,1,0),(93,'2023-10-08 12:42:12',4,NULL,NULL,3,1,1,1,1,1),(94,'2023-10-08 12:42:12',4,NULL,NULL,3,5,1,1,1,1),(95,'2023-10-08 12:42:12',4,NULL,NULL,3,6,1,1,1,1),(96,'2023-10-08 12:42:17',4,NULL,NULL,4,4,0,0,0,1),(97,'2023-10-08 12:42:17',4,NULL,NULL,4,8,0,0,0,1),(98,'2023-10-08 12:42:17',4,NULL,NULL,4,7,0,0,0,1),(99,'2023-10-08 12:42:17',4,NULL,NULL,4,2,0,0,0,1),(100,'2023-10-08 12:42:17',4,NULL,NULL,4,3,0,0,0,0),(101,'2023-10-08 12:42:17',4,NULL,NULL,4,1,0,0,0,1),(102,'2023-10-08 12:42:17',4,NULL,NULL,4,5,0,0,0,1),(103,'2023-10-08 12:42:17',4,NULL,NULL,4,6,0,0,0,1);
/*!40000 ALTER TABLE `tb_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_user_brand`
--

DROP TABLE IF EXISTS `view_user_brand`;
/*!50001 DROP VIEW IF EXISTS `view_user_brand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_brand` AS SELECT
 1 AS `uuid`,
  1 AS `tbu_id`,
  1 AS `tbu_email`,
  1 AS `tbu_firstname`,
  1 AS `tbu_lastname`,
  1 AS `tbb_brand`,
  1 AS `tbb_brand_id`,
  1 AS `tbb_brand_check` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_menu`
--

DROP TABLE IF EXISTS `view_user_menu`;
/*!50001 DROP VIEW IF EXISTS `view_user_menu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_menu` AS SELECT
 1 AS `uuid`,
  1 AS `tbu_id`,
  1 AS `tbu_email`,
  1 AS `tbu_firstname`,
  1 AS `tbu_lastname`,
  1 AS `tbm_id`,
  1 AS `tbm_name`,
  1 AS `tbum_add`,
  1 AS `tbum_edit`,
  1 AS `tbum_delete`,
  1 AS `tbum_view`,
  1 AS `tbm_sort` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_user_brand`
--

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

/*!50001 DROP VIEW IF EXISTS `view_user_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_menu` AS select uuid() AS `uuid`,`tbu`.`tbu_id` AS `tbu_id`,`tbu`.`tbu_email` AS `tbu_email`,`tbu`.`tbu_firstname` AS `tbu_firstname`,`tbu`.`tbu_lastname` AS `tbu_lastname`,`tbm`.`tbm_id` AS `tbm_id`,`tbm`.`tbm_name` AS `tbm_name`,`tbum`.`tbum_add` AS `tbum_add`,`tbum`.`tbum_edit` AS `tbum_edit`,`tbum`.`tbum_delete` AS `tbum_delete`,`tbum`.`tbum_view` AS `tbum_view`,`tbm`.`tbm_sort` AS `tbm_sort` from ((`tb_user` `tbu` join `tb_user_menu` `tbum` on(`tbu`.`tbu_id` = `tbum`.`tbu_id`)) join `tb_menu` `tbm` on(`tbum`.`tbm_id` = `tbm`.`tbm_id`)) */;
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

-- Dump completed on 2023-10-12 12:26:40
