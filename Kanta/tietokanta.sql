-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema opisk_c8hape00
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema opisk_c8hape00
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `opisk_c8hape00` DEFAULT CHARACTER SET utf8 ;
USE `opisk_c8hape00` ;

-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`asiakas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`asiakas` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`asiakas` (
  `asiakasID` INT NOT NULL AUTO_INCREMENT,
  `etunimi` VARCHAR(45) NULL,
  `sukunimi` VARCHAR(45) NULL,
  `osoite` VARCHAR(45) NULL,
  `postinumero` INT NULL,
  `postitoimipaikka` VARCHAR(45) NULL,
  PRIMARY KEY (`asiakasID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`tili`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`tili` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`tili` (
  `tiliID` INT NOT NULL AUTO_INCREMENT,
  `tilinnimi` VARCHAR(45) NULL,
  `tilinumero` VARCHAR(18) NULL,
  `saldo` DECIMAL(65,2) NULL,
  `iban` VARCHAR(18) NULL,
  `bic` VARCHAR(12) NULL,
  `omistajaID` INT NOT NULL,
  PRIMARY KEY (`tiliID`),
  INDEX `fk_tili_asiakas1_idx` (`omistajaID` ASC),
  CONSTRAINT `fk_tili_asiakas1`
    FOREIGN KEY (`omistajaID`)
    REFERENCES `opisk_c8hape00`.`asiakas` (`asiakasID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`pankkikortit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`pankkikortit` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`pankkikortit` (
  `pankkikorttiID` INT NOT NULL AUTO_INCREMENT,
  `pankkikortinnimi` VARCHAR(45) NULL,
  `voimassaolo` DATETIME NOT NULL,
  `kortinnumero` DOUBLE NOT NULL,
  `luottoraja` DOUBLE NOT NULL,
  `asiakasid` INT NOT NULL,
  `tili_tiliID` INT NOT NULL,
  PRIMARY KEY (`pankkikorttiID`),
  INDEX `fk_pankkikortit_asiakas_idx` (`asiakasid` ASC),
  INDEX `fk_pankkikortit_tili1_idx` (`tili_tiliID` ASC),
  CONSTRAINT `fk_pankkikortit_asiakas`
    FOREIGN KEY (`asiakasid`)
    REFERENCES `opisk_c8hape00`.`asiakas` (`asiakasID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pankkikortit_tili1`
    FOREIGN KEY (`tili_tiliID`)
    REFERENCES `opisk_c8hape00`.`tili` (`tiliID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`tapahtumat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`tapahtumat` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`tapahtumat` (
  `tapahtumaid` INT NOT NULL AUTO_INCREMENT,
  `tapahtuma` VARCHAR(45) NULL,
  PRIMARY KEY (`tapahtumaid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`tilitapahtumat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`tilitapahtumat` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`tilitapahtumat` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `saajannimi` VARCHAR(45) NULL,
  `IBAN` VARCHAR(18) NULL,
  `BIC` VARCHAR(12) NULL,
  `viite` VARCHAR(45) NULL,
  `viesti` VARCHAR(45) NULL,
  `maara` DECIMAL(20,2) NULL,
  `tiliID` INT NOT NULL,
  `tapahtumaid` INT NOT NULL,
  `aika` DATETIME NULL,
  `erapaiva` DATETIME NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_tilitapahtumat_tili1_idx` (`tiliID` ASC),
  INDEX `fk_tilitapahtumat_tapahtumat1_idx` (`tapahtumaid` ASC),
  CONSTRAINT `fk_tilitapahtumat_tili1`
    FOREIGN KEY (`tiliID`)
    REFERENCES `opisk_c8hape00`.`tili` (`tiliID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tilitapahtumat_tapahtumat1`
    FOREIGN KEY (`tapahtumaid`)
    REFERENCES `opisk_c8hape00`.`tapahtumat` (`tapahtumaid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opisk_c8hape00`.`tunnarit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`tunnarit` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`tunnarit` (
  `asiakasID` INT NOT NULL AUTO_INCREMENT,
  `kayttajatunnus` VARCHAR(45) NULL,
  `passu` VARCHAR(45) NULL,
  INDEX `fk_tunnarit_asiakas1_idx` (`asiakasID` ASC),
  UNIQUE INDEX `asiakasID_UNIQUE` (`asiakasID` ASC),
  CONSTRAINT `fk_tunnarit_asiakas1`
    FOREIGN KEY (`asiakasID`)
    REFERENCES `opisk_c8hape00`.`asiakas` (`asiakasID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`asiakas`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (1, 'Tom', 'Jablonski', '305 - 14th Ave. S. Suite 3B', 98128, 'Seattle');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (2, 'Zbyszek', 'Wolski', 'ul. Filtrowa 68', 01012, 'Walla');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (3, 'Karl', 'Erichsen', 'Skagen 21', 4006, 'Stavanger');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (4, 'Khloe', 'Espinoza', 'Duncannon St 99', 4006, 'London');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (5, 'Maddie', 'Fletcher', 'Cockspur St 101A', 01991, 'Manchester');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (6, 'Ebony', 'Ireland', 'Pall Mall Ave. 1021', 14006, 'Berlin');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (7, 'Athena', 'Christensen', 'Suffolkgatan 1 B 10', 25060, 'Stocholm');
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (8, 'Zuzanna', 'Espinoza', 'Mannerheimintie 38', 90110, 'Helsinki');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`tili`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (1, 'Tomin tili', '987654-64758654', 20.25, 'APANKKI', 'FI4347564758654889', 1);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (2, 'Tomin toinen tili',  '987654-64758654', 2020.52, 'APANKKI', 'FI4347564758676128', 1);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (3, 'Zbyszek tili yksi', '987654-64758654', 23010.90, 'APANKKI', 'FI4389763256842454', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (4, 'Zbyszek tili kaksi', '987654-64758654', 8099.25, 'APANKKI', 'PL7398286378998636', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (5, 'Zbyszek tili kolme', '987654-64758654', 350.83, 'APANKKI', 'PL7398232837688636', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (6, 'Karls Account', '987654-64758654', 2010.28, 'APANKKI', 'FI4386133546852158', 3);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (7, 'Karls Second Account', '987654-64758654', 19014.10, 'APANKKI', 'FI8736893949874158', 3);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (8, 'Khloe saastotili', '987654-64758654', 29832.02, 'APANKKI', 'FI235544758654899', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (9, 'Khloe tuhlaustili', '987654-64758654', 10990.52, 'APANKKI', 'FI4347123758654899', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (10, 'Khloe piilorahat', '987654-64758654', 232.90, 'APANKKI', 'FI4347564758234526', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (11, 'Maddie piilorahat', '987654-64758654', 13232.10, 'APANKKI', 'FI4347564758234526', 5);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (12, 'Maddien tili', '987654-64758654', 6232.22, 'APANKKI', 'FI1983797368234526', 5);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (13, 'Ebony yksi', '987654-64758654', 1290.25, 'APANKKI', 'UK7553288998736768', 6);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (14, 'Ebony kaksi', '987654-64758654', 22290.10, 'APANKKI', 'UK7553286293987362', 6);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (15, 'Athena-1', '987654-64758654', 9111.93, 'APANKKI', 'UK7553286293987362', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (16, 'Athena-2', '987654-64758654', 83768.52, 'APANKKI', 'UK7329275353838735', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (17, 'Athena-3', '987654-64758654', 901870.10, 'APANKKI', 'UK9086178253567288', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (18, 'Zuzanna 1', '987654-64758654', 10927.68, 'APANKKI', 'SE9009297738003772', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (19, 'Zuzanna 2', '987654-64758654', 10927.25, 'APANKKI', 'SE9009297009820272', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (20, 'Zuzanna 3', '987654-64758654', 22901.52, 'APANKKI', 'SE9018202748020300', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (21, 'Zuzanna 4', '987654-64758654', 927.52, 'APANKKI', 'SE9092837932826500', 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`pankkikortit`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (1, 'Tomin masteri', '2020-09-19 00:00:00', 63727848493, 1000, 1, 1);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (2, 'Tomin visa', '2024-09-21 10:00:00', 93863673894, 5000, 1, 2);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (3, 'Visa', '2022-09-19 12:30:00', 65374848432, 12000, 2, 3);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (4, 'American Express', '2025-12-19 12:00:00', 2938647689, 2000, 2, 4);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (5, 'Master Card', '2019-12-27 10:00:00', 736384637348, 5000, 2, 5);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (6, 'Karls Only Card', '2020-10-30 08:00:00', 837638249348, 5000, 3, 6);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (7, 'Khloe Card-1', '2020-10-09 09:00:00', 75382919448994, 50000, 4, 8);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (8, 'Khloe Card-2', '2021-11-07 08:00:00', 3892736588578, 1000, 4, 9);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (9, 'Maddies Master Card', '2021-11-22 12:00:00', 3892736588578, 4000, 5, 11);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (10, 'Maddies Visa Card', '2021-01-17 08:00:00', 938363884799398, 5000, 5, 11);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (11, 'Ebony Visa Card', '2021-01-05 08:00:00', 33488476583864, 5000, 6, 13);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (12, 'Ebony Visa Card', '2022-01-07 12:00:00', 384643884873889, 6000, 6, 14);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (13, 'Athena One', '2022-01-11 08:00:00', 235254436456654, 6000, 7, 15);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (14, 'Athena Two', '2022-05-24 10:00:00', 3657655765677, 9000, 7, 16);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (15, 'Athena Three', '2021-02-16 08:00:00', 523453446665655, 3000, 7, 17);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (16, 'Zuzanna-1', '2023-02-16 00:00:00', 93834646938864, 3000, 8, 18);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (17, 'Zuzanna-2', '2021-07-19 08:00:00', 7383487464638, 9000, 8, 19);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (18, 'Zuzanna-3', '2019-02-13 04:00:00', 73745282939449, 6000, 8, 20);
INSERT INTO `opisk_c8hape00`.`pankkikortit` (`pankkikorttiID`, `pankkikortinnimi`, `voimassaolo`, `kortinnumero`, `luottoraja`, `asiakasid`, `tili_tiliID`) VALUES (19, 'Zuzanna-4', '2018-12-22 08:00:00', 52626365483834, 13000, 8, 21);

COMMIT;


-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`tapahtumat`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`tapahtumat` (`tapahtumaid`, `tapahtuma`) VALUES (1, 'e-maksu');
INSERT INTO `opisk_c8hape00`.`tapahtumat` (`tapahtumaid`, `tapahtuma`) VALUES (2, 'Korttiosto');
INSERT INTO `opisk_c8hape00`.`tapahtumat` (`tapahtumaid`, `tapahtuma`) VALUES (3, 'Itsepalvelu');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`tilitapahtumat`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (1, 'Masa Mainio', 'FI4950009420028730', 'OKOYFIHH', '12348765', 'Isille rahaa', 200.20, 1, 1, '2018-08-19 16:53:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (2, 'Matti Mainio', 'FI4950009420028733', 'DABAFIHH', '987654321', 'Olut massit', 1000, 2, 2, '2018-07-19 16:12:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (3, 'Kalle Katala', 'FI4650119420028733', 'APANKKI', '100225', 'Rahaa tulee', 45.20, 3, 3, '2018-04-19 06:14:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (4, 'Liisa Luopio', 'FI4650119420028733', 'OKOYFIHH', '387624', 'Osto', 2.24, 4, 1, '2018-06-19 16:32:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (5, 'Tiina Tuomi', 'FI4650119420028733', 'APANKKI', '134525', 'Kalliiksi kavi', 5.30, 5, 2, '2018-05-19 17:53:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (6, 'Janne Jalka', 'FI4650119420028733', 'DABAFIHH', '25564563', NULL, 52.10, 6, 3, '2018-09-19 16:53:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (7, 'Onni Onnela', 'FI4650119420028733', 'APANKKI', NULL, 'Kalliiksi kavi', 12.50, 7, 1, '2018-08-19 07:53:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`ID`, `saajannimi`, `IBAN`, `BIC`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (8, 'Kalle Koski', 'FI4650119420028733', 'DABAFIHH', NULL, 'Terkut', 41.20, 8, 2, '2018-06-19 04:53:13', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `opisk_c8hape00`.`tunnarit`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (1, 'yksi', 'yksi');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (2, 'kaksi', 'kaksi');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (3, 'kolme', 'kolme');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (4, 'nelja', 'nelja');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (5, 'viisi', 'viisi');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (6, 'kuusi', 'kuusi');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (7, 'seitseman', 'seitseman');
INSERT INTO `opisk_c8hape00`.`tunnarit` (`asiakasID`, `kayttajatunnus`, `passu`) VALUES (8, 'kahdeksan', 'kahdeksan');

COMMIT;
