-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_report_bak
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
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order` (
  `tbo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbo_create_date` datetime DEFAULT NULL,
  `tbo_create_id` int(11) DEFAULT NULL,
  `tbo_update_date` datetime DEFAULT NULL,
  `tbo_update_id` int(11) DEFAULT NULL,
  `tbo_row` int(11) DEFAULT NULL,
  `tbo_brand` varchar(255) DEFAULT NULL,
  `tbo_market` varchar(255) DEFAULT NULL,
  `tbo_qc_id` int(11) DEFAULT NULL,
  `tbo_seq` int(11) DEFAULT NULL,
  `tbo_max_seq` int(11) DEFAULT NULL,
  `tbo_order_sq` varchar(255) DEFAULT NULL,
  `tbo_order_no` varchar(255) DEFAULT NULL,
  `tbo_sku` varchar(255) DEFAULT NULL,
  `tbo_item` varchar(255) DEFAULT NULL,
  `tbo_code` varchar(255) DEFAULT NULL,
  `tbo_loc` varchar(255) DEFAULT NULL,
  `tbo_qty` int(11) DEFAULT NULL,
  `tbo_diskon_from_market` decimal(20,10) DEFAULT NULL,
  `tbo_unit_price` decimal(20,10) DEFAULT NULL,
  `tbo_diskon_total` decimal(20,10) DEFAULT NULL,
  `tbo_paid_total` decimal(20,10) DEFAULT NULL,
  `tbo_order_sum` decimal(20,10) DEFAULT NULL,
  `tbo_name` varchar(255) DEFAULT NULL,
  `tbo_hp` varchar(255) DEFAULT NULL,
  `tbo_address1` varchar(1000) DEFAULT NULL,
  `tbo_address2` varchar(1000) DEFAULT NULL,
  `tbo_address3` varchar(1000) DEFAULT NULL,
  `tbo_address4` varchar(1000) DEFAULT NULL,
  `tbo_address5` varchar(1000) DEFAULT NULL,
  `tbo_full_address` varchar(1000) DEFAULT NULL,
  `tbo_awb` varchar(255) DEFAULT NULL,
  `tbo_status` varchar(255) DEFAULT NULL,
  `tbo_file` varchar(255) DEFAULT NULL,
  `tbo_check` varchar(255) DEFAULT NULL,
  `tbo_notes` varchar(1000) DEFAULT NULL,
  `tbo_type` varchar(255) DEFAULT NULL,
  `tbo_type_not_packed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbo_id`),
  UNIQUE KEY `tb_order_key_1` (`tbo_order_no`,`tbo_seq`),
  KEY `tb_order_tbo_brand_index` (`tbo_brand`),
  KEY `tb_order_tbo_market_index` (`tbo_market`),
  KEY `tb_order_tbo_sku_index` (`tbo_sku`),
  KEY `tb_order_tbo_item_index` (`tbo_item`),
  KEY `tb_order_tbo_code_index` (`tbo_code`),
  KEY `tb_order_tbo_awb_index` (`tbo_awb`),
  KEY `tb_order_tbo_status_index` (`tbo_status`),
  KEY `tb_order_tbo_check_index` (`tbo_check`),
  KEY `tb_order_tbo_type_index` (`tbo_type`),
  KEY `tb_order_tbo_type_not_packed_index` (`tbo_type_not_packed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_status`
--

DROP TABLE IF EXISTS `tb_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_status` (
  `tbos_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbos_create_date` datetime DEFAULT NULL,
  `tbos_create_id` int(11) DEFAULT NULL,
  `tbos_update_date` datetime DEFAULT NULL,
  `tbos_update_id` int(11) DEFAULT NULL,
  `tbo_id` int(11) DEFAULT NULL,
  `tbos_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_status`
--

LOCK TABLES `tb_order_status` WRITE;
/*!40000 ALTER TABLE `tb_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `tbp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbp_create_date` datetime DEFAULT NULL,
  `tbp_create_id` int(11) DEFAULT NULL,
  `tbp_update_date` datetime DEFAULT NULL,
  `tbp_update_id` int(11) DEFAULT NULL,
  `tbp_brand` varchar(255) DEFAULT NULL,
  `tbb_brand_id` varchar(5) DEFAULT NULL,
  `tbp_sku` varchar(255) DEFAULT NULL,
  `tbp_item` varchar(255) DEFAULT NULL,
  `tbp_code` varchar(255) DEFAULT NULL,
  `tbp_loc` varchar(255) DEFAULT NULL,
  `tbp_qty` int(11) DEFAULT NULL,
  `tbp_unit_price` decimal(20,10) DEFAULT NULL,
  `tbp_type` varchar(20) DEFAULT NULL,
  `tbp_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tbp_id`),
  KEY `tb_product_tbp_brand_index` (`tbp_brand`),
  KEY `tb_product_tbb_brand_id_index` (`tbb_brand_id`),
  KEY `tb_product_tbp_item_index` (`tbp_item`),
  KEY `tb_product_tbp_code_index` (`tbp_code`),
  KEY `tb_product_tbp_type_index` (`tbp_type`),
  KEY `tb_product_tbp_status_index` (`tbp_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_market`
--

DROP TABLE IF EXISTS `tb_product_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_market` (
  `tbpm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbpm_create_date` datetime DEFAULT NULL,
  `tbpm_create_id` int(11) DEFAULT NULL,
  `tbpm_update_date` datetime DEFAULT NULL,
  `tbpm_update_id` int(11) DEFAULT NULL,
  `tbp_id` int(11) DEFAULT NULL,
  `tbp_sku` varchar(255) DEFAULT NULL,
  `tbm_market` varchar(255) DEFAULT NULL,
  `tbm_market_check` int(11) DEFAULT NULL,
  `tbpm_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpm_id`),
  KEY `tb_product_market_tbm_market_check_index` (`tbm_market_check`),
  KEY `tb_product_market_tbm_market_index` (`tbm_market`),
  KEY `tb_product_market_tbp_id_index` (`tbp_id`),
  KEY `tb_product_market_tbp_sku_index` (`tbp_sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_market` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-17 11:08:54',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'r7ltvivy2q71mm65axwfmj6ma9q4tn6ytg5r','ADMIN');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,'2023-10-15 11:34:57',1,NULL,NULL,1,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_daily_sales`
--

DROP TABLE IF EXISTS `view_daily_sales`;
/*!50001 DROP VIEW IF EXISTS `view_daily_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_daily_sales` AS SELECT
 1 AS `uuid`,
  1 AS `tbo_create_date`,
  1 AS `count_tbo_create_date` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_order`
--

DROP TABLE IF EXISTS `view_order`;
/*!50001 DROP VIEW IF EXISTS `view_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_order` AS SELECT
 1 AS `uuid`,
  1 AS `tbo_create_date`,
  1 AS `tbo_create_id`,
  1 AS `tbo_update_date`,
  1 AS `tbo_update_id`,
  1 AS `tbo_brand`,
  1 AS `tbo_order_no`,
  1 AS `tbo_market`,
  1 AS `tbo_name`,
  1 AS `tbo_hp`,
  1 AS `tbo_full_address`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_sales`
--

DROP TABLE IF EXISTS `view_sales`;
/*!50001 DROP VIEW IF EXISTS `view_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_sales` AS SELECT
 1 AS `uuid`,
  1 AS `tbo_create_date`,
  1 AS `tbo_create_id`,
  1 AS `tbo_update_date`,
  1 AS `tbo_update_id`,
  1 AS `tbo_brand`,
  1 AS `tbo_market`,
  1 AS `tbo_order_no`,
  1 AS `tbo_sku`,
  1 AS `tbo_code`,
  1 AS `tbo_item`,
  1 AS `tbo_qty`,
  1 AS `tbo_type`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_stock`
--

DROP TABLE IF EXISTS `view_stock`;
/*!50001 DROP VIEW IF EXISTS `view_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_stock` AS SELECT
 1 AS `uuid`,
  1 AS `tbp_create_date`,
  1 AS `tbp_create_id`,
  1 AS `tbp_update_date`,
  1 AS `tbp_update_id`,
  1 AS `tbp_brand`,
  1 AS `tbp_sku`,
  1 AS `tbp_code`,
  1 AS `tbp_item`,
  1 AS `tbp_qty`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_daily_sales`
--

/*!50001 DROP VIEW IF EXISTS `view_daily_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_daily_sales` AS select uuid() AS `uuid`,cast(`tbo`.`tbo_create_date` as date) AS `tbo_create_date`,count(`tbo`.`tbo_create_date`) AS `count_tbo_create_date` from `tb_order` `tbo` where `tbo`.`tbo_create_date` >= curdate() - interval 7 day group by cast(`tbo`.`tbo_create_date` as date) order by cast(`tbo`.`tbo_create_date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_order`
--

/*!50001 DROP VIEW IF EXISTS `view_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order` AS select uuid() AS `uuid`,max(`tbo`.`tbo_create_date`) AS `tbo_create_date`,`tbo`.`tbo_create_id` AS `tbo_create_id`,`tbo`.`tbo_update_date` AS `tbo_update_date`,`tbo`.`tbo_update_id` AS `tbo_update_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_market` AS `tbo_market`,`tbo`.`tbo_name` AS `tbo_name`,`tbo`.`tbo_hp` AS `tbo_hp`,`tbo`.`tbo_full_address` AS `tbo_full_address`,`tum`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tum` on(`tum`.`tbm_market` = `tbo`.`tbo_market` and `tum`.`tbm_market_check` = 1)) where `tbo`.`tbo_market` <> 'EOD' group by `tbo`.`tbo_create_id`,`tbo`.`tbo_update_date`,`tbo`.`tbo_update_id`,`tbo`.`tbo_brand`,`tbo`.`tbo_order_no`,`tbo`.`tbo_market`,`tbo`.`tbo_name`,`tbo`.`tbo_hp`,`tbo`.`tbo_full_address`,`tum`.`tbu_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_sales`
--

/*!50001 DROP VIEW IF EXISTS `view_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_sales` AS select uuid() AS `uuid`,`tbo`.`tbo_create_date` AS `tbo_create_date`,`tbo`.`tbo_create_id` AS `tbo_create_id`,`tbo`.`tbo_update_date` AS `tbo_update_date`,`tbo`.`tbo_update_id` AS `tbo_update_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_market` AS `tbo_market`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_sku` AS `tbo_sku`,`tbo`.`tbo_code` AS `tbo_code`,`tbo`.`tbo_item` AS `tbo_item`,`tbo`.`tbo_qty` AS `tbo_qty`,`tbo`.`tbo_type` AS `tbo_type`,`tum`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tum` on(`tum`.`tbm_market` = `tbo`.`tbo_market` and `tum`.`tbm_market_check` = 1)) where `tbo`.`tbo_status` = 'Delivered' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_stock`
--

/*!50001 DROP VIEW IF EXISTS `view_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_stock` AS select uuid() AS `uuid`,`tbp`.`tbp_create_date` AS `tbp_create_date`,`tbp`.`tbp_create_id` AS `tbp_create_id`,`tbp`.`tbp_update_date` AS `tbp_update_date`,`tbp`.`tbp_update_id` AS `tbp_update_id`,`tbp`.`tbp_brand` AS `tbp_brand`,`tbp`.`tbp_sku` AS `tbp_sku`,`tbp`.`tbp_code` AS `tbp_code`,`tbp`.`tbp_item` AS `tbp_item`,`tbp`.`tbp_qty` AS `tbp_qty`,`tbub`.`tbu_id` AS `tbu_id` from (((`tb_product` `tbp` join `tb_user_brand` `tbub` on(`tbub`.`tbb_brand` = `tbp`.`tbp_brand` and `tbub`.`tbb_brand_check` = 1)) join `tb_product_market` `tpm` on(`tpm`.`tbp_id` = `tbp`.`tbp_id` and `tpm`.`tbm_market_check` = 1)) join `tb_user_market` `tum` on(`tum`.`tbm_market` = `tpm`.`tbm_market` and `tum`.`tbm_market_check` = 1 and `tum`.`tbu_id` = `tbub`.`tbu_id`)) group by `tbp`.`tbp_create_date`,`tbp`.`tbp_create_id`,`tbp`.`tbp_update_date`,`tbp`.`tbp_update_id`,`tbp`.`tbp_brand`,`tbp`.`tbp_sku`,`tbp`.`tbp_item`,`tbp`.`tbp_qty`,`tbub`.`tbu_id` */;
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

-- Dump completed on 2023-10-25  6:22:17
