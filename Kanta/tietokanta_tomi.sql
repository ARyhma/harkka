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
-- Dumping data for table `asiakas`
--

LOCK TABLES `asiakas` WRITE;
/*!40000 ALTER TABLE `asiakas` DISABLE KEYS */;
INSERT INTO `asiakas` VALUES (1,'Tom','Jablonski','305 - 14th Ave. S. Suite 3B',98128,'Seattle'),(2,'Zbyszek','Wolski','ul. Filtrowa 68',1012,'Walla'),(3,'Karl','Erichsen','Skagen 21',25506,'Stavanger'),(4,'Khloe','Espinoza','Duncannon St 99',4006,'London'),(5,'Maddie','Fletcher','Cockspur St 101A',1991,'Manchester'),(6,'Ebony','Ireland','Pall Mall Ave. 1021',14006,'Berlin'),(7,'Athena','Christensen','Suffolkgatan 1 B 25',25060,'GÃ¶teborg'),(8,'Zuzanna','Espinoza','Mannerheimintie 38',90110,'Helsinki');
/*!40000 ALTER TABLE `asiakas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `elasku`
--

LOCK TABLES `elasku` WRITE;
/*!40000 ALTER TABLE `elasku` DISABLE KEYS */;
INSERT INTO `elasku` VALUES (2,'Sahkofirma Pulju','FI9836478348','APANKKI','8373538494','Sahkolasku Syyskuu 2018',58.12,1,'2018-09-21 16:23:20','2018-10-24'),(3,'Oulun Vesi Oy','FI5166896742','DABAFIHH','485966483','Vesilasku 09-10/2018',92.70,1,'2018-09-22 18:32:29','2018-10-22'),(4,'Oulun Pianokoulu Oy','FI3664578544','ABOOFIHH','3756684999','Pianokoulun terkut',63.94,1,'2018-09-25 19:25:55','2018-10-29'),(5,'Vakuuttajat Oy','FI495094200230','OKOYFIHH','1234567890','Vakuutusmaksu osa 3',23.11,2,'2018-09-19 12:53:07','2018-10-19'),(6,'Oulun Sahko','FI9836478348','APANKKI','8373538494','Sahkolasku Syyskuu 2018',58.12,2,'2018-09-21 16:23:20','2018-10-24'),(7,'Haukiputaan Vesi Oy','FI5166896742','DABAFIHH','485966483','Vesilasku 09-10/2018',35.70,3,'2018-09-22 18:32:29','2018-10-22'),(8,'Oulun Musakoulu Oy','FI3664578544','ABOOFIHH','3756684999','Pianokoulun terkut',28.94,3,'2018-09-25 19:25:55','2018-10-29'),(9,'Luottokunta','FI495094200230','OKOYFIHH','1234567890','Luottolasku osa 3',234.20,4,'2018-09-19 12:53:07','2018-10-19'),(10,'Sahkofirma Pulju','FI9836478348','APANKKI','8373538494','Sahkolasku Syyskuu 2018',58.12,5,'2018-09-21 16:23:20','2018-10-24'),(11,'Kiimingin Vesi Oy','FI5166896742','DABAFIHH','485966483','Vesilasku 09-10/2018',12.45,6,'2018-09-22 18:32:29','2018-10-22'),(12,'Oulun Musakoulu Oy','FI3664578544','ABOOFIHH','3756684999','Pianokoulun terkut',33.94,6,'2018-09-25 19:25:55','2018-10-29'),(13,'Luottolasku','FI495094200230','OKOYFIHH','1234567890','Luottolasku osa 3',218.20,7,'2018-09-19 12:53:07','2018-10-19'),(14,'Sahkofirma Pulju','FI9836478348','APANKKI','8373538494','Sahkolasku Syyskuu 2018',23.25,7,'2018-09-21 16:23:20','2018-10-24'),(15,'Oulunsalon Vesi Oy','FI5166896742','DABAFIHH','485966483','Vesilasku 09-10/2018',45.70,7,'2018-09-22 18:32:29','2018-10-22'),(16,'Pianokoulu Oy','FI3664578544','ABOOFIHH','3756684999','Pianokoulun terkut',75.75,7,'2018-09-25 19:25:55','2018-10-29'),(17,'Luottolasku','FI495094200230','OKOYFIHH','1234567890','Luottolasku osa 3',218.20,8,'2018-09-19 12:53:07','2018-10-19'),(18,'Tietokone Lehti','FI9836478348','APANKKI','8373538494','Lehti 2018',23.25,8,'2018-09-21 16:23:20','2018-11-24'),(19,'Roskispojat Oy','FI5166896742','DABAFIHH','485966483','Roskalasku 09-10/2018',45.70,8,'2018-10-03 18:32:29','2018-11-22'),(20,'Verottaja Oy','FI3664578544','ABOOFIHH','3756684999','Terkut Hesasta',75.75,8,'2018-07-25 19:25:55','2018-11-29');
/*!40000 ALTER TABLE `elasku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luottotapahtumat`
--

DROP TABLE IF EXISTS `luottotapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luottotapahtumat` (
  `tilitapahtumaID` int(11) NOT NULL AUTO_INCREMENT,
  `saajannimi` varchar(45) DEFAULT NULL,
  `iban` varchar(18) DEFAULT NULL,
  `bic` varchar(12) DEFAULT NULL,
  `viite` varchar(45) DEFAULT NULL,
  `viesti` varchar(45) DEFAULT NULL,
  `maara` decimal(20,2) DEFAULT NULL,
  `tiliID` int(11) NOT NULL,
  `tapahtumaid` int(11) NOT NULL,
  `aika` date DEFAULT NULL,
  `erapaiva` date DEFAULT NULL,
  PRIMARY KEY (`tilitapahtumaID`),
  KEY `fk_tilitapahtumat_tili1_idx` (`tiliID`),
  KEY `fk_tilitapahtumat_tapahtumat1_idx` (`tapahtumaid`),
  CONSTRAINT `fk_tilitapahtumat2_tapahtumat1` FOREIGN KEY (`tapahtumaid`) REFERENCES `tapahtumat` (`tapahtumaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tilitapahtumat2_tili1` FOREIGN KEY (`tiliID`) REFERENCES `tili` (`tiliID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luottotapahtumat`
--

LOCK TABLES `luottotapahtumat` WRITE;
/*!40000 ALTER TABLE `luottotapahtumat` DISABLE KEYS */;
/*!40000 ALTER TABLE `luottotapahtumat` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pankkikortit`
--

LOCK TABLES `pankkikortit` WRITE;
/*!40000 ALTER TABLE `pankkikortit` DISABLE KEYS */;
INSERT INTO `pankkikortit` VALUES (1,'Tomin masteri','2020-09-19',63727848493,1000,1,1),(2,'Tomin visa','2024-09-21',93863673894,5000,1,2),(3,'Visa','2022-09-19',65374848432,12000,2,3),(4,'American Express','2025-12-19',2938647689,2000,2,4),(5,'Master Card','2019-12-27',736384637348,5000,2,5),(6,'Karls Only Card','2020-10-30',837638249348,5000,3,6),(7,'Khloe Card-1','2020-10-09',75382919448994,50000,4,8),(8,'Khloe Card-2','2021-11-07',3892736588578,1000,4,9),(9,'Maddies Master Card','2021-11-22',3892736588578,4000,5,11),(10,'Maddies Visa Card','2021-01-17',938363884799398,5000,5,11),(11,'Ebony Visa Card','2021-01-05',33488476583864,5000,6,13),(12,'Ebony Visa Card','2022-01-07',384643884873889,6000,6,14),(13,'Athena One','2022-01-11',235254436456654,6000,7,15),(14,'Athena Two','2022-05-24',3657655765677,9000,7,16),(15,'Athena Three','2021-02-16',523453446665655,3000,7,17),(16,'Zuzanna-1','2023-02-16',93834646938864,3000,8,18),(17,'Zuzanna-2','2021-07-19',7383487464638,9000,8,19),(18,'Zuzanna-3','2019-02-13',73745282939449,6000,8,20),(19,'Zuzanna-4','2018-12-22',52626365483834,13000,8,21);
/*!40000 ALTER TABLE `pankkikortit` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tapahtumat`
--

LOCK TABLES `tapahtumat` WRITE;
/*!40000 ALTER TABLE `tapahtumat` DISABLE KEYS */;
INSERT INTO `tapahtumat` VALUES (1,'e-maksu'),(2,'Korttiosto'),(3,'Itsepalvelu');
/*!40000 ALTER TABLE `tapahtumat` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tili`
--

LOCK TABLES `tili` WRITE;
/*!40000 ALTER TABLE `tili` DISABLE KEYS */;
INSERT INTO `tili` VALUES (1,'Tomin tili','987654-64758654',220.25,'FI4347564758654889','APANKKI',1),(2,'Tomin toinen tili','987654-23567345',1502.32,'FI4347564758676128','APANKKI',1),(3,'Zbyszek tili yksi','987654-62563267',23010.90,'FI4389763256842454','APANKKI',2),(4,'Zbyszek tili kaksi','987654-87334567',8099.25,'PL7398286378998636','APANKKI',2),(5,'Zbyszek tili kolme','987654-93859495',350.83,'PL7398232837688636','APANKKI',2),(6,'Karls Account','987654-4677332444',2010.28,'FI4386133546852158','APANKKI',3),(7,'Karls Second Account','987654-325662322',19014.10,'FI8736893949874158','APANKKI',3),(8,'Khloe saastotili','987654-13455233',29832.02,'FI235544758654899','APANKKI',4),(9,'Khloe tuhlaustili','987654-33443256',10990.52,'FI4347123758654899','APANKKI',4),(10,'Khloe piilorahat','987654-233345553',232.90,'FI4347564758234526','APANKKI',4),(11,'Maddien Jemma','987654-177733344',13232.10,'FI4347564758234526','APANKKI',5),(12,'Maddien Tili','987654-76345533',6232.22,'FI1983797368234526','APANKKI',5),(13,'Ebony yksi','987654-78764454',1290.25,'UK7553288998736768','APANKKI',6),(14,'Ebony kaksi','987654-23334455',22290.10,'UK7553286293987362','APANKKI',6),(15,'Athena-1','987654-77642345',9111.93,'UK7553286293987362','APANKKI',7),(16,'Athena-2','987654-44676786',43768.52,'UK7329275353838735','APANKKI',7),(17,'Athena-3','987654-45622233',90170.10,'UK9086178253567288','APANKKI',7),(18,'Zuzas Account 1','987654-67764422',10927.68,'SE9009297738003772','APANKKI',8),(19,'Zuzas Account 2','987654-55700656',1027.25,'SE9009297009820272','APANKKI',8),(20,'Zuzas Account 3','987654-22455609',22901.52,'SE9018202748020300','APANKKI',8),(21,'Zuzas Account 4','987654-70076000',927.52,'SE9092837932826500','APANKKI',8);
/*!40000 ALTER TABLE `tili` ENABLE KEYS */;
UNLOCK TABLES;

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
  `aika` date DEFAULT NULL,
  `erapaiva` date DEFAULT NULL,
  PRIMARY KEY (`tilitapahtumaID`),
  KEY `fk_tilitapahtumat_tili1_idx` (`tiliID`),
  KEY `fk_tilitapahtumat_tapahtumat1_idx` (`tapahtumaid`),
  CONSTRAINT `fk_tilitapahtumat_tapahtumat1` FOREIGN KEY (`tapahtumaid`) REFERENCES `tapahtumat` (`tapahtumaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tilitapahtumat_tili1` FOREIGN KEY (`tiliID`) REFERENCES `tili` (`tiliID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tilitapahtumat`
--

LOCK TABLES `tilitapahtumat` WRITE;
/*!40000 ALTER TABLE `tilitapahtumat` DISABLE KEYS */;
INSERT INTO `tilitapahtumat` VALUES (1,'Masa Jokinen','FI49509420028730','OKOYFIHH','12348765','Isille rahaa',-200.20,1,1,'2018-08-19',NULL),(2,'Matti Mainio','FI495000942003','DABAFIHH','987654321','Olut massit',-108.50,2,3,'2018-07-19',NULL),(3,'Kalle Katala','FI4650119028733','APANKKI','100225','Rahaa tulee',-45.20,3,1,'2018-04-19',NULL),(4,'Liisa Luopio','FI465322354463','NDEAFIHH','387624','Osto',-2.24,4,1,'2018-06-19',NULL),(5,'Tiina Tuomi','FI4650645224528733','APANKKI','134525','Lahjaksi',-5.30,5,3,'2018-05-19',NULL),(6,'Janne Jalka','FI465623234546623','DABAFIHH','25564563',NULL,-52.10,6,1,'2018-09-19',NULL),(7,'Onni Onnela','FI46501194133','APANKKI',NULL,'Kalliiksi kavi',-12.50,7,1,'2018-08-19',NULL),(8,'Kalle Koski','FI4650152254432','DABAFIHH',NULL,'Terkut',-41.20,8,2,'2018-08-19',NULL),(9,'Miina Mainio','FI14589656884','OKOYFIHH','12348765','Otolle rahaa',-20.20,1,1,'2018-05-19',NULL),(10,'Minna Jokinen','FI1321468556','DABAFIHH','987654321','Sixpack massit',-1023.00,2,3,'2018-03-19',NULL),(11,'Kaija Katala','FI1322543467','APANKKI','100225','Rahaa menee',-43.20,3,3,'2018-01-19',NULL),(12,'Liisa Luopio','FI11942002803','OKOYFIHH','387624','Osto kaksi',-12.24,4,1,'2018-09-19',NULL),(13,'Tommi Tuomi','FI469420028003','APANKKI','134525','Kalliiksi kavi',-5.30,5,1,'2018-07-19',NULL),(14,'Jenna Jalka','FI46501194233','DABAFIHH','25564563',NULL,-122.10,6,3,'2018-04-19',NULL),(15,'Olavi Onnela','FI4650119433','APANKKI',NULL,'Lahjaksi',-72.50,7,1,'2018-04-19',NULL),(16,'Kille Koski','FI4123119733','DABAFIHH',NULL,'Hepalle',-64.20,8,2,'2018-06-19',NULL),(17,'Viljami Vainio','FI495094200230','OKOYFIHH','12348765','Isille rahaa',-120.20,9,3,'2018-04-19',NULL),(18,'Martti Muurila','FI49500092003','DABAFIHH','987654321','Olut massit',-18.50,9,2,'2018-05-19',NULL),(19,'Sinikka Suo','FI4650119028733','NDEAFIHH','100225','Rahaa tulee',-25.67,10,3,'2018-06-19',NULL),(20,'Helena Helli','FI465322354463','OKOYFIHH','387624','Osto',-12.25,10,1,'2018-07-19',NULL),(21,'Pasi Penni','FI4650645224528733','APANKKI','134525','Kalliiksi kavi',-25.53,11,2,'2018-03-19',NULL),(22,'Tuomo Tuomi','FI465623234546623','DABAFIHH','25564563',NULL,-27.45,11,1,'2018-03-19',NULL),(23,'Leino Lanne','FI46501194133','APANKKI',NULL,'Kalliiksi kavi',-26.50,12,1,'2018-02-19',NULL),(24,'Minttu Miina','FI4650152254432','NDEAFIHH',NULL,'Terkut',-85.20,12,2,'2018-05-19',NULL),(25,'Lassi Luopio','FI14589656884','OKOYFIHH','12348765','Kissalle rahaa',-46.20,13,3,'2018-08-19',NULL),(26,'Eija Elin','FI1321468556','DABAFIHH','987654321','Lahjaksi',-258.00,13,2,'2018-03-19',NULL),(27,'Susanna Sala','FI1322543467','APANKKI','100225','Rahaa menee',-35.20,14,3,'2018-02-19',NULL),(28,'Minttu Suo','FI11942002803','NDEAFIHH','387624','Osto kaksi',-85.83,14,1,'2018-05-19',NULL),(29,'Helena Tuomi','FI469420028003','APANKKI','134525','Kalliiksi kavi',-65.34,15,3,'2018-07-19',NULL),(30,'Martti Vainio','FI46501194233','DABAFIHH','25564563',NULL,-410.45,16,3,'2018-08-19',NULL),(31,'Viljami Miina','FI4650119433','NDEAFIHH',NULL,'Halpaa ku saippua',-50.50,17,1,'2018-08-19',NULL),(32,'Tuomo Matala','FI4123119733','DABAFIHH',NULL,'Koiralle',-49.56,18,2,'2018-07-19',NULL),(33,'Martti Miina','FI4650152254432','NDEAFIHH',NULL,'Terkut',-85.20,19,3,'2018-05-19',NULL),(34,'Tuomo Luopio','FI14589656884','OKOYFIHH','12348765','Otolle rahaa',-46.20,19,1,'2018-08-19',NULL),(35,'Helena Elin','FI1321468556','DABAFIHH','987654321','Sixpack massit',-258.00,20,2,'2018-03-19',NULL),(36,'Liisa Sala','FI1322543467','APANKKI','100225','Rahaa',-35.20,20,3,'2018-02-19',NULL),(37,'Pekka Suo','FI11942002803','OKOYFIHH','387624','Osto kolme',-85.83,21,3,'2018-05-19',NULL),(38,'Kille Tuomi','FI469420028003','NDEAFIHH','134525','Kalliiksi kavi',-65.34,21,2,'2018-07-19',NULL),(39,'Heini Vainio','FI46501194233','DABAFIHH','25564563',NULL,-410.45,21,3,'2018-08-19',NULL),(40,'Voitto Miina','FI4650119433','APANKKI',NULL,'Halpaa ku saippua',-50.50,21,1,'2018-08-19',NULL),(41,'Jami Katala','FI4123119733','NDEAFIHH',NULL,'Kalaan',-49.56,21,3,'2018-07-19',NULL),(43,'Vakuuttajat Oy','FI495094200230','APANKKI','1234567890','Vakuutusmaksu osa 3',-318.20,2,1,'2018-10-02','2018-10-19'),(44,'Tom Jablonski','FI4347564758676128','APANKKI','','Massimies',-200.00,2,3,'2018-10-03','2003-10-20'),(45,'Tom Jablonski','FI4347564758654889','APANKKI','','Massimies',200.00,1,3,'2018-10-03','2003-10-20');
/*!40000 ALTER TABLE `tilitapahtumat` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `tunnarit`
--

LOCK TABLES `tunnarit` WRITE;
/*!40000 ALTER TABLE `tunnarit` DISABLE KEYS */;
INSERT INTO `tunnarit` VALUES (1,'yksi','yksi'),(2,'kaksi','kaksi'),(3,'kolme','kolme'),(4,'nelja','nelja'),(5,'viisi','viisi'),(6,'kuusi','kuusi'),(7,'seitseman','seitseman'),(8,'kahdeksan','kahdeksan');
/*!40000 ALTER TABLE `tunnarit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-03 23:42:35
