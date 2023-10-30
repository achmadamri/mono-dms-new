-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_report
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
  UNIQUE KEY `tb_order_key_1` (`tbo_order_no`,`tbo_seq`),
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,'2023-10-30 01:01:11',14,NULL,NULL,1,'Mamasuka','SUBDIST_1',1,1,1,'1/1','INV/20230929/MMS/00','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',30,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','1BRTHOCXSILQNHX','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(2,'2023-10-30 01:01:11',14,NULL,NULL,2,'Mamasuka','SUBDIST_1',1,1,1,'1/2','INV/20230929/MMS/01','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',86,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','J201HP0D82JW48R','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(3,'2023-10-30 01:01:11',14,NULL,NULL,3,'Mamasuka','SUBDIST_1',1,1,1,'1/3','INV/20230929/MMS/02','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',20,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','WAZHGCWW3T9IQCO','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(4,'2023-10-30 01:01:11',14,NULL,NULL,4,'Mamasuka','SUBDIST_1',1,1,1,'1/4','INV/20230929/MMS/03','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',45,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','UG20PLZ63ZJLF6R','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(5,'2023-10-30 01:01:11',14,NULL,NULL,5,'Mamasuka','SUBDIST_1',1,1,1,'1/5','INV/20230929/MMS/04','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',31,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','PPGN4C19RE25N05','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(6,'2023-10-30 01:01:11',14,NULL,NULL,6,'Mamasuka','SUBDIST_1',1,1,1,'1/6','INV/20230929/MMS/05','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',40,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','NUHSPR7UY30UIN3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(7,'2023-10-30 01:01:11',14,NULL,NULL,7,'Mamasuka','SUBDIST_1',1,1,1,'1/7','INV/20230929/MMS/06','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','8S9WXZHTWQJAVP6','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(8,'2023-10-30 01:01:11',14,NULL,NULL,8,'Mamasuka','SUBDIST_1',1,1,1,'1/8','INV/20230929/MMS/07','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',10,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','LQ6G5WBA8DCYR4X','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(9,'2023-10-30 01:01:11',14,NULL,NULL,9,'Mamasuka','SUBDIST_1',1,1,1,'1/9','INV/20230929/MMS/08','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','WOEINX6UTE4CSFC','Delivered','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(10,'2023-10-30 01:01:11',14,NULL,NULL,10,'Mamasuka','SUBDIST_1',1,1,1,'1/10','INV/20230929/MMS/09','Skunew003','Lemonilo Ramen Jepang','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','QDT7L7W1MES0ZKR','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(11,'2023-10-30 01:01:11',14,NULL,NULL,11,'Mamasuka','SUBDIST_1',1,1,1,'1/11','INV/20230929/MMS/10','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',25,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','QXFPXUNZ99M9LMH','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(12,'2023-10-30 01:01:11',14,NULL,NULL,12,'Mamasuka','SUBDIST_1',1,1,1,'1/12','INV/20230929/MMS/11','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode','',34,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','7A6T5AS6QVAVADB','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(13,'2023-10-30 01:01:11',14,NULL,NULL,13,'Mamasuka','SUBDIST_1',1,1,1,'1/13','INV/20230929/MMS/12','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',27,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','O5QBTC4DRZQF4TT','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(14,'2023-10-30 01:01:11',14,NULL,NULL,14,'Mamasuka','SUBDIST_1',1,1,1,'1/14','INV/20230929/MMS/13','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',6,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','ZMRN8EW2FURXZK6','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(15,'2023-10-30 01:01:11',14,NULL,NULL,15,'Mamasuka','SUBDIST_1',1,1,1,'1/15','INV/20230929/MMS/14','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','NFEKT3WRRWZBRX6','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(16,'2023-10-30 01:01:11',14,NULL,NULL,16,'Mamasuka','SUBDIST_1',1,1,1,'1/16','INV/20230929/MMS/15','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode','',0,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','X54PJC3I6IU72LD','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(17,'2023-10-30 01:01:11',14,NULL,NULL,17,'Mamasuka','SUBDIST_1',1,1,1,'1/17','INV/20230929/MMS/16','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',7,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','6SZ5J33A33QBY8G','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(18,'2023-10-30 01:01:11',14,NULL,NULL,18,'Mamasuka','SUBDIST_1',1,1,1,'1/18','INV/20230929/MMS/17','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',6,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','GW5I7ACMLN9ZWJE','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(19,'2023-10-30 01:01:11',14,NULL,NULL,19,'Mamasuka','SUBDIST_1',1,1,1,'1/19','INV/20230929/MMS/18','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',27,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','GELT8WRHFWVSESQ','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(20,'2023-10-30 01:01:11',14,NULL,NULL,20,'Mamasuka','SUBDIST_1',1,1,1,'1/20','INV/20230929/MMS/19','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',19,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','KDTS4JS8P5SXPFM','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(21,'2023-10-30 01:01:11',14,NULL,NULL,21,'Mamasuka','SUBDIST_1',1,1,1,'1/21','INV/20230929/MMS/20','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',41,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','JZY81J95YNYWIAW','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(22,'2023-10-30 01:01:11',14,NULL,NULL,22,'Mamasuka','SUBDIST_1',1,1,1,'1/22','INV/20230929/MMS/21','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',18,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','YG5G9BELG1J7GBY','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(23,'2023-10-30 01:01:11',14,NULL,NULL,23,'Mamasuka','SUBDIST_1',1,1,1,'1/23','INV/20230929/MMS/22','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',22,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','13I2AK6CQP6H2HG','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(24,'2023-10-30 01:01:11',14,NULL,NULL,24,'Mamasuka','SUBDIST_1',1,1,1,'1/24','INV/20230929/MMS/23','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',36,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','TIPN5870DJVIG7H','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(25,'2023-10-30 01:01:11',14,NULL,NULL,25,'Mamasuka','SUBDIST_1',1,1,1,'1/25','INV/20230929/MMS/24','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','2O7CR0EVV0FDGDH','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(26,'2023-10-30 01:01:11',14,NULL,NULL,26,'Mamasuka','SUBDIST_1',1,1,1,'1/26','INV/20230929/MMS/25','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',3,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','NDTHM0B0GFXLUR1','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(27,'2023-10-30 01:01:11',14,NULL,NULL,27,'Mamasuka','SUBDIST_1',1,1,1,'1/27','INV/20230929/MMS/26','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',8,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','RSGUQL92XT8F18A','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(28,'2023-10-30 01:01:11',14,NULL,NULL,28,'Mamasuka','SUBDIST_1',1,1,1,'1/28','INV/20230929/MMS/27','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',16,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','30UU3MX328IK70B','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(29,'2023-10-30 01:01:11',14,NULL,NULL,29,'Mamasuka','SUBDIST_1',1,1,1,'1/29','INV/20230929/MMS/28','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','KJRJVC1RR6OZCJM','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(30,'2023-10-30 01:01:11',14,NULL,NULL,30,'Mamasuka','SUBDIST_1',1,1,1,'1/30','INV/20230929/MMS/29','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',0,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','88KW1L9EWV3WYC1','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(31,'2023-10-30 01:01:11',14,NULL,NULL,31,'Mamasuka','SUBDIST_1',1,1,1,'1/31','INV/20230929/MMS/30','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','HD00QVA449MKV5V','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(32,'2023-10-30 01:01:11',14,NULL,NULL,32,'Mamasuka','SUBDIST_1',1,1,1,'1/32','INV/20230929/MMS/31','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',26,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','UOTUWZRNO4IGLA9','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(33,'2023-10-30 01:01:11',14,NULL,NULL,33,'Mamasuka','SUBDIST_1',1,1,1,'1/33','INV/20230929/MMS/32','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',45,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','PGY307WKO96E62Y','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(34,'2023-10-30 01:01:11',14,NULL,NULL,34,'Mamasuka','SUBDIST_1',1,1,1,'1/34','INV/20230929/MMS/33','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',18,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','VI3RQNG6XOBPTC7','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(35,'2023-10-30 01:01:11',14,NULL,NULL,35,'Mamasuka','SUBDIST_1',1,1,1,'1/35','INV/20230929/MMS/34','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',18,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','P9YDWAJAGQIYBAW','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(36,'2023-10-30 01:01:11',14,NULL,NULL,36,'Mamasuka','SUBDIST_1',1,1,1,'1/36','INV/20230929/MMS/35','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',8,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','4OMY6LI18L7TUJU','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(37,'2023-10-30 01:01:11',14,NULL,NULL,37,'Mamasuka','SUBDIST_1',1,1,1,'1/37','INV/20230929/MMS/36','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',6,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','PC9KC27E9D7RZV8','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(38,'2023-10-30 01:01:11',14,NULL,NULL,38,'Mamasuka','SUBDIST_1',1,1,1,'1/38','INV/20230929/MMS/37','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','OOSQKHCJ00XO6MP','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(39,'2023-10-30 01:01:11',14,NULL,NULL,39,'Mamasuka','SUBDIST_1',1,1,1,'1/39','INV/20230929/MMS/38','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',29,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','QX77JSI69XURX39','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(40,'2023-10-30 01:01:11',14,NULL,NULL,40,'Mamasuka','SUBDIST_1',1,1,1,'1/40','INV/20230929/MMS/39','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',21,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','XTFKUX0USB4KR7M','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(41,'2023-10-30 01:01:11',14,NULL,NULL,41,'Mamasuka','SUBDIST_1',1,1,1,'1/41','INV/20230929/MMS/40','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',42,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','4UO6R6LCTLNQ86M','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(42,'2023-10-30 01:01:11',14,NULL,NULL,42,'Mamasuka','SUBDIST_1',1,1,1,'1/42','INV/20230929/MMS/41','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',27,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','9HIXK8IKXSLMAG7','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(43,'2023-10-30 01:01:11',14,NULL,NULL,43,'Mamasuka','SUBDIST_1',1,1,1,'1/43','INV/20230929/MMS/42','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',26,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','MTUZWOAQ2DRI7ZZ','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(44,'2023-10-30 01:01:11',14,NULL,NULL,44,'Mamasuka','SUBDIST_1',1,1,1,'1/44','INV/20230929/MMS/43','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',36,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','9WPXD6HRBMCJKWH','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(45,'2023-10-30 01:01:11',14,NULL,NULL,45,'Mamasuka','SUBDIST_1',1,1,1,'1/45','INV/20230929/MMS/44','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',25,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','5AN4TMUROWTNN8E','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(46,'2023-10-30 01:01:11',14,NULL,NULL,46,'Mamasuka','SUBDIST_1',1,1,1,'1/46','INV/20230929/MMS/45','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',35,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','26K5462XQJ8HUWG','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(47,'2023-10-30 01:01:11',14,NULL,NULL,47,'Mamasuka','SUBDIST_1',1,1,1,'1/47','INV/20230929/MMS/46','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',7,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','WU58EDHBNACYWYE','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(48,'2023-10-30 01:01:11',14,NULL,NULL,48,'Mamasuka','SUBDIST_1',1,1,1,'1/48','INV/20230929/MMS/47','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',40,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','G6RKGY4TFH5JKK0','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(49,'2023-10-30 01:01:11',14,NULL,NULL,49,'Mamasuka','SUBDIST_1',1,1,1,'1/49','INV/20230929/MMS/48','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',42,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','VFIPEF1IL70SY6D','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(50,'2023-10-30 01:01:11',14,NULL,NULL,50,'Mamasuka','SUBDIST_1',1,1,1,'1/50','INV/20230929/MMS/49','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','1GIHES6FPDKF4J3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(51,'2023-10-30 01:01:11',14,NULL,NULL,51,'Mamasuka','SUBDIST_1',1,1,1,'1/51','INV/20230929/MMS/50','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',10,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','V1500OWJYXLAVU3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(52,'2023-10-30 01:01:11',14,NULL,NULL,52,'Mamasuka','SUBDIST_1',1,1,1,'1/52','INV/20230929/MMS/51','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','4LMGDQWXXVJPLTX','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(53,'2023-10-30 01:01:11',14,NULL,NULL,53,'Mamasuka','SUBDIST_1',1,1,1,'1/53','INV/20230929/MMS/52','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','FTTVJZCYUYVIO1C','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(54,'2023-10-30 01:01:11',14,NULL,NULL,54,'Mamasuka','SUBDIST_1',1,1,1,'1/54','INV/20230929/MMS/53','Skunew003','Lemonilo Ramen Jepang','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','AZ82BTTKW62BVLL','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(55,'2023-10-30 01:01:11',14,NULL,NULL,55,'Mamasuka','SUBDIST_1',1,1,1,'1/55','INV/20230929/MMS/54','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',18,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','PJUJ97BD0OXYMK0','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(56,'2023-10-30 01:01:11',14,NULL,NULL,56,'Mamasuka','SUBDIST_1',1,1,1,'1/56','INV/20230929/MMS/55','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode','',39,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','MWHLOBS3HXY196Y','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(57,'2023-10-30 01:01:11',14,NULL,NULL,57,'Mamasuka','SUBDIST_1',1,1,1,'1/57','INV/20230929/MMS/56','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',25,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','MLTTAZUF7K1NWWG','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(58,'2023-10-30 01:01:11',14,NULL,NULL,58,'Mamasuka','SUBDIST_1',1,1,1,'1/58','INV/20230929/MMS/57','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','M8GCUT0ASLPT34D','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(59,'2023-10-30 01:01:11',14,NULL,NULL,59,'Mamasuka','SUBDIST_1',1,1,1,'1/59','INV/20230929/MMS/58','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',11,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Y4DCGGWJ5GTSS7L','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(60,'2023-10-30 01:01:11',14,NULL,NULL,60,'Mamasuka','SUBDIST_1',1,1,1,'1/60','INV/20230929/MMS/59','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',9,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','IDFSE5XPXLEXR9D','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(61,'2023-10-30 01:01:11',14,NULL,NULL,61,'Mamasuka','SUBDIST_1',1,1,1,'1/61','INV/20230929/MMS/60','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',9,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','E6KI3FM3MBZURN0','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(62,'2023-10-30 01:01:11',14,NULL,NULL,62,'Mamasuka','SUBDIST_1',1,1,1,'1/62','INV/20230929/MMS/61','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',13,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','2XFHN2CCM0T6EAX','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(63,'2023-10-30 01:01:11',14,NULL,NULL,63,'Mamasuka','SUBDIST_1',1,1,1,'1/63','INV/20230929/MMS/62','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',22,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Q4S2XNVUKXU4APB','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(64,'2023-10-30 01:01:11',14,NULL,NULL,64,'Mamasuka','SUBDIST_1',1,1,1,'1/64','INV/20230929/MMS/63','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',58,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','ZML79X5JJUQBFL5','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(65,'2023-10-30 01:01:11',14,NULL,NULL,65,'Mamasuka','SUBDIST_1',1,1,1,'1/65','INV/20230929/MMS/64','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',26,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','04B4XPHAF4PISFU','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(66,'2023-10-30 01:01:11',14,NULL,NULL,66,'Mamasuka','SUBDIST_1',1,1,1,'1/66','INV/20230929/MMS/65','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',10,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI TIARA','','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','Sumatera Utara','Kota Medan','Medan Polonia','Madras Hulu','Jl. Imam Bonjol No.25, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212, Indonesia','BZXBI4VVTKEWITH','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(67,'2023-10-30 01:01:11',14,NULL,NULL,67,'Mamasuka','SUBDIST_1',1,1,1,'1/67','INV/20230929/MMS/66','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',0,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','G7BERSEF2NYM7QT','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(68,'2023-10-30 01:01:11',14,NULL,NULL,68,'Mamasuka','SUBDIST_1',1,1,1,'1/68','INV/20230929/MMS/67','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','WX5JS5PLNXBM5SB','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(69,'2023-10-30 01:01:11',14,NULL,NULL,69,'Mamasuka','SUBDIST_1',1,1,1,'1/69','INV/20230929/MMS/68','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',22,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','HQUPU4CI0GESZSE','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(70,'2023-10-30 01:01:11',14,NULL,NULL,70,'Mamasuka','SUBDIST_1',1,1,1,'1/70','INV/20230929/MMS/69','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',40,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','8VNW6PTAYW2VYJ7','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(71,'2023-10-30 01:01:11',14,NULL,NULL,71,'Mamasuka','SUBDIST_1',1,1,1,'1/71','INV/20230929/MMS/70','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',25,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','FZZ54L4ML8JFE5Q','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(72,'2023-10-30 01:01:11',14,NULL,NULL,72,'Mamasuka','SUBDIST_1',1,1,1,'1/72','INV/20230929/MMS/71','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',11,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'CV IRIAN BAHAGIA BERSAMA','','Kota Medan','Sumatera Utara','Kota Medan','','','Kota Medan','BFYIS338FNG8W7C','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(73,'2023-10-30 01:01:11',14,NULL,NULL,73,'Mamasuka','SUBDIST_1',1,1,1,'1/73','INV/20230929/MMS/72','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',41,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','YZMUKH366B3EQ3S','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(74,'2023-10-30 01:01:11',14,NULL,NULL,74,'Mamasuka','SUBDIST_1',1,1,1,'1/74','INV/20230929/MMS/73','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','KF4IH70EPBPUFWY','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(75,'2023-10-30 01:01:11',14,NULL,NULL,75,'Mamasuka','SUBDIST_1',1,1,1,'1/75','INV/20230929/MMS/74','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',12,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','NBIUU3NAM308MHY','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(76,'2023-10-30 01:01:11',14,NULL,NULL,76,'Mamasuka','SUBDIST_1',1,1,1,'1/76','INV/20230929/MMS/75','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','A9NQSAPG4VZ1UIL','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(77,'2023-10-30 01:01:11',14,NULL,NULL,77,'Mamasuka','SUBDIST_1',1,1,1,'1/77','INV/20230929/MMS/76','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','13O1KKDKWDQD0RS','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(78,'2023-10-30 01:01:11',14,NULL,NULL,78,'Mamasuka','SUBDIST_1',1,1,1,'1/78','INV/20230929/MMS/77','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode','',2,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','9VCS8JBLJTFNGG3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(79,'2023-10-30 01:01:11',14,NULL,NULL,79,'Mamasuka','SUBDIST_1',1,1,1,'1/79','INV/20230929/MMS/78','Skunew003','Lemonilo Ramen Jepang','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','2CHZMF0PZNEUCRK','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(80,'2023-10-30 01:01:11',14,NULL,NULL,80,'Mamasuka','SUBDIST_1',1,1,1,'1/80','INV/20230929/MMS/79','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',25,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','KEWMP7EUXII4A0C','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(81,'2023-10-30 01:01:11',14,NULL,NULL,81,'Mamasuka','SUBDIST_1',1,1,1,'1/81','INV/20230929/MMS/80','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode','',21,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','FQOU2BABG9X9PPW','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(82,'2023-10-30 01:01:11',14,NULL,NULL,82,'Mamasuka','SUBDIST_1',1,1,1,'1/82','INV/20230929/MMS/81','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',17,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','3X7V94X6RTJ7AJP','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(83,'2023-10-30 01:01:11',14,NULL,NULL,83,'Mamasuka','SUBDIST_1',1,1,1,'1/83','INV/20230929/MMS/82','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'YOGYA SUKABUMI','','Kota Sukabumi','Jawa Barat','Kota Sukabumi','','','Kota Sukabumi','YMXDZ58MOY4C8N4','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(84,'2023-10-30 01:01:11',14,NULL,NULL,84,'Mamasuka','SUBDIST_1',1,1,1,'1/84','INV/20230929/MMS/83','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode','',23,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','43ONXJEQDDVTNTC','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(85,'2023-10-30 01:01:11',14,NULL,NULL,85,'Mamasuka','SUBDIST_1',1,1,1,'1/85','INV/20230929/MMS/84','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',6,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','I92PDQSFBN7IUE9','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(86,'2023-10-30 01:01:11',14,NULL,NULL,86,'Mamasuka','SUBDIST_1',1,1,1,'1/86','INV/20230929/MMS/85','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','7SBVMWCZMSZ7RGJ','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(87,'2023-10-30 01:01:11',14,NULL,NULL,87,'Mamasuka','SUBDIST_1',1,1,1,'1/87','INV/20230929/MMS/86','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode','',29,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','TIIUUMYKA8L47DE','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(88,'2023-10-30 01:01:11',14,NULL,NULL,88,'Mamasuka','SUBDIST_1',1,1,1,'1/88','INV/20230929/MMS/87','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',24,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','QZDJ7OITE96M3LF','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(89,'2023-10-30 01:01:11',14,NULL,NULL,89,'Mamasuka','SUBDIST_1',1,1,1,'1/89','INV/20230929/MMS/88','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',84,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','NCMGYK0WB7H0XN3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(90,'2023-10-30 01:01:11',14,NULL,NULL,90,'Mamasuka','SUBDIST_1',1,1,1,'1/90','INV/20230929/MMS/89','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',34,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','VHZDE35B5MGJA7L','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(91,'2023-10-30 01:01:11',14,NULL,NULL,91,'Mamasuka','SUBDIST_1',1,1,1,'1/91','INV/20230929/MMS/90','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','',22,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'BRASTAGI GATSU','','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','Sumatera Utara','Kota Medan','Medan Petisah','Sei Putih Tengah','Jl. Panci No.51c, Sei Putih Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20113, Indonesia','032JUVWQSKTNV4Z','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(92,'2023-10-30 01:01:11',14,NULL,NULL,92,'Mamasuka','SUBDIST_1',1,1,1,'1/92','INV/20230929/MMS/91','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode','',35,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','P6K3FYT43DMRVFH','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(93,'2023-10-30 01:01:11',14,NULL,NULL,93,'Mamasuka','SUBDIST_1',1,1,1,'1/93','INV/20230929/MMS/92','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode','',3,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','DSU06XZ98YITPU5','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(94,'2023-10-30 01:01:11',14,NULL,NULL,94,'Mamasuka','SUBDIST_1',1,1,1,'1/94','INV/20230929/MMS/93','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode','',5,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','O4XB6BMCUKDPXJL','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(95,'2023-10-30 01:01:11',14,NULL,NULL,95,'Mamasuka','SUBDIST_1',1,1,1,'1/95','INV/20230929/MMS/94','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode','',13,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','U1YR269R4RW7GW4','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(96,'2023-10-30 01:01:11',14,NULL,NULL,96,'Mamasuka','SUBDIST_1',1,1,1,'1/96','INV/20230929/MMS/95','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',15,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','E57L1WQVEKGSNNI','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(97,'2023-10-30 01:01:11',14,NULL,NULL,97,'Mamasuka','SUBDIST_1',1,1,1,'1/97','INV/20230929/MMS/96','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',4,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR SUKABUMI','','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','Jawa Barat','Kota Sukabumi','Baros','Baros','2WXG+8V8, Jayamekar, Kec. Baros, Kota Sukabumi, Jawa Barat 43161, Indonesia','J093OSOQGPJ5R3U','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(98,'2023-10-30 01:01:11',14,NULL,NULL,98,'Mamasuka','SUBDIST_1',1,1,1,'1/98','INV/20230929/MMS/97','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','',8,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','5ZS9R33AJDFUSBO','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc'),(99,'2023-10-30 01:01:11',14,NULL,NULL,99,'Mamasuka','SUBDIST_1',1,1,1,'1/99','INV/20230929/MMS/98','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode','',10,0.0000000000,1000.0000000000,0.0000000000,1000.0000000000,1000.0000000000,'INDOGROSIR','','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','Sumatera Utara','Kota Medan','Medan Amplas','Harjosari I','Jl. Sisingamangaraja No.29b, Harjosari I, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20148, Indonesia','296KI30LVOYNVQ3','Packed','8mm4a84y82-gpp3p736cs-sample_Order_File_mamasuka_v3 - 100 data.xlsx','OK',NULL,'Order','Order','Frontliner Abc');
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_status`
--

LOCK TABLES `tb_order_status` WRITE;
/*!40000 ALTER TABLE `tb_order_status` DISABLE KEYS */;
INSERT INTO `tb_order_status` VALUES (1,'2023-10-30 01:01:11',14,NULL,NULL,1,'Packed'),(2,'2023-10-30 01:01:11',14,NULL,NULL,2,'Packed'),(3,'2023-10-30 01:01:11',14,NULL,NULL,3,'Packed'),(4,'2023-10-30 01:01:11',14,NULL,NULL,4,'Packed'),(5,'2023-10-30 01:01:11',14,NULL,NULL,5,'Packed'),(6,'2023-10-30 01:01:11',14,NULL,NULL,6,'Packed'),(7,'2023-10-30 01:01:11',14,NULL,NULL,7,'Packed'),(8,'2023-10-30 01:01:11',14,NULL,NULL,8,'Packed'),(9,'2023-10-30 01:01:11',14,NULL,NULL,9,'Packed'),(10,'2023-10-30 01:01:11',14,NULL,NULL,10,'Packed'),(11,'2023-10-30 01:01:11',14,NULL,NULL,11,'Packed'),(12,'2023-10-30 01:01:11',14,NULL,NULL,12,'Packed'),(13,'2023-10-30 01:01:11',14,NULL,NULL,13,'Packed'),(14,'2023-10-30 01:01:11',14,NULL,NULL,14,'Packed'),(15,'2023-10-30 01:01:11',14,NULL,NULL,15,'Packed'),(16,'2023-10-30 01:01:11',14,NULL,NULL,16,'Packed'),(17,'2023-10-30 01:01:11',14,NULL,NULL,17,'Packed'),(18,'2023-10-30 01:01:11',14,NULL,NULL,18,'Packed'),(19,'2023-10-30 01:01:11',14,NULL,NULL,19,'Packed'),(20,'2023-10-30 01:01:11',14,NULL,NULL,20,'Packed'),(21,'2023-10-30 01:01:11',14,NULL,NULL,21,'Packed'),(22,'2023-10-30 01:01:11',14,NULL,NULL,22,'Packed'),(23,'2023-10-30 01:01:11',14,NULL,NULL,23,'Packed'),(24,'2023-10-30 01:01:11',14,NULL,NULL,24,'Packed'),(25,'2023-10-30 01:01:11',14,NULL,NULL,25,'Packed'),(26,'2023-10-30 01:01:11',14,NULL,NULL,26,'Packed'),(27,'2023-10-30 01:01:11',14,NULL,NULL,27,'Packed'),(28,'2023-10-30 01:01:11',14,NULL,NULL,28,'Packed'),(29,'2023-10-30 01:01:11',14,NULL,NULL,29,'Packed'),(30,'2023-10-30 01:01:11',14,NULL,NULL,30,'Packed'),(31,'2023-10-30 01:01:11',14,NULL,NULL,31,'Packed'),(32,'2023-10-30 01:01:11',14,NULL,NULL,32,'Packed'),(33,'2023-10-30 01:01:11',14,NULL,NULL,33,'Packed'),(34,'2023-10-30 01:01:11',14,NULL,NULL,34,'Packed'),(35,'2023-10-30 01:01:11',14,NULL,NULL,35,'Packed'),(36,'2023-10-30 01:01:11',14,NULL,NULL,36,'Packed'),(37,'2023-10-30 01:01:11',14,NULL,NULL,37,'Packed'),(38,'2023-10-30 01:01:11',14,NULL,NULL,38,'Packed'),(39,'2023-10-30 01:01:11',14,NULL,NULL,39,'Packed'),(40,'2023-10-30 01:01:11',14,NULL,NULL,40,'Packed'),(41,'2023-10-30 01:01:11',14,NULL,NULL,41,'Packed'),(42,'2023-10-30 01:01:11',14,NULL,NULL,42,'Packed'),(43,'2023-10-30 01:01:11',14,NULL,NULL,43,'Packed'),(44,'2023-10-30 01:01:11',14,NULL,NULL,44,'Packed'),(45,'2023-10-30 01:01:11',14,NULL,NULL,45,'Packed'),(46,'2023-10-30 01:01:11',14,NULL,NULL,46,'Packed'),(47,'2023-10-30 01:01:11',14,NULL,NULL,47,'Packed'),(48,'2023-10-30 01:01:11',14,NULL,NULL,48,'Packed'),(49,'2023-10-30 01:01:11',14,NULL,NULL,49,'Packed'),(50,'2023-10-30 01:01:11',14,NULL,NULL,50,'Packed'),(51,'2023-10-30 01:01:11',14,NULL,NULL,51,'Packed'),(52,'2023-10-30 01:01:11',14,NULL,NULL,52,'Packed'),(53,'2023-10-30 01:01:11',14,NULL,NULL,53,'Packed'),(54,'2023-10-30 01:01:11',14,NULL,NULL,54,'Packed'),(55,'2023-10-30 01:01:11',14,NULL,NULL,55,'Packed'),(56,'2023-10-30 01:01:11',14,NULL,NULL,56,'Packed'),(57,'2023-10-30 01:01:11',14,NULL,NULL,57,'Packed'),(58,'2023-10-30 01:01:11',14,NULL,NULL,58,'Packed'),(59,'2023-10-30 01:01:11',14,NULL,NULL,59,'Packed'),(60,'2023-10-30 01:01:11',14,NULL,NULL,60,'Packed'),(61,'2023-10-30 01:01:11',14,NULL,NULL,61,'Packed'),(62,'2023-10-30 01:01:11',14,NULL,NULL,62,'Packed'),(63,'2023-10-30 01:01:11',14,NULL,NULL,63,'Packed'),(64,'2023-10-30 01:01:11',14,NULL,NULL,64,'Packed'),(65,'2023-10-30 01:01:11',14,NULL,NULL,65,'Packed'),(66,'2023-10-30 01:01:11',14,NULL,NULL,66,'Packed'),(67,'2023-10-30 01:01:11',14,NULL,NULL,67,'Packed'),(68,'2023-10-30 01:01:11',14,NULL,NULL,68,'Packed'),(69,'2023-10-30 01:01:11',14,NULL,NULL,69,'Packed'),(70,'2023-10-30 01:01:11',14,NULL,NULL,70,'Packed'),(71,'2023-10-30 01:01:11',14,NULL,NULL,71,'Packed'),(72,'2023-10-30 01:01:11',14,NULL,NULL,72,'Packed'),(73,'2023-10-30 01:01:11',14,NULL,NULL,73,'Packed'),(74,'2023-10-30 01:01:11',14,NULL,NULL,74,'Packed'),(75,'2023-10-30 01:01:11',14,NULL,NULL,75,'Packed'),(76,'2023-10-30 01:01:11',14,NULL,NULL,76,'Packed'),(77,'2023-10-30 01:01:11',14,NULL,NULL,77,'Packed'),(78,'2023-10-30 01:01:11',14,NULL,NULL,78,'Packed'),(79,'2023-10-30 01:01:11',14,NULL,NULL,79,'Packed'),(80,'2023-10-30 01:01:11',14,NULL,NULL,80,'Packed'),(81,'2023-10-30 01:01:11',14,NULL,NULL,81,'Packed'),(82,'2023-10-30 01:01:11',14,NULL,NULL,82,'Packed'),(83,'2023-10-30 01:01:11',14,NULL,NULL,83,'Packed'),(84,'2023-10-30 01:01:11',14,NULL,NULL,84,'Packed'),(85,'2023-10-30 01:01:11',14,NULL,NULL,85,'Packed'),(86,'2023-10-30 01:01:11',14,NULL,NULL,86,'Packed'),(87,'2023-10-30 01:01:11',14,NULL,NULL,87,'Packed'),(88,'2023-10-30 01:01:11',14,NULL,NULL,88,'Packed'),(89,'2023-10-30 01:01:11',14,NULL,NULL,89,'Packed'),(90,'2023-10-30 01:01:11',14,NULL,NULL,90,'Packed'),(91,'2023-10-30 01:01:11',14,NULL,NULL,91,'Packed'),(92,'2023-10-30 01:01:11',14,NULL,NULL,92,'Packed'),(93,'2023-10-30 01:01:11',14,NULL,NULL,93,'Packed'),(94,'2023-10-30 01:01:11',14,NULL,NULL,94,'Packed'),(95,'2023-10-30 01:01:11',14,NULL,NULL,95,'Packed'),(96,'2023-10-30 01:01:11',14,NULL,NULL,96,'Packed'),(97,'2023-10-30 01:01:11',14,NULL,NULL,97,'Packed'),(98,'2023-10-30 01:01:11',14,NULL,NULL,98,'Packed'),(99,'2023-10-30 01:01:11',14,NULL,NULL,99,'Packed');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,NULL,14,'2023-10-30 01:00:15',14,'Mamasuka','MAMAS','4.140402.016','Lemonilo Chimi Jagung Bakar 24x50Gr','NO Barcode','0',100,1000.0000000000,'Sellable','Sellable'),(2,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140401.027','Lemonilo Mie Goreng 20x80 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(3,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140402.017','Lemonilo Chimi Jagung Balado 24x50G','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(4,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140401.028','Lemonilo Mie Bawang 20x70 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(5,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140401.012','Lemonilo Mie Pedas Korea 20x85 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(6,NULL,14,'2023-10-30 01:03:01',14,'Mamasuka','MAMAS','4.140401.011','Lemonilo Mie Rendang 20x77 gr','NO Barcode','0',98,1000.0000000000,'Sellable','Sellable'),(7,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','Skunew003','Lemonilo Ramen Jepang','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(8,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','8997232970046','Lemonilo Brownies Crispy Chocochips 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(9,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','8997232970053','Lemonilo Brownies Crispy Keju 40 GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(10,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','Skunew002','Lemonilo Kuah Rasa Soto Koya 60GR','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(11,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140401.029','Lemonilo Mie Kari Ayam 20x73 gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(12,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','konjagu001','Lemonilo Konjaqu Mi Instant 78Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(13,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','cassamo001','Cassamo Smoky BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(14,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','cassamo002','Cassamo Spicy BBQ 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(15,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','nealamami004','Alamami Ayam Goreng Kremes 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(16,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newalamami005','Alamami Nasi Goreng 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(17,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newalamami003','Alamami Rendang 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(18,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newgorme003','Gorme Rasa Kaldu Ayam Kampung 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(19,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newgorme002','Gorme Rasa Kaldu Jamur 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(20,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newgorme001','Gorme Rasa Kaldu Sapi 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(21,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','skunew004','Lemonilo chimi karamel mentega 50gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(22,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','solafarm002','Solafarm Beef Steak 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(23,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','salafarm001','Solafarm Seaweed 50 Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(24,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','All Produk','All Produk','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(25,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newalamami001','Alamami Ayam Lengkuas 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(26,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','newalamami002','Alamami Opor Ayam 40Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(27,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','skunew001','Lemonilo Michoco 4 x 30 Gram','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(28,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140402.022','Mie Kering 114Gr','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(29,'2023-10-30 00:59:49',14,NULL,NULL,'Mamasuka','MAMAS','4.140901.032','Lemonilo Kanilo Kacang Panggang125Grx14','NO Barcode',NULL,100,1000.0000000000,'Sellable','Sellable'),(30,NULL,14,'2023-10-30 01:02:27',14,'Mamasuka','MAMAS','1','1','1','0',99,1000.0000000000,'Gwp','Sellable');
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
  `tbm_market_id` varchar(255) DEFAULT NULL,
  `tbm_market_check` int(11) DEFAULT NULL,
  `tbpm_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbpm_id`),
  KEY `tb_product_market_tbm_market_check_index` (`tbm_market_check`),
  KEY `tb_product_market_tbm_market_index` (`tbm_market_id`),
  KEY `tb_product_market_tbp_id_index` (`tbp_id`),
  KEY `tb_product_market_tbp_sku_index` (`tbp_sku`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_market`
--

LOCK TABLES `tb_product_market` WRITE;
/*!40000 ALTER TABLE `tb_product_market` DISABLE KEYS */;
INSERT INTO `tb_product_market` VALUES (1,'2023-10-30 00:59:49',14,NULL,NULL,1,'4.140402.016','SUBDIST_1',1,NULL),(2,'2023-10-30 00:59:49',14,NULL,NULL,1,'4.140402.016','SUBDIST_2',1,NULL),(3,'2023-10-30 00:59:49',14,NULL,NULL,2,'4.140401.027','SUBDIST_1',1,NULL),(4,'2023-10-30 00:59:49',14,NULL,NULL,2,'4.140401.027','SUBDIST_2',1,NULL),(5,'2023-10-30 00:59:49',14,NULL,NULL,3,'4.140402.017','SUBDIST_1',1,NULL),(6,'2023-10-30 00:59:49',14,NULL,NULL,3,'4.140402.017','SUBDIST_2',1,NULL),(7,'2023-10-30 00:59:49',14,NULL,NULL,4,'4.140401.028','SUBDIST_1',1,NULL),(8,'2023-10-30 00:59:49',14,NULL,NULL,4,'4.140401.028','SUBDIST_2',1,NULL),(9,'2023-10-30 00:59:49',14,NULL,NULL,5,'4.140401.012','SUBDIST_1',1,NULL),(10,'2023-10-30 00:59:49',14,NULL,NULL,5,'4.140401.012','SUBDIST_2',1,NULL),(11,'2023-10-30 00:59:49',14,NULL,NULL,6,'4.140401.011','SUBDIST_1',1,NULL),(12,'2023-10-30 00:59:49',14,NULL,NULL,6,'4.140401.011','SUBDIST_2',1,NULL),(13,'2023-10-30 00:59:49',14,NULL,NULL,7,'Skunew003','SUBDIST_1',1,NULL),(14,'2023-10-30 00:59:49',14,NULL,NULL,7,'Skunew003','SUBDIST_2',1,NULL),(15,'2023-10-30 00:59:49',14,NULL,NULL,8,'8997232970046','SUBDIST_1',1,NULL),(16,'2023-10-30 00:59:49',14,NULL,NULL,8,'8997232970046','SUBDIST_2',1,NULL),(17,'2023-10-30 00:59:49',14,NULL,NULL,9,'8997232970053','SUBDIST_1',1,NULL),(18,'2023-10-30 00:59:49',14,NULL,NULL,9,'8997232970053','SUBDIST_2',1,NULL),(19,'2023-10-30 00:59:49',14,NULL,NULL,10,'Skunew002','SUBDIST_1',1,NULL),(20,'2023-10-30 00:59:49',14,NULL,NULL,10,'Skunew002','SUBDIST_2',1,NULL),(21,'2023-10-30 00:59:49',14,NULL,NULL,11,'4.140401.029','SUBDIST_1',1,NULL),(22,'2023-10-30 00:59:49',14,NULL,NULL,11,'4.140401.029','SUBDIST_2',1,NULL),(23,'2023-10-30 00:59:49',14,NULL,NULL,12,'konjagu001','SUBDIST_1',1,NULL),(24,'2023-10-30 00:59:49',14,NULL,NULL,12,'konjagu001','SUBDIST_2',1,NULL),(25,'2023-10-30 00:59:49',14,NULL,NULL,13,'cassamo001','SUBDIST_1',1,NULL),(26,'2023-10-30 00:59:49',14,NULL,NULL,13,'cassamo001','SUBDIST_2',1,NULL),(27,'2023-10-30 00:59:49',14,NULL,NULL,14,'cassamo002','SUBDIST_1',1,NULL),(28,'2023-10-30 00:59:49',14,NULL,NULL,14,'cassamo002','SUBDIST_2',1,NULL),(29,'2023-10-30 00:59:49',14,NULL,NULL,15,'nealamami004','SUBDIST_1',1,NULL),(30,'2023-10-30 00:59:49',14,NULL,NULL,15,'nealamami004','SUBDIST_2',1,NULL),(31,'2023-10-30 00:59:49',14,NULL,NULL,16,'newalamami005','SUBDIST_1',1,NULL),(32,'2023-10-30 00:59:49',14,NULL,NULL,16,'newalamami005','SUBDIST_2',1,NULL),(33,'2023-10-30 00:59:49',14,NULL,NULL,17,'newalamami003','SUBDIST_1',1,NULL),(34,'2023-10-30 00:59:49',14,NULL,NULL,17,'newalamami003','SUBDIST_2',1,NULL),(35,'2023-10-30 00:59:49',14,NULL,NULL,18,'newgorme003','SUBDIST_1',1,NULL),(36,'2023-10-30 00:59:49',14,NULL,NULL,18,'newgorme003','SUBDIST_2',1,NULL),(37,'2023-10-30 00:59:49',14,NULL,NULL,19,'newgorme002','SUBDIST_1',1,NULL),(38,'2023-10-30 00:59:49',14,NULL,NULL,19,'newgorme002','SUBDIST_2',1,NULL),(39,'2023-10-30 00:59:49',14,NULL,NULL,20,'newgorme001','SUBDIST_1',1,NULL),(40,'2023-10-30 00:59:49',14,NULL,NULL,20,'newgorme001','SUBDIST_2',1,NULL),(41,'2023-10-30 00:59:49',14,NULL,NULL,21,'skunew004','SUBDIST_1',1,NULL),(42,'2023-10-30 00:59:49',14,NULL,NULL,21,'skunew004','SUBDIST_2',1,NULL),(43,'2023-10-30 00:59:49',14,NULL,NULL,22,'solafarm002','SUBDIST_1',1,NULL),(44,'2023-10-30 00:59:49',14,NULL,NULL,22,'solafarm002','SUBDIST_2',1,NULL),(45,'2023-10-30 00:59:49',14,NULL,NULL,23,'salafarm001','SUBDIST_1',1,NULL),(46,'2023-10-30 00:59:49',14,NULL,NULL,23,'salafarm001','SUBDIST_2',1,NULL),(47,'2023-10-30 00:59:49',14,NULL,NULL,24,'All Produk','SUBDIST_1',1,NULL),(48,'2023-10-30 00:59:49',14,NULL,NULL,24,'All Produk','SUBDIST_2',1,NULL),(49,'2023-10-30 00:59:49',14,NULL,NULL,25,'newalamami001','SUBDIST_1',1,NULL),(50,'2023-10-30 00:59:49',14,NULL,NULL,25,'newalamami001','SUBDIST_2',1,NULL),(51,'2023-10-30 00:59:49',14,NULL,NULL,26,'newalamami002','SUBDIST_1',1,NULL),(52,'2023-10-30 00:59:49',14,NULL,NULL,26,'newalamami002','SUBDIST_2',1,NULL),(53,'2023-10-30 00:59:49',14,NULL,NULL,27,'skunew001','SUBDIST_1',1,NULL),(54,'2023-10-30 00:59:49',14,NULL,NULL,27,'skunew001','SUBDIST_2',1,NULL),(55,'2023-10-30 00:59:49',14,NULL,NULL,28,'4.140402.022','SUBDIST_1',1,NULL),(56,'2023-10-30 00:59:49',14,NULL,NULL,28,'4.140402.022','SUBDIST_2',1,NULL),(57,'2023-10-30 00:59:49',14,NULL,NULL,29,'4.140901.032','SUBDIST_1',1,NULL),(58,'2023-10-30 00:59:49',14,NULL,NULL,29,'4.140901.032','SUBDIST_2',1,NULL),(59,'2023-10-30 01:00:33',14,NULL,NULL,30,'1','SUBDIST_1',1,NULL),(60,'2023-10-30 01:00:33',14,NULL,NULL,30,'1','SUBDIST_2',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,'2023-10-30 00:40:34',1,'admin@mail.com','202cb962ac59075b964b07152d234b70','admin','admin',NULL,NULL,NULL,'active',NULL,NULL,'1lm38q5t2vzny0cfa08olp7zthhivzi4on4i','ADMIN'),(14,'2023-10-30 00:39:27',1,'2023-10-30 00:40:59',14,'pic1@mail.com','202cb962ac59075b964b07152d234b70','Pic','Satu',NULL,NULL,NULL,'active',NULL,NULL,'qp44m27ac0ic6ryow1ed73n4husk7myqsyof','SUBDIST');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_brand`
--

LOCK TABLES `tb_user_brand` WRITE;
/*!40000 ALTER TABLE `tb_user_brand` DISABLE KEYS */;
INSERT INTO `tb_user_brand` VALUES (20,'2023-10-29 07:13:55',1,NULL,NULL,1,'Mamasuka','MAMAS',1),(25,'2023-10-30 00:40:42',1,NULL,NULL,14,'Mamasuka','MAMAS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_market`
--

LOCK TABLES `tb_user_market` WRITE;
/*!40000 ALTER TABLE `tb_user_market` DISABLE KEYS */;
INSERT INTO `tb_user_market` VALUES (2,'2023-10-30 00:40:42',1,NULL,NULL,14,'SUBDIST_1',1),(3,'2023-10-30 00:40:42',1,NULL,NULL,14,'SUBDIST_2',1);
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
  1 AS `tbo_market_id`,
  1 AS `tbo_frontliner`,
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
  1 AS `tbo_market_id`,
  1 AS `tbo_frontliner`,
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
/*!50001 VIEW `view_order` AS select uuid() AS `uuid`,max(`tbo`.`tbo_create_date`) AS `tbo_create_date`,`tbo`.`tbo_create_id` AS `tbo_create_id`,`tbo`.`tbo_update_date` AS `tbo_update_date`,`tbo`.`tbo_update_id` AS `tbo_update_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_market_id` AS `tbo_market_id`,`tbo`.`tbo_frontliner` AS `tbo_frontliner`,`tbo`.`tbo_name` AS `tbo_name`,`tbo`.`tbo_hp` AS `tbo_hp`,`tbo`.`tbo_full_address` AS `tbo_full_address`,`tum`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tum` on(`tum`.`tbm_market_id` = `tbo`.`tbo_market_id` and `tum`.`tbm_market_check` = 1)) group by `tbo`.`tbo_create_id`,`tbo`.`tbo_update_date`,`tbo`.`tbo_update_id`,`tbo`.`tbo_brand`,`tbo`.`tbo_order_no`,`tbo`.`tbo_market_id`,`tbo`.`tbo_frontliner`,`tbo`.`tbo_name`,`tbo`.`tbo_hp`,`tbo`.`tbo_full_address`,`tum`.`tbu_id` */;
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
/*!50001 VIEW `view_sales` AS select uuid() AS `uuid`,`tbo`.`tbo_create_date` AS `tbo_create_date`,`tbo`.`tbo_create_id` AS `tbo_create_id`,`tbo`.`tbo_update_date` AS `tbo_update_date`,`tbo`.`tbo_update_id` AS `tbo_update_id`,`tbo`.`tbo_brand` AS `tbo_brand`,`tbo`.`tbo_market_id` AS `tbo_market_id`,`tbo`.`tbo_frontliner` AS `tbo_frontliner`,`tbo`.`tbo_order_no` AS `tbo_order_no`,`tbo`.`tbo_sku` AS `tbo_sku`,`tbo`.`tbo_code` AS `tbo_code`,`tbo`.`tbo_item` AS `tbo_item`,`tbo`.`tbo_qty` AS `tbo_qty`,`tbo`.`tbo_type` AS `tbo_type`,`tum`.`tbu_id` AS `tbu_id` from (`tb_order` `tbo` join `tb_user_market` `tum` on(`tum`.`tbm_market_id` = `tbo`.`tbo_market_id` and `tum`.`tbm_market_check` = 1)) where `tbo`.`tbo_status` = 'Delivered' */;
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
/*!50001 VIEW `view_stock` AS select uuid() AS `uuid`,`tbp`.`tbp_create_date` AS `tbp_create_date`,`tbp`.`tbp_create_id` AS `tbp_create_id`,`tbp`.`tbp_update_date` AS `tbp_update_date`,`tbp`.`tbp_update_id` AS `tbp_update_id`,`tbp`.`tbp_brand` AS `tbp_brand`,`tbp`.`tbp_sku` AS `tbp_sku`,`tbp`.`tbp_code` AS `tbp_code`,`tbp`.`tbp_item` AS `tbp_item`,`tbp`.`tbp_qty` AS `tbp_qty`,`tbub`.`tbu_id` AS `tbu_id` from (((`tb_product` `tbp` join `tb_user_brand` `tbub` on(`tbub`.`tbb_brand` = `tbp`.`tbp_brand` and `tbub`.`tbb_brand_check` = 1)) join `tb_product_market` `tpm` on(`tpm`.`tbp_id` = `tbp`.`tbp_id` and `tpm`.`tbm_market_check` = 1)) join `tb_user_market` `tum` on(`tum`.`tbm_market_id` = `tpm`.`tbm_market_id` and `tum`.`tbm_market_check` = 1 and `tum`.`tbu_id` = `tbub`.`tbu_id`)) group by `tbp`.`tbp_create_date`,`tbp`.`tbp_create_id`,`tbp`.`tbp_update_date`,`tbp`.`tbp_update_id`,`tbp`.`tbp_brand`,`tbp`.`tbp_sku`,`tbp`.`tbp_item`,`tbp`.`tbp_qty`,`tbub`.`tbu_id` */;
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

-- Dump completed on 2023-10-30  8:06:02
