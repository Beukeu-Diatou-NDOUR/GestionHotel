-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: GestionHotel
-- ------------------------------------------------------
-- Server version	5.7.41-0ubuntu0.18.04.1-log

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
-- Table structure for table `Categorie`
--

DROP TABLE IF EXISTS `Categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorie` (
  `id_categorie` int(11) NOT NULL,
  `classe` enum('affaire','standing','economique') DEFAULT NULL,
  `tarif_normal` int(11) DEFAULT NULL,
  `tarif_special` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorie`
--

LOCK TABLES `Categorie` WRITE;
/*!40000 ALTER TABLE `Categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chambre`
--

DROP TABLE IF EXISTS `Chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chambre` (
  `id_chambre` int(11) NOT NULL,
  `numero_chambre` int(11) NOT NULL,
  `classe_chambre` enum('affaire','standing','economique') DEFAULT NULL,
  `etat_chambre` enum('libre','occupe','reserve') DEFAULT NULL,
  `idclient` int(11) DEFAULT NULL,
  `idcategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chambre`),
  KEY `fk_cli` (`idclient`),
  KEY `fk_categ` (`idcategorie`),
  CONSTRAINT `fk_categ` FOREIGN KEY (`idcategorie`) REFERENCES `Categorie` (`id_categorie`),
  CONSTRAINT `fk_cli` FOREIGN KEY (`idclient`) REFERENCES `Client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chambre`
--

LOCK TABLES `Chambre` WRITE;
/*!40000 ALTER TABLE `Chambre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `nom_client` varchar(40) DEFAULT NULL,
  `prenom_client` varchar(40) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  `tel_client` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES ('Ndiaye','Fatou',221,'772002020'),('ndour','beukeu',225,'771314611'),('Mbacke','Bamba',311,'762502123');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facture`
--

DROP TABLE IF EXISTS `Facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facture` (
  `id_facture` int(11) NOT NULL,
  `tarif_spe` int(11) DEFAULT NULL,
  `taif_normal` int(11) DEFAULT NULL,
  `prix_dej` int(11) DEFAULT NULL,
  `prix_bar` int(11) DEFAULT NULL,
  `prix_phone` int(11) DEFAULT NULL,
  `nbre_nuit` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `idclie` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `idchambre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_facture`),
  KEY `fk_clie` (`idclie`),
  KEY `fk_ch` (`idchambre`),
  CONSTRAINT `fk_ch` FOREIGN KEY (`idchambre`) REFERENCES `Chambre` (`id_chambre`),
  CONSTRAINT `fk_clie` FOREIGN KEY (`idclie`) REFERENCES `Client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facture`
--

LOCK TABLES `Facture` WRITE;
/*!40000 ALTER TABLE `Facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `nom_hotel` varchar(40) NOT NULL,
  `nb_niveau` int(11) NOT NULL,
  `nb_chambre` int(11) NOT NULL,
  `tel_hotel` varchar(40) DEFAULT NULL,
  `adresse_hotel` varchar(40) DEFAULT NULL,
  `id_hotel` int(11) NOT NULL,
  PRIMARY KEY (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `id_reservation` int(11) NOT NULL,
  `nuite` int(11) DEFAULT NULL,
  `date_entre` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `date_reservation` date DEFAULT NULL,
  `petit_dej` bit(1) DEFAULT NULL,
  `bar` bit(1) DEFAULT NULL,
  `phone` bit(1) DEFAULT NULL,
  `tarif_chambre` int(11) DEFAULT NULL,
  `tarif_dej` int(11) DEFAULT NULL,
  `tarif_bar` int(11) DEFAULT NULL,
  `tarif_phone` int(11) DEFAULT NULL,
  `idchambre` int(11) DEFAULT NULL,
  `idservice` int(11) DEFAULT NULL,
  `idcli` int(11) DEFAULT NULL,
  `idchamb` int(11) DEFAULT NULL,
  `nom_cli` varchar(40) DEFAULT NULL,
  `prenom_cli` varchar(40) DEFAULT NULL,
  `tel_cli` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `fk_cham` (`idchamb`),
  KEY `fk_cl` (`idcli`),
  CONSTRAINT `fk_cham` FOREIGN KEY (`idchamb`) REFERENCES `Chambre` (`id_chambre`),
  CONSTRAINT `fk_cl` FOREIGN KEY (`idcli`) REFERENCES `Client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service` (
  `service` set('petit_dej','bar','phone') DEFAULT NULL,
  `id_service` int(11) NOT NULL,
  `tarif` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18  0:29:10
