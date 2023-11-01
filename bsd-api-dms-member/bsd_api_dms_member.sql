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
-- Table structure for table `tb_brand`
--

DROP TABLE IF EXISTS `tb_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_brand` (
  `tbb_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbb_create_date` datetime DEFAULT NULL,
  `tbb_create_id` int(11) DEFAULT NULL,
  `tbb_update_date` datetime DEFAULT NULL,
  `tbb_update_id` int(11) DEFAULT NULL,
  `tbb_brand_id` varchar(5) DEFAULT NULL,
  `tbb_brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbb_id`),
  KEY `tb_brand_tbb_brand_id_index` (`tbb_brand_id`) USING BTREE,
  KEY `tb_brand_tbb_brand_index` (`tbb_brand`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_brand`
--

LOCK TABLES `tb_brand` WRITE;
/*!40000 ALTER TABLE `tb_brand` DISABLE KEYS */;
INSERT INTO `tb_brand` VALUES (1,'2023-10-15 10:16:36',1,NULL,NULL,'MAMAS','Mamasuka');
/*!40000 ALTER TABLE `tb_brand` ENABLE KEYS */;
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
  `tbm_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'2021-07-31 15:26:21',0,NULL,NULL,'Product',2),(2,'2021-07-31 15:26:21',0,NULL,NULL,'Order',4),(3,'2021-07-31 15:26:21',0,NULL,NULL,'Packing',5),(4,'2021-07-31 15:26:21',0,NULL,NULL,'Confirm',6),(5,'2021-07-31 15:26:21',0,NULL,NULL,'Report',7),(6,'2021-07-31 15:26:21',0,NULL,NULL,'User',9),(7,'2021-07-31 15:26:21',0,NULL,NULL,'Market',8),(8,'2021-07-31 15:26:21',0,NULL,NULL,'Dashboard',1),(9,'2021-07-31 15:26:21',0,NULL,NULL,'Gwp',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-30 14:58:12',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'j2x9fzhzeoln4kgv9s30hnicya5du69zch6w','ADMIN'),(22,'2023-10-30 14:59:46',1,'2023-10-31 23:14:18',22,'picdki@mail.com','202cb962ac59075b964b07152d234b70','pic','dki',NULL,NULL,NULL,'active',NULL,NULL,'mdai8anacb0qrs7j0ee88ttxi9if70ngn7ik','DISTRIBUTOR'),(23,'2023-10-30 15:00:18',1,NULL,NULL,'picjabar@mail.com','202cb962ac59075b964b07152d234b70','pic','jabar',NULL,NULL,NULL,'active',NULL,NULL,'otcoiaut7kkn2r6hxukuj06915rrtz7ynra9','DISTRIBUTOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (35,'2023-10-30 12:15:33',1,NULL,NULL,1,'Mamasuka','MAMAS',1),(46,'2023-10-30 15:00:18',1,NULL,NULL,23,'Mamasuka','MAMAS',1),(51,'2023-10-31 23:14:18',22,NULL,NULL,22,'Mamasuka','MAMAS',1);
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
  `tbm_market_id` varchar(255) DEFAULT NULL,
  `tbm_market_check` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbum_id`),
  KEY `tb_user_market_tbu_id_index` (`tbu_id`),
  KEY `tb_user_market_tbm_market_index` (`tbm_market_id`),
  KEY `tb_user_market_tbm_market_check_index` (`tbm_market_check`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (8,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_BALI',0),(9,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_DKI',0),(10,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_JABAR',1),(11,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_JATENG',0),(12,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_JATIM',0),(13,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_KALIMANTAN',0),(14,'2023-10-30 15:00:18',1,NULL,NULL,23,'DIST_NUSA',0),(43,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_BALI',0),(44,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_DKI',1),(45,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_JABAR',1),(46,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_JATENG',0),(47,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_JATIM',0),(48,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_KALIMANTAN',0),(49,'2023-10-31 23:14:18',22,NULL,NULL,22,'DIST_NUSA',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_menu`
--

LOCK TABLES `tb_user_menu` WRITE;
/*!40000 ALTER TABLE `tb_user_menu` DISABLE KEYS */;
INSERT INTO `tb_user_menu` VALUES (428,'2023-10-30 12:15:33',1,NULL,NULL,1,8,1,1,1,1),(429,'2023-10-30 12:15:33',1,NULL,NULL,1,1,1,1,1,1),(430,'2023-10-30 12:15:33',1,NULL,NULL,1,9,1,1,1,1),(431,'2023-10-30 12:15:33',1,NULL,NULL,1,2,1,1,1,1),(432,'2023-10-30 12:15:33',1,NULL,NULL,1,3,1,1,1,1),(433,'2023-10-30 12:15:33',1,NULL,NULL,1,4,1,1,1,1),(434,'2023-10-30 12:15:33',1,NULL,NULL,1,5,1,1,1,1),(435,'2023-10-30 12:15:33',1,NULL,NULL,1,7,1,1,1,1),(436,'2023-10-30 12:15:33',1,NULL,NULL,1,6,1,1,1,1),(527,'2023-10-30 15:00:18',1,NULL,NULL,23,8,0,0,0,1),(528,'2023-10-30 15:00:18',1,NULL,NULL,23,1,0,0,0,1),(529,'2023-10-30 15:00:18',1,NULL,NULL,23,9,0,0,0,1),(530,'2023-10-30 15:00:18',1,NULL,NULL,23,2,0,0,0,1),(531,'2023-10-30 15:00:18',1,NULL,NULL,23,3,0,0,0,1),(532,'2023-10-30 15:00:18',1,NULL,NULL,23,4,0,0,0,1),(533,'2023-10-30 15:00:18',1,NULL,NULL,23,5,0,0,0,1),(534,'2023-10-30 15:00:18',1,NULL,NULL,23,7,0,0,0,1),(535,'2023-10-30 15:00:18',1,NULL,NULL,23,6,0,0,0,1),(572,'2023-10-31 23:14:18',22,NULL,NULL,22,8,0,0,0,1),(573,'2023-10-31 23:14:18',22,NULL,NULL,22,1,0,0,0,1),(574,'2023-10-31 23:14:18',22,NULL,NULL,22,9,0,0,0,1),(575,'2023-10-31 23:14:18',22,NULL,NULL,22,2,0,0,0,1),(576,'2023-10-31 23:14:18',22,NULL,NULL,22,3,0,0,0,1),(577,'2023-10-31 23:14:18',22,NULL,NULL,22,4,0,0,0,1),(578,'2023-10-31 23:14:18',22,NULL,NULL,22,5,0,0,0,1),(579,'2023-10-31 23:14:18',22,NULL,NULL,22,7,0,0,0,1),(580,'2023-10-31 23:14:18',22,NULL,NULL,22,6,0,0,0,1);
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

-- Dump completed on 2023-11-01  7:50:48
