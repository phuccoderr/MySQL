-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: weatherdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `code` varchar(12) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(64) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `region_name` varchar(128) NOT NULL,
  `trashed` bit(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('DANA_VN','Da Nang','VN','VietNam',_binary '','VietNam',_binary '\0'),('DELHI_IN','New Delhi','IN','India',_binary '','New York',_binary ''),('HG_VN','Da Nang','VN','VietNam',_binary '','VietNam',_binary '\0'),('HN_VN','Da Nang','VN','VietNam',_binary '','VietNam',_binary '\0'),('MBMH_IN','Mumbai','IN','India',_binary '','Maharashtra',_binary '\0'),('NYC_USA','New York City','US','United States of America',_binary '','New York',_binary '\0');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realtime_weather`
--

DROP TABLE IF EXISTS `realtime_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realtime_weather` (
  `location_code` varchar(12) NOT NULL,
  `humidity` int NOT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `precipitation` int NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `temperature` int NOT NULL,
  `wind_speed` int NOT NULL,
  PRIMARY KEY (`location_code`),
  CONSTRAINT `FKgvl48yx0pq95h8xw589p0mxui` FOREIGN KEY (`location_code`) REFERENCES `locations` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtime_weather`
--

LOCK TABLES `realtime_weather` WRITE;
/*!40000 ALTER TABLE `realtime_weather` DISABLE KEYS */;
INSERT INTO `realtime_weather` VALUES ('DANA_VN',42,'2024-01-07 16:27:38.958000',66,'Cloudy',40,70),('NYC_USA',32,'2024-01-07 16:20:17.504000',88,'Cloudy',30,50);
/*!40000 ALTER TABLE `realtime_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_hourly`
--

DROP TABLE IF EXISTS `weather_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_hourly` (
  `hour_of_day` int NOT NULL,
  `precipitation` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `temperature` int NOT NULL,
  `location_code` varchar(12) NOT NULL,
  PRIMARY KEY (`hour_of_day`,`location_code`),
  KEY `FKb9fne1kfqb2pp4ahjft9an5q9` (`location_code`),
  CONSTRAINT `FKb9fne1kfqb2pp4ahjft9an5q9` FOREIGN KEY (`location_code`) REFERENCES `locations` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_hourly`
--

LOCK TABLES `weather_hourly` WRITE;
/*!40000 ALTER TABLE `weather_hourly` DISABLE KEYS */;
INSERT INTO `weather_hourly` VALUES (0,30,'Cloudy',20,'NYC_USA'),(8,60,'Cloudy',20,'MBMH_IN'),(8,45,'Cloudy',40,'NYC_USA'),(9,60,'Cloudy',20,'MBMH_IN'),(10,60,'Cloudy',30,'MBMH_IN');
/*!40000 ALTER TABLE `weather_hourly` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 15:20:08
