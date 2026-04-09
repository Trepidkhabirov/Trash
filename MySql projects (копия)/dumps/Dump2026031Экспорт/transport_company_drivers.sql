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
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `Driver_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Driver_name` varchar(100) NOT NULL,
  `Class_driver` varchar(30) NOT NULL,
  `License_plate` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Driver_id`),
  UNIQUE KEY `Driver_id` (`Driver_id`),
  UNIQUE KEY `License_plate` (`License_plate`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`License_plate`) REFERENCES `vehicles` (`License_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (101,'Иванов Иван Иваныч','Первый','X777XX77'),(102,'Петров Пётр Петрович','Второй','A111AA77'),(103,'Сидоров Сергей Сергеич','Первый','В666ОР02'),(104,'Козлов Дмитрий Васильевич','Эконом','B222BB77'),(105,'Михайлов Михаил Михайлович','Первый','K555KK77'),(106,'Фёдоров Фёдор Фёдорович','Первый','Е777КХ77'),(107,'Алексеев Алексей Алексеевич','В','М999ММ50'),(108,'Николаев Николай Николаевич','Первый','Т123ТТ99'),(109,'Васильев Василий Васильевич','Эконом','Р888РР77'),(110,'Дмитриев Дмитрий Дмитриевич','Первый','О777ОО177');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
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
