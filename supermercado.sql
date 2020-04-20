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

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `Nome` varchar(45) NOT NULL,
  `Data de Nascimento` date NOT NULL,
  `NumCC` varchar(12) NOT NULL,
  `Morada` varchar(45) NOT NULL,
  `Numero Telemovel` varchar(9) NOT NULL,
  `Sexo` char(1) NOT NULL,
  PRIMARY KEY (`Nome`,`Data de Nascimento`,`NumCC`,`Morada`,`Numero Telemovel`,`Sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedores`
--

DROP TABLE IF EXISTS `Fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fornecedores` (
  `Nome da Empresa` varchar(45) NOT NULL,
  `Nome do Produto` varchar(45) NOT NULL,
  `Custo` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Comissão` decimal(3,2) NOT NULL,
  PRIMARY KEY (`Nome da Empresa`,`Nome do Produto`,`Custo`,`Quantidade`,`Comissão`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedores`
--

LOCK TABLES `Fornecedores` WRITE;
/*!40000 ALTER TABLE `Fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Funcionarios` (
  `Nome` varchar(45) NOT NULL,
  `Data de Nascimento` date NOT NULL,
  `NumCC` varchar(12) NOT NULL,
  `Morada` varchar(45) NOT NULL,
  `Numero Telemovel` varchar(9) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Salário` int(11) NOT NULL,
  `Horas Trabalho` int(11) NOT NULL,
  PRIMARY KEY (`Nome`,`Data de Nascimento`,`NumCC`,`Morada`,`Numero Telemovel`,`Email`,`Salário`,`Horas Trabalho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `Produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produtos` (
  `Nome` varchar(45) NOT NULL,
  `Custo` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`Nome`,`Custo`,`IdProduto`,`Quantidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `Produtos` WRITE;
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

-- Dump completed on 2020-04-20 20:08:48
