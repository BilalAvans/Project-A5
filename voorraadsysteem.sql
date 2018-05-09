-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 09 mei 2018 om 14:12
-- Serverversie: 10.1.26-MariaDB
-- PHP-versie: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voorraadsysteem`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `artikelnummer` int(30) NOT NULL,
  `omschrijving` varchar(50) NOT NULL,
  `technische specificaties` varchar(60) NOT NULL,
  `magazijnlocatie` varchar(30) NOT NULL,
  `inkoopprijs` float NOT NULL,
  `vervangend artikel` varchar(50) NOT NULL,
  `minimum voorraad` int(20) NOT NULL,
  `huidige voorraad` int(20) NOT NULL,
  `bestelserie` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`artikelnummer`, `omschrijving`, `technische specificaties`, `magazijnlocatie`, `inkoopprijs`, `vervangend artikel`, `minimum voorraad`, `huidige voorraad`, `bestelserie`) VALUES
(1, 'Samsung QE55Q8F ', '4K HDR Smart-tv 55 inch / 139 cm', '1a', 1195, 'LG OLED55C7V ', 2, 3, 2),
(2, 'Acer swift 3', '14 inch i5 256ssd', '1b', 799, '', 2, 4, 1),
(3, 'INDESIT XWE61452', '1400tpm vulgewicht 6kg ', '1c', 299, '', 2, 5, 1),
(4, 'GoPro HERO 6 ', 'beeldhoeklens 170 graden full hd waterdicht', '1d', 427, 'GoPro HERO 5', 2, 3, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelopdracht`
--

CREATE TABLE `bestelopdracht` (
  `bestelordernummer` int(20) NOT NULL,
  `leverancier` varchar(30) NOT NULL,
  `artikelnummers` int(20) NOT NULL,
  `hoeveelheid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `bestelopdracht`
--

INSERT INTO `bestelopdracht` (`bestelordernummer`, `leverancier`, `artikelnummers`, `hoeveelheid`) VALUES
(1, 'conimex', 1, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ontvangstmelding`
--

CREATE TABLE `ontvangstmelding` (
  `datum ontvangst` date NOT NULL,
  `hoeveelheid` int(10) NOT NULL,
  `kwaliteit` varchar(20) NOT NULL,
  `artikelnummer` int(20) NOT NULL,
  `omschrijving` varchar(40) NOT NULL,
  `leverancier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `ontvangstmelding`
--

INSERT INTO `ontvangstmelding` (`datum ontvangst`, `hoeveelheid`, `kwaliteit`, `artikelnummer`, `omschrijving`, `leverancier`) VALUES
('2018-05-09', 5, 'goed aangekomen', 1, 'tv\'s', 'conimex');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikelnummer`);

--
-- Indexen voor tabel `bestelopdracht`
--
ALTER TABLE `bestelopdracht`
  ADD PRIMARY KEY (`bestelordernummer`);

--
-- Indexen voor tabel `ontvangstmelding`
--
ALTER TABLE `ontvangstmelding`
  ADD PRIMARY KEY (`datum ontvangst`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
