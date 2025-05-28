-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 11:52 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `train_idtrain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`idcart`, `train_idtrain`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `carttype`
--

DROP TABLE IF EXISTS `carttype`;
CREATE TABLE `carttype` (
  `idcartType` int(11) NOT NULL,
  `cartType` varchar(45) NOT NULL,
  `seatAmount` int(11) DEFAULT NULL COMMENT '\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carttype`
--

INSERT INTO `carttype` (`idcartType`, `cartType`, `seatAmount`) VALUES
(1, '1 klasa', 50),
(2, '2 klasa', 80);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart_has_carttype`
--

DROP TABLE IF EXISTS `cart_has_carttype`;
CREATE TABLE `cart_has_carttype` (
  `cart_idcart` int(11) NOT NULL,
  `cartType_idcartType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart_has_carttype`
--

INSERT INTO `cart_has_carttype` (`cart_idcart`, `cartType_idcartType`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `idcity` int(11) NOT NULL,
  `cityName` varchar(45) NOT NULL,
  `zipCode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`idcity`, `cityName`, `zipCode`) VALUES
(1, 'Warszawa', '00-00'),
(2, 'Kraków', '30-00'),
(3, 'Gdańsk', '80-00'),
(4, 'Poznań', '60-00'),
(5, 'Łódź', '90-00'),
(6, 'Wrocław', '50-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `idCompany` int(11) NOT NULL,
  `CompanyName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`idCompany`, `CompanyName`) VALUES
(2, 'Koleje Mazowieckie'),
(1, 'PKP Intercity'),
(3, 'SKM Warszawa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platform`
--

DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `idplatform` int(11) NOT NULL,
  `platformNr` int(11) NOT NULL,
  `Station_idStation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`idplatform`, `platformNr`, `Station_idStation`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `raid`
--

DROP TABLE IF EXISTS `raid`;
CREATE TABLE `raid` (
  `idRaid` int(11) NOT NULL,
  `train_idtrain` int(11) NOT NULL,
  `raidDateTimeStrat` datetime NOT NULL,
  `dealy` datetime NOT NULL,
  `raidDateTimeEnd` datetime NOT NULL,
  `Seats avaliability_idSeats avaliability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `raid`
--

INSERT INTO `raid` (`idRaid`, `train_idtrain`, `raidDateTimeStrat`, `dealy`, `raidDateTimeEnd`, `Seats avaliability_idSeats avaliability`) VALUES
(1, 1, '2024-03-22 08:00:00', '0000-00-00 00:00:00', '2024-03-22 12:00:00', 1),
(2, 2, '2024-03-22 09:30:00', '0000-00-00 00:00:00', '2024-03-22 11:30:00', 1),
(3, 3, '2024-03-22 07:45:00', '0000-00-00 00:00:00', '2024-03-22 10:45:00', 2),
(4, 1, '2024-03-23 08:00:00', '0000-00-00 00:00:00', '2024-03-23 12:00:00', 1),
(5, 2, '2024-03-23 09:00:00', '0000-00-00 00:00:00', '2024-03-23 11:00:00', 2),
(6, 3, '2024-03-23 07:30:00', '0000-00-00 00:00:00', '2024-03-23 10:30:00', 1),
(7, 1, '2024-03-24 06:45:00', '0000-00-00 00:00:00', '2024-03-24 09:45:00', 1),
(8, 2, '2024-03-24 10:15:00', '0000-00-00 00:00:00', '2024-03-24 12:15:00', 2),
(9, 3, '2024-03-25 07:00:00', '0000-00-00 00:00:00', '2024-03-25 10:00:00', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `idroute` int(11) NOT NULL,
  `ride_idride` int(11) NOT NULL,
  `direction` tinyint(4) NOT NULL,
  `startstop` varchar(45) NOT NULL,
  `endstop` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`idroute`, `ride_idride`, `direction`, `startstop`, `endstop`) VALUES
(1, 1, 1, 'Warszawa Centralna', 'Kraków Główny'),
(2, 2, 1, 'Gdańsk Główny', 'Poznań Główny'),
(3, 3, 1, 'Warszawa Centralna', 'Gdańsk Główny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `route_has_stop`
--

DROP TABLE IF EXISTS `route_has_stop`;
CREATE TABLE `route_has_stop` (
  `route_idroute` int(11) NOT NULL,
  `stop_idstop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `route_has_stop`
--

INSERT INTO `route_has_stop` (`route_idroute`, `stop_idstop`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seats avaliability`
--

DROP TABLE IF EXISTS `seats avaliability`;
CREATE TABLE `seats avaliability` (
  `idSeats avaliability` int(11) NOT NULL,
  `seatsAvaliabilitystatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seats avaliability`
--

INSERT INTO `seats avaliability` (`idSeats avaliability`, `seatsAvaliabilitystatus`) VALUES
(2, 'brak'),
(1, 'dużo'),
(4, 'mało'),
(3, 'średnio');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `idStation` int(11) NOT NULL,
  `stationName` varchar(45) DEFAULT NULL,
  `city_idcity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`idStation`, `stationName`, `city_idcity`) VALUES
(1, 'Warszawa Centralna', 1),
(2, 'Kraków Główny', 2),
(3, 'Gdańsk Główny', 3),
(4, 'Poznań Główny', 4),
(5, 'Łódź Fabryczna', 5),
(6, 'Wrocław Główny', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stop`
--

DROP TABLE IF EXISTS `stop`;
CREATE TABLE `stop` (
  `idstop` int(11) NOT NULL,
  `arivalTime` datetime NOT NULL,
  `departureTime` datetime NOT NULL,
  `stopNr` int(11) NOT NULL,
  `Station_idStation` int(11) NOT NULL,
  `track_idtrack` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`idstop`, `arivalTime`, `departureTime`, `stopNr`, `Station_idStation`, `track_idtrack`) VALUES
(1, '2024-03-22 08:10:00', '2024-03-22 08:15:00', 1, 1, 1),
(2, '2024-03-22 11:50:00', '2024-03-22 11:55:00', 2, 2, 2),
(3, '2024-03-22 09:00:00', '2024-03-22 09:05:00', 3, 3, 1),
(4, '2024-03-22 10:30:00', '2024-03-22 10:35:00', 4, 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `track`
--

DROP TABLE IF EXISTS `track`;
CREATE TABLE `track` (
  `idtrack` int(11) NOT NULL,
  `trackNr` int(11) NOT NULL,
  `trackStatus` varchar(45) NOT NULL,
  `platform_idplatform` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`idtrack`, `trackNr`, `trackStatus`, `platform_idplatform`) VALUES
(1, 1, 'Wolny', 1),
(2, 2, 'Zajęty', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `train`
--

DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `idtrain` int(11) NOT NULL,
  `trainName` varchar(45) DEFAULT NULL,
  `Company_idCompany` int(11) NOT NULL,
  `trainType_idtrainType` int(11) NOT NULL,
  `trainStatus_idtrainStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`idtrain`, `trainName`, `Company_idCompany`, `trainType_idtrainType`, `trainStatus_idtrainStatus`) VALUES
(1, 'IC Sobieski', 1, 2, 1),
(2, 'KM Warszawa-Płock', 2, 1, 1),
(3, 'SKM S1', 3, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `traintype`
--

DROP TABLE IF EXISTS `traintype`;
CREATE TABLE `traintype` (
  `idtrainType` int(11) NOT NULL,
  `trainType` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `traintype`
--

INSERT INTO `traintype` (`idtrainType`, `trainType`) VALUES
(1, 'Pociąg osobowy'),
(2, 'Pociąg ekspresowy'),
(3, 'Pociąg towarowy');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD KEY `fk_cart_train1_idx` (`train_idtrain`);

--
-- Indeksy dla tabeli `carttype`
--
ALTER TABLE `carttype`
  ADD PRIMARY KEY (`idcartType`);

--
-- Indeksy dla tabeli `cart_has_carttype`
--
ALTER TABLE `cart_has_carttype`
  ADD PRIMARY KEY (`cart_idcart`,`cartType_idcartType`),
  ADD KEY `fk_cart_has_cartType_cartType1_idx` (`cartType_idcartType`),
  ADD KEY `fk_cart_has_cartType_cart1_idx` (`cart_idcart`);

--
-- Indeksy dla tabeli `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`idcity`),
  ADD UNIQUE KEY `zipCode_UNIQUE` (`zipCode`);

--
-- Indeksy dla tabeli `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`idCompany`),
  ADD UNIQUE KEY `CompanyName_UNIQUE` (`CompanyName`);

--
-- Indeksy dla tabeli `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`idplatform`),
  ADD UNIQUE KEY `platformNr_UNIQUE` (`platformNr`),
  ADD KEY `fk_platform_Station1_idx` (`Station_idStation`);

--
-- Indeksy dla tabeli `raid`
--
ALTER TABLE `raid`
  ADD PRIMARY KEY (`idRaid`),
  ADD KEY `fk_raid_train1_idx` (`train_idtrain`),
  ADD KEY `fk_raid_Seats avaliability1_idx` (`Seats avaliability_idSeats avaliability`);

--
-- Indeksy dla tabeli `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`idroute`),
  ADD KEY `fk_route_Przejazd1_idx` (`ride_idride`);

--
-- Indeksy dla tabeli `route_has_stop`
--
ALTER TABLE `route_has_stop`
  ADD PRIMARY KEY (`route_idroute`,`stop_idstop`),
  ADD KEY `fk_route_has_stop_stop1_idx` (`stop_idstop`),
  ADD KEY `fk_route_has_stop_route1_idx` (`route_idroute`);

--
-- Indeksy dla tabeli `seats avaliability`
--
ALTER TABLE `seats avaliability`
  ADD PRIMARY KEY (`idSeats avaliability`),
  ADD UNIQUE KEY `seatsAvaliabilitystatus_UNIQUE` (`seatsAvaliabilitystatus`);

--
-- Indeksy dla tabeli `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`idStation`),
  ADD KEY `fk_station_city1_idx` (`city_idcity`);

--
-- Indeksy dla tabeli `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`idstop`),
  ADD UNIQUE KEY `stopNr_UNIQUE` (`stopNr`),
  ADD KEY `fk_stop_Station1_idx` (`Station_idStation`),
  ADD KEY `fk_stop_track1_idx` (`track_idtrack`);

--
-- Indeksy dla tabeli `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`idtrack`),
  ADD KEY `fk_track_platform1_idx` (`platform_idplatform`);

--
-- Indeksy dla tabeli `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`idtrain`),
  ADD KEY `fk_train_Company1_idx` (`Company_idCompany`),
  ADD KEY `fk_train_trainType1_idx` (`trainType_idtrainType`);

--
-- Indeksy dla tabeli `traintype`
--
ALTER TABLE `traintype`
  ADD PRIMARY KEY (`idtrainType`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_train1` FOREIGN KEY (`train_idtrain`) REFERENCES `train` (`idtrain`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cart_has_carttype`
--
ALTER TABLE `cart_has_carttype`
  ADD CONSTRAINT `fk_cart_has_cartType_cart1` FOREIGN KEY (`cart_idcart`) REFERENCES `cart` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_has_cartType_cartType1` FOREIGN KEY (`cartType_idcartType`) REFERENCES `carttype` (`idcartType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `platform`
--
ALTER TABLE `platform`
  ADD CONSTRAINT `fk_platform_Station1` FOREIGN KEY (`Station_idStation`) REFERENCES `station` (`idStation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `raid`
--
ALTER TABLE `raid`
  ADD CONSTRAINT `fk_raid_Seats avaliability1` FOREIGN KEY (`Seats avaliability_idSeats avaliability`) REFERENCES `seats avaliability` (`idSeats avaliability`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_raid_train1` FOREIGN KEY (`train_idtrain`) REFERENCES `train` (`idtrain`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `fk_route_Przejazd1` FOREIGN KEY (`ride_idride`) REFERENCES `raid` (`idRaid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `route_has_stop`
--
ALTER TABLE `route_has_stop`
  ADD CONSTRAINT `fk_route_has_stop_route1` FOREIGN KEY (`route_idroute`) REFERENCES `route` (`idroute`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_route_has_stop_stop1` FOREIGN KEY (`stop_idstop`) REFERENCES `stop` (`idstop`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `fk_station_city1` FOREIGN KEY (`city_idcity`) REFERENCES `city` (`idcity`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stop`
--
ALTER TABLE `stop`
  ADD CONSTRAINT `fk_stop_Station1` FOREIGN KEY (`Station_idStation`) REFERENCES `station` (`idStation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stop_track1` FOREIGN KEY (`track_idtrack`) REFERENCES `track` (`idtrack`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `fk_track_platform1` FOREIGN KEY (`platform_idplatform`) REFERENCES `platform` (`idplatform`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `fk_train_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_train_trainType1` FOREIGN KEY (`trainType_idtrainType`) REFERENCES `traintype` (`idtrainType`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
