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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth`
--

LOCK TABLES `tb_auth` WRITE;
/*!40000 ALTER TABLE `tb_auth` DISABLE KEYS */;
INSERT INTO `tb_auth` VALUES (1,NULL,NULL,'2023-12-11 08:59:42',0,'admin@mail.com','202cb962ac59075b964b07152d234b70','active','89s1u3ovuw06zy1gczqiwrlhwnmat66zltd4','ADMIN'),(19,'2023-11-21 03:49:31',0,'2023-12-10 09:36:55',0,'user1@mail.com','202cb962ac59075b964b07152d234b70','active','d3uh9y2z12ky0f9ghi7gslini78vhclzrbv0','DISTRIBUTOR'),(20,'2023-11-21 04:56:48',0,'2023-11-28 04:42:30',0,'user2@mail.com','202cb962ac59075b964b07152d234b70','active','d4z628p0pkgsm1xogncmuh05xftjtfi7au1f','DISTRIBUTOR'),(21,'2023-11-21 05:09:31',0,'2023-11-21 05:10:27',0,'user3@mail.com','202cb962ac59075b964b07152d234b70','active','jkyng4qqmgva1hgbur9ihnctv31p1uufs8jr','DISTRIBUTOR'),(22,'2023-11-21 05:18:52',0,'2023-11-21 10:06:43',0,'user4@mail.com','202cb962ac59075b964b07152d234b70','active','qrw1lbjz7imv6foeejjcyess9phdm7vvyzwu','DISTRIBUTOR'),(23,'2023-11-21 05:19:21',0,NULL,NULL,'user5@mail.com','202cb962ac59075b964b07152d234b70','active','4b9lo1ectcp1ykmale6wngob6a1zbl5rqkf5','DISTRIBUTOR'),(24,'2023-11-21 05:19:26',0,NULL,NULL,'user6@mail.com','202cb962ac59075b964b07152d234b70','active','re2bhbybqxmm085mbvslxb8k3fyxvb5tr9mi','DISTRIBUTOR'),(25,'2023-11-21 05:19:32',0,NULL,NULL,'user7@mail.com','202cb962ac59075b964b07152d234b70','active','mwjcac7w2mt9xuumdnf5sloleglpne3lnc78','DISTRIBUTOR'),(26,'2023-11-21 05:19:37',0,NULL,NULL,'user8@mail.com','202cb962ac59075b964b07152d234b70','active','znynmvb1f9bhx1vzoyc17kke6s9bl60hsd71','DISTRIBUTOR'),(27,'2023-11-21 05:19:42',0,NULL,NULL,'user9@mail.com','202cb962ac59075b964b07152d234b70','active','t9x16krqjp6o5rd3eeauv270q3qodqpd0fex','DISTRIBUTOR'),(28,'2023-11-21 05:19:48',0,NULL,NULL,'user10@mail.com','202cb962ac59075b964b07152d234b70','active','j8ft0qapxf4dpmvnwrxgmejdv700a4gjiim8','DISTRIBUTOR'),(29,'2023-11-21 05:19:53',0,NULL,NULL,'user11@mail.com','202cb962ac59075b964b07152d234b70','active','z5uvzal5e7h25lvonyjzy8pztw3313fw9c9e','DISTRIBUTOR'),(30,'2023-11-21 05:19:58',0,NULL,NULL,'user12@mail.com','202cb962ac59075b964b07152d234b70','active','kz28v5cgbnfbiqs2v5egcy5y6a7z7fhgdygd','DISTRIBUTOR'),(31,'2023-11-21 05:20:03',0,NULL,NULL,'user13@mail.com','202cb962ac59075b964b07152d234b70','active','9m4p3qm7z3njiqeunw3qjiu4mngrdydf47sg','DISTRIBUTOR'),(32,'2023-11-21 05:20:09',0,NULL,NULL,'user14@mail.com','202cb962ac59075b964b07152d234b70','active','17eydefcvcu8kzypobs0ryg73lmvwkpo5jwk','DISTRIBUTOR'),(33,'2023-11-21 05:20:14',0,NULL,NULL,'user15@mail.com','202cb962ac59075b964b07152d234b70','active','u7sgstdi7e9vbzppvczx7vt0xlyasj7nhs5i','DISTRIBUTOR'),(34,'2023-11-21 05:20:20',0,NULL,NULL,'user16@mail.com','202cb962ac59075b964b07152d234b70','active','vyxxasyde80picwhelwdyfbkchxatexxhgzf','DISTRIBUTOR'),(35,'2023-11-21 05:20:25',0,NULL,NULL,'user17@mail.com','202cb962ac59075b964b07152d234b70','active','dk4rx3jbcn726p3xyfolaqustug9fwjnri6m','DISTRIBUTOR'),(36,'2023-11-21 05:20:30',0,NULL,NULL,'user18@mail.com','202cb962ac59075b964b07152d234b70','active','azpw5n0y71a9lqs9fjth3i6y6c0ozqr0fy29','DISTRIBUTOR'),(37,'2023-11-21 05:20:36',0,NULL,NULL,'user19@mail.com','202cb962ac59075b964b07152d234b70','active','vxk96t974rqlo72hu1urh3ht88tdq1m5ei7o','DISTRIBUTOR'),(38,'2023-11-21 05:20:41',0,NULL,NULL,'user20@mail.com','202cb962ac59075b964b07152d234b70','active','ok54mdqbb5kqldaa4x04atf78irjwrrvp4ks','DISTRIBUTOR'),(39,'2023-11-21 05:20:46',0,NULL,NULL,'user21@mail.com','202cb962ac59075b964b07152d234b70','active','h11nro7q1p2d6q1i32q6r2xcro1nn7aysjic','DISTRIBUTOR'),(40,'2023-11-21 05:20:52',0,NULL,NULL,'user22@mail.com','202cb962ac59075b964b07152d234b70','active','g6e3g4z9er4n90raimlmdanjatgl15tf30x8','DISTRIBUTOR'),(41,'2023-11-21 05:20:57',0,NULL,NULL,'user23@mail.com','202cb962ac59075b964b07152d234b70','active','apujdto2i4l0mmd7qp01rxg7196ykunvvfvn','DISTRIBUTOR'),(42,'2023-11-21 05:21:02',0,NULL,NULL,'user24@mail.com','202cb962ac59075b964b07152d234b70','active','q4yflo0jzcg3dvryo8qg9iajbzqwbbbx5tva','DISTRIBUTOR'),(43,'2023-11-21 05:21:08',0,NULL,NULL,'user25@mail.com','202cb962ac59075b964b07152d234b70','active','zvnc52stk6qk38kq52i7joxe8hispo4o0rj6','DISTRIBUTOR'),(44,'2023-11-21 05:21:13',0,NULL,NULL,'user26@mail.com','202cb962ac59075b964b07152d234b70','active','sz7983mddu20wtqkv0l2gx9wdlvxwhiq84mt','DISTRIBUTOR'),(45,'2023-11-21 05:21:18',0,NULL,NULL,'user27@mail.com','202cb962ac59075b964b07152d234b70','active','48tr9iirqk5zz8nkpbyor2d62b7kt04s6vqg','DISTRIBUTOR'),(46,'2023-11-21 05:21:23',0,NULL,NULL,'user28@mail.com','202cb962ac59075b964b07152d234b70','active','nxmoe2qeoszsijph8qbyn21c6y991zeundy2','DISTRIBUTOR'),(47,'2023-11-21 05:21:29',0,NULL,NULL,'user29@mail.com','202cb962ac59075b964b07152d234b70','active','0ig2z2nmm6y4566dro86b4wv7vum6tvzdw5w','DISTRIBUTOR'),(48,'2023-11-21 05:21:34',0,NULL,NULL,'user30@mail.com','202cb962ac59075b964b07152d234b70','active','8sqpvkmhlgcw20mu3hy874pwqebyc6w30crm','DISTRIBUTOR'),(49,'2023-11-21 05:21:40',0,NULL,NULL,'user31@mail.com','202cb962ac59075b964b07152d234b70','active','x1asw9xr5byet0plsh25b52l50jleeqqv470','DISTRIBUTOR'),(50,'2023-11-21 05:21:45',0,NULL,NULL,'user32@mail.com','202cb962ac59075b964b07152d234b70','active','vkksmqvgz15py9uo8n8d5708xzvrt8kz59cr','DISTRIBUTOR'),(51,'2023-11-21 05:21:50',0,NULL,NULL,'user33@mail.com','202cb962ac59075b964b07152d234b70','active','lw0bv691wwqo67q74khj99hfxbptbh3gcglk','DISTRIBUTOR'),(52,'2023-11-21 05:21:56',0,NULL,NULL,'user34@mail.com','202cb962ac59075b964b07152d234b70','active','h7hhktrh6dywerm61ej26fxoksce4g7ziocy','DISTRIBUTOR'),(53,'2023-11-21 05:22:01',0,NULL,NULL,'user35@mail.com','202cb962ac59075b964b07152d234b70','active','2h733ty4zgyw42fqj6uf8qgu7eghnb7j2ej7','DISTRIBUTOR'),(54,'2023-11-21 05:22:07',0,NULL,NULL,'user36@mail.com','202cb962ac59075b964b07152d234b70','active','2eftqddfbgwlvdny5fxa1ctcvrvsc93zrddw','DISTRIBUTOR'),(55,'2023-11-21 05:22:12',0,NULL,NULL,'user37@mail.com','202cb962ac59075b964b07152d234b70','active','q1kf6jyyjoyfa8idcgzfyix5nyvjar0p1oie','DISTRIBUTOR'),(56,'2023-11-21 05:22:17',0,NULL,NULL,'user38@mail.com','202cb962ac59075b964b07152d234b70','active','lwphwe0os6ks2jwklla7rda5x0zfiu1on4lr','DISTRIBUTOR'),(57,'2023-11-21 05:22:22',0,NULL,NULL,'user39@mail.com','202cb962ac59075b964b07152d234b70','active','gxqqhfmje88bd007kh0jzxelgwvy51bxjn2a','DISTRIBUTOR'),(58,'2023-11-21 05:22:28',0,NULL,NULL,'user40@mail.com','202cb962ac59075b964b07152d234b70','active','2dd0d2kd2jqhndawh6otz7w4jvwrc5tnzmrp','DISTRIBUTOR'),(59,'2023-11-21 05:22:33',0,NULL,NULL,'user41@mail.com','202cb962ac59075b964b07152d234b70','active','cib27kp18nhg1pg667phrz67jcttgjg5ard4','DISTRIBUTOR'),(60,'2023-11-21 05:22:38',0,NULL,NULL,'user42@mail.com','202cb962ac59075b964b07152d234b70','active','t53iqeph0c7o037ckzavzm7lbydqjvwe7dje','DISTRIBUTOR'),(61,'2023-11-21 05:22:44',0,NULL,NULL,'user43@mail.com','202cb962ac59075b964b07152d234b70','active','kyqvll271sp7pukn78ke3grkwsui8yhzv1xi','DISTRIBUTOR'),(62,'2023-11-21 05:22:49',0,NULL,NULL,'user44@mail.com','202cb962ac59075b964b07152d234b70','active','52umwimj8ys7udg8ufqj05ufhws7l4qcbta6','DISTRIBUTOR'),(63,'2023-11-21 05:22:55',0,NULL,NULL,'user45@mail.com','202cb962ac59075b964b07152d234b70','active','thi3w9n4s8iwtxkih5l67h7kh8b6y4lf9s65','DISTRIBUTOR'),(64,'2023-11-21 05:23:00',0,NULL,NULL,'user46@mail.com','202cb962ac59075b964b07152d234b70','active','16cacvvp0rcm574hu67h0qnjd5czoccwatm1','DISTRIBUTOR'),(65,'2023-11-21 05:23:06',0,NULL,NULL,'user47@mail.com','202cb962ac59075b964b07152d234b70','active','ivblwvkejcr0ahbxicq8qf5v7csvouhme2c6','DISTRIBUTOR'),(66,'2023-11-21 05:23:11',0,NULL,NULL,'user48@mail.com','202cb962ac59075b964b07152d234b70','active','issjm8glbyrmym9tj6t1lqv4k08lze3qgijk','DISTRIBUTOR'),(67,'2023-11-21 05:23:16',0,NULL,NULL,'user49@mail.com','202cb962ac59075b964b07152d234b70','active','prp1ml4k9nwqlhii7avqoc1ugv5pvai1p0r4','DISTRIBUTOR'),(68,'2023-11-21 05:23:22',0,NULL,NULL,'user50@mail.com','202cb962ac59075b964b07152d234b70','active','tr62u3g7bl1gfptczh5f1hw5b8moudj0exuw','DISTRIBUTOR'),(69,'2023-11-21 05:23:27',0,NULL,NULL,'user51@mail.com','202cb962ac59075b964b07152d234b70','active','bmfz2lve0oepde3w78hy950v8hj992q6ai54','DISTRIBUTOR'),(70,'2023-11-21 05:23:32',0,NULL,NULL,'user52@mail.com','202cb962ac59075b964b07152d234b70','active','ui6kwbd2u43t1kfa2aujs0s7b92u66i4ntrw','DISTRIBUTOR'),(71,'2023-11-21 05:23:37',0,NULL,NULL,'user53@mail.com','202cb962ac59075b964b07152d234b70','active','sjfoe85hrs0twv8a2cv6cbqq5o8dul6bxk2e','DISTRIBUTOR'),(72,'2023-11-21 05:23:43',0,NULL,NULL,'user54@mail.com','202cb962ac59075b964b07152d234b70','active','3jz8fufxxfkry1753x33umztcxznb235fazn','DISTRIBUTOR'),(73,'2023-11-21 05:23:48',0,NULL,NULL,'user55@mail.com','202cb962ac59075b964b07152d234b70','active','o8uo8a9h9e44a52x287m4tc0fws5o5hbou37','DISTRIBUTOR'),(74,'2023-11-21 05:23:53',0,NULL,NULL,'user56@mail.com','202cb962ac59075b964b07152d234b70','active','qnb9ocoxkt3xmd11ifs934rgkomgcphd6qwc','DISTRIBUTOR'),(75,'2023-11-21 05:23:59',0,NULL,NULL,'user57@mail.com','202cb962ac59075b964b07152d234b70','active','fs1suifsgkhs9pbcn144zwhyu9u1lwcek59o','DISTRIBUTOR'),(76,'2023-11-21 05:24:04',0,NULL,NULL,'user58@mail.com','202cb962ac59075b964b07152d234b70','active','417gcjnt9z8uidg5fcpjyq1wr9sekti6iurs','DISTRIBUTOR'),(77,'2023-11-21 05:24:10',0,NULL,NULL,'user59@mail.com','202cb962ac59075b964b07152d234b70','active','hb27nv2epfvoa10bp7yg9zyccxgrsrjyqsso','DISTRIBUTOR'),(78,'2023-11-21 05:24:15',0,NULL,NULL,'user60@mail.com','202cb962ac59075b964b07152d234b70','active','x9g0sj00u516lj5l6usodito6fo8ef4kx45m','DISTRIBUTOR'),(79,'2023-11-21 05:24:20',0,NULL,NULL,'user61@mail.com','202cb962ac59075b964b07152d234b70','active','nqf06kz7hvbi133w3snl7lluk71o90bk9u6u','DISTRIBUTOR'),(80,'2023-11-21 05:24:26',0,NULL,NULL,'user62@mail.com','202cb962ac59075b964b07152d234b70','active','axkq5ksbswtga85y8pxr5wypy6z3kwuics84','DISTRIBUTOR'),(81,'2023-11-21 05:24:31',0,NULL,NULL,'user63@mail.com','202cb962ac59075b964b07152d234b70','active','a4t97i0hq61ic2kidcy1236hfpwpqzy5i4q5','DISTRIBUTOR'),(82,'2023-11-21 05:24:36',0,NULL,NULL,'user64@mail.com','202cb962ac59075b964b07152d234b70','active','4l2eokjw1iq9x6k1b266m4nt3c5jf88p5v5v','DISTRIBUTOR'),(83,'2023-11-21 05:24:42',0,NULL,NULL,'user65@mail.com','202cb962ac59075b964b07152d234b70','active','ybmacapq4sjpbknh6synxpw43sdi2ykkocxy','DISTRIBUTOR'),(84,'2023-11-21 05:24:47',0,NULL,NULL,'user66@mail.com','202cb962ac59075b964b07152d234b70','active','3pdupqmlotc3i057yfpybawmy5pjknqf050i','DISTRIBUTOR'),(85,'2023-11-21 05:24:53',0,NULL,NULL,'user67@mail.com','202cb962ac59075b964b07152d234b70','active','fjbfa1hhg75retosdf045f76wka2gcuj1q9s','DISTRIBUTOR'),(86,'2023-11-21 05:24:58',0,NULL,NULL,'user68@mail.com','202cb962ac59075b964b07152d234b70','active','ub0c6383pkd9gdyu5ltrqceokonal8h045pu','DISTRIBUTOR'),(87,'2023-11-21 05:25:03',0,NULL,NULL,'user69@mail.com','202cb962ac59075b964b07152d234b70','active','xndb3bpu9buux1pibrjdqclyn4zij8f5eshz','DISTRIBUTOR'),(88,'2023-11-21 05:25:09',0,NULL,NULL,'user70@mail.com','202cb962ac59075b964b07152d234b70','active','jkryc5suxvz1j3a092r8pon1sp8dojhg84yp','DISTRIBUTOR'),(89,'2023-11-21 05:25:14',0,NULL,NULL,'user71@mail.com','202cb962ac59075b964b07152d234b70','active','79c3moxkz35myj3sh9kooea1i2xs7asqfyiv','DISTRIBUTOR'),(90,'2023-11-21 05:25:19',0,NULL,NULL,'user72@mail.com','202cb962ac59075b964b07152d234b70','active','hdoel11lz9brun0897jrxwp7ji8tprexsarf','DISTRIBUTOR'),(91,'2023-11-21 05:25:24',0,NULL,NULL,'user73@mail.com','202cb962ac59075b964b07152d234b70','active','spneba7fzve2rwvx6c8qfsuj4jtt52ys0ha8','DISTRIBUTOR'),(92,'2023-11-21 05:25:30',0,NULL,NULL,'user74@mail.com','202cb962ac59075b964b07152d234b70','active','fzrfbyhtdwaxfzci75uqntowcdgzq37mc8hg','DISTRIBUTOR'),(93,'2023-11-21 05:25:35',0,NULL,NULL,'user75@mail.com','202cb962ac59075b964b07152d234b70','active','w8nd1uwkqerd7mia8blyo16k02wp02y8dhup','DISTRIBUTOR'),(94,'2023-11-21 05:25:40',0,NULL,NULL,'user76@mail.com','202cb962ac59075b964b07152d234b70','active','4x0g2nlzc5kws5i1hjxofg789gpxluw3uepn','DISTRIBUTOR'),(95,'2023-11-21 05:25:46',0,NULL,NULL,'user77@mail.com','202cb962ac59075b964b07152d234b70','active','4iwpvv272e8m2ij38cgx269erjeyzb1yq9fm','DISTRIBUTOR'),(96,'2023-11-21 05:25:51',0,NULL,NULL,'user78@mail.com','202cb962ac59075b964b07152d234b70','active','h1y7g00uf8y154kmwpl1fo18zoed9aaborgr','DISTRIBUTOR'),(97,'2023-11-21 05:25:56',0,NULL,NULL,'user79@mail.com','202cb962ac59075b964b07152d234b70','active','z98bx4mi8akmzy328z64f588q9cusga5x4wq','DISTRIBUTOR'),(98,'2023-11-21 05:26:02',0,NULL,NULL,'user80@mail.com','202cb962ac59075b964b07152d234b70','active','m727mlxnai4ad87vw7dciwd34ux7wbdznfln','DISTRIBUTOR'),(99,'2023-11-21 05:26:07',0,NULL,NULL,'user81@mail.com','202cb962ac59075b964b07152d234b70','active','spq2h4ymyecgb6lbn9qln5wl2joch6j68ci9','DISTRIBUTOR'),(100,'2023-11-21 05:26:13',0,NULL,NULL,'user82@mail.com','202cb962ac59075b964b07152d234b70','active','babqh3suv1hc0yxdi859vh9yu7967gxl4dh2','DISTRIBUTOR'),(101,'2023-11-21 05:26:18',0,NULL,NULL,'user83@mail.com','202cb962ac59075b964b07152d234b70','active','lwf0yokg05z2b8zijj5z0qzhe15ivvxo2o3d','DISTRIBUTOR'),(102,'2023-11-21 05:26:24',0,NULL,NULL,'user84@mail.com','202cb962ac59075b964b07152d234b70','active','fxztak7w5t6eb4sxec4v5u4dismjwirnqsve','DISTRIBUTOR'),(103,'2023-11-21 05:26:29',0,NULL,NULL,'user85@mail.com','202cb962ac59075b964b07152d234b70','active','h34rxwatzaulk4huqasedhd4zxh09ouqcbea','DISTRIBUTOR'),(104,'2023-11-21 05:26:34',0,NULL,NULL,'user86@mail.com','202cb962ac59075b964b07152d234b70','active','p7tnz2bi28g603gllhyc0853aeccb0idit23','DISTRIBUTOR'),(105,'2023-11-21 05:26:40',0,NULL,NULL,'user87@mail.com','202cb962ac59075b964b07152d234b70','active','jdqbpwcw0986a4xgtypajgxckky74p8h9jjj','DISTRIBUTOR'),(106,'2023-11-21 05:26:45',0,NULL,NULL,'user88@mail.com','202cb962ac59075b964b07152d234b70','active','4ngq35kk2xxum8vizkm5cyeiqeh5p07vq6zo','DISTRIBUTOR'),(107,'2023-11-21 05:26:51',0,NULL,NULL,'user89@mail.com','202cb962ac59075b964b07152d234b70','active','u75s9z3c3dpbwwi1qz4esgufn7hzscek26jx','DISTRIBUTOR'),(108,'2023-11-21 05:26:56',0,NULL,NULL,'user90@mail.com','202cb962ac59075b964b07152d234b70','active','9nhv6od199a50qop41p143ys4qefzbtzqnn5','DISTRIBUTOR'),(109,'2023-11-21 05:27:02',0,NULL,NULL,'user91@mail.com','202cb962ac59075b964b07152d234b70','active','9hnlwj8kb7m6tyi9goirw5lhj8u4pob6d0yl','DISTRIBUTOR'),(110,'2023-11-21 05:27:07',0,NULL,NULL,'user92@mail.com','202cb962ac59075b964b07152d234b70','active','azi471gclm3p6jbqez7c8kj9d6r47dhgqrtr','DISTRIBUTOR'),(111,'2023-11-21 05:27:13',0,NULL,NULL,'user93@mail.com','202cb962ac59075b964b07152d234b70','active','il3dqvt9tzlfrwp0ksfgezh4x2pk2nad8k37','DISTRIBUTOR'),(112,'2023-11-21 05:27:18',0,NULL,NULL,'user94@mail.com','202cb962ac59075b964b07152d234b70','active','bkrqptrgg31wi3f6u30a3jfrfdksrzwr6rie','DISTRIBUTOR'),(113,'2023-11-21 05:27:24',0,NULL,NULL,'user95@mail.com','202cb962ac59075b964b07152d234b70','active','wktj5c07vzgdwwzbuvqa5ugl8eui8gld7m22','DISTRIBUTOR'),(114,'2023-11-21 05:27:29',0,NULL,NULL,'user96@mail.com','202cb962ac59075b964b07152d234b70','active','vgvgz6ezave4se0we36tiw893blda5bu1bi7','DISTRIBUTOR'),(115,'2023-11-21 05:27:35',0,NULL,NULL,'user97@mail.com','202cb962ac59075b964b07152d234b70','active','qstpmogema151agjtmpa2c27zv8n2keptou3','DISTRIBUTOR'),(116,'2023-11-21 05:27:40',0,NULL,NULL,'user98@mail.com','202cb962ac59075b964b07152d234b70','active','8oabvmv8js8vx93u6bj7zc6llp36yn6bl1kj','DISTRIBUTOR'),(117,'2023-11-21 05:27:46',0,NULL,NULL,'user99@mail.com','202cb962ac59075b964b07152d234b70','active','1r36077g5b87t9de3m89uys8jdu01cedulex','DISTRIBUTOR'),(118,'2023-11-21 05:27:51',0,NULL,NULL,'user100@mail.com','202cb962ac59075b964b07152d234b70','active','zl1hpzodudfjqkz0b3c1c1r6zhgk77v2ntk1','DISTRIBUTOR'),(119,'2023-11-21 05:27:57',0,NULL,NULL,'user101@mail.com','202cb962ac59075b964b07152d234b70','active','n44u9da1i9u708ya54x3p5lqmbo8c0wvsi54','DISTRIBUTOR'),(120,'2023-11-21 05:28:02',0,NULL,NULL,'user102@mail.com','202cb962ac59075b964b07152d234b70','active','udsm3by1guspqsoayn0t8bn1fvmvvki4pqx3','DISTRIBUTOR'),(121,'2023-11-21 05:28:08',0,NULL,NULL,'user103@mail.com','202cb962ac59075b964b07152d234b70','active','4re3zin1ugs5pukv3acdcpyajjjguzbfqwet','DISTRIBUTOR'),(122,'2023-11-21 05:28:13',0,NULL,NULL,'user104@mail.com','202cb962ac59075b964b07152d234b70','active','m61plvq2rpsqv9h1xks36xb3mluqz3mol4dp','DISTRIBUTOR'),(123,'2023-11-21 05:28:19',0,NULL,NULL,'user105@mail.com','202cb962ac59075b964b07152d234b70','active','vh0tbocy6gb5pw1ja4hvqk782s63kbgdhr8k','DISTRIBUTOR'),(124,'2023-11-21 05:28:24',0,NULL,NULL,'user106@mail.com','202cb962ac59075b964b07152d234b70','active','74xc1qtt22o7y8km05bnt621l19u9r9gfovg','DISTRIBUTOR'),(125,'2023-11-21 05:28:30',0,NULL,NULL,'user107@mail.com','202cb962ac59075b964b07152d234b70','active','7grdiht2st07aiesl94b57ttyose31j8cisj','DISTRIBUTOR'),(126,'2023-11-21 05:28:35',0,NULL,NULL,'user108@mail.com','202cb962ac59075b964b07152d234b70','active','0hxdrmxhqkxanlgr6dwnvdsan9rmt3ot7v4s','DISTRIBUTOR'),(127,'2023-11-21 05:28:41',0,NULL,NULL,'user109@mail.com','202cb962ac59075b964b07152d234b70','active','jc5xc31ztm8pwst96xnroi211ulkuc4gxnfv','DISTRIBUTOR'),(128,'2023-11-21 05:28:46',0,NULL,NULL,'user110@mail.com','202cb962ac59075b964b07152d234b70','active','g3t2d6rs08kjpwk9uhmqj6m51aas2zc5ssqp','DISTRIBUTOR'),(129,'2023-11-21 05:28:52',0,NULL,NULL,'user111@mail.com','202cb962ac59075b964b07152d234b70','active','3p6xysud9p5itgsbhghhs0y8u3o1qnwusibk','DISTRIBUTOR'),(130,'2023-11-21 05:28:57',0,NULL,NULL,'user112@mail.com','202cb962ac59075b964b07152d234b70','active','zjsygudfkgdvm27ujsfe0urvy7seg804qv43','DISTRIBUTOR'),(131,'2023-11-21 05:29:03',0,NULL,NULL,'user113@mail.com','202cb962ac59075b964b07152d234b70','active','obejtg9ml8fwaf9cl0zvrxx3j4tg0yzffr5f','DISTRIBUTOR'),(132,'2023-11-21 05:29:08',0,NULL,NULL,'user114@mail.com','202cb962ac59075b964b07152d234b70','active','92zkj4x09eq3yvx9heg66arfkxu5euymddp4','DISTRIBUTOR'),(133,'2023-11-21 05:29:14',0,NULL,NULL,'user115@mail.com','202cb962ac59075b964b07152d234b70','active','gv86bddb57uvpkzhrnzdyi80bpyf7i7os2a4','DISTRIBUTOR'),(134,'2023-11-21 05:29:20',0,NULL,NULL,'user116@mail.com','202cb962ac59075b964b07152d234b70','active','0gd9pqeky2ksnq5j4jm6pwtn5tuilhhc63g8','DISTRIBUTOR'),(135,'2023-11-21 05:29:25',0,NULL,NULL,'user117@mail.com','202cb962ac59075b964b07152d234b70','active','gs7tp6ew0pibcpchickdjw8st66m610fqt2x','DISTRIBUTOR'),(136,'2023-11-21 05:29:31',0,NULL,NULL,'user118@mail.com','202cb962ac59075b964b07152d234b70','active','368ta3nrxcq6w5v6t4q77cxf4gh35otpliqx','DISTRIBUTOR'),(137,'2023-11-21 05:29:36',0,NULL,NULL,'user119@mail.com','202cb962ac59075b964b07152d234b70','active','4qq4sd32hovmr5y1f37wgh3rm4rb9hw0786e','DISTRIBUTOR'),(138,'2023-11-21 05:29:42',0,NULL,NULL,'user120@mail.com','202cb962ac59075b964b07152d234b70','active','36hbb5asalkqgpp9xlp6ljcs4798h0m5odxn','DISTRIBUTOR'),(139,'2023-11-21 05:29:47',0,NULL,NULL,'user121@mail.com','202cb962ac59075b964b07152d234b70','active','0y8npve7w8cc39e475caa68sr6lm3eli0lff','DISTRIBUTOR'),(140,'2023-11-21 05:29:53',0,NULL,NULL,'user122@mail.com','202cb962ac59075b964b07152d234b70','active','wp902siocjtyfsef94sgavcaequj0ukojwvg','DISTRIBUTOR'),(141,'2023-11-21 05:29:58',0,NULL,NULL,'user123@mail.com','202cb962ac59075b964b07152d234b70','active','fvdndyvbivdi4r6fuvij8japyjt2wdzqtifi','DISTRIBUTOR'),(142,'2023-11-21 05:30:04',0,NULL,NULL,'user124@mail.com','202cb962ac59075b964b07152d234b70','active','ab1seua72ziw4eezzjpgsxhi42ji5mxhh4fc','DISTRIBUTOR'),(143,'2023-11-21 05:30:09',0,NULL,NULL,'user125@mail.com','202cb962ac59075b964b07152d234b70','active','mhd2nuvp0ni9uyk38cp02gbyp2zhbnhu0r6y','DISTRIBUTOR'),(144,'2023-11-21 05:30:15',0,NULL,NULL,'user126@mail.com','202cb962ac59075b964b07152d234b70','active','1f2azxo62uorum4c6n91oi0ipw1eg6tggpzk','DISTRIBUTOR'),(145,'2023-11-21 05:30:20',0,NULL,NULL,'user127@mail.com','202cb962ac59075b964b07152d234b70','active','jtorjnkf5qkit16ykiirijuk6xk8fdj39d24','DISTRIBUTOR'),(146,'2023-11-21 05:30:26',0,NULL,NULL,'user128@mail.com','202cb962ac59075b964b07152d234b70','active','q512q4chep2zdew0qmvy4vomx45l48e0zvzu','DISTRIBUTOR'),(147,'2023-11-21 05:30:32',0,NULL,NULL,'user129@mail.com','202cb962ac59075b964b07152d234b70','active','yvn7125r90eqtwxk02wlmf5tf7o4hurqtinp','DISTRIBUTOR'),(148,'2023-11-21 05:30:37',0,NULL,NULL,'user130@mail.com','202cb962ac59075b964b07152d234b70','active','eq3vohy5z15owa19l79dpg5nebsbrwrzslxe','DISTRIBUTOR'),(149,'2023-11-21 05:30:43',0,NULL,NULL,'user131@mail.com','202cb962ac59075b964b07152d234b70','active','ou72wrdjyjfrwzwns6y2m8lu9nroet6kthse','DISTRIBUTOR'),(150,'2023-11-21 05:30:48',0,NULL,NULL,'user132@mail.com','202cb962ac59075b964b07152d234b70','active','5qitkvdv74fv5zcjwhidmbhqgvr57t29phwy','DISTRIBUTOR'),(151,'2023-11-21 05:30:54',0,NULL,NULL,'user133@mail.com','202cb962ac59075b964b07152d234b70','active','fp8hsp6nihg72vshylxhjnoxar2ukv6nsnej','DISTRIBUTOR'),(152,'2023-11-21 05:30:59',0,NULL,NULL,'user134@mail.com','202cb962ac59075b964b07152d234b70','active','3pib3lx807rj94egkrqbdcejdbcssgdc7rgr','DISTRIBUTOR'),(153,'2023-11-21 05:31:05',0,NULL,NULL,'user135@mail.com','202cb962ac59075b964b07152d234b70','active','3simkzrlq80uaots94mqk0st4dscjtn8k611','DISTRIBUTOR'),(154,'2023-11-21 05:31:10',0,NULL,NULL,'user136@mail.com','202cb962ac59075b964b07152d234b70','active','3w1geidnp8eiyv4x9p5wigvjweaqiojrkyoy','DISTRIBUTOR'),(155,'2023-11-21 05:31:16',0,NULL,NULL,'user137@mail.com','202cb962ac59075b964b07152d234b70','active','s5gt933yui33f0hcqhnafpyix2mcs2yw7211','DISTRIBUTOR'),(156,'2023-11-21 05:31:21',0,NULL,NULL,'user138@mail.com','202cb962ac59075b964b07152d234b70','active','82lz56y3tj5oi0hh61uk9a8s9abdziwcbiaw','DISTRIBUTOR'),(157,'2023-11-21 05:31:27',0,NULL,NULL,'user139@mail.com','202cb962ac59075b964b07152d234b70','active','fp0vd0aauntwrote1a1ygzdiy0behdud0eoi','DISTRIBUTOR'),(158,'2023-11-21 05:31:33',0,NULL,NULL,'user140@mail.com','202cb962ac59075b964b07152d234b70','active','tibkuruxifdakk91a3n01dzd8ih67zq0464b','DISTRIBUTOR'),(159,'2023-11-21 05:31:38',0,NULL,NULL,'user141@mail.com','202cb962ac59075b964b07152d234b70','active','y24wm71v4rkzeq1wg09z2s2mguazeple897x','DISTRIBUTOR'),(160,'2023-11-21 05:31:44',0,NULL,NULL,'user142@mail.com','202cb962ac59075b964b07152d234b70','active','k3mkeqo31l1q46k128ki2iz2sfzpjk5utiv7','DISTRIBUTOR'),(161,'2023-11-21 05:31:49',0,NULL,NULL,'user143@mail.com','202cb962ac59075b964b07152d234b70','active','2n12ysj8vqkgfipwkq4wq3u1anzsanxyw1rn','DISTRIBUTOR'),(162,'2023-12-05 03:24:35',0,'2023-12-07 08:47:31',0,'mamasuka_jakarta_1@mail.com','202cb962ac59075b964b07152d234b70','active','bkl26ayjyyfef75tdl4mn0hx26ozv8ainz3x','DISTRIBUTOR'),(163,'2023-12-05 04:28:27',0,'2023-12-11 08:10:21',0,'mamasuka_jakarta_2@mail.com','202cb962ac59075b964b07152d234b70','active','rz54lfepo8i2cd1t9sjq7m3lmth4a54852s0','DISTRIBUTOR'),(164,'2023-12-11 08:14:32',0,'2023-12-11 10:21:23',0,'kangny_food_trading_subdist_1@mail.com','202cb962ac59075b964b07152d234b70','active','sofeizhnfer2kyf9ecfz5zytkr571kmb08ws','SUBDIST'),(165,'2023-12-11 08:14:53',0,'2023-12-11 10:21:18',0,'kangny_food_trading_subdist_2@mail.com','202cb962ac59075b964b07152d234b70','active','a7y5l2aaclzb8zdhjpsh4h474hwrstlocohw','SUBDIST');
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

-- Dump completed on 2023-12-11 17:57:19
