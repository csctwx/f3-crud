-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2017 at 02:24 AM
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
-- Database: `upc`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_lines`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL UNIQUE,
  `prefix` varchar(3) NOT NULL,
  `lastnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_lines`
--

INSERT INTO `brands` (`id`, `brand`, `prefix`, `lastnumber`) VALUES
(1, 'All Aboard', 'AB', 5038),
(2, 'B. Brand', 'BX', 1673),
(3, 'B. Brand - ASST', 'BX', 3236),
(4, 'B. Brand - SIGNAGE', 'BX', 6016),
(7, 'Battat', 'BT', 2573),
(8, 'Battat - ASST OLD COLOR', 'BT', 6032),
(9, 'Battat - ASST NEW COLORS', 'BT', 6515),
(10, 'Baby Sweetheart', 'BG', 7006),
(11, 'Bristle Blocks', '', 3105),
(12, 'Craftabelle - JEWELRY ITEMS', 'CF', 2436),
(13, 'Craftabelle - PAPERCRAFT', 'CF', 2105),
(14, 'Craftabelle - HOME DECOR', 'CF', 2231),
(15, 'Craftabelle - ASST', 'CF', 6045),
(16, 'Driven (Wheels)', 'WH', 1061),
(17, 'Driven - ASST', 'WH', 3014),
(18, 'Enchanted - INFANT', 'EN', 1612),
(19, 'Enchanted - TODDLER', 'EN', 3545),
(20, 'Enchanted - ASST', 'EN', 5025),
(21, 'Glitter Girls - DOLLS', 'GG', 51006),
(22, 'Glitter Girls - ACCESSORIES', 'GG', 57014),
(23, 'Glitter Girls - HORSES', 'GG', 58001),
(24, 'Glitterr Girls - OUTFITS', 'GG', 50015),
(25, 'Lori - DOLLS', 'LO', 31126),
(26, 'Lori - ACCESSORIES', 'LO', 37053),
(27, 'Lori - HORSES', 'LO', 38017),
(28, 'Lori - OUTFITS', 'LO', 30032),
(29, 'Lori - ASST', 'LO', 40070),
(30, 'OG - DOLLS', 'BD', 31193),
(31, 'OG - ACCESSORIES', 'BD', 37451),
(32, 'OG - HORSES', 'BD', 38037),
(33, 'OG - PUPS (Kittens)', 'BD', 37808),
(34, 'OG - OUTFITS', 'BD', 30355),
(35, 'OG - ASST', 'BD', 40769),
(36, 'OG - MINI DOLLS', 'BD', 33067),
(37, 'OG - RETRO DOLLS', 'BD', 61015),
(38, 'OG - RETRO ACCESSORIES', 'BD', 67054),
(39, 'OG - RETRO OUTFITS', 'BD', 60063),
(40, 'OG (Girl) - ACCESSORIES', 'BD', 39003),
(41, 'OG - Me & You - OUTFITS (Series)', 'OG', 1573),
(42, 'OG - Me & You - ACCESSORIES', 'OG', 1738),
(43, 'OG - Me & You - JEWELRY', 'OG', 1806),
(44, 'OG - Me & You - ASST', 'OG', 4083),
(45, 'Pucci ', 'ST', 8362),
(46, 'Pucci - ELECTRONIC', 'ST', 9040),
(47, 'Pucci - MINI', 'ST', 6015),
(48, 'Pucci - ASST', 'ST', 4144),
(51, 'Terra - INDIVIDUALS', 'AN', 2772),
(52, 'Terra - DINOS/FANTASY', 'AN', 4040),
(53, 'Terra - STRUCTURES', 'AN', 2104),
(54, 'Terra - ASST', 'AN', 6080),
(55, 'Volta', 'VO', 7094),
(56, 'Volta - ASST', 'VO', 4020),
(57, 'Wonder Wheels', 'VE', 1017),
(58, 'Wonder Wheels - ASST', 'VE', 3009),
(59, 'Woodzeez', '', 6284),
(60, 'Woodzeez - ASST', '', 6968),
(63, 'Art Studio', 'MC', 7002),
(64, 'Glitter Girls - ASST', 'GG', 40001),
(65, 'OG-DISPLAYS', 'BD', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_lines`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY  (`id`);

ALTER TABLE `brands`
  ADD UNIQUE (`id`);

ALTER TABLE `brands`
  ADD CONSTRAINT Prefix_Number UNIQUE (`prefix`,`lastnumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_lines`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
