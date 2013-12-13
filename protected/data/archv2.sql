-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2013 at 10:30 AM
-- Server version: 5.5.31-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `archv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AuthAssignment`
--

INSERT INTO `AuthAssignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('Admin', '1', NULL, 'N;'),
('Inspector', '7', NULL, 'N;'),
('Tellers', '10', NULL, 'N;'),
('Tellers', '14', NULL, 'N;'),
('Tellers', '16', NULL, 'N;'),
('Tellers', '17', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AuthItem`
--

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Admin', 2, NULL, NULL, 'N;'),
('Admin.*', 1, NULL, NULL, 'N;'),
('Admin.BaggageType', 0, NULL, NULL, 'N;'),
('Admin.BaggageTypeAdd', 0, NULL, NULL, 'N;'),
('Admin.BaggageTypeUpdate', 0, NULL, NULL, 'N;'),
('Admin.CargoClass', 0, NULL, NULL, 'N;'),
('Admin.CargoClassAdd', 0, NULL, NULL, 'N;'),
('Admin.CargoClassUpdate', 0, NULL, NULL, 'N;'),
('Admin.CargoRate', 0, NULL, NULL, 'N;'),
('Admin.PassengerFare', 0, NULL, NULL, 'N;'),
('Admin.PassengerType', 0, NULL, NULL, 'N;'),
('Admin.PassengerTypeAdd', 0, NULL, NULL, 'N;'),
('Admin.PassengerTypeUpdate', 0, NULL, NULL, 'N;'),
('Admin.Port', 0, NULL, NULL, 'N;'),
('Admin.PortAdd', 0, NULL, NULL, 'N;'),
('Admin.PortUpdate', 0, NULL, NULL, 'N;'),
('Admin.Route', 0, NULL, NULL, 'N;'),
('Admin.RouteAdd', 0, NULL, NULL, 'N;'),
('Admin.RouteUpdate', 0, NULL, NULL, 'N;'),
('Admin.Seat', 0, NULL, NULL, 'N;'),
('Admin.SeatingClass', 0, NULL, NULL, 'N;'),
('Admin.SeatingClassAdd', 0, NULL, NULL, 'N;'),
('Admin.SeatingClassUpdate', 0, NULL, NULL, 'N;'),
('Admin.Vessel', 0, NULL, NULL, 'N;'),
('Admin.VesselAdd', 0, NULL, NULL, 'N;'),
('Admin.VesselUpdate', 0, NULL, NULL, 'N;'),
('Admin.Voyage', 0, NULL, NULL, 'N;'),
('Admin.VoyageAdd', 0, NULL, NULL, 'N;'),
('Admin.VoyageStatus', 0, NULL, NULL, 'N;'),
('Admin.VoyageUpdate', 0, NULL, NULL, 'N;'),
('App.*', 1, NULL, NULL, 'N;'),
('App.AdvCheckin', 0, NULL, NULL, 'N;'),
('App.Checkin', 0, NULL, NULL, 'N;'),
('App.EditableSaver', 0, NULL, NULL, 'N;'),
('App.GetCargoRates', 0, NULL, NULL, 'N;'),
('App.Manifest', 0, NULL, NULL, 'N;'),
('App.PassengerTicket', 0, NULL, NULL, 'N;'),
('App.Print', 0, NULL, NULL, 'N;'),
('App.RollingCargo', 0, NULL, NULL, 'N;'),
('App.SeatAll', 0, NULL, NULL, 'N;'),
('App.SeatMap', 0, NULL, NULL, 'N;'),
('App.SeatView', 0, NULL, NULL, 'N;'),
('App.SeriesNumber', 0, NULL, NULL, 'N;'),
('App.TicketCancel', 0, NULL, NULL, 'N;'),
('App.TicketingBooth', 0, NULL, NULL, 'N;'),
('App.TicketRefund', 0, NULL, NULL, 'N;'),
('App.Tickets', 0, NULL, NULL, 'N;'),
('App.TicketStats', 0, NULL, NULL, 'N;'),
('App.TransferForm', 0, NULL, NULL, 'N;'),
('App.WaybillCancel', 0, NULL, NULL, 'N;'),
('App.WaybillRefund', 0, NULL, NULL, 'N;'),
('App.Waybills', 0, NULL, NULL, 'N;'),
('Authenticated', 2, NULL, NULL, 'N;'),
('BarcodeGenerator.*', 1, NULL, NULL, 'N;'),
('BarcodeGenerator.GenerateBarcode', 0, NULL, NULL, 'N;'),
('Cashier', 2, 'Cashier', NULL, 'N;'),
('Guest', 2, NULL, NULL, 'N;'),
('Inspector', 2, 'Inspector', NULL, 'N;'),
('Report.*', 1, NULL, NULL, 'N;'),
('Report.DailyRevenue', 0, NULL, NULL, 'N;'),
('Report.DynamicVoyages', 0, NULL, NULL, 'N;'),
('Report.Tellers', 0, NULL, NULL, 'N;'),
('Site.*', 1, NULL, NULL, 'N;'),
('Site.Error', 0, NULL, NULL, 'N;'),
('Site.Index', 0, NULL, NULL, 'N;'),
('Site.Login', 0, NULL, NULL, 'N;'),
('Site.Logout', 0, NULL, NULL, 'N;'),
('Tellers', 2, 'Tellers', NULL, 'N;'),
('User.Activation.*', 1, NULL, NULL, 'N;'),
('User.Activation.Activation', 0, NULL, NULL, 'N;'),
('User.Admin.*', 1, NULL, NULL, 'N;'),
('User.Admin.Admin', 0, NULL, NULL, 'N;'),
('User.Admin.Create', 0, NULL, NULL, 'N;'),
('User.Admin.Delete', 0, NULL, NULL, 'N;'),
('User.Admin.Update', 0, NULL, NULL, 'N;'),
('User.Admin.View', 0, NULL, NULL, 'N;'),
('User.Default.*', 1, NULL, NULL, 'N;'),
('User.Default.Index', 0, NULL, NULL, 'N;'),
('User.Login.*', 1, NULL, NULL, 'N;'),
('User.Login.Login', 0, NULL, NULL, 'N;'),
('User.Logout.*', 1, NULL, NULL, 'N;'),
('User.Logout.Logout', 0, NULL, NULL, 'N;'),
('User.Profile.*', 1, NULL, NULL, 'N;'),
('User.Profile.Changepassword', 0, NULL, NULL, 'N;'),
('User.Profile.Edit', 0, NULL, NULL, 'N;'),
('User.Profile.Profile', 0, NULL, NULL, 'N;'),
('User.ProfileField.*', 1, NULL, NULL, 'N;'),
('User.ProfileField.Admin', 0, NULL, NULL, 'N;'),
('User.ProfileField.Create', 0, NULL, NULL, 'N;'),
('User.ProfileField.Delete', 0, NULL, NULL, 'N;'),
('User.ProfileField.Update', 0, NULL, NULL, 'N;'),
('User.ProfileField.View', 0, NULL, NULL, 'N;'),
('User.Recovery.*', 1, NULL, NULL, 'N;'),
('User.Recovery.Recovery', 0, NULL, NULL, 'N;'),
('User.Registration.*', 1, NULL, NULL, 'N;'),
('User.Registration.Registration', 0, NULL, NULL, 'N;'),
('User.User.*', 1, NULL, NULL, 'N;'),
('User.User.Index', 0, NULL, NULL, 'N;'),
('User.User.View', 0, NULL, NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AuthItemChild`
--

INSERT INTO `AuthItemChild` (`parent`, `child`) VALUES
('Tellers', 'Admin.PassengerFare'),
('Tellers', 'Admin.PassengerType'),
('Tellers', 'Admin.Voyage'),
('Tellers', 'Admin.VoyageAdd'),
('Tellers', 'Admin.VoyageStatus'),
('Tellers', 'Admin.VoyageUpdate'),
('Tellers', 'App.*'),
('Inspector', 'App.AdvCheckin'),
('Inspector', 'App.Checkin'),
('Inspector', 'App.EditableSaver'),
('Inspector', 'App.Print'),
('Inspector', 'App.SeatAll'),
('Inspector', 'App.SeatMap'),
('Inspector', 'App.SeatView'),
('Inspector', 'BarcodeGenerator.*'),
('Tellers', 'BarcodeGenerator.*'),
('Tellers', 'Report.*'),
('Inspector', 'Site.*'),
('Tellers', 'Site.*');

-- --------------------------------------------------------

--
-- Table structure for table `baggage`
--

CREATE TABLE IF NOT EXISTS `baggage` (
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
  KEY `waybill` (`waybill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `baggage_type`
--

CREATE TABLE IF NOT EXISTS `baggage_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `weight` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `baggage_type`
--

INSERT INTO `baggage_type` (`id`, `weight`, `description`, `price`, `active`) VALUES
(1, '1kg - 19kg', '', 20.00, 1),
(2, '20kg - 40kg', '', 50.00, 1),
(3, '40kg and above', '', 100.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bhistory_upload`
--

CREATE TABLE IF NOT EXISTS `bhistory_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage` int(11) NOT NULL,
  `is_uploaded` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voyage` (`voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cargo_class`
--

CREATE TABLE IF NOT EXISTS `cargo_class` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` tinytext,
  `lane_meter` int(11) DEFAULT NULL,
  `bundled_passenger` int(11) NOT NULL DEFAULT '2',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `cargo_class`
--

INSERT INTO `cargo_class` (`id`, `name`, `description`, `lane_meter`, `bundled_passenger`, `active`) VALUES
(1, 'Tricylce, Motorcycle', 'Below 3 meters', NULL, 2, 1),
(2, 'Multicab, Owner Type Jeep', '3 to 3.9 meters', NULL, 2, 1),
(3, 'Sedan, SUV', '4 to 4.9 meters', NULL, 2, 1),
(4, 'Single Tire Jeep, 4WD', '5 to 5.9 meters', NULL, 2, 1),
(5, 'ELF, Passenger Jeep (Double Tire)', '6 to 6.9 meters', NULL, 2, 1),
(6, 'Forward 6 Wheeler', '7 to 7.9 meters', NULL, 2, 1),
(7, '6 Wheeler Truck LC', '8 to 8.9 meters', NULL, 2, 1),
(8, '8 Wheeler Truck', '9 to 9.9 meters', NULL, 2, 1),
(9, '8 Wheeler, 10 Wheeler Truck', '10 to 10.9 meters', NULL, 2, 1),
(10, 'Bus', 'Bus', NULL, 2, 1),
(11, '10 Wheeler, Wing Van', '11 to 11.9 meters', NULL, 2, 1),
(12, 'Wing Van, 16 Wheeler Truck', '12 to 12.9 meters', NULL, 2, 1),
(13, 'Extended Truck', '13 to 13.9 meters', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cargo_fare_rates`
--

CREATE TABLE IF NOT EXISTS `cargo_fare_rates` (
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
  KEY `class` (`class`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `cargo_fare_rates`
--

INSERT INTO `cargo_fare_rates` (`id`, `route`, `class`, `lane_meter_rate`, `regular_rate`, `discounted_rate`, `discount`, `active`) VALUES
(1, 1, 1, 0, 720.00, 720.00, 0, 1),
(2, 1, 2, 0, 1344.00, 1250.00, 7, 1),
(3, 1, 3, 0, 1680.00, 1536.00, 9, 1),
(4, 1, 4, 0, 2016.00, 1700.00, 16, 1),
(5, 1, 5, 0, 2352.00, 1900.00, 19, 1),
(6, 1, 6, 0, 3024.00, 2300.00, 24, 1),
(7, 1, 7, 0, 3024.00, 2800.00, 7, 1),
(8, 1, 8, 0, 3360.00, 3000.00, 11, 1),
(9, 1, 9, 0, 3696.00, 3100.00, 16, 1),
(10, 1, 10, 0, 2580.00, 2580.00, 0, 1),
(11, 1, 11, 0, 4032.00, 3400.00, 16, 1),
(12, 1, 12, 0, 4368.00, 3686.00, 16, 1),
(13, 1, 13, 0, 4704.00, 4608.00, 2, 1),
(14, 2, 1, 0, 720.00, 720.00, 0, 1),
(15, 2, 2, 0, 1344.00, 1250.00, 7, 1),
(16, 2, 3, 0, 1680.00, 1536.00, 9, 1),
(17, 2, 4, 0, 2016.00, 1700.00, 16, 1),
(18, 2, 5, 0, 2352.00, 1900.00, 19, 1),
(19, 2, 6, 0, 3024.00, 2300.00, 24, 1),
(20, 2, 7, 0, 3024.00, 2800.00, 7, 1),
(21, 2, 8, 0, 3360.00, 3000.00, 11, 1),
(22, 2, 9, 0, 3696.00, 3100.00, 16, 1),
(23, 2, 10, 0, 2580.00, 2580.00, 0, 1),
(24, 2, 11, 0, 4032.00, 3400.00, 16, 1),
(25, 2, 12, 0, 4368.00, 3686.00, 16, 1),
(26, 2, 13, 0, 4704.00, 4608.00, 2, 1);

--
-- Triggers `cargo_fare_rates`
--
DROP TRIGGER IF EXISTS `CARGO_PRICE_UPDATE`;
DELIMITER //
CREATE TRIGGER `CARGO_PRICE_UPDATE` AFTER UPDATE ON `cargo_fare_rates`
 FOR EACH ROW BEGIN
        IF NEW.regular_rate <> OLD.regular_rate  THEN  
            INSERT INTO price_history (category,category_id,price,discounted_price,discount) VALUES(2,New.id,OLD.regular_rate,OLD.discounted_rate,OLD.discount);
        ELSEIF  NEW.discounted_rate <> OLD.discounted_rate THEN
 INSERT INTO price_history (category,category_id,price,discounted_price,discount) VALUES(2,New.id,OLD.regular_rate,OLD.discounted_rate,OLD.discount);
        END IF;
    END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `name`, `code`, `value`) VALUES
(1, 'booking', NULL, 206),
(2, 'ticket', NULL, 245),
(3, 'lading', NULL, 0),
(4, 'series', NULL, 191240);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE IF NOT EXISTS `passenger` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=246 ;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id`, `first_name`, `last_name`, `age`, `email`, `contact`, `middle_name`, `prefix`, `gender`, `civil_status`, `nationality`, `address`, `birth_date`) VALUES
(1, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(2, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(3, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(4, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(5, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(6, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(7, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(8, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(9, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(10, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(11, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(12, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(13, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(14, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(15, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(16, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(17, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(18, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(19, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(20, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(21, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(22, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(23, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(24, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(25, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(26, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(27, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(28, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(29, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(30, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(31, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(32, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(33, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(34, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(35, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(36, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(37, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(38, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(39, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(40, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(41, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(42, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(43, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(44, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(45, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(46, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(47, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(48, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(49, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(50, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(51, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(52, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(53, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(54, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(55, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(56, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(57, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(58, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(59, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(60, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(61, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(62, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(63, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(64, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(65, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(66, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(67, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(68, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(69, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(70, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(71, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(72, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(73, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(74, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(75, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(76, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(77, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(78, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(79, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(80, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(81, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(82, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(83, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(84, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(85, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(86, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(87, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(88, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(89, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(90, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(91, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(92, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(93, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(94, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(95, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(96, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(97, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(98, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(99, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(100, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(101, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(102, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(103, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(104, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(105, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(106, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(107, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(108, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(109, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(110, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(111, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(112, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(113, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(114, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(115, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(116, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(117, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(118, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(119, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(120, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(121, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(122, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(123, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(124, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(125, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(126, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(127, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(128, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(129, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(130, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(131, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(132, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(133, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(134, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(135, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(136, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(137, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(138, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(139, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(140, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(141, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(142, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(143, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(144, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(145, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(146, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(147, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(148, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(149, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(150, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(151, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(152, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(153, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(154, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(155, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(156, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(157, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(158, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(159, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(160, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(161, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(162, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(163, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(164, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(165, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(166, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(167, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(168, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(169, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(170, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(171, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(172, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(173, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(174, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(175, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(176, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(177, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(178, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(179, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(180, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(181, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(182, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(183, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(184, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(185, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(186, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(187, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(188, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(189, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(190, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(191, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(192, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(193, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(194, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(195, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(196, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(197, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(198, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(199, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(200, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(201, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(202, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(203, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(204, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(205, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(206, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(207, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(208, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(209, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(210, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(211, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(212, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(213, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(214, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(215, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(216, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(217, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(218, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(219, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(220, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(221, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(222, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(223, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(224, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(225, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(226, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(227, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(228, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(229, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(230, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(231, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(232, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(233, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(234, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(235, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(236, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(237, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(238, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(239, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(240, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(241, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(242, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(243, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(244, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00'),
(245, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_fare`
--

CREATE TABLE IF NOT EXISTS `passenger_fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `route` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `class` (`class`),
  KEY `route` (`route`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `passenger_fare`
--

INSERT INTO `passenger_fare` (`id`, `type`, `route`, `class`, `price`) VALUES
(1, 1, 1, 1, 300.00),
(2, 1, 1, 2, 180.00),
(3, 2, 1, 1, 240.00),
(4, 2, 1, 2, 144.00),
(5, 3, 1, 1, 240.00),
(6, 3, 1, 2, 144.00),
(7, 4, 1, 1, 150.00),
(8, 4, 1, 2, 90.00),
(9, 5, 1, 1, 0.00),
(10, 5, 1, 2, 0.00),
(11, 6, 1, 1, 240.00),
(12, 6, 1, 2, 144.00),
(13, 7, 1, 1, 0.00),
(14, 7, 1, 2, 0.00),
(15, 8, 1, 1, 230.00),
(16, 8, 1, 2, 180.00),
(17, 9, 1, 1, 184.00),
(18, 9, 1, 2, 144.00),
(19, 10, 1, 1, 0.00),
(20, 10, 1, 2, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_type`
--

CREATE TABLE IF NOT EXISTS `passenger_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `description` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `passenger_type`
--

INSERT INTO `passenger_type` (`id`, `name`, `code`, `description`, `active`) VALUES
(1, 'Full Fare', 'FF', NULL, 1),
(2, 'Student', 'SF', NULL, 1),
(3, 'Senior', 'SC', NULL, 1),
(4, 'Children', 'CF', NULL, 1),
(5, 'Infant', 'IF', NULL, 1),
(6, 'PWD', 'PWD', NULL, 1),
(7, 'w/ PASS ', 'WPASS ', NULL, 1),
(8, 'Weekday Promo Full-Fare ', 'WPF', NULL, 1),
(9, 'Weekday Promo Student/Senior/PWD ', 'WPSSPWD', NULL, 1),
(10, 'Driver/Assistant ', 'DA', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

CREATE TABLE IF NOT EXISTS `port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`id`, `code`, `name`) VALUES
(1, 'BAT', 'BATANGAS'),
(2, 'CAL', 'CALAPAN');

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE IF NOT EXISTS `price_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `discounted_price` decimal(20,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`user_id`, `lastname`, `firstname`) VALUES
(1, 'Santiago', 'Vhilly'),
(2, 'Demo', 'Demo'),
(3, 'Cabug-os', 'Neil'),
(4, 'Collera', 'Dandy'),
(5, 'One', 'Teller'),
(6, 'Fuentes', 'Ann Everette '),
(7, 'adelantar', 'rowell'),
(8, 'Muje', 'Anna Viguia'),
(9, 'factor', 'beverly kim'),
(10, 'lorque', 'mark john'),
(11, 'cabacang', 'alfeo'),
(12, 'Magistrado', 'Kenneth'),
(13, 'Marcellana', 'Elmer'),
(14, 'Mandigma', 'Anna'),
(15, 'Sadia', 'Michelle'),
(16, 'Bagro', 'Renz'),
(17, 'Suba', 'Arlene');

-- --------------------------------------------------------

--
-- Table structure for table `profiles_fields`
--

CREATE TABLE IF NOT EXISTS `profiles_fields` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `profiles_fields`
--

INSERT INTO `profiles_fields` (`id`, `varname`, `title`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `widget`, `widgetparams`, `position`, `visible`) VALUES
(1, 'lastname', 'Last Name', 'VARCHAR', '50', '3', 1, '', '', 'Incorrect Last Name (length between 3 and 50 characters).', '', '', '', '', 1, 3),
(2, 'firstname', 'First Name', 'VARCHAR', '50', '3', 1, '', '', 'Incorrect First Name (length between 3 and 50 characters).', '', '', '', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Rights`
--

CREATE TABLE IF NOT EXISTS `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_port` int(11) NOT NULL,
  `dest_port` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `source_port` (`source_port`),
  KEY `dest_port` (`dest_port`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `source_port`, `dest_port`, `name`) VALUES
(1, 1, 2, 'BATANGAS-CALAPAN'),
(2, 2, 1, 'CALAPAN-BATANGAS');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `departure_time` time NOT NULL,
  `departure_date` time NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE IF NOT EXISTS `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seating_class` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `seating_class` (`seating_class`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=265 ;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`id`, `seating_class`, `name`, `x`, `y`, `active`) VALUES
(1, 1, '1A', 1, 9, 1),
(2, 1, '1B', 1, 8, 1),
(3, 1, '1C', 1, 7, 1),
(4, 1, '1D', 1, 6, 1),
(5, 1, '1E', 1, 4, 1),
(6, 1, '1F', 1, 3, 1),
(7, 1, '1G', 1, 2, 1),
(8, 1, '2A', 2, 9, 1),
(9, 1, '2B', 2, 8, 1),
(10, 1, '2C', 2, 7, 1),
(11, 1, '2D', 2, 6, 1),
(12, 1, '2E', 2, 4, 1),
(13, 1, '2F', 2, 3, 1),
(14, 1, '2G', 2, 2, 1),
(15, 1, '3A', 3, 9, 1),
(16, 1, '3B', 3, 8, 1),
(17, 1, '3C', 3, 7, 1),
(18, 1, '3D', 3, 6, 1),
(19, 1, '3E', 3, 4, 1),
(20, 1, '3F', 3, 3, 1),
(21, 1, '3G', 3, 2, 1),
(22, 1, '4A', 4, 9, 1),
(23, 1, '4B', 4, 8, 1),
(24, 1, '4C', 4, 7, 1),
(25, 1, '4D', 4, 6, 1),
(26, 1, '4E', 4, 4, 1),
(27, 1, '4F', 4, 3, 1),
(28, 1, '4G', 4, 2, 1),
(29, 1, '5A', 5, 9, 1),
(30, 1, '5B', 5, 8, 1),
(31, 1, '5C', 5, 7, 1),
(32, 1, '5D', 5, 6, 1),
(33, 1, '5E', 5, 4, 1),
(34, 1, '5F', 5, 3, 1),
(35, 1, '5G', 5, 2, 1),
(36, 1, '6A', 6, 9, 1),
(37, 1, '6B', 6, 8, 1),
(38, 1, '6C', 6, 7, 1),
(39, 1, '6D', 6, 6, 1),
(40, 1, '6E', 6, 4, 1),
(41, 1, '6F', 6, 3, 1),
(42, 1, '6G', 6, 2, 1),
(43, 1, '7A', 7, 9, 1),
(44, 1, '7B', 7, 8, 1),
(45, 1, '7C', 7, 7, 1),
(46, 1, '7D', 7, 6, 1),
(47, 1, '7E', 7, 4, 1),
(48, 1, '7F', 7, 3, 1),
(49, 1, '7G', 7, 2, 1),
(50, 1, '8A', 8, 9, 1),
(51, 1, '8B', 8, 8, 1),
(52, 1, '8C', 8, 7, 1),
(53, 1, '8D', 8, 6, 1),
(54, 1, '8E', 8, 4, 1),
(55, 1, '8F', 8, 3, 1),
(56, 1, '8G', 8, 2, 1),
(57, 1, '9A', 9, 9, 1),
(58, 1, '9B', 9, 8, 1),
(59, 1, '9C', 9, 7, 1),
(60, 1, '9D', 9, 6, 1),
(61, 1, '9E', 9, 4, 1),
(62, 1, '9F', 9, 3, 1),
(63, 1, '9G', 9, 2, 1),
(64, 1, '10G', 11, 2, 1),
(65, 1, '10H', 11, 1, 1),
(66, 1, '11G', 12, 2, 1),
(67, 1, '11H', 12, 1, 1),
(68, 1, '12G', 13, 2, 1),
(69, 1, '12H', 13, 1, 1),
(70, 1, '13G', 14, 2, 1),
(71, 1, '13H', 14, 1, 1),
(72, 1, '14G', 15, 2, 1),
(73, 1, '14H', 15, 1, 1),
(74, 1, '15G', 16, 2, 1),
(75, 1, '15H', 16, 1, 1),
(76, 1, '16G', 17, 2, 1),
(77, 1, '16H', 17, 1, 1),
(78, 1, '17G', 18, 2, 1),
(79, 1, '17H', 18, 1, 1),
(80, 1, '18A', 19, 9, 1),
(81, 1, '18B', 19, 8, 1),
(82, 1, '18C', 19, 7, 1),
(83, 1, '18D', 19, 6, 1),
(84, 1, '18E', 19, 4, 1),
(85, 1, '18F', 19, 3, 1),
(86, 1, '18G', 19, 2, 1),
(87, 1, '19A', 20, 9, 1),
(88, 1, '19B', 20, 8, 1),
(89, 1, '19C', 20, 7, 1),
(90, 1, '19D', 20, 6, 1),
(91, 1, '19E', 20, 4, 1),
(92, 1, '19F', 20, 3, 1),
(93, 1, '19G', 20, 2, 1),
(94, 1, '20A', 21, 9, 1),
(95, 1, '20B', 21, 8, 1),
(96, 1, '20C', 21, 7, 1),
(97, 1, '20D', 21, 6, 1),
(98, 1, '20E', 21, 4, 1),
(99, 1, '20F', 21, 3, 1),
(100, 1, '20G', 21, 2, 1),
(101, 1, '21A', 22, 9, 1),
(102, 1, '21B', 22, 8, 1),
(103, 1, '21C', 22, 7, 1),
(104, 1, '21D', 22, 6, 1),
(105, 1, '21E', 22, 4, 1),
(106, 1, '21F', 22, 3, 1),
(107, 1, '21G', 22, 2, 1),
(108, 1, '22A', 23, 9, 1),
(109, 1, '22B', 23, 8, 1),
(110, 1, '22C', 23, 7, 1),
(111, 1, '22D', 23, 6, 1),
(112, 1, '22E', 23, 4, 1),
(113, 1, '22F', 23, 3, 1),
(114, 1, '22G', 23, 2, 1),
(115, 1, '23A', 24, 9, 1),
(116, 1, '23B', 24, 8, 1),
(117, 1, '23C', 24, 7, 1),
(118, 1, '23D', 24, 6, 1),
(119, 1, '23E', 24, 4, 1),
(120, 1, '23F', 24, 3, 1),
(121, 1, '23G', 24, 2, 1),
(122, 1, '24A', 25, 9, 1),
(123, 1, '24B', 25, 8, 1),
(124, 1, '24C', 25, 7, 1),
(125, 1, '24D', 25, 6, 1),
(126, 1, '24E', 25, 4, 1),
(127, 1, '24F', 25, 3, 1),
(128, 1, '24G', 25, 2, 1),
(129, 1, '25A', 26, 9, 1),
(130, 1, '25B', 26, 8, 1),
(131, 1, '25C', 26, 7, 1),
(132, 1, '25D', 26, 6, 1),
(133, 1, '25E', 26, 4, 1),
(134, 1, '25F', 26, 3, 1),
(135, 1, '25G', 26, 2, 1),
(136, 1, '26A', 27, 9, 1),
(137, 1, '26B', 27, 8, 1),
(138, 1, '26C', 27, 7, 1),
(139, 1, '26D', 27, 6, 1),
(140, 1, '26E', 27, 4, 1),
(141, 1, '26F', 27, 3, 1),
(142, 1, '26G', 27, 2, 1),
(143, 1, '27A', 28, 9, 1),
(144, 1, '27B', 28, 8, 1),
(145, 1, '27C', 28, 7, 1),
(146, 1, '27D', 28, 6, 1),
(147, 1, '27E', 28, 4, 1),
(148, 1, '27F', 28, 3, 1),
(149, 1, '27G', 28, 2, 1),
(150, 1, '28A', 29, 9, 1),
(151, 1, '28B', 29, 8, 1),
(152, 1, '28C', 29, 7, 1),
(153, 1, '28D', 29, 6, 1),
(154, 1, '28E', 29, 4, 1),
(155, 1, '28F', 29, 3, 1),
(156, 1, '28G', 29, 2, 1),
(157, 1, '29E', 30, 4, 1),
(158, 1, '29F', 30, 3, 1),
(159, 1, '29G', 30, 2, 1),
(160, 2, '30E', 1, 6, 1),
(161, 2, '30F', 1, 7, 1),
(162, 2, '30G', 1, 8, 1),
(163, 2, '31A', 2, 1, 1),
(164, 2, '31B', 2, 2, 1),
(165, 2, '31C', 2, 3, 1),
(166, 2, '31D', 2, 4, 1),
(167, 2, '31E', 2, 6, 1),
(168, 2, '31G', 2, 8, 1),
(169, 2, '31F', 2, 7, 1),
(170, 2, '32A', 3, 1, 1),
(171, 2, '32B', 3, 2, 1),
(172, 2, '32C', 3, 3, 1),
(173, 2, '32D', 3, 4, 1),
(174, 2, '32E', 3, 6, 1),
(175, 2, '32F', 3, 7, 1),
(176, 2, '32G', 3, 8, 1),
(177, 2, '33A', 4, 1, 1),
(178, 2, '33B', 4, 2, 1),
(179, 2, '33C', 4, 3, 1),
(180, 2, '33D', 4, 4, 1),
(181, 2, '33E', 4, 6, 1),
(182, 2, '33F', 4, 7, 1),
(183, 2, '33G', 4, 8, 1),
(184, 2, '34A', 5, 1, 1),
(185, 2, '34B', 5, 2, 1),
(186, 2, '34C', 5, 3, 1),
(187, 2, '34D', 5, 4, 1),
(188, 2, '34E', 5, 6, 1),
(189, 2, '35F', 6, 7, 1),
(190, 2, '34F', 5, 7, 1),
(191, 2, '34G', 5, 8, 1),
(192, 2, '35A', 6, 1, 1),
(193, 2, '35B', 6, 2, 1),
(194, 2, '35C', 6, 3, 1),
(195, 2, '35D', 6, 4, 1),
(196, 2, '35E', 6, 6, 1),
(197, 2, '35G', 6, 8, 1),
(198, 2, '36A', 7, 1, 1),
(199, 2, '36B', 7, 2, 1),
(200, 2, '36C', 7, 3, 1),
(201, 2, '36D', 7, 4, 1),
(202, 2, '36E', 7, 6, 1),
(203, 2, '36F', 7, 7, 1),
(204, 2, '36G', 7, 8, 1),
(205, 2, '37A', 8, 1, 1),
(206, 2, '37B', 8, 2, 1),
(207, 2, '37C', 8, 3, 1),
(208, 2, '37D', 8, 4, 1),
(209, 2, '37E', 8, 6, 1),
(210, 2, '37F', 8, 7, 1),
(211, 2, '37G', 8, 8, 1),
(212, 2, '38A', 9, 1, 1),
(213, 2, '38B', 9, 2, 1),
(214, 2, '38C', 9, 3, 1),
(215, 2, '38D', 9, 4, 1),
(216, 2, '38E', 9, 6, 1),
(217, 2, '38F', 9, 7, 1),
(218, 2, '38G', 9, 8, 1),
(219, 2, '39A', 10, 1, 1),
(220, 2, '39B', 10, 2, 1),
(221, 2, '39C', 10, 3, 1),
(222, 2, '39D', 10, 4, 1),
(223, 2, '39E', 10, 6, 1),
(224, 2, '39F', 10, 7, 1),
(225, 2, '39G', 10, 8, 1),
(226, 2, '40A', 11, 1, 1),
(227, 2, '40B', 11, 2, 1),
(228, 2, '40C', 11, 3, 1),
(229, 2, '40D', 11, 4, 1),
(230, 2, '40E', 11, 6, 1),
(231, 2, '40F', 11, 7, 1),
(232, 2, '40G', 11, 8, 1),
(233, 2, '41A', 12, 1, 1),
(234, 2, '41B', 12, 2, 1),
(235, 2, '41C', 12, 3, 1),
(236, 2, '41D', 12, 4, 1),
(237, 2, '41E', 12, 6, 1),
(238, 2, '41F', 12, 7, 1),
(239, 2, '41G', 12, 8, 1),
(240, 2, '42A', 13, 1, 1),
(241, 2, '42B', 13, 2, 1),
(242, 2, '42C', 13, 3, 1),
(243, 2, '42D', 13, 4, 1),
(244, 2, '42E', 13, 6, 1),
(245, 2, '42F', 13, 7, 1),
(246, 2, '42G', 13, 8, 1),
(247, 2, '43A', 14, 1, 1),
(248, 2, '43B', 14, 2, 1),
(249, 2, '43C', 14, 3, 1),
(250, 2, '43D', 14, 4, 1),
(251, 2, '43E', 14, 6, 1),
(252, 2, '43F', 14, 7, 1),
(253, 2, '43G', 14, 8, 1),
(254, 2, '44A', 15, 1, 1),
(255, 2, '44B', 15, 2, 1),
(256, 2, '44C', 15, 3, 1),
(257, 2, '44D', 15, 4, 1),
(258, 2, '44E', 15, 6, 1),
(259, 2, '44F', 15, 7, 1),
(260, 2, '44G', 15, 8, 1),
(261, 2, '45A', 16, 1, 1),
(262, 2, '45B', 16, 2, 1),
(263, 2, '45C', 16, 3, 1),
(264, 2, '45D', 16, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seating_class`
--

CREATE TABLE IF NOT EXISTS `seating_class` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `seating_class`
--

INSERT INTO `seating_class` (`id`, `name`, `code`, `description`, `rows`, `cols`, `active`) VALUES
(1, 'Business Class', 'BC', '', 9, 30, 1),
(2, 'Premium Economy', 'PE', '', 8, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext,
  `color` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `entity_id`, `name`, `description`, `color`, `active`) VALUES
(1, 1, 'Reserved', 'The booking is complete and has locked out further bookings for the same seat. No Payment is associated with this booking.', '#FFCC33', 1),
(2, 1, 'Reserved (Paid)', 'The booking has been completed, reserved, and a full payment has been received.', '#3366FF', 1),
(3, 1, 'Checked-In', 'Already Checked-In . ', '#66CC00', 1),
(4, 1, 'Boarded', 'Passenger already boarded', '#FF0066', 1),
(5, 1, 'No Show', 'The booking has been canceled. Locked seat assignment has been removed.', '#FF6666', 1),
(6, 1, 'Refunded', NULL, '#FF6666', 1),
(7, 1, 'Canceled', NULL, '#FF6666', 1),
(8, 2, 'Open', NULL, '', 1),
(9, 2, 'Advance Booking Closed', NULL, '', 1),
(10, 2, 'Voyage Closed', NULL, '', 1),
(11, 3, 'Paid', 'Excess baggage has been paid.', '#3366FF', 1),
(12, 3, 'Refunded', 'Excess baggage has been refunded.', '#FF6666', 1),
(13, 3, 'Canceled', 'Excess baggage has been canceled.', '#FF6666', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
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
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=246 ;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `passenger`, `voyage`, `seat`, `seating_class`, `transaction_no`, `ticket_no`, `series_no`, `booking_no`, `ticket_type`, `passenger_type`, `price_paid`, `status`, `created_by`) VALUES
(1, 1, 1, 160, 2, '', '000001', '191059', '000001', 2, 1, 180.00, 1, 14),
(2, 2, 1, 161, 2, '', '000002', '191060', '000002', 2, 1, 180.00, 1, 14),
(3, 3, 1, 162, 2, '', '000003', '191061', '000003', 2, 1, 180.00, 1, 14),
(4, 4, 1, 163, 2, '', '000004', '191062', '000003', 2, 1, 180.00, 1, 14),
(5, 5, 1, 164, 2, '', '000005', '191063', '000003', 2, 1, 180.00, 1, 14),
(6, 6, 1, 165, 2, '', '000006', '191064', '000004', 2, 2, 144.00, 1, 14),
(7, 7, 1, 166, 2, '', '000007', '191066', '000005', 2, 1, 180.00, 1, 14),
(8, 8, 1, 167, 2, '', '000008', '191067', '000005', 2, 1, 180.00, 1, 14),
(9, 9, 1, 169, 2, '', '000009', '191068', '000005', 2, 1, 180.00, 1, 14),
(10, 10, 1, 168, 2, '', '000010', '191069', '000005', 2, 1, 180.00, 1, 14),
(11, 11, 1, 170, 2, '', '000011', '191070', '000005', 2, 1, 180.00, 1, 14),
(12, 12, 1, 171, 2, '', '000012', '191071', '000005', 2, 1, 180.00, 1, 14),
(13, 13, 1, 172, 2, '', '000013', '191072', '000005', 2, 1, 180.00, 1, 14),
(14, 14, 1, 173, 2, '', '000014', '191073', '000006', 2, 4, 90.00, 1, 14),
(15, 15, 1, 1, 1, '', '000015', '191074', '000007', 2, 1, 300.00, 1, 14),
(16, 16, 1, 174, 2, '', '000016', '191075', '000008', 2, 1, 180.00, 1, 14),
(17, 17, 1, 175, 2, '', '000017', '191076', '000008', 2, 1, 180.00, 1, 14),
(18, 18, 1, 176, 2, '', '000018', '191077', '000008', 2, 1, 180.00, 1, 14),
(19, 19, 1, 177, 2, '', '000019', '191078', '000008', 2, 1, 180.00, 1, 14),
(20, 20, 1, 178, 2, '', '000020', '191079', '000009', 2, 2, 144.00, 1, 14),
(21, 21, 1, 179, 2, '', '000021', '191080', '000009', 2, 1, 180.00, 1, 14),
(22, 22, 1, 180, 2, '', '000022', '191081', '000010', 2, 1, 180.00, 1, 14),
(23, 23, 1, 181, 2, '', '000023', '191082', '000010', 2, 2, 144.00, 1, 14),
(24, 24, 1, 182, 2, '', '000024', '191083', '000011', 2, 1, 180.00, 1, 14),
(25, 25, 1, 183, 2, '', '000025', '191084', '000012', 2, 1, 180.00, 1, 14),
(26, 26, 1, 184, 2, '', '000026', '191085', '000013', 2, 1, 180.00, 1, 14),
(27, 27, 1, 185, 2, '', '000027', '191086', '000014', 2, 1, 180.00, 1, 14),
(28, 28, 1, 2, 1, '', '000028', '191087', '000015', 2, 1, 300.00, 1, 14),
(29, 29, 1, 3, 1, '', '000029', '191088', '000016', 2, 1, 300.00, 1, 14),
(30, 30, 1, 186, 2, '', '000030', '191089', '000017', 2, 1, 180.00, 1, 14),
(31, 31, 1, 187, 2, '', '000031', '191090', '000018', 2, 1, 180.00, 1, 14),
(32, 32, 1, 188, 2, '', '000032', '191091', '000019', 2, 1, 180.00, 1, 14),
(33, 33, 1, 190, 2, '', '000033', '191092', '000020', 2, 1, 180.00, 1, 14),
(34, 34, 1, 191, 2, '', '000034', '191093', '000021', 2, 2, 144.00, 1, 14),
(35, 35, 1, 192, 2, '', '000035', '191094', '000022', 2, 2, 144.00, 1, 14),
(36, 36, 1, 193, 2, '', '000036', '191095', '000023', 2, 1, 180.00, 1, 14),
(37, 37, 1, 194, 2, '', '000037', '191096', '000024', 2, 1, 180.00, 1, 14),
(38, 38, 1, 195, 2, '', '000038', '191097', '000025', 2, 2, 144.00, 1, 14),
(39, 39, 1, 196, 2, '', '000039', '191098', '000026', 2, 1, 180.00, 1, 14),
(40, 40, 1, 4, 1, '', '000040', '191099', '000027', 2, 1, 300.00, 1, 14),
(41, 41, 1, 189, 2, '', '000041', '191100', '000028', 2, 1, 180.00, 1, 14),
(42, 42, 1, 197, 2, '', '000042', '191101', '000029', 2, 1, 180.00, 1, 14),
(43, 43, 1, 198, 2, '', '000043', '191102', '000030', 2, 1, 180.00, 1, 14),
(44, 44, 1, 5, 1, '', '000044', '191103', '000031', 2, 1, 300.00, 1, 14),
(45, 45, 1, 199, 2, '', '000045', '191104', '000032', 2, 1, 180.00, 1, 14),
(46, 46, 1, 200, 2, '', '000046', '191105', '000033', 2, 2, 144.00, 1, 14),
(47, 47, 1, 201, 2, '', '000047', '191106', '000034', 2, 4, 90.00, 1, 14),
(48, 48, 1, 202, 2, '', '000048', '191107', '000035', 2, 1, 180.00, 1, 14),
(49, 49, 1, 203, 2, '', '000049', '191108', '000036', 2, 1, 180.00, 1, 14),
(50, 50, 1, 6, 1, '', '000050', '191109', '000037', 2, 1, 300.00, 1, 14),
(51, 51, 1, 204, 2, '', '000051', '191110', '000038', 2, 1, 180.00, 1, 14),
(52, 52, 1, 7, 1, '', '000052', '191111', '000039', 2, 1, 300.00, 1, 14),
(53, 53, 1, 205, 2, '', '000053', '191112', '000040', 2, 1, 180.00, 1, 14),
(54, 54, 1, 206, 2, '', '000054', '191113', '000041', 2, 1, 180.00, 1, 14),
(55, 55, 1, 207, 2, '', '000055', '191114', '000042', 2, 1, 180.00, 1, 14),
(56, 56, 1, 208, 2, '', '000056', '191115', '000043', 2, 3, 144.00, 1, 14),
(57, 57, 1, 209, 2, '', '000057', '191116', '000044', 2, 1, 180.00, 1, 14),
(58, 58, 1, 210, 2, '', '000058', '191117', '000045', 2, 2, 144.00, 1, 14),
(59, 59, 1, 211, 2, '', '000059', '191118', '000046', 2, 2, 144.00, 1, 14),
(60, 60, 1, 212, 2, '', '000060', '191119', '000047', 2, 1, 180.00, 1, 14),
(61, 61, 1, 213, 2, '', '000061', '191120', '000048', 2, 1, 180.00, 1, 14),
(62, 62, 1, 214, 2, '', '000062', '191121', '000049', 2, 1, 180.00, 1, 14),
(63, 63, 1, 215, 2, '', '000063', '191122', '000050', 2, 1, 180.00, 1, 14),
(64, 64, 1, 216, 2, '', '000064', '191123', '000051', 2, 1, 180.00, 1, 14),
(65, 65, 1, 217, 2, '', '000065', '191124', '000052', 2, 1, 180.00, 1, 14),
(66, 66, 1, 218, 2, '', '000066', '191125', '000053', 2, 3, 144.00, 1, 14),
(67, 67, 1, 219, 2, '', '000067', '191126', '000054', 2, 1, 180.00, 1, 14),
(68, 68, 1, 220, 2, '', '000068', '191127', '000055', 2, 1, 180.00, 1, 14),
(69, 69, 1, 8, 1, '', '000069', '191128', '000056', 2, 1, 300.00, 1, 14),
(70, 70, 1, 9, 1, '', '000070', '191129', '000057', 2, 1, 300.00, 1, 14),
(71, 71, 1, 10, 1, '', '000071', '191130', '000058', 2, 1, 300.00, 1, 14),
(72, 72, 1, 221, 2, '', '000072', '191131', '000059', 2, 1, 180.00, 1, 14),
(73, 73, 1, 222, 2, '', '000073', '191132', '000060', 2, 1, 180.00, 1, 14),
(74, 74, 1, 223, 2, '', '000074', '191133', '000061', 2, 1, 180.00, 1, 14),
(75, 75, 1, 224, 2, '', '000075', '191134', '000062', 2, 1, 180.00, 1, 14),
(76, 76, 1, 225, 2, '', '000076', '191135', '000063', 2, 1, 180.00, 1, 14),
(77, 77, 1, 11, 1, '', '000077', '191136', '000064', 2, 3, 240.00, 1, 14),
(78, 78, 1, 226, 2, '', '000078', '191137', '000065', 2, 2, 144.00, 1, 14),
(79, 79, 1, 227, 2, '', '000079', '191138', '000066', 2, 2, 144.00, 1, 14),
(80, 80, 1, 228, 2, '', '000080', '191139', '000067', 2, 2, 144.00, 1, 14),
(81, 81, 1, 229, 2, '', '000081', '191140', '000068', 2, 2, 144.00, 1, 14),
(82, 82, 1, 230, 2, '', '000082', '191141', '000069', 2, 1, 180.00, 1, 14),
(83, 83, 1, 231, 2, '', '000083', '191142', '000070', 2, 1, 180.00, 1, 14),
(84, 84, 1, 232, 2, '', '000084', '191143', '000071', 2, 1, 180.00, 1, 14),
(85, 85, 1, 233, 2, '', '000085', '191144', '000072', 2, 1, 180.00, 1, 14),
(86, 86, 1, 234, 2, '', '000086', '191145', '000073', 2, 1, 180.00, 1, 14),
(87, 87, 1, 12, 1, '', '000087', '191146', '000074', 2, 1, 300.00, 1, 14),
(88, 88, 1, 13, 1, '', '000088', '191147', '000075', 2, 1, 300.00, 1, 14),
(89, 89, 1, 14, 1, '', '000089', '191148', '000076', 2, 1, 300.00, 1, 14),
(90, 90, 1, 15, 1, '', '000090', '191149', '000077', 2, 1, 300.00, 1, 14),
(91, 91, 1, 16, 1, '', '000091', '191150', '000078', 2, 1, 300.00, 1, 14),
(92, 92, 1, 17, 1, '', '000092', '191151', '000079', 2, 3, 240.00, 1, 14),
(93, 93, 1, 18, 1, '', '000093', '191152', '000080', 2, 1, 300.00, 1, 14),
(94, 94, 1, 235, 2, '', '000094', '190129', '000081', 2, 2, 144.00, 1, 14),
(95, 95, 1, 236, 2, '', '000095', '190130', '000081', 2, 2, 144.00, 1, 14),
(96, 96, 1, 237, 2, '', '000096', '190131', '000081', 2, 2, 144.00, 1, 14),
(97, 97, 1, 238, 2, '', '000097', '190132', '000081', 2, 2, 144.00, 1, 14),
(98, 98, 1, 239, 2, '', '000098', '190133', '000081', 2, 2, 144.00, 1, 14),
(99, 99, 1, 240, 2, '', '000099', '190134', '000082', 2, 2, 144.00, 1, 14),
(100, 100, 1, 241, 2, '', '000100', '190135', '000082', 2, 2, 144.00, 1, 14),
(101, 101, 1, 242, 2, '', '000101', '190136', '000082', 2, 2, 144.00, 1, 14),
(102, 102, 1, 243, 2, '', '000102', '190137', '000082', 2, 2, 144.00, 1, 14),
(103, 103, 1, 244, 2, '', '000103', '190138', '000082', 2, 2, 144.00, 1, 14),
(104, 104, 1, 245, 2, '', '000104', '190139', '000082', 2, 2, 144.00, 1, 14),
(105, 105, 1, 246, 2, '', '000105', '190140', '000083', 2, 1, 180.00, 1, 14),
(106, 106, 1, 247, 2, '', '000106', '190141', '000083', 2, 1, 180.00, 1, 14),
(107, 107, 1, 248, 2, '', '000107', '190142', '000083', 2, 4, 90.00, 1, 14),
(108, 108, 1, 249, 2, '', '000108', '190143', '000083', 2, 4, 90.00, 1, 14),
(109, 109, 1, 250, 2, '', '000109', '190144', '000083', 2, 1, 180.00, 1, 14),
(110, 110, 1, 251, 2, '', '000110', '190145', '000083', 2, 1, 180.00, 1, 14),
(111, 111, 1, 19, 1, '', '000111', '190146', '000084', 2, 1, 300.00, 1, 14),
(112, 112, 1, 20, 1, '', '000112', '190147', '000084', 2, 2, 240.00, 1, 14),
(113, 113, 1, 252, 2, '', '000113', '10224', '000085', 2, 10, 0.00, 1, 14),
(114, 114, 1, 253, 2, '', '000114', '10225', '000085', 2, 10, 0.00, 1, 14),
(115, 115, 1, 254, 2, '', '000115', '10226', '000085', 2, 10, 0.00, 1, 14),
(116, 116, 1, 255, 2, '', '000116', '10227', '000085', 2, 10, 0.00, 1, 14),
(117, 117, 1, 256, 2, '', '000117', '10228', '000085', 2, 10, 0.00, 1, 14),
(118, 118, 1, 257, 2, '', '000118', '10229', '000086', 2, 1, 180.00, 1, 14),
(119, 119, 2, 160, 2, '', '000119', '191154', '000087', 2, 1, 180.00, 1, 17),
(120, 120, 2, 161, 2, '', '000120', '191155', '000088', 2, 1, 180.00, 1, 17),
(121, 121, 2, 162, 2, '', '000121', '191156', '000089', 2, 1, 180.00, 1, 17),
(122, 122, 2, 163, 2, '', '000122', '191157', '000090', 2, 3, 144.00, 1, 17),
(123, 123, 2, 164, 2, '', '000123', '191158', '000091', 2, 1, 180.00, 1, 17),
(124, 124, 2, 165, 2, '', '000124', '191159', '000092', 2, 3, 144.00, 1, 17),
(125, 125, 2, 166, 2, '', '000125', '191160', '000093', 2, 1, 180.00, 1, 17),
(126, 126, 2, 167, 2, '', '000126', '191161', '000094', 2, 1, 180.00, 1, 17),
(127, 127, 2, 169, 2, '', '000127', '191162', '000095', 2, 1, 180.00, 1, 17),
(128, 128, 2, 168, 2, '', '000128', '191163', '000096', 2, 1, 180.00, 1, 17),
(129, 129, 2, 1, 1, '', '000129', '191164', '000097', 2, 1, 300.00, 1, 17),
(130, 130, 2, 2, 1, '', '000130', '191165', '000098', 2, 1, 300.00, 1, 17),
(131, 131, 2, 3, 1, '', '000131', '191166', '000099', 2, 1, 300.00, 1, 17),
(132, 132, 2, 170, 2, '', '000132', '191167', '000100', 2, 2, 144.00, 1, 17),
(133, 133, 2, 4, 1, '', '000133', '191168', '000101', 2, 1, 300.00, 1, 17),
(134, 134, 2, 5, 1, '', '000134', '191169', '000102', 2, 1, 300.00, 1, 17),
(135, 135, 2, NULL, 2, '', '000135', '191170', '000103', 2, 1, 180.00, 7, 17),
(136, 136, 2, NULL, 2, '', '000136', '191171', '000104', 2, 1, 180.00, 7, 17),
(137, 137, 2, 6, 1, '', '000137', '191172', '000105', 2, 1, 300.00, 1, 17),
(138, 138, 2, 7, 1, '', '000138', '191173', '000106', 2, 1, 300.00, 1, 17),
(139, 139, 2, 8, 1, '', '000139', '191174', '000107', 2, 1, 300.00, 1, 17),
(140, 140, 2, 173, 2, '', '000140', '191175', '000108', 2, 1, 180.00, 1, 17),
(141, 141, 2, 174, 2, '', '000141', '191176', '000109', 2, 1, 180.00, 1, 17),
(142, 142, 2, 175, 2, '', '000142', '191177', '000110', 2, 1, 180.00, 1, 17),
(143, 143, 2, 176, 2, '', '000143', '191178', '000111', 2, 2, 144.00, 1, 17),
(144, 144, 2, 177, 2, '', '000144', '191179', '000112', 2, 1, 180.00, 1, 17),
(145, 145, 2, 178, 2, '', '000145', '191180', '000113', 2, 1, 180.00, 1, 17),
(146, 146, 2, 179, 2, '', '000146', '191181', '000114', 2, 1, 180.00, 1, 17),
(147, 147, 2, 180, 2, '', '000147', '191182', '000115', 2, 1, 180.00, 1, 17),
(148, 148, 2, 181, 2, '', '000148', '191183', '000116', 2, 2, 144.00, 1, 17),
(149, 149, 2, 182, 2, '', '000149', '191184', '000117', 2, 1, 180.00, 1, 17),
(150, 150, 2, 183, 2, '', '000150', '191185', '000118', 2, 1, 180.00, 1, 17),
(151, 151, 2, 184, 2, '', '000151', '191186', '000119', 2, 1, 180.00, 1, 17),
(152, 152, 2, 185, 2, '', '000152', '191187', '000120', 2, 1, 180.00, 1, 17),
(153, 153, 2, 186, 2, '', '000153', '191188', '000121', 2, 2, 144.00, 1, 17),
(154, 154, 2, 9, 1, '', '000154', '191189', '000122', 2, 3, 240.00, 1, 17),
(155, 155, 2, 10, 1, '', '000155', '191190', '000123', 2, 3, 240.00, 1, 17),
(156, 156, 2, 11, 1, '', '000156', '191191', '000124', 2, 2, 240.00, 1, 17),
(157, 157, 2, 12, 1, '', '000157', '191192', '000125', 2, 1, 300.00, 1, 17),
(158, 158, 2, 13, 1, '', '000158', '191193', '000126', 2, 1, 300.00, 1, 17),
(159, 159, 2, 14, 1, '', '000159', '191194', '000127', 2, 1, 300.00, 1, 17),
(160, 160, 2, 15, 1, '', '000160', '191195', '000128', 2, 1, 300.00, 1, 17),
(161, 161, 2, 187, 2, '', '000161', '191196', '000129', 2, 3, 144.00, 1, 17),
(162, 162, 2, 188, 2, '', '000162', '191197', '000130', 2, 1, 180.00, 1, 17),
(163, 163, 2, 16, 1, '', '000163', '191198', '000131', 2, 1, 300.00, 1, 17),
(164, 164, 2, 190, 2, '', '000164', '191199', '000132', 2, 1, 180.00, 1, 17),
(165, 165, 2, 191, 2, '', '000165', '191200', '000133', 2, 1, 180.00, 1, 17),
(166, 166, 2, 192, 2, '', '000166', '191201', '000134', 2, 1, 180.00, 1, 17),
(167, 167, 2, 193, 2, '', '000167', '191202', '000135', 2, 1, 180.00, 1, 17),
(168, 168, 2, 194, 2, '', '000168', '191203', '000136', 2, 3, 144.00, 1, 17),
(169, 169, 2, 195, 2, '', '000169', '191204', '000137', 2, 1, 180.00, 1, 17),
(170, 170, 2, 196, 2, '', '000170', '191205', '000138', 2, 1, 180.00, 1, 17),
(171, 171, 2, 189, 2, '', '000171', '191206', '000139', 2, 1, 180.00, 1, 17),
(172, 172, 2, 197, 2, '', '000172', '191207', '000140', 2, 3, 144.00, 1, 17),
(173, 173, 2, 198, 2, '', '000173', '191208', '000141', 2, 3, 144.00, 1, 17),
(174, 174, 2, 199, 2, '', '000174', '191209', '000142', 2, 3, 144.00, 1, 17),
(175, 175, 2, 200, 2, '', '000175', '191210', '000143', 2, 3, 144.00, 1, 17),
(176, 176, 2, 201, 2, '', '000176', '191211', '000144', 2, 1, 180.00, 1, 17),
(177, 177, 2, 202, 2, '', '000177', '191212', '000145', 2, 1, 180.00, 1, 17),
(178, 178, 2, 203, 2, '', '000178', '191213', '000146', 2, 1, 180.00, 1, 17),
(179, 179, 2, 204, 2, '', '000179', '191214', '000147', 2, 1, 180.00, 1, 17),
(180, 180, 2, 205, 2, '', '000180', '191215', '000148', 2, 1, 180.00, 1, 17),
(181, 181, 2, 206, 2, '', '000181', '191216', '000149', 2, 1, 180.00, 1, 17),
(182, 182, 2, 207, 2, '', '000182', '191217', '000150', 2, 1, 180.00, 1, 17),
(183, 183, 2, 208, 2, '', '000183', '191218', '000151', 2, 4, 90.00, 1, 17),
(184, 184, 2, 209, 2, '', '000184', '191219', '000152', 2, 1, 180.00, 1, 17),
(185, 185, 2, 210, 2, '', '000185', '191220', '000153', 2, 1, 180.00, 1, 17),
(186, 186, 2, 211, 2, '', '000186', '191221', '000154', 2, 3, 144.00, 1, 17),
(187, 187, 2, 212, 2, '', '000187', '191222', '000155', 2, 1, 180.00, 1, 17),
(188, 188, 2, 213, 2, '', '000188', '191223', '000156', 2, 4, 90.00, 1, 17),
(189, 189, 2, 214, 2, '', '000189', '191224', '000157', 2, 4, 90.00, 1, 17),
(190, 190, 2, 215, 2, '', '000190', '191225', '000158', 2, 2, 144.00, 1, 17),
(191, 191, 2, 216, 2, '', '000191', '191226', '000159', 2, 1, 180.00, 1, 17),
(192, 192, 2, 217, 2, '', '000192', '191227', '000160', 2, 1, 180.00, 1, 17),
(193, 193, 2, 218, 2, '', '000193', '191228', '000161', 2, 1, 180.00, 1, 17),
(194, 194, 2, 219, 2, '', '000194', '191229', '000162', 2, 4, 90.00, 1, 17),
(195, 195, 2, 220, 2, '', '000195', '191230', '000163', 2, 1, 180.00, 1, 17),
(196, 196, 2, 221, 2, '', '000196', '191231', '000164', 2, 1, 180.00, 1, 17),
(197, 197, 2, 222, 2, '', '000197', '191232', '000165', 2, 1, 180.00, 1, 17),
(198, 198, 2, 223, 2, '', '000198', '191233', '000166', 2, 1, 180.00, 1, 17),
(199, 199, 2, 224, 2, '', '000199', '191234', '000167', 2, 1, 180.00, 1, 17),
(200, 200, 2, 17, 1, '', '000200', '191235', '000168', 2, 2, 240.00, 1, 17),
(201, 201, 2, 225, 2, '', '000201', '191236', '000169', 2, 1, 180.00, 1, 17),
(202, 202, 2, 226, 2, '', '000202', '191237', '000170', 2, 1, 180.00, 1, 17),
(203, 203, 2, 227, 2, '', '000203', '191238', '000171', 2, 1, 180.00, 1, 17),
(204, 204, 2, 228, 2, '', '000204', '191239', '000172', 2, 3, 144.00, 1, 17),
(205, 205, 2, 18, 1, '', '000205', '190148', '000173', 2, 1, 300.00, 1, 17),
(206, 206, 2, 19, 1, '', '000206', '190149', '000174', 2, 1, 300.00, 1, 17),
(207, 207, 2, 20, 1, '', '000207', '190150', '000175', 2, 1, 300.00, 1, 17),
(208, 208, 2, 229, 2, '', '000208', '190151', '000176', 2, 1, 180.00, 1, 17),
(209, 209, 2, 230, 2, '', '000209', '190152', '000177', 2, 1, 180.00, 1, 17),
(210, 210, 2, 231, 2, '', '000210', '190153', '000178', 2, 1, 180.00, 1, 17),
(211, 211, 2, 232, 2, '', '000211', '190154', '000179', 2, 1, 180.00, 1, 17),
(212, 212, 2, 233, 2, '', '000212', '190155', '000180', 2, 1, 180.00, 1, 17),
(213, 213, 2, 234, 2, '', '000213', '190156', '000181', 2, 2, 144.00, 1, 17),
(214, 214, 2, 235, 2, '', '000214', '190157', '000182', 2, 2, 144.00, 1, 17),
(215, 215, 2, 236, 2, '', '000215', '190158', '000183', 2, 1, 180.00, 1, 17),
(216, 216, 2, 237, 2, '', '000216', '190159', '000184', 2, 1, 180.00, 1, 17),
(217, 217, 2, 238, 2, '', '000217', '190160', '000185', 2, 1, 180.00, 1, 17),
(218, 218, 2, 239, 2, '', '000218', '190161', '000186', 2, 1, 180.00, 1, 17),
(219, 219, 2, 240, 2, '', '000219', '190162', '000187', 2, 1, 180.00, 1, 17),
(220, 220, 2, 241, 2, '', '000220', '190163', '000188', 2, 1, 180.00, 1, 17),
(221, 221, 2, 242, 2, '', '000221', '190164', '000189', 2, 4, 90.00, 1, 17),
(222, 222, 2, 243, 2, '', '000222', '190165', '000190', 2, 4, 90.00, 1, 17),
(223, 223, 2, 244, 2, '', '000223', '190166', '000191', 2, 1, 180.00, 1, 17),
(224, 224, 2, 21, 1, '', '000224', '190167', '000192', 2, 3, 240.00, 1, 17),
(225, 225, 2, 171, 2, '', '000225', '10229', '000193', 2, 10, 0.00, 1, 17),
(226, 226, 2, 172, 2, '', '000226', '10230', '000194', 2, 10, 0.00, 1, 17),
(227, 227, 2, 245, 2, '', '000227', '10231', '000195', 2, 10, 0.00, 1, 17),
(228, 228, 2, 246, 2, '', '000228', '10232', '000196', 2, 10, 0.00, 1, 17),
(229, 229, 2, 247, 2, '', '000229', '10233', '000197', 2, 10, 0.00, 1, 17),
(230, 230, 2, 248, 2, '', '000230', '10234', '000198', 2, 10, 0.00, 1, 17),
(231, 231, 2, 249, 2, '', '000231', '10235', '000199', 2, 10, 0.00, 1, 17),
(232, 232, 2, 250, 2, '', '000232', '10236', '000200', 2, 10, 0.00, 1, 17),
(233, 233, 2, 251, 2, '', '000233', '10237', '000201', 2, 10, 0.00, 1, 17),
(234, 234, 2, 252, 2, '', '000234', '10238', '000202', 2, 10, 0.00, 1, 17),
(235, 235, 2, 253, 2, '', '000235', '10239', '000203', 2, 10, 0.00, 1, 17),
(236, 236, 2, 254, 2, '', '000236', '10240', '000204', 2, 10, 0.00, 1, 17),
(237, 237, 2, 255, 2, '', '000237', '10241', '000204', 2, 10, 0.00, 1, 17),
(238, 238, 2, 256, 2, '', '000238', '10242', '000204', 2, 10, 0.00, 1, 17),
(239, 239, 2, 257, 2, '', '000239', '10243', '000205', 2, 10, 0.00, 1, 17),
(240, 240, 2, 258, 2, '', '000240', '10244', '000205', 2, 10, 0.00, 1, 17),
(241, 241, 2, 259, 2, '', '000241', '10245', '000205', 2, 10, 0.00, 1, 17),
(242, 242, 2, 260, 2, '', '000242', '10246', '000205', 2, 10, 0.00, 1, 17),
(243, 243, 2, 261, 2, '', '000243', '10247', '000205', 2, 10, 0.00, 1, 17),
(244, 244, 2, NULL, 2, '', '000244', '10248', '000206', 2, 10, 0.00, 7, 17),
(245, 245, 2, NULL, 2, '', '000245', '10249', '000206', 2, 10, 0.00, 7, 17);

-- --------------------------------------------------------

--
-- Table structure for table `upgrades`
--

CREATE TABLE IF NOT EXISTS `upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage` int(11) NOT NULL,
  `ticket_series_no` varchar(100) DEFAULT NULL,
  `upgrade_series_no` varchar(100) DEFAULT NULL,
  `from_fare` int(11) NOT NULL,
  `to_fare` int(11) NOT NULL,
  `amt` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `voyage` (`voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activkey`, `create_at`, `lastvisit_at`, `superuser`, `status`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'webmaster@example.com', '9a24eff8c15a6a141ece27eb6947da0f', '2013-05-22 05:15:20', '2013-12-12 20:04:40', 1, 1),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '099f825543f7850cc038b90aaff39fac', '2013-05-22 05:15:20', '2013-07-25 02:29:08', 0, 1),
(3, 'neil', 'db684cf96914fce8df7d94353f73edfa', 'neil@imperium.ph', 'a15cea299e063b2b77eab0a29bb39197', '2013-07-18 12:02:48', '2013-08-28 09:58:32', 1, 1),
(4, 'yankie', '5a51e03713d250b961e1f706a51bc838', 'yankie@yankie.com', 'a11ec7013c87aedde046d9371916fac3', '2013-07-25 03:47:17', '2013-08-03 10:51:31', 1, 1),
(5, 'teller1', 'a23bb7f29e615f5002f5c2a3587aef53', 'teller@archi.com', 'baad0bcdde08c4c858e25eb7140b6c54', '2013-07-25 03:48:34', '2013-07-25 03:49:09', 0, 1),
(6, 'anneverette', '112225b7b9f48e642b14336e05ce778a', 'anneverette_fuentes@yahoo.com', '063c401709168e12406cd062847c59fe', '2013-07-31 05:56:52', '2013-08-03 08:20:03', 0, 1),
(7, 'rowelladelantar', 'e10adc3949ba59abbe56e057f20f883e', 'rowell_adelantar@yahoo.com', 'f3ef41c020709000fa8c3eb83fef89d7', '2013-07-31 05:57:55', '2013-12-11 21:14:32', 0, 1),
(8, 'annamuje', 'd758b08bf04484bbcc1cb136ece4af42', 'annamuje@yahoo.com', '120c5d507fca0e533861766fa096ca7a', '2013-07-31 06:03:13', '2013-08-01 23:55:19', 0, 1),
(9, 'kim', 'e8b21174b0d15a94b83c4f799a421a51', 'factorbeverlykim@yahoo.com', '8e5341a01b9ddaf88481c8e9c70bdf89', '2013-07-31 06:08:04', '2013-08-14 22:07:54', 0, 1),
(10, 'mlorque', '3455495112a761fc011a6e91a66b00c5', 'mlorque@yahoo.com', '39eebe0d634cf13377051ffb9d15f79c', '2013-07-31 06:10:51', '2013-12-12 22:34:37', 0, 1),
(11, 'alfeocabacang', 'b1d7aa8b0f2d45e2fe164e02a95a656f', 'alfeo.cabacang@fastcat.com', '27d19e05cb10881fa797fa97aa677dde', '2013-07-31 06:14:50', '2013-07-31 06:15:37', 0, 1),
(12, 'kenmag', '6dd63e79372d96058a0fb477e3013de5', 'magistradok@yahoo.com', '21797f3de006f82c83fab7f59f13a6ec', '2013-07-31 06:20:25', '2013-07-31 06:21:50', 0, 1),
(13, 'elmermarcellana', '465bc6b6c125a0cfede189aeaa27bcef', 'elmermarcellana@fast.com', '821c166e83e1530b20197ef2b5be2728', '2013-08-01 22:36:06', '2013-08-08 04:24:39', 0, 1),
(14, 'ana', '5390489da3971cbbcd22c159d54d24da', 'ana@test.ph', '4b6732a8a6b92464d00e278cac19cd96', '2013-09-04 12:22:32', '2013-12-12 13:17:31', 0, 1),
(15, 'michellesadia', '8f176754401cda515b0c4dc13561ba1f', 'michellesadia@archipelago.ph', 'df5422bd5519f3da3b280493fea60f2b', '2013-10-14 10:31:58', '2013-11-05 02:39:48', 0, 1),
(16, 'renzbagro', '223a2e41433150010c135306acdfcc60', 'renzbagro@archipelago.ph', '463a4944c5b96decc33a985c2c634122', '2013-10-14 10:39:19', '2013-12-12 09:15:50', 0, 1),
(17, 'arlene', '8eb5fb6bdabe99172656e0b4e150110f', 'arlene@fastcat.com.ph', 'fc12810f5f600336d44d6d5a2c1acbe8', '2013-12-12 20:06:05', '2013-12-13 00:09:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vessel`
--

CREATE TABLE IF NOT EXISTS `vessel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `blocked_seats` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vessel`
--

INSERT INTO `vessel` (`id`, `name`, `code`, `capacity`, `blocked_seats`) VALUES
(1, 'FASTCAT-M1', 'FM1', 264, '');

-- --------------------------------------------------------

--
-- Table structure for table `voyage`
--

CREATE TABLE IF NOT EXISTS `voyage` (
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
  KEY `vessel` (`vessel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `voyage`
--

INSERT INTO `voyage` (`id`, `number`, `vessel`, `route`, `departure_date`, `departure_time`, `arrival_time`, `capacity`, `available_seats`, `status`) VALUES
(1, 'FASTCAT-M1-611', 1, 1, '2013-12-12', '20:00:00', '21:30:00', 264, 146, 8),
(2, 'FASTCAT-M1-613', 1, 1, '2013-12-13', '06:00:00', '07:30:00', 264, 141, 8),
(3, 'FASTCAT-M1-615', 1, 1, '2013-12-13', '15:00:00', '16:30:00', 264, 264, 8);

--
-- Triggers `voyage`
--
DROP TRIGGER IF EXISTS `add_to_upload_queue`;
DELIMITER //
CREATE TRIGGER `add_to_upload_queue` AFTER UPDATE ON `voyage`
 FOR EACH ROW BEGIN

        IF  NEW.status = 10 THEN  
          INSERT IGNORE INTO  bhistory_upload (voyage) VALUES(New.id);
        END IF;     
        
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `waybill`
--

CREATE TABLE IF NOT EXISTS `waybill` (
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
  KEY `cargo_class_id` (`cargo_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AuthAssignment`
--
ALTER TABLE `AuthAssignment`
  ADD CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AuthItemChild`
--
ALTER TABLE `AuthItemChild`
  ADD CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baggage`
--
ALTER TABLE `baggage`
  ADD CONSTRAINT `baggage_ibfk_10` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `baggage_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `baggage_ibfk_5` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  ADD CONSTRAINT `baggage_ibfk_6` FOREIGN KEY (`ticket`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `baggage_ibfk_7` FOREIGN KEY (`waybill`) REFERENCES `waybill` (`id`),
  ADD CONSTRAINT `baggage_ibfk_8` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`),
  ADD CONSTRAINT `baggage_ibfk_9` FOREIGN KEY (`baggage_type`) REFERENCES `baggage_type` (`id`);

--
-- Constraints for table `cargo_fare_rates`
--
ALTER TABLE `cargo_fare_rates`
  ADD CONSTRAINT `cargo_fare_rates_ibfk_1` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  ADD CONSTRAINT `cargo_fare_rates_ibfk_2` FOREIGN KEY (`class`) REFERENCES `cargo_class` (`id`);

--
-- Constraints for table `passenger_fare`
--
ALTER TABLE `passenger_fare`
  ADD CONSTRAINT `passenger_fare_ibfk_1` FOREIGN KEY (`class`) REFERENCES `seating_class` (`id`),
  ADD CONSTRAINT `passenger_fare_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  ADD CONSTRAINT `passenger_fare_ibfk_3` FOREIGN KEY (`type`) REFERENCES `passenger_type` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Rights`
--
ALTER TABLE `Rights`
  ADD CONSTRAINT `Rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`source_port`) REFERENCES `port` (`id`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`dest_port`) REFERENCES `port` (`id`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`seating_class`) REFERENCES `seating_class` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_10` FOREIGN KEY (`seat`) REFERENCES `seat` (`id`),
  ADD CONSTRAINT `ticket_ibfk_11` FOREIGN KEY (`seating_class`) REFERENCES `seating_class` (`id`),
  ADD CONSTRAINT `ticket_ibfk_12` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  ADD CONSTRAINT `ticket_ibfk_9` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`);

--
-- Constraints for table `upgrades`
--
ALTER TABLE `upgrades`
  ADD CONSTRAINT `upgrades_ibfk_1` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`);

--
-- Constraints for table `voyage`
--
ALTER TABLE `voyage`
  ADD CONSTRAINT `voyage_ibfk_1` FOREIGN KEY (`vessel`) REFERENCES `vessel` (`id`),
  ADD CONSTRAINT `voyage_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route` (`id`),
  ADD CONSTRAINT `voyage_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`id`);

--
-- Constraints for table `waybill`
--
ALTER TABLE `waybill`
  ADD CONSTRAINT `waybill_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `waybill_ibfk_2` FOREIGN KEY (`voyage`) REFERENCES `voyage` (`id`),
  ADD CONSTRAINT `waybill_ibfk_3` FOREIGN KEY (`cargo_class`) REFERENCES `cargo_class` (`id`),
  ADD CONSTRAINT `waybill_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
