-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: altssys
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) NOT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Amanda Rocha','Ibirité','MG'),(2,'Bruno Lima','São Paulo','SP'),(3,'Carla Mendes','Fortaleza','CE'),(4,'Daniel Souza','Curitiba','PR'),(5,'Eduarda Martins','Salvador','BA'),(6,'Felipe Andrade','Porto Alegre','RS'),(7,'Gabriela Torres','Recife','PE'),(8,'Henrique Castro','Manaus','AM'),(9,'Isabela Nunes','Belém','PA'),(10,'João Vitor','Campinas','SP'),(11,'Karen Oliveira','Niterói','RJ'),(12,'Leonardo Alves','Florianópolis','SC'),(13,'Mariana Costa','Vitória','ES'),(14,'Nicolas Ferreira','Goiânia','GO'),(15,'Otávio Ramos','Campo Grande','MS'),(16,'Patrícia Duarte','João Pessoa','PB'),(17,'Rafael Teixeira','São Luís','MA'),(18,'Sabrina Lopes','Aracaju','SE'),(19,'Thiago Barros','Teresina','PI'),(20,'Ursula Farias','Palmas','TO'),(21,'Vinícius Moreira','Maceió','AL'),(22,'Wesley Cardoso','Ribeirão Preto','SP'),(23,'Yasmin Ribeiro','Uberlândia','MG'),(24,'Zeca Brito','Caxias do Sul','RS'),(25,'Lívia Fernandes','São Bernardo do Campo','SP');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02  0:43:57
