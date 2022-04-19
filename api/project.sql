-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2022 at 09:08 PM
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
(89, 31, 'Az első feladatom.', 2, 1650107987, 0, 0, 1, 1650067200);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `admin` tinyint(1) NOT NULL,
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

INSERT INTO `user` (`id`, `admin`, `username`, `password_hash`, `password_salt`, `email`, `first_name`, `last_name`, `born_date`, `register_date`, `password_reset_token`, `email_verification_token`) VALUES
(31, 1, 'admin1', '3efe0ecc33bcf6dfeaac9021f87594ec517db8eb43fee3e215f896694f528780', '7206cbe8399e3061c5132b3ad817eb30a5b401f06a87f37c9af00b5b59817213', 'admin@example.com', 'Admin', 'Project', 945129600, 1645793563, NULL, NULL),
(88, 0, 'krisz_98', '7afc72ba13cefcb81dc36338486dd6f472c5f59833fd1b518692474477bc6920', '9539a910a80e88c8b085767d0fffade0629ba78f6c3aba19a6e59c547c7c4659', 'v.krisztian98@freemail.hu', 'Krisztián', 'Vágvölgyi ', 891907200, 1649965593, NULL, NULL),
(93, 0, 'mmgergoo', 'e28f91fa6bdff50b9010cfbdb3fd9a4503cd564258852a3f79e31871c47a3e03', '54679066e4908dea577fbdf242b0d67fae769cab9652245a20ebf1f6b55ef694', 'mmgergo5@gmail.com', 'Gergő', 'Molnár', 975888000, 1650136035, NULL, NULL),
(96, 0, 'Wricky', '8d6b984c28f05f0c595d50ac0075124c815bb52b19d6396c509afe3ff27a3ead', 'f877db0f47baadab1fa0beca579de0c317cc158d5b7ae5e25fc2c97cc7e76fc9', 'rakosiv@gmail.com', 'Viktória', 'Rákosi', 998870400, 1650141384, NULL, NULL);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

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
