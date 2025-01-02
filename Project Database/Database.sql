CREATE DATABASE  IF NOT EXISTS `movieticket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movieticket`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: movieticket
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Chanithu','chanithur3@gmail.com','GR64','08.03.2005','Male','admin'),(2,'Nohim','nohim2005@gmail.com','nohim2005','2005-06-12','male','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `show_id` int NOT NULL,
  `seat` varchar(5) NOT NULL,
  `show_time` varchar(20) NOT NULL,
  `show_name` varchar(45) NOT NULL,
  `booking_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount_paid` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_bookings_show_id` (`show_id`),
  KEY `bookings_ibfk_2` (`seat`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `fk_bookings_show_id` FOREIGN KEY (`show_id`) REFERENCES `shows_times` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,4,'I4','03:00PM','Batman Begins','2024-12-16 18:28:37',1000.00),(2,1,4,'A2','03:00PM','Batman Begins','2024-12-17 04:34:17',1000.00);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `director` varchar(250) NOT NULL,
  `releasedate` varchar(45) NOT NULL,
  `cast` varchar(450) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `poster` varchar(1000) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `trailer` varchar(500) NOT NULL,
  `categories` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `upcoming` int DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Inception','Christopher Nolan','2010.07.16','Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page','A skilled thief, the absolute best in the dangerous art of extraction, steals secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable.','https://movieswithaplottwist.com/wp-content/uploads/2016/03/Inception-movie-poster.jpg','148','https://www.youtube.com/watch?v=YoHD9XEInc0','Action · Adventure','8.8',1),(2,'Titanic','James Cameron','1997.12.19','Leonardo DiCaprio, Kate Winslet, Billy Zane','A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.','https://th.bing.com/th/id/R.3aa1f8bcf2e33c6ae0aeebf9a3cb5d9e?rik=4HUml7VcLvjpAw&pid=ImgRaw&r=0','195','https://www.youtube.com/watch?v=kVrqfYjkTdQ','Drama · Romance','7.9',1),(3,'The Matrix','The Wachowskis','1999.03.31','Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss','A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.','https://picfiles.alphacoders.com/385/385304.jpg','136','https://www.youtube.com/watch?v=m8e-FF8MsqU','Action · Sci-Fi','8.7',0),(4,'Batman Begins',' Christopher Nolan','2005.06.17','Christian Bale, Michael Caine, Ken Watanabe, Liam Neeson','A 2005 superhero film directed by Sir Christopher Nolan and written by Nolan and David S. Goyer. Based on the DC Comics character Batman, it stars Christian Bale as Bruce Wayne / Batman','https://mir-s3-cdn-cf.behance.net/project_modules/fs/0f0c2281719625.5d0842679b27f.jpg','140','https://www.youtube.com/watch?v=neY2xVmOfUM','Action · Drama','8.2',0),(5,'Sonic the Hedgehog 3','Jeff Fowler','2024.12.20','Jim Carrey, Ben Schwartz, Keanu Reeves','Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched, Team Sonic must seek out an unlikely alliance.','https://i.pinimg.com/originals/d9/3d/fe/d93dfec5d780988d6b61dd0fe4808804.jpg','110','https://www.youtube.com/watch?v=fHqcyjbqE8U','Adventure Comedy','5.9',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `theater_id` int NOT NULL,
  `srow` varchar(5) NOT NULL,
  `snumber` int NOT NULL,
  `is_booked` tinyint(1) DEFAULT '0',
  `booked_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,1,'A',1,0,NULL),(2,1,'A',2,0,NULL),(3,1,'A',3,0,NULL),(4,1,'A',4,0,NULL),(5,1,'A',5,0,NULL),(6,1,'A',6,0,NULL),(7,1,'A',7,0,NULL),(8,1,'A',8,0,NULL),(9,1,'A',9,0,NULL),(10,1,'A',10,0,NULL),(11,1,'A',11,0,NULL),(12,1,'A',12,0,NULL),(13,1,'A',13,0,NULL),(14,1,'A',14,0,NULL),(15,1,'A',15,0,NULL),(16,1,'A',16,0,NULL),(17,1,'A',17,0,NULL),(18,1,'A',18,0,NULL),(19,1,'A',19,0,NULL),(20,1,'A',20,0,NULL),(21,1,'B',1,0,NULL),(22,1,'B',2,0,NULL),(23,1,'B',3,0,NULL),(24,1,'B',4,0,NULL),(25,1,'B',5,0,NULL),(26,1,'B',6,0,NULL),(27,1,'B',7,0,NULL),(28,1,'B',8,0,NULL),(29,1,'B',9,0,NULL),(30,1,'B',10,0,NULL),(31,1,'B',11,0,NULL),(32,1,'B',12,0,NULL),(33,1,'B',13,0,NULL),(34,1,'B',14,0,NULL),(35,1,'B',15,0,NULL),(36,1,'B',16,0,NULL),(37,1,'B',17,0,NULL),(38,1,'B',18,0,NULL),(39,1,'B',19,0,NULL),(40,1,'B',20,0,NULL),(41,1,'C',1,0,NULL),(42,1,'C',2,0,NULL),(43,1,'C',3,0,NULL),(44,1,'C',4,0,NULL),(45,1,'C',5,0,NULL),(46,1,'C',6,0,NULL),(47,1,'C',7,0,NULL),(48,1,'C',8,0,NULL),(49,1,'C',9,0,NULL),(50,1,'C',10,0,NULL),(51,1,'C',11,0,NULL),(52,1,'C',12,0,NULL),(53,1,'C',13,0,NULL),(54,1,'C',14,0,NULL),(55,1,'C',15,0,NULL),(56,1,'C',16,0,NULL),(57,1,'C',17,0,NULL),(58,1,'C',18,0,NULL),(59,1,'C',19,0,NULL),(60,1,'C',20,0,NULL),(61,1,'D',1,0,NULL),(62,1,'D',2,0,NULL),(63,1,'D',3,0,NULL),(64,1,'D',4,0,NULL),(65,1,'D',5,0,NULL),(66,1,'D',6,0,NULL),(67,1,'D',7,0,NULL),(68,1,'D',8,0,NULL),(69,1,'D',9,0,NULL),(70,1,'D',10,0,NULL),(71,1,'D',11,0,NULL),(72,1,'D',12,0,NULL),(73,1,'D',13,0,NULL),(74,1,'D',14,0,NULL),(75,1,'D',15,0,NULL),(76,1,'D',16,0,NULL),(77,1,'D',17,0,NULL),(78,1,'D',18,0,NULL),(79,1,'D',19,0,NULL),(80,1,'D',20,0,NULL),(81,1,'E',1,0,NULL),(82,1,'E',2,0,NULL),(83,1,'E',3,0,NULL),(84,1,'E',4,0,NULL),(85,1,'E',5,0,NULL),(86,1,'E',6,0,NULL),(87,1,'E',7,0,NULL),(88,1,'E',8,0,NULL),(89,1,'E',9,0,NULL),(90,1,'E',10,0,NULL),(91,1,'E',11,0,NULL),(92,1,'E',12,0,NULL),(93,1,'E',13,0,NULL),(94,1,'E',14,0,NULL),(95,1,'E',15,0,NULL),(96,1,'E',16,0,NULL),(97,1,'E',17,0,NULL),(98,1,'E',18,0,NULL),(99,1,'E',19,0,NULL),(100,1,'E',20,0,NULL),(101,2,'A',1,0,NULL),(102,2,'A',2,0,NULL),(103,2,'A',3,0,NULL),(104,2,'A',4,0,NULL),(105,2,'A',5,0,NULL),(106,2,'A',6,0,NULL),(107,2,'A',7,0,NULL),(108,2,'A',8,0,NULL),(109,2,'A',9,0,NULL),(110,2,'A',10,0,NULL),(111,2,'A',11,0,NULL),(112,2,'A',12,0,NULL),(113,2,'A',13,0,NULL),(114,2,'A',14,0,NULL),(115,2,'A',15,0,NULL),(116,2,'A',16,0,NULL),(117,2,'A',17,0,NULL),(118,2,'A',18,0,NULL),(119,2,'A',19,0,NULL),(120,2,'A',20,0,NULL),(121,2,'B',1,0,NULL),(122,2,'B',2,0,NULL),(123,2,'B',3,0,NULL),(124,2,'B',4,0,NULL),(125,2,'B',5,0,NULL),(126,2,'B',6,0,NULL),(127,2,'B',7,0,NULL),(128,2,'B',8,0,NULL),(129,2,'B',9,0,NULL),(130,2,'B',10,0,NULL),(131,2,'B',11,0,NULL),(132,2,'B',12,0,NULL),(133,2,'B',13,0,NULL),(134,2,'B',14,0,NULL),(135,2,'B',15,0,NULL),(136,2,'B',16,0,NULL),(137,2,'B',17,0,NULL),(138,2,'B',18,0,NULL),(139,2,'B',19,0,NULL),(140,2,'B',20,0,NULL),(141,2,'C',1,0,NULL),(142,2,'C',2,0,NULL),(143,2,'C',3,0,NULL),(144,2,'C',4,0,NULL),(145,2,'C',5,0,NULL),(146,2,'C',6,0,NULL),(147,2,'C',7,0,NULL),(148,2,'C',8,0,NULL),(149,2,'C',9,0,NULL),(150,2,'C',10,0,NULL),(151,2,'C',11,0,NULL),(152,2,'C',12,0,NULL),(153,2,'C',13,0,NULL),(154,2,'C',14,0,NULL),(155,2,'C',15,0,NULL),(156,2,'C',16,0,NULL),(157,2,'C',17,0,NULL),(158,2,'C',18,0,NULL),(159,2,'C',19,0,NULL),(160,2,'C',20,0,NULL),(161,2,'D',1,0,NULL),(162,2,'D',2,0,NULL),(163,2,'D',3,0,NULL),(164,2,'D',4,0,NULL),(165,2,'D',5,0,NULL),(166,2,'D',6,0,NULL),(167,2,'D',7,0,NULL),(168,2,'D',8,0,NULL),(169,2,'D',9,0,NULL),(170,2,'D',10,0,NULL),(171,2,'D',11,0,NULL),(172,2,'D',12,0,NULL),(173,2,'D',13,0,NULL),(174,2,'D',14,0,NULL),(175,2,'D',15,0,NULL),(176,2,'D',16,0,NULL),(177,2,'D',17,0,NULL),(178,2,'D',18,0,NULL),(179,2,'D',19,0,NULL),(180,2,'D',20,0,NULL),(181,2,'E',1,0,NULL),(182,2,'E',2,0,NULL),(183,2,'E',3,0,NULL),(184,2,'E',4,0,NULL),(185,2,'E',5,0,NULL),(186,2,'E',6,0,NULL),(187,2,'E',7,0,NULL),(188,2,'E',8,0,NULL),(189,2,'E',9,0,NULL),(190,2,'E',10,0,NULL),(191,2,'E',11,0,NULL),(192,2,'E',12,0,NULL),(193,2,'E',13,0,NULL),(194,2,'E',14,0,NULL),(195,2,'E',15,0,NULL),(196,2,'E',16,0,NULL),(197,2,'E',17,0,NULL),(198,2,'E',18,0,NULL),(199,2,'E',19,0,NULL),(200,2,'E',20,0,NULL),(201,3,'A',1,0,NULL),(202,3,'A',2,0,NULL),(203,3,'A',3,0,NULL),(204,3,'A',4,0,NULL),(205,3,'A',5,0,NULL),(206,3,'A',6,0,NULL),(207,3,'A',7,0,NULL),(208,3,'A',8,0,NULL),(209,3,'A',9,0,NULL),(210,3,'A',10,0,NULL),(211,3,'A',11,0,NULL),(212,3,'A',12,0,NULL),(213,3,'A',13,0,NULL),(214,3,'A',14,0,NULL),(215,3,'A',15,0,NULL),(216,3,'A',16,0,NULL),(217,3,'A',17,0,NULL),(218,3,'A',18,0,NULL),(219,3,'A',19,0,NULL),(220,3,'A',20,0,NULL),(221,3,'B',1,0,NULL),(222,3,'B',2,0,NULL),(223,3,'B',3,0,NULL),(224,3,'B',4,0,NULL),(225,3,'B',5,0,NULL),(226,3,'B',6,0,NULL),(227,3,'B',7,0,NULL),(228,3,'B',8,0,NULL),(229,3,'B',9,0,NULL),(230,3,'B',10,0,NULL),(231,3,'B',11,0,NULL),(232,3,'B',12,0,NULL),(233,3,'B',13,0,NULL),(234,3,'B',14,0,NULL),(235,3,'B',15,0,NULL),(236,3,'B',16,0,NULL),(237,3,'B',17,0,NULL),(238,3,'B',18,0,NULL),(239,3,'B',19,0,NULL),(240,3,'B',20,0,NULL),(241,3,'C',1,0,NULL),(242,3,'C',2,0,NULL),(243,3,'C',3,0,NULL),(244,3,'C',4,0,NULL),(245,3,'C',5,0,NULL),(246,3,'C',6,0,NULL),(247,3,'C',7,0,NULL),(248,3,'C',8,0,NULL),(249,3,'C',9,0,NULL),(250,3,'C',10,0,NULL),(251,3,'C',11,0,NULL),(252,3,'C',12,0,NULL),(253,3,'C',13,0,NULL),(254,3,'C',14,0,NULL),(255,3,'C',15,0,NULL),(256,3,'C',16,0,NULL),(257,3,'C',17,0,NULL),(258,3,'C',18,0,NULL),(259,3,'C',19,0,NULL),(260,3,'C',20,0,NULL),(261,3,'D',1,0,NULL),(262,3,'D',2,0,NULL),(263,3,'D',3,0,NULL),(264,3,'D',4,0,NULL),(265,3,'D',5,0,NULL),(266,3,'D',6,0,NULL),(267,3,'D',7,0,NULL),(268,3,'D',8,0,NULL),(269,3,'D',9,0,NULL),(270,3,'D',10,0,NULL),(271,3,'D',11,0,NULL),(272,3,'D',12,0,NULL),(273,3,'D',13,0,NULL),(274,3,'D',14,0,NULL),(275,3,'D',15,0,NULL),(276,3,'D',16,0,NULL),(277,3,'D',17,0,NULL),(278,3,'D',18,0,NULL),(279,3,'D',19,0,NULL),(280,3,'D',20,0,NULL),(281,3,'E',1,0,NULL),(282,3,'E',2,0,NULL),(283,3,'E',3,0,NULL),(284,3,'E',4,0,NULL),(285,3,'E',5,0,NULL),(286,3,'E',6,0,NULL),(287,3,'E',7,0,NULL),(288,3,'E',8,0,NULL),(289,3,'E',9,0,NULL),(290,3,'E',10,0,NULL),(291,3,'E',11,0,NULL),(292,3,'E',12,0,NULL),(293,3,'E',13,0,NULL),(294,3,'E',14,0,NULL),(295,3,'E',15,0,NULL),(296,3,'E',16,0,NULL),(297,3,'E',17,0,NULL),(298,3,'E',18,0,NULL),(299,3,'E',19,0,NULL),(300,3,'E',20,0,NULL);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_times`
--

DROP TABLE IF EXISTS `shows_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows_times` (
  `show_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `theater_id` int NOT NULL,
  `show_time` varchar(20) NOT NULL,
  `show_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`show_id`),
  KEY `movie_id` (`movie_id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `shows_times_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `shows_times_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_times`
--

LOCK TABLES `shows_times` WRITE;
/*!40000 ALTER TABLE `shows_times` DISABLE KEYS */;
INSERT INTO `shows_times` VALUES (1,4,1,'03:00 PM','2025-12-16',1000.00),(2,1,1,'03.00 PM','2025-12-16',1000.00),(3,2,1,'03.00 PM','2025-12-16',1000.00),(4,3,1,'03.00 PM','2025-12-16',1000.00);
/*!40000 ALTER TABLE `shows_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `theater_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`theater_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Imax','A1'),(2,'2D','B1'),(3,'3D','C1');
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'we gon be ok ','nohim@gmail.com','pass','2024-12-12','Male'),(2,'rweg','chanithu@gmail.com','chani','2024-12-31','Male'),(3,'Nuran','nuran@gmail.com','nuran','2024-03-13','Male'),(4,'the','ghtth@cm','nohim','2024-12-26','Male'),(8,'Nuran','nuran1@gmail.com','nura','2024-03-13','Male'),(9,'test pass','ntrw@gmail.com','r','2024-12-10','Male'),(10,'Chanithu Rithmal','chanithur3@gmail.com','GR64','2005-03-08','Male'),(11,'GameRiot64','gameriot050@gmail.com','Chanithu@2005','2024-12-05','Female');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reviews` (
  `rid` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `uid` int NOT NULL,
  `review` varchar(500) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reviews`
--

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 15:50:45
