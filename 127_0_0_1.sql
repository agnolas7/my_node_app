-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2025 at 05:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_node_app`
--
CREATE DATABASE IF NOT EXISTS `my_node_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `my_node_app`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password_encrypted` text DEFAULT NULL,
  `password_unencrypted` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password_encrypted`, `password_unencrypted`) VALUES
('she', '$2b$10$0SARgM1Zi8MUnDWRjvDuIuyuSdfuLmYqGuds3S7e2bOmpc5H9dFYG', 'she'),
('shiela', '$2b$10$luvK0tmw70pZXjfbKv23n.hpC3OV8E0Lu6LWUX9lXQBum3cQYOgMi', 'shiela'),
('shu', '$2b$10$46/XX37B5WP4MjgOOXaoI.zJfAohQA6L6emXoZnTlzEZ/ph462Wb6', 'shu'),
('shui', '$2b$10$JRsU0GN7GiUh0r/qNt8TCeUyJa7S9Q.XDWi6PY/Jgli0F38fXtLrK', 'shui');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
