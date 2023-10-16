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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_market`
--

LOCK TABLES `tb_market` WRITE;
/*!40000 ALTER TABLE `tb_market` DISABLE KEYS */;
INSERT INTO `tb_market` VALUES (1,NULL,NULL,NULL,NULL,'TREC',NULL,'ADMIN'),(2,NULL,NULL,NULL,NULL,'MAMASUKA',1,'PRINCIPAL'),(3,'2023-09-26 14:56:51',1,NULL,NULL,'Distributor A',2,'DISTRIBUTOR'),(4,'2023-09-26 14:57:00',1,NULL,NULL,'Distributor B',2,'DISTRIBUTOR'),(5,'2023-09-26 15:01:39',1,NULL,NULL,'Subdist A',3,'SUBDIST'),(6,'2023-09-26 15:01:47',1,NULL,NULL,'Subdist B',3,'SUBDIST'),(7,'2023-09-26 15:01:58',1,NULL,NULL,'Subdist C',3,'SUBDIST'),(8,'2023-09-26 15:02:08',1,NULL,NULL,'Subdist D',3,'SUBDIST'),(9,'2023-09-26 15:02:21',1,NULL,NULL,'Subdist E',3,'SUBDIST'),(10,'2023-09-26 15:03:55',1,NULL,NULL,'Grosir A',5,'GROSIR'),(11,'2023-09-26 15:04:01',1,NULL,NULL,'Grosir B',5,'GROSIR'),(12,'2023-09-26 15:04:10',1,NULL,NULL,'Grosir C',5,'GROSIR'),(13,'2023-09-26 15:04:17',1,NULL,NULL,'Grosir D',5,'GROSIR'),(14,'2023-09-26 15:04:33',1,NULL,NULL,'Grosir F',5,'GROSIR'),(15,'2023-09-26 15:04:48',1,NULL,NULL,'Grosir G',5,'GROSIR');
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
INSERT INTO `tb_product` VALUES (1,'2023-10-15 13:46:52',1,'2023-10-15 13:54:59',1,'Mamasuka','MAMAS','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','0',70,1000.0000000000,'Sellable','Sellable'),(2,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,'Mamasuka','MAMAS','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','0',14,1000.0000000000,'Sellable','Sellable'),(3,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,'Mamasuka','MAMAS','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','0',80,1000.0000000000,'Sellable','Sellable'),(4,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,'Mamasuka','MAMAS','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','0',51,1000.0000000000,'Sellable','Sellable'),(5,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(6,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(7,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','Skunew003','Lemonilo Ramen Jepang','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(8,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(9,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(10,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(11,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(12,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(13,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','cassamo001','Cassamo Smoky BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(14,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','cassamo002','Cassamo Spicy BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(15,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','nealamami004','Alamami Ayam Goreng Kremes 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(16,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newalamami005','Alamami Nasi Goreng 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(17,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newalamami003','Alamami Rendang 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(18,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newgorme003','Gorme Rasa Kaldu Ayam Kampung 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(19,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newgorme002','Gorme Rasa Kaldu Jamur 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(20,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newgorme001','Gorme Rasa Kaldu Sapi 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(21,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','skunew004','Lemonilo chimi karamel mentega 50gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(22,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','solafarm002','Solafarm Beef Steak 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(23,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','salafarm001','Solafarm Seaweed 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(24,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','All Produk','All Produk','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(25,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newalamami001','Alamami Ayam Lengkuas 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(26,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','newalamami002','Alamami Opor Ayam 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(27,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','skunew001','Lemonilo Michoco 4 x 30 Gram','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(28,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','4.140402.022','Mie Kering 114Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(29,'2023-10-15 13:46:52',1,NULL,NULL,'Mamasuka','MAMAS','4.140901.032','Lemonilo Kanilo Kacang Panggang125Grx14','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(30,'2023-10-15 13:47:02',1,'2023-10-15 13:54:31',1,'Mamasuka','MAMAS','01','01','01','01',99,1.0000000000,'Gwp','Sellable');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_confirm`
--

LOCK TABLES `tb_product_confirm` WRITE;
/*!40000 ALTER TABLE `tb_product_confirm` DISABLE KEYS */;
INSERT INTO `tb_product_confirm` VALUES (1,'2023-10-15 13:54:31',1,NULL,NULL,'INV/20230929/MMS/00','01','Subdist A',1),(2,'2023-10-15 13:54:59',1,NULL,NULL,'INV/20230929/MMS/00','4.140402.016','Subdist A',30),(3,'2023-10-15 13:56:36',1,NULL,NULL,'INV/20230929/MMS/01','4.140401.027','Subdist A',86),(4,'2023-10-15 13:56:36',1,NULL,NULL,'INV/20230929/MMS/02','4.140402.017','Subdist A',20),(5,'2023-10-15 13:56:36',1,NULL,NULL,'INV/20230929/MMS/03','4.140401.028','Subdist A',45),(6,'2023-10-15 13:56:36',1,NULL,NULL,'INV/20230929/MMS/06','4.140401.028','Subdist A',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
INSERT INTO `tb_product_market` VALUES (1,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','TREC',1,0),(2,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','MAMASUKA',1,0),(3,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Distributor A',1,0),(4,'2023-10-15 13:46:52',1,'2023-10-15 13:54:59',1,1,'4.140402.016','Subdist A',1,70),(5,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir A',1,0),(6,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir B',1,0),(7,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir C',1,0),(8,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir D',1,0),(9,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir F',1,0),(10,'2023-10-15 13:46:52',1,'2023-10-15 13:54:54',1,1,'4.140402.016','Grosir G',1,0),(11,'2023-10-15 13:46:52',1,NULL,NULL,1,'4.140402.016','Subdist B',1,NULL),(12,'2023-10-15 13:46:52',1,NULL,NULL,1,'4.140402.016','Subdist C',1,NULL),(13,'2023-10-15 13:46:52',1,NULL,NULL,1,'4.140402.016','Subdist D',1,NULL),(14,'2023-10-15 13:46:52',1,NULL,NULL,1,'4.140402.016','Subdist E',1,NULL),(15,'2023-10-15 13:46:52',1,NULL,NULL,1,'4.140402.016','Distributor B',1,NULL),(16,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','TREC',1,0),(17,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','MAMASUKA',1,0),(18,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Distributor A',1,0),(19,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,2,'4.140401.027','Subdist A',1,14),(20,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir A',1,0),(21,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir B',1,0),(22,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir C',1,0),(23,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir D',1,0),(24,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir F',1,0),(25,'2023-10-15 13:46:52',1,'2023-10-15 13:55:41',1,2,'4.140401.027','Grosir G',1,0),(26,'2023-10-15 13:46:52',1,NULL,NULL,2,'4.140401.027','Subdist B',1,NULL),(27,'2023-10-15 13:46:52',1,NULL,NULL,2,'4.140401.027','Subdist C',1,NULL),(28,'2023-10-15 13:46:52',1,NULL,NULL,2,'4.140401.027','Subdist D',1,NULL),(29,'2023-10-15 13:46:52',1,NULL,NULL,2,'4.140401.027','Subdist E',1,NULL),(30,'2023-10-15 13:46:52',1,NULL,NULL,2,'4.140401.027','Distributor B',1,NULL),(31,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','TREC',1,0),(32,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','MAMASUKA',1,0),(33,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Distributor A',1,0),(34,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,3,'4.140402.017','Subdist A',1,80),(35,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir A',1,0),(36,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir B',1,0),(37,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir C',1,0),(38,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir D',1,0),(39,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir F',1,0),(40,'2023-10-15 13:46:52',1,'2023-10-15 13:56:00',1,3,'4.140402.017','Grosir G',1,0),(41,'2023-10-15 13:46:52',1,NULL,NULL,3,'4.140402.017','Subdist B',1,NULL),(42,'2023-10-15 13:46:52',1,NULL,NULL,3,'4.140402.017','Subdist C',1,NULL),(43,'2023-10-15 13:46:52',1,NULL,NULL,3,'4.140402.017','Subdist D',1,NULL),(44,'2023-10-15 13:46:52',1,NULL,NULL,3,'4.140402.017','Subdist E',1,NULL),(45,'2023-10-15 13:46:52',1,NULL,NULL,3,'4.140402.017','Distributor B',1,NULL),(46,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','TREC',1,0),(47,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','MAMASUKA',1,0),(48,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Distributor A',1,0),(49,'2023-10-15 13:46:52',1,'2023-10-15 13:56:36',1,4,'4.140401.028','Subdist A',1,51),(50,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir A',1,0),(51,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir B',1,0),(52,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir C',1,0),(53,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir D',1,0),(54,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir F',1,0),(55,'2023-10-15 13:46:52',1,'2023-10-15 13:56:28',1,4,'4.140401.028','Grosir G',1,0),(56,'2023-10-15 13:46:52',1,NULL,NULL,4,'4.140401.028','Subdist B',1,NULL),(57,'2023-10-15 13:46:52',1,NULL,NULL,4,'4.140401.028','Subdist C',1,NULL),(58,'2023-10-15 13:46:52',1,NULL,NULL,4,'4.140401.028','Subdist D',1,NULL),(59,'2023-10-15 13:46:52',1,NULL,NULL,4,'4.140401.028','Subdist E',1,NULL),(60,'2023-10-15 13:46:52',1,NULL,NULL,4,'4.140401.028','Distributor B',1,NULL),(61,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','TREC',1,NULL),(62,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','MAMASUKA',1,NULL),(63,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Distributor A',1,NULL),(64,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Subdist A',1,NULL),(65,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir A',1,NULL),(66,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir B',1,NULL),(67,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir C',1,NULL),(68,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir D',1,NULL),(69,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir F',1,NULL),(70,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Grosir G',1,NULL),(71,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Subdist B',1,NULL),(72,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Subdist C',1,NULL),(73,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Subdist D',1,NULL),(74,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Subdist E',1,NULL),(75,'2023-10-15 13:46:52',1,NULL,NULL,5,'4.140401.012','Distributor B',1,NULL),(76,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','TREC',1,NULL),(77,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','MAMASUKA',1,NULL),(78,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Distributor A',1,NULL),(79,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Subdist A',1,NULL),(80,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir A',1,NULL),(81,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir B',1,NULL),(82,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir C',1,NULL),(83,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir D',1,NULL),(84,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir F',1,NULL),(85,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Grosir G',1,NULL),(86,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Subdist B',1,NULL),(87,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Subdist C',1,NULL),(88,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Subdist D',1,NULL),(89,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Subdist E',1,NULL),(90,'2023-10-15 13:46:52',1,NULL,NULL,6,'4.140401.011','Distributor B',1,NULL),(91,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','TREC',1,NULL),(92,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','MAMASUKA',1,NULL),(93,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Distributor A',1,NULL),(94,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Subdist A',1,NULL),(95,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir A',1,NULL),(96,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir B',1,NULL),(97,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir C',1,NULL),(98,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir D',1,NULL),(99,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir F',1,NULL),(100,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Grosir G',1,NULL),(101,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Subdist B',1,NULL),(102,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Subdist C',1,NULL),(103,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Subdist D',1,NULL),(104,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Subdist E',1,NULL),(105,'2023-10-15 13:46:52',1,NULL,NULL,7,'Skunew003','Distributor B',1,NULL),(106,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','TREC',1,NULL),(107,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','MAMASUKA',1,NULL),(108,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Distributor A',1,NULL),(109,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Subdist A',1,NULL),(110,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir A',1,NULL),(111,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir B',1,NULL),(112,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir C',1,NULL),(113,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir D',1,NULL),(114,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir F',1,NULL),(115,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Grosir G',1,NULL),(116,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Subdist B',1,NULL),(117,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Subdist C',1,NULL),(118,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Subdist D',1,NULL),(119,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Subdist E',1,NULL),(120,'2023-10-15 13:46:52',1,NULL,NULL,8,'8997232970046','Distributor B',1,NULL),(121,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','TREC',1,NULL),(122,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','MAMASUKA',1,NULL),(123,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Distributor A',1,NULL),(124,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Subdist A',1,NULL),(125,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir A',1,NULL),(126,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir B',1,NULL),(127,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir C',1,NULL),(128,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir D',1,NULL),(129,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir F',1,NULL),(130,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Grosir G',1,NULL),(131,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Subdist B',1,NULL),(132,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Subdist C',1,NULL),(133,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Subdist D',1,NULL),(134,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Subdist E',1,NULL),(135,'2023-10-15 13:46:52',1,NULL,NULL,9,'8997232970053','Distributor B',1,NULL),(136,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','TREC',1,NULL),(137,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','MAMASUKA',1,NULL),(138,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Distributor A',1,NULL),(139,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Subdist A',1,NULL),(140,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir A',1,NULL),(141,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir B',1,NULL),(142,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir C',1,NULL),(143,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir D',1,NULL),(144,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir F',1,NULL),(145,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Grosir G',1,NULL),(146,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Subdist B',1,NULL),(147,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Subdist C',1,NULL),(148,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Subdist D',1,NULL),(149,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Subdist E',1,NULL),(150,'2023-10-15 13:46:52',1,NULL,NULL,10,'Skunew002','Distributor B',1,NULL),(151,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','TREC',1,NULL),(152,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','MAMASUKA',1,NULL),(153,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Distributor A',1,NULL),(154,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Subdist A',1,NULL),(155,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir A',1,NULL),(156,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir B',1,NULL),(157,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir C',1,NULL),(158,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir D',1,NULL),(159,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir F',1,NULL),(160,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Grosir G',1,NULL),(161,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Subdist B',1,NULL),(162,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Subdist C',1,NULL),(163,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Subdist D',1,NULL),(164,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Subdist E',1,NULL),(165,'2023-10-15 13:46:52',1,NULL,NULL,11,'4.140401.029','Distributor B',1,NULL),(166,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','TREC',1,NULL),(167,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','MAMASUKA',1,NULL),(168,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Distributor A',1,NULL),(169,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Subdist A',1,NULL),(170,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir A',1,NULL),(171,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir B',1,NULL),(172,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir C',1,NULL),(173,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir D',1,NULL),(174,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir F',1,NULL),(175,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Grosir G',1,NULL),(176,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Subdist B',1,NULL),(177,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Subdist C',1,NULL),(178,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Subdist D',1,NULL),(179,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Subdist E',1,NULL),(180,'2023-10-15 13:46:52',1,NULL,NULL,12,'konjagu001','Distributor B',1,NULL),(181,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','TREC',1,NULL),(182,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','MAMASUKA',1,NULL),(183,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Distributor A',1,NULL),(184,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Subdist A',1,NULL),(185,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir A',1,NULL),(186,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir B',1,NULL),(187,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir C',1,NULL),(188,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir D',1,NULL),(189,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir F',1,NULL),(190,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Grosir G',1,NULL),(191,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Subdist B',1,NULL),(192,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Subdist C',1,NULL),(193,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Subdist D',1,NULL),(194,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Subdist E',1,NULL),(195,'2023-10-15 13:46:52',1,NULL,NULL,13,'cassamo001','Distributor B',1,NULL),(196,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','TREC',1,NULL),(197,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','MAMASUKA',1,NULL),(198,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Distributor A',1,NULL),(199,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Subdist A',1,NULL),(200,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir A',1,NULL),(201,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir B',1,NULL),(202,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir C',1,NULL),(203,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir D',1,NULL),(204,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir F',1,NULL),(205,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Grosir G',1,NULL),(206,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Subdist B',1,NULL),(207,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Subdist C',1,NULL),(208,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Subdist D',1,NULL),(209,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Subdist E',1,NULL),(210,'2023-10-15 13:46:52',1,NULL,NULL,14,'cassamo002','Distributor B',1,NULL),(211,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','TREC',1,NULL),(212,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','MAMASUKA',1,NULL),(213,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Distributor A',1,NULL),(214,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Subdist A',1,NULL),(215,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir A',1,NULL),(216,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir B',1,NULL),(217,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir C',1,NULL),(218,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir D',1,NULL),(219,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir F',1,NULL),(220,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Grosir G',1,NULL),(221,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Subdist B',1,NULL),(222,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Subdist C',1,NULL),(223,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Subdist D',1,NULL),(224,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Subdist E',1,NULL),(225,'2023-10-15 13:46:52',1,NULL,NULL,15,'nealamami004','Distributor B',1,NULL),(226,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','TREC',1,NULL),(227,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','MAMASUKA',1,NULL),(228,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Distributor A',1,NULL),(229,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Subdist A',1,NULL),(230,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir A',1,NULL),(231,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir B',1,NULL),(232,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir C',1,NULL),(233,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir D',1,NULL),(234,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir F',1,NULL),(235,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Grosir G',1,NULL),(236,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Subdist B',1,NULL),(237,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Subdist C',1,NULL),(238,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Subdist D',1,NULL),(239,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Subdist E',1,NULL),(240,'2023-10-15 13:46:52',1,NULL,NULL,16,'newalamami005','Distributor B',1,NULL),(241,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','TREC',1,NULL),(242,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','MAMASUKA',1,NULL),(243,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Distributor A',1,NULL),(244,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Subdist A',1,NULL),(245,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir A',1,NULL),(246,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir B',1,NULL),(247,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir C',1,NULL),(248,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir D',1,NULL),(249,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir F',1,NULL),(250,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Grosir G',1,NULL),(251,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Subdist B',1,NULL),(252,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Subdist C',1,NULL),(253,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Subdist D',1,NULL),(254,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Subdist E',1,NULL),(255,'2023-10-15 13:46:52',1,NULL,NULL,17,'newalamami003','Distributor B',1,NULL),(256,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','TREC',1,NULL),(257,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','MAMASUKA',1,NULL),(258,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Distributor A',1,NULL),(259,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Subdist A',1,NULL),(260,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir A',1,NULL),(261,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir B',1,NULL),(262,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir C',1,NULL),(263,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir D',1,NULL),(264,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir F',1,NULL),(265,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Grosir G',1,NULL),(266,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Subdist B',1,NULL),(267,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Subdist C',1,NULL),(268,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Subdist D',1,NULL),(269,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Subdist E',1,NULL),(270,'2023-10-15 13:46:52',1,NULL,NULL,18,'newgorme003','Distributor B',1,NULL),(271,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','TREC',1,NULL),(272,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','MAMASUKA',1,NULL),(273,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Distributor A',1,NULL),(274,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Subdist A',1,NULL),(275,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir A',1,NULL),(276,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir B',1,NULL),(277,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir C',1,NULL),(278,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir D',1,NULL),(279,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir F',1,NULL),(280,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Grosir G',1,NULL),(281,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Subdist B',1,NULL),(282,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Subdist C',1,NULL),(283,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Subdist D',1,NULL),(284,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Subdist E',1,NULL),(285,'2023-10-15 13:46:52',1,NULL,NULL,19,'newgorme002','Distributor B',1,NULL),(286,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','TREC',1,NULL),(287,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','MAMASUKA',1,NULL),(288,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Distributor A',1,NULL),(289,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Subdist A',1,NULL),(290,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir A',1,NULL),(291,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir B',1,NULL),(292,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir C',1,NULL),(293,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir D',1,NULL),(294,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir F',1,NULL),(295,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Grosir G',1,NULL),(296,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Subdist B',1,NULL),(297,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Subdist C',1,NULL),(298,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Subdist D',1,NULL),(299,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Subdist E',1,NULL),(300,'2023-10-15 13:46:52',1,NULL,NULL,20,'newgorme001','Distributor B',1,NULL),(301,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','TREC',1,NULL),(302,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','MAMASUKA',1,NULL),(303,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Distributor A',1,NULL),(304,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Subdist A',1,NULL),(305,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir A',1,NULL),(306,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir B',1,NULL),(307,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir C',1,NULL),(308,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir D',1,NULL),(309,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir F',1,NULL),(310,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Grosir G',1,NULL),(311,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Subdist B',1,NULL),(312,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Subdist C',1,NULL),(313,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Subdist D',1,NULL),(314,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Subdist E',1,NULL),(315,'2023-10-15 13:46:52',1,NULL,NULL,21,'skunew004','Distributor B',1,NULL),(316,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','TREC',1,NULL),(317,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','MAMASUKA',1,NULL),(318,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Distributor A',1,NULL),(319,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Subdist A',1,NULL),(320,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir A',1,NULL),(321,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir B',1,NULL),(322,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir C',1,NULL),(323,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir D',1,NULL),(324,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir F',1,NULL),(325,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Grosir G',1,NULL),(326,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Subdist B',1,NULL),(327,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Subdist C',1,NULL),(328,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Subdist D',1,NULL),(329,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Subdist E',1,NULL),(330,'2023-10-15 13:46:52',1,NULL,NULL,22,'solafarm002','Distributor B',1,NULL),(331,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','TREC',1,NULL),(332,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','MAMASUKA',1,NULL),(333,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Distributor A',1,NULL),(334,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Subdist A',1,NULL),(335,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir A',1,NULL),(336,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir B',1,NULL),(337,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir C',1,NULL),(338,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir D',1,NULL),(339,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir F',1,NULL),(340,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Grosir G',1,NULL),(341,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Subdist B',1,NULL),(342,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Subdist C',1,NULL),(343,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Subdist D',1,NULL),(344,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Subdist E',1,NULL),(345,'2023-10-15 13:46:52',1,NULL,NULL,23,'salafarm001','Distributor B',1,NULL),(346,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','TREC',1,NULL),(347,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','MAMASUKA',1,NULL),(348,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Distributor A',1,NULL),(349,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Subdist A',1,NULL),(350,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir A',1,NULL),(351,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir B',1,NULL),(352,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir C',1,NULL),(353,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir D',1,NULL),(354,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir F',1,NULL),(355,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Grosir G',1,NULL),(356,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Subdist B',1,NULL),(357,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Subdist C',1,NULL),(358,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Subdist D',1,NULL),(359,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Subdist E',1,NULL),(360,'2023-10-15 13:46:52',1,NULL,NULL,24,'All Produk','Distributor B',1,NULL),(361,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','TREC',1,NULL),(362,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','MAMASUKA',1,NULL),(363,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Distributor A',1,NULL),(364,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Subdist A',1,NULL),(365,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir A',1,NULL),(366,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir B',1,NULL),(367,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir C',1,NULL),(368,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir D',1,NULL),(369,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir F',1,NULL),(370,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Grosir G',1,NULL),(371,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Subdist B',1,NULL),(372,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Subdist C',1,NULL),(373,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Subdist D',1,NULL),(374,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Subdist E',1,NULL),(375,'2023-10-15 13:46:52',1,NULL,NULL,25,'newalamami001','Distributor B',1,NULL),(376,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','TREC',1,NULL),(377,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','MAMASUKA',1,NULL),(378,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Distributor A',1,NULL),(379,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Subdist A',1,NULL),(380,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir A',1,NULL),(381,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir B',1,NULL),(382,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir C',1,NULL),(383,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir D',1,NULL),(384,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir F',1,NULL),(385,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Grosir G',1,NULL),(386,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Subdist B',1,NULL),(387,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Subdist C',1,NULL),(388,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Subdist D',1,NULL),(389,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Subdist E',1,NULL),(390,'2023-10-15 13:46:52',1,NULL,NULL,26,'newalamami002','Distributor B',1,NULL),(391,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','TREC',1,NULL),(392,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','MAMASUKA',1,NULL),(393,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Distributor A',1,NULL),(394,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Subdist A',1,NULL),(395,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir A',1,NULL),(396,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir B',1,NULL),(397,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir C',1,NULL),(398,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir D',1,NULL),(399,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir F',1,NULL),(400,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Grosir G',1,NULL),(401,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Subdist B',1,NULL),(402,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Subdist C',1,NULL),(403,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Subdist D',1,NULL),(404,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Subdist E',1,NULL),(405,'2023-10-15 13:46:52',1,NULL,NULL,27,'skunew001','Distributor B',1,NULL),(406,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','TREC',1,NULL),(407,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','MAMASUKA',1,NULL),(408,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Distributor A',1,NULL),(409,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Subdist A',1,NULL),(410,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir A',1,NULL),(411,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir B',1,NULL),(412,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir C',1,NULL),(413,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir D',1,NULL),(414,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir F',1,NULL),(415,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Grosir G',1,NULL),(416,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Subdist B',1,NULL),(417,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Subdist C',1,NULL),(418,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Subdist D',1,NULL),(419,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Subdist E',1,NULL),(420,'2023-10-15 13:46:52',1,NULL,NULL,28,'4.140402.022','Distributor B',1,NULL),(421,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','TREC',1,NULL),(422,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','MAMASUKA',1,NULL),(423,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Distributor A',1,NULL),(424,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Subdist A',1,NULL),(425,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir A',1,NULL),(426,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir B',1,NULL),(427,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir C',1,NULL),(428,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir D',1,NULL),(429,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir F',1,NULL),(430,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Grosir G',1,NULL),(431,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Subdist B',1,NULL),(432,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Subdist C',1,NULL),(433,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Subdist D',1,NULL),(434,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Subdist E',1,NULL),(435,'2023-10-15 13:46:52',1,NULL,NULL,29,'4.140901.032','Distributor B',1,NULL),(436,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','TREC',1,0),(437,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','MAMASUKA',1,0),(438,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Distributor A',1,0),(439,'2023-10-15 13:47:02',1,'2023-10-15 13:54:31',1,30,'01','Subdist A',1,99),(440,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir A',1,0),(441,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir B',1,0),(442,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir C',1,0),(443,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir D',1,0),(444,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir F',1,0),(445,'2023-10-15 13:47:02',1,'2023-10-15 13:52:59',1,30,'01','Grosir G',1,0),(446,'2023-10-15 13:47:02',1,NULL,NULL,30,'01','Subdist B',1,NULL),(447,'2023-10-15 13:47:02',1,NULL,NULL,30,'01','Subdist C',1,NULL),(448,'2023-10-15 13:47:02',1,NULL,NULL,30,'01','Subdist D',1,NULL),(449,'2023-10-15 13:47:02',1,NULL,NULL,30,'01','Subdist E',1,NULL),(450,'2023-10-15 13:47:02',1,NULL,NULL,30,'01','Distributor B',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-15 13:53:39',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'pxswhb9314w1eu67c6bbh1x1tfqqfs73yhwo','ADMIN'),(2,NULL,NULL,'2023-10-16 15:58:36',2,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','one',NULL,NULL,NULL,'active',NULL,NULL,'br2rtdj6uims6eyts9ofgx5yy12pu1cim8q3','PRINCIPAL'),(3,NULL,NULL,'2023-10-16 15:54:14',1,'pic2@mail.com','202cb962ac59075b964b07152d234b70','pic','two',NULL,NULL,NULL,'active',NULL,NULL,'b3n95p03tsdpm9fya84cnelibj9u34xffz6j','DISTRIBUTOR'),(4,'2023-10-01 11:49:59',1,'2023-10-16 15:54:21',1,'pic3@mail.com','202cb962ac59075b964b07152d234b70','pic','three',NULL,NULL,NULL,'active',NULL,NULL,'ur2r10iu2jq6smbzo7gtfhkhy0zjc61fpkev','SUBDIST');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,'2023-10-15 11:34:57',1,NULL,NULL,1,'Mamasuka','MAMAS',1),(8,'2023-10-16 15:54:14',1,NULL,NULL,3,'Mamasuka','MAMAS',1),(9,'2023-10-16 15:54:21',1,NULL,NULL,4,'Mamasuka','MAMAS',1),(10,'2023-10-16 15:58:36',2,NULL,NULL,2,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (8,'2023-09-26 15:05:35',1,NULL,NULL,1,'TREC',1),(9,'2023-09-26 15:05:35',1,NULL,NULL,1,'SUKANDA',1),(10,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor A',1),(11,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist A',1),(12,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir A',1),(13,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir B',1),(14,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir C',1),(15,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir D',1),(16,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir F',1),(17,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir G',1),(18,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist B',1),(19,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist C',1),(20,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist D',1),(21,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist E',1),(22,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor B',1),(337,'2023-10-16 15:54:14',1,NULL,NULL,3,'Distributor A',1),(338,'2023-10-16 15:54:14',1,NULL,NULL,3,'Distributor B',1),(339,'2023-10-16 15:54:14',1,NULL,NULL,3,'Subdist A',1),(340,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir A',1),(341,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir B',1),(342,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir C',1),(343,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir D',1),(344,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir F',1),(345,'2023-10-16 15:54:14',1,NULL,NULL,3,'Grosir G',1),(346,'2023-10-16 15:54:14',1,NULL,NULL,3,'Subdist B',1),(347,'2023-10-16 15:54:14',1,NULL,NULL,3,'Subdist C',1),(348,'2023-10-16 15:54:14',1,NULL,NULL,3,'Subdist D',1),(349,'2023-10-16 15:54:14',1,NULL,NULL,3,'Subdist E',1),(350,'2023-10-16 15:54:21',1,NULL,NULL,4,'Subdist A',1),(351,'2023-10-16 15:54:21',1,NULL,NULL,4,'Subdist B',1),(352,'2023-10-16 15:54:21',1,NULL,NULL,4,'Subdist C',1),(353,'2023-10-16 15:54:21',1,NULL,NULL,4,'Subdist D',1),(354,'2023-10-16 15:54:21',1,NULL,NULL,4,'Subdist E',1),(355,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir A',1),(356,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir B',1),(357,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir C',1),(358,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir D',1),(359,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir F',1),(360,'2023-10-16 15:54:21',1,NULL,NULL,4,'Grosir G',1),(361,'2023-10-16 15:58:36',2,NULL,NULL,2,'SUKANDA',1),(362,'2023-10-16 15:58:36',2,NULL,NULL,2,'Distributor A',0),(363,'2023-10-16 15:58:36',2,NULL,NULL,2,'Subdist A',0),(364,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir A',0),(365,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir B',0),(366,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir C',0),(367,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir D',0),(368,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir F',0),(369,'2023-10-16 15:58:36',2,NULL,NULL,2,'Grosir G',0),(370,'2023-10-16 15:58:36',2,NULL,NULL,2,'Subdist B',0),(371,'2023-10-16 15:58:36',2,NULL,NULL,2,'Subdist C',0),(372,'2023-10-16 15:58:36',2,NULL,NULL,2,'Subdist D',0),(373,'2023-10-16 15:58:36',2,NULL,NULL,2,'Subdist E',0),(374,'2023-10-16 15:58:36',2,NULL,NULL,2,'Distributor B',0);
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

-- Dump completed on 2023-10-16 23:11:02
