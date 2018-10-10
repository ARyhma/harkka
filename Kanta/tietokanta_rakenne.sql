-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (i686)
--
-- Host: mysli.oamk.fi    Database: opisk_c8hape00
-- ------------------------------------------------------
-- Server version	5.5.60-0+deb8u1

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
-- Table structure for table `asiakas`
--

DROP TABLE IF EXISTS `asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiakas` (
  `asiakasID` int(11) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(45) DEFAULT NULL,
  `sukunimi` varchar(45) DEFAULT NULL,
  `osoite` varchar(45) DEFAULT NULL,
  `postinumero` int(11) DEFAULT NULL,
  `postitoimipaikka` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`asiakasID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elasku`
--

DROP TABLE IF EXISTS `elasku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elasku` (
  `elaskuID` int(11) NOT NULL AUTO_INCREMENT,
  `saajannimi` varchar(45) DEFAULT NULL,
  `iban` varchar(18) DEFAULT NULL,
  `bic` varchar(12) DEFAULT NULL,
  `viite` varchar(45) DEFAULT NULL,
  `viesti` varchar(45) DEFAULT NULL,
  `maara` decimal(20,2) DEFAULT NULL,
  `asiakasid` int(11) NOT NULL,
  `aika` datetime DEFAULT NULL,
  `erapaiva` date DEFAULT NULL,
  PRIMARY KEY (`elaskuID`),
  KEY `fk_elasku_asiakas_idx` (`asiakasid`),
  CONSTRAINT `fk_elasku_asiakas` FOREIGN KEY (`asiakasid`) REFERENCES `asiakas` (`asiakasID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `luottotapahtumat`
--

DROP TABLE IF EXISTS `luottotapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luottotapahtumat` (
  `luottotapahtumaID` int(11) NOT NULL AUTO_INCREMENT,
  `saajannimi` varchar(45) DEFAULT NULL,
  `iban` varchar(18) DEFAULT NULL,
  `bic` varchar(12) DEFAULT NULL,
  `viite` varchar(45) DEFAULT NULL,
  `maara` decimal(20,2) DEFAULT NULL,
  `pankkikorttiID` int(11) NOT NULL,
  `aika` datetime DEFAULT NULL,
  PRIMARY KEY (`luottotapahtumaID`),
  KEY `fk_tilitapahtumat_tili1_idx` (`pankkikorttiID`),
  CONSTRAINT `fk_tilitapahtumat2_tili1` FOREIGN KEY (`pankkikorttiID`) REFERENCES `pankkikortit` (`pankkikorttiID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pankkikortit`
--

DROP TABLE IF EXISTS `pankkikortit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pankkikortit` (
  `pankkikorttiID` int(11) NOT NULL AUTO_INCREMENT,
  `pankkikortinnimi` varchar(45) DEFAULT NULL,
  `voimassaolo` date DEFAULT NULL,
  `kortinnumero` double NOT NULL,
  `luottoraja` double NOT NULL,
  `asiakasid` int(11) NOT NULL,
  `tili_tiliID` int(11) NOT NULL,
  PRIMARY KEY (`pankkikorttiID`),
  KEY `fk_pankkikortit_asiakas_idx` (`asiakasid`),
  KEY `fk_pankkikortit_tili1_idx` (`tili_tiliID`),
  CONSTRAINT `fk_pankkikortit_asiakas` FOREIGN KEY (`asiakasid`) REFERENCES `asiakas` (`asiakasID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pankkikortit_tili1` FOREIGN KEY (`tili_tiliID`) REFERENCES `tili` (`tiliID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tapahtumat`
--

DROP TABLE IF EXISTS `tapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapahtumat` (
  `tapahtumaid` int(11) NOT NULL AUTO_INCREMENT,
  `tapahtuma` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tapahtumaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tili`
--

DROP TABLE IF EXISTS `tili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tili` (
  `tiliID` int(11) NOT NULL AUTO_INCREMENT,
  `tilinnimi` varchar(45) DEFAULT NULL,
  `tilinumero` varchar(18) DEFAULT NULL,
  `saldo` decimal(65,2) DEFAULT NULL,
  `iban` varchar(18) DEFAULT NULL,
  `bic` varchar(12) DEFAULT NULL,
  `omistajaID` int(11) NOT NULL,
  PRIMARY KEY (`tiliID`),
  KEY `fk_tili_asiakas1_idx` (`omistajaID`),
  CONSTRAINT `fk_tili_asiakas1` FOREIGN KEY (`omistajaID`) REFERENCES `asiakas` (`asiakasID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tilitapahtumat`
--

DROP TABLE IF EXISTS `tilitapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tilitapahtumat` (
  `tilitapahtumaID` int(11) NOT NULL AUTO_INCREMENT,
  `saajannimi` varchar(45) DEFAULT NULL,
  `iban` varchar(18) DEFAULT NULL,
  `bic` varchar(12) DEFAULT NULL,
  `viite` varchar(45) DEFAULT NULL,
  `viesti` varchar(45) DEFAULT NULL,
  `maara` decimal(20,2) DEFAULT NULL,
  `tiliID` int(11) NOT NULL,
  `tapahtumaid` int(11) NOT NULL,
  `aika` datetime DEFAULT NULL,
  `erapaiva` date DEFAULT NULL,
  PRIMARY KEY (`tilitapahtumaID`),
  KEY `fk_tilitapahtumat_tili1_idx` (`tiliID`),
  KEY `fk_tilitapahtumat_tapahtumat1_idx` (`tapahtumaid`),
  CONSTRAINT `fk_tilitapahtumat_tapahtumat1` FOREIGN KEY (`tapahtumaid`) REFERENCES `tapahtumat` (`tapahtumaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tilitapahtumat_tili1` FOREIGN KEY (`tiliID`) REFERENCES `tili` (`tiliID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tunnarit`
--

DROP TABLE IF EXISTS `tunnarit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tunnarit` (
  `asiakasID` int(11) NOT NULL AUTO_INCREMENT,
  `kayttajatunnus` varchar(45) DEFAULT NULL,
  `passu` varchar(45) DEFAULT NULL,
  UNIQUE KEY `asiakasID_UNIQUE` (`asiakasID`),
  KEY `fk_tunnarit_asiakas1_idx` (`asiakasID`),
  CONSTRAINT `fk_tunnarit_asiakas1` FOREIGN KEY (`asiakasID`) REFERENCES `asiakas` (`asiakasID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-10 18:40:30
