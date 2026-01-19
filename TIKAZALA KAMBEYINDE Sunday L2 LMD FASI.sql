-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: salaries
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '3d8b8b38-c3d8-11f0-9569-a44cc839e27d:1-111';

--
-- Table structure for table `competences`
--

DROP TABLE IF EXISTS `competences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competences` (
  `idcomp` int NOT NULL AUTO_INCREMENT,
  `intcomp` varchar(50) DEFAULT NULL,
  `idcomp_1` int NOT NULL,
  PRIMARY KEY (`idcomp`),
  KEY `idcomp_1` (`idcomp_1`),
  CONSTRAINT `competences_ibfk_1` FOREIGN KEY (`idcomp_1`) REFERENCES `niveau_comp` (`idcomp`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competences`
--

LOCK TABLES `competences` WRITE;
/*!40000 ALTER TABLE `competences` DISABLE KEYS */;
INSERT INTO `competences` VALUES (7,'informatique',1),(8,'informatique',1),(9,'mathematique',2),(10,'sciences',2),(11,'agronomie',3);
/*!40000 ALTER TABLE `competences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau_comp`
--

DROP TABLE IF EXISTS `niveau_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveau_comp` (
  `idcomp` int NOT NULL AUTO_INCREMENT,
  `intcomp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcomp`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_comp`
--

LOCK TABLES `niveau_comp` WRITE;
/*!40000 ALTER TABLE `niveau_comp` DISABLE KEYS */;
INSERT INTO `niveau_comp` VALUES (1,'Débutant'),(2,'Intermédiaire'),(3,'Avancé'),(4,'Débutant'),(5,'Intermédiaire'),(6,'Avancé');
/*!40000 ALTER TABLE `niveau_comp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posseder` (
  `numsal` int NOT NULL AUTO_INCREMENT,
  `idcomp` int NOT NULL,
  PRIMARY KEY (`numsal`,`idcomp`),
  KEY `idcomp` (`idcomp`),
  CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`numsal`) REFERENCES `salarie` (`numsal`),
  CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`idcomp`) REFERENCES `competences` (`idcomp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posseder`
--

LOCK TABLES `posseder` WRITE;
/*!40000 ALTER TABLE `posseder` DISABLE KEYS */;
/*!40000 ALTER TABLE `posseder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postes`
--

DROP TABLE IF EXISTS `postes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postes` (
  `numposte` int NOT NULL AUTO_INCREMENT,
  `desigposte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numposte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postes`
--

LOCK TABLES `postes` WRITE;
/*!40000 ALTER TABLE `postes` DISABLE KEYS */;
INSERT INTO `postes` VALUES (1,'Poste 1'),(2,'Poste 2'),(3,'Poste 3'),(4,'Poste 4'),(5,'Poste 5');
/*!40000 ALTER TABLE `postes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarie` (
  `numsal` int NOT NULL AUTO_INCREMENT,
  `nomsal` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `dateEmb` date DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `numposte` int NOT NULL,
  PRIMARY KEY (`numsal`),
  KEY `numposte` (`numposte`),
  CONSTRAINT `salarie_ibfk_1` FOREIGN KEY (`numposte`) REFERENCES `postes` (`numposte`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarie`
--

LOCK TABLES `salarie` WRITE;
/*!40000 ALTER TABLE `salarie` DISABLE KEYS */;
INSERT INTO `salarie` VALUES (1,'Employe_1','M','2021-01-01','1995-01-01',1),(2,'Employe_2','F','2021-01-02','1994-01-01',2),(3,'Employe_3','M','2021-01-03','1993-01-01',3),(4,'Employe_4','F','2021-01-04','1992-01-01',4),(5,'Employe_5','M','2021-01-05','1991-01-01',5),(6,'Employe_6','F','2021-01-06','1990-01-01',1),(7,'Employe_7','M','2021-01-07','1989-01-01',2),(8,'Employe_8','F','2021-01-08','1988-01-01',3),(9,'Employe_9','M','2021-01-09','1987-01-01',4),(10,'Employe_10','F','2021-01-10','1986-01-01',5),(11,'Employe_11','M','2021-01-11','1995-01-01',1),(12,'Employe_12','F','2021-01-12','1994-01-01',2),(13,'Employe_13','M','2021-01-13','1993-01-01',3),(14,'Employe_14','F','2021-01-14','1992-01-01',4),(15,'Employe_15','M','2021-01-15','1991-01-01',5),(16,'Employe_16','F','2021-01-16','1990-01-01',1),(17,'Employe_17','M','2021-01-17','1989-01-01',2),(18,'Employe_18','F','2021-01-18','1988-01-01',3),(19,'Employe_19','M','2021-01-19','1987-01-01',4),(20,'Employe_20','F','2021-01-20','1986-01-01',5),(21,'Employe_21','M','2021-01-21','1995-01-01',1),(22,'Employe_22','F','2021-01-22','1994-01-01',2),(23,'Employe_23','M','2021-01-23','1993-01-01',3),(24,'Employe_24','F','2021-01-24','1992-01-01',4),(25,'Employe_25','M','2021-01-25','1991-01-01',5),(26,'Employe_26','F','2021-01-26','1990-01-01',1),(27,'Employe_27','M','2021-01-27','1989-01-01',2),(28,'Employe_28','F','2021-01-28','1988-01-01',3),(29,'Employe_29','M','2021-01-29','1987-01-01',4),(30,'Employe_30','F','2021-01-30','1986-01-01',5),(31,'Employe_31','M','2021-02-01','1995-01-01',1),(32,'Employe_32','F','2021-02-02','1994-01-01',2),(33,'Employe_33','M','2021-02-03','1993-01-01',3),(34,'Employe_34','F','2021-02-04','1992-01-01',4),(35,'Employe_35','M','2021-02-05','1991-01-01',5),(36,'Employe_36','F','2021-02-06','1990-01-01',1),(37,'Employe_37','M','2021-02-07','1989-01-01',2),(38,'Employe_38','F','2021-02-08','1988-01-01',3),(39,'Employe_39','M','2021-02-09','1987-01-01',4),(40,'Employe_40','F','2021-02-10','1986-01-01',5),(41,'Employe_41','M','2021-02-11','1995-01-01',1),(42,'Employe_42','F','2021-02-12','1994-01-01',2),(43,'Employe_43','M','2021-02-13','1993-01-01',3),(44,'Employe_44','F','2021-02-14','1992-01-01',4),(45,'Employe_45','M','2021-02-15','1991-01-01',5),(46,'Employe_46','F','2021-02-16','1990-01-01',1),(47,'Employe_47','M','2021-02-17','1989-01-01',2),(48,'Employe_48','F','2021-02-18','1988-01-01',3),(49,'Employe_49','M','2021-02-19','1987-01-01',4),(50,'Employe_50','F','2021-02-20','1986-01-01',5),(51,'Employe_51','M','2021-02-21','1995-01-01',1),(52,'Employe_52','F','2021-02-22','1994-01-01',2),(53,'Employe_53','M','2021-02-23','1993-01-01',3),(54,'Employe_54','F','2021-02-24','1992-01-01',4),(55,'Employe_55','M','2021-02-25','1991-01-01',5),(56,'Employe_56','F','2021-02-26','1990-01-01',1),(57,'Employe_57','M','2021-02-27','1989-01-01',2),(58,'Employe_58','F','2021-02-28','1988-01-01',3),(59,'Employe_59','M','2021-03-01','1987-01-01',4),(60,'Employe_60','F','2021-03-02','1986-01-01',5),(61,'Employe_61','M','2021-03-03','1995-01-01',1),(62,'Employe_62','F','2021-03-04','1994-01-01',2),(63,'Employe_63','M','2021-03-05','1993-01-01',3),(64,'Employe_64','F','2021-03-06','1992-01-01',4),(65,'Employe_65','M','2021-03-07','1991-01-01',5),(66,'Employe_66','F','2021-03-08','1990-01-01',1),(67,'Employe_67','M','2021-03-09','1989-01-01',2),(68,'Employe_68','F','2021-03-10','1988-01-01',3),(69,'Employe_69','M','2021-03-11','1987-01-01',4),(70,'Employe_70','F','2021-03-12','1986-01-01',5),(71,'Employe_71','M','2021-03-13','1995-01-01',1),(72,'Employe_72','F','2021-03-14','1994-01-01',2),(73,'Employe_73','M','2021-03-15','1993-01-01',3),(74,'Employe_74','F','2021-03-16','1992-01-01',4),(75,'Employe_75','M','2021-03-17','1991-01-01',5),(76,'Employe_76','F','2021-03-18','1990-01-01',1),(77,'Employe_77','M','2021-03-19','1989-01-01',2),(78,'Employe_78','F','2021-03-20','1988-01-01',3),(79,'Employe_79','M','2021-03-21','1987-01-01',4),(80,'Employe_80','F','2021-03-22','1986-01-01',5),(81,'Employe_81','M','2021-03-23','1995-01-01',1),(82,'Employe_82','F','2021-03-24','1994-01-01',2),(83,'Employe_83','M','2021-03-25','1993-01-01',3),(84,'Employe_84','F','2021-03-26','1992-01-01',4),(85,'Employe_85','M','2021-03-27','1991-01-01',5),(86,'Employe_86','F','2021-03-28','1990-01-01',1),(87,'Employe_87','M','2021-03-29','1989-01-01',2),(88,'Employe_88','F','2021-03-30','1988-01-01',3),(89,'Employe_89','M','2021-03-31','1987-01-01',4),(90,'Employe_90','F','2021-04-01','1986-01-01',5),(91,'Employe_91','M','2021-04-02','1995-01-01',1),(92,'Employe_92','F','2021-04-03','1994-01-01',2),(93,'Employe_93','M','2021-04-04','1993-01-01',3),(94,'Employe_94','F','2021-04-05','1992-01-01',4),(95,'Employe_95','M','2021-04-06','1991-01-01',5),(96,'Employe_96','F','2021-04-07','1990-01-01',1),(97,'Employe_97','M','2021-04-08','1989-01-01',2),(98,'Employe_98','F','2021-04-09','1988-01-01',3),(99,'Employe_99','M','2021-04-10','1987-01-01',4),(100,'Employe_100','F','2021-04-11','1986-01-01',5);
/*!40000 ALTER TABLE `salarie` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-19 18:52:19
