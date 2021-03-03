-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `brief` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `Writer_id` int NOT NULL,
  `Category_id` int NOT NULL,
  PRIMARY KEY (`id`,`Writer_id`,`Category_id`),
  KEY `fk_Article_Writer_idx` (`Writer_id`),
  KEY `fk_Article_Category1_idx` (`Category_id`),
  CONSTRAINT `fk_Article_Category1` FOREIGN KEY (`Category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_Article_Writer` FOREIGN KEY (`Writer_id`) REFERENCES `writers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'How the Pandemic Will End','great article','it has a lot of contents','2017-06-15',5,1),(2,'The Goths Take Rome','fantastic','this is content','2019-01-10',3,3),(3,'The Foundations of Liberia','brief','this is article','2020-10-15',1,4),(4,'Leading Ladies','awesome brief','more awesome content','2010-01-05',4,2),(5,'The Rise of the Valkyries','lot of brief','best content ever','2009-09-23',2,5),(6,'Broken Windows','dont know what to say','!!!!!!!!','2001-02-07',2,1);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_has_tags`
--

DROP TABLE IF EXISTS `articles_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_has_tags` (
  `Article_id` int NOT NULL,
  `Tag_id` int NOT NULL,
  PRIMARY KEY (`Article_id`,`Tag_id`),
  KEY `fk_Article_has_Tag_Tag1_idx` (`Tag_id`),
  KEY `fk_Article_has_Tag_Article1_idx` (`Article_id`),
  CONSTRAINT `fk_Article_has_Tag_Article1` FOREIGN KEY (`Article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `fk_Article_has_Tag_Tag1` FOREIGN KEY (`Tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_has_tags`
--

LOCK TABLES `articles_has_tags` WRITE;
/*!40000 ALTER TABLE `articles_has_tags` DISABLE KEYS */;
INSERT INTO `articles_has_tags` VALUES (4,1),(1,2),(2,3),(3,4),(6,4),(5,5);
/*!40000 ALTER TABLE `articles_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'perspectives'),(2,'sport'),(3,'science'),(4,'observation'),(5,'commentarie'),(6,'opinions');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'tag A'),(2,'tag B'),(3,'tag C'),(4,'tag D'),(5,'tag E');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writers`
--

DROP TABLE IF EXISTS `writers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writers` (
  `id` int NOT NULL,
  `first_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writers`
--

LOCK TABLES `writers` WRITE;
/*!40000 ALTER TABLE `writers` DISABLE KEYS */;
INSERT INTO `writers` VALUES (1,'ali','rezaee',20),(2,'mahmoud','ahmadi',60),(3,'zahra','alizade',35),(4,'hossein','mohseni',19),(5,'mohammad','safaee',23);
/*!40000 ALTER TABLE `writers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-03 23:17:19
