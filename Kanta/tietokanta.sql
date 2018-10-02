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
-- Table `opisk_c8hape00`.`pankkikortit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opisk_c8hape00`.`elasku` ;

CREATE TABLE IF NOT EXISTS `opisk_c8hape00`.`elasku` (
  `elaskuID` INT NOT NULL AUTO_INCREMENT,
  `saajannimi` VARCHAR(45) NULL,
  `iban` VARCHAR(18) NULL,
  `bic` VARCHAR(12) NULL,
  `viite` VARCHAR(45) NULL,
  `viesti` VARCHAR(45) NULL,
  `maara` DECIMAL(20,2) NULL,
  `asiakasid` INT NOT NULL,
  `aika` DATETIME NULL,
  `erapaiva` DATETIME NULL,
  PRIMARY KEY (`elaskuID`),
  INDEX `fk_elasku_asiakas_idx` (`asiakasid` ASC),
  CONSTRAINT `fk_elasku_asiakas`
    FOREIGN KEY (`asiakasid`)
    REFERENCES `opisk_c8hape00`.`asiakas` (`asiakasID`)
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
  `tilitapahtumaID` INT NOT NULL AUTO_INCREMENT,
  `saajannimi` VARCHAR(45) NULL,
  `iban` VARCHAR(18) NULL,
  `bic` VARCHAR(12) NULL,
  `viite` VARCHAR(45) NULL,
  `viesti` VARCHAR(45) NULL,
  `maara` DECIMAL(20,2) NULL,
  `tiliID` INT NOT NULL,
  `tapahtumaid` INT NOT NULL,
  `aika` DATETIME NULL,
  `erapaiva` DATETIME NULL,
  PRIMARY KEY (`tilitapahtumaID`),
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
INSERT INTO `opisk_c8hape00`.`asiakas` (`asiakasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `postitoimipaikka`) VALUES (3, 'Karl', 'Erichsen', 'Skagen 21', 25506, 'Stavanger');
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
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (1, 'Tomin tili', '987654-64758654', 20.25, 'FI4347564758654889', 'APANKKI', 1);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (2, 'Tomin toinen tili',  '987654-23567345', 2020.52, 'FI4347564758676128', 'APANKKI', 1);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (3, 'Zbyszek tili yksi', '987654-62563267', 23010.90, 'FI4389763256842454', 'APANKKI', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (4, 'Zbyszek tili kaksi', '987654-87334567', 8099.25, 'PL7398286378998636', 'APANKKI', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (5, 'Zbyszek tili kolme', '987654-93859495', 350.83, 'PL7398232837688636', 'APANKKI', 2);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (6, 'Karls Account', '987654-4677332444', 2010.28, 'FI4386133546852158', 'APANKKI', 3);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (7, 'Karls Second Account', '987654-325662322', 19014.10, 'FI8736893949874158', 'APANKKI', 3);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (8, 'Khloe saastotili', '987654-13455233', 29832.02, 'FI235544758654899', 'APANKKI', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (9, 'Khloe tuhlaustili', '987654-33443256', 10990.52, 'FI4347123758654899', 'APANKKI', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (10, 'Khloe piilorahat', '987654-233345553', 232.90, 'FI4347564758234526', 'APANKKI', 4);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (11, 'Maddien Jemma', '987654-177733344', 13232.10,  'FI4347564758234526', 'APANKKI', 5);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (12, 'Maddien Tili', '987654-76345533', 6232.22, 'FI1983797368234526', 'APANKKI', 5);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (13, 'Ebony yksi', '987654-78764454', 1290.25, 'UK7553288998736768', 'APANKKI', 6);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (14, 'Ebony kaksi', '987654-23334455', 22290.10, 'UK7553286293987362', 'APANKKI', 6);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (15, 'Athena-1', '987654-77642345', 9111.93, 'UK7553286293987362', 'APANKKI', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (16, 'Athena-2', '987654-44676786', 43768.52, 'UK7329275353838735', 'APANKKI', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (17, 'Athena-3', '987654-45622233', 90170.10, 'UK9086178253567288', 'APANKKI', 7);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (18, 'Zuzas Account 1', '987654-67764422', 10927.68, 'SE9009297738003772', 'APANKKI', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (19, 'Zuzas Account 2', '987654-55700656', 1027.25, 'SE9009297009820272', 'APANKKI', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (20, 'Zuzas Account 3', '987654-22455609', 22901.52, 'SE9018202748020300', 'APANKKI', 8);
INSERT INTO `opisk_c8hape00`.`tili` (`tiliID`, `tilinnimi`, `tilinumero`, `saldo`, `iban`, `bic`, `omistajaID`) VALUES (21, 'Zuzas Account 4', '987654-70076000', 927.52, 'SE9092837932826500', 'APANKKI', 8);

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
-- Data for table `opisk_c8hape00`.`elasku`
-- -----------------------------------------------------
START TRANSACTION;
USE `opisk_c8hape00`;
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (1, 'Vakuuttajat Oy', 'FI495094200230', 'OKOYFIHH', '1234567890', 'Vakuutusmaksu osa 3', 318.20, 1, '2018-09-19 12:53:07', '2018-10-19 12:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (2, 'Sahkofirma Pulju', 'FI9836478348', 'APANKKI', '8373538494', 'Sahkolasku Syyskuu 2018', 58.12, 1, '2018-09-21 16:23:20', '2018-10-24 18:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (3, 'Oulun Vesi Oy', 'FI5166896742', 'DABAFIHH', '485966483', 'Vesilasku 09-10/2018', 92.70, 1, '2018-09-22 18:32:29', '2018-10-22 14:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (4, 'Oulun Pianokoulu Oy', 'FI3664578544', 'ABOOFIHH', '3756684999', 'Pianokoulun terkut', 63.94, 1, '2018-09-25 19:25:55', '2018-10-29 06:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (5, 'Vakuuttajat Oy', 'FI495094200230', 'OKOYFIHH', '1234567890', 'Vakuutusmaksu osa 3', 23.11, 2, '2018-09-19 12:53:07', '2018-10-19 12:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (6, 'Oulun Sahko', 'FI9836478348', 'APANKKI', '8373538494', 'Sahkolasku Syyskuu 2018', 58.12, 2, '2018-09-21 16:23:20', '2018-10-24 18:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (7, 'Haukiputaan Vesi Oy', 'FI5166896742', 'DABAFIHH', '485966483', 'Vesilasku 09-10/2018', 35.70, 3, '2018-09-22 18:32:29', '2018-10-22 14:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (8, 'Oulun Musakoulu Oy', 'FI3664578544', 'ABOOFIHH', '3756684999', 'Pianokoulun terkut', 28.94, 3, '2018-09-25 19:25:55', '2018-10-29 06:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (9, 'Luottokunta', 'FI495094200230', 'OKOYFIHH', '1234567890', 'Luottolasku osa 3', 234.20, 4, '2018-09-19 12:53:07', '2018-10-19 12:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (10, 'Sahkofirma Pulju', 'FI9836478348', 'APANKKI', '8373538494', 'Sahkolasku Syyskuu 2018', 58.12, 5, '2018-09-21 16:23:20', '2018-10-24 18:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (11, 'Kiimingin Vesi Oy', 'FI5166896742', 'DABAFIHH', '485966483', 'Vesilasku 09-10/2018', 12.45, 6, '2018-09-22 18:32:29', '2018-10-22 14:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (12, 'Oulun Musakoulu Oy', 'FI3664578544', 'ABOOFIHH', '3756684999', 'Pianokoulun terkut', 33.94, 6, '2018-09-25 19:25:55', '2018-10-29 06:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (13, 'Luottolasku', 'FI495094200230', 'OKOYFIHH', '1234567890', 'Luottolasku osa 3', 218.20, 7, '2018-09-19 12:53:07', '2018-10-19 12:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (14, 'Sahkofirma Pulju', 'FI9836478348', 'APANKKI', '8373538494', 'Sahkolasku Syyskuu 2018', 23.25, 7, '2018-09-21 16:23:20', '2018-10-24 18:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (15, 'Oulunsalon Vesi Oy', 'FI5166896742', 'DABAFIHH', '485966483', 'Vesilasku 09-10/2018', 45.70, 7, '2018-09-22 18:32:29', '2018-10-22 14:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (16, 'Pianokoulu Oy', 'FI3664578544', 'ABOOFIHH', '3756684999', 'Pianokoulun terkut', 75.75, 7, '2018-09-25 19:25:55', '2018-10-29 06:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (17, 'Luottolasku', 'FI495094200230', 'OKOYFIHH', '1234567890', 'Luottolasku osa 3', 218.20, 8, '2018-09-19 12:53:07', '2018-10-19 12:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (18, 'Tietokone Lehti', 'FI9836478348', 'APANKKI', '8373538494', 'Lehti 2018', 23.25, 8, '2018-09-21 16:23:20', '2018-11-24 18:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (19, 'Roskispojat Oy', 'FI5166896742', 'DABAFIHH', '485966483', 'Roskalasku 09-10/2018', 45.70, 8, '2018-10-03 18:32:29', '2018-11-22 14:00:00');
INSERT INTO `opisk_c8hape00`.`elasku` (`elaskuID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `asiakasID`, `aika`, `erapaiva`) VALUES (20, 'Verottaja Oy', 'FI3664578544', 'ABOOFIHH', '3756684999', 'Terkut Hesasta', 75.75, 8, '2018-07-25 19:25:55', '2018-11-29 06:00:00');

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
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (1, 'Masa Jokinen', 'FI49509420028730', 'OKOYFIHH', '12348765', 'Isille rahaa', -200.20, 1, 1, '2018-08-19 16:53:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (2, 'Matti Mainio', 'FI495000942003', 'DABAFIHH', '987654321', 'Olut massit', -108.50, 2, 3, '2018-07-19 16:12:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (3, 'Kalle Katala', 'FI4650119028733', 'APANKKI', '100225', 'Rahaa tulee', -45.20, 3, 1, '2018-04-19 06:14:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (4, 'Liisa Luopio', 'FI465322354463', 'NDEAFIHH', '387624', 'Osto', -2.24, 4, 1, '2018-06-19 16:32:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (5, 'Tiina Tuomi', 'FI4650645224528733', 'APANKKI', '134525', 'Lahjaksi', -5.30, 5, 3, '2018-05-19 17:53:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (6, 'Janne Jalka', 'FI465623234546623', 'DABAFIHH', '25564563', NULL, -52.10, 6, 1, '2018-09-19 16:53:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (7, 'Onni Onnela', 'FI46501194133', 'APANKKI', NULL, 'Kalliiksi kavi', -12.50, 7, 1, '2018-08-19 07:53:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (8, 'Kalle Koski', 'FI4650152254432', 'DABAFIHH', NULL, 'Terkut', -41.20, 8, 2, '2018-08-19 04:53:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (9, 'Miina Mainio', 'FI14589656884', 'OKOYFIHH', '12348765', 'Otolle rahaa', -20.20, 1, 1, '2018-05-19 12:53:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (10, 'Minna Jokinen', 'FI1321468556', 'DABAFIHH', '987654321', 'Sixpack massit', -1023.00, 2, 3, '2018-03-19 12:12:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (11, 'Kaija Katala', 'FI1322543467', 'APANKKI', '100225', 'Rahaa menee', -43.20, 3, 3, '2018-01-19 06:14:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (12, 'Liisa Luopio', 'FI11942002803', 'OKOYFIHH', '387624', 'Osto kaksi', -12.24, 4, 1, '2018-09-19 12:32:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (13, 'Tommi Tuomi', 'FI469420028003', 'APANKKI', '134525', 'Kalliiksi kavi', -5.30, 5, 1, '2018-07-19 18:53:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (14, 'Jenna Jalka', 'FI46501194233', 'DABAFIHH', '25564563', NULL, -122.10, 6, 3, '2018-04-19 19:53:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (15, 'Olavi Onnela', 'FI4650119433', 'APANKKI', NULL, 'Lahjaksi', -72.50, 7, 1, '2018-04-19 07:53:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (16, 'Kille Koski', 'FI4123119733', 'DABAFIHH', NULL, 'Hepalle', -64.20, 8, 2, '2018-06-19 09:53:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (17, 'Viljami Vainio', 'FI495094200230', 'OKOYFIHH', '12348765', 'Isille rahaa', -120.20, 9,3, '2018-04-19 16:53:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (18, 'Martti Muurila', 'FI49500092003', 'DABAFIHH', '987654321', 'Olut massit', -18.50, 9, 2, '2018-05-19 16:17:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (19, 'Sinikka Suo', 'FI4650119028733', 'NDEAFIHH', '100225', 'Rahaa tulee', -25.67, 10, 3, '2018-06-19 06:14:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (20, 'Helena Helli', 'FI465322354463', 'OKOYFIHH', '387624', 'Osto', -12.25, 10, 1, '2018-07-19 16:12:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (21, 'Pasi Penni', 'FI4650645224528733', 'APANKKI', '134525', 'Kalliiksi kavi', -25.53, 11, 2, '2018-03-19 17:52:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (22, 'Tuomo Tuomi', 'FI465623234546623', 'DABAFIHH', '25564563', NULL, -27.45, 11, 1, '2018-03-19 16:31:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (23, 'Leino Lanne', 'FI46501194133', 'APANKKI', NULL, 'Kalliiksi kavi', -26.50, 12, 1, '2018-02-19 07:41:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (24, 'Minttu Miina', 'FI4650152254432', 'NDEAFIHH', NULL, 'Terkut', -85.20, 12, 2, '2018-05-19 04:53:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (25, 'Lassi Luopio', 'FI14589656884', 'OKOYFIHH', '12348765', 'Kissalle rahaa', -46.20, 13, 3, '2018-08-19 12:34:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (26, 'Eija Elin', 'FI1321468556', 'DABAFIHH', '987654321', 'Lahjaksi', -258.00, 13, 2, '2018-03-19 12:12:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (27, 'Susanna Sala', 'FI1322543467', 'APANKKI', '100225', 'Rahaa menee', -35.20, 14, 3, '2018-02-19 06:41:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (28, 'Minttu Suo', 'FI11942002803', 'NDEAFIHH', '387624', 'Osto kaksi', -85.83, 14, 1, '2018-05-19 12:25:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (29, 'Helena Tuomi', 'FI469420028003', 'APANKKI', '134525', 'Kalliiksi kavi', -65.34, 15, 3, '2018-07-19 18:14:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (30, 'Martti Vainio', 'FI46501194233', 'DABAFIHH', '25564563', NULL, -410.45, 16, 3, '2018-08-19 19:53:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (31, 'Viljami Miina', 'FI4650119433', 'NDEAFIHH', NULL, 'Halpaa ku saippua', -50.50, 17, 1, '2018-08-19 07:12:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (32, 'Tuomo Matala', 'FI4123119733', 'DABAFIHH', NULL, 'Koiralle', -49.56, 18, 2, '2018-07-19 09:35:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (33, 'Martti Miina', 'FI4650152254432', 'NDEAFIHH', NULL, 'Terkut', -85.20, 19, 3, '2018-05-19 04:53:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (34, 'Tuomo Luopio', 'FI14589656884', 'OKOYFIHH', '12348765', 'Otolle rahaa', -46.20, 19, 1, '2018-08-19 12:34:07', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (35, 'Helena Elin', 'FI1321468556', 'DABAFIHH', '987654321', 'Sixpack massit', -258.00, 20, 2, '2018-03-19 12:12:13', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (36, 'Liisa Sala', 'FI1322543467', 'APANKKI', '100225', 'Rahaa', -35.20, 20, 3, '2018-02-19 06:41:51', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (37, 'Pekka Suo', 'FI11942002803', 'OKOYFIHH', '387624', 'Osto kolme', -85.83, 21, 3, '2018-05-19 12:25:12', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (38, 'Kille Tuomi', 'FI469420028003', 'NDEAFIHH', '134525', 'Kalliiksi kavi', -65.34, 21, 2, '2018-07-19 18:14:47', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (39, 'Heini Vainio', 'FI46501194233', 'DABAFIHH', '25564563', NULL, -410.45, 21, 3, '2018-08-19 19:53:23', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (40, 'Voitto Miina', 'FI4650119433', 'APANKKI', NULL, 'Halpaa ku saippua', -50.50, 21, 1, '2018-08-19 07:12:11', NULL);
INSERT INTO `opisk_c8hape00`.`tilitapahtumat` (`tilitapahtumaID`, `saajannimi`, `iban`, `bic`, `viite`, `viesti`, `maara`, `tiliID`, `tapahtumaid`, `aika`, `erapaiva`) VALUES (41, 'Jami Katala', 'FI4123119733', 'NDEAFIHH', NULL, 'Kalaan', -49.56, 21, 3, '2018-07-19 09:35:13', NULL);

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

