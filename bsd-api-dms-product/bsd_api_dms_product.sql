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
INSERT INTO `tb_product` VALUES (1,'2023-10-05 15:10:19',4,'2023-10-05 15:11:18',4,'Mamasuka','MAMAS','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode',NULL,70,1000.0000000000,'Sellable',NULL),(2,'2023-10-05 15:10:19',4,'2023-10-05 15:11:31',4,'Mamasuka','MAMAS','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode',NULL,14,1000.0000000000,'Sellable',NULL),(3,'2023-10-05 15:10:19',4,'2023-10-05 15:31:33',4,'Mamasuka','MAMAS','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode',NULL,80,1000.0000000000,'Sellable',NULL),(4,'2023-10-05 15:10:19',4,'2023-10-05 15:31:33',4,'Mamasuka','MAMAS','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode',NULL,55,1000.0000000000,'Sellable',NULL),(5,'2023-10-05 15:10:19',4,'2023-10-05 15:31:34',4,'Mamasuka','MAMAS','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode',NULL,69,1000.0000000000,'Sellable',NULL),(6,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(7,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','Skunew003','Lemonilo Ramen Jepang','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(8,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(9,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(10,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(11,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(12,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(13,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','cassamo001','Cassamo Smoky BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(14,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','cassamo002','Cassamo Spicy BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(15,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','nealamami004','Alamami Ayam Goreng Kremes 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(16,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newalamami005','Alamami Nasi Goreng 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(17,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newalamami003','Alamami Rendang 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(18,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newgorme003','Gorme Rasa Kaldu Ayam Kampung 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(19,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newgorme002','Gorme Rasa Kaldu Jamur 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(20,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newgorme001','Gorme Rasa Kaldu Sapi 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(21,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','skunew004','Lemonilo chimi karamel mentega 50gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(22,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','solafarm002','Solafarm Beef Steak 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(23,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','salafarm001','Solafarm Seaweed 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(24,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','All Produk','All Produk','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(25,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newalamami001','Alamami Ayam Lengkuas 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(26,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','newalamami002','Alamami Opor Ayam 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(27,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','skunew001','Lemonilo Michoco 4 x 30 Gram','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(28,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','4.140402.022','Mie Kering 114Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL),(29,'2023-10-05 15:10:19',4,NULL,NULL,'Mamasuka','MAMAS','4.140901.032','Lemonilo Kanilo Kacang Panggang125Grx14','NO Barcode',NULL,100,1000.0000000000,'Sellable',NULL);
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
  `tbpc_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpc_id`),
  KEY `tb_product_confirm_tbpc_order_no_index` (`tbpc_order_no`),
  KEY `tb_product_confirm_tbpc_sku_index` (`tbpc_sku`),
  KEY `tb_product_confirm_tbpc_qty_index` (`tbpc_qty`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_confirm`
--

LOCK TABLES `tb_product_confirm` WRITE;
/*!40000 ALTER TABLE `tb_product_confirm` DISABLE KEYS */;
INSERT INTO `tb_product_confirm` VALUES (1,'2023-10-05 15:11:18',4,NULL,NULL,'INV/20230929/MMS/00','4.140402.016',30),(2,'2023-10-05 15:11:31',4,NULL,NULL,'INV/20230929/MMS/01','4.140401.027',86),(3,'2023-10-05 15:31:33',4,NULL,NULL,'INV/20230929/MMS/02','4.140402.017',20),(4,'2023-10-05 15:31:33',4,NULL,NULL,'INV/20230929/MMS/03','4.140401.028',45),(5,'2023-10-05 15:31:34',4,NULL,NULL,'INV/20230929/MMS/04','4.140401.012',31);
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
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
INSERT INTO `tb_product_market` VALUES (1,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Subdist A',1),(2,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Subdist B',1),(3,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Subdist C',1),(4,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Subdist D',1),(5,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Subdist E',1),(6,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir A',1),(7,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir B',1),(8,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir C',1),(9,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir D',1),(10,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir F',1),(11,'2023-10-05 15:10:19',4,NULL,NULL,1,'4.140402.016','Grosir G',1),(12,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Subdist A',1),(13,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Subdist B',1),(14,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Subdist C',1),(15,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Subdist D',1),(16,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Subdist E',1),(17,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir A',1),(18,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir B',1),(19,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir C',1),(20,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir D',1),(21,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir F',1),(22,'2023-10-05 15:10:19',4,NULL,NULL,2,'4.140401.027','Grosir G',1),(23,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Subdist A',1),(24,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Subdist B',1),(25,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Subdist C',1),(26,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Subdist D',1),(27,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Subdist E',1),(28,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir A',1),(29,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir B',1),(30,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir C',1),(31,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir D',1),(32,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir F',1),(33,'2023-10-05 15:10:19',4,NULL,NULL,3,'4.140402.017','Grosir G',1),(34,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Subdist A',1),(35,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Subdist B',1),(36,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Subdist C',1),(37,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Subdist D',1),(38,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Subdist E',1),(39,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir A',1),(40,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir B',1),(41,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir C',1),(42,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir D',1),(43,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir F',1),(44,'2023-10-05 15:10:19',4,NULL,NULL,4,'4.140401.028','Grosir G',1),(45,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Subdist A',1),(46,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Subdist B',1),(47,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Subdist C',1),(48,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Subdist D',1),(49,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Subdist E',1),(50,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir A',1),(51,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir B',1),(52,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir C',1),(53,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir D',1),(54,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir F',1),(55,'2023-10-05 15:10:19',4,NULL,NULL,5,'4.140401.012','Grosir G',1),(56,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Subdist A',1),(57,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Subdist B',1),(58,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Subdist C',1),(59,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Subdist D',1),(60,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Subdist E',1),(61,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir A',1),(62,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir B',1),(63,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir C',1),(64,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir D',1),(65,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir F',1),(66,'2023-10-05 15:10:19',4,NULL,NULL,6,'4.140401.011','Grosir G',1),(67,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Subdist A',1),(68,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Subdist B',1),(69,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Subdist C',1),(70,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Subdist D',1),(71,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Subdist E',1),(72,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir A',1),(73,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir B',1),(74,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir C',1),(75,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir D',1),(76,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir F',1),(77,'2023-10-05 15:10:19',4,NULL,NULL,7,'Skunew003','Grosir G',1),(78,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Subdist A',1),(79,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Subdist B',1),(80,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Subdist C',1),(81,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Subdist D',1),(82,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Subdist E',1),(83,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir A',1),(84,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir B',1),(85,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir C',1),(86,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir D',1),(87,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir F',1),(88,'2023-10-05 15:10:19',4,NULL,NULL,8,'8997232970046','Grosir G',1),(89,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Subdist A',1),(90,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Subdist B',1),(91,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Subdist C',1),(92,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Subdist D',1),(93,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Subdist E',1),(94,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir A',1),(95,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir B',1),(96,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir C',1),(97,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir D',1),(98,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir F',1),(99,'2023-10-05 15:10:19',4,NULL,NULL,9,'8997232970053','Grosir G',1),(100,'2023-10-05 15:10:19',4,NULL,NULL,10,'Skunew002','Subdist A',1),(101,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Subdist B',1),(102,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Subdist C',1),(103,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Subdist D',1),(104,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Subdist E',1),(105,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir A',1),(106,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir B',1),(107,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir C',1),(108,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir D',1),(109,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir F',1),(110,'2023-10-05 15:10:20',4,NULL,NULL,10,'Skunew002','Grosir G',1),(111,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Subdist A',1),(112,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Subdist B',1),(113,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Subdist C',1),(114,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Subdist D',1),(115,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Subdist E',1),(116,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir A',1),(117,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir B',1),(118,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir C',1),(119,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir D',1),(120,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir F',1),(121,'2023-10-05 15:10:20',4,NULL,NULL,11,'4.140401.029','Grosir G',1),(122,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Subdist A',1),(123,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Subdist B',1),(124,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Subdist C',1),(125,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Subdist D',1),(126,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Subdist E',1),(127,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir A',1),(128,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir B',1),(129,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir C',1),(130,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir D',1),(131,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir F',1),(132,'2023-10-05 15:10:20',4,NULL,NULL,12,'konjagu001','Grosir G',1),(133,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Subdist A',1),(134,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Subdist B',1),(135,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Subdist C',1),(136,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Subdist D',1),(137,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Subdist E',1),(138,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir A',1),(139,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir B',1),(140,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir C',1),(141,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir D',1),(142,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir F',1),(143,'2023-10-05 15:10:20',4,NULL,NULL,13,'cassamo001','Grosir G',1),(144,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Subdist A',1),(145,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Subdist B',1),(146,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Subdist C',1),(147,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Subdist D',1),(148,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Subdist E',1),(149,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir A',1),(150,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir B',1),(151,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir C',1),(152,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir D',1),(153,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir F',1),(154,'2023-10-05 15:10:20',4,NULL,NULL,14,'cassamo002','Grosir G',1),(155,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Subdist A',1),(156,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Subdist B',1),(157,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Subdist C',1),(158,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Subdist D',1),(159,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Subdist E',1),(160,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir A',1),(161,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir B',1),(162,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir C',1),(163,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir D',1),(164,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir F',1),(165,'2023-10-05 15:10:20',4,NULL,NULL,15,'nealamami004','Grosir G',1),(166,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Subdist A',1),(167,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Subdist B',1),(168,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Subdist C',1),(169,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Subdist D',1),(170,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Subdist E',1),(171,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir A',1),(172,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir B',1),(173,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir C',1),(174,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir D',1),(175,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir F',1),(176,'2023-10-05 15:10:20',4,NULL,NULL,16,'newalamami005','Grosir G',1),(177,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Subdist A',1),(178,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Subdist B',1),(179,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Subdist C',1),(180,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Subdist D',1),(181,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Subdist E',1),(182,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir A',1),(183,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir B',1),(184,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir C',1),(185,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir D',1),(186,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir F',1),(187,'2023-10-05 15:10:20',4,NULL,NULL,17,'newalamami003','Grosir G',1),(188,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Subdist A',1),(189,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Subdist B',1),(190,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Subdist C',1),(191,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Subdist D',1),(192,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Subdist E',1),(193,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir A',1),(194,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir B',1),(195,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir C',1),(196,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir D',1),(197,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir F',1),(198,'2023-10-05 15:10:20',4,NULL,NULL,18,'newgorme003','Grosir G',1),(199,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Subdist A',1),(200,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Subdist B',1),(201,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Subdist C',1),(202,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Subdist D',1),(203,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Subdist E',1),(204,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir A',1),(205,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir B',1),(206,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir C',1),(207,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir D',1),(208,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir F',1),(209,'2023-10-05 15:10:20',4,NULL,NULL,19,'newgorme002','Grosir G',1),(210,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Subdist A',1),(211,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Subdist B',1),(212,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Subdist C',1),(213,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Subdist D',1),(214,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Subdist E',1),(215,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir A',1),(216,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir B',1),(217,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir C',1),(218,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir D',1),(219,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir F',1),(220,'2023-10-05 15:10:20',4,NULL,NULL,20,'newgorme001','Grosir G',1),(221,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Subdist A',1),(222,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Subdist B',1),(223,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Subdist C',1),(224,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Subdist D',1),(225,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Subdist E',1),(226,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir A',1),(227,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir B',1),(228,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir C',1),(229,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir D',1),(230,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir F',1),(231,'2023-10-05 15:10:20',4,NULL,NULL,21,'skunew004','Grosir G',1),(232,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Subdist A',1),(233,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Subdist B',1),(234,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Subdist C',1),(235,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Subdist D',1),(236,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Subdist E',1),(237,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir A',1),(238,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir B',1),(239,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir C',1),(240,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir D',1),(241,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir F',1),(242,'2023-10-05 15:10:20',4,NULL,NULL,22,'solafarm002','Grosir G',1),(243,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Subdist A',1),(244,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Subdist B',1),(245,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Subdist C',1),(246,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Subdist D',1),(247,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Subdist E',1),(248,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir A',1),(249,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir B',1),(250,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir C',1),(251,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir D',1),(252,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir F',1),(253,'2023-10-05 15:10:20',4,NULL,NULL,23,'salafarm001','Grosir G',1),(254,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Subdist A',1),(255,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Subdist B',1),(256,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Subdist C',1),(257,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Subdist D',1),(258,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Subdist E',1),(259,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir A',1),(260,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir B',1),(261,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir C',1),(262,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir D',1),(263,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir F',1),(264,'2023-10-05 15:10:20',4,NULL,NULL,24,'All Produk','Grosir G',1),(265,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Subdist A',1),(266,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Subdist B',1),(267,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Subdist C',1),(268,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Subdist D',1),(269,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Subdist E',1),(270,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir A',1),(271,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir B',1),(272,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir C',1),(273,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir D',1),(274,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir F',1),(275,'2023-10-05 15:10:20',4,NULL,NULL,25,'newalamami001','Grosir G',1),(276,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Subdist A',1),(277,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Subdist B',1),(278,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Subdist C',1),(279,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Subdist D',1),(280,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Subdist E',1),(281,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir A',1),(282,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir B',1),(283,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir C',1),(284,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir D',1),(285,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir F',1),(286,'2023-10-05 15:10:20',4,NULL,NULL,26,'newalamami002','Grosir G',1),(287,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Subdist A',1),(288,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Subdist B',1),(289,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Subdist C',1),(290,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Subdist D',1),(291,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Subdist E',1),(292,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir A',1),(293,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir B',1),(294,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir C',1),(295,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir D',1),(296,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir F',1),(297,'2023-10-05 15:10:20',4,NULL,NULL,27,'skunew001','Grosir G',1),(298,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Subdist A',1),(299,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Subdist B',1),(300,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Subdist C',1),(301,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Subdist D',1),(302,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Subdist E',1),(303,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir A',1),(304,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir B',1),(305,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir C',1),(306,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir D',1),(307,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir F',1),(308,'2023-10-05 15:10:20',4,NULL,NULL,28,'4.140402.022','Grosir G',1),(309,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Subdist A',1),(310,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Subdist B',1),(311,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Subdist C',1),(312,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Subdist D',1),(313,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Subdist E',1),(314,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir A',1),(315,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir B',1),(316,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir C',1),(317,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir D',1),(318,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir F',1),(319,'2023-10-05 15:10:20',4,NULL,NULL,29,'4.140901.032','Grosir G',1);
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
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-01 11:52:13',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'e4zsozcucatt2rxjzoas5valt3kszoe8rpa5','ADMIN'),(2,NULL,NULL,'2023-10-01 11:48:33',1,'pic1@mail.com','202cb962ac59075b964b07152d234b70','pic','one',NULL,NULL,NULL,'active',NULL,NULL,'ng843n6ocg719kklqklb5814t9n2ahilj9zv','PRINCIPAL'),(3,NULL,NULL,'2023-10-01 11:48:54',1,'pic2@mail.com','202cb962ac59075b964b07152d234b70','pic','pic',NULL,NULL,NULL,'active',NULL,NULL,'b3n95p03tsdpm9fya84cnelibj9u34xffz6j','DISTRIBUTOR'),(4,'2023-10-01 11:49:59',1,'2023-10-05 14:59:58',4,'pic3@mail.com','202cb962ac59075b964b07152d234b70','pic','three',NULL,NULL,NULL,'active',NULL,NULL,'hf9510opo6mwa5c8faxffsxhao5wzdktawev','SUBDIST');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (1,NULL,1,NULL,NULL,1,'Mamasuka','MAMAS',1),(4,'2023-10-01 11:48:33',1,NULL,NULL,2,'Mamasuka','MAMAS',1),(5,'2023-10-01 11:48:54',1,NULL,NULL,3,'Mamasuka','MAMAS',1),(8,'2023-10-01 12:51:12',4,NULL,NULL,4,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (8,'2023-09-26 15:05:35',1,NULL,NULL,1,'TREC',1),(9,'2023-09-26 15:05:35',1,NULL,NULL,1,'SUKANDA',1),(10,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor A',1),(11,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist A',1),(12,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir A',1),(13,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir B',1),(14,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir C',1),(15,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir D',1),(16,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir F',1),(17,'2023-09-26 15:05:35',1,NULL,NULL,1,'Grosir G',1),(18,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist B',1),(19,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist C',1),(20,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist D',1),(21,'2023-09-26 15:05:35',1,NULL,NULL,1,'Subdist E',1),(22,'2023-09-26 15:05:35',1,NULL,NULL,1,'Distributor B',1),(23,'2023-10-01 11:48:33',1,NULL,NULL,2,'TREC',1),(24,'2023-10-01 11:48:33',1,NULL,NULL,2,'SUKANDA',1),(25,'2023-10-01 11:48:33',1,NULL,NULL,2,'Distributor A',0),(26,'2023-10-01 11:48:33',1,NULL,NULL,2,'Subdist A',0),(27,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir A',0),(28,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir B',0),(29,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir C',0),(30,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir D',0),(31,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir F',0),(32,'2023-10-01 11:48:33',1,NULL,NULL,2,'Grosir G',0),(33,'2023-10-01 11:48:33',1,NULL,NULL,2,'Subdist B',0),(34,'2023-10-01 11:48:33',1,NULL,NULL,2,'Subdist C',0),(35,'2023-10-01 11:48:33',1,NULL,NULL,2,'Subdist D',0),(36,'2023-10-01 11:48:33',1,NULL,NULL,2,'Subdist E',0),(37,'2023-10-01 11:48:33',1,NULL,NULL,2,'Distributor B',0),(38,'2023-10-01 11:48:54',1,NULL,NULL,3,'Distributor A',0),(39,'2023-10-01 11:48:54',1,NULL,NULL,3,'Distributor B',0),(40,'2023-10-01 11:48:54',1,NULL,NULL,3,'SUKANDA',1),(41,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist A',0),(42,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir A',0),(43,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir B',0),(44,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir C',0),(45,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir D',0),(46,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir F',0),(47,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir G',0),(48,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist B',0),(49,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist C',0),(50,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist D',0),(51,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist E',0),(52,'2023-10-01 11:48:54',1,NULL,NULL,3,'Distributor A',0),(53,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist A',0),(54,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir A',0),(55,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir B',0),(56,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir C',0),(57,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir D',0),(58,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir F',0),(59,'2023-10-01 11:48:54',1,NULL,NULL,3,'Grosir G',0),(60,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist B',0),(61,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist C',0),(62,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist D',0),(63,'2023-10-01 11:48:54',1,NULL,NULL,3,'Subdist E',0),(64,'2023-10-01 11:48:54',1,NULL,NULL,3,'Distributor B',0),(76,'2023-10-01 12:51:12',4,NULL,NULL,4,'Subdist A',1),(77,'2023-10-01 12:51:12',4,NULL,NULL,4,'Subdist B',1),(78,'2023-10-01 12:51:12',4,NULL,NULL,4,'Subdist C',1),(79,'2023-10-01 12:51:12',4,NULL,NULL,4,'Subdist D',1),(80,'2023-10-01 12:51:12',4,NULL,NULL,4,'Subdist E',1),(81,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir A',1),(82,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir B',1),(83,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir C',1),(84,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir D',1),(85,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir F',1),(86,'2023-10-01 12:51:12',4,NULL,NULL,4,'Grosir G',1);
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

-- Dump completed on 2023-10-05 22:32:43
