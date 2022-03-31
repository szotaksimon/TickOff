-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2022 at 12:49 PM
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
(32, 64, 'd30f5b398e0b93d6db6be770aa19d1978d73bf7eed687d155955070637142fed'),
(34, 67, '056893a2cdcadff5d76f316c9283566a024184d166de2d8ef3e241da3a324890'),
(35, 68, '159481f3ebb1990055daba960d05e38599fda387d0df9fe6d0963f5438030edb'),
(36, 31, '02c04fcadfc0ca0673bd4cca2b48bdb7014f2d87d0325819dfda7df7435d7804'),
(38, 31, '72342a8df75b129a0a3ccaae16e2e9a620dfde343e30788c7871065f8940a8db'),
(40, 31, '580723a04f5fbfe9a5ce362cde2bbc4a2382783fc30a99559aa2a98d2b3a69fe'),
(41, 31, 'ec4faa955c9a25e2318f2ba1a9953e72e3d86a1f6a5a7204ff9159353986c2c9'),
(42, 31, 'c7ab4d4b65d11956c64412d330fc378058ca18408756132c7b9d719cdd1a73fe'),
(43, 31, 'e31f168dc897c8dccc7649b7492dee1c2250ba64519ff2dd452e59dbef186935'),
(44, 31, 'f1678599ea6bfb467463b62b3d95db4c1c9fee385e97edaef2208bfb20edde81'),
(45, 31, 'f62e235c82a32e461db0ad57325ea262e26b0f080c93fa29d9562a21bb70d61c'),
(46, 31, '138ace2f5cbc657848647d5d445e0564176052d8f16de8c028c593c01127c4de'),
(47, 31, 'a364040eab546c2a23ea4c932b027f07659e6483883e3cb79cd2e94025de8402'),
(48, 31, '94a982dc29c0cb8f9de01570a1ac7327bf9f46fb46ab1629a5a62dcac60250cc'),
(49, 31, '327c2508b138a27ba21506fd4e6a47f4bb1852ac24b9d4afacf025272314a05e'),
(50, 31, '2675be80982b28ab49114d04997a3d005ff7f818809389717dc63942f9b908af');

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
  `done` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `user_id`, `todo`, `category_id`, `creation_date`, `end_date`, `done`) VALUES
(16, 31, 'Nem megcsinálni a házit', 2, 1648546668, 0, 0),
(17, 31, 'Nem megcsinálni a házit', 2, 1648548220, 0, 1),
(18, 31, 'Nem megcsinálni a házit', 2, 1648548593, 0, 0),
(19, 31, 'Nem megcsinálni a házit', 2, 0, 1648548600, 1),
(20, 31, 'test', 2, 1648549203, 0, 0),
(21, 31, 'Test', 2, 0, 1648549222, 1);

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
(61, 'simonsimon', '3dfdc27331ac05e5b60f6d65857ad7ab52613a42c733dcc1364f87547e57c73c', '4e727a2dd1510b89cb4bf0d6dafa2426cb68dba3aa65be2e69000c74e1247498', 'szotak.simon@gmail.com', 'Simon', 'Szoták', 960249600, 1648292001, NULL, '34173cdd4f20b17143460ad6783e6f3fe146cd348142fc56d71a8fd227c78c5f'),
(66, 'szotaksoma', '6794fe66f20c4e5b009af6691bb1d3e9122a3cf664a65fa4db92d3215cd1edfb', 'fb3cc3564e8910df7c4cf0958cd647e8045335f156767eb6241213d57903aeb5', 'szotaksoma@gmail.com', 'Soma', 'Szoták', 854668800, 1648328653, NULL, NULL),
(67, 'H-bence-J', 'b66f623a1f703eddbea0e64d8602308fb71dc92fe5ed87a551275d682ec7b75b', '449175644131226b2c3a06243adf8d0aee51fc0b3b41fad2c51c4949f13fc476', 'homokibence2001@gmail.com', 'Szia', 'HEllo', 993513600, 1648416790, NULL, NULL),
(68, 'Kiricarry01', 'ab1213016bb34668a01b04ca6f195a9d3d3e76e68bf8190f0f93c092e1a62d9f', '88859364086f8ea34ac8af9dd06de0232a20c0bfb73cbea3b62044d85e84d0b0', 'kiraly.david9912@gmail.com', 'Dávid', 'Király', 929145600, 1648477951, NULL, NULL),
(69, 'szotaksimonvagyok', '0504015fbd7db477a37c2d538e8a48a02dee0d2cded2a7bbdf2193a607ada39c', 'ea5e700e0fc4942d4590ce58315c6a0eb77154dc2305ef582e56aa25c075c1d8', 'szotak.simon16@gmail.com', 'Simon', 'Szoták', 960249600, 1648506560, NULL, '7cdb683f26f25cd2f000c3ab165ceadad4f9b7f4cb951c823f28ea306e6feedd');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
