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
-- Table structure for table `advertisement_request`
--

DROP TABLE IF EXISTS `advertisement_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_request` (
  `advertisement_id` bigint NOT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`advertisement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_request`
--

LOCK TABLES `advertisement_request` WRITE;
/*!40000 ALTER TABLE `advertisement_request` DISABLE KEYS */;
INSERT INTO `advertisement_request` VALUES (67,'2021-11-30','25$ Off on select purchase','plumbing','2021-12-01','Hannuka Sale','brothers'),(70,'2021-11-08','50$ monthly unlimited','isp','2021-11-09','Black Friday Sale','verizon');
/*!40000 ALTER TABLE `advertisement_request` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (32,'Test is complete','john');
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
INSERT INTO `hibernate_sequence` VALUES (96);
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
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revinfo`
--

LOCK TABLES `revinfo` WRITE;
/*!40000 ALTER TABLE `revinfo` DISABLE KEYS */;
INSERT INTO `revinfo` VALUES (1,1632086576084),(2,1632086576224),(3,1632086720424),(4,1632100694505),(5,1632100694532),(6,1632102051662),(7,1632102051805),(8,1632102306284),(9,1632102306322),(10,1632102306341),(11,1632102306353),(12,1632102306364),(13,1632102306384),(14,1632102392799),(15,1632102392947),(16,1633183095917),(17,1633183096071),(18,1633462848816),(19,1633462848858),(20,1633465033822),(21,1633465033845),(22,1633466460314),(23,1633466460363),(24,1633466482818),(25,1633466482848),(26,1633466537695),(27,1633466537728),(28,1633466584553),(29,1633466584579),(30,1633466748180),(31,1633466748271),(32,1633466775730),(33,1633466775759),(34,1633470119618),(35,1633470119790),(36,1633481878940),(37,1633481878967),(38,1633482028496),(39,1633482028520),(40,1633482058104),(41,1633482058174),(42,1633482085754),(43,1633482085772),(44,1633488263145),(45,1633488263429),(46,1633488299997),(47,1633488300044),(48,1633492805206),(49,1633492805292),(50,1633492973834),(51,1633492973866),(52,1633546307711),(53,1633546307789),(55,1633575710625),(56,1633580160828),(57,1633580305607),(58,1633580336697),(59,1633580451646),(60,1633580471201),(61,1633580475641),(62,1633581046252),(63,1633581056989),(64,1633581203004),(65,1633583342628),(66,1633583342686),(67,1633583421946),(68,1633583421989),(69,1633583443494),(70,1633583504784),(71,1633584659024),(72,1633584712032),(73,1633584803122),(74,1633584821060),(75,1633584876153),(76,1633585026640),(77,1633585655813),(78,1633585659521),(79,1633585665717),(80,1633585671707),(81,1633585678248),(82,1633585680978),(83,1633585684984),(84,1633585689286),(85,1633616809936),(86,1633616913705),(87,1633646548515),(88,1633646548565),(89,1633731875808),(90,1633732404713),(91,1633735012823),(92,1633742968589),(93,1633742973438),(94,1633743066712),(95,1633743091652),(96,1633743223731),(97,1633743229585),(98,1633743232884),(99,1633743235684),(100,1633743239132),(101,1633754590115),(102,1633754594011),(103,1633754597021),(104,1633754788858),(105,1633754792818),(106,1633755160089),(107,1633755160137),(108,1633755196557),(109,1633755196588),(110,1633755234812),(111,1633755234864),(112,1633755265379),(113,1633755265398),(114,1633755341734),(115,1633755341769),(116,1633755405462),(117,1633755405500),(118,1633755486953),(119,1633755486979),(120,1633755518523),(121,1633755518545),(122,1633755562312),(123,1633755562332),(124,1633755625710),(125,1633755625725),(126,1633755741134),(127,1633755741166),(128,1633755788613),(129,1633755788642),(130,1633755876645),(131,1633755876680),(132,1633755916110),(133,1633755916135),(134,1633756169104),(135,1633756169130),(136,1633756219008),(137,1633756219023),(138,1633756298108),(139,1633756298125),(140,1633756349855),(141,1633756349880),(142,1633756795037),(143,1633756795102),(144,1633756971635),(145,1633757001198),(146,1633757083134),(147,1633757143903),(148,1633898699930),(149,1633898720498),(150,1633903567794),(151,1633903584142),(152,1633903853257),(153,1633903869996),(154,1633903921995),(155,1633903929222),(156,1633911623112),(157,1633911677493),(158,1633961485154),(159,1633961780537),(160,1633962647154),(161,1633962647213),(162,1633962758720),(163,1633962758739),(164,1633964588036),(165,1633964697838),(166,1634048482155),(167,1634049770447),(168,1634049788862),(169,1634049795454),(170,1634049802667),(171,1634049805679),(172,1634049907240),(173,1634050505451),(174,1634050543927),(175,1634050573533),(176,1634050672215),(177,1634052009347),(178,1634052038866),(179,1634052060822),(180,1634149619162),(181,1634152612710),(182,1634155255729),(183,1634155280737),(184,1634155310020),(185,1634155676619),(186,1634171192846),(187,1634171277113),(188,1634171345083),(189,1634171385396),(190,1634172733899),(191,1634173007904),(192,1634173007950),(193,1634173925408),(194,1634174012777),(195,1634174055199),(196,1634174091930),(197,1634174130503),(198,1634174130519),(199,1634232442918),(200,1634328631282),(201,1634328706020),(202,1634864385148),(203,1635112810657),(204,1635901438377),(205,1635901497090),(206,1635901753619),(207,1635906903953),(208,1635907005260),(209,1635907205135),(210,1635907472769),(211,1635907583176),(212,1635907656883),(213,1635907865609),(214,1635907919580),(215,1635907950301),(216,1635907976629),(217,1635908008664),(218,1635908017629),(219,1635908057781),(220,1635908108729),(221,1635908171172),(222,1635908429477),(223,1635908456891),(224,1635908480559),(225,1635908700558),(226,1635908722295),(227,1635908742949),(228,1635908826086),(229,1635908861667),(230,1635908882977),(231,1635908911213),(232,1635958067051),(233,1635958125882),(234,1635958142104),(235,1635958184705),(236,1635958302298),(237,1635958868048),(238,1635958915520),(239,1635959647887),(240,1635959680555),(241,1635961584358),(242,1635961623606),(243,1635962873386),(244,1635962893655),(245,1635963182063),(246,1635963239962),(247,1636068828689),(248,1636068869940),(249,1636068891220),(250,1636068908817),(251,1636070437697),(252,1636070492246),(253,1636070508508),(254,1636070521854),(255,1636070535646),(256,1636070546358),(257,1636335387413),(258,1636403538699),(259,1636479119863),(260,1636479219185),(261,1636479503831),(262,1636479575408),(263,1636479945414),(264,1636479973136),(265,1636486317175),(266,1636487475267),(267,1636493572855),(268,1636494584592),(269,1636494630378),(270,1636502209588);
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
INSERT INTO `service` VALUES (1,'painting'),(2,'cleaning'),(3,'movers'),(4,'isp'),(5,'roofing'),(6,'locksmith'),(7,'plumbing'),(8,'repair'),(9,'salon');
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
INSERT INTO `service_metadata` VALUES ('cleaning','images/block-dryer.jpg','DRY CLEANING'),('isp','images/block-ISP.jpg','INTERNET'),('locksmith','images/block-locksmith.jpg','LOCKSMITH'),('movers','images/block-movers.jpg','MOVERS AND PACKERS'),('painting','images/block-painter.jpg','PAINTING'),('plumbing','images/block-plumbing.jpg','PLUMBING'),('repair','images/block-mobile.jpg','PHONE AND MOBILE REPAIR'),('roofing','images/block-roofing.jpg','ROOFING'),('salon','images/block-salon.jpg','SALON');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (22,4,'verizon'),(23,4,'xfinity'),(24,1,'asianpaints'),(25,1,'nerolac'),(26,8,'globalnet'),(27,8,'bestbuy'),(28,3,'xpressmovers'),(29,3,'aplhamovers'),(30,2,'pinto'),(31,NULL,'nycleaner'),(32,6,'unlock'),(33,6,'masterkey'),(34,5,'localroofer'),(35,5,'roofrepair'),(36,7,'lowes'),(37,7,'brothers'),(38,9,'sephora'),(39,9,'victoria'),(40,NULL,'john');
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
INSERT INTO `service_provider_aud` VALUES (22,107,0,4,'verizon'),(23,109,0,4,'xfinity'),(24,111,0,1,'asianpaints'),(25,113,0,1,'nerolac'),(26,115,0,8,'globalnet'),(27,117,0,8,'bestbuy'),(28,119,0,3,'xpressmovers'),(29,121,0,3,'aplhamovers'),(30,123,0,NULL,'pinto'),(31,125,0,NULL,'nycleaner'),(32,127,0,6,'unlock'),(33,129,0,6,'masterkey'),(34,131,0,5,'localroofer'),(35,133,0,5,'roofrepair'),(36,135,0,7,'lowes'),(37,137,0,7,'brothers'),(38,139,0,9,'sephora'),(39,141,0,9,'victoria'),(40,143,0,NULL,'john'),(41,161,0,NULL,'joe'),(41,162,2,NULL,NULL),(42,192,0,NULL,'johnsmith'),(42,197,2,NULL,NULL);
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
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`service_req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
INSERT INTO `service_request` VALUES (17,'john','2021-10-17','victoria','salon','ACCEPT',4),(23,'john','2021-10-15','verizon','isp','ACCEPT',3),(28,'john','2021-10-18','localroofer','roofing','ACCEPT',3),(29,'john','2021-10-15','nerolac','painting','DECLINE',NULL),(30,'john','2021-10-14','brothers','plumbing','PENDING',NULL),(31,'johnsmith','2021-10-16','verizon','isp','ACCEPT',NULL),(32,'johnsmith','2021-10-18','asianpaints','painting','DECLINE',NULL),(33,'john','2021-10-14','nycleaner','cleaning','PENDING',NULL),(34,'john','2021-10-15','asianpaints','painting','ACCEPT',3),(35,'john','2021-11-02','xfinity','isp','ACCEPT',3),(36,'john','2021-11-02','masterkey','locksmith','ACCEPT',4);
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
  `rating` float DEFAULT NULL,
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
INSERT INTO `service_request_aud` VALUES (16,144,0,'john','2021-10-12 00:00:00','brothers','plumbing','PENDING',NULL),(16,146,1,'john','2021-10-12 00:00:00','brothers','plumbing','ACCEPT',NULL),(16,150,1,'john','2021-10-12 00:00:00','brothers','plumbing','ACCEPT',4),(16,167,1,'john','2021-10-12','brothers','plumbing','ACCEPT',5),(16,168,1,'john','2021-10-12','brothers','plumbing','ACCEPT',4),(16,169,1,'john','2021-10-12','brothers','plumbing','ACCEPT',5),(16,172,1,'john','2021-10-12','brothers','plumbing','ACCEPT',2),(17,145,0,'john','2021-10-17 00:00:00','victoria','salon','PENDING',NULL),(17,147,1,'john','2021-10-17 00:00:00','victoria','salon','ACCEPT',NULL),(17,151,1,'john','2021-10-17 00:00:00','victoria','salon','ACCEPT',5),(17,203,1,'john','2021-10-17','victoria','salon','ACCEPT',4),(18,148,0,'john','2021-10-10 00:00:00','verizon','isp','PENDING',NULL),(18,149,1,'john','2021-10-10 00:00:00','verizon','isp','ACCEPT',NULL),(18,155,1,'john','2021-10-10 00:00:00','verizon','isp','ACCEPT',5),(19,152,0,'john','2021-10-20 00:00:00','verizon','isp','PENDING',NULL),(19,153,1,'john','2021-10-20 00:00:00','verizon','isp','ACCEPT',NULL),(19,154,1,'john','2021-10-20 00:00:00','verizon','isp','ACCEPT',4),(20,156,0,'john','2021-10-12 00:00:00','verizon','isp','PENDING',NULL),(20,157,1,'john','2021-10-12 00:00:00','verizon','isp','ACCEPT',NULL),(20,170,1,'john','2021-10-12','verizon','isp','ACCEPT',5),(21,158,0,'john','2021-10-11 00:00:00','asianpaints','painting','PENDING',NULL),(21,159,1,'john','2021-10-11 00:00:00','asianpaints','painting','ACCEPT',NULL),(21,171,1,'john','2021-10-11','asianpaints','painting','ACCEPT',5),(22,164,0,'john','2021-10-11 00:00:00','nycleaner','cleaning','PENDING',NULL),(22,165,1,'john','2021-10-11 00:00:00','nycleaner','cleaning','DECLINE',NULL),(23,166,0,'john','2021-10-15','verizon','isp','PENDING',NULL),(23,173,1,'john','2021-10-15','verizon','isp','ACCEPT',NULL),(23,206,1,'john','2021-10-15','verizon','isp','ACCEPT',3),(24,174,0,'john','2021-10-12','nycleaner','cleaning','PENDING',NULL),(24,175,1,'john','2021-10-12','nycleaner','cleaning','ACCEPT',NULL),(24,176,1,'john','2021-10-12','nycleaner','cleaning','ACCEPT',3),(25,177,0,'john','2021-10-12','localroofer','roofing','PENDING',NULL),(25,178,1,'john','2021-10-12','localroofer','roofing','ACCEPT',NULL),(25,179,1,'john','2021-10-12','localroofer','roofing','ACCEPT',4),(26,180,0,'john','2021-10-13','unlock','locksmith','PENDING',NULL),(26,181,1,'john','2021-10-13','unlock','locksmith','ACCEPT',NULL),(26,185,1,'john','2021-10-13','unlock','locksmith','ACCEPT',1),(27,182,0,'john','2021-10-13','lowes','plumbing','PENDING',NULL),(27,183,1,'john','2021-10-13','lowes','plumbing','ACCEPT',NULL),(27,184,1,'john','2021-10-13','lowes','plumbing','ACCEPT',4),(28,186,0,'john','2021-10-18','localroofer','roofing','PENDING',NULL),(28,187,1,'john','2021-10-18','localroofer','roofing','ACCEPT',NULL),(28,232,1,'john','2021-10-18','localroofer','roofing','ACCEPT',3),(29,188,0,'john','2021-10-15','nerolac','painting','PENDING',NULL),(29,189,1,'john','2021-10-15','nerolac','painting','DECLINE',NULL),(30,190,0,'john','2021-10-14','brothers','plumbing','PENDING',NULL),(31,193,0,'johnsmith','2021-10-16','verizon','isp','PENDING',NULL),(31,194,1,'johnsmith','2021-10-16','verizon','isp','ACCEPT',NULL),(32,195,0,'johnsmith','2021-10-18','asianpaints','painting','PENDING',NULL),(32,196,1,'johnsmith','2021-10-18','asianpaints','painting','DECLINE',NULL),(33,199,0,'john','2021-10-14','nycleaner','cleaning','PENDING',NULL),(34,200,0,'john','2021-10-15','asianpaints','painting','PENDING',NULL),(34,201,1,'john','2021-10-15','asianpaints','painting','ACCEPT',NULL),(34,237,1,'john','2021-10-15','asianpaints','painting','ACCEPT',3),(35,239,0,'john','2021-11-02','xfinity','isp','PENDING',NULL),(35,240,1,'john','2021-11-02','xfinity','isp','ACCEPT',NULL),(35,241,1,'john','2021-11-02','xfinity','isp','ACCEPT',3),(36,243,0,'john','2021-11-02','masterkey','locksmith','PENDING',NULL),(36,244,1,'john','2021-11-02','masterkey','locksmith','ACCEPT',NULL),(36,245,1,'john','2021-11-02','masterkey','locksmith','ACCEPT',4);
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
INSERT INTO `user` VALUES ('aplhamovers','100 Clifton Pl Jersey City NJ 07304','2021-10-09 00:58:38.514312','alpha@movers.com','Alpha','Movers','2021-10-09 00:58:38.514312','1234','8888888888','movers','provider'),('asianpaints','200 Duncan Ave Bridgewater TX 08300','2021-10-09 00:53:54.806678','asian@paints.com','Asian','Paints','2021-10-09 00:53:54.806678','1234','3333333333','painting','provider'),('bestbuy','300 JFK Street Fairmount NJ 07304','2021-10-09 00:56:45.452108','best@buy.com','BestBuy','PhoneRepair','2021-10-09 00:56:45.452108','1234','6666666666','repair','provider'),('brothers','400 Sip Ave Jersey City IL 60060','2021-10-09 01:10:19.005258','bro@plum.com','Brothers','Plumbing','2021-10-09 01:10:19.005258','1234','0555555555','plumbing','provider'),('globalnet','500 Cornville Street Whiteman Township IL 60060','2021-10-09 00:55:41.724811','net@global.com','GlobalNet','Repair','2021-10-09 00:55:41.724811','1234','5555555555','repair','provider'),('john','600 Fairmount Ave Newark City TX 08300','2021-10-09 01:19:55.021990','john.w@outlook.com','Johnson','William','2021-11-04 19:35:08.812828','12345','5512295950','','customer'),('localroofer','700 Buffalo City Green Forest TX 08300','2021-10-09 01:04:36.634734','local@roofer.com','Roofer','Local','2021-10-09 01:04:36.634734','1234','0333333333','roofing','provider'),('lowes','800 Lakewater Township Land City IL 60060','2021-10-09 01:09:29.094552','lowes@plumbing.com','Lowes','Plumbing','2021-10-09 01:09:29.094552','1234','0444444444','plumbing','provider'),('masterkey','900 Beacon Street Wales Township CT 10010','2021-10-09 01:03:08.607891','master@key.com','Masterkey','Locksmith','2021-10-09 01:03:08.607891','1234','0222222222','locksmith','provider'),('nerolac','101 Somerset Ave Bronx NY 10010','2021-10-09 00:54:25.370641','nerolac@paints.com','Nerolac','Paints','2021-10-09 00:54:25.370641','1234','4444444444','painting','provider'),('nycleaner','201 Montogomery Township Queens NY 10010','2021-10-09 01:00:25.704077','ny@cleaner.com','Cleaner','NewYork','2021-10-09 01:00:25.704077','1234','0000000000','cleaning','provider'),('pinto','301 Heights Pl Miami FL 20020','2021-10-09 00:59:22.302985','pinto@laundary.com','Pinto','Laundary','2021-10-09 00:59:22.302985','1234','9999999999','cleaning','provider'),('roofrepair','401 Union Street Baldwin City AR 20020','2021-10-09 01:05:16.103029','roof@repair.com','RoofRepair','Company','2021-10-09 01:05:16.103029','1234','0444444444','roofing','provider'),('sephora','501 Bergen Ave Boston MA 20020','2021-10-09 01:11:38.102087','sep@salon.com','Sephora','Salons','2021-10-09 01:11:38.102087','1234','0666666666','salon','provider'),('unlock','601 Bayonne Pl Vermont TX 08300','2021-10-09 01:02:21.125024','unlock@locksmith.com','Unlock','Everything','2021-10-09 01:02:21.125024','1234','0111111111','locksmith','provider'),('verizon','701 Harrison Township Somerville NJ 07304','2021-10-09 00:52:39.946500','verizon.data@internet.com','Verizon','Data','2021-10-09 00:52:39.946500','1234','1111111111','isp','provider'),('victoria','801 Fanwood Ave Teaneck NJ 07700','2021-10-09 01:12:29.845351','vic@salon.com','Victoria','Salons','2021-10-09 01:12:29.845351','1234','0777777777','salon','provider'),('xfinity','901 Newyork Street Newport NJ 07304','2021-10-09 00:53:16.544708','xfinity@data.com','Xfinity','Data','2021-10-09 00:53:16.544708','1234','2222222222','isp','provider'),('xpressmovers','200 Martin Luther Ave Grove Street TX 08300','2021-10-09 00:58:06.940517','xpress@movers.com','Xpress','Movers','2021-10-09 00:58:06.940517','1234','7777777777','movers','provider');
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
INSERT INTO `user_aud` VALUES ('john',247,1,'100 Clifton Pl','2021-10-09 01:19:55.021990','john.w@gmail.com','John','William','2021-11-04 19:33:48.624676','1234','5512295950','','customer'),('john',248,1,'100 Clifton Pl','2021-10-09 01:19:55.021990','john.w@gmail.com','Johnson','William','2021-11-04 19:34:29.934108','1234','5512295950','','customer'),('john',249,1,'100 Clifton Pl','2021-10-09 01:19:55.021990','john.w@gmail.com','Johnson','William','2021-11-04 19:34:51.214580','12345','5512295950','','customer'),('john',250,1,'100 Clifton Pl','2021-10-09 01:19:55.021990','john.w@outlook.com','Johnson','William','2021-11-04 19:35:08.812828','12345','5512295950','','customer');
/*!40000 ALTER TABLE `user_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logout`
--

DROP TABLE IF EXISTS `user_logout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logout` (
  `id` bigint NOT NULL,
  `logout_date` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logout`
--

LOCK TABLES `user_logout` WRITE;
/*!40000 ALTER TABLE `user_logout` DISABLE KEYS */;
INSERT INTO `user_logout` VALUES (37,'2021-11-01T08:06:09.605552','john'),(38,'2021-11-01T10:55:07.605552','verizon'),(39,'2021-11-02T11:40:30.605552','xfinity'),(40,'2021-11-03T14:30:20.605552','brothers'),(41,'2021-11-04T20:00:37.605552','asianpaints'),(42,'2021-11-04T21:09:17.605552','john'),(43,'2021-11-07T20:36:27.198022','john'),(44,'2021-11-08T15:32:18.603434','verizon'),(51,'2021-11-09T12:31:59.732531','verizon'),(52,'2021-11-09T12:33:39.156928','verizon'),(53,'2021-11-09T12:38:23.806017','verizon'),(54,'2021-11-09T12:39:35.385231','john'),(55,'2021-11-09T12:45:45.394876','verizon'),(56,'2021-11-09T12:46:13.120780','john'),(58,'2021-11-09T14:31:57.122254','verizon'),(61,'2021-11-09T14:51:15.200333','verizon'),(66,'2021-11-09T16:32:52.789428','verizon'),(68,'2021-11-09T16:49:44.507012','brothers'),(69,'2021-11-09T16:50:30.335632','john'),(79,'2021-11-09T18:56:49.536889','verizon');
/*!40000 ALTER TABLE `user_logout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logout_aud`
--

DROP TABLE IF EXISTS `user_logout_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logout_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `logout_date` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKi3yg6ib4f6bt2ddj5eqoxyh4i` (`rev`),
  CONSTRAINT `FKi3yg6ib4f6bt2ddj5eqoxyh4i` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logout_aud`
--

LOCK TABLES `user_logout_aud` WRITE;
/*!40000 ALTER TABLE `user_logout_aud` DISABLE KEYS */;
INSERT INTO `user_logout_aud` VALUES (37,251,0,'2021-11-04T20:00:37.605552','john'),(38,252,0,'2021-11-04T20:01:32.207400','verizon'),(39,253,0,'2021-11-04T20:01:48.495003','xfinity'),(40,254,0,'2021-11-04T20:02:01.823394','brothers'),(41,255,0,'2021-11-04T20:02:15.633136','asianpaints'),(42,256,0,'2021-11-04T20:02:26.342626','john'),(43,257,0,'2021-11-07T20:36:27.198022','john'),(44,258,0,'2021-11-08T15:32:18.603434','verizon'),(51,259,0,'2021-11-09T12:31:59.732531','verizon'),(52,260,0,'2021-11-09T12:33:39.156928','verizon'),(53,261,0,'2021-11-09T12:38:23.806017','verizon'),(54,262,0,'2021-11-09T12:39:35.385231','john'),(55,263,0,'2021-11-09T12:45:45.394876','verizon'),(56,264,0,'2021-11-09T12:46:13.120780','john'),(58,265,0,'2021-11-09T14:31:57.122254','verizon'),(61,266,0,'2021-11-09T14:51:15.200333','verizon'),(66,267,0,'2021-11-09T16:32:52.789428','verizon'),(68,268,0,'2021-11-09T16:49:44.507012','brothers'),(69,269,0,'2021-11-09T16:50:30.335632','john'),(79,270,0,'2021-11-09T18:56:49.536889','verizon');
/*!40000 ALTER TABLE `user_logout_aud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 19:31:39
