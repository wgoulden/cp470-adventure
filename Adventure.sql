-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 22, 2015 at 03:47 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Adventure`
--
CREATE DATABASE IF NOT EXISTS `Adventure` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Adventure`;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_Command`
--

DROP TABLE IF EXISTS `ADV_Command`;
CREATE TABLE IF NOT EXISTS `ADV_Command` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ThingTypeID` int(11) NOT NULL,
  `AdventureID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `IsStackable` tinyint(1) NOT NULL,
  `Value` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Table of All Things in the Adventure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_Event`
--

DROP TABLE IF EXISTS `ADV_Event`;
CREATE TABLE IF NOT EXISTS `ADV_Event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdventureID` int(11) NOT NULL,
  `EventTypeID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `String1` varchar(250) NOT NULL,
  `String2` varchar(250) NOT NULL,
  `String3` varchar(250) NOT NULL,
  `Value1` decimal(6,2) NOT NULL,
  `Value2` decimal(6,2) NOT NULL,
  `Value3` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Table of All Events in this Adventure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_EventPrereq`
--

DROP TABLE IF EXISTS `ADV_EventPrereq`;
CREATE TABLE IF NOT EXISTS `ADV_EventPrereq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) NOT NULL,
  `RequiredID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Event Prerequisites is this adventure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_Location`
--

DROP TABLE IF EXISTS `ADV_Location`;
CREATE TABLE IF NOT EXISTS `ADV_Location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdventureID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Table of all Locations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_LocationConnection`
--

DROP TABLE IF EXISTS `ADV_LocationConnection`;
CREATE TABLE IF NOT EXISTS `ADV_LocationConnection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FromID` int(11) NOT NULL,
  `Direction` varchar(100) NOT NULL,
  `ToID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Table of Location Connections' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ADV_LocationThing`
--

DROP TABLE IF EXISTS `ADV_LocationThing`;
CREATE TABLE IF NOT EXISTS `ADV_LocationThing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ThingID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adventure - Table of starting locations  of all things in a new play  ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MST_Action`
--

DROP TABLE IF EXISTS `MST_Action`;
CREATE TABLE IF NOT EXISTS `MST_Action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Master - Table of All Actions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MST_Adventure`
--

DROP TABLE IF EXISTS `MST_Adventure`;
CREATE TABLE IF NOT EXISTS `MST_Adventure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Master  - Table of all Adventures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MST_EventType`
--

DROP TABLE IF EXISTS `MST_EventType`;
CREATE TABLE IF NOT EXISTS `MST_EventType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Master - Table of all Event types' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MST_ThingType`
--

DROP TABLE IF EXISTS `MST_ThingType`;
CREATE TABLE IF NOT EXISTS `MST_ThingType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Master - Table of all Thing Types' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `STA_Event`
--

DROP TABLE IF EXISTS `STA_Event`;
CREATE TABLE IF NOT EXISTS `STA_Event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StateID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Order` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='State - Events that have occurred in this play through of the adventure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `STA_LocationThing`
--

DROP TABLE IF EXISTS `STA_LocationThing`;
CREATE TABLE IF NOT EXISTS `STA_LocationThing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SaveID` int(11) NOT NULL,
  `ThingID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='State - Current location of all of the things in a play through of the adventure' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `STA_Save`
--

DROP TABLE IF EXISTS `STA_Save`;
CREATE TABLE IF NOT EXISTS `STA_Save` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdventureID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `LocationID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='State - Saved state of an adventure play through' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
