CREATE DATABASE  IF NOT EXISTS `doctorx` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `doctorx`;
-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: doctorx
-- ------------------------------------------------------
-- Server version	5.5.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_tasks`
--

DROP TABLE IF EXISTS `tbl_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tasks` (
  `idTask` int(11) NOT NULL AUTO_INCREMENT,
  `taskImportance` tinyint(4) NOT NULL,
  `taskType` tinyint(4) NOT NULL,
  `taskName` varchar(100) NOT NULL,
  `taskDetails` varchar(500) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTask`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tasks`
--

LOCK TABLES `tbl_tasks` WRITE;
/*!40000 ALTER TABLE `tbl_tasks` DISABLE KEYS */;
INSERT INTO `tbl_tasks` VALUES (1,2,0,'Test Prioirty2','Test Task 2','2012-01-18 23:39:41','2012-01-19 02:14:14'),(2,2,0,'fooBar','fooBar details','2012-01-18 23:40:05','2012-01-19 04:36:56'),(3,2,1,'Test SomeDay','Test Some day Body','2012-01-19 00:14:09',NULL),(4,1,1,'Test 4','This is the 4th test','2012-01-19 01:47:00',NULL),(5,1,1,'Test 7a','This is the 7th test','2012-01-19 01:48:15','2012-01-19 02:25:41'),(6,1,1,'Test 6','This is the 6th test','2012-01-19 01:49:44','2012-01-19 01:50:56'),(7,0,1,'Test 5','This is the 5th test','2012-01-19 01:50:11',NULL),(8,2,1,'Task 8','Test Task 8','2012-01-19 02:07:23',NULL),(9,1,0,'task 9a','test 9','2012-01-19 02:08:17','2012-01-19 02:09:43'),(10,2,0,'test 10',' test 10','2012-01-19 05:01:01',NULL);
/*!40000 ALTER TABLE `tbl_tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-18 22:06:01
