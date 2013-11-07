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
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_status` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` tinytext,
  `color` char(32) NOT NULL DEFAULT '#FF6666',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'Reserved','The booking is complete and has locked out further bookings for the same seat. No Payment is associated with this booking.','#FFCC33',1),(2,'Reserved (Paid)','The booking has been completed, reserved, and a full payment has been received.','#3366FF',1),(3,'Checked-In','Already Checked-In . ','#66CC00',1),(4,'Boarded','Passenger already boarded','#FF0066',1),(5,'No Show','The booking has been canceled. Locked seat assignment has been removed.','#FF6666',1),(6,'Refunded',NULL,'#FF6666',1),(7,'Canceled',NULL,'#FF6666',1);
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_num` char(10) DEFAULT NULL,
  `shipper` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `article_no` varchar(100) DEFAULT NULL,
  `article_desc` tinytext,
  `weight` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'12345','duduy','cavite',NULL,'suv',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_class`
--

DROP TABLE IF EXISTS `cargo_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_class` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `lane_meter` int(11) NOT NULL,
  `bundled_passenger` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_class`
--

LOCK TABLES `cargo_class` WRITE;
/*!40000 ALTER TABLE `cargo_class` DISABLE KEYS */;
INSERT INTO `cargo_class` VALUES (1,'Tricycle, Motorcycle','Below 3.9',2,1,1),(2,'Multicab, Owner Type Jeep','3.9',4,2,1),(3,'Sedan, SUV','4 to 4.9',5,2,1),(4,'Single Ztire, 4 Wheeler Truck','5 to 5.9',6,2,1),(5,'Elf, Passenger Jeepney','6 to 6.9',7,2,1),(6,'Forward 6 Wheeler Truck','7 to 7.9',9,2,1),(7,'6 Wheeler truck','8 to 8.9',9,2,1),(8,'6 Wheeler truck, 8 Wheeler truck','9 to 9.9',10,2,1),(9,'8 Wheeler truck, 10 Wheeler truck','10 to 10.9',11,2,1),(10,'10 Wheeler truck, Wing Van','11 to 11.9',12,2,1),(11,'Wing van, 16 Wheeler truck','12 to 12.8',13,2,1),(12,'Extended trucks','13 to 13.9',14,2,1),(13,'Rocket','',122,0,0),(14,'Air Plane','Eroplano',20,0,1),(15,'Tanke','',39,0,1),(16,'Motor','',32,0,1);
/*!40000 ALTER TABLE `cargo_class` ENABLE KEYS */;
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
INSERT INTO `counter` VALUES (1,'booking',NULL,480),(2,'ticket',NULL,1210),(3,'lading',NULL,17),(4,'series',NULL,10082);
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(3,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(4,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(5,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(6,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(7,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(8,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(9,'vhilly','santiago',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(10,'angela','santiago',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(11,'joanne','santiago',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(12,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(13,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(14,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(15,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(16,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(17,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(18,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(19,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(20,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(21,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(22,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(24,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(26,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(27,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(28,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(29,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(30,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(31,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(32,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(33,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(34,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(35,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(36,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(37,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(38,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(39,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(40,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(42,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(43,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(44,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(46,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(47,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(48,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(49,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(50,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(51,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(52,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(53,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(54,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(55,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(56,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(57,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(58,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(59,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(60,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(61,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(62,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(63,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(64,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(65,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(66,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(67,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(68,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(69,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(70,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(71,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(72,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(73,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(74,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(75,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(76,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(77,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(78,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(79,'vhilly','santiag',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(80,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(81,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(82,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_fare`
--

LOCK TABLES `passenger_fare` WRITE;
/*!40000 ALTER TABLE `passenger_fare` DISABLE KEYS */;
INSERT INTO `passenger_fare` VALUES (1,1,1,1,300.00),(2,1,1,2,180.00),(3,1,1,3,300.00),(4,1,1,4,500.00),(5,2,1,1,240.00),(6,2,1,2,144.00),(7,2,1,3,200.00),(8,2,1,4,2323.00),(9,3,1,1,240.00),(10,3,1,2,144.00),(11,3,1,3,200.00),(12,3,1,4,2222.00),(13,1,2,1,300.00),(14,1,2,2,180.00),(15,2,2,1,0.00),(16,2,2,2,0.00),(17,3,2,1,0.00),(18,3,2,2,0.00),(19,4,2,1,0.00),(20,4,2,2,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_type`
--

LOCK TABLES `passenger_type` WRITE;
/*!40000 ALTER TABLE `passenger_type` DISABLE KEYS */;
INSERT INTO `passenger_type` VALUES (1,'Full Fare','FF','_',1),(2,'Student','SF','Student , Must Have ID',1),(3,'Senior','SC','100 yrs old',1),(4,'Promo Pogi','PP','Pag Pogi my Discount',1);
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
  `default_port` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES (1,'BAT','BATANGAS',1),(3,'CAL','CALAPAN',0),(4,'MT','MATNOG',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,3,'BATANGAS-CALAPAN'),(2,3,1,'CALAPAN-BATANGAS');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1A',1,1,1),(2,1,'2A',1,2,1),(3,1,'1C',3,1,1),(4,1,'1B',2,1,1),(5,1,'2B',2,2,1),(6,1,'2C',3,2,1),(7,1,'3A',1,3,1),(8,1,'3C',3,3,1),(10,1,'3B',2,3,1),(11,1,'5C',2,5,1),(12,1,'5D',3,5,1),(13,1,'5A',1,5,1),(14,2,'A1',1,1,1),(15,2,'A2',2,1,1),(16,2,'B1',1,2,1),(17,2,'K1',1,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating_class`
--

LOCK TABLES `seating_class` WRITE;
/*!40000 ALTER TABLE `seating_class` DISABLE KEYS */;
INSERT INTO `seating_class` VALUES (1,'Business Class','BC','Aircon',5,3,1),(2,'Premium Economy','PE','Non Aircon',10,20,1),(3,'TEST Class','TC','',0,0,0),(4,'TEST Class2','tesat','',0,0,0),(5,'SEATest','STC','Testing Lang',7,9,0);
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
  `price_paid` decimal(20,2) NOT NULL DEFAULT '0.00',
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
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`seating_class_id`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`passenger_type_id`) REFERENCES `passenger_type` (`id`),
  CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,NULL,2,'','001129','10001','000440',2,1,180.00,6,1),(2,2,1,NULL,2,'','001130','10002','000441',2,1,180.00,7,1),(3,3,1,NULL,2,'','001131','10003','000442',2,1,180.00,5,1),(4,4,1,NULL,2,'','001132','10004','000442',2,1,180.00,5,1),(5,5,1,NULL,1,'','001133','10005','000443',2,2,240.00,5,1),(6,6,1,NULL,1,'','001134','10006','000443',2,1,300.00,5,1),(7,8,1,NULL,1,'','001136','10008','000444',2,1,300.00,5,1),(8,9,1,NULL,1,'','001137','10009','000445',2,1,300.00,5,1),(9,10,1,NULL,1,'','001138','10010','000445',2,2,240.00,5,1),(10,11,1,NULL,1,'','001139','10011','000445',2,3,240.00,5,1),(11,12,1,NULL,1,'','001140','10012','000446',2,1,300.00,5,1),(12,13,1,NULL,1,'','001141','10013','000447',2,1,300.00,5,1),(13,14,1,NULL,1,'','001142','10014','000447',2,1,300.00,5,1),(14,15,1,NULL,1,'','001143','10015','000447',2,1,300.00,5,1),(15,16,1,NULL,1,'','001144','10016','000447',2,1,300.00,5,1),(16,18,1,NULL,1,'','001146','10018','000449',2,2,240.00,5,1),(17,19,2,NULL,1,'','001147','10019','000450',2,1,300.00,5,1),(18,20,2,NULL,1,'','001148','10020','000450',2,1,300.00,5,1),(19,21,2,NULL,1,'','001149','10021','000450',2,1,300.00,5,1),(20,22,2,NULL,2,'','001150','10022','000451',2,1,180.00,5,1),(21,23,2,NULL,2,'','001151','10023','000452',2,1,180.00,5,1),(22,24,2,NULL,2,'','001152','10024','000452',2,1,180.00,5,1),(23,25,2,NULL,2,'','001153','10025','000452',2,1,180.00,5,1),(24,26,2,NULL,1,'','001154','10026','000453',2,1,300.00,5,1),(25,27,2,NULL,1,'','001155','10027','000453',2,1,300.00,5,1),(26,28,2,NULL,1,'','001156','10028','000453',2,1,300.00,5,1),(27,29,2,NULL,1,'','001157','10029','000453',2,1,300.00,5,1),(28,30,2,NULL,1,'','001158','10030','000453',2,1,300.00,6,1),(29,31,2,NULL,1,'','001159','10031','000453',2,1,300.00,5,1),(30,32,2,NULL,1,'','001160','10032','000453',2,2,240.00,6,1),(31,33,2,NULL,1,'','001161','10033','000454',2,1,300.00,5,1),(32,34,2,NULL,1,'','001162','10034','000454',2,1,300.00,5,1),(33,35,3,NULL,2,'','001163','10035','000455',2,1,180.00,7,1),(34,36,3,15,2,'','001164','10036','000455',2,1,180.00,4,1),(35,37,3,16,2,'','001165','10037','000456',2,4,0.00,4,1),(36,38,3,NULL,2,'','001166','10038','000457',2,1,180.00,5,1),(37,39,3,NULL,1,'','001167','10039','000458',2,1,300.00,5,1),(38,40,3,NULL,1,'','001168','10040','000459',2,1,300.00,5,1),(39,41,3,NULL,1,'','001169','10041','000459',2,1,300.00,5,1),(40,42,3,NULL,1,'','001170','10042','000460',2,1,300.00,5,1),(41,43,3,NULL,1,'','001171','10043','000461',2,1,300.00,5,1),(42,44,3,NULL,1,'','001172','10044','000462',2,1,300.00,6,1),(43,45,3,NULL,1,'','001173','10045','000463',2,1,300.00,5,1),(44,46,3,NULL,1,'','001174','10046','000463',2,1,300.00,5,1),(45,47,3,NULL,1,'','001175','10047','000463',2,1,300.00,5,1),(46,48,3,NULL,1,'','001176','10048','000464',2,1,300.00,5,1),(47,49,3,NULL,1,'','001177','10049','000464',2,1,300.00,5,1),(48,50,3,NULL,1,'','001178','10050','000464',2,1,300.00,5,1),(49,51,3,NULL,1,'','001179','10051','000466',2,1,300.00,5,1),(50,52,3,NULL,2,'','001180','10052','000467',2,1,180.00,5,1),(51,53,4,NULL,1,'','001181','10053','000468',2,1,300.00,6,1),(52,54,4,NULL,2,'','001182','10054','000469',2,1,180.00,4,1),(53,55,4,15,2,'','001183','10055','000469',2,3,144.00,4,1),(54,56,4,16,2,'','001184','10056','000469',2,2,144.00,4,1),(55,57,4,17,2,'','001185','10057','000470',2,1,180.00,4,1),(56,58,4,NULL,1,'','001186','10058','000471',2,1,300.00,5,1),(57,59,4,NULL,1,'','001187','10059','000471',2,1,300.00,5,1),(58,60,4,NULL,1,'','001188','10060','000471',2,4,0.00,5,1),(59,61,4,NULL,1,'','001189','10061','000472',2,3,240.00,5,1),(60,62,4,NULL,1,'','001190','10062','000472',2,4,0.00,5,1),(61,63,4,NULL,1,'','001191','10063','000472',2,3,240.00,5,1),(62,64,4,NULL,1,'','001192','10064','000472',2,3,240.00,5,1),(63,65,4,NULL,1,'','001193','10065','000472',2,4,0.00,5,1),(64,66,4,NULL,1,'','001194','10066','000473',2,1,300.00,5,1),(65,67,4,NULL,1,'','001195','10067','000473',2,1,300.00,5,1),(66,68,4,NULL,1,'','001196','10068','000473',2,1,300.00,5,1),(67,69,4,NULL,2,'','001197','10069','000474',2,1,180.00,5,1),(68,70,4,NULL,1,'','001198','10070','000475',2,1,300.00,6,1),(69,71,5,14,2,'','001199','10071','000476',2,1,180.00,1,1),(70,72,5,1,1,'','001200','10072','000477',2,1,300.00,1,1),(71,73,5,4,1,'','001201','10073','000477',2,1,300.00,1,1),(72,74,5,3,1,'','001202','10074','000477',2,1,300.00,1,1),(73,75,5,2,1,'','001203','10075','000477',2,1,300.00,1,1),(74,76,5,5,1,'','001204','10076','000477',2,1,300.00,1,1),(75,77,5,NULL,1,'','001205','10077','000477',2,1,300.00,6,1),(76,78,5,NULL,1,'','001206','10078','000477',2,1,300.00,6,1),(77,79,6,14,2,'','001207','10079','000478',2,1,180.00,1,1),(78,80,6,15,2,'','001208','10080','000478',2,1,180.00,1,1),(79,81,6,16,2,'','001209','10081','000479',2,1,180.00,1,1),(80,82,6,1,1,'','001210','10082','000480',2,1,300.00,1,1);
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
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','7c8666649598491530a5b8bb91c41772','2013-05-22 05:15:20','2013-11-06 01:27:56',1,1),(2,'neil','db684cf96914fce8df7d94353f73edfa','neil@Imperium.ph','fe3443d4ff5c4433cbaf96cf9fe46aab','2013-10-29 18:12:13','2013-10-29 18:12:27',0,1);
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
INSERT INTO `vessel` VALUES (1,'FASTCAT-M1','FM1',16,''),(6,'FASTCAT-M2','FM2',16,''),(8,'3232','232',16,''),(10,'test','FM12',16,''),(12,'FASTCAT-M3','FM3',16,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (1,'FASCAT-M1-1',1,1,'2013-11-01','23:00:00','00:00:00',14,0,3),(2,'FASCAT-M1-2',1,1,'2013-11-01','21:00:00','22:00:00',16,2,3),(3,'FASCAT-M1-3',1,1,'2013-11-04','08:00:00','08:00:00',16,0,2),(4,'FASCAT-M1-4',1,1,'2013-11-04','08:00:00','08:00:00',16,1,3),(5,'FASCAT-M1-5',1,1,'2013-11-04','08:00:00','08:00:00',16,10,1),(6,'FASCAT-M1-7',1,1,'2013-11-06','08:00:00','08:00:00',16,12,1);
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

--
-- Table structure for table `waybill`
--

DROP TABLE IF EXISTS `waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waybill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_id` int(11) NOT NULL,
  `voyage_id` int(11) NOT NULL,
  `stowage_id` int(11) DEFAULT NULL,
  `cargo_class_id` tinyint(4) NOT NULL,
  `transaction_no` char(32) NOT NULL,
  `lading_no` char(32) NOT NULL,
  `series_no` char(32) NOT NULL,
  `booking_no` char(32) NOT NULL,
  `waybill_type_id` tinyint(4) NOT NULL,
  `price_paid` decimal(20,2) NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lading_no` (`lading_no`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status_id`),
  KEY `cargo_id` (`cargo_id`),
  KEY `voyage_id` (`voyage_id`),
  KEY `stowage_id` (`stowage_id`),
  KEY `cargo_class_id` (`cargo_class_id`),
  KEY `waybill_type_id` (`waybill_type_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `waybill_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `waybill_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `waybill_ibfk_3` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `waybill_ibfk_4` FOREIGN KEY (`cargo_class_id`) REFERENCES `cargo_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waybill`
--

LOCK TABLES `waybill` WRITE;
/*!40000 ALTER TABLE `waybill` DISABLE KEYS */;
INSERT INTO `waybill` VALUES (1,1,3,NULL,1,'','000017','1234','000465',2,1234.00,7,1,NULL);
/*!40000 ALTER TABLE `waybill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-07 11:01:59
