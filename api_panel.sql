-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 04:01 PM
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
-- Database: `api_panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$IB4X0QYyI7xP4FWft5rULOQQWQ/0xm23HAHf0P/lFoWVkUG37A8Cy', '2024-11-21 14:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `license_key` varchar(64) DEFAULT NULL,
  `status` enum('active','banned') DEFAULT 'active',
  `plan_type` enum('demo','monthly','yearly','custom') DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `device_limit` int(11) DEFAULT 1,
  `used_devices` int(11) DEFAULT 0,
  `custom_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `license_key`, `status`, `plan_type`, `expiry_date`, `device_limit`, `used_devices`, `custom_message`, `created_at`) VALUES
(3, '8424d44516c8bb134eb940d13dc76a1a', 'active', 'demo', '2028-02-12 02:01:00', 100, 100, NULL, '2024-11-21 14:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `api_usage`
--

CREATE TABLE `api_usage` (
  `id` int(11) NOT NULL,
  `license_key` varchar(64) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_usage`
--

INSERT INTO `api_usage` (`id`, `license_key`, `request_date`) VALUES
(2, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:47'),
(3, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:47'),
(4, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:47'),
(5, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:47'),
(6, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:48'),
(7, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:48'),
(8, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:48'),
(9, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:48'),
(10, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:52'),
(11, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(12, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(13, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(14, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(15, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(16, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(17, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:53'),
(18, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(19, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(20, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(21, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(22, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(23, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(24, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:54'),
(25, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(26, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(27, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(28, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(29, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(30, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(31, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:55'),
(32, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(33, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(34, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(35, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(36, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(37, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(38, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:56'),
(39, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(40, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(41, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(42, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(43, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(44, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(45, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:57'),
(46, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(47, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(48, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(49, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(50, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(51, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(52, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:58'),
(53, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(54, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(55, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(56, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(57, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(58, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(59, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:52:59'),
(60, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:00'),
(61, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:00'),
(62, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:00'),
(63, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(64, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(65, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(66, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(67, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(68, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:02'),
(69, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(70, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(71, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(72, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(73, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(74, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(75, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:03'),
(76, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(77, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(78, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(79, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(80, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(81, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(82, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(83, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:04'),
(84, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(85, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(86, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(87, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(88, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(89, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:05'),
(90, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(91, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(92, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(93, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(94, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(95, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(96, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:06'),
(97, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:07'),
(98, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:07'),
(99, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:07'),
(100, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:07'),
(101, '8424d44516c8bb134eb940d13dc76a1a', '2024-11-21 14:53:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_key` (`license_key`);

--
-- Indexes for table `api_usage`
--
ALTER TABLE `api_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_key` (`license_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `api_usage`
--
ALTER TABLE `api_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_usage`
--
ALTER TABLE `api_usage`
  ADD CONSTRAINT `api_usage_ibfk_1` FOREIGN KEY (`license_key`) REFERENCES `api_keys` (`license_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
