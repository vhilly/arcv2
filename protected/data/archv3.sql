-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: archv2
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AuthAssignment`
--

DROP TABLE IF EXISTS `AuthAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthAssignment`
--

LOCK TABLES `AuthAssignment` WRITE;
/*!40000 ALTER TABLE `AuthAssignment` DISABLE KEYS */;
INSERT INTO `AuthAssignment` VALUES ('Admin','1',NULL,'N;');
/*!40000 ALTER TABLE `AuthAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItem`
--

DROP TABLE IF EXISTS `AuthItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItem`
--

LOCK TABLES `AuthItem` WRITE;
/*!40000 ALTER TABLE `AuthItem` DISABLE KEYS */;
INSERT INTO `AuthItem` VALUES ('Admin',2,NULL,NULL,'N;'),('Authenticated',2,NULL,NULL,'N;'),('Guest',2,NULL,NULL,'N;');
/*!40000 ALTER TABLE `AuthItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItemChild`
--

DROP TABLE IF EXISTS `AuthItemChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItemChild`
--

LOCK TABLES `AuthItemChild` WRITE;
/*!40000 ALTER TABLE `AuthItemChild` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthItemChild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rights`
--

DROP TABLE IF EXISTS `Rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `Rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rights`
--

LOCK TABLES `Rights` WRITE;
/*!40000 ALTER TABLE `Rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `code` char(10) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,'booking',NULL,327),(2,'ticket',NULL,882),(3,'lading',NULL,0),(4,'series',NULL,0);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `age` tinyint(3) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `prefix` char(5) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `civil_status` char(1) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(3,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(4,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(5,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(6,'vhilly','santiago',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(7,'anne ','laruces',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(8,'vhilly','santiago',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(9,'adsa','sa',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(10,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(11,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(12,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(13,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(14,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(15,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(16,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(17,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(18,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(19,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(20,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(21,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(22,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(24,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(26,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(27,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(28,'vhilly','santigao',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(29,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(30,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(31,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(32,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(33,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(34,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(35,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(36,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(37,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(38,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(39,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(40,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(42,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(43,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(44,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(46,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(47,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(48,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(49,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(50,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(51,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(52,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(53,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(54,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(55,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(56,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(57,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(58,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(59,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(60,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(61,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(62,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(63,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(64,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(65,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(66,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(67,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(68,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(69,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(70,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(71,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(72,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(73,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(74,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(75,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(76,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(77,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(78,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(79,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(80,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(81,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(82,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(83,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(84,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(85,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(86,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(87,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(88,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(89,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(90,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(91,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(92,'vhilly','vhilly',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(93,'vhill','sase',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(94,'vhillt','sdfsf',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(95,'clarizza','ocamo',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(96,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(97,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(98,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(99,'dfd','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(100,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(101,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(102,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(103,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(104,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(105,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(106,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(107,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(108,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(109,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(110,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(111,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(112,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(113,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(114,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(115,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(116,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(117,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(118,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(119,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(120,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(121,'Vhilly','Santiago',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(122,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(123,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(124,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(125,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(126,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(127,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(128,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(129,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(130,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(131,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(132,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(133,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(134,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(135,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(136,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(137,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(138,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(139,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(140,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(141,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(142,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(143,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(144,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(145,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(146,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(147,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(148,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(149,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(150,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(151,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(152,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(153,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(154,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(155,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(156,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(157,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(158,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(159,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(160,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(161,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(162,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(163,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(164,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(165,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(166,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(167,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(168,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(169,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(170,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(171,'vhilly','santiago',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(172,'Joanne','Santiago',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(173,'vhill','santiago',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(174,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(175,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(176,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(177,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(178,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(179,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(180,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(181,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(182,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(183,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(184,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(185,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(186,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(187,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(188,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(189,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(190,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(191,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(192,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(193,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_fare`
--

DROP TABLE IF EXISTS `passenger_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger_fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `route` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `class` (`class`),
  KEY `route` (`route`),
  KEY `route_2` (`route`),
  KEY `type` (`type`),
  KEY `type_2` (`type`),
  CONSTRAINT `passenger_fare_ibfk_1` FOREIGN KEY (`class`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `passenger_fare_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  CONSTRAINT `passenger_fare_ibfk_3` FOREIGN KEY (`type`) REFERENCES `passenger_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_fare`
--

LOCK TABLES `passenger_fare` WRITE;
/*!40000 ALTER TABLE `passenger_fare` DISABLE KEYS */;
INSERT INTO `passenger_fare` VALUES (1,1,1,1,300.00),(2,1,1,2,180.00),(3,1,1,3,300.00),(4,1,1,4,500.00),(5,2,1,1,240.00),(6,2,1,2,144.00),(7,2,1,3,200.00),(8,2,1,4,2323.00),(9,3,1,1,240.00),(10,3,1,2,144.00),(11,3,1,3,200.00),(12,3,1,4,2222.00);
/*!40000 ALTER TABLE `passenger_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_type`
--

DROP TABLE IF EXISTS `passenger_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(10) NOT NULL,
  `description` tinytext NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_type`
--

LOCK TABLES `passenger_type` WRITE;
/*!40000 ALTER TABLE `passenger_type` DISABLE KEYS */;
INSERT INTO `passenger_type` VALUES (1,'Full Fare','FF','_',1),(2,'Student','SF','Student , Must Have ID',1),(3,'Senior','SC','100 yrs old',1);
/*!40000 ALTER TABLE `passenger_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES (1,'BAT','BATANGAS',0),(3,'CAL','CALAPAN',0);
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Santiago','Vhilly');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_fields`
--

DROP TABLE IF EXISTS `profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_fields`
--

LOCK TABLES `profiles_fields` WRITE;
/*!40000 ALTER TABLE `profiles_fields` DISABLE KEYS */;
INSERT INTO `profiles_fields` VALUES (1,'lastname','Last Name','VARCHAR','50','3',1,'','','Incorrect Last Name (length between 3 and 50 characters).','','','','',1,3),(2,'firstname','First Name','VARCHAR','50','3',1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3);
/*!40000 ALTER TABLE `profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_port` int(11) NOT NULL,
  `dest_port` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `source_port` (`source_port`),
  KEY `dest_port` (`dest_port`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`source_port`) REFERENCES `port` (`id`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`dest_port`) REFERENCES `port` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,3,'BATANGAS-CALAPAN');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seating_class`
--

DROP TABLE IF EXISTS `seating_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seating_class` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(10) NOT NULL,
  `description` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating_class`
--

LOCK TABLES `seating_class` WRITE;
/*!40000 ALTER TABLE `seating_class` DISABLE KEYS */;
INSERT INTO `seating_class` VALUES (1,'Business Class','BC','Aircon',1),(2,'Premium Economy','PE','Non Aircon',1),(3,'TEST Class','TC','',0),(4,'TEST Class2','tesat','',0);
/*!40000 ALTER TABLE `seating_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) NOT NULL,
  `voyage_id` int(11) NOT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `seating_class_id` tinyint(4) NOT NULL,
  `transaction_no` char(32) NOT NULL,
  `ticket_no` char(32) NOT NULL,
  `series_no` char(32) NOT NULL,
  `booking_no` char(32) NOT NULL,
  `ticket_type_id` tinyint(4) NOT NULL,
  `passenger_type_id` tinyint(4) NOT NULL,
  `price_paid` decimal(20,2) NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_no` (`ticket_no`),
  KEY `passenger_id` (`passenger_id`),
  KEY `voyage_id` (`voyage_id`),
  KEY `seat_id` (`seat_id`),
  KEY `seating_class_id` (`seating_class_id`),
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `passenger_type_id` (`passenger_type_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`passenger_type_id`) REFERENCES `passenger_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (2,121,8,NULL,4,'','000809','1223','000299',2,1,0.00,6),(3,122,8,NULL,4,'','000810','','000300',2,1,0.00,5),(4,123,8,NULL,4,'','000811','','000301',2,1,0.00,4),(5,124,8,NULL,4,'','000812','','000302',2,1,0.00,5),(6,125,8,NULL,4,'','000813','','000302',2,1,0.00,5),(7,126,8,NULL,4,'','000814','','000302',2,1,0.00,5),(8,127,8,NULL,4,'','000815','','000302',2,1,0.00,4),(9,128,8,NULL,4,'','000816','','000302',2,1,0.00,5),(10,129,8,NULL,4,'','000817','','000303',2,1,0.00,5),(11,130,8,NULL,4,'','000818','','000309',2,1,500.00,6),(12,131,8,NULL,4,'','000819','','000309',2,1,500.00,1),(13,132,8,NULL,4,'','000820','','000309',2,1,500.00,1),(14,133,8,NULL,4,'','000821','','000309',2,1,500.00,1),(15,134,8,NULL,2,'','000822','','000310',2,1,200.00,1),(16,135,8,NULL,2,'','000823','','000310',2,1,200.00,1),(17,136,8,NULL,2,'','000824','','000310',2,3,32332.00,1),(18,137,8,NULL,2,'','000825','','000310',2,2,800.00,1),(19,138,8,NULL,2,'','000826','','000311',2,1,200.00,1),(20,139,8,NULL,2,'','000827','','000311',2,1,200.00,1),(21,140,8,NULL,2,'','000828','','000311',2,2,800.00,5),(22,141,8,NULL,2,'','000829','','000311',2,1,200.00,5),(23,142,8,NULL,2,'','000830','','000311',2,3,32332.00,1),(24,143,8,NULL,2,'','000831','','000312',2,1,180.00,1),(25,144,8,NULL,2,'','000832','','000312',2,3,144.00,1),(26,145,8,NULL,2,'','000833','','000312',2,2,144.00,1),(27,146,8,NULL,1,'','000834','','000313',2,1,300.00,1),(28,147,8,NULL,1,'','000835','','000313',2,2,240.00,1),(29,148,8,NULL,1,'','000836','','000313',2,3,240.00,1),(30,149,8,NULL,1,'','000837','','000313',2,1,300.00,1),(31,150,8,NULL,2,'','000838','','000314',2,1,180.00,5),(32,151,8,NULL,2,'','000839','','000314',2,1,180.00,1),(33,152,8,NULL,2,'','000840','','000314',2,1,180.00,1),(34,153,8,NULL,2,'','000841','','000314',2,1,180.00,1),(35,154,8,NULL,2,'','000842','','000314',2,1,180.00,1),(36,155,8,NULL,2,'','000843','','000314',2,1,180.00,1),(37,156,8,NULL,2,'','000844','','000314',2,1,180.00,1),(38,157,8,NULL,2,'','000845','','000314',2,1,180.00,1),(39,158,8,NULL,2,'','000846','','000314',2,1,180.00,1),(40,159,8,NULL,2,'','000847','','000314',2,1,180.00,5),(41,160,8,NULL,2,'','000848','','000314',2,1,180.00,5),(42,161,8,NULL,2,'','000849','','000314',2,1,180.00,1),(43,162,8,NULL,2,'','000850','','000314',2,1,180.00,1),(44,163,8,NULL,2,'','000851','','000314',2,1,180.00,1),(45,164,8,NULL,2,'','000852','','000315',2,1,180.00,1),(46,165,8,NULL,2,'','000853','','000315',2,1,180.00,1),(47,166,8,NULL,2,'','000854','','000315',2,1,180.00,1),(48,167,8,NULL,2,'','000855','','000315',2,1,180.00,1),(49,168,8,NULL,2,'','000856','','000315',2,1,180.00,5),(50,169,8,NULL,2,'','000857','','000315',2,1,180.00,5),(52,170,8,NULL,2,'','000859','','000317',2,1,180.00,1),(53,171,8,NULL,2,'','000860','','000318',2,1,180.00,1),(54,172,8,NULL,2,'','000861','','000319',2,1,180.00,1),(55,173,8,NULL,2,'','000862','','000320',2,1,180.00,1),(56,174,8,NULL,2,'','000863','','000321',2,1,180.00,1),(57,175,8,NULL,2,'','000864','','000321',2,1,180.00,1),(58,176,8,NULL,2,'','000865','','000321',2,1,180.00,1),(59,177,8,NULL,2,'','000866','','000321',2,1,180.00,1),(60,178,8,NULL,2,'','000867','','000322',2,1,180.00,1),(61,179,8,NULL,2,'','000868','','000322',2,1,180.00,1),(62,180,8,NULL,2,'','000869','','000322',2,1,180.00,1),(63,181,8,NULL,2,'','000870','','000322',2,1,180.00,1),(64,182,8,NULL,2,'','000871','','000323',2,1,180.00,1),(65,183,8,NULL,2,'','000872','','000323',2,1,180.00,1),(66,184,8,NULL,2,'','000873','','000323',2,1,180.00,1),(67,185,8,NULL,1,'','000874','','000324',2,2,240.00,1),(68,186,8,NULL,1,'','000875','','000324',2,2,240.00,1),(69,187,8,NULL,1,'','000876','','000325',2,1,300.00,1),(70,188,8,NULL,1,'','000877','','000325',2,1,300.00,1),(71,189,8,NULL,2,'','000878','','000326',2,1,180.00,1),(72,190,8,NULL,2,'','000879','','000326',2,1,180.00,1),(73,191,8,NULL,2,'','000880','','000326',2,1,180.00,1),(74,192,8,NULL,2,'','000881','','000327',2,1,180.00,1),(75,193,8,NULL,2,'','000882','','000327',2,1,180.00,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2013-05-22 05:15:20','2013-10-29 09:09:15',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vessel`
--

DROP TABLE IF EXISTS `vessel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vessel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `blocked_seats` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vessel`
--

LOCK TABLES `vessel` WRITE;
/*!40000 ALTER TABLE `vessel` DISABLE KEYS */;
INSERT INTO `vessel` VALUES (1,'FASTCAT-M1','FM1',127,''),(6,'FASTCAT-M2','FM2',300,''),(8,'3232','232',2323,''),(10,'test','FM12',2323,''),(12,'FASTCAT-M3','FM3',264,'');
/*!40000 ALTER TABLE `vessel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyage`
--

DROP TABLE IF EXISTS `voyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voyage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage_number` varchar(100) NOT NULL,
  `vessel_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `capacity` int(11) NOT NULL,
  `available_seats` int(11) NOT NULL,
  `voyage_status_id` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `voyage_number` (`voyage_number`),
  KEY `vessel_id` (`vessel_id`),
  KEY `route_id` (`route_id`),
  KEY `voyage_status_id` (`voyage_status_id`),
  CONSTRAINT `voyage_ibfk_1` FOREIGN KEY (`vessel_id`) REFERENCES `vessel` (`id`),
  CONSTRAINT `voyage_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (1,'FASCAT-M1-1',1,1,'2013-10-24','00:00:00','00:00:00',0,0,1),(3,'FASCAT-M1-2',1,1,'2013-10-25','00:00:00','00:00:00',0,-4,1),(4,'TEST@#$23',1,1,'2013-10-24','00:00:00','00:00:00',127,127,1),(5,'FASCAT-M1-3',6,1,'2013-10-24','00:00:00','00:00:00',300,300,1),(6,'FASCAT-M1-4',1,1,'2013-10-25','00:00:00','00:00:00',127,-174,1),(7,'TEST@#$234',1,1,'2013-10-25','08:00:00','09:00:00',127,-217,1),(8,'FASCAT-M1-5',8,1,'2013-10-29','23:00:00','01:00:00',2323,2160,1);
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyage_status`
--

DROP TABLE IF EXISTS `voyage_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voyage_status` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage_status`
--

LOCK TABLES `voyage_status` WRITE;
/*!40000 ALTER TABLE `voyage_status` DISABLE KEYS */;
INSERT INTO `voyage_status` VALUES (1,'Open',''),(2,'Advance Booking Closed',''),(3,'Voyage Closed','');
/*!40000 ALTER TABLE `voyage_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-29 17:16:18
