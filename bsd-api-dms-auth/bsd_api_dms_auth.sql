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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth`
--

LOCK TABLES `tb_auth` WRITE;
/*!40000 ALTER TABLE `tb_auth` DISABLE KEYS */;
INSERT INTO `tb_auth` VALUES (1,NULL,NULL,'2023-10-30 14:58:12',0,'admin@mail.com','202cb962ac59075b964b07152d234b70','active','j2x9fzhzeoln4kgv9s30hnicya5du69zch6w','ADMIN'),(17,'2023-10-30 14:59:46',0,'2023-10-31 23:14:18',0,'picdki@mail.com','202cb962ac59075b964b07152d234b70','active','mdai8anacb0qrs7j0ee88ttxi9if70ngn7ik','DISTRIBUTOR'),(18,'2023-10-30 15:00:18',0,NULL,NULL,'picjabar@mail.com','202cb962ac59075b964b07152d234b70','active','otcoiaut7kkn2r6hxukuj06915rrtz7ynra9','DISTRIBUTOR');
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

-- Dump completed on 2023-11-06 10:47:31
