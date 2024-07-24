-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `san_pham_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ngay_tao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_sanpham_idx` (`san_pham_id`),
  KEY `fk_comment_user_idx` (`user_id`),
  CONSTRAINT `fk_comment_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'ngoăn',1,3,'2022-04-10 08:08:00'),(13,'tốt',1,3,'2022-10-06 14:57:30'),(14,'tuyệt',1,3,'2022-10-06 21:28:19'),(15,'aaa',1,3,'2022-10-06 21:30:00'),(16,'đẹp',2,4,'2022-10-07 14:34:01'),(17,'tuyệt',2,4,'2022-10-07 15:37:32'),(18,'alo',3,3,'2022-10-08 22:16:24'),(19,'tuyeejt',3,3,'2022-10-08 22:20:24'),(20,'alo',1,3,'2022-10-10 14:53:15'),(21,'alo',1,3,'2022-10-11 10:43:55'),(22,'nnn',1,3,'2022-10-11 10:46:53'),(23,'ádfg',1,3,'2022-10-11 10:50:04'),(24,'demo',1,3,'2022-10-11 10:53:41'),(25,'ưer',3,3,'2022-10-11 10:59:37'),(26,'nnn',3,3,'2022-10-11 11:00:16'),(27,'aaa',3,3,'2022-10-11 11:04:01'),(28,'aa',1,3,'2022-10-11 12:35:49');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_muc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (1,'Tee'),(2,'Jacket'),(3,'Pants'),(4,'Shorts');
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `num` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderdetail_order_idx` (`order_id`),
  KEY `fk_orderdetail_sanpham_idx` (`san_pham_id`),
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`),
  CONSTRAINT `fk_orderdetail_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,1,1,600000,2),(3,2,3,300000,1),(4,3,16,450000,1),(5,4,17,450000,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `ngay_tao` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (1,2,'2022-04-10 08:08:00',3),(2,1,'2022-05-10 08:08:00',3),(3,1,'2022-06-10 08:08:00',4),(4,1,'2022-07-10 08:08:00',4),(5,1550000,'2022-10-10 15:06:24',NULL),(6,1660000,'2022-10-10 15:10:32',NULL),(7,1660000,'2022-10-10 15:11:45',NULL),(8,1200000,'2022-10-10 16:44:59',NULL),(9,1800000,'2022-10-11 10:55:59',NULL),(10,600000,'2022-10-12 08:36:58',NULL),(11,3900000,'2022-10-12 15:17:40',NULL),(12,3900000,'2022-10-12 15:17:47',NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghi_chu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gia` decimal(10,0) NOT NULL,
  `hinh_anh` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `danh_muc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sanpham_danhmuc_idx` (`danh_muc_id`),
  CONSTRAINT `fk_sanpham_danhmuc` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,NULL,NULL,'GALAXY TEE - WHITE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615003/Shop/Tee/W_GALAXY_TEE_1_dumzkc.png',1),(2,NULL,NULL,'GALAXY TEE - RED','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615002/Shop/Tee/R_GALAXY_TEE_1_tahij8.png',1),(3,NULL,NULL,'GALAXY TEE - BLACK','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615000/Shop/Tee/B_GALAXY_TEE_1_umuwfs.png',1),(4,NULL,NULL,'LINK TEE - BLACK','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615000/Shop/Tee/B_SS-LINK_TEE_1_cuh1oz.png',1),(5,NULL,NULL,'LINK TEE - GREEN','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615002/Shop/Tee/GR_SS-LINK_TEE_1_jpfurt.png',1),(6,NULL,NULL,'LINK TEE - RED','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615003/Shop/Tee/R_SS-LINK_TEE_1_lpikja.png',1),(7,NULL,NULL,'BASIC PIGMENT DYED TEE - BLUE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615000/Shop/Tee/BL_BASIC_PIGMENT_DYED_TEE_1_pxtrzl.png',1),(8,NULL,NULL,'BASIC PIGMENT DYED TEE - BLACK','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615000/Shop/Tee/B_BASIC_PIGMENT_DYED_TEE_1_wyrmlo.png',1),(9,NULL,NULL,'FLIPPED TEE - WHITE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615002/Shop/Tee/W_FLIPPED_TEE_1_mw6s8l.png',1),(10,NULL,NULL,'BONES STOCK TEE - WHITE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615002/Shop/Tee/W_BONES_STOCK_TEE_1_led2wn.png',1),(11,NULL,NULL,'BONES STOCK TEE - RED','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615002/Shop/Tee/R_BONES_STOCK_TEE_1_qf81ax.png',1),(12,NULL,NULL,'DANCE ENERGY TEE - BLACK','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615001/Shop/Tee/BLACK_DANCE_ENERGY_TEE_1_o0ehbq.png',1),(13,NULL,NULL,'SOLO S PIGMENT DYED TEE - WHITE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615003/Shop/Tee/WHITE_SOLO_S_PIGMENT_DYED_TEE_1_j26nbl.png',1),(14,NULL,NULL,'DANCE ENERGY TEE - WHITE','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615003/Shop/Tee/WHITE_DANCE_ENERGY_TEE_1_mdvt6v.png',1),(15,NULL,NULL,'SOLO S PIGMENT DYED TEE - BLACK','Material: Cotton leather (water resistant)',300000,'https://res.cloudinary.com/hat/image/upload/v1664615003/Shop/Tee/SOLO_S_PIGMENT_DYED_TEE_1_u8ixfw.png',1),(16,NULL,NULL,'BASIC HOODIE - BLACK','Material: Cotton leather (water resistant)',450000,'https://res.cloudinary.com/hat/image/upload/v1664626947/Shop/Jackets/B_BASIC_HOODIE_1_xckqiy.webp',2),(17,NULL,NULL,'BASIC HOODIE - WHITE','Material: Cotton leather (water resistant)',450000,'https://res.cloudinary.com/hat/image/upload/v1664626948/Shop/Jackets/W_BASIC_HOODIE_1_sp1bbt.webp',2),(18,NULL,NULL,'BASIC ZIP HOODIE - BLACK','Material: Cotton leather (water resistant)',550000,'https://res.cloudinary.com/hat/image/upload/v1664626947/Shop/Jackets/B_BASIC_ZIP_HOODIE_1_zxghvu.webp',2),(19,NULL,NULL,'BASIC ZIP HOODIE - WHITE','Material: Cotton leather (water resistant)',550000,'https://res.cloudinary.com/hat/image/upload/v1664626948/Shop/Jackets/W_BASIC_ZIP_HOODIE_1_mgucmw.webp',2),(36,NULL,NULL,'ZIP WORK JACKET ','Material: Cotton leather (water resistant)',700000,'https://res.cloudinary.com/hat/image/upload/v1664626948/Shop/Jackets/ZIP_WORK_JACKET_1_a9kzfn.webp',2),(37,NULL,NULL,'SHADOW PLAID FLANNEL ','Material: Cotton leather (water resistant)',650000,'https://res.cloudinary.com/hat/image/upload/v1664626948/Shop/Jackets/SHADOW_PLAID_FLANNEL_1_yba7wf.webp',2),(38,NULL,NULL,'OVERSIZED HOODIE - GRAY','Material: Cotton leather (water resistant)',550000,'https://res.cloudinary.com/hat/image/upload/v1664626947/Shop/Jackets/G_OVERSIZED_HOODIE_1_jxndws.webp',2),(39,NULL,NULL,'OVERSIZED HOODIE - RED','Material: Cotton leather (water resistant)',550000,'https://res.cloudinary.com/hat/image/upload/v1664626947/Shop/Jackets/R_OVERSIZED_HOODIE_1_m1lokf.webp',2),(40,NULL,NULL,'OVERDYED ZIP WORK JACKET','Material: PVC leather (water resistant)',700000,'https://res.cloudinary.com/hat/image/upload/v1664626948/Shop/Jackets/W_OVERDYED_ZIP_WORK_JACKET_1_nbopom.webp',2),(41,NULL,NULL,'DENIM BIG OL\' JEAN','Material: PVC leather (water resistant)',550000,'https://res.cloudinary.com/hat/image/upload/v1664626840/Shop/Pants/DENIM_BIG_OL_JEAN_1_vb4tbv.png',3),(42,NULL,NULL,'DENIM DOUBLE KNEE PANT ','Material: PVC leather (water resistant)',600000,'https://res.cloudinary.com/hat/image/upload/v1664626839/Shop/Pants/DENIM_DOUBLE_KNEE_PANT_1_naj0s7.png',3),(43,NULL,NULL,'MOB BEACH PANT ','Material: PVC leather (water resistant)',500000,'https://res.cloudinary.com/hat/image/upload/v1664626840/Shop/Pants/MOB_BEACH_PANT_1_lhnkyu.png',3),(44,NULL,NULL,'POLY TRACK PANT ','Material: PVC leather (water resistant)',450000,'https://res.cloudinary.com/hat/image/upload/v1664626837/Shop/Pants/POLY_TRACK_PANT_1_pzz8sg.png',3),(45,NULL,NULL,'SPORT CARGO FLEECE PANT ','Material: PVC leather (water resistant)',570000,'https://res.cloudinary.com/hat/image/upload/v1664626839/Shop/Pants/SPORT_CARGO_FLEECE_PANT_1_njzwtn.png',3),(46,NULL,NULL,'TIGRIS CANVAS BIG OL\' JEAN ',NULL,500000,'https://res.cloudinary.com/hat/image/upload/v1664626840/Shop/Pants/TIGRIS_CANVAS_BIG_OL_JEAN_1_z0qez1.png',3),(47,NULL,NULL,'VOLUME PLEATED TROUSER ',NULL,500000,'https://res.cloudinary.com/hat/image/upload/v1664626841/Shop/Pants/VOLUME_PLEATED_TROUSER_1_j1lnir.png',3),(48,NULL,NULL,'RIPSTOP SURPLUS CARGO ',NULL,560000,'https://res.cloudinary.com/hat/image/upload/v1664626838/Shop/Pants/RIPSTOP_SURPLUS_CARGO_1_lvdklg.png',3),(54,NULL,NULL,'8-BALL MESH SHORT ',NULL,400000,'https://res.cloudinary.com/hat/image/upload/v1664626866/Shop/Shorts/8-BALL_MESH_SHORT_1_revex9.png',4),(55,NULL,NULL,'BIG BASIC MESH SHORT - BLACK',NULL,420000,'https://res.cloudinary.com/hat/image/upload/v1664626867/Shop/Shorts/BIG_BASIC_MESH_SHORT_B_1_utpdrr.png',4),(56,NULL,NULL,'STOCK NYLON SHORT ',NULL,420000,'https://res.cloudinary.com/hat/image/upload/v1664626866/Shop/Shorts/BIG_STOCK_NYLON_SHORT_1_kjkbm9.png',4),(57,NULL,NULL,'CURLY S WATER SHORT',NULL,400000,'https://res.cloudinary.com/hat/image/upload/v1664626867/Shop/Shorts/CURLY_S_WATER_SHORT_W_1_lxubz6.png',4),(58,NULL,NULL,'OVERDYED STOCK LOGO SHORT ',NULL,450000,'https://res.cloudinary.com/hat/image/upload/v1664626868/Shop/Shorts/OVERDYED_STOCK_LOGO_SHORT_1_zrcqeb.png',4),(59,NULL,NULL,'STOCK WATER SHORT - RED',NULL,400000,'https://res.cloudinary.com/hat/image/upload/v1664626867/Shop/Shorts/STOCK_WATER_SHORT_R_1_de500j.png',4),(60,NULL,NULL,'STOCK WATER SHORT - BLACK',NULL,400000,'https://res.cloudinary.com/hat/image/upload/v1664626867/Shop/Shorts/STOCK_WATER_SHORT_B_1_fjklz0.png',4),(61,NULL,NULL,'BIG BASIC MESH SHORT - BLUE',NULL,420000,'https://res.cloudinary.com/hat/image/upload/v1664626866/Shop/Shorts/BIG_BASIC_MESH_SHORT_BL_1_snzabx.png',4);
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,NULL,'HuynhAnhTuan','$2a$10$MlHcji9ALB0j3T5/peJBveTEY23El/64zBnJJFKaMySXjmqZFq1X6','AnhTuan','Huynh','NAM','123','123','ROLE_ADMIN','https://res.cloudinary.com/hat/image/upload/v1659075661/cld-sample.jpg'),(4,NULL,'Tuan','$2a$10$rleu7OFVkJ2DlSoe5mZeSeHT19e1qpEb509Dd/BxY2yE.KaRRQ9JG','Tuấn','Huỳnh','nu','1951052223tuan@ou.edu.vn','0123456789','ROLE_USER','https://res.cloudinary.com/hat/image/upload/v1665127659/niymdyfru8s7hgxyi58w.jpg'),(5,NULL,'hat','$2a$10$HWJk1qJKJMIZE69nj0wcpujXt6oOvT8pWWafLvrqHR8N83K8urWH2','Anh Tuấn','Huỳnh','nam','1951052223tuan@ou.edu.vn','0123456789','ROLE_USER','https://res.cloudinary.com/hat/image/upload/v1665562564/om5he4acjbm27cssnfjw.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13 11:21:10
