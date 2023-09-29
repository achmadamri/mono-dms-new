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
INSERT INTO `tb_brand` VALUES (1,NULL,1,NULL,NULL,'MAMAS','Mamasuka');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gwp`
--

LOCK TABLES `tb_gwp` WRITE;
/*!40000 ALTER TABLE `tb_gwp` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gwp_sku`
--

LOCK TABLES `tb_gwp_sku` WRITE;
/*!40000 ALTER TABLE `tb_gwp_sku` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_market`
--

LOCK TABLES `tb_market` WRITE;
/*!40000 ALTER TABLE `tb_market` DISABLE KEYS */;
INSERT INTO `tb_market` VALUES (1,NULL,NULL,NULL,NULL,'TREC',NULL,'PRINCIPAL'),(2,NULL,NULL,NULL,NULL,'SUKANDA',1,'DISTRIBUTOR'),(3,'2023-09-26 14:56:51',1,NULL,NULL,'Distributor A',2,'DISTRIBUTOR'),(4,'2023-09-26 14:57:00',1,NULL,NULL,'Distributor B',2,'DISTRIBUTOR'),(5,'2023-09-26 15:01:39',1,NULL,NULL,'Subdist A',3,'SUBDIST'),(6,'2023-09-26 15:01:47',1,NULL,NULL,'Subdist B',3,'SUBDIST'),(7,'2023-09-26 15:01:58',1,NULL,NULL,'Subdist C',3,'SUBDIST'),(8,'2023-09-26 15:02:08',1,NULL,NULL,'Subdist D',3,'SUBDIST'),(9,'2023-09-26 15:02:21',1,NULL,NULL,'Subdist E',3,'SUBDIST'),(10,'2023-09-26 15:03:55',1,NULL,NULL,'Grosir A',5,'GROSIR'),(11,'2023-09-26 15:04:01',1,NULL,NULL,'Grosir B',5,'GROSIR'),(12,'2023-09-26 15:04:10',1,NULL,NULL,'Grosir C',5,'GROSIR'),(13,'2023-09-26 15:04:17',1,NULL,NULL,'Grosir D',5,'GROSIR'),(14,'2023-09-26 15:04:33',1,NULL,NULL,'Grosir F',5,'GROSIR'),(15,'2023-09-26 15:04:48',1,NULL,NULL,'Grosir G',5,'GROSIR');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'2023-09-29 04:19:45',1,'2023-09-29 08:13:09',1,'Mamasuka','MAMAS','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode',NULL,0,1000.0000000000,'Sellable',NULL),(2,'2023-09-29 04:19:45',1,'2023-09-29 08:17:17',1,'Mamasuka','MAMAS','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode',NULL,0,1000.0000000000,'Sellable',NULL),(3,'2023-09-29 04:19:45',1,NULL,NULL,'Mamasuka','MAMAS','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode',NULL,20,1000.0000000000,'Sellable',NULL),(4,'2023-09-29 04:19:45',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode',NULL,45,1000.0000000000,'Sellable',NULL),(5,'2023-09-29 04:19:45',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode',NULL,31,1000.0000000000,'Sellable',NULL),(6,'2023-09-29 04:19:45',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(7,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','Skunew003','Lemonilo Ramen Jepang','NO Barcode',NULL,5,1000.0000000000,'Sellable',NULL),(8,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode',NULL,25,1000.0000000000,'Sellable',NULL),(9,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode',NULL,34,1000.0000000000,'Sellable',NULL),(10,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode',NULL,27,1000.0000000000,'Sellable',NULL),(11,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(12,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(13,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','cassamo001','Cassamo Smoky BBQ 50 Gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(14,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','cassamo002','Cassamo Spicy BBQ 50 Gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(15,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','nealamami004','Alamami Ayam Goreng Kremes 40Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(16,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newalamami005','Alamami Nasi Goreng 40Gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(17,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newalamami003','Alamami Rendang 40Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(18,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newgorme003','Gorme Rasa Kaldu Ayam Kampung 40Gr','NO Barcode',NULL,2,1000.0000000000,'Sellable',NULL),(19,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newgorme002','Gorme Rasa Kaldu Jamur 40Gr','NO Barcode',NULL,3,1000.0000000000,'Sellable',NULL),(20,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newgorme001','Gorme Rasa Kaldu Sapi 40Gr','NO Barcode',NULL,3,1000.0000000000,'Sellable',NULL),(21,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','skunew004','Lemonilo chimi karamel mentega 50gr','NO Barcode',NULL,5,1000.0000000000,'Sellable',NULL),(22,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','solafarm002','Solafarm Beef Steak 50 Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(23,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','salafarm001','Solafarm Seaweed 50 Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(24,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','All Produk','All Produk','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(25,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newalamami001','Alamami Ayam Lengkuas 40Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(26,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','newalamami002','Alamami Opor Ayam 40Gr','NO Barcode',NULL,1,1000.0000000000,'Sellable',NULL),(27,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','skunew001','Lemonilo Michoco 4 x 30 Gram','NO Barcode',NULL,0,1000.0000000000,'Sellable',NULL),(28,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','4.140402.022','Mie Kering 114Gr','NO Barcode',NULL,0,1000.0000000000,'Sellable',NULL),(29,'2023-09-29 04:19:46',1,NULL,NULL,'Mamasuka','MAMAS','4.140901.032','Lemonilo Kanilo Kacang Panggang125Grx14','NO Barcode',NULL,0,1000.0000000000,'Sellable',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `tbpc_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpc_id`),
  KEY `tb_product_confirm_tbpc_order_no_index` (`tbpc_order_no`),
  KEY `tb_product_confirm_tbpc_sku_index` (`tbpc_sku`),
  KEY `tb_product_confirm_tbpc_qty_index` (`tbpc_qty`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_confirm`
--

LOCK TABLES `tb_product_confirm` WRITE;
/*!40000 ALTER TABLE `tb_product_confirm` DISABLE KEYS */;
INSERT INTO `tb_product_confirm` VALUES (1,'2023-09-29 08:13:09',1,NULL,NULL,'INV/20230929/MMS/00','4.140402.016',30),(2,'2023-09-29 08:17:17',1,NULL,NULL,'INV/20230929/MMS/01','4.140401.027',86);
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
  PRIMARY KEY (`tbpm_id`),
  KEY `tb_product_market_tbp_id_index` (`tbp_id`),
  KEY `tb_product_market_tbp_sku_index` (`tbp_sku`),
  KEY `tb_product_market_tbm_market_index` (`tbm_market`),
  KEY `tb_product_market_tbm_market_check_index` (`tbm_market_check`)
) ENGINE=InnoDB AUTO_INCREMENT=871 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
INSERT INTO `tb_product_market` VALUES (1,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','TREC',1),(2,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','SUKANDA',1),(3,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Distributor A',1),(4,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Subdist A',1),(5,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir A',1),(6,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir B',1),(7,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir C',1),(8,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir D',1),(9,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir F',1),(10,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Grosir G',1),(11,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Subdist B',1),(12,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Subdist C',1),(13,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Subdist D',1),(14,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Subdist E',1),(15,'2023-09-29 03:02:44',1,NULL,NULL,1,'4.140402.016','Distributor B',1),(16,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','TREC',1),(17,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','SUKANDA',1),(18,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Distributor A',1),(19,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Subdist A',1),(20,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir A',1),(21,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir B',1),(22,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir C',1),(23,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir D',1),(24,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir F',1),(25,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Grosir G',1),(26,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Subdist B',1),(27,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Subdist C',1),(28,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Subdist D',1),(29,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Subdist E',1),(30,'2023-09-29 03:02:44',1,NULL,NULL,2,'4.140401.027','Distributor B',1),(31,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','TREC',1),(32,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','SUKANDA',1),(33,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Distributor A',1),(34,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Subdist A',1),(35,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir A',1),(36,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir B',1),(37,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir C',1),(38,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir D',1),(39,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir F',1),(40,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Grosir G',1),(41,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Subdist B',1),(42,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Subdist C',1),(43,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Subdist D',1),(44,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Subdist E',1),(45,'2023-09-29 03:02:44',1,NULL,NULL,3,'4.140402.017','Distributor B',1),(46,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','TREC',1),(47,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','SUKANDA',1),(48,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Distributor A',1),(49,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Subdist A',1),(50,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir A',1),(51,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir B',1),(52,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir C',1),(53,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir D',1),(54,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir F',1),(55,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Grosir G',1),(56,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Subdist B',1),(57,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Subdist C',1),(58,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Subdist D',1),(59,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Subdist E',1),(60,'2023-09-29 03:02:44',1,NULL,NULL,4,'4.140401.028','Distributor B',1),(61,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','TREC',1),(62,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','SUKANDA',1),(63,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Distributor A',1),(64,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Subdist A',1),(65,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir A',1),(66,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir B',1),(67,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir C',1),(68,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir D',1),(69,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir F',1),(70,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Grosir G',1),(71,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Subdist B',1),(72,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Subdist C',1),(73,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Subdist D',1),(74,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Subdist E',1),(75,'2023-09-29 03:02:44',1,NULL,NULL,5,'4.140401.012','Distributor B',1),(76,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','TREC',1),(77,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','SUKANDA',1),(78,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Distributor A',1),(79,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Subdist A',1),(80,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir A',1),(81,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir B',1),(82,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir C',1),(83,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir D',1),(84,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir F',1),(85,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Grosir G',1),(86,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Subdist B',1),(87,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Subdist C',1),(88,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Subdist D',1),(89,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Subdist E',1),(90,'2023-09-29 03:02:44',1,NULL,NULL,6,'4.140401.011','Distributor B',1),(91,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','TREC',1),(92,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','SUKANDA',1),(93,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Distributor A',1),(94,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Subdist A',1),(95,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir A',1),(96,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir B',1),(97,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir C',1),(98,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir D',1),(99,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir F',1),(100,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Grosir G',1),(101,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Subdist B',1),(102,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Subdist C',1),(103,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Subdist D',1),(104,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Subdist E',1),(105,'2023-09-29 03:02:44',1,NULL,NULL,7,'Skunew003','Distributor B',1),(106,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','TREC',1),(107,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','SUKANDA',1),(108,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Distributor A',1),(109,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Subdist A',1),(110,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir A',1),(111,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir B',1),(112,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir C',1),(113,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir D',1),(114,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir F',1),(115,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Grosir G',1),(116,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Subdist B',1),(117,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Subdist C',1),(118,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Subdist D',1),(119,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Subdist E',1),(120,'2023-09-29 03:02:44',1,NULL,NULL,8,'8997232970046','Distributor B',1),(121,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','TREC',1),(122,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','SUKANDA',1),(123,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Distributor A',1),(124,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Subdist A',1),(125,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir A',1),(126,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir B',1),(127,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir C',1),(128,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir D',1),(129,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir F',1),(130,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Grosir G',1),(131,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Subdist B',1),(132,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Subdist C',1),(133,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Subdist D',1),(134,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Subdist E',1),(135,'2023-09-29 03:02:44',1,NULL,NULL,9,'8997232970053','Distributor B',1),(136,'2023-09-29 03:02:44',1,NULL,NULL,10,'Skunew002','TREC',1),(137,'2023-09-29 03:02:44',1,NULL,NULL,10,'Skunew002','SUKANDA',1),(138,'2023-09-29 03:02:44',1,NULL,NULL,10,'Skunew002','Distributor A',1),(139,'2023-09-29 03:02:44',1,NULL,NULL,10,'Skunew002','Subdist A',1),(140,'2023-09-29 03:02:44',1,NULL,NULL,10,'Skunew002','Grosir A',1),(141,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Grosir B',1),(142,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Grosir C',1),(143,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Grosir D',1),(144,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Grosir F',1),(145,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Grosir G',1),(146,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Subdist B',1),(147,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Subdist C',1),(148,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Subdist D',1),(149,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Subdist E',1),(150,'2023-09-29 03:02:45',1,NULL,NULL,10,'Skunew002','Distributor B',1),(151,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','TREC',1),(152,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','SUKANDA',1),(153,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Distributor A',1),(154,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Subdist A',1),(155,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir A',1),(156,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir B',1),(157,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir C',1),(158,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir D',1),(159,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir F',1),(160,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Grosir G',1),(161,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Subdist B',1),(162,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Subdist C',1),(163,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Subdist D',1),(164,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Subdist E',1),(165,'2023-09-29 03:02:45',1,NULL,NULL,11,'4.140401.029','Distributor B',1),(166,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','TREC',1),(167,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','SUKANDA',1),(168,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Distributor A',1),(169,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Subdist A',1),(170,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir A',1),(171,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir B',1),(172,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir C',1),(173,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir D',1),(174,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir F',1),(175,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Grosir G',1),(176,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Subdist B',1),(177,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Subdist C',1),(178,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Subdist D',1),(179,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Subdist E',1),(180,'2023-09-29 03:02:45',1,NULL,NULL,12,'konjagu001','Distributor B',1),(181,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','TREC',1),(182,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','SUKANDA',1),(183,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Distributor A',1),(184,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Subdist A',1),(185,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir A',1),(186,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir B',1),(187,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir C',1),(188,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir D',1),(189,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir F',1),(190,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Grosir G',1),(191,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Subdist B',1),(192,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Subdist C',1),(193,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Subdist D',1),(194,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Subdist E',1),(195,'2023-09-29 03:02:45',1,NULL,NULL,13,'cassamo001','Distributor B',1),(196,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','TREC',1),(197,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','SUKANDA',1),(198,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Distributor A',1),(199,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Subdist A',1),(200,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir A',1),(201,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir B',1),(202,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir C',1),(203,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir D',1),(204,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir F',1),(205,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Grosir G',1),(206,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Subdist B',1),(207,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Subdist C',1),(208,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Subdist D',1),(209,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Subdist E',1),(210,'2023-09-29 03:02:45',1,NULL,NULL,14,'cassamo002','Distributor B',1),(211,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','TREC',1),(212,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','SUKANDA',1),(213,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Distributor A',1),(214,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Subdist A',1),(215,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir A',1),(216,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir B',1),(217,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir C',1),(218,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir D',1),(219,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir F',1),(220,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Grosir G',1),(221,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Subdist B',1),(222,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Subdist C',1),(223,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Subdist D',1),(224,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Subdist E',1),(225,'2023-09-29 03:02:45',1,NULL,NULL,15,'nealamami004','Distributor B',1),(226,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','TREC',1),(227,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','SUKANDA',1),(228,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Distributor A',1),(229,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Subdist A',1),(230,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir A',1),(231,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir B',1),(232,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir C',1),(233,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir D',1),(234,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir F',1),(235,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Grosir G',1),(236,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Subdist B',1),(237,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Subdist C',1),(238,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Subdist D',1),(239,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Subdist E',1),(240,'2023-09-29 03:02:45',1,NULL,NULL,16,'newalamami005','Distributor B',1),(241,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','TREC',1),(242,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','SUKANDA',1),(243,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Distributor A',1),(244,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Subdist A',1),(245,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir A',1),(246,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir B',1),(247,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir C',1),(248,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir D',1),(249,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir F',1),(250,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Grosir G',1),(251,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Subdist B',1),(252,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Subdist C',1),(253,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Subdist D',1),(254,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Subdist E',1),(255,'2023-09-29 03:02:45',1,NULL,NULL,17,'newalamami003','Distributor B',1),(256,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','TREC',1),(257,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','SUKANDA',1),(258,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Distributor A',1),(259,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Subdist A',1),(260,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir A',1),(261,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir B',1),(262,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir C',1),(263,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir D',1),(264,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir F',1),(265,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Grosir G',1),(266,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Subdist B',1),(267,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Subdist C',1),(268,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Subdist D',1),(269,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Subdist E',1),(270,'2023-09-29 03:02:45',1,NULL,NULL,18,'newgorme003','Distributor B',1),(271,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','TREC',1),(272,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','SUKANDA',1),(273,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Distributor A',1),(274,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Subdist A',1),(275,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir A',1),(276,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir B',1),(277,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir C',1),(278,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir D',1),(279,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir F',1),(280,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Grosir G',1),(281,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Subdist B',1),(282,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Subdist C',1),(283,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Subdist D',1),(284,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Subdist E',1),(285,'2023-09-29 03:02:45',1,NULL,NULL,19,'newgorme002','Distributor B',1),(286,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','TREC',1),(287,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','SUKANDA',1),(288,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Distributor A',1),(289,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Subdist A',1),(290,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir A',1),(291,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir B',1),(292,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir C',1),(293,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir D',1),(294,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir F',1),(295,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Grosir G',1),(296,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Subdist B',1),(297,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Subdist C',1),(298,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Subdist D',1),(299,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Subdist E',1),(300,'2023-09-29 03:02:45',1,NULL,NULL,20,'newgorme001','Distributor B',1),(301,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','TREC',1),(302,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','SUKANDA',1),(303,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Distributor A',1),(304,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Subdist A',1),(305,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir A',1),(306,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir B',1),(307,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir C',1),(308,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir D',1),(309,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir F',1),(310,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Grosir G',1),(311,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Subdist B',1),(312,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Subdist C',1),(313,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Subdist D',1),(314,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Subdist E',1),(315,'2023-09-29 03:02:45',1,NULL,NULL,21,'skunew004','Distributor B',1),(316,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','TREC',1),(317,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','SUKANDA',1),(318,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Distributor A',1),(319,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Subdist A',1),(320,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir A',1),(321,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir B',1),(322,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir C',1),(323,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir D',1),(324,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir F',1),(325,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Grosir G',1),(326,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Subdist B',1),(327,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Subdist C',1),(328,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Subdist D',1),(329,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Subdist E',1),(330,'2023-09-29 03:02:45',1,NULL,NULL,22,'solafarm002','Distributor B',1),(331,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','TREC',1),(332,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','SUKANDA',1),(333,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Distributor A',1),(334,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Subdist A',1),(335,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir A',1),(336,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir B',1),(337,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir C',1),(338,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir D',1),(339,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir F',1),(340,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Grosir G',1),(341,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Subdist B',1),(342,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Subdist C',1),(343,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Subdist D',1),(344,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Subdist E',1),(345,'2023-09-29 03:02:45',1,NULL,NULL,23,'salafarm001','Distributor B',1),(346,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','TREC',1),(347,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','SUKANDA',1),(348,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Distributor A',1),(349,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Subdist A',1),(350,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir A',1),(351,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir B',1),(352,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir C',1),(353,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir D',1),(354,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir F',1),(355,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Grosir G',1),(356,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Subdist B',1),(357,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Subdist C',1),(358,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Subdist D',1),(359,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Subdist E',1),(360,'2023-09-29 03:02:45',1,NULL,NULL,24,'All Produk','Distributor B',1),(361,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','TREC',1),(362,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','SUKANDA',1),(363,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Distributor A',1),(364,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Subdist A',1),(365,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir A',1),(366,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir B',1),(367,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir C',1),(368,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir D',1),(369,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir F',1),(370,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Grosir G',1),(371,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Subdist B',1),(372,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Subdist C',1),(373,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Subdist D',1),(374,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Subdist E',1),(375,'2023-09-29 03:02:45',1,NULL,NULL,25,'newalamami001','Distributor B',1),(376,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','TREC',1),(377,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','SUKANDA',1),(378,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Distributor A',1),(379,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Subdist A',1),(380,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir A',1),(381,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir B',1),(382,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir C',1),(383,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir D',1),(384,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir F',1),(385,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Grosir G',1),(386,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Subdist B',1),(387,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Subdist C',1),(388,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Subdist D',1),(389,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Subdist E',1),(390,'2023-09-29 03:02:45',1,NULL,NULL,26,'newalamami002','Distributor B',1),(391,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','TREC',1),(392,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','SUKANDA',1),(393,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Distributor A',1),(394,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Subdist A',1),(395,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir A',1),(396,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir B',1),(397,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir C',1),(398,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir D',1),(399,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir F',1),(400,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Grosir G',1),(401,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Subdist B',1),(402,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Subdist C',1),(403,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Subdist D',1),(404,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Subdist E',1),(405,'2023-09-29 03:02:45',1,NULL,NULL,27,'skunew001','Distributor B',1),(406,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','TREC',1),(407,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','SUKANDA',1),(408,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Distributor A',1),(409,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Subdist A',1),(410,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir A',1),(411,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir B',1),(412,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir C',1),(413,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir D',1),(414,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir F',1),(415,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Grosir G',1),(416,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Subdist B',1),(417,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Subdist C',1),(418,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Subdist D',1),(419,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Subdist E',1),(420,'2023-09-29 03:02:45',1,NULL,NULL,28,'4.140402.022','Distributor B',1),(421,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','TREC',1),(422,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','SUKANDA',1),(423,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Distributor A',1),(424,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Subdist A',1),(425,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir A',1),(426,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir B',1),(427,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir C',1),(428,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir D',1),(429,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir F',1),(430,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Grosir G',1),(431,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Subdist B',1),(432,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Subdist C',1),(433,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Subdist D',1),(434,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Subdist E',1),(435,'2023-09-29 03:02:45',1,NULL,NULL,29,'4.140901.032','Distributor B',1),(436,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','TREC',1),(437,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','SUKANDA',1),(438,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Distributor A',1),(439,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Subdist A',1),(440,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir A',1),(441,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir B',1),(442,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir C',1),(443,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir D',1),(444,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir F',1),(445,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Grosir G',1),(446,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Subdist B',1),(447,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Subdist C',1),(448,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Subdist D',1),(449,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Subdist E',1),(450,'2023-09-29 04:19:47',1,NULL,NULL,1,'4.140402.016','Distributor B',1),(451,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','TREC',1),(452,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','SUKANDA',1),(453,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Distributor A',1),(454,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Subdist A',1),(455,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir A',1),(456,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir B',1),(457,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir C',1),(458,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir D',1),(459,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir F',1),(460,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Grosir G',1),(461,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Subdist B',1),(462,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Subdist C',1),(463,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Subdist D',1),(464,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Subdist E',1),(465,'2023-09-29 04:19:47',1,NULL,NULL,2,'4.140401.027','Distributor B',1),(466,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','TREC',1),(467,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','SUKANDA',1),(468,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Distributor A',1),(469,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Subdist A',1),(470,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir A',1),(471,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir B',1),(472,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir C',1),(473,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir D',1),(474,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir F',1),(475,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Grosir G',1),(476,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Subdist B',1),(477,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Subdist C',1),(478,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Subdist D',1),(479,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Subdist E',1),(480,'2023-09-29 04:19:47',1,NULL,NULL,3,'4.140402.017','Distributor B',1),(481,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','TREC',1),(482,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','SUKANDA',1),(483,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Distributor A',1),(484,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Subdist A',1),(485,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir A',1),(486,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir B',1),(487,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir C',1),(488,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir D',1),(489,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir F',1),(490,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Grosir G',1),(491,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Subdist B',1),(492,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Subdist C',1),(493,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Subdist D',1),(494,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Subdist E',1),(495,'2023-09-29 04:19:47',1,NULL,NULL,4,'4.140401.028','Distributor B',1),(496,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','TREC',1),(497,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','SUKANDA',1),(498,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Distributor A',1),(499,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Subdist A',1),(500,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir A',1),(501,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir B',1),(502,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir C',1),(503,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir D',1),(504,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir F',1),(505,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Grosir G',1),(506,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Subdist B',1),(507,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Subdist C',1),(508,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Subdist D',1),(509,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Subdist E',1),(510,'2023-09-29 04:19:47',1,NULL,NULL,5,'4.140401.012','Distributor B',1),(511,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','TREC',1),(512,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','SUKANDA',1),(513,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Distributor A',1),(514,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Subdist A',1),(515,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir A',1),(516,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir B',1),(517,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir C',1),(518,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir D',1),(519,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir F',1),(520,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Grosir G',1),(521,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Subdist B',1),(522,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Subdist C',1),(523,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Subdist D',1),(524,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Subdist E',1),(525,'2023-09-29 04:19:47',1,NULL,NULL,6,'4.140401.011','Distributor B',1),(526,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','TREC',1),(527,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','SUKANDA',1),(528,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Distributor A',1),(529,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Subdist A',1),(530,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir A',1),(531,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir B',1),(532,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir C',1),(533,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir D',1),(534,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir F',1),(535,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Grosir G',1),(536,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Subdist B',1),(537,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Subdist C',1),(538,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Subdist D',1),(539,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Subdist E',1),(540,'2023-09-29 04:19:47',1,NULL,NULL,7,'Skunew003','Distributor B',1),(541,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','TREC',1),(542,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','SUKANDA',1),(543,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Distributor A',1),(544,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Subdist A',1),(545,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir A',1),(546,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir B',1),(547,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir C',1),(548,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir D',1),(549,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir F',1),(550,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Grosir G',1),(551,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Subdist B',1),(552,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Subdist C',1),(553,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Subdist D',1),(554,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Subdist E',1),(555,'2023-09-29 04:19:47',1,NULL,NULL,8,'8997232970046','Distributor B',1),(556,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','TREC',1),(557,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','SUKANDA',1),(558,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Distributor A',1),(559,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Subdist A',1),(560,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir A',1),(561,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir B',1),(562,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir C',1),(563,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir D',1),(564,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir F',1),(565,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Grosir G',1),(566,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Subdist B',1),(567,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Subdist C',1),(568,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Subdist D',1),(569,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Subdist E',1),(570,'2023-09-29 04:19:47',1,NULL,NULL,9,'8997232970053','Distributor B',1),(571,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','TREC',1),(572,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','SUKANDA',1),(573,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Distributor A',1),(574,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Subdist A',1),(575,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir A',1),(576,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir B',1),(577,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir C',1),(578,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir D',1),(579,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir F',1),(580,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Grosir G',1),(581,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Subdist B',1),(582,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Subdist C',1),(583,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Subdist D',1),(584,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Subdist E',1),(585,'2023-09-29 04:19:47',1,NULL,NULL,10,'Skunew002','Distributor B',1),(586,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','TREC',1),(587,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','SUKANDA',1),(588,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Distributor A',1),(589,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Subdist A',1),(590,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir A',1),(591,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir B',1),(592,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir C',1),(593,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir D',1),(594,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir F',1),(595,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Grosir G',1),(596,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Subdist B',1),(597,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Subdist C',1),(598,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Subdist D',1),(599,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Subdist E',1),(600,'2023-09-29 04:19:47',1,NULL,NULL,11,'4.140401.029','Distributor B',1),(601,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','TREC',1),(602,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','SUKANDA',1),(603,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Distributor A',1),(604,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Subdist A',1),(605,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir A',1),(606,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir B',1),(607,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir C',1),(608,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir D',1),(609,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir F',1),(610,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Grosir G',1),(611,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Subdist B',1),(612,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Subdist C',1),(613,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Subdist D',1),(614,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Subdist E',1),(615,'2023-09-29 04:19:47',1,NULL,NULL,12,'konjagu001','Distributor B',1),(616,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','TREC',1),(617,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','SUKANDA',1),(618,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Distributor A',1),(619,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Subdist A',1),(620,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir A',1),(621,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir B',1),(622,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir C',1),(623,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir D',1),(624,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir F',1),(625,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Grosir G',1),(626,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Subdist B',1),(627,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Subdist C',1),(628,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Subdist D',1),(629,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Subdist E',1),(630,'2023-09-29 04:19:47',1,NULL,NULL,13,'cassamo001','Distributor B',1),(631,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','TREC',1),(632,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','SUKANDA',1),(633,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Distributor A',1),(634,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Subdist A',1),(635,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir A',1),(636,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir B',1),(637,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir C',1),(638,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir D',1),(639,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir F',1),(640,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Grosir G',1),(641,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Subdist B',1),(642,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Subdist C',1),(643,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Subdist D',1),(644,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Subdist E',1),(645,'2023-09-29 04:19:47',1,NULL,NULL,14,'cassamo002','Distributor B',1),(646,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','TREC',1),(647,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','SUKANDA',1),(648,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Distributor A',1),(649,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Subdist A',1),(650,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir A',1),(651,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir B',1),(652,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir C',1),(653,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir D',1),(654,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir F',1),(655,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Grosir G',1),(656,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Subdist B',1),(657,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Subdist C',1),(658,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Subdist D',1),(659,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Subdist E',1),(660,'2023-09-29 04:19:47',1,NULL,NULL,15,'nealamami004','Distributor B',1),(661,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','TREC',1),(662,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','SUKANDA',1),(663,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Distributor A',1),(664,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Subdist A',1),(665,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir A',1),(666,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir B',1),(667,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir C',1),(668,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir D',1),(669,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir F',1),(670,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Grosir G',1),(671,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Subdist B',1),(672,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Subdist C',1),(673,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Subdist D',1),(674,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Subdist E',1),(675,'2023-09-29 04:19:47',1,NULL,NULL,16,'newalamami005','Distributor B',1),(676,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','TREC',1),(677,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','SUKANDA',1),(678,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Distributor A',1),(679,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Subdist A',1),(680,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir A',1),(681,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir B',1),(682,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir C',1),(683,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir D',1),(684,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir F',1),(685,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Grosir G',1),(686,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Subdist B',1),(687,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Subdist C',1),(688,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Subdist D',1),(689,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Subdist E',1),(690,'2023-09-29 04:19:47',1,NULL,NULL,17,'newalamami003','Distributor B',1),(691,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','TREC',1),(692,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','SUKANDA',1),(693,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Distributor A',1),(694,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Subdist A',1),(695,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir A',1),(696,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir B',1),(697,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir C',1),(698,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir D',1),(699,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir F',1),(700,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Grosir G',1),(701,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Subdist B',1),(702,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Subdist C',1),(703,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Subdist D',1),(704,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Subdist E',1),(705,'2023-09-29 04:19:47',1,NULL,NULL,18,'newgorme003','Distributor B',1),(706,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','TREC',1),(707,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','SUKANDA',1),(708,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Distributor A',1),(709,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Subdist A',1),(710,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir A',1),(711,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir B',1),(712,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir C',1),(713,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir D',1),(714,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir F',1),(715,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Grosir G',1),(716,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Subdist B',1),(717,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Subdist C',1),(718,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Subdist D',1),(719,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Subdist E',1),(720,'2023-09-29 04:19:47',1,NULL,NULL,19,'newgorme002','Distributor B',1),(721,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','TREC',1),(722,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','SUKANDA',1),(723,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Distributor A',1),(724,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Subdist A',1),(725,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir A',1),(726,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir B',1),(727,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir C',1),(728,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir D',1),(729,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir F',1),(730,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Grosir G',1),(731,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Subdist B',1),(732,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Subdist C',1),(733,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Subdist D',1),(734,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Subdist E',1),(735,'2023-09-29 04:19:47',1,NULL,NULL,20,'newgorme001','Distributor B',1),(736,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','TREC',1),(737,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','SUKANDA',1),(738,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Distributor A',1),(739,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Subdist A',1),(740,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir A',1),(741,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir B',1),(742,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir C',1),(743,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir D',1),(744,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir F',1),(745,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Grosir G',1),(746,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Subdist B',1),(747,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Subdist C',1),(748,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Subdist D',1),(749,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Subdist E',1),(750,'2023-09-29 04:19:47',1,NULL,NULL,21,'skunew004','Distributor B',1),(751,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','TREC',1),(752,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','SUKANDA',1),(753,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Distributor A',1),(754,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Subdist A',1),(755,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Grosir A',1),(756,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Grosir B',1),(757,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Grosir C',1),(758,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Grosir D',1),(759,'2023-09-29 04:19:47',1,NULL,NULL,22,'solafarm002','Grosir F',1),(760,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Grosir G',1),(761,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Subdist B',1),(762,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Subdist C',1),(763,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Subdist D',1),(764,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Subdist E',1),(765,'2023-09-29 04:19:48',1,NULL,NULL,22,'solafarm002','Distributor B',1),(766,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','TREC',1),(767,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','SUKANDA',1),(768,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Distributor A',1),(769,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Subdist A',1),(770,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir A',1),(771,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir B',1),(772,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir C',1),(773,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir D',1),(774,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir F',1),(775,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Grosir G',1),(776,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Subdist B',1),(777,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Subdist C',1),(778,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Subdist D',1),(779,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Subdist E',1),(780,'2023-09-29 04:19:48',1,NULL,NULL,23,'salafarm001','Distributor B',1),(781,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','TREC',1),(782,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','SUKANDA',1),(783,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Distributor A',1),(784,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Subdist A',1),(785,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir A',1),(786,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir B',1),(787,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir C',1),(788,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir D',1),(789,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir F',1),(790,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Grosir G',1),(791,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Subdist B',1),(792,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Subdist C',1),(793,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Subdist D',1),(794,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Subdist E',1),(795,'2023-09-29 04:19:48',1,NULL,NULL,24,'All Produk','Distributor B',1),(796,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','TREC',1),(797,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','SUKANDA',1),(798,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Distributor A',1),(799,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Subdist A',1),(800,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir A',1),(801,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir B',1),(802,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir C',1),(803,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir D',1),(804,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir F',1),(805,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Grosir G',1),(806,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Subdist B',1),(807,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Subdist C',1),(808,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Subdist D',1),(809,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Subdist E',1),(810,'2023-09-29 04:19:48',1,NULL,NULL,25,'newalamami001','Distributor B',1),(811,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','TREC',1),(812,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','SUKANDA',1),(813,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Distributor A',1),(814,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Subdist A',1),(815,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir A',1),(816,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir B',1),(817,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir C',1),(818,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir D',1),(819,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir F',1),(820,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Grosir G',1),(821,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Subdist B',1),(822,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Subdist C',1),(823,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Subdist D',1),(824,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Subdist E',1),(825,'2023-09-29 04:19:48',1,NULL,NULL,26,'newalamami002','Distributor B',1),(826,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','TREC',1),(827,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','SUKANDA',1),(828,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Distributor A',1),(829,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Subdist A',1),(830,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir A',1),(831,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir B',1),(832,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir C',1),(833,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir D',1),(834,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir F',1),(835,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Grosir G',1),(836,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Subdist B',1),(837,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Subdist C',1),(838,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Subdist D',1),(839,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Subdist E',1),(840,'2023-09-29 04:19:48',1,NULL,NULL,27,'skunew001','Distributor B',1),(841,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','TREC',1),(842,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','SUKANDA',1),(843,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Distributor A',1),(844,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Subdist A',1),(845,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir A',1),(846,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir B',1),(847,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir C',1),(848,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir D',1),(849,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir F',1),(850,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Grosir G',1),(851,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Subdist B',1),(852,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Subdist C',1),(853,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Subdist D',1),(854,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Subdist E',1),(855,'2023-09-29 04:19:48',1,NULL,NULL,28,'4.140402.022','Distributor B',1),(856,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','TREC',1),(857,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','SUKANDA',1),(858,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Distributor A',1),(859,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Subdist A',1),(860,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir A',1),(861,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir B',1),(862,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir C',1),(863,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir D',1),(864,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir F',1),(865,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Grosir G',1),(866,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Subdist B',1),(867,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Subdist C',1),(868,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Subdist D',1),(869,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Subdist E',1),(870,'2023-09-29 04:19:48',1,NULL,NULL,29,'4.140901.032','Distributor B',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-09-26 15:05:35',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'534rmtrv3f7a4or8bbdf7zzzuk5m29f8iucy','ADMIN'),(2,NULL,NULL,NULL,NULL,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','one',NULL,NULL,NULL,'active',NULL,NULL,'ng843n6ocg719kklqklb5814t9n2ahilj9zv','PRINCIPAL'),(3,NULL,NULL,NULL,NULL,'pic2@mail.com','202cb962ac59075b964b07152d234b70','pic','pic',NULL,NULL,NULL,'active',NULL,NULL,'b3n95p03tsdpm9fya84cnelibj9u34xffz6j','DISTRIBUTOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,NULL,1,NULL,NULL,1,'Mamasuka','MAMAS',1),(2,NULL,1,NULL,NULL,2,'Mamasuka','MAMAS',1),(3,NULL,1,NULL,NULL,3,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (3,NULL,NULL,NULL,NULL,2,'TREC',1),(4,NULL,NULL,NULL,NULL,2,'SUKANDA',1),(5,NULL,NULL,NULL,NULL,3,'TREC',1),(6,NULL,NULL,NULL,NULL,3,'SUKANDA',1),(8,'2023-09-26 15:05:35',1,NULL,NULL,1,'TREC',1),(9,'2023-09-26 15:05:35',1,NULL,NULL,1,'SUKANDA',1),(10,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor A',1),(11,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist A',1),(12,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir A',1),(13,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir B',1),(14,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir C',1),(15,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir D',1),(16,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir F',1),(17,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir G',1),(18,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist B',1),(19,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist C',1),(20,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist D',1),(21,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist E',1),(22,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor B',1);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-29 15:24:11
