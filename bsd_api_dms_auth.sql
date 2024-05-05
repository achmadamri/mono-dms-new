-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bsd_api_dms_auth
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
-- Table structure for table `tb_auth`
--

DROP TABLE IF EXISTS `tb_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth` (
  `tba_id` int(11) NOT NULL AUTO_INCREMENT,
  `tba_create_date` datetime DEFAULT NULL,
  `tba_create_id` int(11) DEFAULT NULL,
  `tba_update_date` datetime DEFAULT NULL,
  `tba_update_id` int(11) DEFAULT NULL,
  `tba_email` varchar(255) DEFAULT NULL,
  `tba_password` varchar(32) DEFAULT NULL,
  `tba_status` varchar(20) DEFAULT NULL,
  `tba_token_salt` varchar(36) DEFAULT NULL,
  `tba_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tba_id`),
  KEY `tb_auth_tba_email_index` (`tba_email`),
  KEY `tb_auth_tba_password_index` (`tba_password`),
  KEY `tb_auth_tba_status_index` (`tba_status`),
  KEY `tb_auth_tba_token_salt_index` (`tba_token_salt`),
  KEY `tb_auth_tba_tba_role_index` (`tba_role`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth`
--

LOCK TABLES `tb_auth` WRITE;
/*!40000 ALTER TABLE `tb_auth` DISABLE KEYS */;
INSERT INTO `tb_auth` VALUES (1,NULL,NULL,'2024-05-05 07:27:46',0,'admin@mail.com','202cb962ac59075b964b07152d234b70','active','de7dv6h87bp0c6v6x82wh6cfn57kkn13troh','ADMIN'),(170,'2023-12-17 15:37:52',0,'2024-05-02 01:49:12',0,'aicepusat@mail.com','202cb962ac59075b964b07152d234b70','active','kp129p8xculpj2jvg5uf7hsnsvdc5eu6boib','PRINCIPAL'),(171,'2023-12-17 15:38:58',0,'2024-01-02 10:47:51',0,'user1@mail.com','202cb962ac59075b964b07152d234b70','active','i046ykl8qyqwl2gey6bozit0j6uyl1kdhnkh','DISTRIBUTOR'),(172,'2023-12-17 15:39:24',0,'2023-12-19 10:17:57',0,'user2@mail.com','202cb962ac59075b964b07152d234b70','active','2pp0zwztmom6tt18mbpm2fg0ib7qi4sl41jl','DISTRIBUTOR'),(173,'2024-05-05 07:08:45',0,'2024-05-05 07:26:52',0,'roxy1@mail.com','202cb962ac59075b964b07152d234b70','active','sseokgarui9l8wio8rmg72i96zca9yprc9nm','PRINCIPAL');
/*!40000 ALTER TABLE `tb_auth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 14:28:34
