-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2026 at 11:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modcomelvis`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(50) NOT NULL,
  `emp_name` text DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` int(50) DEFAULT NULL,
  `dept_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_name`, `hire_date`, `salary`, `dept_id`) VALUES
(1, 'Peter Wilson', '1996-06-15', 40000, 1),
(3, 'Mary', '2022-06-20', 50000, 2),
(4, 'John Kamau', '2018-03-12', 45000, 1),
(5, 'Grace Achieng', '2019-07-25', 55000, 3),
(6, 'David Kiptoo', '2021-01-10', 38000, 2),
(7, 'Jane Njeri', '2017-11-05', 62000, 4),
(8, 'Samuel Otieno', '2022-04-18', 35000, 3),
(9, 'Faith Chebet', '2016-09-30', 70000, 4),
(10, 'Brian Mutua', '2023-02-22', 32000, 2),
(11, 'Mercy Wairimu', '2015-08-22', 80000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE `laptops` (
  `laptop_id` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `processor` varchar(50) DEFAULT NULL,
  `ram_gb` int(11) DEFAULT NULL,
  `storage_gb` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`laptop_id`, `brand`, `model`, `processor`, `ram_gb`, `storage_gb`, `price`) VALUES
(1, 'Lenovo', 'ThinkPad X1 Carbon', 'Intel Core i7', 16, 512, 162000.00),
(2, 'Dell', 'XPS 15', 'Intel Core i7', 16, 512, 95000.00),
(3, 'HP', 'Elitebook', 'Intel Core i7', 16, 512, 65000.00),
(4, 'Asus', 'ZenBook 14', 'AMD Ryzen 7 pro', 16, 512, 132000.00),
(5, 'HP', '845 G7', 'Intel Core i5', 8, 256, 145000.00),
(6, 'Apple', 'MacBook Air M2', 'Apple M2', 8, 256, 168000.00),
(7, 'Toshiba', 'Dynabook', 'Intel Core i5', 8, 512, 98000.00),
(8, 'Lenovo', 'Yoga 370', 'intel core i5', 8, 512, 29000.00),
(9, 'Dell', 'XPS 13', 'Intel Core i5', 8, 512, 82000.00),
(10, 'Apple', 'MacBook Pro 14', 'Apple M3 Pro', 16, 512, 285000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `price`, `quantity`) VALUES
(1, 'laptop', 'Electronics', 65000.00, 15),
(2, 'Smartphone', 'Electronics', 25000.00, 30),
(3, 'Printer', 'Electronics', 18000.00, 10),
(4, 'Office chair', 'Furniture', 8500.00, 20),
(5, 'Desk', 'Furniture', 12000.00, 12),
(6, 'Notebook', 'Stationery', 100.00, 200),
(7, 'Pen', 'Stationery', 20.00, 500),
(8, 'Monitor', 'Electronics', 15000.00, 18),
(9, 'Keyboard', 'Electronics', 2500.00, 40),
(10, 'Mouse', 'Electronics', 1200.00, 50);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_cost` int(50) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  `product_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendor_id` int(50) NOT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor_name`, `phone_number`, `email`, `city`) VALUES
(1, 'ABC suppliers', '0701002270', 'abc@gmail.com', 'Nairobi'),
(2, 'Czar motors', '0748963445', 'czar@gmail.com', 'Kiambu'),
(3, 'EK Autospares', '0723334654', 'ek@gmail.com', 'Mombasa'),
(4, 'shell X-spares', '0723673883', 'shell3@gmail.com', 'Nakuru'),
(5, 'Hspark bottlers', '0713456234', 'spark@gmail.com', 'Naivasha'),
(6, 'Rai cement', '0200677222', 'raicement@gmail.com', 'Kisumu'),
(7, 'Fahari Tea', '0100234234', 'faharitea@gmail.com', 'Kericho'),
(8, 'Parkmatt', '0700555777', 'parkmatt@gmail.com', 'Eldoret'),
(9, 'Leshan Clothing', '0723445678', 'leshanclothing@gmail.com', 'Machakos'),
(10, 'Marines distributers', '0723445667', 'marines@gmail.com', 'Eldoret');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`laptop_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `laptops`
--
ALTER TABLE `laptops`
  MODIFY `laptop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
