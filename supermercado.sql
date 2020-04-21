-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.19.04.2

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

USE supermercado;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `Nome` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  `NumCC` varchar(12) NOT NULL,
  `Morada` varchar(45) NOT NULL,
  `Email`  varchar(64) DEFAULT NULL,
  `NumTelemovel` varchar(9) NOT NULL,
  `Genero` ENUM('M', 'F') NOT NULL,
  PRIMARY KEY (`NumCC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedores`
--

DROP TABLE IF EXISTS `FORNECEDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FORNECEDOR` (
  `IdEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEmpresa` varchar(45) NOT NULL,
  `NomeProduto` varchar(45) NOT NULL,
  `Custo` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Comissão` decimal(3,2) NOT NULL,
  PRIMARY KEY (`IdEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedores`
--

LOCK TABLES `FORNECEDOR` WRITE;
/*!40000 ALTER TABLE `Fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `FUNCIONARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNCIONARIO` (
  `IdFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `NumCC` int(12) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Morada` varchar(45) NOT NULL,
  
  `Email` varchar(45) DEFAULT NULL,
  `Genero` ENUM('M', 'F') NOT NULL,
  `Departamento` varchar(45) NOT NULL,
  `Supervisor` int(11) DEFAULT NULL,
  `Salário` int(11) NOT NULL,
  `HorasTrabalho` int(11) NOT NULL,
  PRIMARY KEY (`IdFuncionario`),
  UNIQUE KEY `NumCC` (`NumCC`),
  KEY `Supervisor` (`Supervisor`),
  FOREIGN KEY (`Supervisor`) REFERENCES `FUNCIONARIO` (`IdFuncionario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `FUNCIONARIO` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

-- num telefone para multi-valor

DROP TABLE IF EXISTS `NUM_TELEFONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NUM_TELEFONE` (
  `IdFuncionario` int NOT NULL,
  `Num_Telemovel` int NOT NULL,
  PRIMARY KEY (`IdFuncionario`,`Num_Telemovel`),
  FOREIGN KEY(`IdFuncionario`) REFERENCES `FUNCIONARIO`(`IdFuncionario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `NUM_TELEFONE` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `PRODUTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUTO` (
  `Nome` varchar(45) NOT NULL,
  `Custo` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL AUTO_INCREMENT,
  `Empresa` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`IdProduto`),
  FOREIGN KEY(`Empresa`) REFERENCES `FORNECEDOR`(`IdEmpresa`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `PRODUTO` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

-- DEPARTAMENTO

DROP TABLE IF EXISTS `DEPARTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTAMENTO` (
  `NomeDepartamento` varchar(45) NOT NULL,
  `Gestor` int NOT NULL,
  PRIMARY KEY (`NomeDepartamento`),
  FOREIGN KEY(`Gestor`) REFERENCES `FUNCIONARIO`(`IdFuncionario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTO`
--

LOCK TABLES `DEPARTAMENTO` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 20:39:39
