-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Feb 28, 2023 alle 10:41
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Gestionale_Tep`
--
CREATE DATABASE IF NOT EXISTS `Gestionale_Tep` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Gestionale_Tep`;

-- --------------------------------------------------------

--
-- Struttura della tabella `Autobus`
--

CREATE TABLE `Autobus` (
  `idBus` int(11) NOT NULL,
  `Capacita` int(11) DEFAULT NULL,
  `Targa` varchar(64) DEFAULT NULL,
  `Latitudine` double DEFAULT NULL,
  `Longitudine` double DEFAULT NULL,
  `Ultimo_Aggiornamento` datetime DEFAULT NULL,
  `Stato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Biglietti`
--

CREATE TABLE `Biglietti` (
  `idBiglietto` int(11) NOT NULL,
  `idUtente` int(11) DEFAULT NULL,
  `NumeroZone` int(11) DEFAULT NULL,
  `Validita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Corse`
--

CREATE TABLE `Corse` (
  `idCorsa` int(11) NOT NULL,
  `idLinea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Corse_Fermate`
--

CREATE TABLE `Corse_Fermate` (
  `idCorsa` int(11) NOT NULL,
  `idFermata` int(11) NOT NULL,
  `Orario` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Fermate`
--

CREATE TABLE `Fermate` (
  `idFermata` int(11) NOT NULL,
  `idZona` int(11) DEFAULT NULL,
  `NomeFermata` varchar(64) DEFAULT NULL,
  `Latitudine` double DEFAULT NULL,
  `Longitudine` double DEFAULT NULL,
  `QrCodePath` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Linee`
--

CREATE TABLE `Linee` (
  `idLinea` int(11) NOT NULL,
  `NomeLinea` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Obliterazioni`
--

CREATE TABLE `Obliterazioni` (
  `idBiglietto` int(11) NOT NULL,
  `idViaggio` int(11) DEFAULT NULL,
  `idFermata` int(11) DEFAULT NULL,
  `DataObliterazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Utenti`
--

CREATE TABLE `Utenti` (
  `idUtente` int(11) NOT NULL,
  `Nome` varchar(64) DEFAULT NULL,
  `Cognome` varchar(64) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Password` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Viaggi`
--

CREATE TABLE `Viaggi` (
  `idViaggio` int(11) NOT NULL,
  `idBus` int(11) DEFAULT NULL,
  `idCorsa` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `Zone`
--

CREATE TABLE `Zone` (
  `idZona` int(11) NOT NULL,
  `NomeZona` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Autobus`
--
ALTER TABLE `Autobus`
  ADD PRIMARY KEY (`idBus`);

--
-- Indici per le tabelle `Biglietti`
--
ALTER TABLE `Biglietti`
  ADD PRIMARY KEY (`idBiglietto`),
  ADD KEY `idUtente` (`idUtente`);

--
-- Indici per le tabelle `Corse`
--
ALTER TABLE `Corse`
  ADD PRIMARY KEY (`idCorsa`),
  ADD KEY `idLinea` (`idLinea`);

--
-- Indici per le tabelle `Corse_Fermate`
--
ALTER TABLE `Corse_Fermate`
  ADD PRIMARY KEY (`idCorsa`,`idFermata`),
  ADD KEY `idFermata` (`idFermata`);

--
-- Indici per le tabelle `Fermate`
--
ALTER TABLE `Fermate`
  ADD PRIMARY KEY (`idFermata`),
  ADD KEY `idZona` (`idZona`);

--
-- Indici per le tabelle `Linee`
--
ALTER TABLE `Linee`
  ADD PRIMARY KEY (`idLinea`);

--
-- Indici per le tabelle `Obliterazioni`
--
ALTER TABLE `Obliterazioni`
  ADD PRIMARY KEY (`idBiglietto`),
  ADD KEY `idViaggio` (`idViaggio`),
  ADD KEY `idFermata` (`idFermata`);

--
-- Indici per le tabelle `Utenti`
--
ALTER TABLE `Utenti`
  ADD PRIMARY KEY (`idUtente`);

--
-- Indici per le tabelle `Viaggi`
--
ALTER TABLE `Viaggi`
  ADD PRIMARY KEY (`idViaggio`),
  ADD KEY `idBus` (`idBus`);

--
-- Indici per le tabelle `Zone`
--
ALTER TABLE `Zone`
  ADD PRIMARY KEY (`idZona`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Autobus`
--
ALTER TABLE `Autobus`
  MODIFY `idBus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Biglietti`
--
ALTER TABLE `Biglietti`
  MODIFY `idBiglietto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Corse`
--
ALTER TABLE `Corse`
  MODIFY `idCorsa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Fermate`
--
ALTER TABLE `Fermate`
  MODIFY `idFermata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Linee`
--
ALTER TABLE `Linee`
  MODIFY `idLinea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Utenti`
--
ALTER TABLE `Utenti`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Viaggi`
--
ALTER TABLE `Viaggi`
  MODIFY `idViaggio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Zone`
--
ALTER TABLE `Zone`
  MODIFY `idZona` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Biglietti`
--
ALTER TABLE `Biglietti`
  ADD CONSTRAINT `biglietti_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `Utenti` (`idUtente`);

--
-- Limiti per la tabella `Corse`
--
ALTER TABLE `Corse`
  ADD CONSTRAINT `corse_ibfk_1` FOREIGN KEY (`idLinea`) REFERENCES `Linee` (`idLinea`);

--
-- Limiti per la tabella `Corse_Fermate`
--
ALTER TABLE `Corse_Fermate`
  ADD CONSTRAINT `corse_fermate_ibfk_1` FOREIGN KEY (`idCorsa`) REFERENCES `Corse` (`idCorsa`),
  ADD CONSTRAINT `corse_fermate_ibfk_2` FOREIGN KEY (`idFermata`) REFERENCES `Fermate` (`idFermata`);

--
-- Limiti per la tabella `Fermate`
--
ALTER TABLE `Fermate`
  ADD CONSTRAINT `fermate_ibfk_1` FOREIGN KEY (`idZona`) REFERENCES `Zone` (`idZona`);

--
-- Limiti per la tabella `Obliterazioni`
--
ALTER TABLE `Obliterazioni`
  ADD CONSTRAINT `obliterazioni_ibfk_1` FOREIGN KEY (`idBiglietto`) REFERENCES `Biglietti` (`idBiglietto`),
  ADD CONSTRAINT `obliterazioni_ibfk_2` FOREIGN KEY (`idViaggio`) REFERENCES `Viaggi` (`idViaggio`),
  ADD CONSTRAINT `obliterazioni_ibfk_3` FOREIGN KEY (`idFermata`) REFERENCES `Fermate` (`idFermata`);

--
-- Limiti per la tabella `Viaggi`
--
ALTER TABLE `Viaggi`
  ADD CONSTRAINT `viaggi_ibfk_1` FOREIGN KEY (`idBus`) REFERENCES `Autobus` (`idBus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
