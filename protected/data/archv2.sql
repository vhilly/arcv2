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
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baggage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) DEFAULT NULL,
  `voyage_id` int(11) DEFAULT NULL,
  `price_paid` decimal(20,2) NOT NULL DEFAULT '0.00',
  `baggage_type_id` tinyint(4) DEFAULT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `voyage_id` (`voyage_id`),
  KEY `baggage_type_id` (`baggage_type_id`),
  CONSTRAINT `baggage_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `baggage_ibfk_2` FOREIGN KEY (`voyage_id`) REFERENCES `voyage` (`id`),
  CONSTRAINT `baggage_ibfk_3` FOREIGN KEY (`baggage_type_id`) REFERENCES `baggage_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baggage_type`
--

DROP TABLE IF EXISTS `baggage_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baggage_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `weight` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage_type`
--

LOCK TABLES `baggage_type` WRITE;
/*!40000 ALTER TABLE `baggage_type` DISABLE KEYS */;
INSERT INTO `baggage_type` VALUES (1,'1kg - 19kg','',20.00,1),(2,'20kg - 40kg','',50.00,1),(3,'40kg and above','',100.00,1);
/*!40000 ALTER TABLE `baggage_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhistory_upload`
--

DROP TABLE IF EXISTS `bhistory_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhistory_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage` int(11) NOT NULL,
  `is_uploaded` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voyage` (`voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhistory_upload`
--

LOCK TABLES `bhistory_upload` WRITE;
/*!40000 ALTER TABLE `bhistory_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhistory_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_num` varchar(10) DEFAULT NULL,
  `shipper` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `article_no` varchar(100) DEFAULT NULL,
  `article_desc` tinytext,
  `weight` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
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
  `description` tinytext,
  `lane_meter` int(11) DEFAULT NULL,
  `bundled_passenger` int(11) NOT NULL DEFAULT '2',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_class`
--

LOCK TABLES `cargo_class` WRITE;
/*!40000 ALTER TABLE `cargo_class` DISABLE KEYS */;
INSERT INTO `cargo_class` VALUES (1,'Tricylce, Motorcycle','Below 3 meters',NULL,2,1),(2,'Multicab, Owner Type Jeep','3 to 3.9 meters',NULL,2,1),(3,'Sedan, SUV','4 to 4.9 meters',NULL,2,1),(4,'Single Tire Jeep, 4WD','5 to 5.9 meters',NULL,2,1),(5,'ELF, Passenger Jeep (Double Tire)','6 to 6.9 meters',NULL,2,1),(6,'Forward 6 Wheeler','7 to 7.9 meters',NULL,2,1),(7,'8 Wheeler Truck LC','8 to 8.9 meters',NULL,2,1),(8,'8 Wheeler, 10 Wheeler Truck','10 to 10.9 meters',NULL,2,1),(9,'10 Wheeler, Wing Van','11 to 11.9 meters',NULL,2,1),(10,'Wing Van, 16 Wheeler Truck','12 to 12.9 meters',NULL,2,1),(11,'Extended Truck','13 to 13.9 meters',NULL,2,1);
/*!40000 ALTER TABLE `cargo_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_fare_rates`
--

DROP TABLE IF EXISTS `cargo_fare_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_fare_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `lane_meter_rate` int(11) NOT NULL,
  `regular_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `discounted_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `discount` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `route` (`route`),
  KEY `class` (`class`),
  CONSTRAINT `cargo_fare_rates_ibfk_1` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  CONSTRAINT `cargo_fare_rates_ibfk_2` FOREIGN KEY (`class`) REFERENCES `cargo_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_fare_rates`
--

LOCK TABLES `cargo_fare_rates` WRITE;
/*!40000 ALTER TABLE `cargo_fare_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo_fare_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CARGO_PRICE_UPDATE` AFTER UPDATE ON `cargo_fare_rates`
 FOR EACH ROW BEGIN
        IF NEW.regular_rate <> OLD.regular_rate  THEN  
            INSERT INTO price_history (category,category_id,price,discounted_price,discount) VALUES(2,New.id,OLD.regular_rate,OLD.discounted_rate,OLD.discount);
        ELSEIF  NEW.discounted_rate <> OLD.discounted_rate THEN
 INSERT INTO price_history (category,category_id,price,discounted_price,discount) VALUES(2,New.id,OLD.regular_rate,OLD.discounted_rate,OLD.discount);
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,'booking',NULL,547),(2,'ticket',NULL,1294),(3,'lading',NULL,34),(4,'series',NULL,22);
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
  `prefix` varchar(5) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `civil_status` char(1) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(3,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(4,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(5,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(6,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00'),(7,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00');
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
  KEY `type` (`type`),
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
INSERT INTO `passenger_fare` VALUES (1,1,1,1,300.00),(2,1,1,2,180.00),(3,2,1,1,240.00),(4,2,1,2,144.00),(5,3,1,1,240.00),(6,3,1,2,144.00),(7,4,1,1,150.00),(8,4,1,2,90.00),(9,5,1,1,0.00),(10,5,1,2,0.00),(11,6,1,1,240.00),(12,6,1,2,144.00),(13,7,1,1,0.00),(14,7,1,2,0.00),(15,8,1,1,230.00),(16,8,1,2,180.00),(17,9,1,1,184.00),(18,9,1,2,144.00),(19,10,1,1,0.00),(20,10,1,2,0.00);
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
  `code` varchar(10) DEFAULT NULL,
  `description` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_type`
--

LOCK TABLES `passenger_type` WRITE;
/*!40000 ALTER TABLE `passenger_type` DISABLE KEYS */;
INSERT INTO `passenger_type` VALUES (1,'Full Fare','FF',NULL,1),(2,'Student','SF',NULL,1),(3,'Senior','SC',NULL,1),(4,'Children','CF',NULL,1),(5,'Infant','IF',NULL,1),(6,'PWD','PWD',NULL,1),(7,'w/ PASS ','WPASS ',NULL,1),(8,'Weekday Promo Full-Fare ','WPF',NULL,1),(9,'Weekday Promo Student/Senior/PWD ','WPSSPWD',NULL,1),(10,'Driver/Assistant ','DA',NULL,1);
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES (1,'BAT','BATANGAS'),(2,'CAL','CALAPAN');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_history`
--

DROP TABLE IF EXISTS `price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `discounted_price` decimal(20,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_history`
--

LOCK TABLES `price_history` WRITE;
/*!40000 ALTER TABLE `price_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_history` ENABLE KEYS */;
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
INSERT INTO `route` VALUES (1,1,2,'BATANGAS-CALAPAN'),(2,2,1,'CALAPAN-BATANGAS');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `departure_time` time NOT NULL,
  `departure_date` time NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1A',1,1,1),(2,1,'1B',1,2,1),(3,1,'1C',1,3,1),(4,1,'1D',1,4,1),(5,2,'31A',1,1,1),(6,2,'31B',1,2,1);
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
  `code` varchar(10) NOT NULL,
  `description` text,
  `rows` int(11) NOT NULL,
  `cols` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating_class`
--

LOCK TABLES `seating_class` WRITE;
/*!40000 ALTER TABLE `seating_class` DISABLE KEYS */;
INSERT INTO `seating_class` VALUES (1,'Business Class','BC','',10,10,1),(2,'Premium Economy','PE','',10,10,1);
/*!40000 ALTER TABLE `seating_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext,
  `color` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,1,'Reserved','The booking is complete and has locked out further bookings for the same seat. No Payment is associated with this booking.','#FFCC33',1),(2,1,'Reserved (Paid)','The booking has been completed, reserved, and a full payment has been received.','#3366FF',1),(3,1,'Checked-In','Already Checked-In . ','#66CC00',1),(4,1,'Boarded','Passenger already boarded','#FF0066',1),(5,1,'No Show','The booking has been canceled. Locked seat assignment has been removed.','#FF6666',1),(6,1,'Refunded',NULL,'#FF6666',1),(7,1,'Canceled',NULL,'#FF6666',1),(8,2,'Open',NULL,'',1),(9,2,'Advance Booking Closed',NULL,'',1),(10,2,'Voyage Closed',NULL,'',1);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger` int(11) NOT NULL,
  `voyage` int(11) NOT NULL,
  `seat` int(11) DEFAULT NULL,
  `seating_class` tinyint(4) NOT NULL,
  `transaction_no` varchar(100) NOT NULL,
  `ticket_no` varchar(100) NOT NULL,
  `series_no` varchar(100) NOT NULL,
  `booking_no` varchar(100) NOT NULL,
  `ticket_type` tinyint(4) NOT NULL,
  `passenger_type` tinyint(4) NOT NULL,
  `price_paid` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_no` (`ticket_no`),
  KEY `created_by` (`created_by`),
  KEY `passenger` (`passenger`),
  KEY `voyage` (`voyage`),
  KEY `seat` (`seat`),
  KEY `seating_class` (`seating_class`),
  KEY `ticket_type` (`ticket_type`),
  KEY `status` (`status`),
  CONSTRAINT `ticket_ibfk_10` FOREIGN KEY (`seat`) REFERENCES `seat` (`id`),
  CONSTRAINT `ticket_ibfk_11` FOREIGN KEY (`seating_class`) REFERENCES `seating_class` (`id`),
  CONSTRAINT `ticket_ibfk_12` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_9` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,1,1,'','001292','20','000541',2,1,0.00,1,1),(2,2,1,2,1,'','001293','21','000542',2,1,0.00,1,1),(3,3,1,3,1,'','JSJ000510','79775','000543',1,1,300.00,4,1),(4,4,1,5,2,'','JSJ000001','79251','000544',1,1,180.00,4,1),(5,5,1,6,2,'','JSJ000002','79252','000545',1,1,180.00,4,1),(6,6,2,5,2,'','JSJ000003','79253','000546',1,1,180.00,4,1),(7,7,1,4,1,'','001294','22','000547',2,1,300.00,1,1);
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
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','7c8666649598491530a5b8bb91c41772','2013-05-22 05:15:20','2013-12-11 15:53:08',1,1),(2,'neil','db684cf96914fce8df7d94353f73edfa','neil@Imperium.ph','fe3443d4ff5c4433cbaf96cf9fe46aab','2013-10-29 18:12:13','2013-10-29 18:12:27',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vessel`
--

LOCK TABLES `vessel` WRITE;
/*!40000 ALTER TABLE `vessel` DISABLE KEYS */;
INSERT INTO `vessel` VALUES (1,'FASTCAT-M1','FM1',200,'');
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
  `number` varchar(100) NOT NULL,
  `vessel` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `capacity` int(11) NOT NULL,
  `available_seats` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `status` (`status`),
  KEY `route` (`route`),
  KEY `vessel` (`vessel`),
  CONSTRAINT `voyage_ibfk_1` FOREIGN KEY (`vessel`) REFERENCES `vessel` (`id`),
  CONSTRAINT `voyage_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  CONSTRAINT `voyage_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
INSERT INTO `voyage` VALUES (1,'FASTCAT-M1-1',1,1,'2013-12-12','08:00:00','08:00:00',200,197,8),(2,'FASTCAT-M1-4',1,1,'2013-12-12','08:00:00','08:00:00',200,200,8);
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_to_upload_queue` AFTER UPDATE ON `voyage`
 FOR EACH ROW BEGIN

        IF  NEW.status = 10 THEN  
          INSERT IGNORE INTO  bhistory_upload (voyage) VALUES(New.id);
        END IF;     
        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `waybill`
--

DROP TABLE IF EXISTS `waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waybill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` int(11) NOT NULL,
  `voyage` int(11) NOT NULL,
  `stowage` int(11) DEFAULT NULL,
  `cargo_class` tinyint(4) NOT NULL,
  `transaction_no` varchar(100) NOT NULL,
  `lading_no` varchar(100) NOT NULL,
  `series_no` varchar(100) NOT NULL,
  `booking_no` varchar(100) NOT NULL,
  `waybill_type` tinyint(4) NOT NULL,
  `price_paid` decimal(20,2) NOT NULL,
  `original_price` decimal(20,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lading_no` (`lading_no`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status`),
  KEY `cargo_id` (`cargo`),
  KEY `voyage_id` (`voyage`),
  KEY `stowage_id` (`stowage`),
  KEY `cargo_class_id` (`cargo_class`),
  CONSTRAINT `waybill_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `waybill_ibfk_2` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`),
  CONSTRAINT `waybill_ibfk_3` FOREIGN KEY (`cargo_class`) REFERENCES `cargo_class` (`id`),
  CONSTRAINT `waybill_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waybill`
--

LOCK TABLES `waybill` WRITE;
/*!40000 ALTER TABLE `waybill` DISABLE KEYS */;
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

-- Dump completed on 2013-12-12  9:03:59
