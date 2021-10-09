-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: servicegeneraldb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `book_provider`
--

DROP TABLE IF EXISTS `book_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_provider` (
  `book_provider_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `service_id` tinyblob,
  `status` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_provider`
--

LOCK TABLES `book_provider` WRITE;
/*!40000 ALTER TABLE `book_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackid` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (2,'This is a great service','john');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (18);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revinfo`
--

DROP TABLE IF EXISTS `revinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revinfo` (
  `rev` int NOT NULL AUTO_INCREMENT,
  `revtstmp` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revinfo`
--

LOCK TABLES `revinfo` WRITE;
/*!40000 ALTER TABLE `revinfo` DISABLE KEYS */;
INSERT INTO `revinfo` VALUES (1,1632086576084),(2,1632086576224),(3,1632086720424),(4,1632100694505),(5,1632100694532),(6,1632102051662),(7,1632102051805),(8,1632102306284),(9,1632102306322),(10,1632102306341),(11,1632102306353),(12,1632102306364),(13,1632102306384),(14,1632102392799),(15,1632102392947),(16,1633183095917),(17,1633183096071),(18,1633462848816),(19,1633462848858),(20,1633465033822),(21,1633465033845),(22,1633466460314),(23,1633466460363),(24,1633466482818),(25,1633466482848),(26,1633466537695),(27,1633466537728),(28,1633466584553),(29,1633466584579),(30,1633466748180),(31,1633466748271),(32,1633466775730),(33,1633466775759),(34,1633470119618),(35,1633470119790),(36,1633481878940),(37,1633481878967),(38,1633482028496),(39,1633482028520),(40,1633482058104),(41,1633482058174),(42,1633482085754),(43,1633482085772),(44,1633488263145),(45,1633488263429),(46,1633488299997),(47,1633488300044),(48,1633492805206),(49,1633492805292),(50,1633492973834),(51,1633492973866),(52,1633546307711),(53,1633546307789),(55,1633575710625),(56,1633580160828),(57,1633580305607),(58,1633580336697),(59,1633580451646),(60,1633580471201),(61,1633580475641),(62,1633581046252),(63,1633581056989),(64,1633581203004),(65,1633583342628),(66,1633583342686),(67,1633583421946),(68,1633583421989),(69,1633583443494),(70,1633583504784),(71,1633584659024),(72,1633584712032),(73,1633584803122),(74,1633584821060),(75,1633584876153),(76,1633585026640),(77,1633585655813),(78,1633585659521),(79,1633585665717),(80,1633585671707),(81,1633585678248),(82,1633585680978),(83,1633585684984),(84,1633585689286),(85,1633616809936),(86,1633616913705),(87,1633646548515),(88,1633646548565),(89,1633731875808),(90,1633732404713),(91,1633735012823),(92,1633742968589),(93,1633742973438),(94,1633743066712),(95,1633743091652),(96,1633743223731),(97,1633743229585),(98,1633743232884),(99,1633743235684),(100,1633743239132),(101,1633754590115),(102,1633754594011),(103,1633754597021),(104,1633754788858),(105,1633754792818),(106,1633755160089),(107,1633755160137),(108,1633755196557),(109,1633755196588),(110,1633755234812),(111,1633755234864),(112,1633755265379),(113,1633755265398),(114,1633755341734),(115,1633755341769),(116,1633755405462),(117,1633755405500),(118,1633755486953),(119,1633755486979),(120,1633755518523),(121,1633755518545),(122,1633755562312),(123,1633755562332),(124,1633755625710),(125,1633755625725),(126,1633755741134),(127,1633755741166),(128,1633755788613),(129,1633755788642),(130,1633755876645),(131,1633755876680),(132,1633755916110),(133,1633755916135),(134,1633756169104),(135,1633756169130),(136,1633756219008),(137,1633756219023),(138,1633756298108),(139,1633756298125),(140,1633756349855),(141,1633756349880),(142,1633756795037),(143,1633756795102),(144,1633756971635),(145,1633757001198),(146,1633757083134),(147,1633757143903);
/*!40000 ALTER TABLE `revinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` bigint NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'painting'),(2,'laundary'),(3,'movers'),(4,'isp'),(5,'roofing'),(6,'locksmith'),(7,'plumbing'),(8,'repair'),(9,'salon');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_aud`
--

DROP TABLE IF EXISTS `service_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_aud` (
  `service_id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`,`rev`),
  KEY `FKhtajr93f8i4h9jwi7j8xygno9` (`rev`),
  CONSTRAINT `FKhtajr93f8i4h9jwi7j8xygno9` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_aud`
--

LOCK TABLES `service_aud` WRITE;
/*!40000 ALTER TABLE `service_aud` DISABLE KEYS */;
INSERT INTO `service_aud` VALUES (1,8,1,'Painting'),(2,9,1,'Laundary'),(3,10,1,'Movers and Packers'),(4,11,1,'Internet Service'),(4,15,1,'Internet Service'),(5,12,1,NULL);
/*!40000 ALTER TABLE `service_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_metadata`
--

DROP TABLE IF EXISTS `service_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_metadata` (
  `service_name` varchar(255) NOT NULL,
  `service_imgurl` varchar(255) DEFAULT NULL,
  `service_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_metadata`
--

LOCK TABLES `service_metadata` WRITE;
/*!40000 ALTER TABLE `service_metadata` DISABLE KEYS */;
INSERT INTO `service_metadata` VALUES ('cleaning','images/block-dryer.jpg','DRY CLEANING'),('isp','images/block-ISP.jpg','INTERNET SERVICE PROVIDER'),('locksmith','images/block-locksmith.jpg','LOCKSMITH'),('movers','images/block-movers.jpg','MOVERS AND PACKERS'),('painting','images/block-painter.jpg','LOCAL HOUSE PAINTERS'),('plumbing','images/block-plumbing.jpg','PLUMBING'),('repair','images/block-mobile.jpg','PHONE AND MOBILE REPAIRER'),('roofing','images/block-roofing.jpg','ROOFING'),('salon','images/block-salon.jpg','SALON');
/*!40000 ALTER TABLE `service_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `service_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsy14xx9udqvuoa4nbt0bqsekx` (`service_id`),
  KEY `FKj5f1p0fsyapffr47mguwm50ha` (`username`),
  CONSTRAINT `FKj5f1p0fsyapffr47mguwm50ha` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKsy14xx9udqvuoa4nbt0bqsekx` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (22,4,'verizon'),(23,4,'xfinity'),(24,1,'asianpaints'),(25,1,'nerolac'),(26,8,'globalnet'),(27,8,'bestbuy'),(28,3,'xpressmovers'),(29,3,'aplhamovers'),(30,NULL,'pinto'),(31,NULL,'nycleaner'),(32,6,'unlock'),(33,6,'masterkey'),(34,5,'localroofer'),(35,5,'roofrepair'),(36,7,'lowes'),(37,7,'brothers'),(38,9,'sephora'),(39,9,'victoria'),(40,NULL,'john');
/*!40000 ALTER TABLE `service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_aud`
--

DROP TABLE IF EXISTS `service_provider_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKiom3u9dm02e44f1aywicrtqja` (`rev`),
  CONSTRAINT `FKiom3u9dm02e44f1aywicrtqja` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_aud`
--

LOCK TABLES `service_provider_aud` WRITE;
/*!40000 ALTER TABLE `service_provider_aud` DISABLE KEYS */;
INSERT INTO `service_provider_aud` VALUES (22,107,0,4,'verizon'),(23,109,0,4,'xfinity'),(24,111,0,1,'asianpaints'),(25,113,0,1,'nerolac'),(26,115,0,8,'globalnet'),(27,117,0,8,'bestbuy'),(28,119,0,3,'xpressmovers'),(29,121,0,3,'aplhamovers'),(30,123,0,NULL,'pinto'),(31,125,0,NULL,'nycleaner'),(32,127,0,6,'unlock'),(33,129,0,6,'masterkey'),(34,131,0,5,'localroofer'),(35,133,0,5,'roofrepair'),(36,135,0,7,'lowes'),(37,137,0,7,'brothers'),(38,139,0,9,'sephora'),(39,141,0,9,'victoria'),(40,143,0,NULL,'john');
/*!40000 ALTER TABLE `service_provider_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request` (
  `service_req_id` bigint NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `service_date` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_req_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
INSERT INTO `service_request` VALUES (16,'john','2021-10-12','brothers','plumbing','ACCEPT'),(17,'john','2021-10-17','victoria','salon','ACCEPT');
/*!40000 ALTER TABLE `service_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request_aud`
--

DROP TABLE IF EXISTS `service_request_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request_aud` (
  `service_req_id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `service_date` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_req_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_req_id`,`rev`),
  KEY `FK2um1tya1b2wfram0dcwh5671o` (`rev`),
  CONSTRAINT `FK2um1tya1b2wfram0dcwh5671o` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request_aud`
--

LOCK TABLES `service_request_aud` WRITE;
/*!40000 ALTER TABLE `service_request_aud` DISABLE KEYS */;
INSERT INTO `service_request_aud` VALUES (16,144,0,'john','2021-10-12','brothers','plumbing','PENDING'),(16,146,1,'john','2021-10-12','brothers','plumbing','ACCEPT'),(17,145,0,'john','2021-10-17','victoria','salon','PENDING'),(17,147,1,'john','2021-10-17','victoria','salon','ACCEPT');
/*!40000 ALTER TABLE `service_request_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aplhamovers','100 Clifton Pl','2021-10-09 00:58:38.514312','alpha@movers.com','Alpha','Movers','2021-10-09 00:58:38.514312','1234','8888888888','movers','provider'),('asianpaints','100 Clifton Pl','2021-10-09 00:53:54.806678','asian@paints.com','Asian','Paints','2021-10-09 00:53:54.806678','1234','3333333333','painting','provider'),('bestbuy','100 Clifton Pl','2021-10-09 00:56:45.452108','best@buy.com','BestBuy','PhoneRepair','2021-10-09 00:56:45.452108','1234','6666666666','repair','provider'),('brothers','100 Clifton Pl','2021-10-09 01:10:19.005258','bro@plum.com','Brothers','Plumbing','2021-10-09 01:10:19.005258','1234','0555555555','plumbing','provider'),('globalnet','100 Clifton Pl','2021-10-09 00:55:41.724811','net@global.com','GlobalNet','Repair','2021-10-09 00:55:41.724811','1234','5555555555','repair','provider'),('john','100 Clifton Pl','2021-10-09 01:19:55.021990','john.smith@user.com','John','Smith','2021-10-09 01:19:55.021990','1234','1234543210',NULL,'customer'),('localroofer','100 Clifton Pl','2021-10-09 01:04:36.634734','local@roofer.com','Roofer','Local','2021-10-09 01:04:36.634734','1234','0333333333','roofing','provider'),('lowes','100 Clifton Pl','2021-10-09 01:09:29.094552','lowes@plumbing.com','Lowes','Plumbing','2021-10-09 01:09:29.094552','1234','0444444444','plumbing','provider'),('masterkey','100 Clifton Pl','2021-10-09 01:03:08.607891','master@key.com','Masterkey','Locksmith','2021-10-09 01:03:08.607891','1234','0222222222','locksmith','provider'),('nerolac','100 Clifton Pl','2021-10-09 00:54:25.370641','nerolac@paints.com','Nerolac','Paints','2021-10-09 00:54:25.370641','1234','4444444444','painting','provider'),('nycleaner','100 Clifton Pl','2021-10-09 01:00:25.704077','ny@cleaner.com','Cleaner','NewYork','2021-10-09 01:00:25.704077','1234','0000000000','cleaning','provider'),('pinto','100 Clifton Pl','2021-10-09 00:59:22.302985','pinto@laundary.com','Pinto','Laundary','2021-10-09 00:59:22.302985','1234','9999999999','cleaning','provider'),('roofrepair','100 Clifton Pl','2021-10-09 01:05:16.103029','roof@repair.com','RoofRepair','Company','2021-10-09 01:05:16.103029','1234','0444444444','roofing','provider'),('sephora','100 Clifton Pl','2021-10-09 01:11:38.102087','sep@salon.com','Sephora','Salons','2021-10-09 01:11:38.102087','1234','0666666666','salon','provider'),('unlock','100 Clifton Pl','2021-10-09 01:02:21.125024','unlock@locksmith.com','Unlock','Everything','2021-10-09 01:02:21.125024','1234','0111111111','locksmith','provider'),('verizon','100 Clifton Pl','2021-10-09 00:52:39.946500','verizon.data@internet.com','Verizon','Data','2021-10-09 00:52:39.946500','1234','1111111111','isp','provider'),('victoria','100 Clifton Pl','2021-10-09 01:12:29.845351','vic@salon.com','Victoria','Salons','2021-10-09 01:12:29.845351','1234','0777777777','salon','provider'),('xfinity','100 Clifton Pl','2021-10-09 00:53:16.544708','xfinity@data.com','Xfinity','Data','2021-10-09 00:53:16.544708','1234','2222222222','isp','provider'),('xpressmovers','100 Clifton Pl','2021-10-09 00:58:06.940517','xpress@movers.com','Xpress','Movers','2021-10-09 00:58:06.940517','1234','7777777777','movers','provider');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_aud`
--

DROP TABLE IF EXISTS `user_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_aud` (
  `username` varchar(255) NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`,`rev`),
  KEY `FK89ntto9kobwahrwxbne2nqcnr` (`rev`),
  CONSTRAINT `FK89ntto9kobwahrwxbne2nqcnr` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_aud`
--

LOCK TABLES `user_aud` WRITE;
/*!40000 ALTER TABLE `user_aud` DISABLE KEYS */;
INSERT INTO `user_aud` VALUES ('aplhamovers',120,0,'100 Clifton Pl','2021-10-09 00:58:38.514312','alpha@movers.com','Alpha','Movers','2021-10-09 00:58:38.514312','1234','8888888888','movers','provider'),('aplhamovers',121,1,'100 Clifton Pl',NULL,'alpha@movers.com','Alpha','Movers',NULL,'1234','8888888888','movers','provider'),('asianpaints',110,0,'100 Clifton Pl','2021-10-09 00:53:54.806678','asian@paints.com','Asian','Paints','2021-10-09 00:53:54.806678','1234','3333333333','painting','provider'),('asianpaints',111,1,'100 Clifton Pl',NULL,'asian@paints.com','Asian','Paints',NULL,'1234','3333333333','painting','provider'),('bestbuy',116,0,'100 Clifton Pl','2021-10-09 00:56:45.452108','best@buy.com','BestBuy','PhoneRepair','2021-10-09 00:56:45.452108','1234','6666666666','repair','provider'),('bestbuy',117,1,'100 Clifton Pl',NULL,'best@buy.com','BestBuy','PhoneRepair',NULL,'1234','6666666666','repair','provider'),('brothers',136,0,'100 Clifton Pl','2021-10-09 01:10:19.005258','bro@plum.com','Brothers','Plumbing','2021-10-09 01:10:19.005258','1234','0555555555','plumbing','provider'),('brothers',137,1,'100 Clifton Pl',NULL,'bro@plum.com','Brothers','Plumbing',NULL,'1234','0555555555','plumbing','provider'),('globalnet',114,0,'100 Clifton Pl','2021-10-09 00:55:41.724811','net@global.com','GlobalNet','Repair','2021-10-09 00:55:41.724811','1234','5555555555','repair','provider'),('globalnet',115,1,'100 Clifton Pl',NULL,'net@global.com','GlobalNet','Repair',NULL,'1234','5555555555','repair','provider'),('john',142,0,'100 Clifton Pl','2021-10-09 01:19:55.021990','john.smith@user.com','John','Smith','2021-10-09 01:19:55.021990','1234','1234543210',NULL,'customer'),('john',143,1,'100 Clifton Pl',NULL,'john.smith@user.com','John','Smith',NULL,'1234','1234543210',NULL,'customer'),('localroofer',130,0,'100 Clifton Pl','2021-10-09 01:04:36.634734','local@roofer.com','Roofer','Local','2021-10-09 01:04:36.634734','1234','0333333333','roofing','provider'),('localroofer',131,1,'100 Clifton Pl',NULL,'local@roofer.com','Roofer','Local',NULL,'1234','0333333333','roofing','provider'),('lowes',134,0,'100 Clifton Pl','2021-10-09 01:09:29.094552','lowes@plumbing.com','Lowes','Plumbing','2021-10-09 01:09:29.094552','1234','0444444444','plumbing','provider'),('lowes',135,1,'100 Clifton Pl',NULL,'lowes@plumbing.com','Lowes','Plumbing',NULL,'1234','0444444444','plumbing','provider'),('masterkey',128,0,'100 Clifton Pl','2021-10-09 01:03:08.607891','master@key.com','Masterkey','Locksmith','2021-10-09 01:03:08.607891','1234','0222222222','locksmith','provider'),('masterkey',129,1,'100 Clifton Pl',NULL,'master@key.com','Masterkey','Locksmith',NULL,'1234','0222222222','locksmith','provider'),('nerolac',112,0,'100 Clifton Pl','2021-10-09 00:54:25.370641','nerolac@paints.com','Nerolac','Paints','2021-10-09 00:54:25.370641','1234','4444444444','painting','provider'),('nerolac',113,1,'100 Clifton Pl',NULL,'nerolac@paints.com','Nerolac','Paints',NULL,'1234','4444444444','painting','provider'),('nycleaner',124,0,'100 Clifton Pl','2021-10-09 01:00:25.704077','ny@cleaner.com','Cleaner','NewYork','2021-10-09 01:00:25.704077','1234','0000000000','cleaning','provider'),('nycleaner',125,1,'100 Clifton Pl',NULL,'ny@cleaner.com','Cleaner','NewYork',NULL,'1234','0000000000','cleaning','provider'),('pinto',122,0,'100 Clifton Pl','2021-10-09 00:59:22.302985','pinto@laundary.com','Pinto','Laundary','2021-10-09 00:59:22.302985','1234','9999999999','cleaning','provider'),('pinto',123,1,'100 Clifton Pl',NULL,'pinto@laundary.com','Pinto','Laundary',NULL,'1234','9999999999','cleaning','provider'),('roofrepair',132,0,'100 Clifton Pl','2021-10-09 01:05:16.103029','roof@repair.com','RoofRepair','Company','2021-10-09 01:05:16.103029','1234','0444444444','roofing','provider'),('roofrepair',133,1,'100 Clifton Pl',NULL,'roof@repair.com','RoofRepair','Company',NULL,'1234','0444444444','roofing','provider'),('sephora',138,0,'100 Clifton Pl','2021-10-09 01:11:38.102087','sep@salon.com','Sephora','Salons','2021-10-09 01:11:38.102087','1234','0666666666','salon','provider'),('sephora',139,1,'100 Clifton Pl',NULL,'sep@salon.com','Sephora','Salons',NULL,'1234','0666666666','salon','provider'),('unlock',126,0,'100 Clifton Pl','2021-10-09 01:02:21.125024','unlock@locksmith.com','Unlock','Everything','2021-10-09 01:02:21.125024','1234','0111111111','locksmith','provider'),('unlock',127,1,'100 Clifton Pl',NULL,'unlock@locksmith.com','Unlock','Everything',NULL,'1234','0111111111','locksmith','provider'),('verizon',106,0,'100 Clifton Pl','2021-10-09 00:52:39.946500','verizon.data@internet.com','Verizon','Data','2021-10-09 00:52:39.946500','1234','1111111111','isp','provider'),('verizon',107,1,'100 Clifton Pl',NULL,'verizon.data@internet.com','Verizon','Data',NULL,'1234','1111111111','isp','provider'),('victoria',140,0,'100 Clifton Pl','2021-10-09 01:12:29.845351','vic@salon.com','Victoria','Salons','2021-10-09 01:12:29.845351','1234','0777777777','salon','provider'),('victoria',141,1,'100 Clifton Pl',NULL,'vic@salon.com','Victoria','Salons',NULL,'1234','0777777777','salon','provider'),('xfinity',108,0,'100 Clifton Pl','2021-10-09 00:53:16.544708','xfinity@data.com','Xfinity','Data','2021-10-09 00:53:16.544708','1234','2222222222','isp','provider'),('xfinity',109,1,'100 Clifton Pl',NULL,'xfinity@data.com','Xfinity','Data',NULL,'1234','2222222222','isp','provider'),('xpressmovers',118,0,'100 Clifton Pl','2021-10-09 00:58:06.940517','xpress@movers.com','Xpress','Movers','2021-10-09 00:58:06.940517','1234','7777777777','movers','provider'),('xpressmovers',119,1,'100 Clifton Pl',NULL,'xpress@movers.com','Xpress','Movers',NULL,'1234','7777777777','movers','provider');
/*!40000 ALTER TABLE `user_aud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-09  1:27:45
