-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 23, 2020 at 05:23 PM
-- Server version: 5.7.30-0ubuntu0.16.04.1
-- PHP Version: 7.3.19-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_spring`
--

-- --------------------------------------------------------

--
-- Table structure for table `device_logs`
--

CREATE TABLE `device_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hdevice_id` bigint(20) UNSIGNED NOT NULL,
  `front_camera_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thermal_camera_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sanitization_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sanitization_check_in` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `student_check_in` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_logs`
--

INSERT INTO `device_logs` (`id`, `hdevice_id`, `front_camera_status`, `thermal_camera_status`, `sanitization_status`, `sanitization_check_in`, `student_check_in`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '1', '1', '1', '1', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hdevices`
--

CREATE TABLE `hdevices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `device_number` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thermal_camera_serial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanitization_device_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity_date` date DEFAULT NULL,
  `subscription_price` double DEFAULT NULL,
  `features` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hdevices`
--

INSERT INTO `hdevices` (`id`, `organization_id`, `device_number`, `thermal_camera_serial_no`, `sanitization_device_no`, `validity_date`, `subscription_price`, `features`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '123', '151', '2121', '2020-07-24', 25, NULL, '1', NULL, '2020-07-22 06:37:03', NULL),
(2, 1, '124', '542', '215', '2020-07-20', 25, 'asd asd', '1', NULL, '2020-07-09 13:56:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `helps`
--

CREATE TABLE `helps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id`, `subject`, `url`, `method`, `ip`, `agent`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User registration', 'http://127.0.0.1:8000/register', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:31:46', '2020-07-09 05:31:46', NULL),
(2, 'User registration', 'http://127.0.0.1:8000/register', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:01', '2020-07-09 05:32:01', NULL),
(3, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:02', '2020-07-09 05:32:02', NULL),
(4, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:05', '2020-07-09 05:32:05', NULL),
(5, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:17', '2020-07-09 05:32:17', NULL),
(6, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:17', '2020-07-09 05:32:17', NULL),
(7, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:24', '2020-07-09 05:32:24', NULL),
(8, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:24', '2020-07-09 05:32:24', NULL),
(9, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:32:54', '2020-07-09 05:32:54', NULL),
(10, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:44:13', '2020-07-09 05:44:13', NULL),
(11, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:44:40', '2020-07-09 05:44:40', NULL),
(12, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:45:09', '2020-07-09 05:45:09', NULL),
(13, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:45:33', '2020-07-09 05:45:33', NULL),
(14, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:46:34', '2020-07-09 05:46:34', NULL),
(15, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:46:48', '2020-07-09 05:46:48', NULL),
(16, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 05:47:28', '2020-07-09 05:47:28', NULL),
(17, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 06:13:16', '2020-07-09 06:13:16', NULL),
(18, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 06:14:40', '2020-07-09 06:14:40', NULL),
(19, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 06:17:16', '2020-07-09 06:17:16', NULL),
(20, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 06:17:48', '2020-07-09 06:17:48', NULL),
(21, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 08:48:51', '2020-07-09 08:48:51', NULL),
(22, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 08:48:51', '2020-07-09 08:48:51', NULL),
(23, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 08:48:57', '2020-07-09 08:48:57', NULL),
(24, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 08:48:57', '2020-07-09 08:48:57', NULL),
(25, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 09:10:39', '2020-07-09 09:10:39', NULL),
(26, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 09:10:41', '2020-07-09 09:10:41', NULL),
(27, 'Organization member activity', 'http://127.0.0.1:8000/organizations/member/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 09:10:59', '2020-07-09 09:10:59', NULL),
(28, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 09:10:59', '2020-07-09 09:10:59', NULL),
(29, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:18:50', '2020-07-09 11:18:50', NULL),
(30, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:18:50', '2020-07-09 11:18:50', NULL),
(31, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:18:58', '2020-07-09 11:18:58', NULL),
(32, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:18:59', '2020-07-09 11:18:59', NULL),
(33, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:19:04', '2020-07-09 11:19:04', NULL),
(34, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:19:05', '2020-07-09 11:19:05', NULL),
(35, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:19:43', '2020-07-09 11:19:43', NULL),
(36, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:19:59', '2020-07-09 11:19:59', NULL),
(37, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:19:59', '2020-07-09 11:19:59', NULL),
(38, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:33:29', '2020-07-09 11:33:29', NULL),
(39, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:33:58', '2020-07-09 11:33:58', NULL),
(40, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:33:58', '2020-07-09 11:33:58', NULL),
(41, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:34:17', '2020-07-09 11:34:17', NULL),
(42, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:34:17', '2020-07-09 11:34:17', NULL),
(43, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:39:54', '2020-07-09 11:39:54', NULL),
(44, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:04', '2020-07-09 11:40:04', NULL),
(45, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:04', '2020-07-09 11:40:04', NULL),
(46, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:16', '2020-07-09 11:40:16', NULL),
(47, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:18', '2020-07-09 11:40:18', NULL),
(48, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:48', '2020-07-09 11:40:48', NULL),
(49, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:40:48', '2020-07-09 11:40:48', NULL),
(50, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:43:34', '2020-07-09 11:43:34', NULL),
(51, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:43:45', '2020-07-09 11:43:45', NULL),
(52, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:43:45', '2020-07-09 11:43:45', NULL),
(53, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:48:56', '2020-07-09 11:48:56', NULL),
(54, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:48:57', '2020-07-09 11:48:57', NULL),
(55, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:49:07', '2020-07-09 11:49:07', NULL),
(56, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:49:07', '2020-07-09 11:49:07', NULL),
(57, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:49:36', '2020-07-09 11:49:36', NULL),
(58, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:49:51', '2020-07-09 11:49:51', NULL),
(59, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:50:11', '2020-07-09 11:50:11', NULL),
(60, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:51:50', '2020-07-09 11:51:50', NULL),
(61, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:52:34', '2020-07-09 11:52:34', NULL),
(62, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:52:39', '2020-07-09 11:52:39', NULL),
(63, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:52:43', '2020-07-09 11:52:43', NULL),
(64, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:52:52', '2020-07-09 11:52:52', NULL),
(65, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:53:16', '2020-07-09 11:53:16', NULL),
(66, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:53:27', '2020-07-09 11:53:27', NULL),
(67, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:53:30', '2020-07-09 11:53:30', NULL),
(68, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:53:36', '2020-07-09 11:53:36', NULL),
(69, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:56:06', '2020-07-09 11:56:06', NULL),
(70, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:56:09', '2020-07-09 11:56:09', NULL),
(71, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:56:11', '2020-07-09 11:56:11', NULL),
(72, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:56:12', '2020-07-09 11:56:12', NULL),
(73, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:56:19', '2020-07-09 11:56:19', NULL),
(74, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:57:22', '2020-07-09 11:57:22', NULL),
(75, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:57:26', '2020-07-09 11:57:26', NULL),
(76, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:57:29', '2020-07-09 11:57:29', NULL),
(77, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:57:38', '2020-07-09 11:57:38', NULL),
(78, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:57:58', '2020-07-09 11:57:58', NULL),
(79, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:58:07', '2020-07-09 11:58:07', NULL),
(80, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:58:57', '2020-07-09 11:58:57', NULL),
(81, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:58:58', '2020-07-09 11:58:58', NULL),
(82, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:59:19', '2020-07-09 11:59:19', NULL),
(83, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:59:30', '2020-07-09 11:59:30', NULL),
(84, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 11:59:30', '2020-07-09 11:59:30', NULL),
(85, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:00:36', '2020-07-09 12:00:36', NULL),
(86, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:00:47', '2020-07-09 12:00:47', NULL),
(87, 'Log activity', 'http://127.0.0.1:8000/logActivity', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:02:51', '2020-07-09 12:02:51', NULL),
(88, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:04:42', '2020-07-09 12:04:42', NULL),
(89, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:04:42', '2020-07-09 12:04:42', NULL),
(90, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:05:25', '2020-07-09 12:05:25', NULL),
(91, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:05:35', '2020-07-09 12:05:35', NULL),
(92, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:05:35', '2020-07-09 12:05:35', NULL),
(93, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:11:12', '2020-07-09 12:11:12', NULL),
(94, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:12:51', '2020-07-09 12:12:51', NULL),
(95, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:12:54', '2020-07-09 12:12:54', NULL),
(96, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 12:13:02', '2020-07-09 12:13:02', NULL),
(97, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:55:12', '2020-07-09 13:55:12', NULL),
(98, 'Subscription activity', 'http://127.0.0.1:8000/subscriptions', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:55:45', '2020-07-09 13:55:45', NULL),
(99, 'Subscription activity', 'http://127.0.0.1:8000/subscription/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:55:57', '2020-07-09 13:55:57', NULL),
(100, 'Subscription activity', 'http://127.0.0.1:8000/subscriptions', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:55:57', '2020-07-09 13:55:57', NULL),
(101, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:56:02', '2020-07-09 13:56:02', NULL),
(102, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-09 13:56:08', '2020-07-09 13:56:08', NULL),
(103, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 05:02:01', '2020-07-11 05:02:01', NULL),
(104, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 05:03:29', '2020-07-11 05:03:29', NULL),
(105, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:08', '2020-07-11 07:32:08', NULL),
(106, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:19', '2020-07-11 07:32:19', NULL),
(107, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:19', '2020-07-11 07:32:19', NULL),
(108, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:30', '2020-07-11 07:32:30', NULL),
(109, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:31', '2020-07-11 07:32:31', NULL),
(110, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:52', '2020-07-11 07:32:52', NULL),
(111, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:32:53', '2020-07-11 07:32:53', NULL),
(112, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:33:01', '2020-07-11 07:33:01', NULL),
(113, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:33:01', '2020-07-11 07:33:01', NULL),
(114, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:33:08', '2020-07-11 07:33:08', NULL),
(115, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:33:10', '2020-07-11 07:33:10', NULL),
(116, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:33:56', '2020-07-11 07:33:56', NULL),
(117, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 07:34:17', '2020-07-11 07:34:17', NULL),
(118, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 08:18:53', '2020-07-11 08:18:53', NULL),
(119, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:38:57', '2020-07-11 11:38:57', NULL),
(120, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:38:58', '2020-07-11 11:38:58', NULL),
(121, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:39:05', '2020-07-11 11:39:05', NULL),
(122, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:39:05', '2020-07-11 11:39:05', NULL),
(123, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:39:09', '2020-07-11 11:39:09', NULL),
(124, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:45:00', '2020-07-11 11:45:00', NULL),
(125, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:45:22', '2020-07-11 11:45:22', NULL),
(126, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:51:17', '2020-07-11 11:51:17', NULL),
(127, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:53:03', '2020-07-11 11:53:03', NULL),
(128, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:57:59', '2020-07-11 11:57:59', NULL),
(129, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:58:57', '2020-07-11 11:58:57', NULL),
(130, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 11:59:32', '2020-07-11 11:59:32', NULL),
(131, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:00:10', '2020-07-11 12:00:10', NULL),
(132, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:00:31', '2020-07-11 12:00:31', NULL),
(133, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:00:54', '2020-07-11 12:00:54', NULL),
(134, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:02:04', '2020-07-11 12:02:04', NULL),
(135, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:02:41', '2020-07-11 12:02:41', NULL),
(136, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:04:16', '2020-07-11 12:04:16', NULL),
(137, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:08:20', '2020-07-11 12:08:20', NULL),
(138, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:08:46', '2020-07-11 12:08:46', NULL),
(139, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:09:21', '2020-07-11 12:09:21', NULL),
(140, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:10:27', '2020-07-11 12:10:27', NULL),
(141, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:11:19', '2020-07-11 12:11:19', NULL),
(142, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:11:19', '2020-07-11 12:11:19', NULL),
(143, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:11:32', '2020-07-11 12:11:32', NULL),
(144, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:12:30', '2020-07-11 12:12:30', NULL),
(145, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:13:42', '2020-07-11 12:13:42', NULL),
(146, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:01', '2020-07-11 12:14:01', NULL),
(147, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:01', '2020-07-11 12:14:01', NULL),
(148, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:09', '2020-07-11 12:14:09', NULL),
(149, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:09', '2020-07-11 12:14:09', NULL),
(150, 'Organization activity', 'http://127.0.0.1:8000/organization/2/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:12', '2020-07-11 12:14:12', NULL),
(151, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:14:23', '2020-07-11 12:14:23', NULL),
(152, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:27:11', '2020-07-11 12:27:11', NULL),
(153, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:31:18', '2020-07-11 12:31:18', NULL),
(154, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:32:46', '2020-07-11 12:32:46', NULL),
(155, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:38:23', '2020-07-11 12:38:23', NULL),
(156, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:39:07', '2020-07-11 12:39:07', NULL),
(157, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:39:58', '2020-07-11 12:39:58', NULL),
(158, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:41:57', '2020-07-11 12:41:57', NULL),
(159, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:43:43', '2020-07-11 12:43:43', NULL),
(160, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:44:51', '2020-07-11 12:44:51', NULL),
(161, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:46:10', '2020-07-11 12:46:10', NULL),
(162, 'Organization activity', 'http://127.0.0.1:8000/organization/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:46:14', '2020-07-11 12:46:14', NULL),
(163, 'Organization activity', 'http://127.0.0.1:8000/organization/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:47:40', '2020-07-11 12:47:40', NULL),
(164, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:48:22', '2020-07-11 12:48:22', NULL),
(165, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:50:08', '2020-07-11 12:50:08', NULL),
(166, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:50:14', '2020-07-11 12:50:14', NULL),
(167, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:51:55', '2020-07-11 12:51:55', NULL),
(168, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:52:32', '2020-07-11 12:52:32', NULL),
(169, 'Organization activity', 'http://127.0.0.1:8000/organization/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:52:33', '2020-07-11 12:52:33', NULL),
(170, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:52:58', '2020-07-11 12:52:58', NULL),
(171, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:27', '2020-07-11 12:53:27', NULL);
INSERT INTO `log_activity` (`id`, `subject`, `url`, `method`, `ip`, `agent`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(172, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:27', '2020-07-11 12:53:27', NULL),
(173, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:36', '2020-07-11 12:53:36', NULL),
(174, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:37', '2020-07-11 12:53:37', NULL),
(175, 'Organization activity', 'http://127.0.0.1:8000/organization/3/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:40', '2020-07-11 12:53:40', NULL),
(176, 'Organization activity', 'http://127.0.0.1:8000/organization/3/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:49', '2020-07-11 12:53:49', NULL),
(177, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:56', '2020-07-11 12:53:56', NULL),
(178, 'Organization activity', 'http://127.0.0.1:8000/organization/3/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:53:58', '2020-07-11 12:53:58', NULL),
(179, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:54:35', '2020-07-11 12:54:35', NULL),
(180, 'Organization activity', 'http://127.0.0.1:8000/organization/3/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:54:58', '2020-07-11 12:54:58', NULL),
(181, 'Organization activity', 'http://127.0.0.1:8000/organization/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:55:01', '2020-07-11 12:55:01', NULL),
(182, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:55:01', '2020-07-11 12:55:01', NULL),
(183, 'Organization activity', 'http://127.0.0.1:8000/organization/2/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:55:09', '2020-07-11 12:55:09', NULL),
(184, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:56:22', '2020-07-11 12:56:22', NULL),
(185, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:56:23', '2020-07-11 12:56:23', NULL),
(186, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:56:36', '2020-07-11 12:56:36', NULL),
(187, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:57:16', '2020-07-11 12:57:16', NULL),
(188, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:57:16', '2020-07-11 12:57:16', NULL),
(189, 'Organization activity', 'http://127.0.0.1:8000/organization/4/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:15', '2020-07-11 12:58:15', NULL),
(190, 'Organization activity', 'http://127.0.0.1:8000/organization/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:17', '2020-07-11 12:58:17', NULL),
(191, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:17', '2020-07-11 12:58:17', NULL),
(192, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:37', '2020-07-11 12:58:37', NULL),
(193, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:37', '2020-07-11 12:58:37', NULL),
(194, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:51', '2020-07-11 12:58:51', NULL),
(195, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:58:52', '2020-07-11 12:58:52', NULL),
(196, 'Organization activity', 'http://127.0.0.1:8000/organization/5/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:07', '2020-07-11 12:59:07', NULL),
(197, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:12', '2020-07-11 12:59:12', NULL),
(198, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:37', '2020-07-11 12:59:37', NULL),
(199, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:46', '2020-07-11 12:59:46', NULL),
(200, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:46', '2020-07-11 12:59:46', NULL),
(201, 'Organization activity', 'http://127.0.0.1:8000/organizations/add', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:57', '2020-07-11 12:59:57', NULL),
(202, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 12:59:57', '2020-07-11 12:59:57', NULL),
(203, 'Organization activity', 'http://127.0.0.1:8000/organization/6/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:00:00', '2020-07-11 13:00:00', NULL),
(204, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:00:26', '2020-07-11 13:00:26', NULL),
(205, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:00:33', '2020-07-11 13:00:33', NULL),
(206, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:01:57', '2020-07-11 13:01:57', NULL),
(207, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:04:37', '2020-07-11 13:04:37', NULL),
(208, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:05:04', '2020-07-11 13:05:04', NULL),
(209, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:05:24', '2020-07-11 13:05:24', NULL),
(210, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:05:31', '2020-07-11 13:05:31', NULL),
(211, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:07:17', '2020-07-11 13:07:17', NULL),
(212, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:08:05', '2020-07-11 13:08:05', NULL),
(213, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:08:57', '2020-07-11 13:08:57', NULL),
(214, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:09:11', '2020-07-11 13:09:11', NULL),
(215, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:09:18', '2020-07-11 13:09:18', NULL),
(216, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:10:09', '2020-07-11 13:10:09', NULL),
(217, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:10:13', '2020-07-11 13:10:13', NULL),
(218, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:10:15', '2020-07-11 13:10:15', NULL),
(219, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:10:39', '2020-07-11 13:10:39', NULL),
(220, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:11:16', '2020-07-11 13:11:16', NULL),
(221, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:12:27', '2020-07-11 13:12:27', NULL),
(222, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:20:33', '2020-07-11 13:20:33', NULL),
(223, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:20:49', '2020-07-11 13:20:49', NULL),
(224, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:21:27', '2020-07-11 13:21:27', NULL),
(225, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:22:00', '2020-07-11 13:22:00', NULL),
(226, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:22:46', '2020-07-11 13:22:46', NULL),
(227, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:22:52', '2020-07-11 13:22:52', NULL),
(228, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:22:56', '2020-07-11 13:22:56', NULL),
(229, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:23:02', '2020-07-11 13:23:02', NULL),
(230, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:23:05', '2020-07-11 13:23:05', NULL),
(231, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:23:09', '2020-07-11 13:23:09', NULL),
(232, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:28:23', '2020-07-11 13:28:23', NULL),
(233, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:28:37', '2020-07-11 13:28:37', NULL),
(234, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:34:43', '2020-07-11 13:34:43', NULL),
(235, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:35:24', '2020-07-11 13:35:24', NULL),
(236, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:35:45', '2020-07-11 13:35:45', NULL),
(237, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:36:09', '2020-07-11 13:36:09', NULL),
(238, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:41:43', '2020-07-11 13:41:43', NULL),
(239, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:01', '2020-07-11 13:42:01', NULL),
(240, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:01', '2020-07-11 13:42:01', NULL),
(241, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:15', '2020-07-11 13:42:15', NULL),
(242, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:20', '2020-07-11 13:42:20', NULL),
(243, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:23', '2020-07-11 13:42:23', NULL),
(244, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:42:44', '2020-07-11 13:42:44', NULL),
(245, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:43:01', '2020-07-11 13:43:01', NULL),
(246, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:43:01', '2020-07-11 13:43:01', NULL),
(247, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:43:17', '2020-07-11 13:43:17', NULL),
(248, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:43:17', '2020-07-11 13:43:17', NULL),
(249, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:43:56', '2020-07-11 13:43:56', NULL),
(250, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:44:08', '2020-07-11 13:44:08', NULL),
(251, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:46:01', '2020-07-11 13:46:01', NULL),
(252, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:46:21', '2020-07-11 13:46:21', NULL),
(253, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:46:30', '2020-07-11 13:46:30', NULL),
(254, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:47:59', '2020-07-11 13:47:59', NULL),
(255, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:48:43', '2020-07-11 13:48:43', NULL),
(256, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:54:53', '2020-07-11 13:54:53', NULL),
(257, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:56:03', '2020-07-11 13:56:03', NULL),
(258, 'Organization member activity', 'http://127.0.0.1:8000/member-img/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:56:06', '2020-07-11 13:56:06', NULL),
(259, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:56:07', '2020-07-11 13:56:07', NULL),
(260, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:56:51', '2020-07-11 13:56:51', NULL),
(261, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:57:34', '2020-07-11 13:57:34', NULL),
(262, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-11 13:57:39', '2020-07-11 13:57:39', NULL),
(263, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 06:44:08', '2020-07-13 06:44:08', NULL),
(264, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 06:44:15', '2020-07-13 06:44:15', NULL),
(265, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 06:44:16', '2020-07-13 06:44:16', NULL),
(266, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 06:48:34', '2020-07-13 06:48:34', NULL),
(267, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 06:48:36', '2020-07-13 06:48:36', NULL),
(268, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 08:50:45', '2020-07-13 08:50:45', NULL),
(269, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 08:50:55', '2020-07-13 08:50:55', NULL),
(270, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-13 08:50:59', '2020-07-13 08:50:59', NULL),
(271, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-16 13:19:25', '2020-07-16 13:19:25', NULL),
(272, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-16 13:19:35', '2020-07-16 13:19:35', NULL),
(273, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-16 13:19:36', '2020-07-16 13:19:36', NULL),
(274, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-16 13:19:37', '2020-07-16 13:19:37', NULL),
(275, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-16 13:19:47', '2020-07-16 13:19:47', NULL),
(276, 'User login', 'http://127.0.0.1:8000/login', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:02', '2020-07-22 06:36:02', NULL),
(277, 'User login', 'http://127.0.0.1:8000/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:11', '2020-07-22 06:36:11', NULL),
(278, 'Log activity', 'http://127.0.0.1:8000/home', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:11', '2020-07-22 06:36:11', NULL),
(279, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:14', '2020-07-22 06:36:14', NULL),
(280, 'Organization activity', 'http://127.0.0.1:8000/organization/6/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:18', '2020-07-22 06:36:18', NULL),
(281, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:36:24', '2020-07-22 06:36:24', NULL),
(282, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:37:45', '2020-07-22 06:37:45', NULL),
(283, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/1/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:37:51', '2020-07-22 06:37:51', NULL),
(284, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/2/edit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:37:59', '2020-07-22 06:37:59', NULL),
(285, 'Organization activity', 'http://127.0.0.1:8000/organizations', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:38:03', '2020-07-22 06:38:03', NULL),
(286, 'Organization member activity', 'http://127.0.0.1:8000/organization/member/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:38:11', '2020-07-22 06:38:11', NULL),
(287, 'Organization activity', 'http://127.0.0.1:8000/organization/1/details', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', NULL, '2020-07-22 06:38:11', '2020-07-22 06:38:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_division` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `organization_id`, `name`, `identity_no`, `designation_class`, `department_division`, `mobile_no`, `alt_mobile_no`, `video_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'test', 'asdas', 'asd', 'asd', '9096722806', NULL, 'uploads/organizations/members/1594296335.mp4', '1', '2020-07-09 09:10:59', '2020-07-09 12:05:35', NULL),
(2, 1, 'akshay', '521', '1', 'a', '8999140531', NULL, 'uploads/organizations/members/videos/1594301308.mp4', '1', NULL, '2020-07-22 06:38:11', '2020-07-22 06:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `member_logs`
--

CREATE TABLE `member_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `temp` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_logs`
--

INSERT INTO `member_logs` (`id`, `member_id`, `temp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 80, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_photos`
--

CREATE TABLE `member_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_photos`
--

INSERT INTO `member_photos` (`id`, `member_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'uploads/organizations/members/1594301802.png', '1', NULL, NULL, NULL),
(3, 1, 'uploads/organizations/members/1594474981.jpg', '1', NULL, NULL, NULL),
(4, 1, 'uploads/organizations/members/1594474997.jpg', '1', NULL, '2020-07-11 13:56:07', '2020-07-11 13:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_02_072424_create_log_activity_table', 1),
(5, '2020_07_02_114309_create_settings_table', 1),
(6, '2020_07_02_114435_create_location_table', 1),
(7, '2020_07_02_114438_create_organizations_table', 1),
(8, '2020_07_02_114555_create_helps_table', 1),
(9, '2020_07_02_114641_create_hdevices_table', 1),
(10, '2020_07_02_114751_create_device_logs_table', 1),
(11, '2020_07_02_114955_create_subscriptions_table', 1),
(12, '2020_07_02_115042_create_organization_users_table', 1),
(13, '2020_07_02_115141_create_organization_user_logs_table', 1),
(14, '2020_07_02_115302_create_members_table', 1),
(15, '2020_07_02_115320_create_member_logs_table', 1),
(16, '2020_07_02_115411_create_organization_notification_logs_table', 1),
(17, '2020_07_02_115525_create_organization_user_login_histories_table', 1),
(18, '2020_07_02_115550_create_organization_logs_table', 1),
(19, '2020_07_02_115650_create_foreign_keys_table', 1),
(20, '2020_07_09_112645_add_api_token_organization_user_table', 2),
(21, '2020_07_09_160615_create_member_photos_table', 3),
(22, '2020_07_13_142620_create_ota_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` mediumtext COLLATE utf8mb4_unicode_ci,
  `address_line2` mediumtext COLLATE utf8mb4_unicode_ci,
  `logo_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `email`, `mobile_no`, `alt_mobile_no`, `address_line1`, `address_line2`, `logo_url`, `location_id`, `pincode`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Vishnu Onkar', 'akgbahadarpure@gmail.com', '0909672280', NULL, 'Akola', NULL, NULL, NULL, NULL, '1', '2020-07-09 05:32:24', '2020-07-09 05:32:24', NULL),
(2, 'Akshay bahadarpure', 'akgbahadarpure@gmail.com', '0909672280', NULL, 'Amravati', NULL, NULL, 705, '5421542', '1', '2020-07-11 12:14:09', '2020-07-11 12:52:33', NULL),
(5, 'Akshay bahadarpure', 'akgbahadarpure@gmail.com', '0909672280', NULL, 'Amravati', NULL, NULL, 303, '444607', '1', NULL, NULL, NULL),
(6, 'Scholars Convent', 'schikne202@gmail.com', '0737867005', NULL, 'Ambad', NULL, NULL, 1533, '54215', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_logs`
--

CREATE TABLE `organization_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `organization_check_in` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_notification_logs`
--

CREATE TABLE `organization_notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_notification_logs`
--

INSERT INTO `organization_notification_logs` (`id`, `organization_id`, `member_id`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'testing', NULL, NULL, NULL),
(2, 1, 1, 'testing', NULL, NULL, NULL),
(3, 1, 1, 'testing', NULL, NULL, NULL),
(4, 1, 1, 'testing', NULL, NULL, NULL),
(5, 1, 5, 'testing', NULL, NULL, NULL),
(6, 1, 1, 'testingg', NULL, NULL, NULL),
(7, 1, 2, 'testingg', NULL, NULL, NULL),
(8, 1, 3, 'testingg', NULL, NULL, NULL),
(9, 1, 4, 'testingg', NULL, NULL, NULL),
(10, 1, 5, 'testingg', NULL, NULL, NULL),
(11, 1, 6, 'testingg', NULL, NULL, NULL),
(12, 1, 1, 'testingg', NULL, NULL, NULL),
(13, 1, 2, 'testingg', NULL, NULL, NULL),
(14, 1, 3, 'testingg', NULL, NULL, NULL),
(15, 1, 4, 'testingg', NULL, NULL, NULL),
(16, 1, 5, 'testingg', NULL, NULL, NULL),
(17, 1, 6, 'testingg', NULL, NULL, NULL),
(18, 1, 1, 'testingg', NULL, NULL, NULL),
(19, 1, 2, 'testingg', NULL, NULL, NULL),
(20, 1, 1, 'Sanitization is going to be started', NULL, NULL, NULL),
(21, 1, 2, 'Sanitization is going to be started', NULL, NULL, NULL),
(22, 1, 1, 'Sanitization is going to be started', NULL, NULL, NULL),
(23, 1, 2, 'Sanitization is going to be started', NULL, NULL, NULL),
(24, 1, 1, 'Sanitization is going to be started', NULL, NULL, NULL),
(25, 1, 1, 'Sanitization is going to be started', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_users`
--

CREATE TABLE `organization_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `hdevice_id` bigint(20) UNSIGNED NOT NULL,
  `organizationid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_users`
--

INSERT INTO `organization_users` (`id`, `organization_id`, `hdevice_id`, `organizationid`, `deviceid`, `password`, `status`, `created_at`, `updated_at`, `deleted_at`, `api_token`) VALUES
(1, 1, 1, '12', '45', '123456789', '1', NULL, NULL, NULL, NULL),
(2, 1, 2, '54', '65', '$2y$10$4Wauwn4uL418JCp/G9hL4eoe0bzm4xHeekmgvBrUx2Z6v7zXx5nqO', '1', NULL, '2020-07-09 13:57:17', NULL, 'YUM0dG5QOWxYblBGekkwdlFzaWlxTGtWc3JLZFg5RXM2aXdkMHJNVFIyOEppeUZ4eVU0OG5uV0JJQ0Ix5f07223cbe950');

-- --------------------------------------------------------

--
-- Table structure for table `organization_user_login_histories`
--

CREATE TABLE `organization_user_login_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_user_logs`
--

CREATE TABLE `organization_user_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ota`
--

CREATE TABLE `ota` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` mediumtext COLLATE utf8mb4_unicode_ci,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ota`
--

INSERT INTO `ota` (`id`, `type`, `version`, `host`, `port`, `bin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'project', '21', 'url', '28', 'asdasd', NULL, NULL, NULL),
(2, 'project', '21', 'url', '28', 'asdasd', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privacy_policy` longtext COLLATE utf8mb4_unicode_ci,
  `terms_condition` longtext COLLATE utf8mb4_unicode_ci,
  `sender_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_gateway_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity_days` int(11) NOT NULL,
  `subscription_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `validity_days`, `subscription_price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 2, 25, '2020-07-09 13:55:57', '2020-07-09 13:55:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$10$BozOAlKEuLFZu2gLGMs8yepSbY8BZvuXQeNnqbGxrh5fJdDQagegm', NULL, '2020-07-09 05:32:02', '2020-07-09 05:32:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `device_logs`
--
ALTER TABLE `device_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_logs_hdevice_id_foreign` (`hdevice_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hdevices`
--
ALTER TABLE `hdevices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hdevices_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `helps`
--
ALTER TABLE `helps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helps_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_activity_user_id_foreign` (`user_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `member_logs`
--
ALTER TABLE `member_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_logs_member_id_foreign` (`member_id`);

--
-- Indexes for table `member_photos`
--
ALTER TABLE `member_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizations_location_id_foreign` (`location_id`);

--
-- Indexes for table `organization_logs`
--
ALTER TABLE `organization_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_logs_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `organization_notification_logs`
--
ALTER TABLE `organization_notification_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_notification_logs_organization_id_foreign` (`organization_id`),
  ADD KEY `organization_notification_logs_member_id_foreign` (`member_id`);

--
-- Indexes for table `organization_users`
--
ALTER TABLE `organization_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_users_organization_id_foreign` (`organization_id`),
  ADD KEY `organization_users_hdevice_id_foreign` (`hdevice_id`);

--
-- Indexes for table `organization_user_login_histories`
--
ALTER TABLE `organization_user_login_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_user_login_histories_organization_user_id_foreign` (`organization_user_id`);

--
-- Indexes for table `organization_user_logs`
--
ALTER TABLE `organization_user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ota`
--
ALTER TABLE `ota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device_logs`
--
ALTER TABLE `device_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hdevices`
--
ALTER TABLE `hdevices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `helps`
--
ALTER TABLE `helps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `member_logs`
--
ALTER TABLE `member_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `member_photos`
--
ALTER TABLE `member_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `organization_logs`
--
ALTER TABLE `organization_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organization_notification_logs`
--
ALTER TABLE `organization_notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `organization_users`
--
ALTER TABLE `organization_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organization_user_login_histories`
--
ALTER TABLE `organization_user_login_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organization_user_logs`
--
ALTER TABLE `organization_user_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ota`
--
ALTER TABLE `ota`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `device_logs`
--
ALTER TABLE `device_logs`
  ADD CONSTRAINT `device_logs_hdevice_id_foreign` FOREIGN KEY (`hdevice_id`) REFERENCES `hdevices` (`id`);

--
-- Constraints for table `hdevices`
--
ALTER TABLE `hdevices`
  ADD CONSTRAINT `hdevices_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `helps`
--
ALTER TABLE `helps`
  ADD CONSTRAINT `helps_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD CONSTRAINT `log_activity_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `member_logs`
--
ALTER TABLE `member_logs`
  ADD CONSTRAINT `member_logs_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Constraints for table `organization_logs`
--
ALTER TABLE `organization_logs`
  ADD CONSTRAINT `organization_logs_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `organization_notification_logs`
--
ALTER TABLE `organization_notification_logs`
  ADD CONSTRAINT `organization_notification_logs_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `organization_notification_logs_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `organization_users`
--
ALTER TABLE `organization_users`
  ADD CONSTRAINT `organization_users_hdevice_id_foreign` FOREIGN KEY (`hdevice_id`) REFERENCES `hdevices` (`id`),
  ADD CONSTRAINT `organization_users_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `organization_user_login_histories`
--
ALTER TABLE `organization_user_login_histories`
  ADD CONSTRAINT `organization_user_login_histories_organization_user_id_foreign` FOREIGN KEY (`organization_user_id`) REFERENCES `organization_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
