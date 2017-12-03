-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 02:50 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upcf3`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `code` varchar(9) DEFAULT NULL,
  `name` varchar(29) DEFAULT NULL,
  `prefix` varchar(6) DEFAULT NULL,
  `new_number` int(11) DEFAULT NULL,
  `first_number` int(11) DEFAULT NULL,
  `last_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `code`, `name`, `prefix`, `new_number`, `first_number`, `last_number`) VALUES
(1, 'AB', 'All Aboard', 'AB', 5030, 5030, 5199),
(2, 'AN', 'Terra Individual', 'AN', 2800, 2800, 3999),
(3, 'ANACC', 'Terra Accessories', 'AN', 2110, 2110, 2599),
(4, 'ANASS', 'Terra Assortments', 'AN', 6090, 6090, 6999),
(5, 'ANDINO', 'Terra Dinosaurs', 'AN', 4050, 4050, 5999),
(6, 'B', 'B. ', 'BX', 1705, 1705, 2999),
(7, 'BASS', 'B. Assortments', 'BX', 3320, 3320, 3999),
(8, 'BDACC', 'OG Accessories', 'BD', 37815, 37815, 37999),
(9, 'BDASS', 'OG Assortments', 'BD', 40830, 40830, 41499),
(10, 'BDDIORAMA', 'OG Diorama', 'BDDISP', 13, 13, 50),
(11, 'BDDOLL', 'OG Dolls', 'BD', 31225, 31225, 31599),
(12, 'BDGACC', 'OG Girl Accessories', 'BD', 39005, 39005, 39100),
(13, 'BDHOR', 'OG Horses', 'BD', 38155, 38155, 38999),
(14, 'BDMIDOLL', 'OG Mini Dolls', 'BD', 33070, 33070, 33599),
(15, 'BDOUT', 'OG Outfits', 'BD', 30385, 30385, 30999),
(16, 'BDREACC', 'OG Retro Accessories', 'BD', 67060, 67060, 67999),
(17, 'BDREDOLL', 'OG Retro Dolls', 'BD', 61020, 61020, 61600),
(18, 'BDREOUT', 'OG Retro Outfits', 'BD', 60070, 60070, 60999),
(19, 'BDSP', 'OG Special Projects', 'BD', 90002, 90002, 90100),
(20, 'BG', 'Baby Sweetheart', 'BG', 7010, 7010, 7100),
(21, 'BR', 'Bristle Blocks', 'BR', 3110, 3110, 3999),
(22, 'BSIG', 'B. Sinage Displays', 'BX', 6017, 6017, 6050),
(23, 'BT', 'Battat New Line', 'BT', 2595, 2595, 2999),
(24, 'BTASS', 'Battat Assortment', 'BT', 6035, 6035, 6499),
(25, 'BTASSR', 'Battat Assortmen Recolored', 'BT', 6520, 6520, 6999),
(26, 'CA ', 'Camomille', 'CA', 6200, 6200, 8000),
(27, 'CF', 'Craftabelle', 'CF', 2440, 2440, 2500),
(28, 'CFASS', 'Craftabelle Assortments', 'CF', 6050, 6050, 6099),
(29, 'GGACC', 'Glitter Girls Accessories', 'GG', 57040, 57040, 5999),
(30, 'GGASS', 'Glitter Girls Assortments', 'GG', 40020, 40020, 40999),
(31, 'GGDOLL', 'Glitter Girls Dolls', 'GG', 51015, 51015, 51999),
(32, 'GGHOR', 'Glitter Girls Horses', 'GG', 58005, 58005, 58999),
(33, 'GGOUT', 'Glitter Girls Outfits', 'GG', 50030, 50030, 50999),
(34, 'LOACC', 'LORI Accessories', 'LO', 37060, 37060, 37999),
(35, 'LODOLL', 'LORI Dolls', 'LO', 31150, 31150, 31999),
(36, 'LOHOR', 'LORI Horses', 'LO', 38020, 38020, 38999),
(37, 'LOOUT', 'LORI Outfits', 'LO', 30040, 30040, 30999),
(38, 'LORASS', 'LORI Assortments', 'LO', 40085, 40085, 40999),
(39, 'OG', 'OG Me and You Outfits', 'OG', 1590, 1590, 1699),
(40, 'OGACC', 'OG Me and You Accessories', 'OG', 1810, 1810, 1899),
(41, 'OGASS', 'OG Me and You Assortments', 'OG', 4085, 4085, 4199),
(42, 'OGEVENT', 'OG Events', 'OG', 91, 91, 100),
(43, 'PC', 'Play Circle', 'PC', 2235, 2235, 2299),
(44, 'PCASS', 'Play Circle Assortments', 'PC', 5205, 5205, 5299),
(45, 'STASS', 'Pucci Pups Assortments', 'ST', 4150, 4150, 4199),
(46, 'STELEC', 'Pucci Pups Electronic', 'ST', 9045, 9045, 9199),
(47, 'STPLU', 'Pucci Pups Plush', 'ST', 8365, 8365, 8999),
(48, 'VE', 'Wonder Wheels', 'VE', 1025, 1025, 1999),
(49, 'VEASS', 'Wonder Wheels Assortments', 'VE', 3015, 3015, 3199),
(50, 'VO  ', 'Volta  ', 'VO', 7095, 7095, 7199),
(51, 'WH', 'Driven', 'WH', 1085, 1085, 1999),
(52, 'WHASS', 'Driven Assortments', 'WH', 3025, 3025, 3199),
(53, 'WZ', 'Woodzeez', 'WZ', 6530, 6530, 6799),
(54, 'WZASS', 'Woodzeez Assortments', 'WZ', 6990, 6990, 8000),
(55, 'WZBOB', 'Woodzeez Bobblehead', 'WZ', 69100, 69100, 90000),
(56, 'WZSP', 'Woodzeez Bobblehead specialty', 'WZ', 54300, 54300, 59999);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Brand_Code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
