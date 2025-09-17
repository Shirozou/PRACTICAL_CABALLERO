-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 02:24 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookstable`
--

DROP TABLE IF EXISTS `bookstable`;
CREATE TABLE IF NOT EXISTS `bookstable` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `author` varchar(25) NOT NULL,
  `category` varchar(25) NOT NULL,
  `publishedYear` int NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=9133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookstable`
--

INSERT INTO `bookstable` (`bookID`, `title`, `author`, `category`, `publishedYear`) VALUES
(1123, 'initialD', 'ArkneyRowanson', 'StreetRacing', 1990),
(9132, '0', '0', '0', 1987);

-- --------------------------------------------------------

--
-- Table structure for table `borrowtable`
--

DROP TABLE IF EXISTS `borrowtable`;
CREATE TABLE IF NOT EXISTS `borrowtable` (
  `borrowID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `memberID` int NOT NULL,
  `staffID` int NOT NULL,
  `borrowDate` date NOT NULL,
  PRIMARY KEY (`borrowID`),
  UNIQUE KEY `bookID` (`bookID`),
  UNIQUE KEY `memberID` (`memberID`),
  UNIQUE KEY `staffID` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=8812 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowtable`
--

INSERT INTO `borrowtable` (`borrowID`, `bookID`, `memberID`, `staffID`, `borrowDate`) VALUES
(7712, 1123, 922, 22, '2025-08-26'),
(8811, 9132, 911, 21, '2025-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `memberstable`
--

DROP TABLE IF EXISTS `memberstable`;
CREATE TABLE IF NOT EXISTS `memberstable` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `memberstable`
--

INSERT INTO `memberstable` (`memberID`, `name`, `email`, `mobile`, `address`) VALUES
(911, 'Fred', 'keithmed1@gmail.com', 2147483647, 'Trapiche'),
(922, 'Louis', 'karl44@gmail.com', 2147483647, 'Trapiche');

-- --------------------------------------------------------

--
-- Table structure for table `stafftable`
--

DROP TABLE IF EXISTS `stafftable`;
CREATE TABLE IF NOT EXISTS `stafftable` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stafftable`
--

INSERT INTO `stafftable` (`staffID`, `name`, `position`, `email`, `password`) VALUES
(21, 'Keith', 'cashier', 'keithmed1@gmail.com', 'kiethpogi'),
(22, 'Karl', 'cashier', 'karl44@gmail.com', 'karlobakeshop');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowtable`
--
ALTER TABLE `borrowtable`
  ADD CONSTRAINT `borrowtable_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `bookstable` (`bookID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrowtable_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `memberstable` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrowtable_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `stafftable` (`staffID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `memberstable`
--
ALTER TABLE `memberstable`
  ADD CONSTRAINT `memberstable_ibfk_1` FOREIGN KEY (`email`) REFERENCES `stafftable` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
