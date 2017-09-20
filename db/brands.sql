-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2017 at 12:55 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

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
(1, 'AB', 'All Aboard', 'AB', 5100, 5100, 5199),
(2, 'AN', 'Terra Individual', 'AN', 3800, 3800, 3899),
(3, 'ANASS', 'Terra Assortments', 'AN', 6095, 6095, 6149),
(4, 'ANDINO', 'Terra Dinosaurs', 'AN', 4055, 4055, 4099),
(5, 'B', 'B. ', 'BX', 1750, 1750, 2999),
(6, 'BASS', 'B. Assortments', 'BX', 3400, 3400, 3799),
(7, 'BB', 'Battat Original', 'BB', 94000, 94000, 94999),
(8, 'BDACC', 'OG Accessories', 'BD', 36000, 36000, 36999),
(9, 'BDASS', 'OG Assortments', 'BD', 40800, 40800, 42999),
(10, 'BDDIORAMA', 'OG Diorama', 'BDDISP', 100, 100, 199),
(11, 'BDDOLL', 'OG Dolls', 'BD', 31250, 31250, 32999),
(12, 'BDGACC', 'OG Girl Accessories', 'BD', 39005, 39005, 39099),
(13, 'BDHOR', 'OG Horses', 'BD', 38165, 38400, 38999),
(14, 'BDMIDOLL', 'OG Mini Dolls', 'BD', 33075, 33075, 33999),
(15, 'BDOUT', 'OG Outfits', 'BD', 34000, 34000, 35999),
(16, 'BDREACC', 'OG Retro Accessories', 'BD', 67065, 67065, 67999),
(17, 'BDREDOLL', 'OG Retro Dolls', 'BD', 61025, 61025, 62999),
(18, 'BDREOUT', 'OG Retro Outfits', 'BD', 60075, 60075, 60999),
(19, 'BDSP', 'OG Special Projects', 'BD', 90002, 90002, 90999),
(20, 'BG', 'Baby Sweetheart', 'BG', 7200, 7200, 7299),
(21, 'BR', 'Bristle Blocks', 'BR', 3200, 3200, 3299),
(22, 'BSIG', 'B. Sinage Displays', 'BX', 6025, 6025, 6039),
(23, 'BT', 'Battat New Line', 'BT', 2590, 2590, 2799),
(24, 'BTASS', 'Battat Assortment', 'BT', 6150, 6150, 6159),
(25, 'BTASSR', 'Battat Assortmen Recolored', 'BT', 6550, 6550, 6599),
(26, 'CA ', 'Camomille', 'CA', 6500, 6500, 6549),
(27, 'CF', 'Craftabelle', 'CF', 2450, 2450, 2449),
(28, 'CFASS', 'Craftabelle Assortments', 'CF', 60500, 60500, 60449),
(29, 'GGACC', 'Glitter Girls Accessories', 'GG', 57050, 57050, 57999),
(30, 'GGASS', 'Glitter Girls Assortments', 'GG', 40050, 40050, 40799),
(31, 'GGDOLL', 'Glitter Girls Dolls', 'GG', 51050, 51050, 51999),
(32, 'GGHOR', 'Glitter Girls Horses', 'GG', 58005, 58005, 58999),
(33, 'GGOUT', 'Glitter Girls Outfits', 'GG', 50050, 50050, 50999),
(34, 'LOACC', 'LORI Accessories', 'LO', 37150, 37150, 37999),
(35, 'LODOLL', 'LORI Dolls', 'LO', 31150, 31150, 31999),
(36, 'LOHOR', 'LORI Horses', 'LO', 38050, 38050, 38399),
(37, 'LOOUT', 'LORI Outfits', 'LO', 30050, 30050, 30999),
(38, 'LORASS', 'LORI Assortments', 'LO', 43000, 43000, 43999),
(39, 'OG', 'OG Me and You', 'OG', 1815, 1815, 1999),
(40, 'OGASS', 'OG Me and You Assortments', 'OG', 4100, 4100, 4199),
(41, 'OGEVENT', 'OG Events', 'OG', 200, 200, 299),
(42, 'PC', 'Play Circle', 'PC', 2235, 2235, 2399),
(43, 'PCASS', 'Play Circle Assortments', 'PC', 5205, 5205, 5299),
(44, 'STASS', 'Pucci Pups Assortments', 'ST', 4200, 4200, 4299),
(45, 'STELEC', 'Pucci Pups Electronic', 'ST', 9045, 9045, 9099),
(46, 'STPLU', 'Pucci Pups Plush', 'ST', 8375, 8375, 8499),
(47, 'VE', 'Wonder Wheels', 'VE', 1025, 1025, 1199),
(48, 'VEASS', 'Wonder Wheels Assortments', 'VE', 3015, 2800, 2999),
(49, 'VO  ', 'Volta  ', 'VO', 7095, 7095, 7199),
(50, 'WH', 'Driven', 'WH', 1200, 1200, 1399),
(51, 'WHASS', 'Driven Assortments', 'WH', 3025, 3025, 3199),
(52, 'WZ', 'Woodzeez', 'WZ', 6600, 6600, 6899),
(53, 'WZASS', 'Woodzeez Assortments', 'WZ', 6995, 8000, 8299),
(54, 'WZBOB', 'Woodzeez Bobblehead', 'WZ', 69100, 69100, 72999),
(55, 'WZSP', 'Woodzeez Bobblehead specialty', 'WZ', 55100, 55100, 55999);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
