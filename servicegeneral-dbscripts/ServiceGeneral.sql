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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revinfo`
--

LOCK TABLES `revinfo` WRITE;
/*!40000 ALTER TABLE `revinfo` DISABLE KEYS */;
INSERT INTO `revinfo` VALUES (1,1632086576084),(2,1632086576224),(3,1632086720424),(4,1632100694505),(5,1632100694532),(6,1632102051662),(7,1632102051805),(8,1632102306284),(9,1632102306322),(10,1632102306341),(11,1632102306353),(12,1632102306364),(13,1632102306384),(14,1632102392799),(15,1632102392947),(16,1633183095917),(17,1633183096071);
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
INSERT INTO `service` VALUES (1,'Painting'),(2,'Laundary'),(3,'Movers and Packers'),(4,'Internet Service'),(5,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (7,4,'melba'),(8,5,'selwyn');
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
INSERT INTO `service_provider_aud` VALUES (1,2,0,NULL,'melba'),(1,4,2,NULL,NULL),(2,7,0,NULL,'melba'),(2,8,2,NULL,NULL),(3,9,2,NULL,NULL),(4,10,2,NULL,NULL),(5,11,2,NULL,NULL),(6,12,2,NULL,NULL),(7,15,0,4,'melba'),(8,17,0,5,'selwyn');
/*!40000 ALTER TABLE `service_provider_aud` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('melba','100 Clifton Pl','2021-09-19 21:46:32.744084','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:46:32.744084','melba','5512295950','Internet Service','provider'),('selwyn','100 Clifton Pl','2021-10-02 09:58:15.852317','dmelloselwyn@gmail.com','Selwyn','Dmello','2021-10-02 09:58:15.852317','1108','5512295950',NULL,'customer');
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
INSERT INTO `user_aud` VALUES ('melba',1,0,'100 Clifton Pl','2021-09-19 17:22:56.024556','mm31798n@pace.edu','Melba','Moro','2021-09-19 17:22:56.024556','melba','5512295950','Laundary','provider'),('melba',2,1,'100 Clifton Pl',NULL,'mm31798n@pace.edu','Melba','Moro',NULL,'melba','5512295950','Laundary','provider'),('melba',3,1,'100 Clifton Pl','2021-09-19 17:22:56.024556','mm31798n@pace.edu','Melba','Moro','2021-09-19 17:25:20.407610','melba','5512295950','Laundary','provider'),('melba',4,1,'100 Clifton Pl','2021-09-19 17:22:56.024556','mm31798n@pace.edu','Melba','Moro','2021-09-19 17:25:20.407610','melba','5512295950','Laundary','provider'),('melba',5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('melba',6,0,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',7,1,'100 Clifton Pl',NULL,'mm31798n@pace.edu','Melba','Moro',NULL,'melba','5512295950','Internet Service','provider'),('melba',8,1,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',9,1,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',10,1,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',11,1,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',12,1,'100 Clifton Pl','2021-09-19 21:40:51.579869','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:40:51.579869','melba','5512295950','Internet Service','provider'),('melba',13,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('melba',14,0,'100 Clifton Pl','2021-09-19 21:46:32.744084','mm31798n@pace.edu','Melba','Moro','2021-09-19 21:46:32.744084','melba','5512295950','Internet Service','provider'),('melba',15,1,'100 Clifton Pl',NULL,'mm31798n@pace.edu','Melba','Moro',NULL,'melba','5512295950','Internet Service','provider'),('selwyn',16,0,'100 Clifton Pl','2021-10-02 09:58:15.852317','dmelloselwyn@gmail.com','Selwyn','Dmello','2021-10-02 09:58:15.852317','1108','5512295950',NULL,'customer'),('selwyn',17,1,'100 Clifton Pl',NULL,'dmelloselwyn@gmail.com','Selwyn','Dmello',NULL,'1108','5512295950',NULL,'customer');
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

-- Dump completed on 2021-10-05 11:36:22
