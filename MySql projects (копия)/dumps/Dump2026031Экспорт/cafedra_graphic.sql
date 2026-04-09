-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cafedra
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
-- Table structure for table `graphic`
--

DROP TABLE IF EXISTS `graphic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graphic` (
  `graphic_id` int DEFAULT NULL,
  `discipline_id` int DEFAULT NULL,
  `groups` text,
  `classType` text,
  `teacher_id` int DEFAULT NULL,
  `dayofweek` text,
  `time` text,
  `audiotoria` int DEFAULT NULL,
  KEY `graphicdisc` (`discipline_id`),
  KEY `graphicteacher` (`teacher_id`),
  CONSTRAINT `graphicdisc` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`Discipline_id`),
  CONSTRAINT `graphicteacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphic`
--

LOCK TABLES `graphic` WRITE;
/*!40000 ALTER TABLE `graphic` DISABLE KEYS */;
INSERT INTO `graphic` VALUES (1,1001,'ИС-21, ИС-22','Лекция',101,'Пн','8:00',305),(2,1001,'ИС-21','Лабораторная работа',102,'Пн','9:45',410),(3,1003,'ПИ-11','Лекция',104,'Пн','11:30',305),(4,1006,'ИС-21, ПИ-11','Лекция',105,'Пн','13:15',101),(5,1004,'ИС-22','Лабораторная работа',103,'Вт','8:00',512),(6,1002,'ИС-21','Семинар',112,'Вт','9:45',202),(9,1001,'ИС-22','Лабораторная работа',102,'Ср','8:00',410),(10,1005,'ПИ-11','Лекция',104,'Ср','9:45',305),(13,1003,'ПИ-12','Лабораторная работа',103,'Чт','8:00',511),(15,1004,'ПИ-11','Лабораторная работа',103,'Чт','11:30',512),(17,1002,'ИС-22','Лекция',101,'Пт','8:00',305),(18,1006,'ПИ-12','Семинар',105,'Пт','9:45',101),(20,1005,'ПИ-12','Лабораторная работа',112,'Сб','9:45',511),(1,1006,'23П-6','Лекция',105,'Пн','08:00:00',510);
/*!40000 ALTER TABLE `graphic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 11:20:34
