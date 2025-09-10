-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2025 at 06:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `analytics_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `trip_status` enum('booked','completed','cancelled') DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `trip_date` date DEFAULT NULL,
  `trip_time` time DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `seat_numbers` varchar(100) DEFAULT NULL,
  `pickup_point` varchar(100) DEFAULT NULL,
  `drop_point` varchar(100) DEFAULT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) DEFAULT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `discounted_fare` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('cash','card','wallet','upi') DEFAULT NULL,
  `status` enum('paid','pending','refunded') DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_percentage` decimal(5,2) DEFAULT NULL,
  `cancel_time` timestamp NULL DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `analytics`
--

INSERT INTO `analytics` (`analytics_id`, `user_id`, `driver_id`, `vehicle_id`, `trip_id`, `trip_status`, `route_id`, `trip_date`, `trip_time`, `total_seats`, `seat_numbers`, `pickup_point`, `drop_point`, `booking_time`, `amount`, `promo_code`, `discounted_fare`, `payment_method`, `status`, `cancellation_reason`, `refund_amount`, `refund_percentage`, `cancel_time`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 7, 'completed', 1, '2025-09-01', '09:30:00', 2, 'A1,A2', 'Rajkot Bus Stand', 'Ahmedabad ISBT', '2025-08-31 13:15:00', 750.00, 'WELCOME50', 700.00, 'upi', 'paid', NULL, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, 1, '2025-09-04 10:01:15', '2025-09-04 10:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `cancellation`
--

CREATE TABLE `cancellation` (
  `policy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cancellation_reason` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `cancellation_time` time NOT NULL DEFAULT current_timestamp(),
  `cancellation_date` date NOT NULL DEFAULT current_timestamp(),
  `refund_amount` decimal(10,2) NOT NULL,
  `refund_percentage` decimal(5,2) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancellation`
--

INSERT INTO `cancellation` (`policy_id`, `user_id`, `cancellation_reason`, `status`, `cancellation_time`, `cancellation_date`, `refund_amount`, `refund_percentage`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Customer canceled due to emergency', 'Active', '10:30:00', '2025-09-01', 500.00, 50.00, 1, '0000-00-00', 0, '0000-00-00', 1, '2025-09-04 06:19:16', '2025-09-04 06:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city` varchar(150) NOT NULL,
  `state` varchar(150) DEFAULT NULL,
  `customer_support_number` varchar(20) DEFAULT NULL,
  `driver_support_number` varchar(20) DEFAULT NULL,
  `emergency_number` varchar(20) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city`, `state`, `customer_support_number`, `driver_support_number`, `emergency_number`, `service_type`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'Rajkot', 'Gujarat', '1800123456', '1800654321', '100', 'Cab, Auto, Bike', 1, NULL, NULL, NULL, 1, '2025-09-04 11:40:54', '2025-09-04 11:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `verified_status` tinyint(1) DEFAULT 0,
  `gender` enum('male','female','other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `register_city` varchar(100) DEFAULT NULL,
  `current_latitude` decimal(10,6) DEFAULT NULL,
  `current_longitude` decimal(10,6) DEFAULT NULL,
  `register_latitude` decimal(10,6) DEFAULT NULL,
  `register_longitude` decimal(10,6) DEFAULT NULL,
  `total_trips` int(11) DEFAULT 0,
  `active_status` tinyint(1) DEFAULT 1,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT current_timestamp(),
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT current_timestamp(),
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `email`, `phone_number`, `verified_status`, `gender`, `date_of_birth`, `city`, `register_city`, `current_latitude`, `current_longitude`, `register_latitude`, `register_longitude`, `total_trips`, `active_status`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', '9876543210', 1, 'male', '1995-08-20', 'Ahmedabad', 'Ahmedabad', 23.022505, 72.571365, 23.020000, 72.570000, 5, 1, 1, '2025-09-04', NULL, '2025-09-04', 1, '2025-09-04 07:15:56', '2025-09-04 07:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `delete_account_requests`
--

CREATE TABLE `delete_account_requests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `reason_to_delete_account` text DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delete_account_requests`
--

INSERT INTO `delete_account_requests` (`request_id`, `user_id`, `driver_id`, `reason_to_delete_account`, `feedback`, `status`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'I am no longer using the service', 'Overall good experience, but I don’t need the app anymore.', 'pending', 101, NULL, NULL, NULL, 1, '2025-09-04 10:43:31', '2025-09-04 10:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `driver_vehicle_number` varchar(50) DEFAULT NULL,
  `driver_licence_number` varchar(50) DEFAULT NULL,
  `driving_test` tinyint(1) DEFAULT NULL,
  `driving_test_verified` tinyint(1) DEFAULT NULL,
  `driving_test_verified_id` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `register_city` varchar(100) DEFAULT NULL,
  `current_latitude` decimal(10,6) DEFAULT NULL,
  `current_longitude` decimal(10,6) DEFAULT NULL,
  `register_latitude` decimal(10,6) DEFAULT NULL,
  `register_longitude` decimal(10,6) DEFAULT NULL,
  `total_trips` int(11) DEFAULT 0,
  `user_wallet_balance` decimal(10,2) DEFAULT 0.00,
  `active_status` tinyint(1) DEFAULT 1,
  `driving_licence` varchar(50) NOT NULL,
  `image_of_licence` text NOT NULL,
  `document_status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `document_verified_status` tinyint(1) NOT NULL DEFAULT 0,
  `document_upload_date` date NOT NULL DEFAULT current_timestamp(),
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `driver_name`, `vehicle_id`, `driver_vehicle_number`, `driver_licence_number`, `driving_test`, `driving_test_verified`, `driving_test_verified_id`, `email`, `phone_number`, `gender`, `date_of_birth`, `city`, `register_city`, `current_latitude`, `current_longitude`, `register_latitude`, `register_longitude`, `total_trips`, `user_wallet_balance`, `active_status`, `driving_licence`, `image_of_licence`, `document_status`, `document_verified_status`, `document_upload_date`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'Rajesh Patel', 2, 'GJ01AB1234', 'GJ-2020-567890', 1, 1, 'DT-VER-1001', 'rajesh.patel@example.com', '9876501234', 'male', '1988-05-15', 'Rajkot', 'Rajkot', 22.303894, 70.802162, 22.300000, 70.800000, 120, 2500.75, 1, '', '', 'pending', 0, '2025-09-04', 1, NULL, NULL, NULL, 1, '2025-09-04 08:53:24', '2025-09-04 08:53:24'),
(2, 'Ramesh Patel', 1, 'GJ01AB1234', 'GJ2025123456', 1, 1, 'DT12345', 'ramesh.patel@example.com', '9876543210', 'male', '1988-07-15', 'Rajkot', 'Ahmedabad', 22.303900, 70.802200, 23.022500, 72.571400, 120, 500.75, 127, '1', 'GJ2025123456', '', 0, '0000-00-00', 1, NULL, NULL, NULL, 1, '2025-09-04 09:23:47', '2025-09-04 09:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE `fare` (
  `fare_id` int(11) NOT NULL,
  `fare_type` varchar(50) NOT NULL,
  `fare_per_stop` decimal(10,2) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `fare_per_KM` decimal(10,2) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fare`
--

INSERT INTO `fare` (`fare_id`, `fare_type`, `fare_per_stop`, `base_fare`, `fare_per_KM`, `status`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'Standard', 10.00, 50.00, 8.50, 'Active', 1, '0000-00-00', 0, '0000-00-00', 0, '2025-09-03 10:47:47', '2025-09-03 10:47:47'),
(2, '2', 0.00, 0.00, 14.00, '', 150, '0000-00-00', 0, '0000-00-00', 0, '2025-09-03 11:40:37', '2025-09-03 11:40:37'),
(3, 'Summer Special Offer', 0.00, 20.00, 200.00, '', 2025, '0000-00-00', 0, '0000-00-00', 0, '2025-09-03 12:16:02', '2025-09-03 12:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `general_setting`
--

CREATE TABLE `general_setting` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `brand_logo` varchar(500) DEFAULT NULL,
  `favicon` varchar(500) DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_setting`
--

INSERT INTO `general_setting` (`id`, `client_name`, `support_email`, `brand_logo`, `favicon`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'TravelGo Pvt Ltd', 'support@travelgo.com', 'https://example.com/assets/logo.png', 'https://example.com/assets/favicon.ico', 101, NULL, NULL, NULL, 1, '2025-09-04 11:19:58', '2025-09-04 11:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `manager_setting`
--

CREATE TABLE `manager_setting` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `role` varchar(100) DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `deleteuid` int(11) DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `record_status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promotion_title` varchar(100) NOT NULL,
  `promo_type` varchar(50) NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `max_discount` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `max_allowed` int(11) NOT NULL,
  `per_user_limit` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `promo_code` varchar(50) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `promotion_title`, `promo_type`, `discount_value`, `max_discount`, `start_date`, `end_date`, `max_allowed`, `per_user_limit`, `status`, `promo_code`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `update_at`) VALUES
(1, 'Festival Offer', 'percentage', 20.00, 500.00, '2025-09-05', '2025-09-30', 1000, 2, 'Active', 'FEST2025', 1, '0000-00-00', 0, '0000-00-00', 0, '2025-09-04 06:21:37', '2025-09-04 06:21:37'),
(2, 'Amit Sharma', 'amit.sharma@example.com', 99999999.99, 1.00, '0000-00-00', '1995-08-20', 0, 0, '', '72.571365', 23, '2025-09-04', 0, '2025-09-04', 0, '2025-09-04 07:13:54', '2025-09-04 07:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `route_name` varchar(100) NOT NULL,
  `route_start_from` varchar(100) NOT NULL,
  `route_end_to` varchar(100) NOT NULL,
  `distance_KM` decimal(6,2) NOT NULL,
  `approx_time` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_name`, `route_start_from`, `route_end_to`, `distance_KM`, `approx_time`, `is_active`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `update_at`) VALUES
(1, 'Ahmedabad to Rajkot Express', 'Ahmedabad', 'Rajkot', 215.00, '4 hr 30 min', 1, 0, '2025-09-02', 0, '2025-09-02', 1, '2025-09-01 05:32:45', '2025-09-01 05:32:45'),
(2, 'Surat to Vadodara Express', 'Surat', 'Vadodara', 150.00, '3 hr 10 min', 1, 0, '2025-09-02', 0, '2025-09-02', 1, '2025-09-01 06:19:25', '2025-09-01 06:19:25'),
(3, 'Surat to Vadodara Express', 'Surat', 'Vadodara', 150.00, '3 hr 10 min', 1, 0, '2025-09-02', 0, '2025-09-02', 1, '2025-09-01 07:10:18', '2025-09-01 07:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `route_details`
--

CREATE TABLE `route_details` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `vehicles_id` int(11) NOT NULL,
  `stop_sequence` int(11) NOT NULL,
  `distance_from_start` decimal(6,2) NOT NULL,
  `approx_time_from_start` varchar(50) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stop_id` int(11) NOT NULL,
  `stop_name` varchar(100) NOT NULL,
  `wait_time` time NOT NULL,
  `reach_time` time NOT NULL,
  `is_minor` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `radius_in_meters` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `trip_name` varchar(100) NOT NULL,
  `route_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `custmore_phnoe` varchar(15) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `trip_booked_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `policy_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `trip_date_from` date NOT NULL,
  `trip_date_to` date NOT NULL,
  `trip_time_from` time NOT NULL,
  `trip_time_to` time NOT NULL,
  `trip_day` varchar(20) NOT NULL,
  `trip_fare` decimal(10,2) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`trip_id`, `trip_name`, `route_id`, `customer_id`, `driver_id`, `vehicle_id`, `custmore_phnoe`, `driver_phone`, `trip_booked_date`, `policy_id`, `promotion_id`, `trip_date_from`, `trip_date_to`, `trip_time_from`, `trip_time_to`, `trip_day`, `trip_fare`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `created_at`, `updated_at`) VALUES
(7, 'Rajkot to Ahmedabad Express', 1, 105, 205, 1, '9876543210', '9123456789', '2025-08-31 18:30:00', 1, 1, '2025-09-05', '2025-09-05', '06:00:00', '11:30:00', 'Friday', 1200.00, 1, '0000-00-00', 0, '0000-00-00', '2025-09-04 06:23:27', '2025-09-04 06:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `user_role`, `user_email`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated`) VALUES
(1, 'admin', 'admin@123', 'superadmin', 'admin12@gmail.com', 0, '2025-09-02', 0, '2025-09-02', 1, '2025-08-28 11:45:35', '2025-08-28 11:45:35'),
(2, 'yash', 'yash@12', 'admin', 'yash@gmail.com', 0, '2025-09-02', 0, '2025-09-02', 1, '2025-08-29 13:04:56', '2025-08-29 13:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicles_id` int(11) NOT NULL,
  `vehicles_type` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `vehicles_number` varchar(50) NOT NULL,
  `vehicles_register_date` date NOT NULL,
  `vehicles_condition` varchar(50) NOT NULL,
  `number_of_seats` int(11) NOT NULL,
  `number_of_doors` int(11) NOT NULL,
  `total_rows` int(11) NOT NULL,
  `total_columns` int(11) NOT NULL,
  `passenger_capacity` int(11) NOT NULL,
  `vehicle_image` text NOT NULL,
  `status` enum('Active','Inactive','UnderMaintenance','') NOT NULL DEFAULT 'Active',
  `adduid` int(11) NOT NULL,
  `adddate` date NOT NULL DEFAULT current_timestamp(),
  `deleteuid` int(11) NOT NULL,
  `deletedate` date NOT NULL DEFAULT current_timestamp(),
  `record_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicles_id`, `vehicles_type`, `brand`, `model_name`, `vehicles_number`, `vehicles_register_date`, `vehicles_condition`, `number_of_seats`, `number_of_doors`, `total_rows`, `total_columns`, `passenger_capacity`, `vehicle_image`, `status`, `adduid`, `adddate`, `deleteuid`, `deletedate`, `record_status`, `created_at`, `updated_at`) VALUES
(1, 'Bus', 'Tata Motors', 'Starbus 1623', 'GJ11Ab1234', '2023-05-20', 'Good', 45, 2, 9, 5, 45, 'bus.jpg', 'Active', 1, '2025-09-03', 0, '0000-00-00', 1, '2025-09-03 05:49:10', '2025-09-03 05:49:10'),
(2, 'Car', 'Toyota', 'Innova Crysta', 'GJ-05-XY-7890', '2023-03-20', 'Excellent', 7, 5, 3, 2, 7, 'innova.jpg', 'Active', 2, '0000-00-00', 0, '0000-00-00', 1, '2025-09-03 06:39:16', '2025-09-03 06:39:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`analytics_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `trip_id` (`trip_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD PRIMARY KEY (`policy_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `email_2` (`email`,`phone_number`);

--
-- Indexes for table `delete_account_requests`
--
ALTER TABLE `delete_account_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `fare`
--
ALTER TABLE `fare`
  ADD PRIMARY KEY (`fare_id`);

--
-- Indexes for table `general_setting`
--
ALTER TABLE `general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager_setting`
--
ALTER TABLE `manager_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD UNIQUE KEY `promo_code` (`promo_code`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `route_details`
--
ALTER TABLE `route_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `stop_id` (`stop_id`),
  ADD KEY `vehicles_id` (`vehicles_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `cencellation_policy_id` (`policy_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicles_id`),
  ADD UNIQUE KEY `vehicles_number` (`vehicles_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cancellation`
--
ALTER TABLE `cancellation`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delete_account_requests`
--
ALTER TABLE `delete_account_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fare`
--
ALTER TABLE `fare`
  MODIFY `fare_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `general_setting`
--
ALTER TABLE `general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manager_setting`
--
ALTER TABLE `manager_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `route_details`
--
ALTER TABLE `route_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `analytics`
--
ALTER TABLE `analytics`
  ADD CONSTRAINT `analytics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `analytics_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `analytics_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `analytics_ibfk_4` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `analytics_ibfk_5` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicles_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD CONSTRAINT `cancellation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delete_account_requests`
--
ALTER TABLE `delete_account_requests`
  ADD CONSTRAINT `delete_account_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `delete_account_requests_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);

--
-- Constraints for table `route_details`
--
ALTER TABLE `route_details`
  ADD CONSTRAINT `route_details_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `route_details_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`stop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `route_details_ibfk_3` FOREIGN KEY (`vehicles_id`) REFERENCES `vehicles` (`vehicles_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `cancellation` (`policy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_4` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
