-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2021 at 06:28 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingdb`
--

CREATE TABLE `bookingdb` (
  `id` decimal(10,0) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pcname` varchar(20) DEFAULT NULL,
  `pcage` varchar(4) DEFAULT NULL,
  `pdate` varchar(10) DEFAULT NULL,
  `pphone` varchar(12) DEFAULT NULL,
  `preason` varchar(200) DEFAULT NULL,
  `hname` varchar(30) DEFAULT NULL,
  `hphone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingdb`
--

INSERT INTO `bookingdb` (`id`, `pname`, `pcname`, `pcage`, `pdate`, `pphone`, `preason`, `hname`, `hphone`) VALUES
('1', 'hari', 'baby', '12', '2021-02-10', NULL, 'fever', 'ABC Hospital', '9790456941'),
('2', 'hari', 'baby', '12', '2021-02-11', NULL, 'fever', 'ABC Hospital', '9790456941'),
('3', 'hari', 'baby', '9', '2021-02-04', NULL, 'fever', 'ABC Hospital', '9790456941'),
('4', 'hari', 'baby', '12', '2021-02-10', NULL, 'fever', 'ABC Hospital', '9790456941');

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldb`
--

CREATE TABLE `hospitaldb` (
  `id` decimal(10,0) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaldb`
--

INSERT INTO `hospitaldb` (`id`, `name`, `address`, `city`, `state`, `phone`, `description`) VALUES
('1', 'ABC Hospital', 'Address - 1', 'Coimbatore', 'Tamil Nadu', '9790456941', 'DESCRIPTION - 1'),
('2', 'DEF Hospital', 'Address - 2', 'Salem', 'Tamil Nadu', '9790456941', 'DESCRIPTION - 2'),
('3', 'HIJ Hospital', 'Address - 3', 'Bangalore', 'Karnataka', '9790456941', 'DESCRIPTION - 3'),
('4', 'KLM Hospital', 'Address - 4', 'Cochin', 'Kerala', '9790456941', 'DESCRIPTION - 4');

-- --------------------------------------------------------

--
-- Table structure for table `namesdb`
--

CREATE TABLE `namesdb` (
  `id` decimal(10,0) NOT NULL,
  `name` varchar(20) NOT NULL,
  `meaning` varchar(100) NOT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `namesdb`
--

INSERT INTO `namesdb` (`id`, `name`, `meaning`, `gender`, `religion`) VALUES
('1', 'KIRUTHIK', 'MEANING 1', 'Male', 'HINDU'),
('2', 'ARAVEND', 'MEANING 2', 'MALE', 'HINDU'),
('3', 'LAKSHMI PRABHA', 'MEANING 3', 'FEMALE', 'HINDU'),
('4', 'NARESH KUMAR', 'MEANING 4', 'MALE', 'HINDU'),
('5', 'PRAVIN RAJ', 'MEANING 5', 'MALE', 'HINDU'),
('6', 'LUIS', 'MEANING 6', 'MALE', 'CHRISTIAN'),
('7', 'MILAN', 'MEANING 7', 'MALE', 'CHRISTIAN'),
('8', 'MARIA', 'MEANING 8', 'FEMALE', 'CHRISTIAN'),
('9', 'FAIZAL', 'MEANING 9', 'MALE', 'MUSLIM'),
('10', 'FAZARIA', 'MEANING 10', 'FEMALE', 'MUSLIM');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `featured` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `category`, `featured`, `image`) VALUES
(1, 'Bournvita', '700', 'food', 'yes', 'pic/food/1bournvita.png'),
(2, 'Ceregrow', '500', 'food', 'yes', 'pic/food/2ceregrow.png'),
(3, 'Cerelac', '400', 'food', 'yes', 'pic/food/3cerelac.png'),
(4, 'Complan', '200', 'food', 'no', 'pic/food/4complan.png'),
(5, 'Dexolac', '250', 'food', 'no', 'pic/food/5dexolac.png'),
(6, 'Enfagrow', '300', 'food', 'no', 'pic/food/6enfagrow.png'),
(7, 'Enfamil', '250', 'food', 'no', 'pic/food/7enfamil.png'),
(8, 'Happa', '100', 'food', 'no', 'pic/food/8happa.png'),
(9, 'Horlicks', '150', 'food', 'no', 'pic/food/9horlicks.png'),
(10, 'Horlicks wheat', '200', 'food', 'no', 'pic/food/10horlickswheat.png'),
(11, 'Nestum', '200', 'food', 'no', 'pic/food/11nestum.png'),
(12, 'Pediasure', '250', 'food', 'no', 'pic/food/12pediasure.png'),
(13, 'Protinex', '150', 'food', 'no', 'pic/food/13protinex.png'),
(14, 'Similac Advance', '150', 'food', 'no', 'pic/food/14similac.png'),
(15, 'Woodwards', '200', 'food', 'no', 'pic/food/15woodwards.png'),
(16, 'Dress1', '350', 'dress', 'yes', 'pic/dress/dress1.png'),
(17, 'Dress2', '300', 'dress', 'yes', 'pic/dress/dress2.png'),
(18, 'Dress3', '450', 'dress', 'yes', 'pic/dress/dress3.png'),
(19, 'Dress4', '500', 'dress', 'no', 'pic/dress/dress4.png'),
(20, 'Dress5', '100', 'dress', 'no', 'pic/dress/dress5.png'),
(21, 'Dress6', '150', 'dress', 'no', 'pic/dress/dress6.png'),
(22, 'Dress7', '250', 'dress', 'no', 'pic/dress/dress7.png'),
(23, 'Dress8', '400', 'dress', 'no', 'pic/dress/dress8.png'),
(24, 'Dress9', '300', 'dress', 'no', 'pic/dress/dress9.png'),
(25, 'Dress10', '250', 'dress', 'no', 'pic/dress/dress10.png'),
(26, 'Dress11', '200', 'dress', 'no', 'pic/dress/dress11.png'),
(27, 'Babyhug', '150', 'wetwipes', 'yes', 'pic/wetwipes/1babyhug.png'),
(28, 'Himalaya', '200', 'wetwipes', 'yes', 'pic/wetwipes/2himalaya.png'),
(29, 'Huggies pants', '150', 'wetwipes', 'yes', 'pic/wetwipes/3huggies.png'),
(30, 'Huggies Dry', '200', 'wetwipes', 'no', 'pic/wetwipes/4huggiesdry.png'),
(31, 'Johnson wipes', '250', 'wetwipes', 'no', 'pic/wetwipes/5johnsonwipes.png'),
(32, 'Mammy poko pants', '300', 'wetwipes', 'no', 'pic/wetwipes/6mammypokopants.png'),
(33, 'Pampers', '250', 'wetwipes', 'no', 'pic/wetwipes/7pampers.png'),
(34, 'Supples', '200', 'wetwipes', 'no', 'pic/wetwipes/8supples.png'),
(35, 'Waterwipes', '250', 'wetwipes', 'no', 'pic/wetwipes/9waterwipes.png'),
(36, 'Aveeno', '300', 'soap', 'yes', 'pic/soap/1Aveeno.png'),
(37, 'Baby ganics', '200', 'soap', 'yes', 'pic/soap/2babyganics.png'),
(38, 'Burts bees', '150', 'soap', 'yes', 'pic/soap/3burtsbees.png'),
(39, 'Cetaphil', '100', 'soap', 'no', 'pic/soap/4cetaphil.png'),
(40, 'Dove', '150', 'soap', 'no', 'pic/soap/5dove.png'),
(41, 'Johnson cologne', '200', 'soap', 'no', 'pic/soap/6johnsoncologne.png'),
(42, 'Johnson cream', '150', 'soap', 'no', 'pic/soap/7johnsoncream.png'),
(43, 'Johnson lotion', '250', 'soap', 'no', 'pic/soap/8johnsonlotion.png'),
(44, 'Johnson oil', '100', 'soap', 'no', 'pic/soap/9johnsonoil.png'),
(45, 'Johnson powder', '150', 'soap', 'no', 'pic/soap/10johnsonpowder.png'),
(46, 'Johnson shampoo', '200', 'soap', 'no', 'pic/soap/11johnsonshampoo.png'),
(47, 'Johnson soap', '150', 'soap', 'no', 'pic/soap/12johnsonsoap.png'),
(48, 'Mustela', '100', 'soap', 'no', 'pic/soap/13mustela.png'),
(49, 'Puracy', '150', 'soap', 'no', 'pic/soap/14puracy.png'),
(50, 'Tubby todd', '200', 'soap', 'no', 'pic/soap/15tubbytodd.png'),
(51, 'Weleda', '100', 'soap', 'no', 'pic/soap/16weleda.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `address`, `email`, `username`, `password`) VALUES
(25, 'Naresh', 'salem', '18euit089@skcet.ac.in', 'Naresh', 'Naresh2211*'),
(26, 'Naresh', 'salem', '18euit089@skcet.ac.in', 'Naresh', 'Naresh2211*');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingdb`
--
ALTER TABLE `bookingdb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospitaldb`
--
ALTER TABLE `hospitaldb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `namesdb`
--
ALTER TABLE `namesdb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
