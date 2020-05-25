-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2020 at 10:39 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int (11) NOT NULL,
  `name` varchar (50) NOT NULL,
  `address` varchar (80) NOT NULL,
  `lat` varchar (12) NOT NULL,
  `lng` varchar (12) NOT NULL,
  `kind_food` set ('mediterraneo','pizza','tapas','catalan','japones','italiano','gallego') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Piazze d\'Italia', 'Carrer de Casanova, 94, 08011 Barcelona', '41.38709700', '2.15699300', 'italiano'),
(2, 'Racó d\'en Cesc', 'Carrer de la Diputació, 201, 08011 Barcelona', '41.38648300', '2.16105800', 'catalan'),
(3, 'Vigo Restaurant Tapes', 'Carrer d\'Aribau, 27, 08011 Barcelona', '41.38724000', '2.16096100', 'gallego'),
(4, 'Restaurante O\'Retorno', 'Carrer del Comte d\'Urgell, 168, 08036 Barcelona', '41.38715300', '2.15312100', 'gallego'),
(5, 'LABARRA Westside', 'Carrer del Comte d\'Urgell, 240, 08036 Barcelona', '41.39060900', '2.14795800', 'tapas'),
(6, 'Restaurante O\'Canto', 'Calle Diputacion, 23, 08015 Barcelona', '41.37908500', '2.15179700', 'gallego'),
(7, 'restaurant Marcelino 16', 'Carrer de la Diputació, 41, 08015 Barcelona', '41.37946900', '2.15220200', 'mediterraneo,gallego'),
(8, 'Una Mica de Japó Restaurant', 'Carrer d\'Aragó, 104, 08015 Barcelona', '41.38396100', '2.15381400', 'japones'),
(9, 'Napoli Prima e Dopo Barcelona', 'Carrer de Villarroel, 255, 08036 Barcelona', '41.39201900', '2.14754200', 'pizza,italiano'),
(10, 'Casa Jaime', 'Carrer del Consell de Cent, 222, 08011 Barcelona', '41.38601900', '2.15907200', 'tapas,catalan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
