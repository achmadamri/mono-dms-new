-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_order
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
INSERT INTO `tb_brand` VALUES (1,'2023-12-17 15:38:03',170,NULL,NULL,'AICEA','Aice');
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
  `tbo_market_id` varchar(255) DEFAULT NULL,
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
  `tbo_frontliner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbo_id`),
  UNIQUE KEY `tb_order_key_1` (`tbo_order_no`,`tbo_seq`,`tbo_sku`),
  KEY `tb_order_tbo_brand_index` (`tbo_brand`),
  KEY `tb_order_tbo_market_index` (`tbo_market_id`),
  KEY `tb_order_tbo_sku_index` (`tbo_sku`),
  KEY `tb_order_tbo_item_index` (`tbo_item`),
  KEY `tb_order_tbo_code_index` (`tbo_code`),
  KEY `tb_order_tbo_awb_index` (`tbo_awb`),
  KEY `tb_order_tbo_status_index` (`tbo_status`),
  KEY `tb_order_tbo_check_index` (`tbo_check`),
  KEY `tb_order_tbo_type_index` (`tbo_type`),
  KEY `tb_order_tbo_type_not_packed_index` (`tbo_type_not_packed`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,'2023-12-17 15:42:52',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/01','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','OOD054RE5JB28KS','Packed','dmfl72u0uz-3siyj88qba-sample_Order_File_aice_v3 - 1.xlsx','OK',NULL,'Order','Order','Arief'),(2,'2023-12-16 00:00:00',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/02','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','GFSQKQIXWAJ5Q2X','Packed','ihk4rlc6a2-72648h0p3j-sample_Order_File_aice_v4 - 1.xlsx','OK',NULL,'Order','Order','Arief'),(3,'2023-12-16 00:00:00',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/03','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','9BX3Q0GMZIP48WD','Packed','k1ve164jjl-o5rck4lp9e-sample_Order_File_aice_v4 - 1.xlsx','OK',NULL,'Order','Order','Arief'),(4,'2023-12-15 17:00:00',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/04','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','TDNNU07XB40TK80','Packed','3got13bp28-hpxxmd2hvf-sample_Order_File_aice_v4 - 1.xlsx','OK',NULL,'Order','Order','Arief'),(5,'2023-12-16 17:00:00',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/05','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','F8YPEU51Q9QBFDU','Packed','4b9z5jksju-qicms1t4f6-sample_Order_File_aice_v4 - 1.xlsx','OK',NULL,'Order','Order','Arief'),(6,'2023-12-16 17:00:00',171,NULL,NULL,1,'Aice','PT. AKIRA KANAIK INDAH - Ciputat',1,1,1,'1/1','INV/20231217/01/06','8885013130492','AICE Milk Stick 40g AICE牛奶支40g','NO Barcode','',1,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'TAMAN SURYA','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','S336BR3LV8RZAPA','Packed','m6klsow87l-o0xkdta82o-sample_Order_File_aice_v4 - 1.xlsx','OK',NULL,'Order','Order','Arief');
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
  `tbop_market_id` varchar(255) DEFAULT NULL,
  `tbop_order_no` varchar(255) DEFAULT NULL,
  `tbop_name` varchar(255) DEFAULT NULL,
  `tbop_notes` varchar(255) DEFAULT NULL,
  `tbop_status` varchar(255) DEFAULT NULL,
  `tbop_type` varchar(255) DEFAULT NULL,
  `tbop_frontliner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbop_id`),
  KEY `tb_order_pack_tbop_qc_id_index` (`tbop_qc_id`),
  KEY `tb_order_pack_tbop_awb_index` (`tbop_awb`),
  KEY `tb_order_pack_tbop_brand_index` (`tbop_brand`),
  KEY `tb_order_pack_tbop_market_index` (`tbop_market_id`),
  KEY `tb_order_pack_tbop_order_no_index` (`tbop_order_no`),
  KEY `tb_order_pack_tbop_status_index` (`tbop_status`),
  KEY `tb_order_pack_tbop_type_index` (`tbop_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_pack`
--

LOCK TABLES `tb_order_pack` WRITE;
/*!40000 ALTER TABLE `tb_order_pack` DISABLE KEYS */;
INSERT INTO `tb_order_pack` VALUES (1,'2023-12-17 15:42:52',171,NULL,NULL,1,'OOD054RE5JB28KS','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/01','TAMAN SURYA',NULL,'Packed','Order','Arief'),(2,'2023-12-17 16:07:01',171,NULL,NULL,1,'GFSQKQIXWAJ5Q2X','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/02','TAMAN SURYA',NULL,'Packed','Order','Arief'),(3,'2023-12-17 16:09:11',171,NULL,NULL,1,'9BX3Q0GMZIP48WD','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/03','TAMAN SURYA',NULL,'Packed','Order','Arief'),(4,'2023-12-17 16:15:13',171,NULL,NULL,1,'TDNNU07XB40TK80','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/04','TAMAN SURYA',NULL,'Packed','Order','Arief'),(5,'2023-12-17 16:15:53',171,NULL,NULL,1,'F8YPEU51Q9QBFDU','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/05','TAMAN SURYA',NULL,'Packed','Order','Arief'),(6,'2023-12-17 16:16:46',171,NULL,NULL,1,'S336BR3LV8RZAPA','Aice','PT. AKIRA KANAIK INDAH - Ciputat','INV/20231217/01/06','TAMAN SURYA',NULL,'Packed','Order','Arief');
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
  `tbopd_market_id` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_pack_detail`
--

LOCK TABLES `tb_order_pack_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_pack_detail` DISABLE KEYS */;
INSERT INTO `tb_order_pack_detail` VALUES (1,'2023-12-17 15:42:52',171,NULL,NULL,1,'Product','INV/20231217/01/01','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat'),(2,'2023-12-17 16:07:01',171,NULL,NULL,2,'Product','INV/20231217/01/02','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat'),(3,'2023-12-17 16:09:11',171,NULL,NULL,3,'Product','INV/20231217/01/03','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat'),(4,'2023-12-17 16:15:13',171,NULL,NULL,4,'Product','INV/20231217/01/04','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat'),(5,'2023-12-17 16:15:53',171,NULL,NULL,5,'Product','INV/20231217/01/05','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat'),(6,'2023-12-17 16:16:46',171,NULL,NULL,6,'Product','INV/20231217/01/06','Aice','8885013130492','NO Barcode','AICE Milk Stick 40g AICE牛奶支40g','Packed','OK',NULL,NULL,1,1,'PT. AKIRA KANAIK INDAH - Ciputat');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_status`
--

LOCK TABLES `tb_order_status` WRITE;
/*!40000 ALTER TABLE `tb_order_status` DISABLE KEYS */;
INSERT INTO `tb_order_status` VALUES (1,'2023-12-17 15:42:52',171,NULL,NULL,1,'Packed'),(2,'2023-12-17 16:07:01',171,NULL,NULL,2,'Packed'),(3,'2023-12-17 16:09:11',171,NULL,NULL,3,'Packed'),(4,'2023-12-17 16:15:13',171,NULL,NULL,4,'Packed'),(5,'2023-12-17 16:15:53',171,NULL,NULL,5,'Packed'),(6,'2023-12-17 16:16:46',171,NULL,NULL,6,'Packed');
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-12-17 15:44:29',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'92cmqemklu0wcvhqp10in2afx5m20f1xd8do','ADMIN'),(170,'2023-12-17 15:37:52',1,'2023-12-17 15:45:04',170,'aicepusat@mail.com','202cb962ac59075b964b07152d234b70','aice','pusat',NULL,NULL,NULL,'active',NULL,NULL,'r3y9hzt0ob1fcbvlseygezybn2wza7ux1avm','PRINCIPAL'),(171,'2023-12-17 15:38:58',1,'2023-12-17 15:45:01',171,'user1@mail.com','202cb962ac59075b964b07152d234b70','user','satu',NULL,NULL,NULL,'active',NULL,NULL,'mu0kjwmw76k8541ddtksxz2g38ov2ekml4n9','DISTRIBUTOR'),(172,'2023-12-17 15:39:24',1,'2023-12-17 15:44:56',1,'user2@mail.com','202cb962ac59075b964b07152d234b70','user','dua',NULL,NULL,NULL,'active',NULL,NULL,'2pp0zwztmom6tt18mbpm2fg0ib7qi4sl41jl','DISTRIBUTOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,'2023-12-17 15:38:03',170,NULL,NULL,1,'Aice','AICEA',1),(2,'2023-12-17 15:38:03',170,NULL,NULL,170,'Aice','AICEA',1),(5,'2023-12-17 15:44:47',1,NULL,NULL,171,'Aice','AICEA',1),(6,'2023-12-17 15:44:56',1,NULL,NULL,172,'Aice','AICEA',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (1,'2023-12-17 15:37:52',1,NULL,NULL,170,'AICE PUSAT',1),(2,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. BINTANG KARYA ABADI - Pangkalan Bun',1),(3,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. Bintang Prima Sejati - Palangka Raya',1),(4,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. BLUE SKY SUCCES - Padang Bukit Tinggi',1),(5,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. CITRA MANDIRI - Palu',1),(6,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. GLOBAL SUKSES BERSAMA',1),(7,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. INDO JAYA MERDEKA - Dumai',1),(8,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. Intan Aice Food',1),(9,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. MAKMUR JAYA UNGGUL - Luwuk',1),(10,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. MEKAR LESTARI - Tembilahan',1),(11,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. MULTIRASA PRIMA - Lampung',1),(12,'2023-12-17 15:37:52',1,NULL,NULL,170,'CV. Prima Pelangi Rasa',1),(13,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ABADI ICE CREAM MULTIRASA INDONESIA - Pekanbaru',1),(14,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. AKIRA KANAIK INDAH - Ciputat',1),(15,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ALL DAY ICY - Klaten',1),(16,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. AMRATYA SAMUDERA PERKASA - Sorong',1),(17,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ANEKA KARYA PRATAMA - Gorontalo',1),(18,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ARATA JAYA MANDIRI - Buah Batu',1),(19,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ARAZAAK MEGAH BERKAH - Jambi Modern Market',1),(20,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ARTA BATAM CENDANA - Batam',1),(21,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ARTA MILI AGUNG - Salatiga',1),(22,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ARTHA MANDIRI GEMERLAP - Bekasi Modern Market',1),(23,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ASCARYA SINAR KATULISTIWA - Tarakan',1),(24,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ASIA NEW WORLD BUSINESS - Kediri',1),(25,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BANJAR UTAMA ICECREAM - Banjarmasin',1),(26,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BANYUWANGI ROYAL FOOD - Banyuwangi',1),(27,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BING HAI INTERNATIONAL - Mojokerto',1),(28,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BING XUEREN INTERNATIONAL - Gresik',1),(29,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BIRU PERMATA NUSANTARA JAYA - Bengkulu',1),(30,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. BROTHER SAMUDRA SEJAHTERA - Purworejo',1),(31,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. CAHAYA BOGA DAIRYNDO - Bogor Modern Market',1),(32,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. CAKRAWALA SAMUDRA BIRU - Ternate',1),(33,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. CAPUNG MERAH NIAGA - Manado',1),(34,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. COOLING SHARE TRADING - Wonosobo',1),(35,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. DINGXIN BOGA INDONESIA - Tegal',1),(36,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. DONG FANG ZHI YIN - Pasuruan',1),(37,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. DOREMI ICE INDONESIA - Aceh',1),(38,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. FENGSHENG JAYA INDONESIA - Magelang',1),(39,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. FOUR CONTINENTAL TRADING - Jember',1),(40,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GAYARI GLOBAL PERSADA - Medan MM',1),(41,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GESNOW PENDO FOOD - Blitar',1),(42,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GLOBAL ASIA HOME WORLD - Jombang',1),(43,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GOLDEN ICE COOL - Probolinggo',1),(44,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GOLDEN ICE COOL - Probolinggo 2',1),(45,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GOLDEN SHIGOO FOODS - Subang',1),(46,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. GOOD AND NICE - Ujung Menteng',1),(47,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HAO REN FOOD - Parigi',1),(48,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HAPPY ICE CREAM - Ciamis',1),(49,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HARAPAN EMAS NUSANTARA - Yogyakarta',1),(50,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HASANAH MEGA CIPTA INDONESIA - Gowa',1),(51,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HAVE VISION LIFE - Rantau Prapat',1),(52,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HEALTHY AND DELICIOUS FOODS - Pamekasan',1),(53,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HUA TONG ICE INDONESIA - Cilacap',1),(54,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HUANG CHANG CHUN - Pematang Siantar',1),(55,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. HUI TONG GUO JII - Tulung Agung',1),(56,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ICE CREAM NUSANTARA - Jaya Pura',1),(57,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ICE CREAM YOULIKE - Daan Mogot',1),(58,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ICE DREAMER ASIA - Lamongan',1),(59,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. ICE MAJU BERSAMA - Kupang',1),(60,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. INDAH GIAT BERSAMA - Ende',1),(61,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. INDO BALI SAMUDERA - Singaraja',1),(62,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. INDO MAI GOO - Malang',1),(63,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. INDO MUTIARA GEMILANG - Kudus',1),(64,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. JANUS GLOBAL TRADE - watampone',1),(65,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. JAYA ICE FOOD - Purwokerto',1),(66,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. JUMA TIGA SEANTERO - Kabanjahe',1),(67,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. JWL NIAGA INTERNATIONAL - Cikupa Tangerang',1),(68,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. KAPUAS INTAN TRASERNA FOOD - Singkawang',1),(69,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. KERAJAAN ICE INDONESIA - Pati',1),(70,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. KORINDO SUKSES ABADI - Surabaya',1),(71,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. KOTARAJA TANOH PUSAKA - Aceh Barat',1),(72,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. LIEN MAOYI INDONESIA - Purwakarta',1),(73,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. LIFA JAYA FOOD - Singkawang',1),(74,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. LISHENG TRADING INTERNATIONAL - Bojonegoro',1),(75,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. LOMBOK MULIA TERANG - Mataram',1),(76,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. LONG ICE SUCCESS INDONESIA - Grobongan',1),(77,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Garut',1),(78,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Tasikmalaya',1),(79,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MEGA ELANG SUKSES - Sumbawa',1),(80,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MEGA LOMBOK MANDIRI - Lombok Tengah',1),(81,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MITRA PANGAN UTAMA - Kendari',1),(82,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MULTIRASA JAYA BERSAMA - Rangkas Bitung',1),(83,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. MUSI DELICIOUS FOOD - Palembang',1),(84,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. PRAKARSA INDOCIPTA NUSANTARA - Polewali',1),(85,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. PROFIT FOODS TRADING -PASAR REBO',1),(86,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. PUSAKA ABADI FOOD - Sigli',1),(87,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. QUEEN ICE ASIA - Bangkalan',1),(88,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. RAJA ACEH MAKMUR - Aceh Timur',1),(89,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. RAJAWALI ASIA BALI - Bali',1),(90,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. REALLY DELICIOUS INDONESIA - Lumajang',1),(91,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. RUI XUE INTERNATIONAL - Sidoarjo',1),(92,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SAMARINDA ANEKA FROZEN FOOD - Samarinda',1),(93,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SENANG UNTUK BERBAGI - Wonogiri',1),(94,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SENTOSA MEGA INDONESIA - Bulukumba',1),(95,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SHENGLU ZANMEI INTERNATIONAL - Kenjeran',1),(96,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SHUN FAT FOOD - Pare Pare',1),(97,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SHUN ICE PRATAMA - Cianjur',1),(98,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SHUN ICE PRATAMA - Sukabumi',1),(99,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SHUNLI ANEKA FOOD - Balikpapan',1),(100,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SINGULAR POINT ASIA - Madiun',1),(101,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SOLO GREN FOODINDO - Solo',1),(102,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. SUMBER AJI JAYA - Bau Bau',1),(103,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. TANJUNG HARAPAN NUSANTARA - Cirebon',1),(104,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. TOP ESKRIM YUMMY - Jakarta Pusat',1),(105,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. TRI UNGGUL BOGAINDO - Depok',1),(106,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. VIN MAOYI INDONESIA - Majalengka',1),(107,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. XIN YANG FOOD INDONESIA - Semarang',1),(108,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YANGS BOGA INDONESIA - Pekalongan',1),(109,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YAZHOU MEI LING - Tuban',1),(110,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YONG HONG INTERNATIONAL TRADING - Ambon',1),(111,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YONG XING ABADI JAYA - Makassar',1),(112,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YOUNG AND HEALTH INDONESIA - Palopo',1),(113,'2023-12-17 15:37:52',1,NULL,NULL,170,'PT. YOUYOU GLORY INDUSTRY - Bangka Belitung',1),(338,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. BINTANG KARYA ABADI - Pangkalan Bun',0),(339,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. Bintang Prima Sejati - Palangka Raya',0),(340,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. BLUE SKY SUCCES - Padang Bukit Tinggi',0),(341,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. CITRA MANDIRI - Palu',0),(342,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. GLOBAL SUKSES BERSAMA',0),(343,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. INDO JAYA MERDEKA - Dumai',0),(344,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. Intan Aice Food',0),(345,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. MAKMUR JAYA UNGGUL - Luwuk',0),(346,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. MEKAR LESTARI - Tembilahan',0),(347,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. MULTIRASA PRIMA - Lampung',0),(348,'2023-12-17 15:44:47',1,NULL,NULL,171,'CV. Prima Pelangi Rasa',0),(349,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ABADI ICE CREAM MULTIRASA INDONESIA - Pekanbaru',0),(350,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. AKIRA KANAIK INDAH - Ciputat',1),(351,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ALL DAY ICY - Klaten',0),(352,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. AMRATYA SAMUDERA PERKASA - Sorong',0),(353,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ANEKA KARYA PRATAMA - Gorontalo',0),(354,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ARATA JAYA MANDIRI - Buah Batu',0),(355,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ARAZAAK MEGAH BERKAH - Jambi Modern Market',0),(356,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ARTA BATAM CENDANA - Batam',0),(357,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ARTA MILI AGUNG - Salatiga',0),(358,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ARTHA MANDIRI GEMERLAP - Bekasi Modern Market',0),(359,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ASCARYA SINAR KATULISTIWA - Tarakan',0),(360,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ASIA NEW WORLD BUSINESS - Kediri',0),(361,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BANJAR UTAMA ICECREAM - Banjarmasin',0),(362,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BANYUWANGI ROYAL FOOD - Banyuwangi',0),(363,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BING HAI INTERNATIONAL - Mojokerto',0),(364,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BING XUEREN INTERNATIONAL - Gresik',0),(365,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BIRU PERMATA NUSANTARA JAYA - Bengkulu',0),(366,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. BROTHER SAMUDRA SEJAHTERA - Purworejo',0),(367,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. CAHAYA BOGA DAIRYNDO - Bogor Modern Market',0),(368,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. CAKRAWALA SAMUDRA BIRU - Ternate',0),(369,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. CAPUNG MERAH NIAGA - Manado',0),(370,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. COOLING SHARE TRADING - Wonosobo',0),(371,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. DINGXIN BOGA INDONESIA - Tegal',0),(372,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. DONG FANG ZHI YIN - Pasuruan',0),(373,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. DOREMI ICE INDONESIA - Aceh',0),(374,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. FENGSHENG JAYA INDONESIA - Magelang',0),(375,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. FOUR CONTINENTAL TRADING - Jember',0),(376,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GAYARI GLOBAL PERSADA - Medan MM',0),(377,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GESNOW PENDO FOOD - Blitar',0),(378,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GLOBAL ASIA HOME WORLD - Jombang',0),(379,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GOLDEN ICE COOL - Probolinggo',0),(380,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GOLDEN ICE COOL - Probolinggo 2',0),(381,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GOLDEN SHIGOO FOODS - Subang',0),(382,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. GOOD AND NICE - Ujung Menteng',0),(383,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HAO REN FOOD - Parigi',0),(384,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HAPPY ICE CREAM - Ciamis',0),(385,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HARAPAN EMAS NUSANTARA - Yogyakarta',0),(386,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HASANAH MEGA CIPTA INDONESIA - Gowa',0),(387,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HAVE VISION LIFE - Rantau Prapat',0),(388,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HEALTHY AND DELICIOUS FOODS - Pamekasan',0),(389,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HUA TONG ICE INDONESIA - Cilacap',0),(390,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HUANG CHANG CHUN - Pematang Siantar',0),(391,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. HUI TONG GUO JII - Tulung Agung',0),(392,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ICE CREAM NUSANTARA - Jaya Pura',0),(393,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ICE CREAM YOULIKE - Daan Mogot',0),(394,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ICE DREAMER ASIA - Lamongan',0),(395,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. ICE MAJU BERSAMA - Kupang',0),(396,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. INDAH GIAT BERSAMA - Ende',0),(397,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. INDO BALI SAMUDERA - Singaraja',0),(398,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. INDO MAI GOO - Malang',0),(399,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. INDO MUTIARA GEMILANG - Kudus',0),(400,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. JANUS GLOBAL TRADE - watampone',0),(401,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. JAYA ICE FOOD - Purwokerto',0),(402,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. JUMA TIGA SEANTERO - Kabanjahe',0),(403,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. JWL NIAGA INTERNATIONAL - Cikupa Tangerang',0),(404,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. KAPUAS INTAN TRASERNA FOOD - Singkawang',0),(405,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. KERAJAAN ICE INDONESIA - Pati',0),(406,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. KORINDO SUKSES ABADI - Surabaya',0),(407,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. KOTARAJA TANOH PUSAKA - Aceh Barat',0),(408,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. LIEN MAOYI INDONESIA - Purwakarta',0),(409,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. LIFA JAYA FOOD - Singkawang',0),(410,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. LISHENG TRADING INTERNATIONAL - Bojonegoro',0),(411,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. LOMBOK MULIA TERANG - Mataram',0),(412,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. LONG ICE SUCCESS INDONESIA - Grobongan',0),(413,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Garut',0),(414,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Tasikmalaya',0),(415,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MEGA ELANG SUKSES - Sumbawa',0),(416,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MEGA LOMBOK MANDIRI - Lombok Tengah',0),(417,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MITRA PANGAN UTAMA - Kendari',0),(418,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MULTIRASA JAYA BERSAMA - Rangkas Bitung',0),(419,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. MUSI DELICIOUS FOOD - Palembang',0),(420,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. PRAKARSA INDOCIPTA NUSANTARA - Polewali',0),(421,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. PROFIT FOODS TRADING -PASAR REBO',0),(422,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. PUSAKA ABADI FOOD - Sigli',0),(423,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. QUEEN ICE ASIA - Bangkalan',0),(424,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. RAJA ACEH MAKMUR - Aceh Timur',0),(425,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. RAJAWALI ASIA BALI - Bali',0),(426,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. REALLY DELICIOUS INDONESIA - Lumajang',0),(427,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. RUI XUE INTERNATIONAL - Sidoarjo',0),(428,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SAMARINDA ANEKA FROZEN FOOD - Samarinda',0),(429,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SENANG UNTUK BERBAGI - Wonogiri',0),(430,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SENTOSA MEGA INDONESIA - Bulukumba',0),(431,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SHENGLU ZANMEI INTERNATIONAL - Kenjeran',0),(432,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SHUN FAT FOOD - Pare Pare',0),(433,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SHUN ICE PRATAMA - Cianjur',0),(434,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SHUN ICE PRATAMA - Sukabumi',0),(435,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SHUNLI ANEKA FOOD - Balikpapan',0),(436,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SINGULAR POINT ASIA - Madiun',0),(437,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SOLO GREN FOODINDO - Solo',0),(438,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. SUMBER AJI JAYA - Bau Bau',0),(439,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. TANJUNG HARAPAN NUSANTARA - Cirebon',0),(440,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. TOP ESKRIM YUMMY - Jakarta Pusat',0),(441,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. TRI UNGGUL BOGAINDO - Depok',0),(442,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. VIN MAOYI INDONESIA - Majalengka',0),(443,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. XIN YANG FOOD INDONESIA - Semarang',0),(444,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YANGS BOGA INDONESIA - Pekalongan',0),(445,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YAZHOU MEI LING - Tuban',0),(446,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YONG HONG INTERNATIONAL TRADING - Ambon',0),(447,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YONG XING ABADI JAYA - Makassar',0),(448,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YOUNG AND HEALTH INDONESIA - Palopo',0),(449,'2023-12-17 15:44:47',1,NULL,NULL,171,'PT. YOUYOU GLORY INDUSTRY - Bangka Belitung',0),(450,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. BINTANG KARYA ABADI - Pangkalan Bun',0),(451,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. Bintang Prima Sejati - Palangka Raya',0),(452,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. BLUE SKY SUCCES - Padang Bukit Tinggi',0),(453,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. CITRA MANDIRI - Palu',0),(454,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. GLOBAL SUKSES BERSAMA',0),(455,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. INDO JAYA MERDEKA - Dumai',0),(456,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. Intan Aice Food',0),(457,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. MAKMUR JAYA UNGGUL - Luwuk',0),(458,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. MEKAR LESTARI - Tembilahan',0),(459,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. MULTIRASA PRIMA - Lampung',0),(460,'2023-12-17 15:44:56',1,NULL,NULL,172,'CV. Prima Pelangi Rasa',0),(461,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ABADI ICE CREAM MULTIRASA INDONESIA - Pekanbaru',0),(462,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. AKIRA KANAIK INDAH - Ciputat',0),(463,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ALL DAY ICY - Klaten',0),(464,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. AMRATYA SAMUDERA PERKASA - Sorong',0),(465,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ANEKA KARYA PRATAMA - Gorontalo',0),(466,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ARATA JAYA MANDIRI - Buah Batu',0),(467,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ARAZAAK MEGAH BERKAH - Jambi Modern Market',0),(468,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ARTA BATAM CENDANA - Batam',0),(469,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ARTA MILI AGUNG - Salatiga',0),(470,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ARTHA MANDIRI GEMERLAP - Bekasi Modern Market',0),(471,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ASCARYA SINAR KATULISTIWA - Tarakan',0),(472,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ASIA NEW WORLD BUSINESS - Kediri',0),(473,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BANJAR UTAMA ICECREAM - Banjarmasin',0),(474,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BANYUWANGI ROYAL FOOD - Banyuwangi',0),(475,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BING HAI INTERNATIONAL - Mojokerto',0),(476,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BING XUEREN INTERNATIONAL - Gresik',0),(477,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BIRU PERMATA NUSANTARA JAYA - Bengkulu',0),(478,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. BROTHER SAMUDRA SEJAHTERA - Purworejo',0),(479,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. CAHAYA BOGA DAIRYNDO - Bogor Modern Market',0),(480,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. CAKRAWALA SAMUDRA BIRU - Ternate',0),(481,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. CAPUNG MERAH NIAGA - Manado',0),(482,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. COOLING SHARE TRADING - Wonosobo',0),(483,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. DINGXIN BOGA INDONESIA - Tegal',0),(484,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. DONG FANG ZHI YIN - Pasuruan',0),(485,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. DOREMI ICE INDONESIA - Aceh',0),(486,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. FENGSHENG JAYA INDONESIA - Magelang',0),(487,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. FOUR CONTINENTAL TRADING - Jember',0),(488,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GAYARI GLOBAL PERSADA - Medan MM',0),(489,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GESNOW PENDO FOOD - Blitar',0),(490,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GLOBAL ASIA HOME WORLD - Jombang',0),(491,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GOLDEN ICE COOL - Probolinggo',0),(492,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GOLDEN ICE COOL - Probolinggo 2',0),(493,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GOLDEN SHIGOO FOODS - Subang',0),(494,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. GOOD AND NICE - Ujung Menteng',0),(495,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HAO REN FOOD - Parigi',0),(496,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HAPPY ICE CREAM - Ciamis',0),(497,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HARAPAN EMAS NUSANTARA - Yogyakarta',0),(498,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HASANAH MEGA CIPTA INDONESIA - Gowa',0),(499,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HAVE VISION LIFE - Rantau Prapat',0),(500,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HEALTHY AND DELICIOUS FOODS - Pamekasan',0),(501,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HUA TONG ICE INDONESIA - Cilacap',0),(502,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HUANG CHANG CHUN - Pematang Siantar',0),(503,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. HUI TONG GUO JII - Tulung Agung',0),(504,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ICE CREAM NUSANTARA - Jaya Pura',0),(505,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ICE CREAM YOULIKE - Daan Mogot',1),(506,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ICE DREAMER ASIA - Lamongan',0),(507,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. ICE MAJU BERSAMA - Kupang',0),(508,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. INDAH GIAT BERSAMA - Ende',0),(509,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. INDO BALI SAMUDERA - Singaraja',0),(510,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. INDO MAI GOO - Malang',0),(511,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. INDO MUTIARA GEMILANG - Kudus',0),(512,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. JANUS GLOBAL TRADE - watampone',0),(513,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. JAYA ICE FOOD - Purwokerto',0),(514,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. JUMA TIGA SEANTERO - Kabanjahe',0),(515,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. JWL NIAGA INTERNATIONAL - Cikupa Tangerang',0),(516,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. KAPUAS INTAN TRASERNA FOOD - Singkawang',0),(517,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. KERAJAAN ICE INDONESIA - Pati',0),(518,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. KORINDO SUKSES ABADI - Surabaya',0),(519,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. KOTARAJA TANOH PUSAKA - Aceh Barat',0),(520,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. LIEN MAOYI INDONESIA - Purwakarta',0),(521,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. LIFA JAYA FOOD - Singkawang',0),(522,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. LISHENG TRADING INTERNATIONAL - Bojonegoro',0),(523,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. LOMBOK MULIA TERANG - Mataram',0),(524,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. LONG ICE SUCCESS INDONESIA - Grobongan',0),(525,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Garut',0),(526,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MAKMUR SUKSES ABADI BERSAMA INDONESIA - Tasikmalaya',0),(527,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MEGA ELANG SUKSES - Sumbawa',0),(528,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MEGA LOMBOK MANDIRI - Lombok Tengah',0),(529,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MITRA PANGAN UTAMA - Kendari',0),(530,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MULTIRASA JAYA BERSAMA - Rangkas Bitung',0),(531,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. MUSI DELICIOUS FOOD - Palembang',0),(532,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. PRAKARSA INDOCIPTA NUSANTARA - Polewali',0),(533,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. PROFIT FOODS TRADING -PASAR REBO',0),(534,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. PUSAKA ABADI FOOD - Sigli',0),(535,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. QUEEN ICE ASIA - Bangkalan',0),(536,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. RAJA ACEH MAKMUR - Aceh Timur',0),(537,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. RAJAWALI ASIA BALI - Bali',0),(538,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. REALLY DELICIOUS INDONESIA - Lumajang',0),(539,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. RUI XUE INTERNATIONAL - Sidoarjo',0),(540,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SAMARINDA ANEKA FROZEN FOOD - Samarinda',0),(541,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SENANG UNTUK BERBAGI - Wonogiri',0),(542,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SENTOSA MEGA INDONESIA - Bulukumba',0),(543,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SHENGLU ZANMEI INTERNATIONAL - Kenjeran',0),(544,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SHUN FAT FOOD - Pare Pare',0),(545,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SHUN ICE PRATAMA - Cianjur',0),(546,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SHUN ICE PRATAMA - Sukabumi',0),(547,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SHUNLI ANEKA FOOD - Balikpapan',0),(548,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SINGULAR POINT ASIA - Madiun',0),(549,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SOLO GREN FOODINDO - Solo',0),(550,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. SUMBER AJI JAYA - Bau Bau',0),(551,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. TANJUNG HARAPAN NUSANTARA - Cirebon',0),(552,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. TOP ESKRIM YUMMY - Jakarta Pusat',0),(553,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. TRI UNGGUL BOGAINDO - Depok',0),(554,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. VIN MAOYI INDONESIA - Majalengka',0),(555,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. XIN YANG FOOD INDONESIA - Semarang',0),(556,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YANGS BOGA INDONESIA - Pekalongan',0),(557,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YAZHOU MEI LING - Tuban',0),(558,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YONG HONG INTERNATIONAL TRADING - Ambon',0),(559,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YONG XING ABADI JAYA - Makassar',0),(560,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YOUNG AND HEALTH INDONESIA - Palopo',0),(561,'2023-12-17 15:44:56',1,NULL,NULL,172,'PT. YOUYOU GLORY INDUSTRY - Bangka Belitung',0);
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
  1 AS `market_id`,
  1 AS `frontliner`,
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
  1 AS `tbo_market_id`,
  1 AS `tbo_frontliner`,
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
/*!50001 VIEW `view_order_confirm` AS select uuid() AS `uuid`,`tttt1`.`create_date` AS `create_date`,`tttt1`.`tbo_id` AS `tbo_id`,`tttt1`.`awb` AS `awb`,`tttt1`.`packing_pic` AS `packing_pic`,`tttt1`.`order_no` AS `order_no`,`tttt1`.`sku` AS `sku`,`tttt1`.`code` AS `code`,`tttt1`.`item` AS `item`,`tttt1`.`status` AS `status`,`tttt1`.`order_qty` AS `order_qty`,`tttt1`.`pack_qty` AS `pack_qty`,`tttt1`.`brand` AS `brand`,`tttt1`.`market_id` AS `market_id`,`tttt1`.`frontliner` AS `frontliner`,`tttt1`.`type` AS `type`,`tttt1`.`type_not_packed` AS `type_not_packed`,`tttt2`.`tbu_id` AS `tbu_id` from ((select `ttt1`.`create_date` AS `create_date`,`ttt1`.`tbo_id` AS `tbo_id`,`ttt1`.`awb` AS `awb`,`ttt1`.`packing_pic` AS `packing_pic`,`ttt1`.`order_no` AS `order_no`,`ttt1`.`sku` AS `sku`,`ttt1`.`code` AS `code`,`ttt1`.`item` AS `item`,`ttt1`.`status` AS `status`,`ttt1`.`order_qty` AS `order_qty`,`ttt1`.`pack_qty` AS `pack_qty`,`ttt1`.`brand` AS `brand`,`ttt1`.`market_id` AS `market_id`,`ttt1`.`frontliner` AS `frontliner`,`ttt1`.`type` AS `type`,`ttt1`.`type_not_packed` AS `type_not_packed` from (select `tt1`.`create_date` AS `create_date`,`tt1`.`tbo_id` AS `tbo_id`,`tt1`.`awb` AS `awb`,`tt1`.`packing_pic` AS `packing_pic`,`tt1`.`order_no` AS `order_no`,`tt1`.`sku` AS `sku`,`tt1`.`code` AS `code`,`tt1`.`item` AS `item`,`tt1`.`status` AS `status`,`tt1`.`order_qty` AS `order_qty`,`tt1`.`pack_qty` AS `pack_qty`,`tt1`.`brand` AS `brand`,`tt1`.`market_id` AS `market_id`,`tt1`.`frontliner` AS `frontliner`,`tt1`.`type` AS `type`,`tt1`.`type_not_packed` AS `type_not_packed` from (select `t1`.`tbo_create_date` AS `create_date`,`t1`.`tbo_id` AS `tbo_id`,`t1`.`tbo_awb` AS `awb`,NULL AS `packing_pic`,`t1`.`tbo_order_no` AS `order_no`,`t1`.`tbo_sku` AS `sku`,`t1`.`tbo_code` AS `code`,`t2`.`tbopd_sku` AS `t2_sku`,`t1`.`tbo_item` AS `item`,`t1`.`tbo_status` AS `status`,`t1`.`tbo_qty` AS `order_qty`,0 AS `pack_qty`,`t1`.`tbo_brand` AS `brand`,`t1`.`tbo_market_id` AS `market_id`,`t1`.`tbo_frontliner` AS `frontliner`,`t1`.`tbo_type` AS `type`,`t1`.`tbo_type_not_packed` AS `type_not_packed` from (`tb_order` `t1` left join `tb_order_pack_detail` `t2` on(`t2`.`tbopd_order_no` = `t1`.`tbo_order_no` and `t2`.`tbopd_sku` = `t1`.`tbo_sku`))) `tt1` where `tt1`.`t2_sku` is null group by `tt1`.`create_date`,`tt1`.`awb`,`tt1`.`packing_pic`,`tt1`.`order_no`,`tt1`.`sku`,`tt1`.`item`,`tt1`.`status`,`tt1`.`order_qty`,`tt1`.`pack_qty`,`tt1`.`brand`,`tt1`.`market_id`,`tt1`.`frontliner`,`tt1`.`type`,`tt1`.`type_not_packed` union select `tt2`.`create_date` AS `create_date`,`tt2`.`tbo_id` AS `tbo_id`,`tt2`.`awb` AS `awb`,`tt2`.`packing_pic` AS `packing_pic`,`tt2`.`order_no` AS `order_no`,`tt2`.`sku` AS `sku`,`tt2`.`code` AS `code`,`tt2`.`item` AS `item`,`tt2`.`status` AS `status`,`tt2`.`order_qty` AS `order_qty`,`tt2`.`pack_qty` AS `pack_qty`,`tt2`.`brand` AS `brand`,`tt2`.`market_id` AS `market_id`,`tt2`.`frontliner` AS `frontliner`,`tt2`.`type` AS `type`,`tt2`.`type_not_packed` AS `type_not_packed` from (select `t1`.`tbop_create_date` AS `create_date`,`t4`.`tbo_id` AS `tbo_id`,`t1`.`tbop_awb` AS `awb`,`t3`.`tbu_email` AS `packing_pic`,`t2`.`tbopd_order_no` AS `order_no`,`t2`.`tbopd_sku` AS `sku`,`t2`.`tbopd_code` AS `code`,`t2`.`tbopd_item` AS `item`,`t2`.`tbopd_status` AS `status`,coalesce(`t4`.`tbo_qty`,0) AS `order_qty`,coalesce(`t2`.`tbopd_qty_pack`,0) AS `pack_qty`,`t1`.`tbop_brand` AS `brand`,`t1`.`tbop_market_id` AS `market_id`,`t1`.`tbop_frontliner` AS `frontliner`,`t1`.`tbop_type` AS `type`,`t2`.`tbopd_type_not_packed` AS `type_not_packed` from (((`tb_order_pack` `t1` join `tb_order_pack_detail` `t2` on(`t2`.`tbopd_order_no` = `t1`.`tbop_order_no`)) join `tb_user` `t3` on(`t3`.`tbu_id` = `t2`.`tbopd_create_id`)) left join `tb_order` `t4` on(`t4`.`tbo_order_no` = `t2`.`tbopd_order_no` and `t4`.`tbo_sku` = `t2`.`tbopd_sku`))) `tt2` group by `tt2`.`create_date`,`tt2`.`awb`,`tt2`.`packing_pic`,`tt2`.`order_no`,`tt2`.`sku`,`tt2`.`item`,`tt2`.`status`,`tt2`.`order_qty`,`tt2`.`pack_qty`,`tt2`.`brand`,`tt2`.`market_id`,`tt2`.`frontliner`,`tt2`.`type`,`tt2`.`type_not_packed`) `ttt1`) `tttt1` join `tb_user_brand` `tttt2` on(`tttt2`.`tbb_brand` = `tttt1`.`brand` and `tttt2`.`tbb_brand_check` = 1)) */;
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
/*!50001 VIEW `view_order_pack` AS select uuid() AS `uuid`,`tbo`.`tbo_awb` AS `tbo_awb`,`tbo`.`tbo_qc_id` AS `tbo_qc_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_market_id` AS `tbo_market_id`,`tbo`.`tbo_frontliner` AS `tbo_frontliner`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_name` AS `tbo_name`,`tbm`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tbm` on(`tbm`.`tbm_market_id` = `tbo`.`tbo_market_id` and `tbm`.`tbm_market_check` = 1)) where `tbo`.`tbo_brand`  not like '%_EOD' group by `tbo`.`tbo_awb`,`tbo`.`tbo_qc_id`,`tbo`.`tbo_brand`,`tbo`.`tbo_market_id`,`tbo`.`tbo_frontliner`,`tbo`.`tbo_order_no`,`tbo`.`tbo_name`,`tbm`.`tbu_id` */;
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

-- Dump completed on 2023-12-17 23:17:50
