-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 01:42 PM
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
-- Database: `ecom_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--
CREATE DATABASE ecom_db;s

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(2, 'suman', '09b38f76b8c87c25d7778ee59dc5305aedc1b584'),
(3, 'puskar', '09b38f76b8c87c25d7778ee59dc5305aedc1b584');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 1, 'suman', 'abcd@gmail.com', '9863024753', 'hello'),
(2, 0, 'suman', 'abcd@gmail.com', '9863024753', 'heyy whatsup?\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `placed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `method` varchar(50) NOT NULL,
  `total_products` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `placed_on`, `name`, `email`, `number`, `address`, `method`, `total_products`, `total_price`, `payment_status`) VALUES
(1, 1, '2024-05-11 09:27:06', 'suman', 'abcd@gmail.com', '9863024753', 'flat no. 101, dadhikot, Bhaktapur, Bagmati, Nepal - 44600', 'paypal', 0, 100000.00, 'completed'),
(2, 1, '2024-05-11 16:06:31', 'suman', 'abcd@gmail.com', '9863024753', 'flat no. 101, dadhikot, Bhaktapur, Bagmati, Nepal - 44600', 'cash on delivery', 0, 1237231.00, 'completed'),
(3, 1, '2024-05-22 15:00:52', 'suman', 'abcd@gmail.com', '9863024753', 'flat no. 101, dadhikot, Bhaktapur, Bagmati, Nepal - 44600', 'paypal', 0, 100000.00, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `details` text NOT NULL,
  `image_01` varchar(255) NOT NULL,
  `image_02` varchar(255) NOT NULL,
  `image_03` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `details`, `image_01`, `image_02`, `image_03`, `category`) VALUES
(10, 'Iphone  15 Pro Max', 233500.00, 'Color: Black Titanium\r\n\r\nRAM 8GB\r\nStorage capacity 256B                                     ', 'iphone 15 3.jpg', 'iphone 15 2.jpg', 'iphone 15.jpg', 'smartphone'),
(11, 'Apple MacBook Air 13-inch M1', 140000.00, 'Color Family: Space Grey\r\n8GB unified memory\r\n256GB SSD storage\r\nRetina display with True Tone\r\n', 'macbook.jpg', 'macbook 2.jpg', 'macbook3.png', 'laptop'),
(12, 'Acer Nitro 5 Ryzen 7 5800H', 125000.00, 'Acer Nitro 5 Ryzen 7 5800H 16GB Ram 512GB SSD GTX 1650 144hz RGB', 'nitro.jpg', 'nitro2.jpg', 'nitro3.jpg', 'laptop'),
(13, 'C6 Dome Lion ', 11000.00, 'C6 Dome Lion Mech Wired USB Gaming Mice Gaming Chicken Mechanical Macro Programming Mice\r\nColor Family: C6 mecha black hardware grand color box', 'Dome Mouse.png', 'Dome Mouse 2.png', 'Dome Mouse 3.png', 'mouse'),
(14, 'Canon EOS 60D SLR Camera', 87490.00, 'Brand	Canon\r\nType	SLR\r\nColor	Black\r\nModel ID	EOS 60D\r\nWeight	675 g (Body Only), 755 g (CIPA Guidelines)\r\nDimensions	144.5 (W) x 105.8 (H) X 78.6 (D) mm', 'Canon1.jpg', 'Canon2.jpg', 'Canon3.jpg', 'camera');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'suman', 'abcd@gmail.com', '09b38f76b8c87c25d7778ee59dc5305aedc1b584'),
(2, 'khatri', 'for@gmail.com', '09b38f76b8c87c25d7778ee59dc5305aedc1b584');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wishlist_user` (`user_id`),
  ADD KEY `fk_wishlist_product` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`pid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
