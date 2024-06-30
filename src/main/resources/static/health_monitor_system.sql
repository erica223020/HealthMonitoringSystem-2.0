CREATE DATABASE  IF NOT EXISTS `health_monitor_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `health_monitor_system`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: health_monitor_system
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `health_data`
--

DROP TABLE IF EXISTS `health_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `data_type` enum('weight','blood_sugar','blood_pressure','heart_rate') NOT NULL,
  `value` float NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `health_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_data`
--

LOCK TABLES `health_data` WRITE;
/*!40000 ALTER TABLE `health_data` DISABLE KEYS */;
INSERT INTO `health_data` VALUES (14,1,'weight',52,'2024-06-26 19:27:03'),(15,1,'weight',50,'2024-06-29 11:09:10'),(16,1,'blood_sugar',80,'2024-06-29 11:09:10'),(17,1,'blood_pressure',65,'2024-06-29 11:09:10'),(18,2,'weight',54,'2024-06-26 19:42:42'),(19,1,'heart_rate',55,'2024-06-29 11:09:10'),(29,2,'blood_pressure',132,'2024-06-27 10:05:29'),(60,2,'weight',133,'2024-06-27 11:09:36'),(62,2,'blood_pressure',50,'2024-06-27 11:53:27'),(63,2,'blood_pressure',55,'2024-06-27 11:56:04'),(64,2,'blood_sugar',43,'2024-06-27 13:02:12'),(65,2,'heart_rate',120,'2024-06-27 13:02:20'),(66,1,'blood_sugar',50,'2024-06-30 11:31:56'),(67,1,'weight',60,'2024-06-30 11:32:00'),(68,1,'blood_pressure',70,'2024-06-30 11:32:05'),(69,1,'heart_rate',120,'2024-06-30 11:32:09'),(70,1,'weight',43,'2024-06-30 13:15:54'),(71,1,'blood_sugar',100,'2024-06-30 19:04:21');
/*!40000 ALTER TABLE `health_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('male','female','other') NOT NULL DEFAULT 'other',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','active','inactive') DEFAULT 'pending',
  `birthday` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `reset_token` varchar(36) DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bobo@gmail.com','bobo','$2a$10$6nyb/Kg7uCNEZwAwK8yKIuoiKzCbhYWaGsl4G9Ewn1jb5/lMMbnba','male','2024-06-25 21:39:17','active','1985-05-15',39,NULL,NULL),(2,'bo@gmail.com','bobo','$2a$10$uX2TW5zBzN6fdjFgny4Dq.Xf5h.oMf6DhRibzi3DqDU6shcxfZN72','male','2024-06-26 15:21:59','active','2000-06-17',24,'dea05c52-af40-4e4a-8131-f193661090b1','2024-07-01 15:18:11'),(17,'qwr527785@gmail.com','test','$2a$10$DGKJN8l0Su4VPvbGQbUeGOCUIuRXLufD7S9lokPPTiGLcP/DbV47O','female','2024-06-30 15:36:06','pending','1960-05-05',64,'91344bd4-f9af-440a-9dc2-629930b50b29','2024-07-01 16:56:33'),(18,'abc@gmail.com','aaa','$2a$10$KwpDzjRzIROT.Bfj1SP.0ehOw5uitVDqIhwRHCKoZzFy/juuGoaJO','male','2024-06-30 17:58:52','pending','2014-05-16',10,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01  4:36:53
