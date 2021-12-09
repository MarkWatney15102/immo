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
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

-- Exportiere Struktur von Tabelle test.raum
CREATE TABLE IF NOT EXISTS `raum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(255) NOT NULL,
  `laenge` float NOT NULL,
  `breite` float NOT NULL,
  `wohnungsId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__wohnung` (`wohnungsId`),
  CONSTRAINT `FK__wohnung` FOREIGN KEY (`wohnungsId`) REFERENCES `wohnung` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle test.wohnobjekt
CREATE TABLE IF NOT EXISTS `wohnobjekt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `hausNr` int(11) NOT NULL,
  `strasseId` int(11) NOT NULL,
  `bezeichnung` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle test.wohnung
CREATE TABLE IF NOT EXISTS `wohnung` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `etage` int(11) NOT NULL,
  `Nummer` int(11) NOT NULL,
  `wohnobjektId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_wohnung_wohnobjekt` (`wohnobjektId`),
  CONSTRAINT `FK_wohnung_wohnobjekt` FOREIGN KEY (`wohnobjektId`) REFERENCES `wohnobjekt` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle test.wohnung_person
CREATE TABLE IF NOT EXISTS `wohnung_person` (
  `wohnungId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `wohnobjektId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
