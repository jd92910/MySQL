-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `raid`
--

DROP TABLE IF EXISTS `raid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raid` (
  `idRaid` int(11) NOT NULL,
  `train_idtrain` int(11) NOT NULL,
  `raidDateTimeStrat` datetime NOT NULL,
  `dealy` datetime NOT NULL,
  `raidDateTimeEnd` datetime NOT NULL,
  `Seats avaliability_idSeats avaliability` int(11) NOT NULL,
  PRIMARY KEY (`idRaid`),
  KEY `fk_raid_train1_idx` (`train_idtrain`),
  KEY `fk_raid_Seats avaliability1_idx` (`Seats avaliability_idSeats avaliability`),
  CONSTRAINT `fk_raid_Seats avaliability1` FOREIGN KEY (`Seats avaliability_idSeats avaliability`) REFERENCES `seats avaliability` (`idSeats avaliability`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_raid_train1` FOREIGN KEY (`train_idtrain`) REFERENCES `train` (`idtrain`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raid`
--

LOCK TABLES `raid` WRITE;
/*!40000 ALTER TABLE `raid` DISABLE KEYS */;
INSERT INTO `raid` VALUES (1,1,'2024-03-22 08:00:00','0000-00-00 00:00:00','2024-03-22 12:00:00',1),(2,2,'2024-03-22 09:30:00','0000-00-00 00:00:00','2024-03-22 11:30:00',1),(3,3,'2024-03-22 07:45:00','0000-00-00 00:00:00','2024-03-22 10:45:00',2),(4,1,'2024-03-23 08:00:00','0000-00-00 00:00:00','2024-03-23 12:00:00',1),(5,2,'2024-03-23 09:00:00','0000-00-00 00:00:00','2024-03-23 11:00:00',2),(6,3,'2024-03-23 07:30:00','0000-00-00 00:00:00','2024-03-23 10:30:00',1),(7,1,'2024-03-24 06:45:00','0000-00-00 00:00:00','2024-03-24 09:45:00',1),(8,2,'2024-03-24 10:15:00','0000-00-00 00:00:00','2024-03-24 12:15:00',2),(9,3,'2024-03-25 07:00:00','0000-00-00 00:00:00','2024-03-25 10:00:00',1);
/*!40000 ALTER TABLE `raid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26  2:02:36
