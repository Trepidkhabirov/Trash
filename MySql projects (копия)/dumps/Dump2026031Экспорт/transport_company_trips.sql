-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: transport_company
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Driver_id` bigint unsigned NOT NULL,
  `departure_point` varchar(100) NOT NULL,
  `arrival_point` varchar(100) NOT NULL,
  `departure_time` timestamp NOT NULL,
  `arrival_time` timestamp NOT NULL,
  `distance_km` decimal(8,2) NOT NULL,
  `total_cost` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`trip_id`),
  UNIQUE KEY `trip_id` (`trip_id`),
  KEY `Driver_id` (`Driver_id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`Driver_id`) REFERENCES `drivers` (`Driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (10001,102,'Москва','Тула','2025-11-20 03:00:00','2025-11-20 06:30:00',180.50,0.00),(10002,101,'Москва','Санкт-Петербург','2025-11-25 17:00:00','2025-11-26 03:30:00',710.00,0.00),(10003,104,'Москва','Рязань','2025-11-21 04:00:00','2025-11-21 07:15:00',200.00,0.00),(10004,103,'Москва','Калуга','2025-11-22 09:00:00','2025-11-22 12:15:00',190.00,0.00),(10005,105,'Москва','Владимир','2025-11-23 05:30:00','2025-11-23 08:45:00',190.00,0.00),(10006,106,'Москва','Нижний Новгород','2025-11-24 01:00:00','2025-11-24 06:20:00',420.00,0.00),(10007,107,'Москва','Воронеж','2025-11-25 00:00:00','2025-11-25 07:40:00',510.00,0.00),(10008,108,'Москва','Казань','2025-11-26 02:00:00','2025-11-26 13:30:00',820.00,0.00),(10009,109,'Москва','Тверь','2025-11-27 08:00:00','2025-11-27 11:20:00',180.00,0.00),(10010,110,'Москва','Смоленск','2025-11-28 04:00:00','2025-11-28 09:30:00',400.00,0.00),(10101,102,'Москва','Серпухов','2025-12-05 10:00:00','2025-12-05 12:00:00',100.00,0.00),(10102,102,'Москва','Подольск','2025-12-05 11:30:00','2025-12-05 13:00:00',40.00,0.00),(10103,103,'Москва','Орёл','2025-12-10 03:00:00','2025-12-10 08:00:00',380.00,0.00),(10104,103,'Москва','Брянск','2025-12-10 06:00:00','2025-12-10 11:30:00',380.00,0.00),(10105,104,'Москва','Коломна','2025-12-15 04:30:00','2025-12-15 06:45:00',120.00,0.00),(10106,104,'Москва','Тула','2025-12-15 05:00:00','2025-12-15 08:30:00',180.50,0.00),(10107,105,'Москва','Ярославль','2025-12-20 02:00:00','2025-12-20 06:00:00',270.00,0.00),(10108,105,'Москва','Кострома','2025-12-20 04:30:00','2025-12-20 09:00:00',330.00,0.00),(10109,106,'Москва','Екатеринбург','2025-12-18 15:00:00','2025-12-20 07:00:00',1780.00,0.00),(10110,106,'Москва','Самара','2025-12-19 18:00:00','2025-12-20 09:00:00',1050.00,0.00),(10111,101,'Москва','Рязань','2025-12-02 03:00:00','2025-12-02 07:00:00',200.00,10000.00),(10112,101,'Москва','Рязань','2025-12-02 03:00:00','2025-12-02 07:00:00',200.00,10000.00),(10113,101,'Москва','Рязань','2025-12-02 03:00:00','2025-12-02 07:00:00',200.00,0.00);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 11:20:32
