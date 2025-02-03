-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `matricula` varchar(5) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('00001','Fábio','1990-07-15','Bom Desapcho'),('00002','Juliana','1992-12-28','Divinópolis'),('00003','Laura',NULL,NULL);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `matricula_aluno` varchar(5) NOT NULL,
  `nome_disciplina` char(100) NOT NULL,
  PRIMARY KEY (`matricula_aluno`,`nome_disciplina`),
  KEY `aluno_disciplina_ibfk_2` (`nome_disciplina`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`nome_disciplina`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES ('00001','Ciências Biológicas'),('00002','Ciências Biológicas'),('00003','Ciências Biológicas'),('00002','Medicina'),('00001','Veterinária');
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `data_hora` date NOT NULL,
  `cpf_professor` char(11) NOT NULL,
  `comentario` varchar(500) DEFAULT '',
  `nota` int NOT NULL,
  PRIMARY KEY (`data_hora`),
  KEY `avaliacao_ibfk_1` (`cpf_professor`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES ('2024-10-18','22222222222','B',8),('2024-11-30','11111111111','A',7),('2025-01-10','33333333333','C',9);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_professor`
--

DROP TABLE IF EXISTS `contato_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_professor` (
  `cpf_professor` char(11) NOT NULL,
  `contato` varchar(255) NOT NULL,
  PRIMARY KEY (`cpf_professor`,`contato`),
  CONSTRAINT `contato_professor_ibfk_1` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_professor`
--

LOCK TABLES `contato_professor` WRITE;
/*!40000 ALTER TABLE `contato_professor` DISABLE KEYS */;
INSERT INTO `contato_professor` VALUES ('11111111111','37 99911-1111'),('22222222222','37 99922-2222'),('33333333333','joana@facul.com.br');
/*!40000 ALTER TABLE `contato_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `local` varchar(255) DEFAULT '',
  `cpf_professor` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_ibfk_1` (`cpf_professor`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ciências Naturais','Belo Horizonte','11111111111'),(2,'Saúde','Uberaba','33333333333');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int NOT NULL DEFAULT '30',
  `ementa` text,
  `disciplina_pre_req` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  KEY `disciplina_ibfk_1` (`disciplina_pre_req`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`disciplina_pre_req`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Ciências Biológicas',30,NULL,NULL),('Medicina',90,'A, B, C, D','Ciências Biológicas'),('Veterinária',45,'A, B, C, D','Ciências Biológicas');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `inicio_contrato` date DEFAULT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `professor_ibfk_1` (`id_departamento`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('11111111111','Carlos','2015-02-10',2),('22222222222','Marta','2024-06-28',2),('33333333333','Joana','2019-03-17',1);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_disciplina`
--

DROP TABLE IF EXISTS `professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_disciplina` (
  `cpf_professor` char(11) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  PRIMARY KEY (`cpf_professor`,`nome_disciplina`),
  KEY `professor_disciplina_ibfk_2` (`nome_disciplina`),
  CONSTRAINT `professor_disciplina_ibfk_1` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `professor_disciplina_ibfk_2` FOREIGN KEY (`nome_disciplina`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_disciplina`
--

LOCK TABLES `professor_disciplina` WRITE;
/*!40000 ALTER TABLE `professor_disciplina` DISABLE KEYS */;
INSERT INTO `professor_disciplina` VALUES ('33333333333','Ciências Biológicas'),('22222222222','Medicina'),('11111111111','Veterinária');
/*!40000 ALTER TABLE `professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-03 17:43:57
