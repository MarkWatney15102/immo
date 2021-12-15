-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für test
CREATE DATABASE IF NOT EXISTS `immo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `immo`;

CREATE TABLE IF NOT EXISTS `ort` (
  `zipCode` int(5) NOT NULL PRIMARY KEY,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `strasse` (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    `ortZipCode` int(5) NOT NULL,
    KEY `FK__ort_strasse` (`ortZipCode`),
    CONSTRAINT `FK__ort_strasse` FOREIGN KEY (`ortZipCode`) REFERENCES `ort` (`zipCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Struktur von Tabelle test.wohnobjekt
CREATE TABLE IF NOT EXISTS `wohnobjekt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `hausNr` int(11) NOT NULL,
  `strasseId` int(11) NOT NULL,
  `bezeichnung` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_wohnobjekt_strasse` (`strasseId`),
  CONSTRAINT `FK_wohnobjekt_strasse` FOREIGN KEY (`strasseId`) REFERENCES `strasse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle test.wohnung
CREATE TABLE IF NOT EXISTS `wohnung` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `etage` int(11) NOT NULL,
  `nummer` int(11) NOT NULL,
  `wohnobjektId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_wohnung_wohnobjekt` (`wohnobjektId`),
  CONSTRAINT `FK_wohnung_wohnobjekt` FOREIGN KEY (`wohnobjektId`) REFERENCES `wohnobjekt` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

CREATE TABLE IF NOT EXISTS `person` (
    `ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `strasseId` int(11) NOT NULL,
    `hausNr` int(11) NOT NULL,
    `vorname` varchar(255) NOT NULL,
    `nachname` varchar(255) NOT NULL,
    KEY `FK_person_strasse` (`strasseId`),
    CONSTRAINT `FK_person_strasse` FOREIGN KEY (`strasseId`) REFERENCES `strasse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Struktur von Tabelle test.wohnung_person
CREATE TABLE IF NOT EXISTS `wohnung_person` (
  `personId` int(11) NOT NULL,
  `wohnobjektId` int(11) NOT NULL,
  KEY `FK_wohnung_person_wohnung` (`wohnungId`),
  CONSTRAINT `FK_wohnung_person_wohnung` FOREIGN KEY (`wohnungId`) REFERENCES `wohnung` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  KEY `FK_wohnung_person_person` (`personId`),
  CONSTRAINT `FK_wohnung_person_person` FOREIGN KEY (`personId`) REFERENCES `person` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
