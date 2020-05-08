-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version 5.7.28-0ubuntu0.19.04.2

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

DROP DATABASE IF EXISTS `supermercado`;
CREATE DATABASE `supermercado`;

USE supermercado;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `NumCC` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Genero` ENUM('M', 'F') NOT NULL,
  `Email`  varchar(64) DEFAULT NULL,
  `Morada_Rua` varchar(45) NOT NULL,
  `Morada_NumRua` int NOT NULL,
  `Morada_Andar` int DEFAULT NULL,
  `Morada_Localidade` varchar(45) NOT NULL,
  `Morada_CodPostal` varchar(45) NOT NULL,
  PRIMARY KEY (`NumCC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `CLIENTE` (`NumCC`,`Nome`,`DataNascimento`,`Genero`,`Email`,`Morada_Rua`,`Morada_NumRua`,`Morada_Andar`,`Morada_Localidade`,`Morada_CodPostal`) VALUES (123456789,'João Augusto','2000-05-16','M','joao_augusto00@gmail.com','Rua Roberto Duarte Silva',53,NULL,'Porto','4000-015'), (987654320,'Maria Rodrigues','1995-03-18','F','marianarodrigues@gmail.com','Rua da Betesga',179,4,'Paredes','4580-098'),(134679240,'Ana Sousa','1999-11-06','F','ana.sousa2@gmail.com','Rua do Comércio',43,NULL,'Porto','4000-152'),(864938256,'Pedro Sampaio','2001-06-04','M','pedro_sp@hotmail.com','Rua da Junqueira',24,3,'Vila Nova de Gaia','4400-456'),(113399556,'Sandra Costa','1994-04-14','F','sandra1232gmail.com','Rua do Guarda-Mor',134,2,'Espinho','4500-478'),(435678097,'Miguel Gonçalves','1996-06-06','M','miguelgonçalves@gmail.com','Rua do Guarda-Mor',134,2,'Espinho','4500-478'),(222446688,'Ana Margarida Fernandes','1997-05-07','F','maguifernandes@hotmail.com','Rua Ferreira Lapa',274,7,'Porto','4000-345'),(114325678,'Mafalda Sampaio','2000-08-22','F','mafalda.sampaio2gmail.com','Rua General Morais Sarmento',564,NULL,'Porto','4000-467'),(125467890,'Gabriel Simões','1995-05-05','M','gabrielsimoes24@gmail.com','Rua da Oliveira ao Carmo',345,8,'Vila Nova de Gaia','4400-064'),(234587652,'Carolina Gomes','2000-05-25','F','carol-gomes@gmail.com','Rua Roberto Aberto',69,4,'Grijó','4415-123');
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
  `IdProduto` int(11) NOT NULL,
  `NomeProduto` varchar(45) NOT NULL,
  `Custo` decimal(3,2) NOT NULL,
  `Comissão` decimal(3,2) NOT NULL,
  PRIMARY KEY (`IdEmpresa`),
  FOREIGN KEY (`IdProduto`) REFERENCES `PRODUTO`(`IdProduto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedores`
--

LOCK TABLES `FORNECEDOR` WRITE;
/*!40000 ALTER TABLE `Fornecedores` DISABLE KEYS */;
INSERT INTO `FORNECEDOR` (`IdEmpresa`,`NomeEmpresa`,`IdProduto`,`NomeProduto`,`Custo`,`Comissão`) VALUES (500200100,'NESTLÉ',560123456,'Cereais',1.90,0.15),(501201101,'LACTOGAL',560123457,'Leite',0.60,0.10),(502202102,'NACIONAL',560123458,'Bolachas',1.50,0.12),(503203103,'DANONE',560123459,'Iogurtes',1.20,0.15),(504204104,'DELTA',560123450,'Cafe',0.60,0.20),(504204105,'LUSO',560123460,'Água',1.00,0.10);
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
  `Email` varchar(45) DEFAULT NULL,
  `Genero` ENUM('M', 'F') NOT NULL,
  `Departamento` varchar(45) NOT NULL,
  `Supervisor` int(11) DEFAULT NULL,
  `Salário` int(11) NOT NULL,
  `HorasTrabalho` int(11) NOT NULL,
  `Gere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdFuncionario`),
  UNIQUE KEY `NumCC` (`NumCC`),
  KEY `Supervisor` (`Supervisor`),
  FOREIGN KEY (`Supervisor`) REFERENCES `FUNCIONARIO` (`IdFuncionario`) ON UPDATE CASCADE,
  FOREIGN KEY (`Departamento`) REFERENCES `DEPARTAMENTO`(`NomeDepartamento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `FUNCIONARIO` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
INSERT INTO `FUNCIONARIO` (`idFuncionario`,`Nome`,`NumCC`,`DataNascimento`,`Email`,`Genero`,`Departamento`,`Supervisor`,`Salário`,`HorasTrabalho`,`Gere`) VALUES (1246,'Maria Pereira',457891232,'1993-05-28','mariapereira@gmail.com','F','Administraçao',NULL,1000,40,'Administração'),(1235,'Pedro Rodrigues',567890123,'1991-01-16','pedrorodrigues@gmail.com','M','Reposiçao',NULL,1000,40,'Reposiçao'),(1236,'Francisca Costa',467123890,'1992-04-25','franciscacosta@gmail.com','F','Marketing',NULL,600,40,NULL),(1237,'João Moreira',678943215,'1995-02-12','joaomoreira@gmail.com','M','Logistica',678943215,1000,40,NULL),(1238,'Andreia Fonseca',712389045,'1994-11-29','andreiafonseca@gmail.com','F','Administraçao',NULL,600,40,NULL),(1239,'David Gomes',837612389,'1993-09-23','davidgomes@gmail.com','M','Reposiçao',837612389,1000,20,NULL),(1240,'Duarte Ferreira',984672651,'1992-10-13','duarteferreira@gmail.com','M','Financeiro',NULL,1000,20,'Financeiro'),(1241,'Filipa Sousa',263718365,'1994-07-15','filipasousa@gmail.com','F','Marketing',NULL,1000,40,'Marketing '),(1242,'Madalena Faria',647281937,'1995-03-25','madalenafaria@gmail.com','F','Reposiçao',NULL,600,20,NULL),(1243,'Antonio Teixiera',783691274,'1991-08-17','antonioteixeira@gmail.com','M','Logistica',NULL,1000,40,'Logistica'),(1244,'José Vieira',856478239,'1995-05-12','josevieira@gmail.com','M','Reposição',856478239,1000,20,NULL),(1245,'Marco Pinheiro',249475832,'1990-09-23','marcopiheiro@gmail.com','M','Marketing',249475832,1000,20,NULL),(1234,'Ricardo Ribeiro',324175322,'1998-06-14','ricamigu@gmail.com','M','CEO',NULL,50000,10,'CEO');
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

-- num telemovel de func para multi-valor


-- num telemovel de clientes para multi-valor

DROP TABLE IF EXISTS `NUM_TELEMOVEL_CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NUM_TELEMOVEL_CLIENTE` (
  `NumCC` int NOT NULL,
  `Num_Telemovel` int NOT NULL,
  PRIMARY KEY (`NumCC`,`Num_Telemovel`),
  FOREIGN KEY(`NumCC`) REFERENCES `CLIENTE`(`NumCC`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `NUM_TELEMOVEL_CLIENTE` WRITE;
/*!40000 ALTER TABLE `NUM_TELEMOVEL_CLIENTE` DISABLE KEYS */;
INSERT INTO `NUM_TELEMOVEL_CLIENTE` (`NumCC`,`Num_Telemovel`) VALUES (123456789,936334381),(123456789,934568932),(987654320,912345678),(134679240,923457801),(864938256,914539754),(113399556,920053846),(435678097,911232836),(222446688,932153841),(222446688,920102912),(234587652,923846273),(114325678,926475362),(125467890,960843233),(125467890,966675532);
/*!40000 ALTER TABLE `NUM_TELEMOVEL_CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;


-- tabela para encomendas

DROP TABLE IF EXISTS `ENCOMENDAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCOMENDAS` (
  `NumCC` int NOT NULL,
  `IdEmpresa` int NOT NULL,
  `IdProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Custo` decimal(3,2) NOT NULL,
  PRIMARY KEY (`NumCC`),
  FOREIGN KEY (`IdEmpresa`) REFERENCES `FORNECEDOR`(`IdEmpresa`) ON DELETE CASCADE,
  FOREIGN KEY (`IdProduto`) REFERENCES `PRODUTO`(`IdProduto`) ON DELETE CASCADE,
  FOREIGN KEY(`NumCC`) REFERENCES `CLIENTE`(`NumCC`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
LOCK TABLES `ENCOMENDAS` WRITE;
/*!40000 ALTER TABLE `ENCOMENDAS` DISABLE KEYS */;
INSERT INTO `ENCOMENDAS` (`NumCC`,`IdEmpresa`,`IdProduto`,`Quantidade`,`Custo`) VALUES (123456789,435678097,560123456,100,1.50),(198765432,222446688,560123457,500,0.45),(134679240,234587652,560123458,350,1.20),(864938256,114325678,560123459,200,1.00),(113399556,125467890,560123450,300,0.40),(133848192,125467890,560123460,500,0.70);
/*!40000 ALTER TABLE `ENCOMENDAS` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `NUM_TELEMOVEL_FUNCIONARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NUM_TELEMOVEL_FUNCIONARIO` (
  `IdFuncionario` int(11) NOT NULL,
  `Num_Telemovel` int(11) NOT NULL,
  PRIMARY KEY (`IdFuncionario`,`Num_Telemovel`),
  FOREIGN KEY(`IdFuncionario`) REFERENCES `FUNCIONARIO`(`IdFuncionario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `NUM_TELEMOVEL_FUNCIONARIO` WRITE;
/*!40000 ALTER TABLE `NUM_TELEFONE` DISABLE KEYS */;
INSERT INTO `NUM_TELEMOVEL_FUNCIONARIO` (`IdFuncionario`,`Num_Telemovel`) VALUES (1234,969142369),(1235,229487645),(1235,229548976),(1236,222436580),(1237,225489002),(1238,223489987),(1239,229001035),(1240,220548003),(1241,220545469),(1242,220323048),(1243,228254452),(1244,226008547),(1245,224487789);
/*!40000 ALTER TABLE `NUM_TELEFONE` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `PRODUTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUTO` (
  `IdProduto` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Custo` decimal(3,2) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`IdProduto`),
  FOREIGN KEY(`IdEmpresa`) REFERENCES `FORNECEDOR`(`IdEmpresa`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `PRODUTO` WRITE;
/*!40000 ALTER TABLE `PRODUTO` DISABLE KEYS */;
INSERT INTO `PRODUTO` (`IdProduto`,`Nome`,`Custo`,`IdEmpresa`,`Quantidade`) VALUES (560123456,'Cereais',1.50,500200100,100),(560123457,'Leite',0.45,501201101,500),(560123458,'Bolachas',1.20,502202102,350),(560123459,'Iogurtes',1.00,503203103,200),(560123450,'Cafe',0.40,504204104,300),(560123460,'Agua',0.70,504204105,500);
/*!40000 ALTER TABLE `PRODUTO` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `DEPARTAMENTO` DISABLE KEYS */;
INSERT INTO `DEPARTAMENTO` (`NomeDepartamento`,`Gestor`) VALUES ('CEO',324175322),('Administração',457891232),('Reposição',567890123),('Financeiro',984672651),('Marketing',263718365),('Logistica',783691274);
/*!40000 ALTER TABLE `DEPARTAMENTO` ENABLE KEYS */;
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