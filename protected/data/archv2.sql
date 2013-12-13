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
INSERT INTO `AuthAssignment` VALUES ('Admin','1',NULL,'N;'),('Inspector','7',NULL,'N;'),('Tellers','10',NULL,'N;'),('Tellers','14',NULL,'N;'),('Tellers','16',NULL,'N;'),('Tellers','17',NULL,'N;');
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
INSERT INTO `AuthItem` VALUES ('Admin',2,NULL,NULL,'N;'),('Admin.*',1,NULL,NULL,'N;'),('Admin.BaggageType',0,NULL,NULL,'N;'),('Admin.BaggageTypeAdd',0,NULL,NULL,'N;'),('Admin.BaggageTypeUpdate',0,NULL,NULL,'N;'),('Admin.CargoClass',0,NULL,NULL,'N;'),('Admin.CargoClassAdd',0,NULL,NULL,'N;'),('Admin.CargoClassUpdate',0,NULL,NULL,'N;'),('Admin.CargoRate',0,NULL,NULL,'N;'),('Admin.PassengerFare',0,NULL,NULL,'N;'),('Admin.PassengerType',0,NULL,NULL,'N;'),('Admin.PassengerTypeAdd',0,NULL,NULL,'N;'),('Admin.PassengerTypeUpdate',0,NULL,NULL,'N;'),('Admin.Port',0,NULL,NULL,'N;'),('Admin.PortAdd',0,NULL,NULL,'N;'),('Admin.PortUpdate',0,NULL,NULL,'N;'),('Admin.Route',0,NULL,NULL,'N;'),('Admin.RouteAdd',0,NULL,NULL,'N;'),('Admin.RouteUpdate',0,NULL,NULL,'N;'),('Admin.Seat',0,NULL,NULL,'N;'),('Admin.SeatingClass',0,NULL,NULL,'N;'),('Admin.SeatingClassAdd',0,NULL,NULL,'N;'),('Admin.SeatingClassUpdate',0,NULL,NULL,'N;'),('Admin.Vessel',0,NULL,NULL,'N;'),('Admin.VesselAdd',0,NULL,NULL,'N;'),('Admin.VesselUpdate',0,NULL,NULL,'N;'),('Admin.Voyage',0,NULL,NULL,'N;'),('Admin.VoyageAdd',0,NULL,NULL,'N;'),('Admin.VoyageStatus',0,NULL,NULL,'N;'),('Admin.VoyageUpdate',0,NULL,NULL,'N;'),('App.*',1,NULL,NULL,'N;'),('App.AdvCheckin',0,NULL,NULL,'N;'),('App.Checkin',0,NULL,NULL,'N;'),('App.EditableSaver',0,NULL,NULL,'N;'),('App.GetCargoRates',0,NULL,NULL,'N;'),('App.Manifest',0,NULL,NULL,'N;'),('App.PassengerTicket',0,NULL,NULL,'N;'),('App.Print',0,NULL,NULL,'N;'),('App.RollingCargo',0,NULL,NULL,'N;'),('App.SeatAll',0,NULL,NULL,'N;'),('App.SeatMap',0,NULL,NULL,'N;'),('App.SeatView',0,NULL,NULL,'N;'),('App.SeriesNumber',0,NULL,NULL,'N;'),('App.TicketCancel',0,NULL,NULL,'N;'),('App.TicketingBooth',0,NULL,NULL,'N;'),('App.TicketRefund',0,NULL,NULL,'N;'),('App.Tickets',0,NULL,NULL,'N;'),('App.TicketStats',0,NULL,NULL,'N;'),('App.TransferForm',0,NULL,NULL,'N;'),('App.WaybillCancel',0,NULL,NULL,'N;'),('App.WaybillRefund',0,NULL,NULL,'N;'),('App.Waybills',0,NULL,NULL,'N;'),('Authenticated',2,NULL,NULL,'N;'),('BarcodeGenerator.*',1,NULL,NULL,'N;'),('BarcodeGenerator.GenerateBarcode',0,NULL,NULL,'N;'),('Cashier',2,'Cashier',NULL,'N;'),('Guest',2,NULL,NULL,'N;'),('Inspector',2,'Inspector',NULL,'N;'),('Report.*',1,NULL,NULL,'N;'),('Report.DailyRevenue',0,NULL,NULL,'N;'),('Report.DynamicVoyages',0,NULL,NULL,'N;'),('Report.Tellers',0,NULL,NULL,'N;'),('Site.*',1,NULL,NULL,'N;'),('Site.Error',0,NULL,NULL,'N;'),('Site.Index',0,NULL,NULL,'N;'),('Site.Login',0,NULL,NULL,'N;'),('Site.Logout',0,NULL,NULL,'N;'),('Tellers',2,'Tellers',NULL,'N;'),('User.Activation.*',1,NULL,NULL,'N;'),('User.Activation.Activation',0,NULL,NULL,'N;'),('User.Admin.*',1,NULL,NULL,'N;'),('User.Admin.Admin',0,NULL,NULL,'N;'),('User.Admin.Create',0,NULL,NULL,'N;'),('User.Admin.Delete',0,NULL,NULL,'N;'),('User.Admin.Update',0,NULL,NULL,'N;'),('User.Admin.View',0,NULL,NULL,'N;'),('User.Default.*',1,NULL,NULL,'N;'),('User.Default.Index',0,NULL,NULL,'N;'),('User.Login.*',1,NULL,NULL,'N;'),('User.Login.Login',0,NULL,NULL,'N;'),('User.Logout.*',1,NULL,NULL,'N;'),('User.Logout.Logout',0,NULL,NULL,'N;'),('User.Profile.*',1,NULL,NULL,'N;'),('User.Profile.Changepassword',0,NULL,NULL,'N;'),('User.Profile.Edit',0,NULL,NULL,'N;'),('User.Profile.Profile',0,NULL,NULL,'N;'),('User.ProfileField.*',1,NULL,NULL,'N;'),('User.ProfileField.Admin',0,NULL,NULL,'N;'),('User.ProfileField.Create',0,NULL,NULL,'N;'),('User.ProfileField.Delete',0,NULL,NULL,'N;'),('User.ProfileField.Update',0,NULL,NULL,'N;'),('User.ProfileField.View',0,NULL,NULL,'N;'),('User.Recovery.*',1,NULL,NULL,'N;'),('User.Recovery.Recovery',0,NULL,NULL,'N;'),('User.Registration.*',1,NULL,NULL,'N;'),('User.Registration.Registration',0,NULL,NULL,'N;'),('User.User.*',1,NULL,NULL,'N;'),('User.User.Index',0,NULL,NULL,'N;'),('User.User.View',0,NULL,NULL,'N;');
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
INSERT INTO `AuthItemChild` VALUES ('Tellers','Admin.PassengerFare'),('Tellers','Admin.PassengerType'),('Tellers','Admin.Voyage'),('Tellers','Admin.VoyageAdd'),('Tellers','Admin.VoyageStatus'),('Tellers','Admin.VoyageUpdate'),('Tellers','App.*'),('Inspector','App.AdvCheckin'),('Inspector','App.Checkin'),('Inspector','App.EditableSaver'),('Inspector','App.Print'),('Inspector','App.SeatAll'),('Inspector','App.SeatMap'),('Inspector','App.SeatView'),('Inspector','BarcodeGenerator.*'),('Tellers','BarcodeGenerator.*'),('Tellers','Report.*'),('Inspector','Site.*'),('Tellers','Site.*');
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
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baggage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger` int(11) DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  `waybill` int(11) DEFAULT NULL,
  `voyage` int(11) DEFAULT NULL,
  `price_paid` decimal(20,2) NOT NULL DEFAULT '0.00',
  `baggage_type` tinyint(4) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passenger_id` (`passenger`),
  KEY `voyage_id` (`voyage`),
  KEY `baggage_type_id` (`baggage_type`),
  KEY `status_id` (`status`),
  KEY `created_by` (`created_by`),
  KEY `ticket_id` (`ticket`),
  KEY `waybill` (`waybill`),
  CONSTRAINT `baggage_ibfk_10` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `baggage_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `baggage_ibfk_5` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  CONSTRAINT `baggage_ibfk_6` FOREIGN KEY (`ticket`) REFERENCES `ticket` (`id`),
  CONSTRAINT `baggage_ibfk_7` FOREIGN KEY (`waybill`) REFERENCES `waybill` (`id`),
  CONSTRAINT `baggage_ibfk_8` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`),
  CONSTRAINT `baggage_ibfk_9` FOREIGN KEY (`baggage_type`) REFERENCES `baggage_type` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_class`
--

LOCK TABLES `cargo_class` WRITE;
/*!40000 ALTER TABLE `cargo_class` DISABLE KEYS */;
INSERT INTO `cargo_class` VALUES (1,'Tricylce, Motorcycle','Below 3 meters',NULL,2,1),(2,'Multicab, Owner Type Jeep','3 to 3.9 meters',NULL,2,1),(3,'Sedan, SUV','4 to 4.9 meters',NULL,2,1),(4,'Single Tire Jeep, 4WD','5 to 5.9 meters',NULL,2,1),(5,'ELF, Passenger Jeep (Double Tire)','6 to 6.9 meters',NULL,2,1),(6,'Forward 6 Wheeler','7 to 7.9 meters',NULL,2,1),(7,'6 Wheeler Truck LC','8 to 8.9 meters',NULL,2,1),(8,'8 Wheeler Truck','9 to 9.9 meters',NULL,2,1),(9,'8 Wheeler, 10 Wheeler Truck','10 to 10.9 meters',NULL,2,1),(10,'Bus','Bus',NULL,2,1),(11,'10 Wheeler, Wing Van','11 to 11.9 meters',NULL,2,1),(12,'Wing Van, 16 Wheeler Truck','12 to 12.9 meters',NULL,2,1),(13,'Extended Truck','13 to 13.9 meters',NULL,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_fare_rates`
--

LOCK TABLES `cargo_fare_rates` WRITE;
/*!40000 ALTER TABLE `cargo_fare_rates` DISABLE KEYS */;
INSERT INTO `cargo_fare_rates` VALUES (1,1,1,0,720.00,720.00,0,1),(2,1,2,0,1344.00,1250.00,7,1),(3,1,3,0,1680.00,1536.00,9,1),(4,1,4,0,2016.00,1700.00,16,1),(5,1,5,0,2352.00,1900.00,19,1),(6,1,6,0,3024.00,2300.00,24,1),(7,1,7,0,3024.00,2800.00,7,1),(8,1,8,0,3360.00,3000.00,11,1),(9,1,9,0,3696.00,3100.00,16,1),(10,1,10,0,2580.00,2580.00,0,1),(11,1,11,0,4032.00,3400.00,16,1),(12,1,12,0,4368.00,3686.00,16,1),(13,1,13,0,4704.00,4608.00,2,1),(14,2,1,0,720.00,720.00,0,1),(15,2,2,0,1344.00,1250.00,7,1),(16,2,3,0,1680.00,1536.00,9,1),(17,2,4,0,2016.00,1700.00,16,1),(18,2,5,0,2352.00,1900.00,19,1),(19,2,6,0,3024.00,2300.00,24,1),(20,2,7,0,3024.00,2800.00,7,1),(21,2,8,0,3360.00,3000.00,11,1),(22,2,9,0,3696.00,3100.00,16,1),(23,2,10,0,2580.00,2580.00,0,1),(24,2,11,0,4032.00,3400.00,16,1),(25,2,12,0,4368.00,3686.00,16,1),(26,2,13,0,4704.00,4608.00,2,1);
/*!40000 ALTER TABLE `cargo_fare_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
INSERT INTO `counter` VALUES (1,'booking','C',0),(2,'ticket','C',0),(3,'lading','C',0),(4,'series',NULL,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Santiago','Vhilly'),(2,'Demo','Demo'),(3,'Cabug-os','Neil'),(4,'Collera','Dandy'),(5,'One','Teller'),(6,'Fuentes','Ann Everette '),(7,'adelantar','rowell'),(8,'Muje','Anna Viguia'),(9,'factor','beverly kim'),(10,'lorque','mark john'),(11,'cabacang','alfeo'),(12,'Magistrado','Kenneth'),(13,'Marcellana','Elmer'),(14,'Mandigma','Anna'),(15,'Sadia','Michelle'),(16,'Bagro','Renz'),(17,'Suba','Arlene');
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
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1A',1,9,1),(2,1,'1B',1,8,1),(3,1,'1C',1,7,1),(4,1,'1D',1,6,1),(5,1,'1E',1,4,1),(6,1,'1F',1,3,1),(7,1,'1G',1,2,1),(8,1,'2A',2,9,1),(9,1,'2B',2,8,1),(10,1,'2C',2,7,1),(11,1,'2D',2,6,1),(12,1,'2E',2,4,1),(13,1,'2F',2,3,1),(14,1,'2G',2,2,1),(15,1,'3A',3,9,1),(16,1,'3B',3,8,1),(17,1,'3C',3,7,1),(18,1,'3D',3,6,1),(19,1,'3E',3,4,1),(20,1,'3F',3,3,1),(21,1,'3G',3,2,1),(22,1,'4A',4,9,1),(23,1,'4B',4,8,1),(24,1,'4C',4,7,1),(25,1,'4D',4,6,1),(26,1,'4E',4,4,1),(27,1,'4F',4,3,1),(28,1,'4G',4,2,1),(29,1,'5A',5,9,1),(30,1,'5B',5,8,1),(31,1,'5C',5,7,1),(32,1,'5D',5,6,1),(33,1,'5E',5,4,1),(34,1,'5F',5,3,1),(35,1,'5G',5,2,1),(36,1,'6A',6,9,1),(37,1,'6B',6,8,1),(38,1,'6C',6,7,1),(39,1,'6D',6,6,1),(40,1,'6E',6,4,1),(41,1,'6F',6,3,1),(42,1,'6G',6,2,1),(43,1,'7A',7,9,1),(44,1,'7B',7,8,1),(45,1,'7C',7,7,1),(46,1,'7D',7,6,1),(47,1,'7E',7,4,1),(48,1,'7F',7,3,1),(49,1,'7G',7,2,1),(50,1,'8A',8,9,1),(51,1,'8B',8,8,1),(52,1,'8C',8,7,1),(53,1,'8D',8,6,1),(54,1,'8E',8,4,1),(55,1,'8F',8,3,1),(56,1,'8G',8,2,1),(57,1,'9A',9,9,1),(58,1,'9B',9,8,1),(59,1,'9C',9,7,1),(60,1,'9D',9,6,1),(61,1,'9E',9,4,1),(62,1,'9F',9,3,1),(63,1,'9G',9,2,1),(64,1,'10G',11,2,1),(65,1,'10H',11,1,1),(66,1,'11G',12,2,1),(67,1,'11H',12,1,1),(68,1,'12G',13,2,1),(69,1,'12H',13,1,1),(70,1,'13G',14,2,1),(71,1,'13H',14,1,1),(72,1,'14G',15,2,1),(73,1,'14H',15,1,1),(74,1,'15G',16,2,1),(75,1,'15H',16,1,1),(76,1,'16G',17,2,1),(77,1,'16H',17,1,1),(78,1,'17G',18,2,1),(79,1,'17H',18,1,1),(80,1,'18A',19,9,1),(81,1,'18B',19,8,1),(82,1,'18C',19,7,1),(83,1,'18D',19,6,1),(84,1,'18E',19,4,1),(85,1,'18F',19,3,1),(86,1,'18G',19,2,1),(87,1,'19A',20,9,1),(88,1,'19B',20,8,1),(89,1,'19C',20,7,1),(90,1,'19D',20,6,1),(91,1,'19E',20,4,1),(92,1,'19F',20,3,1),(93,1,'19G',20,2,1),(94,1,'20A',21,9,1),(95,1,'20B',21,8,1),(96,1,'20C',21,7,1),(97,1,'20D',21,6,1),(98,1,'20E',21,4,1),(99,1,'20F',21,3,1),(100,1,'20G',21,2,1),(101,1,'21A',22,9,1),(102,1,'21B',22,8,1),(103,1,'21C',22,7,1),(104,1,'21D',22,6,1),(105,1,'21E',22,4,1),(106,1,'21F',22,3,1),(107,1,'21G',22,2,1),(108,1,'22A',23,9,1),(109,1,'22B',23,8,1),(110,1,'22C',23,7,1),(111,1,'22D',23,6,1),(112,1,'22E',23,4,1),(113,1,'22F',23,3,1),(114,1,'22G',23,2,1),(115,1,'23A',24,9,1),(116,1,'23B',24,8,1),(117,1,'23C',24,7,1),(118,1,'23D',24,6,1),(119,1,'23E',24,4,1),(120,1,'23F',24,3,1),(121,1,'23G',24,2,1),(122,1,'24A',25,9,1),(123,1,'24B',25,8,1),(124,1,'24C',25,7,1),(125,1,'24D',25,6,1),(126,1,'24E',25,4,1),(127,1,'24F',25,3,1),(128,1,'24G',25,2,1),(129,1,'25A',26,9,1),(130,1,'25B',26,8,1),(131,1,'25C',26,7,1),(132,1,'25D',26,6,1),(133,1,'25E',26,4,1),(134,1,'25F',26,3,1),(135,1,'25G',26,2,1),(136,1,'26A',27,9,1),(137,1,'26B',27,8,1),(138,1,'26C',27,7,1),(139,1,'26D',27,6,1),(140,1,'26E',27,4,1),(141,1,'26F',27,3,1),(142,1,'26G',27,2,1),(143,1,'27A',28,9,1),(144,1,'27B',28,8,1),(145,1,'27C',28,7,1),(146,1,'27D',28,6,1),(147,1,'27E',28,4,1),(148,1,'27F',28,3,1),(149,1,'27G',28,2,1),(150,1,'28A',29,9,1),(151,1,'28B',29,8,1),(152,1,'28C',29,7,1),(153,1,'28D',29,6,1),(154,1,'28E',29,4,1),(155,1,'28F',29,3,1),(156,1,'28G',29,2,1),(157,1,'29E',30,4,1),(158,1,'29F',30,3,1),(159,1,'29G',30,2,1),(160,2,'30E',1,6,1),(161,2,'30F',1,7,1),(162,2,'30G',1,8,1),(163,2,'31A',2,1,1),(164,2,'31B',2,2,1),(165,2,'31C',2,3,1),(166,2,'31D',2,4,1),(167,2,'31E',2,6,1),(168,2,'31G',2,8,1),(169,2,'31F',2,7,1),(170,2,'32A',3,1,1),(171,2,'32B',3,2,1),(172,2,'32C',3,3,1),(173,2,'32D',3,4,1),(174,2,'32E',3,6,1),(175,2,'32F',3,7,1),(176,2,'32G',3,8,1),(177,2,'33A',4,1,1),(178,2,'33B',4,2,1),(179,2,'33C',4,3,1),(180,2,'33D',4,4,1),(181,2,'33E',4,6,1),(182,2,'33F',4,7,1),(183,2,'33G',4,8,1),(184,2,'34A',5,1,1),(185,2,'34B',5,2,1),(186,2,'34C',5,3,1),(187,2,'34D',5,4,1),(188,2,'34E',5,6,1),(189,2,'35F',6,7,1),(190,2,'34F',5,7,1),(191,2,'34G',5,8,1),(192,2,'35A',6,1,1),(193,2,'35B',6,2,1),(194,2,'35C',6,3,1),(195,2,'35D',6,4,1),(196,2,'35E',6,6,1),(197,2,'35G',6,8,1),(198,2,'36A',7,1,1),(199,2,'36B',7,2,1),(200,2,'36C',7,3,1),(201,2,'36D',7,4,1),(202,2,'36E',7,6,1),(203,2,'36F',7,7,1),(204,2,'36G',7,8,1),(205,2,'37A',8,1,1),(206,2,'37B',8,2,1),(207,2,'37C',8,3,1),(208,2,'37D',8,4,1),(209,2,'37E',8,6,1),(210,2,'37F',8,7,1),(211,2,'37G',8,8,1),(212,2,'38A',9,1,1),(213,2,'38B',9,2,1),(214,2,'38C',9,3,1),(215,2,'38D',9,4,1),(216,2,'38E',9,6,1),(217,2,'38F',9,7,1),(218,2,'38G',9,8,1),(219,2,'39A',10,1,1),(220,2,'39B',10,2,1),(221,2,'39C',10,3,1),(222,2,'39D',10,4,1),(223,2,'39E',10,6,1),(224,2,'39F',10,7,1),(225,2,'39G',10,8,1),(226,2,'40A',11,1,1),(227,2,'40B',11,2,1),(228,2,'40C',11,3,1),(229,2,'40D',11,4,1),(230,2,'40E',11,6,1),(231,2,'40F',11,7,1),(232,2,'40G',11,8,1),(233,2,'41A',12,1,1),(234,2,'41B',12,2,1),(235,2,'41C',12,3,1),(236,2,'41D',12,4,1),(237,2,'41E',12,6,1),(238,2,'41F',12,7,1),(239,2,'41G',12,8,1),(240,2,'42A',13,1,1),(241,2,'42B',13,2,1),(242,2,'42C',13,3,1),(243,2,'42D',13,4,1),(244,2,'42E',13,6,1),(245,2,'42F',13,7,1),(246,2,'42G',13,8,1),(247,2,'43A',14,1,1),(248,2,'43B',14,2,1),(249,2,'43C',14,3,1),(250,2,'43D',14,4,1),(251,2,'43E',14,6,1),(252,2,'43F',14,7,1),(253,2,'43G',14,8,1),(254,2,'44A',15,1,1),(255,2,'44B',15,2,1),(256,2,'44C',15,3,1),(257,2,'44D',15,4,1),(258,2,'44E',15,6,1),(259,2,'44F',15,7,1),(260,2,'44G',15,8,1),(261,2,'45A',16,1,1),(262,2,'45B',16,2,1),(263,2,'45C',16,3,1),(264,2,'45D',16,4,1);
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
INSERT INTO `seating_class` VALUES (1,'Business Class','BC','',9,30,1),(2,'Premium Economy','PE','',8,16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,1,'Reserved','The booking is complete and has locked out further bookings for the same seat. No Payment is associated with this booking.','#FFCC33',1),(2,1,'Reserved (Paid)','The booking has been completed, reserved, and a full payment has been received.','#3366FF',1),(3,1,'Checked-In','Already Checked-In . ','#66CC00',1),(4,1,'Boarded','Passenger already boarded','#FF0066',1),(5,1,'No Show','The booking has been canceled. Locked seat assignment has been removed.','#FF6666',1),(6,1,'Refunded',NULL,'#FF6666',1),(7,1,'Canceled',NULL,'#FF6666',1),(8,2,'Open',NULL,'',1),(9,2,'Advance Booking Closed',NULL,'',1),(10,2,'Voyage Closed',NULL,'',1),(11,3,'Paid','Excess baggage has been paid.','#3366FF',1),(12,3,'Refunded','Excess baggage has been refunded.','#FF6666',1),(13,3,'Canceled','Excess baggage has been canceled.','#FF6666',1);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdefaults`
--

DROP TABLE IF EXISTS `sysdefaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdefaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdefaults`
--

LOCK TABLES `sysdefaults` WRITE;
/*!40000 ALTER TABLE `sysdefaults` DISABLE KEYS */;
INSERT INTO `sysdefaults` VALUES (1,'Default Port','2',0);
/*!40000 ALTER TABLE `sysdefaults` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrades`
--

DROP TABLE IF EXISTS `upgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage` int(11) NOT NULL,
  `ticket_series_no` varchar(100) DEFAULT NULL,
  `upgrade_series_no` varchar(100) DEFAULT NULL,
  `from_fare` int(11) NOT NULL,
  `to_fare` int(11) NOT NULL,
  `amt` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `voyage` (`voyage`),
  CONSTRAINT `upgrades_ibfk_1` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrades`
--

LOCK TABLES `upgrades` WRITE;
/*!40000 ALTER TABLE `upgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrades` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2013-05-22 05:15:20','2013-12-13 06:18:20',1,1),(2,'demo','fe01ce2a7fbac8fafaed7c982a04e229','demo@example.com','099f825543f7850cc038b90aaff39fac','2013-05-22 05:15:20','2013-07-25 02:29:08',0,1),(3,'neil','db684cf96914fce8df7d94353f73edfa','neil@imperium.ph','a15cea299e063b2b77eab0a29bb39197','2013-07-18 12:02:48','2013-08-28 09:58:32',1,1),(4,'yankie','5a51e03713d250b961e1f706a51bc838','yankie@yankie.com','a11ec7013c87aedde046d9371916fac3','2013-07-25 03:47:17','2013-08-03 10:51:31',1,1),(5,'teller1','a23bb7f29e615f5002f5c2a3587aef53','teller@archi.com','baad0bcdde08c4c858e25eb7140b6c54','2013-07-25 03:48:34','2013-07-25 03:49:09',0,1),(6,'anneverette','112225b7b9f48e642b14336e05ce778a','anneverette_fuentes@yahoo.com','063c401709168e12406cd062847c59fe','2013-07-31 05:56:52','2013-08-03 08:20:03',0,1),(7,'rowelladelantar','e10adc3949ba59abbe56e057f20f883e','rowell_adelantar@yahoo.com','f3ef41c020709000fa8c3eb83fef89d7','2013-07-31 05:57:55','2013-12-11 21:14:32',0,1),(8,'annamuje','d758b08bf04484bbcc1cb136ece4af42','annamuje@yahoo.com','120c5d507fca0e533861766fa096ca7a','2013-07-31 06:03:13','2013-08-01 23:55:19',0,1),(9,'kim','e8b21174b0d15a94b83c4f799a421a51','factorbeverlykim@yahoo.com','8e5341a01b9ddaf88481c8e9c70bdf89','2013-07-31 06:08:04','2013-08-14 22:07:54',0,1),(10,'mlorque','3455495112a761fc011a6e91a66b00c5','mlorque@yahoo.com','39eebe0d634cf13377051ffb9d15f79c','2013-07-31 06:10:51','2013-12-12 22:34:37',0,1),(11,'alfeocabacang','b1d7aa8b0f2d45e2fe164e02a95a656f','alfeo.cabacang@fastcat.com','27d19e05cb10881fa797fa97aa677dde','2013-07-31 06:14:50','2013-07-31 06:15:37',0,1),(12,'kenmag','6dd63e79372d96058a0fb477e3013de5','magistradok@yahoo.com','21797f3de006f82c83fab7f59f13a6ec','2013-07-31 06:20:25','2013-07-31 06:21:50',0,1),(13,'elmermarcellana','465bc6b6c125a0cfede189aeaa27bcef','elmermarcellana@fast.com','821c166e83e1530b20197ef2b5be2728','2013-08-01 22:36:06','2013-08-08 04:24:39',0,1),(14,'ana','5390489da3971cbbcd22c159d54d24da','ana@test.ph','4b6732a8a6b92464d00e278cac19cd96','2013-09-04 12:22:32','2013-12-12 13:17:31',0,1),(15,'michellesadia','8f176754401cda515b0c4dc13561ba1f','michellesadia@archipelago.ph','df5422bd5519f3da3b280493fea60f2b','2013-10-14 10:31:58','2013-11-05 02:39:48',0,1),(16,'renzbagro','223a2e41433150010c135306acdfcc60','renzbagro@archipelago.ph','463a4944c5b96decc33a985c2c634122','2013-10-14 10:39:19','2013-12-12 09:15:50',0,1),(17,'arlene','8eb5fb6bdabe99172656e0b4e150110f','arlene@fastcat.com.ph','fc12810f5f600336d44d6d5a2c1acbe8','2013-12-12 20:06:05','2013-12-13 00:09:00',0,1);
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
INSERT INTO `vessel` VALUES (1,'FASTCAT-M1','FM1',264,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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

-- Dump completed on 2013-12-13 14:52:49
