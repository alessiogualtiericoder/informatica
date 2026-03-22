-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cinevobis
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attori`
--

DROP TABLE IF EXISTS `attori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attori` (
  `id_tmdb` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id_tmdb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attori`
--

LOCK TABLES `attori` WRITE;
/*!40000 ALTER TABLE `attori` DISABLE KEYS */;
/*!40000 ALTER TABLE `attori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_attori`
--

DROP TABLE IF EXISTS `film_attori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_attori` (
  `id_film` int NOT NULL,
  `id_attore` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_attore`),
  KEY `id_attore` (`id_attore`),
  CONSTRAINT `film_attori_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `film_attori_ibfk_2` FOREIGN KEY (`id_attore`) REFERENCES `attori` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_attori`
--

LOCK TABLES `film_attori` WRITE;
/*!40000 ALTER TABLE `film_attori` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_attori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_generi`
--

DROP TABLE IF EXISTS `film_generi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_generi` (
  `id_film` int NOT NULL,
  `id_genere` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_genere`),
  KEY `id_genere` (`id_genere`),
  CONSTRAINT `film_generi_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `film_generi_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `generi` (`id_genere`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_generi`
--

LOCK TABLES `film_generi` WRITE;
/*!40000 ALTER TABLE `film_generi` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_generi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_registi`
--

DROP TABLE IF EXISTS `film_registi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_registi` (
  `id_film` int NOT NULL,
  `id_regista` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_regista`),
  KEY `id_regista` (`id_regista`),
  CONSTRAINT `film_registi_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `film_registi_ibfk_2` FOREIGN KEY (`id_regista`) REFERENCES `registi` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_registi`
--

LOCK TABLES `film_registi` WRITE;
/*!40000 ALTER TABLE `film_registi` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_registi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id_tmdb` int NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `trama` text,
  `data_uscita` date DEFAULT NULL,
  `voto_medio_tmdb` decimal(3,1) DEFAULT NULL,
  `copertina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tmdb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generi`
--

DROP TABLE IF EXISTS `generi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generi` (
  `id_genere` int NOT NULL,
  `nome_genere` varchar(100) NOT NULL,
  PRIMARY KEY (`id_genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generi`
--

LOCK TABLES `generi` WRITE;
/*!40000 ALTER TABLE `generi` DISABLE KEYS */;
/*!40000 ALTER TABLE `generi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nazioni` (
  `id_nazione` int NOT NULL AUTO_INCREMENT,
  `nome_nazione` varchar(100) NOT NULL,
  PRIMARY KEY (`id_nazione`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'Andorra'),(5,'Angola'),(6,'Arabia Saudita'),(7,'Argentina'),(8,'Armenia'),(9,'Australia'),(10,'Austria'),(11,'Azerbaigian'),(12,'Bahamas'),(13,'Bahrain'),(14,'Bangladesh'),(15,'Belgio'),(16,'Belize'),(17,'Benin'),(18,'Bielorussia'),(19,'Bolivia'),(20,'Bosnia ed Erzegovina'),(21,'Botswana'),(22,'Brasile'),(23,'Brunei'),(24,'Bulgaria'),(25,'Burkina Faso'),(26,'Burundi'),(27,'Cambogia'),(28,'Camerun'),(29,'Canada'),(30,'Capo Verde'),(31,'Ciad'),(32,'Cile'),(33,'Cina'),(34,'Cipro'),(35,'Colombia'),(36,'Comore'),(37,'Congo'),(38,'Corea del Nord'),(39,'Corea del Sud'),(40,'Costa Rica'),(41,'Costa d\'Avorio'),(42,'Croazia'),(43,'Cuba'),(44,'Danimarca'),(45,'Ecuador'),(46,'Egitto'),(47,'El Salvador'),(48,'Emirati Arabi Uniti'),(49,'Eritrea'),(50,'Estonia'),(51,'Eswatini'),(52,'Etiopia'),(53,'Figi'),(54,'Filippine'),(55,'Finlandia'),(56,'Francia'),(57,'Gabon'),(58,'Gambia'),(59,'Georgia'),(60,'Germania'),(61,'Ghana'),(62,'Giamaica'),(63,'Giappone'),(64,'Gibuti'),(65,'Giordania'),(66,'Grecia'),(67,'Guatemala'),(68,'Guinea'),(69,'Guinea Equatoriale'),(70,'Guinea-Bissau'),(71,'Guyana'),(72,'Haiti'),(73,'Honduras'),(74,'India'),(75,'Indonesia'),(76,'Iran'),(77,'Iraq'),(78,'Irlanda'),(79,'Islanda'),(80,'Israele'),(81,'Italia'),(82,'Kazakhstan'),(83,'Kenya'),(84,'Kirghizistan'),(85,'Kiribati'),(86,'Kuwait'),(87,'Laos'),(88,'Lesotho'),(89,'Lettonia'),(90,'Libano'),(91,'Liberia'),(92,'Libia'),(93,'Liechtenstein'),(94,'Lituania'),(95,'Lussemburgo'),(96,'Macedonia del Nord'),(97,'Madagascar'),(98,'Malawi'),(99,'Malaysia'),(100,'Maldive'),(101,'Mali'),(102,'Malta'),(103,'Marocco'),(104,'Mauritania'),(105,'Mauritius'),(106,'Messico'),(107,'Moldavia'),(108,'Monaco'),(109,'Mongolia'),(110,'Montenegro'),(111,'Mozambico'),(112,'Myanmar'),(113,'Namibia'),(114,'Nepal'),(115,'Nicaragua'),(116,'Niger'),(117,'Nigeria'),(118,'Norvegia'),(119,'Nuova Zelanda'),(120,'Oman'),(121,'Paesi Bassi'),(122,'Pakistan'),(123,'Palau'),(124,'Panama'),(125,'Papua Nuova Guinea'),(126,'Paraguay'),(127,'Perù'),(128,'Polonia'),(129,'Portogallo'),(130,'Qatar'),(131,'Repubblica Ceca'),(132,'Repubblica Centrafricana'),(133,'Repubblica Democratica del Congo'),(134,'Repubblica Dominicana'),(135,'Romania'),(136,'Ruanda'),(137,'Russia'),(138,'Saint Kitts e Nevis'),(139,'Saint Lucia'),(140,'Saint Vincent e Grenadine'),(141,'Samoa'),(142,'San Marino'),(143,'São Tomé e Príncipe'),(144,'Senegal'),(145,'Serbia'),(146,'Seychelles'),(147,'Sierra Leone'),(148,'Singapore'),(149,'Siria'),(150,'Slovakia'),(151,'Slovenia'),(152,'Somalia'),(153,'Spagna'),(154,'Sri Lanka'),(155,'Stati Uniti'),(156,'Sudafrica'),(157,'Sudan'),(158,'Sudan del Sud'),(159,'Suriname'),(160,'Svezia'),(161,'Svizzera'),(162,'Tagikistan'),(163,'Tanzania'),(164,'Thailandia'),(165,'Timor Est'),(166,'Togo'),(167,'Tonga'),(168,'Trinidad e Tobago'),(169,'Tunisia'),(170,'Turchia'),(171,'Turkmenistan'),(172,'Tuvalu'),(173,'Ucraina'),(174,'Uganda'),(175,'Ungheria'),(176,'Uruguay'),(177,'Uzbekistan'),(178,'Vanuatu'),(179,'Venezuela'),(180,'Vietnam'),(181,'Yemen'),(182,'Zambia'),(183,'Zimbabwe');
/*!40000 ALTER TABLE `nazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profili`
--

DROP TABLE IF EXISTS `profili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profili` (
  `id_profilo` int NOT NULL AUTO_INCREMENT,
  `nome_profilo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_profilo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profili`
--

LOCK TABLES `profili` WRITE;
/*!40000 ALTER TABLE `profili` DISABLE KEYS */;
INSERT INTO `profili` VALUES (1,'amministratore'),(2,'utente');
/*!40000 ALTER TABLE `profili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensioni`
--

DROP TABLE IF EXISTS `recensioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensioni` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `voto` decimal(3,1) DEFAULT NULL,
  `testo` text,
  `preferito` tinyint(1) DEFAULT '0',
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `recensioni_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recensioni_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensioni`
--

LOCK TABLES `recensioni` WRITE;
/*!40000 ALTER TABLE `recensioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `recensioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registi`
--

DROP TABLE IF EXISTS `registi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registi` (
  `id_tmdb` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id_tmdb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registi`
--

LOCK TABLES `registi` WRITE;
/*!40000 ALTER TABLE `registi` DISABLE KEYS */;
/*!40000 ALTER TABLE `registi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessioni`
--

DROP TABLE IF EXISTS `sessioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessioni` (
  `id_sessione` varchar(255) NOT NULL,
  `id_utente` int NOT NULL,
  `data_login` datetime DEFAULT NULL,
  `data_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sessione`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `sessioni_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessioni`
--

LOCK TABLES `sessioni` WRITE;
/*!40000 ALTER TABLE `sessioni` DISABLE KEYS */;
INSERT INTO `sessioni` VALUES ('078e54c58ba5261369c8c4ea7160a818',1,'2026-03-22 16:39:12','2026-03-22 16:39:14'),('0af00ea4f0cd2969f48a6a7f50d6f7a4',2,'2026-03-22 20:31:34','2026-03-22 20:33:35'),('20f39857d43d3371a80271f15edf3991',2,'2026-03-22 16:46:23','2026-03-22 16:49:38'),('23f87d8518ed824e78739f7aa5823aae',1,'2026-03-22 17:44:41','2026-03-22 17:45:31'),('3519758b5d446750517014c42d97edf4',1,'2026-03-22 20:35:05','2026-03-22 20:37:13'),('37aaef656a7edbcd2ce0e39c89ed7354',1,'2026-03-22 17:30:32','2026-03-22 17:33:09'),('386ea22578f5a0d996c2fb046668cd62',1,'2026-03-22 16:41:29','2026-03-22 16:41:52'),('39e9344a8b304dda109cd408cb10783f',3,'2026-03-22 16:40:52','2026-03-22 16:41:23'),('3a65878b8c5f8a1df488cd4bb58a345b',1,'2026-03-22 17:28:43','2026-03-22 17:30:27'),('494bafb2b9b26c1c626bd56cfb6c5119',1,'2026-03-22 20:29:40','2026-03-22 20:30:55'),('4a674e7054f99cf869f17c21bf05f9e8',1,'2026-03-22 18:04:25',NULL),('52bc7f512f2811ea69a2c6ba6a38a960',1,'2026-03-22 16:38:34','2026-03-22 16:39:00'),('573faf523b0df985d49384ea7ed79da6',2,'2026-03-22 17:33:37','2026-03-22 17:34:04'),('5bf9030e88fe95dfcec24ff9aa619752',1,'2026-03-22 19:59:05','2026-03-22 20:08:07'),('6674140c565098e5a0cdc1e9be4ec6e9',1,'2026-03-22 16:23:59','2026-03-22 16:26:17'),('67e218195401607ddd2714661b6c604a',2,'2026-03-22 17:42:36','2026-03-22 17:44:25'),('6a9d38c8cdca11e6c4d9e6a5f00207cc',2,'2026-03-22 18:23:53','2026-03-22 19:49:35'),('7a1dd768238d1d537fcd613dca604520',1,'2026-03-22 18:07:06',NULL),('8372c26a292c7d36d59dbc04baee64ca',2,'2026-03-22 16:49:43',NULL),('8dbda25376e53b630d6b7c622244cbb7',2,'2026-03-22 16:34:09','2026-03-22 16:37:08'),('8fec794f245e533bc365f51d51a8542d',1,'2026-03-22 16:39:23','2026-03-22 16:39:37'),('b3ed8bcee1c79a2ca76de50c84df8f56',1,'2026-03-22 18:23:12','2026-03-22 18:23:18'),('c1a76ea1581d7f966c01f7549555b853',2,'2026-03-22 17:25:48','2026-03-22 17:28:36'),('c76bd0f79b2f3b39c7d06b4bd95c28e0',2,'2026-03-22 18:09:30',NULL),('d2eead7c17e1d8e15fac4211d08cf9aa',2,'2026-03-22 18:12:49',NULL),('e32e0fd4531e82abf48f4abfb3ee40ed',1,'2026-03-22 17:51:57','2026-03-22 17:52:57'),('e62bbdf3b613f7efe3b22f127c670bc8',2,'2026-03-22 18:13:51',NULL),('ecdcd6cc0cfa67d9a032a7ea895359ce',1,'2026-03-22 16:20:54','2026-03-22 16:23:48'),('ee6cc7bd81c90be5aad6a5aab1dbae82',4,'2026-03-22 16:43:45','2026-03-22 16:46:14');
/*!40000 ALTER TABLE `sessioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id_utente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cognome` varchar(100) DEFAULT NULL,
  `citta` varchar(100) DEFAULT NULL,
  `id_profilo` int DEFAULT NULL,
  `id_nazione` int DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT '1',
  `foto_profilo` varchar(255) DEFAULT NULL,
  `data_registrazione` datetime DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `id_profilo` (`id_profilo`),
  KEY `id_nazione` (`id_nazione`),
  CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_profilo`) REFERENCES `profili` (`id_profilo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`id_nazione`) REFERENCES `nazioni` (`id_nazione`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'alessio','$2y$12$iflfrWnHxOz6sPNrPzUxze1qky.qEe7Vwxts8wkQ5UlDSafc.msFy','alessio.gualtieri24@istitutotecnicomarconipilla.edu.it','Alessio','Gualtieri','Baranello',1,81,1,NULL,'2026-03-22 15:20:49'),(2,'emma','$2y$12$ZQxFoZK/Yxsc8Ko7PkhxZe6bAU2NLgmBiutM1LG78M9inxKCXQv86','emma@gmail.com','Emma','Cooper','New York',2,155,1,NULL,'2026-03-22 15:34:00'),(3,'luca','$2y$12$wSbHke2DhODnUvDTW7J1BePJY1THrYBAdIxrnVJ5y6G459U8YYI9a','luca@gmail.com','Luca','Leone','Wellington',2,119,0,NULL,'2026-03-22 15:40:45'),(4,'yuru','$2y$12$pq8k3i15ORPfHFwKMaC3Lu.CO4U4CNGW7AHaVOVKodYnpjBRnf6z2','yurutanaka@gmail.com','Yuru','Tanaka','Tokyo',2,63,1,NULL,'2026-03-22 15:43:38');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched`
--

DROP TABLE IF EXISTS `watched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watched` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `watched_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `watched_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watched`
--

LOCK TABLES `watched` WRITE;
/*!40000 ALTER TABLE `watched` DISABLE KEYS */;
/*!40000 ALTER TABLE `watched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_tmdb`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cinevobis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-22 20:45:29
