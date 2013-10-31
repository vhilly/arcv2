-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: archv2
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.10.1

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
  CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  CONSTRAINT `Rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Table structure for table `authitemchild`
--

DROP TABLE IF EXISTS `authitemchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authitemchild`
--

LOCK TABLES `authitemchild` WRITE;
/*!40000 ALTER TABLE `authitemchild` DISABLE KEYS */;
/*!40000 ALTER TABLE `authitemchild` ENABLE KEYS */;
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
INSERT INTO `counter` VALUES (1,'booking',NULL,397),(2,'ticket',NULL,1051),(3,'lading',NULL,0),(4,'series',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(3,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(4,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(5,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(6,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(7,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(8,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(9,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(10,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(11,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(12,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(13,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(14,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(15,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(16,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(17,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(18,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(19,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(20,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(21,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(22,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(24,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(26,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(27,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(28,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(29,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(30,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(31,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(32,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(33,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(34,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(35,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(36,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(37,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(38,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(39,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(40,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(42,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(43,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(44,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(46,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(47,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(48,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(49,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(50,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(51,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(52,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(53,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(54,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(55,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(56,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(57,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(58,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(59,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(60,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(61,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Santiago','Vhilly'),(2,'Cabug-os','Neil');
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
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seating_class` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `seating_class` (`seating_class`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`seating_class`) REFERENCES `seating_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1A',1,1,1),(2,1,'2A',1,2,1),(3,1,'1C',3,1,1),(4,1,'1B',2,1,1),(5,1,'2B',2,2,1),(6,1,'2C',3,2,1),(7,1,'3A',1,3,1),(8,1,'3C',3,3,1),(10,1,'3B',2,3,1),(11,1,'5C',2,5,1),(12,1,'5C',3,5,1),(13,1,'5A',1,5,1),(14,2,'A1',1,1,1),(15,2,'A2',2,1,1);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
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
  `rows` int(11) NOT NULL,
  `cols` int(11) NOT NULL,
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
INSERT INTO `seating_class` VALUES (1,'Business Class','BC','Aircon',5,3,1),(2,'Premium Economy','PE','Non Aircon',10,20,1),(3,'TEST Class','TC','',0,0,0),(4,'TEST Class2','tesat','',0,0,0);
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
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_no` (`ticket_no`),
  KEY `passenger_id` (`passenger_id`),
  KEY `voyage_id` (`voyage_id`),
  KEY `seat_id` (`seat_id`),
  KEY `seating_class_id` (`seating_class_id`),
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `passenger_type_id` (`passenger_type_id`),
  KEY `created_by` (`created_by`),
  KEY `seat_id_2` (`seat_id`),
  CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`passenger_type_id`) REFERENCES `passenger_type` (`id`),
  CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,50,1,14,2,'','001040','','000393',2,1,180.00,1,1),(2,51,1,15,2,'','001041','','000393',2,1,180.00,1,1),(3,52,1,1,1,'','001042','','000394',2,1,300.00,1,1),(4,53,1,4,1,'','001043','','000394',2,1,300.00,1,1),(5,54,1,3,1,'','001044','','000394',2,1,300.00,1,1),(6,55,1,2,1,'','001045','','000394',2,1,300.00,1,1),(7,56,1,5,1,'','001046','','000394',2,1,300.00,1,1),(8,57,1,6,1,'','001047','','000394',2,1,300.00,1,1),(9,58,1,7,1,'','001048','','000394',2,1,300.00,1,1),(10,59,1,10,1,'','001049','','000395',2,1,300.00,1,1),(11,60,1,8,1,'','001050','','000396',2,1,300.00,1,1),(12,61,1,13,1,'','001051','','000397',2,1,300.00,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2013-05-22 05:15:20','2013-10-31 00:17:04',1,1),(2,'neil','db684cf96914fce8df7d94353f73edfa','neil@Imperium.ph','fe3443d4ff5c4433cbaf96cf9fe46aab','2013-10-29 18:12:13','2013-10-29 18:12:27',0,1);
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
INSERT INTO `vessel` VALUES (1,'FASTCAT-M1','FM1',14,''),(6,'FASTCAT-M2','FM2',14,''),(8,'3232','232',14,''),(10,'test','FM12',14,''),(12,'FASTCAT-M3','FM3',14,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (1,'FASCAT-M1-1',1,1,'2013-10-31','08:00:00','08:00:00',14,-47,1);
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

-- Dump completed on 2013-10-31  9:25:43
