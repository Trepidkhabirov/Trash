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
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL,
  `teacher_name` text,
  `position` text,
  `AcademicDegree` text,
  `Kafedry_id` int DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `teachersdept` (`Kafedry_id`),
  CONSTRAINT `teachersdept` FOREIGN KEY (`Kafedry_id`) REFERENCES `kafedry` (`Kafedry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (101,'Иванов И.И.','Профессор','Доктор наук',10),(102,'Петров П.П.','Доцент','Кандидат наук',10),(103,'Сидорова С.С.','Старший преподаватель','Кандидат наук',20),(104,'Кузнецов К.К.','Профессор','Доктор наук',20),(105,'Волков В.В.','Доцент','Доктор наук',30),(106,'Лебедева Л.Л.','Старший преподаватель','Без степени',30),(107,'Гусев Г.Г.','Профессор','Доктор наук',40),(108,'Соколова С.С.','Доцент','Кандидат наук',40),(109,'Ястребов Я.Я.','Доцент','Кандидат наук',50),(110,'Орлова О.О.','Старший преподаватель','Без степени',50),(111,'Соколов А.А.','Профессор','Доктор наук',60),(112,'Ковалева В.В.','Доцент','Кандидат наук',10),(120,'Иван','Доцент','Доктор наук',10),(121,'Иван','Доцент','Без степени',10);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
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
