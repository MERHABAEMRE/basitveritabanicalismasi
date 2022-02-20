-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 03, 2020 at 11:51 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ararapor2`
--

-- --------------------------------------------------------

--
-- Table structure for table `faaliyetler`
--

CREATE TABLE `faaliyetler` (
  `FAALİYET_İD` int(10) NOT NULL,
  `FAALİYET_AD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faaliyetler`
--

INSERT INTO `faaliyetler` (`FAALİYET_İD`, `FAALİYET_AD`) VALUES
(145, 'WEBTEKNOLOJİ'),
(324, 'DONANIM'),
(455, 'TEKNO'),
(467, 'ROBOT'),
(556, 'MARKETUYGULAMASI');

-- --------------------------------------------------------

--
-- Table structure for table `firma`
--

CREATE TABLE `firma` (
  `FİRMA_İD` int(10) NOT NULL,
  `FİRMA_AD` varchar(10) DEFAULT NULL,
  `FİRMA_FAX` bigint(15) NOT NULL,
  `FİRMA_TEL` bigint(15) NOT NULL,
  `FİRMA_MAİL` varchar(20) DEFAULT NULL,
  `FİRMA_ADRES` varchar(10) DEFAULT NULL,
  `FAALİYET_İD` int(10) NOT NULL,
  `HOLDİNG_İD` int(10) NOT NULL,
  `URUN_İD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `firma`
--

INSERT INTO `firma` (`FİRMA_İD`, `FİRMA_AD`, `FİRMA_FAX`, `FİRMA_TEL`, `FİRMA_MAİL`, `FİRMA_ADRES`, `FAALİYET_İD`, `HOLDİNG_İD`, `URUN_İD`) VALUES
(1, 'ALİ', 5454556445, 5454556457, 'ALİ@mail.com', 'Merkez', 455, 1, 1),
(2, 'EMRE', 5545585569, 5545585564, 'EMRE@mail.com', 'BEHZAT', 145, 2, 2),
(3, 'EDRO', 5565789845, 5565789843, 'EDRO@mail.com', 'AKÇAY', 467, 3, 3),
(4, 'MİKROS', 5664514883, 5664514882, 'MİK@mail.com', 'HÜRRİYET', 324, 4, 4),
(5, 'VELİ', 5345886547, 5345886542, 'VELİ@mail.com', 'TUZCUMURAT', 556, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `holding`
--

CREATE TABLE `holding` (
  `HOLDİNG_İD` int(10) NOT NULL,
  `HOLDİNG_AD` varchar(20) DEFAULT NULL,
  `HOLDİNG_TEL` bigint(10) NOT NULL,
  `HOLDİNG_FAX` bigint(10) NOT NULL,
  `HOLDİNG_ADRES` varchar(20) DEFAULT NULL,
  `HOLDİNG_MAİL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holding`
--

INSERT INTO `holding` (`HOLDİNG_İD`, `HOLDİNG_AD`, `HOLDİNG_TEL`, `HOLDİNG_FAX`, `HOLDİNG_ADRES`, `HOLDİNG_MAİL`) VALUES
(1, 'KOC', 5545474011, 5545474010, 'İSTANBUL', 'KOC@mail.com'),
(2, 'FİBA', 5545826008, 5326582348, 'ANKARA', 'FİBA@mail.com'),
(3, 'YILDIZ', 5545175026, 5545175025, 'BURSA', 'YIL@mail.com'),
(4, 'DOGUS', 5658454345, 5658435446, 'İZMİR', 'DOG@mail.com'),
(5, 'AGAOGLU', 5455474013, 5455474016, 'BALIKESİR', 'AGA@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `urun`
--

CREATE TABLE `urun` (
  `URUN_İD` int(10) NOT NULL,
  `URUN_AD` varchar(20) DEFAULT NULL,
  `URUN_MAALİYET` bigint(20) NOT NULL,
  `URUN_MİKTAR` bigint(20) NOT NULL,
  `URUN_FİYAT` bigint(20) NOT NULL,
  `URUN_SATISMİK` int(20) NOT NULL,
  `URUN_KAR` bigint(20) NOT NULL,
  `URETİM_TARİH` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `urun`
--

INSERT INTO `urun` (`URUN_İD`, `URUN_AD`, `URUN_MAALİYET`, `URUN_MİKTAR`, `URUN_FİYAT`, `URUN_SATISMİK`, `URUN_KAR`, `URETİM_TARİH`) VALUES
(1, 'ARABA', 30000, 5000, 75000, 1000, 45000000, 2019),
(2, 'WEBTASARIM', 100, 2000, 2000, 2000, 3800000, 2019),
(3, 'KOD', 10000, 50, 50000, 50, 2000000, 2019),
(4, 'KASA', 3000, 3000, 5000, 2500, 5000000, 2019),
(5, 'UYGULAMA', 500, 20000, 1000, 15000, 7500000, 2019);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faaliyetler`
--
ALTER TABLE `faaliyetler`
  ADD PRIMARY KEY (`FAALİYET_İD`);

--
-- Indexes for table `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`FİRMA_İD`),
  ADD KEY `FİRMA2` (`FAALİYET_İD`),
  ADD KEY `FİRMA` (`HOLDİNG_İD`),
  ADD KEY `FİRMA1` (`URUN_İD`);

--
-- Indexes for table `holding`
--
ALTER TABLE `holding`
  ADD PRIMARY KEY (`HOLDİNG_İD`),
  ADD KEY `HOLDİNG_ADRES` (`HOLDİNG_ADRES`);

--
-- Indexes for table `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`URUN_İD`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `FİRMA` FOREIGN KEY (`HOLDİNG_İD`) REFERENCES `holding` (`HOLDİNG_İD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FİRMA1` FOREIGN KEY (`URUN_İD`) REFERENCES `urun` (`URUN_İD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FİRMA2` FOREIGN KEY (`FAALİYET_İD`) REFERENCES `faaliyetler` (`FAALİYET_İD`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
