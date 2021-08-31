-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2014 at 11:22 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `databaseexample`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `OrderNumber` int(11) NOT NULL,
  `SKU` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(20,2) NOT NULL,
  `ExtendedPrice` decimal(20,2) NOT NULL,
  PRIMARY KEY (`OrderNumber`,`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`OrderNumber`, `SKU`, `Quantity`, `Price`, `ExtendedPrice`) VALUES
(1000, 201000, 1, '300.00', '300.00'),
(1000, 202000, 1, '130.00', '130.00'),
(2000, 101100, 4, '50.00', '200.00'),
(2000, 101200, 2, '50.00', '100.00'),
(3000, 100200, 1, '300.00', '300.00'),
(3000, 101100, 2, '50.00', '100.00'),
(3000, 101200, 1, '50.00', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `retail_order`
--

CREATE TABLE IF NOT EXISTS `retail_order` (
  `OrderNumber` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `StoreZip` int(11) NOT NULL,
  `OrderMonth` text NOT NULL,
  `OrderYear` int(11) NOT NULL,
  `OrderTotal` decimal(20,2) NOT NULL,
  PRIMARY KEY (`OrderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retail_order`
--

INSERT INTO `retail_order` (`OrderNumber`, `StoreNumber`, `StoreZip`, `OrderMonth`, `OrderYear`, `OrderTotal`) VALUES
(1000, 10, 98110, 'December', 2003, '445.00'),
(2000, 20, 2335, 'December', 2003, '310.00'),
(3000, 10, 98110, 'January', 2004, '480.00');

-- --------------------------------------------------------

--
-- Table structure for table `sku_data`
--

CREATE TABLE IF NOT EXISTS `sku_data` (
  `SKU` int(11) NOT NULL,
  `SKU_Description` text NOT NULL,
  `Department` text NOT NULL,
  `Buyer` text NOT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sku_data`
--

INSERT INTO `sku_data` (`SKU`, `SKU_Description`, `Department`, `Buyer`) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen'),
(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers'),
(201000, 'Half-dome Tent', 'Camping', 'Cindy Lo'),
(202000, 'Half-dome Tent Footprint', 'Camping', 'Cindy Lo'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin'),
(302000, 'Locking carbiner, oval', 'Climbing', 'Jerry Martin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
