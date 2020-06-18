-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2020 at 08:17 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videoteka`
--

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `FilmID` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(50) NOT NULL,
  `Reziser` varchar(50) NOT NULL,
  `Opis` text NOT NULL,
  `DuzinaTrajanja` time NOT NULL,
  `DatumIzlaska` date NOT NULL,
  `CijenaIznamljivanja` float NOT NULL,
  `CijenaKupovine` float NOT NULL,
  `Rating` float NOT NULL,
  `BoxOffice` double NOT NULL,
  PRIMARY KEY (`FilmID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`FilmID`, `Naziv`, `Reziser`, `Opis`, `DuzinaTrajanja`, `DatumIzlaska`, `CijenaIznamljivanja`, `CijenaKupovine`, `Rating`, `BoxOffice`) VALUES
(1, 'Birds of Prey', 'Cathy Yan', 'After splitting with the Joker, Harley Quinn joins superheroes Black Canary, Huntress and Renee Montoya to save a young girl from an evil crime lord.', '01:49:00', '2020-07-02', 4.99, 9.99, 6.7, 84500000),
(2, 'Dolittle', 'Stephen Gaghan', 'A physician who can talk to animals embarks on an adventure to find a legendary island with a young apprentice and a crew of strange pets.', '01:41:00', '2020-01-17', 4.99, 9.99, 5.6, 56834810),
(3, 'Jumanji The Next Level', 'Jake Kasdan', 'In Jumanji: The Next Level, the gang is back but the game has changed. As they return to rescue one of their own, the players will have to brave parts unknown from arid deserts to snowy mountains, to escape the world\'s most dangerous game.', '02:03:00', '2019-12-13', 4.99, 9.99, 7, 292562487),
(4, 'Star Wars: Episode IX - The Rise of Skywalker', 'J.J. Abrams', 'The surviving members of the resistance face the First Order once again, and the legendary conflict between the Jedi and the Sith reaches its peak bringing the Skywalker saga to its end.', '02:22:00', '2019-12-19', 3.99, 7.99, 6.8, 508052548),
(5, 'Parasite', 'Bong Joon Ho', 'All unemployed, Ki-taek and his family take peculiar interest in the wealthy and glamorous Parks, as they ingratiate themselves into their lives and get entangled in an unexpected incident.', '02:12:00', '2019-10-08', 4.99, 9.99, 8.6, 33229324);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `KorisnikID` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Sifra` varchar(50) DEFAULT NULL,
  `UserAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`KorisnikID`),
  UNIQUE KEY `Ime` (`Ime`),
  KEY `Ime_2` (`Ime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KorisnikID`, `Ime`, `Email`, `Sifra`, `UserAdmin`) VALUES
(3, 'ivan', 'ivanmat97@gmail.com', 'password', 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnikfilm`
--

DROP TABLE IF EXISTS `korisnikfilm`;
CREATE TABLE IF NOT EXISTS `korisnikfilm` (
  `KorisnikID` int(11) NOT NULL,
  `FilmID` int(11) NOT NULL,
  `KupioStatus` tinyint(1) NOT NULL COMMENT 'false=iznajmio true=kupio',
  PRIMARY KEY (`KorisnikID`,`FilmID`),
  KEY `FilmID` (`FilmID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnikserija`
--

DROP TABLE IF EXISTS `korisnikserija`;
CREATE TABLE IF NOT EXISTS `korisnikserija` (
  `KorisnikID` int(11) NOT NULL,
  `SerijaID` int(11) NOT NULL,
  `StatusSerije` tinyint(1) NOT NULL COMMENT 'false=iznajmio; true=kupio',
  PRIMARY KEY (`KorisnikID`,`SerijaID`),
  KEY `SerijaID` (`SerijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serija`
--

DROP TABLE IF EXISTS `serija`;
CREATE TABLE IF NOT EXISTS `serija` (
  `SerijaID` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(50) NOT NULL,
  `Reziser` varchar(50) NOT NULL,
  `Opis` text NOT NULL,
  `DuzinaTrajanja` time NOT NULL,
  `DatumIzlaska` date NOT NULL,
  `CijenaIznamljivanja` float NOT NULL,
  `CijenaKupovine` float NOT NULL,
  `Rating` float NOT NULL,
  `Sezona` int(11) NOT NULL,
  `Epizoda` int(11) NOT NULL,
  PRIMARY KEY (`SerijaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serija`
--

INSERT INTO `serija` (`SerijaID`, `Naziv`, `Reziser`, `Opis`, `DuzinaTrajanja`, `DatumIzlaska`, `CijenaIznamljivanja`, `CijenaKupovine`, `Rating`, `Sezona`, `Epizoda`) VALUES
(1, 'Star Trek: Picard', 'Kirsten Beyer', 'Follow-up series to Star Trek: The Next Generation (1987) and Star Trek: Nemesis (2002) that centers on Jean-Luc Picard (Sir Patrick Stewart) in the next chapter of his life.', '00:46:00', '2020-01-23', 2.99, 4.99, 8.5, 1, 1),
(2, 'The Witcher', 'Lauren Schmidt', 'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.', '01:37:00', '2019-12-20', 2.99, 4.99, 8.4, 1, 2),
(3, 'The Mandalorian', 'Jon Favreau', 'The travels of a lone bounty hunter in the outer reaches of the galaxy, far from the authority of the New Republic.', '00:30:00', '2019-11-12', 4.99, 9.99, 8.8, 1, 9),
(4, 'Game of Thrones', 'David Beniof', 'Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.', '00:57:00', '2011-04-11', 4.99, 9.99, 9.3, 1, 10),
(5, 'The Office', 'Greg Daniels', 'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, and tedium.', '01:14:00', '2005-03-24', 5, 8, 8.8, 1, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `korisnikfilm`
--
ALTER TABLE `korisnikfilm`
  ADD CONSTRAINT `korisnikfilm_ibfk_1` FOREIGN KEY (`KorisnikID`) REFERENCES `korisnici` (`KorisnikID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `korisnikfilm_ibfk_2` FOREIGN KEY (`FilmID`) REFERENCES `film` (`FilmID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `korisnikserija`
--
ALTER TABLE `korisnikserija`
  ADD CONSTRAINT `korisnikserija_ibfk_1` FOREIGN KEY (`KorisnikID`) REFERENCES `korisnici` (`KorisnikID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `korisnikserija_ibfk_2` FOREIGN KEY (`SerijaID`) REFERENCES `serija` (`SerijaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
