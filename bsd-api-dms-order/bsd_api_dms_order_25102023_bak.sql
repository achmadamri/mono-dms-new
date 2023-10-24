-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_order_bak
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
  KEY `tb_brand_tbb_brand_id_index` (`tbb_brand_id`),
  KEY `tb_brand_tbb_brand_index` (`tbb_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_brand`
--

LOCK TABLES `tb_brand` WRITE;
/*!40000 ALTER TABLE `tb_brand` DISABLE KEYS */;
INSERT INTO `tb_brand` VALUES (1,'2023-10-15 11:34:57',1,NULL,NULL,'MAMAS','Mamasuka');
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
  UNIQUE KEY `tb_order_key_1` (`tbo_order_no`,`tbo_seq`,`tbo_sku`),
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
-- Table structure for table `tb_order_pack`
--

DROP TABLE IF EXISTS `tb_order_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_pack` (
  `tbop_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbop_create_date` datetime DEFAULT NULL,
  `tbop_create_id` int(11) DEFAULT NULL,
  `tbop_update_date` datetime DEFAULT NULL,
  `tbop_update_id` int(11) DEFAULT NULL,
  `tbop_qc_id` int(11) DEFAULT NULL,
  `tbop_awb` varchar(255) DEFAULT NULL,
  `tbop_brand` varchar(255) DEFAULT NULL,
  `tbop_market` varchar(255) DEFAULT NULL,
  `tbop_order_no` varchar(255) DEFAULT NULL,
  `tbop_name` varchar(255) DEFAULT NULL,
  `tbop_notes` varchar(255) DEFAULT NULL,
  `tbop_status` varchar(255) DEFAULT NULL,
  `tbop_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbop_id`),
  KEY `tb_order_pack_tbop_qc_id_index` (`tbop_qc_id`),
  KEY `tb_order_pack_tbop_awb_index` (`tbop_awb`),
  KEY `tb_order_pack_tbop_brand_index` (`tbop_brand`),
  KEY `tb_order_pack_tbop_market_index` (`tbop_market`),
  KEY `tb_order_pack_tbop_order_no_index` (`tbop_order_no`),
  KEY `tb_order_pack_tbop_status_index` (`tbop_status`),
  KEY `tb_order_pack_tbop_type_index` (`tbop_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_pack`
--

LOCK TABLES `tb_order_pack` WRITE;
/*!40000 ALTER TABLE `tb_order_pack` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_pack_detail`
--

DROP TABLE IF EXISTS `tb_order_pack_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_pack_detail` (
  `tbopd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbopd_create_date` datetime DEFAULT NULL,
  `tbopd_create_id` int(11) DEFAULT NULL,
  `tbopd_update_date` datetime DEFAULT NULL,
  `tbopd_update_id` int(11) DEFAULT NULL,
  `tbop_id` int(11) DEFAULT NULL,
  `tbopd_type` varchar(255) DEFAULT NULL,
  `tbopd_order_no` varchar(255) DEFAULT NULL,
  `tbopd_brand` varchar(255) DEFAULT NULL,
  `tbopd_sku` varchar(255) DEFAULT NULL,
  `tbopd_code` varchar(255) DEFAULT NULL,
  `tbopd_item` varchar(255) DEFAULT NULL,
  `tbopd_status` varchar(255) DEFAULT NULL,
  `tbopd_check` varchar(255) DEFAULT NULL,
  `tbopd_sku_additional` varchar(255) DEFAULT NULL,
  `tbopd_type_not_packed` varchar(255) DEFAULT NULL,
  `tbopd_qty` int(11) DEFAULT NULL,
  `tbopd_qty_pack` int(11) DEFAULT NULL,
  `tbopd_market` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbopd_id`),
  KEY `tb_order_pack_detail_tbop_id_index` (`tbop_id`),
  KEY `tb_order_pack_detail_tbopd_type_index` (`tbopd_type`),
  KEY `tb_order_pack_detail_tbopd_order_no_index` (`tbopd_order_no`),
  KEY `tb_order_pack_detail_tbopd_brand_index` (`tbopd_brand`),
  KEY `tb_order_pack_detail_tbopd_sku_index` (`tbopd_sku`),
  KEY `tb_order_pack_detail_tbopd_code_index` (`tbopd_code`),
  KEY `tb_order_pack_detail_tbopd_item_index` (`tbopd_item`),
  KEY `tb_order_pack_detail_tbopd_status_index` (`tbopd_status`),
  KEY `tb_order_pack_detail_tbopd_check_index` (`tbopd_check`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_pack_detail`
--

LOCK TABLES `tb_order_pack_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_pack_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_pack_detail` ENABLE KEYS */;
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
-- Temporary table structure for view `view_order_confirm`
--

DROP TABLE IF EXISTS `view_order_confirm`;
/*!50001 DROP VIEW IF EXISTS `view_order_confirm`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_order_confirm` AS SELECT
 1 AS `uuid`,
  1 AS `create_date`,
  1 AS `tbo_id`,
  1 AS `awb`,
  1 AS `packing_pic`,
  1 AS `order_no`,
  1 AS `sku`,
  1 AS `code`,
  1 AS `item`,
  1 AS `status`,
  1 AS `order_qty`,
  1 AS `pack_qty`,
  1 AS `brand`,
  1 AS `market`,
  1 AS `type`,
  1 AS `type_not_packed`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_order_pack`
--

DROP TABLE IF EXISTS `view_order_pack`;
/*!50001 DROP VIEW IF EXISTS `view_order_pack`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_order_pack` AS SELECT
 1 AS `uuid`,
  1 AS `tbo_awb`,
  1 AS `tbo_qc_id`,
  1 AS `tbo_brand`,
  1 AS `tbo_market`,
  1 AS `tbo_order_no`,
  1 AS `tbo_name`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_order_confirm`
--

/*!50001 DROP VIEW IF EXISTS `view_order_confirm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order_confirm` AS select uuid() AS `uuid`,`tttt1`.`create_date` AS `create_date`,`tttt1`.`tbo_id` AS `tbo_id`,`tttt1`.`awb` AS `awb`,`tttt1`.`packing_pic` AS `packing_pic`,`tttt1`.`order_no` AS `order_no`,`tttt1`.`sku` AS `sku`,`tttt1`.`code` AS `code`,`tttt1`.`item` AS `item`,`tttt1`.`status` AS `status`,`tttt1`.`order_qty` AS `order_qty`,`tttt1`.`pack_qty` AS `pack_qty`,`tttt1`.`brand` AS `brand`,`tttt1`.`market` AS `market`,`tttt1`.`type` AS `type`,`tttt1`.`type_not_packed` AS `type_not_packed`,`tttt2`.`tbu_id` AS `tbu_id` from ((select `ttt1`.`create_date` AS `create_date`,`ttt1`.`tbo_id` AS `tbo_id`,`ttt1`.`awb` AS `awb`,`ttt1`.`packing_pic` AS `packing_pic`,`ttt1`.`order_no` AS `order_no`,`ttt1`.`sku` AS `sku`,`ttt1`.`code` AS `code`,`ttt1`.`item` AS `item`,`ttt1`.`status` AS `status`,`ttt1`.`order_qty` AS `order_qty`,`ttt1`.`pack_qty` AS `pack_qty`,`ttt1`.`brand` AS `brand`,`ttt1`.`market` AS `market`,`ttt1`.`type` AS `type`,`ttt1`.`type_not_packed` AS `type_not_packed` from (select `tt1`.`create_date` AS `create_date`,`tt1`.`tbo_id` AS `tbo_id`,`tt1`.`awb` AS `awb`,`tt1`.`packing_pic` AS `packing_pic`,`tt1`.`order_no` AS `order_no`,`tt1`.`sku` AS `sku`,`tt1`.`code` AS `code`,`tt1`.`item` AS `item`,`tt1`.`status` AS `status`,`tt1`.`order_qty` AS `order_qty`,`tt1`.`pack_qty` AS `pack_qty`,`tt1`.`brand` AS `brand`,`tt1`.`market` AS `market`,`tt1`.`type` AS `type`,`tt1`.`type_not_packed` AS `type_not_packed` from (select `t1`.`tbo_create_date` AS `create_date`,`t1`.`tbo_id` AS `tbo_id`,`t1`.`tbo_awb` AS `awb`,NULL AS `packing_pic`,`t1`.`tbo_order_no` AS `order_no`,`t1`.`tbo_sku` AS `sku`,`t1`.`tbo_code` AS `code`,`t2`.`tbopd_sku` AS `t2_sku`,`t1`.`tbo_item` AS `item`,`t1`.`tbo_status` AS `status`,`t1`.`tbo_qty` AS `order_qty`,0 AS `pack_qty`,`t1`.`tbo_brand` AS `brand`,`t1`.`tbo_market` AS `market`,`t1`.`tbo_type` AS `type`,`t1`.`tbo_type_not_packed` AS `type_not_packed` from (`tb_order` `t1` left join `tb_order_pack_detail` `t2` on(`t2`.`tbopd_order_no` = `t1`.`tbo_order_no` and `t2`.`tbopd_sku` = `t1`.`tbo_sku`))) `tt1` where `tt1`.`t2_sku` is null group by `tt1`.`create_date`,`tt1`.`awb`,`tt1`.`packing_pic`,`tt1`.`order_no`,`tt1`.`sku`,`tt1`.`item`,`tt1`.`status`,`tt1`.`order_qty`,`tt1`.`pack_qty`,`tt1`.`brand`,`tt1`.`market`,`tt1`.`type`,`tt1`.`type_not_packed` union select `tt2`.`create_date` AS `create_date`,`tt2`.`tbo_id` AS `tbo_id`,`tt2`.`awb` AS `awb`,`tt2`.`packing_pic` AS `packing_pic`,`tt2`.`order_no` AS `order_no`,`tt2`.`sku` AS `sku`,`tt2`.`code` AS `code`,`tt2`.`item` AS `item`,`tt2`.`status` AS `status`,`tt2`.`order_qty` AS `order_qty`,`tt2`.`pack_qty` AS `pack_qty`,`tt2`.`brand` AS `brand`,`tt2`.`market` AS `market`,`tt2`.`type` AS `type`,`tt2`.`type_not_packed` AS `type_not_packed` from (select `t1`.`tbop_create_date` AS `create_date`,`t4`.`tbo_id` AS `tbo_id`,`t1`.`tbop_awb` AS `awb`,`t3`.`tbu_email` AS `packing_pic`,`t2`.`tbopd_order_no` AS `order_no`,`t2`.`tbopd_sku` AS `sku`,`t2`.`tbopd_code` AS `code`,`t2`.`tbopd_item` AS `item`,`t2`.`tbopd_status` AS `status`,coalesce(`t4`.`tbo_qty`,0) AS `order_qty`,coalesce(`t2`.`tbopd_qty_pack`,0) AS `pack_qty`,`t1`.`tbop_brand` AS `brand`,`t1`.`tbop_market` AS `market`,`t1`.`tbop_type` AS `type`,`t2`.`tbopd_type_not_packed` AS `type_not_packed` from (((`tb_order_pack` `t1` join `tb_order_pack_detail` `t2` on(`t2`.`tbopd_order_no` = `t1`.`tbop_order_no`)) join `tb_user` `t3` on(`t3`.`tbu_id` = `t2`.`tbopd_create_id`)) left join `tb_order` `t4` on(`t4`.`tbo_order_no` = `t2`.`tbopd_order_no` and `t4`.`tbo_sku` = `t2`.`tbopd_sku`))) `tt2` group by `tt2`.`create_date`,`tt2`.`awb`,`tt2`.`packing_pic`,`tt2`.`order_no`,`tt2`.`sku`,`tt2`.`item`,`tt2`.`status`,`tt2`.`order_qty`,`tt2`.`pack_qty`,`tt2`.`brand`,`tt2`.`market`,`tt2`.`type`,`tt2`.`type_not_packed`) `ttt1`) `tttt1` join `tb_user_brand` `tttt2` on(`tttt2`.`tbb_brand` = `tttt1`.`brand` and `tttt2`.`tbb_brand_check` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_order_pack`
--

/*!50001 DROP VIEW IF EXISTS `view_order_pack`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order_pack` AS select uuid() AS `uuid`,`tbo`.`tbo_awb` AS `tbo_awb`,`tbo`.`tbo_qc_id` AS `tbo_qc_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_market` AS `tbo_market`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_name` AS `tbo_name`,`tbm`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tbm` on(`tbm`.`tbm_market` = `tbo`.`tbo_market` and `tbm`.`tbm_market_check` = 1)) where `tbo`.`tbo_brand`  not like '%_EOD' group by `tbo`.`tbo_awb`,`tbo`.`tbo_qc_id`,`tbo`.`tbo_brand`,`tbo`.`tbo_market`,`tbo`.`tbo_order_no`,`tbo`.`tbo_name`,`tbm`.`tbu_id` */;
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

-- Dump completed on 2023-10-25  6:22:16
