-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_product
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
-- Table structure for table `tb_gwp`
--

DROP TABLE IF EXISTS `tb_gwp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gwp` (
  `tbg_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbg_create_date` datetime DEFAULT NULL,
  `tbg_create_id` int(11) DEFAULT NULL,
  `tbg_update_date` datetime DEFAULT NULL,
  `tbg_update_id` int(11) DEFAULT NULL,
  `tbg_sku` varchar(255) DEFAULT NULL,
  `tbg_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tbg_id`),
  UNIQUE KEY `tb_gwp_tbg_sku` (`tbg_sku`),
  KEY `tb_gwp_tbg_status_index` (`tbg_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gwp`
--

LOCK TABLES `tb_gwp` WRITE;
/*!40000 ALTER TABLE `tb_gwp` DISABLE KEYS */;
INSERT INTO `tb_gwp` VALUES (1,'2023-10-15 11:22:37',1,NULL,NULL,'001','active'),(2,'2023-10-15 11:35:39',1,'2023-10-15 13:47:10',1,'01','active');
/*!40000 ALTER TABLE `tb_gwp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gwp_sku`
--

DROP TABLE IF EXISTS `tb_gwp_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gwp_sku` (
  `tbgs_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbgs_create_date` datetime DEFAULT NULL,
  `tbgs_create_id` int(11) DEFAULT NULL,
  `tbgs_update_date` datetime DEFAULT NULL,
  `tbgs_update_id` int(11) DEFAULT NULL,
  `tbg_id` int(11) DEFAULT NULL,
  `tbgs_sku` varchar(255) DEFAULT NULL,
  `tbgs_min` decimal(20,10) DEFAULT NULL,
  `tbgs_min_accu` decimal(20,10) DEFAULT NULL,
  `tbgs_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbgs_id`),
  UNIQUE KEY `tb_gwp_sku_tbg_id_tbgs_sku` (`tbg_id`,`tbgs_sku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gwp_sku`
--

LOCK TABLES `tb_gwp_sku` WRITE;
/*!40000 ALTER TABLE `tb_gwp_sku` DISABLE KEYS */;
INSERT INTO `tb_gwp_sku` VALUES (1,'2023-10-15 11:22:37',1,NULL,NULL,1,'4.140402.016',1.0000000000,1.0000000000,1),(5,'2023-10-15 13:47:10',1,NULL,NULL,2,'4.140402.016',1.0000000000,1.0000000000,1);
/*!40000 ALTER TABLE `tb_gwp_sku` ENABLE KEYS */;
UNLOCK TABLES;

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
  `tbm_market` varchar(255) DEFAULT NULL,
  `tbm_parent_id` int(11) DEFAULT NULL,
  `tbm_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbm_id`),
  KEY `tb_market_tbm_market_index` (`tbm_market`),
  KEY `tb_market_tbm_parent_id_index` (`tbm_parent_id`),
  KEY `tb_market_tbm_role_index` (`tbm_role`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_market`
--

LOCK TABLES `tb_market` WRITE;
/*!40000 ALTER TABLE `tb_market` DISABLE KEYS */;
INSERT INTO `tb_market` VALUES (1,'2023-10-18 13:38:30',1,NULL,NULL,'Subdist A',NULL,'SUBDIST');
/*!40000 ALTER TABLE `tb_market` ENABLE KEYS */;
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
  UNIQUE KEY `tb_product_tbp_sku` (`tbp_sku`),
  KEY `tb_product_tbp_brand_index` (`tbp_brand`),
  KEY `tb_product_tbb_brand_id_index` (`tbb_brand_id`),
  KEY `tb_product_tbp_item_index` (`tbp_item`),
  KEY `tb_product_tbp_code_index` (`tbp_code`),
  KEY `tb_product_tbp_type_index` (`tbp_type`),
  KEY `tb_product_tbp_status_index` (`tbp_status`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'2023-10-18 13:39:00',11,'2023-10-25 00:34:14',11,'Mamasuka','MAMAS','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','0',10,1000.0000000000,'Sellable','Sellable'),(2,'2023-10-18 13:39:00',11,'2023-10-24 13:42:50',11,'Mamasuka','MAMAS','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','0',14,1000.0000000000,'Sellable','Sellable'),(3,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(4,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(5,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(6,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(7,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','Skunew003','Lemonilo Ramen Jepang','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(8,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(9,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(10,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(11,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(12,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(13,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','cassamo001','Cassamo Smoky BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(14,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','cassamo002','Cassamo Spicy BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(15,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','nealamami004','Alamami Ayam Goreng Kremes 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(16,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newalamami005','Alamami Nasi Goreng 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(17,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newalamami003','Alamami Rendang 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(18,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newgorme003','Gorme Rasa Kaldu Ayam Kampung 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(19,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newgorme002','Gorme Rasa Kaldu Jamur 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(20,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newgorme001','Gorme Rasa Kaldu Sapi 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(21,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','skunew004','Lemonilo chimi karamel mentega 50gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(22,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','solafarm002','Solafarm Beef Steak 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(23,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','salafarm001','Solafarm Seaweed 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(24,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','All Produk','All Produk','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(25,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newalamami001','Alamami Ayam Lengkuas 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(26,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','newalamami002','Alamami Opor Ayam 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(27,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','skunew001','Lemonilo Michoco 4 x 30 Gram','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(28,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140402.022','Mie Kering 114Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(29,'2023-10-18 13:39:00',11,NULL,NULL,'Mamasuka','MAMAS','4.140901.032','Lemonilo Kanilo Kacang Panggang125Grx14','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(30,'2023-10-18 13:39:34',11,NULL,NULL,'Mamasuka','MAMAS','01','Mie Kering 100gr','01','0',1,1000.0000000000,'Gwp','Sellable');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_bundle`
--

DROP TABLE IF EXISTS `tb_product_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_bundle` (
  `tbpb_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbpb_create_date` datetime DEFAULT NULL,
  `tbpb_create_id` int(11) DEFAULT NULL,
  `tbpb_update_date` datetime DEFAULT NULL,
  `tbpb_update_id` int(11) DEFAULT NULL,
  `tbpb_sku` varchar(255) DEFAULT NULL,
  `tbpb_item` varchar(255) DEFAULT NULL,
  `tbp_sku` varchar(255) DEFAULT NULL,
  `tbp_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpb_id`),
  KEY `tb_product_bundle_tbpb_sku_index` (`tbpb_sku`),
  KEY `tb_product_bundle_tbpb_item_index` (`tbpb_item`),
  KEY `tb_product_bundle_tbp_sku_index` (`tbp_sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_bundle`
--

LOCK TABLES `tb_product_bundle` WRITE;
/*!40000 ALTER TABLE `tb_product_bundle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_confirm`
--

DROP TABLE IF EXISTS `tb_product_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_confirm` (
  `tbpc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbpc_create_date` datetime DEFAULT NULL,
  `tbpc_create_id` int(11) DEFAULT NULL,
  `tbpc_update_date` datetime DEFAULT NULL,
  `tbpc_update_id` int(11) DEFAULT NULL,
  `tbpc_order_no` varchar(255) DEFAULT NULL,
  `tbpc_sku` varchar(255) DEFAULT NULL,
  `tbpc_market` varchar(100) DEFAULT NULL,
  `tbpc_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpc_id`),
  KEY `tb_product_confirm_tbpc_order_no_index` (`tbpc_order_no`),
  KEY `tb_product_confirm_tbpc_sku_index` (`tbpc_sku`),
  KEY `tb_product_confirm_tbpc_qty_index` (`tbpc_qty`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_confirm`
--

LOCK TABLES `tb_product_confirm` WRITE;
/*!40000 ALTER TABLE `tb_product_confirm` DISABLE KEYS */;
INSERT INTO `tb_product_confirm` VALUES (1,'2023-10-18 13:41:13',11,NULL,NULL,'INV/20230929/MMS/00','4.140402.016','Subdist A',30),(2,'2023-10-24 13:41:51',11,NULL,NULL,'INV/20230929/MMS/00','4.140402.016','Subdist A',30),(3,'2023-10-24 13:42:50',11,NULL,NULL,'INV/20230929/MMS/01','4.140401.027','Subdist A',86),(4,'2023-10-25 00:34:14',11,NULL,NULL,'INV/20230929/MMS/00','4.140402.016','Subdist A',30);
/*!40000 ALTER TABLE `tb_product_confirm` ENABLE KEYS */;
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
  UNIQUE KEY `tb_product_market_un` (`tbp_id`,`tbm_market`),
  KEY `tb_product_market_tbp_id_index` (`tbp_id`),
  KEY `tb_product_market_tbp_sku_index` (`tbp_sku`),
  KEY `tb_product_market_tbm_market_index` (`tbm_market`),
  KEY `tb_product_market_tbm_market_check_index` (`tbm_market_check`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
INSERT INTO `tb_product_market` VALUES (1,'2023-10-18 13:39:00',11,'2023-10-25 00:34:14',11,1,'4.140402.016','Subdist A',1,10),(2,'2023-10-18 13:39:00',11,'2023-10-24 13:42:50',11,2,'4.140401.027','Subdist A',1,14),(3,'2023-10-18 13:39:00',11,NULL,NULL,3,'4.140402.017','Subdist A',1,NULL),(4,'2023-10-18 13:39:00',11,NULL,NULL,4,'4.140401.028','Subdist A',1,NULL),(5,'2023-10-18 13:39:00',11,NULL,NULL,5,'4.140401.012','Subdist A',1,NULL),(6,'2023-10-18 13:39:00',11,NULL,NULL,6,'4.140401.011','Subdist A',1,NULL),(7,'2023-10-18 13:39:00',11,NULL,NULL,7,'Skunew003','Subdist A',1,NULL),(8,'2023-10-18 13:39:00',11,NULL,NULL,8,'8997232970046','Subdist A',1,NULL),(9,'2023-10-18 13:39:00',11,NULL,NULL,9,'8997232970053','Subdist A',1,NULL),(10,'2023-10-18 13:39:00',11,NULL,NULL,10,'Skunew002','Subdist A',1,NULL),(11,'2023-10-18 13:39:00',11,NULL,NULL,11,'4.140401.029','Subdist A',1,NULL),(12,'2023-10-18 13:39:00',11,NULL,NULL,12,'konjagu001','Subdist A',1,NULL),(13,'2023-10-18 13:39:00',11,NULL,NULL,13,'cassamo001','Subdist A',1,NULL),(14,'2023-10-18 13:39:00',11,NULL,NULL,14,'cassamo002','Subdist A',1,NULL),(15,'2023-10-18 13:39:00',11,NULL,NULL,15,'nealamami004','Subdist A',1,NULL),(16,'2023-10-18 13:39:00',11,NULL,NULL,16,'newalamami005','Subdist A',1,NULL),(17,'2023-10-18 13:39:00',11,NULL,NULL,17,'newalamami003','Subdist A',1,NULL),(18,'2023-10-18 13:39:00',11,NULL,NULL,18,'newgorme003','Subdist A',1,NULL),(19,'2023-10-18 13:39:00',11,NULL,NULL,19,'newgorme002','Subdist A',1,NULL),(20,'2023-10-18 13:39:00',11,NULL,NULL,20,'newgorme001','Subdist A',1,NULL),(21,'2023-10-18 13:39:00',11,NULL,NULL,21,'skunew004','Subdist A',1,NULL),(22,'2023-10-18 13:39:00',11,NULL,NULL,22,'solafarm002','Subdist A',1,NULL),(23,'2023-10-18 13:39:00',11,NULL,NULL,23,'salafarm001','Subdist A',1,NULL),(24,'2023-10-18 13:39:00',11,NULL,NULL,24,'All Produk','Subdist A',1,NULL),(25,'2023-10-18 13:39:00',11,NULL,NULL,25,'newalamami001','Subdist A',1,NULL),(26,'2023-10-18 13:39:00',11,NULL,NULL,26,'newalamami002','Subdist A',1,NULL),(27,'2023-10-18 13:39:00',11,NULL,NULL,27,'skunew001','Subdist A',1,NULL),(28,'2023-10-18 13:39:00',11,NULL,NULL,28,'4.140402.022','Subdist A',1,NULL),(29,'2023-10-18 13:39:00',11,NULL,NULL,29,'4.140901.032','Subdist A',1,NULL),(30,'2023-10-18 13:39:34',11,NULL,NULL,30,'01','Subdist A',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-18 13:38:21',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'0u38hvf625y76v2c3k6e20w3dez8ui0gpqfp','ADMIN'),(11,'2023-10-18 13:38:47',1,'2023-10-18 13:38:51',11,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','satu',NULL,NULL,NULL,'active',NULL,NULL,'qlca7qxa94ekc3v7z8iogp8mj457ub7o5mf3','SUBDIST');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,'2023-10-15 11:34:57',1,NULL,NULL,1,'Mamasuka','MAMAS',1),(17,'2023-10-18 13:38:47',1,NULL,NULL,11,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (1,'2023-10-18 13:38:47',1,NULL,NULL,11,'Subdist A',1);
/*!40000 ALTER TABLE `tb_user_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_brand_product`
--

DROP TABLE IF EXISTS `view_brand_product`;
/*!50001 DROP VIEW IF EXISTS `view_brand_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_brand_product` AS SELECT
 1 AS `uuid`,
  1 AS `tbb_id`,
  1 AS `tbb_brand`,
  1 AS `tbb_brand_id`,
  1 AS `tbp_id`,
  1 AS `tbp_sku`,
  1 AS `tbp_item`,
  1 AS `tbp_code`,
  1 AS `tbp_loc`,
  1 AS `tbp_qty`,
  1 AS `tbp_type`,
  1 AS `tbp_unit_price`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_gwp_product`
--

DROP TABLE IF EXISTS `view_gwp_product`;
/*!50001 DROP VIEW IF EXISTS `view_gwp_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_gwp_product` AS SELECT
 1 AS `uuid`,
  1 AS `tbg_id`,
  1 AS `tbg_sku`,
  1 AS `tbp_id`,
  1 AS `tbp_item`,
  1 AS `tbb_brand_id`,
  1 AS `tbb_brand`,
  1 AS `tbu_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_gwp_sku_product`
--

DROP TABLE IF EXISTS `view_gwp_sku_product`;
/*!50001 DROP VIEW IF EXISTS `view_gwp_sku_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_gwp_sku_product` AS SELECT
 1 AS `uuid`,
  1 AS `tbpg_tbp_brand`,
  1 AS `tbg_sku`,
  1 AS `tbg_status`,
  1 AS `tbpg_tbp_item`,
  1 AS `tbpg_tbp_code`,
  1 AS `tbpg_tbp_loc`,
  1 AS `tbpg_tbp_unit_price`,
  1 AS `tbpgs_tbp_brand`,
  1 AS `tbgs_sku`,
  1 AS `tbgs_min`,
  1 AS `tbgs_min_accu`,
  1 AS `tbgs_qty`,
  1 AS `tbpgs_tbp_item`,
  1 AS `tbpgs_tbp_code`,
  1 AS `tbpgs_tbp_loc`,
  1 AS `tbpgs_tbp_unit_price` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_product_market`
--

DROP TABLE IF EXISTS `view_product_market`;
/*!50001 DROP VIEW IF EXISTS `view_product_market`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_product_market` AS SELECT
 1 AS `uuid`,
  1 AS `tbpm_id`,
  1 AS `tbp_id`,
  1 AS `tbp_sku`,
  1 AS `tbm_market`,
  1 AS `tbpm_qty` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_brand_product`
--

/*!50001 DROP VIEW IF EXISTS `view_brand_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_brand_product` AS select uuid() AS `uuid`,`tbb`.`tbb_id` AS `tbb_id`,`tbb`.`tbb_brand` AS `tbb_brand`,`tbb`.`tbb_brand_id` AS `tbb_brand_id`,`tbp`.`tbp_id` AS `tbp_id`,`tbp`.`tbp_sku` AS `tbp_sku`,`tbp`.`tbp_item` AS `tbp_item`,`tbp`.`tbp_code` AS `tbp_code`,`tbp`.`tbp_loc` AS `tbp_loc`,`tbp`.`tbp_qty` AS `tbp_qty`,`tbp`.`tbp_type` AS `tbp_type`,`tbp`.`tbp_unit_price` AS `tbp_unit_price`,`tbub`.`tbu_id` AS `tbu_id` from ((((`tb_brand` `tbb` join `tb_user_brand` `tbub` on(`tbub`.`tbb_brand` = `tbb`.`tbb_brand` and `tbub`.`tbb_brand_check` = 1)) join `tb_product` `tbp` on(`tbp`.`tbb_brand_id` = `tbb`.`tbb_brand_id`)) join `tb_product_market` `tpm` on(`tpm`.`tbp_id` = `tbp`.`tbp_id` and `tpm`.`tbm_market_check` = 1)) join `tb_user_market` `tum` on(`tum`.`tbm_market` = `tpm`.`tbm_market` and `tum`.`tbm_market_check` = 1 and `tum`.`tbu_id` = `tbub`.`tbu_id`)) group by `tbb`.`tbb_id`,`tbb`.`tbb_brand`,`tbb`.`tbb_brand_id`,`tbp`.`tbp_id`,`tbp`.`tbp_sku`,`tbp`.`tbp_item`,`tbp`.`tbp_code`,`tbp`.`tbp_loc`,`tbp`.`tbp_qty`,`tbp`.`tbp_type`,`tbp`.`tbp_unit_price`,`tbub`.`tbu_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_gwp_product`
--

/*!50001 DROP VIEW IF EXISTS `view_gwp_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gwp_product` AS select uuid() AS `uuid`,`tbg`.`tbg_id` AS `tbg_id`,`tbg`.`tbg_sku` AS `tbg_sku`,`tbp`.`tbp_id` AS `tbp_id`,`tbp`.`tbp_item` AS `tbp_item`,`tbb`.`tbb_brand_id` AS `tbb_brand_id`,`tbb`.`tbb_brand` AS `tbb_brand`,`tbub`.`tbu_id` AS `tbu_id` from (((`tb_gwp` `tbg` join `tb_product` `tbp` on(`tbp`.`tbp_sku` = `tbg`.`tbg_sku`)) join `tb_brand` `tbb` on(`tbb`.`tbb_brand_id` = `tbp`.`tbb_brand_id`)) join `tb_user_brand` `tbub` on(`tbb`.`tbb_brand_id` = `tbub`.`tbb_brand_id` and `tbub`.`tbb_brand_check` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_gwp_sku_product`
--

/*!50001 DROP VIEW IF EXISTS `view_gwp_sku_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gwp_sku_product` AS select uuid() AS `uuid`,`tbpg`.`tbp_brand` AS `tbpg_tbp_brand`,`tbg`.`tbg_sku` AS `tbg_sku`,`tbg`.`tbg_status` AS `tbg_status`,`tbpg`.`tbp_item` AS `tbpg_tbp_item`,`tbpg`.`tbp_code` AS `tbpg_tbp_code`,`tbpg`.`tbp_loc` AS `tbpg_tbp_loc`,`tbpg`.`tbp_unit_price` AS `tbpg_tbp_unit_price`,`tbpgs`.`tbp_brand` AS `tbpgs_tbp_brand`,`tbgs`.`tbgs_sku` AS `tbgs_sku`,`tbgs`.`tbgs_min` AS `tbgs_min`,`tbgs`.`tbgs_min_accu` AS `tbgs_min_accu`,`tbgs`.`tbgs_qty` AS `tbgs_qty`,`tbpgs`.`tbp_item` AS `tbpgs_tbp_item`,`tbpgs`.`tbp_code` AS `tbpgs_tbp_code`,`tbpgs`.`tbp_loc` AS `tbpgs_tbp_loc`,`tbpgs`.`tbp_unit_price` AS `tbpgs_tbp_unit_price` from (((`tb_gwp` `tbg` join `tb_product` `tbpg` on(`tbpg`.`tbp_sku` = `tbg`.`tbg_sku`)) join `tb_gwp_sku` `tbgs` on(`tbg`.`tbg_id` = `tbgs`.`tbg_id`)) join `tb_product` `tbpgs` on(`tbpgs`.`tbp_sku` = `tbgs`.`tbgs_sku`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product_market`
--

/*!50001 DROP VIEW IF EXISTS `view_product_market`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_market` AS select uuid() AS `uuid`,`tbpm`.`tbpm_id` AS `tbpm_id`,`tbpm`.`tbp_id` AS `tbp_id`,`tbpm`.`tbp_sku` AS `tbp_sku`,`tbpm`.`tbm_market` AS `tbm_market`,coalesce(`tbpm`.`tbpm_qty`,0) AS `tbpm_qty` from (`tb_product` `tbp` left join `tb_product_market` `tbpm` on(`tbpm`.`tbp_id` = `tbp`.`tbp_id`)) where `tbpm`.`tbm_market` not in ('TREC','MAMASUKA') */;
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

-- Dump completed on 2023-10-25  7:47:30
