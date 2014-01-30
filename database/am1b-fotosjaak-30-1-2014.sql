-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 30 jan 2014 om 13:50
-- Serverversie: 5.6.12-log
-- PHP-versie: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `am1b-fotosjaak`
--
CREATE DATABASE IF NOT EXISTS `am1b-fotosjaak` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `am1b-fotosjaak`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question_english` text NOT NULL,
  `question_dutch` text NOT NULL,
  `answer_english` text NOT NULL,
  `answer_dutch` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Gegevens worden uitgevoerd voor tabel `faq`
--

INSERT INTO `faq` (`id`, `question_english`, `question_dutch`, `answer_english`, `answer_dutch`) VALUES
(1, 'When is the game finished', 'Wanneer is het spel afgelopen', 'When the score is less then 0 point', 'Wanneer de score lager is dan 0 punten'),
(2, 'Is this game hard to play', 'Is het een moeilijk spel', 'Yes, this game is very hard to master', 'Ja, dit is een zeer complex spel');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `userrole` enum('customer','administrator','root','photographer','developer') NOT NULL,
  `isactivated` enum('yes','no') NOT NULL DEFAULT 'no',
  `registerdate` datetime NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Gegevens worden uitgevoerd voor tabel `login`
--

INSERT INTO `login` (`login_id`, `email`, `password`, `userrole`, `isactivated`, `registerdate`) VALUES
(1, 'root@gmail.com', 'geheim', 'root', 'yes', '2013-11-12 00:00:00'),
(2, 'admin@gmail.com', 'geheim', 'administrator', 'yes', '2013-11-18 00:00:00'),
(3, 'photographer@gmail.com', 'geheim', 'photographer', 'yes', '2013-11-14 13:00:00'),
(4, 'customer@gmail.com', 'geheim', 'customer', 'yes', '2013-11-27 00:00:00'),
(5, 'developer@gmail.com', 'geheim', 'developer', 'yes', '2013-11-30 00:00:00'),
(6, 'arjan43@gmail.com', 'bd7679a082c78026b1c64a6b42889969', 'customer', 'no', '2014-01-10 09:30:43'),
(7, 'arjan44@gmail.com', '70c6951965389c9c0a55e6278a8f93c2', 'customer', 'no', '2014-01-10 09:33:21'),
(8, 'arjan45@gmail.com', '2eb9db1944bbfa37783902fa392bb713', 'customer', 'no', '2014-01-10 10:02:46'),
(9, 'arjan46@gmail.com', '8569428258cd51ef7ce1682da6a11a88', 'customer', 'no', '2014-01-10 10:32:46'),
(10, 'arjan50@gmail.com', '1789f3ee7930033f04a16fb709b21738', 'customer', 'no', '2014-01-10 10:33:36'),
(11, 'arjan51@gmail.com', '732d4ae8d9096efe3a938d3c800ea50b', 'customer', 'no', '2014-01-10 10:35:49'),
(12, 'arjan52@gmail.com', 'f268d7df2d02c98e49061de67eea373b', 'customer', 'no', '2014-01-10 10:39:09'),
(13, 'arjan53@gmail.com', 'f754c02ba6072b976f6cc2c3f68d9eeb', 'customer', 'no', '2014-01-10 11:01:47'),
(14, 'arjan55@gmail.com', '43171b92bcb84835f850ab28de665075', 'customer', 'no', '2014-01-10 11:14:29'),
(15, 'arjan57@gail.com', 'e53f04c5e0245dda25ee9ad9b29cb704', 'customer', 'no', '2014-01-10 11:20:19'),
(16, 'devries@gmail.com', '78875bacfe6b48d510b66f92c12ea7c7', 'customer', 'no', '2014-01-10 11:36:10'),
(17, 'adruijter@gmail.com', '0b498448d9b884d2a3b0e2b91eb16078', 'customer', 'no', '2014-01-24 09:35:55'),
(18, 'adruijter1@gmail.com', '7b28de5cc1383ba44bd4a5d5d1f65b56', 'customer', 'no', '2014-01-24 09:46:22'),
(19, 'customer123@gmail.com', 'geheim', 'customer', 'no', '2014-01-24 09:56:47'),
(20, '123@gmail.com', 'geheim', 'customer', 'no', '2014-01-24 10:49:50'),
(21, 'customer89@gmail.com', 'geheim', 'customer', 'yes', '2014-01-24 10:53:02'),
(22, 'onecustomer@gmail.com', 'geheim', 'customer', 'yes', '2014-01-30 14:08:48');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `order_short` text NOT NULL,
  `order_long` text NOT NULL,
  `deliverydate` datetime NOT NULL,
  `eventdate` datetime NOT NULL,
  `color` enum('color','black-white') NOT NULL,
  `number_of_pictures` int(10) NOT NULL,
  `confirmed` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `infix` varchar(20) NOT NULL,
  `surname` varchar(300) NOT NULL,
  `address` varchar(200) NOT NULL,
  `addressnumber` varchar(12) NOT NULL,
  `city` varchar(300) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `country` varchar(300) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `mobilephonenumber` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `infix`, `surname`, `address`, `addressnumber`, `city`, `zipcode`, `country`, `phonenumber`, `mobilephonenumber`) VALUES
(11, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '34', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(12, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(13, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(14, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(15, '', '', '', '', '', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(16, 'Bert', 'de', 'Vries', 'Prins Hendrikstraat', '34', 'Castricum', '1901CB', 'Noord-Holland', '3125167420', '3125167420'),
(17, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Den Haag', '1901CB', 'Nederland', '0251674212', '0612345432'),
(18, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Den Haag', '1901CB', 'Nederland', '0102837474', '1183848484'),
(19, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Den Haag', '1901CB', 'Nederland', '0251674212', '0612345432'),
(20, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '23', 'Den Haag', '1901CB', 'Nederland', '0251674212', '0612345432'),
(21, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '23', 'Den Haag', '1901CB', '', '0251674212', '1183848484'),
(22, 'Arjan', 'de', 'Ruijter', 'Prins Hendrikstraat', '12', 'Den Haag', '1901CB', 'Nederland', '0251674212', '0612345432');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
