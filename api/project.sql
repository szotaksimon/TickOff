-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2022 at 10:36 PM
-- Server version: 8.0.28
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salamonb_python-login`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Tanulás'),
(2, 'Munka'),
(3, 'Bevásárlás'),
(4, 'Család'),
(5, 'Számlák');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `token_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `user_id`, `token_hash`) VALUES
(58, 31, '6adc707eba1c69345039455fa25e8cf881c3ac4616747b3b917141d2b44cf935'),
(60, 31, '06636059af03071ac84a72266741761a3485baebe7c489d29612567e12fa21bc'),
(65, 31, '3930e806f278688ac7cb318c54837506f3a056191bad9bd79d1b827f8b381897'),
(66, 31, '51d76efd728ac19b524d251c76ffac536140a64aad9f205e6b73c63def29de80'),
(67, 31, '025f524751f4dfe9397d9eaa3a24c02bdf268c1122fba71f5451eb668510dce9'),
(68, 31, '394e95f2b2a52d16bd61ef43b0cb01e58dad1029439bd0031b04e0760290fc45'),
(72, 72, '517c9aa7dcf271be387356ddf90d4706ca0d66bf00526615f30a43fcdc6ea35b'),
(75, 72, 'f951c2c9538549f08ae612340baadbee125a14f4cf36634df8be0bd733e7a36a'),
(80, 75, '71c91b83ce9965d6d156f0f7c6460002967507aae6a7d197e1c447fa488009d6');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `todo` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `category_id` int NOT NULL,
  `creation_date` int NOT NULL,
  `end_date` int NOT NULL,
  `done` tinyint(1) NOT NULL,
  `important` tinyint(1) NOT NULL,
  `deadline` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `user_id`, `todo`, `category_id`, `creation_date`, `end_date`, `done`, `important`, `deadline`) VALUES
(16, 31, 'Nem megcsinálni a házit', 2, 1648546668, 0, 0, 0, 0),
(23, 31, 'test', 2, 1648990734, 0, 0, 0, 0),
(24, 31, 'test módisítás', 3, 1648990775, 1648990811, 1, 1, 0),
(25, 31, 'testmegint', 2, 1648996307, 0, 0, 0, 60606060);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `password_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `password_salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `born_date` bigint NOT NULL,
  `register_date` bigint NOT NULL,
  `password_reset_token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `email_verification_token` char(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `password_salt`, `email`, `first_name`, `last_name`, `born_date`, `register_date`, `password_reset_token`, `email_verification_token`) VALUES
(31, 'admin', '3efe0ecc33bcf6dfeaac9021f87594ec517db8eb43fee3e215f896694f528780', '7206cbe8399e3061c5132b3ad817eb30a5b401f06a87f37c9af00b5b59817213', 'admin@example.com', 'Project', 'Admin', 0, 1645793563, NULL, NULL),
(73, 'szotaksoma', '2a1feb2f36621df4579c521d1292bb7ce587168067f82f21d71dfbdaa1476c63', '049e0e4e2be278305af177a45c3714e426827e50d2704cd45caba58d40f6f3a4', 'szotaksoma@gmail.com', 'Soma', 'Szoták', 854668800, 1649002767, 'e8cc3399fbdf1a32f23fef82dd8c6f0991e3679b95b37a9a1d4f04b545c635d1', NULL),
(74, 'kiazazibrusz', '4bd9f77dbfbe605a423ceff054ed817bdba77230251f6fa969840de002595d3f', '98711efe27cc5884e6e3ab6f6396290324f4f62d9c1a8e82d17295ad69e29bd0', 'ibranyilevente@gmail.com', 'Levente', 'Ibrányi', 993427200, 1649018414, NULL, NULL),
(75, 'csakafideszxd', '0113c6577eb0ecd2471ebe0b640362fd7f1ce08f80dbc5c528f10ff4d00941e5', '164221d84bf3479c6322e75e02a5ee7763695eb569acf208d6ac671464f2e885', 'webmester3@gmail.com', 'AKirály', 'Gráf', 969408000, 1649069281, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ibfk_1_todo` (`category_id`),
  ADD KEY `ibfk_2_todo` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `ibfk_1_todo` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ibfk_2_todo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
