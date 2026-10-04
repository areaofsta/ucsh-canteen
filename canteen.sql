-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306:3306
-- Generation Time: Oct 04, 2026 at 02:23 PM
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
-- Database: `canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcementId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcementId`, `title`, `content`, `createdAt`, `updated_at`) VALUES
(8, 'Special Menu', 'ယနေ့\r\nမာလာရှမ်းကော ၊\r\nကြက်ခြေထောက်ဂျူးမြစ်\r\nရသည်။', '2026-07-30 16:55:23', '2026-07-31 14:26:04'),
(13, 'Special Menu', 'Green Tea ရပြီ', '2026-08-29 08:46:51', NULL),
(16, 'Special Menu', 'ယနေ့အတွက် မာလာဘဲစပ် ရပြီ', '2026-08-31 13:36:55', NULL),
(17, 'hi', 'hi', '2026-10-03 17:51:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_locations`
--

CREATE TABLE `delivery_locations` (
  `id` int(11) NOT NULL,
  `locationName` varchar(255) NOT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `deliveryFee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_locations`
--

INSERT INTO `delivery_locations` (`id`, `locationName`, `latitude`, `longitude`, `deliveryFee`) VALUES
(8, 'ပင်မစာသင်ဆောင်', 16.836874, 97.596156, 500),
(9, 'ပင်မစာသင်ဆောင် (Lobby)', 16.836874, 97.596156, 800),
(10, 'ကျောင်းသားဆောင် (H1) ဆောင်', 16.837771, 97.599861, 1200),
(11, 'ဆရာ၊ဆရာမ အိမ်ရာ (B1) ဆောင်', 16.837603, 97.599519, 1200),
(12, 'ဆရာ၊ဆရာမ အိမ်ရာ (B2) ဆောင်', 16.838378, 97.598966, 1000),
(13, 'ကျောင်းသူဆောင် (H2) ဆောင်', 16.838183, 97.599650, 1000),
(14, 'ကျောင်းသူဆောင် (160) ဆောင်', 16.838698, 97.599426, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `liked_items`
--

CREATE TABLE `liked_items` (
  `likeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked_items`
--

INSERT INTO `liked_items` (`likeId`, `userId`, `itemId`, `createdAt`) VALUES
(59, 38, 47, '2026-09-05 12:00:31'),
(60, 38, 48, '2026-09-05 12:00:32'),
(61, 38, 46, '2026-10-03 16:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(150) NOT NULL,
  `category` varchar(50) DEFAULT 'Food',
  `points` int(11) NOT NULL,
  `special_note` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`itemId`, `itemName`, `category`, `points`, `special_note`, `image`, `isAvailable`, `createdAt`, `view_count`) VALUES
(5, 'ကရင်မုန့်ဟင်းခါး', 'Food', 2000, 'ပဲကြော် ၊ ဘူးသီးကြော်', 'uploads/1785415745_images.jpg', 1, '2026-07-30 12:49:05', 0),
(6, 'ထမင်းကြော်', 'Food', 1500, 'မွှေကြော် ၊ half fried', 'uploads/1785415894_images (1).jpg', 1, '2026-07-30 12:51:04', 0),
(7, 'ခေါက်ဆွဲကြော်', 'Food', 2000, 'ကြက် ၊ ဝက်', 'uploads/1785417284_images (2).jpg', 1, '2026-07-30 13:14:44', 0),
(8, 'ကြက်ဆီထမင်း', 'Food', 5500, 'ကြက်ကြော် ၊ ကြက်ကင်', 'uploads/1785430588_download.jpg', 1, '2026-07-30 16:56:28', 0),
(9, 'မြန်မာမုန့်ဟင်းခါး', 'Food', 2000, 'ပဲကြော် ၊ ဘူးသီးကြော်', 'uploads/1785504074_monthinghar.jpg', 1, '2026-07-31 13:21:14', 0),
(10, 'ကွေ့တီယို(အပြုတ်)', 'Food', 2500, 'ကြက် ၊ ဝက်', 'uploads/1785504121_ကွေ့.jpg', 1, '2026-07-31 13:22:01', 0),
(11, 'ကွေ့တီယို(အသုတ်)', 'Food', 2500, 'ကြက် ၊ ဝက်', 'uploads/1785504143_ကွေ့သုတ်.jpg', 1, '2026-07-31 13:22:23', 0),
(12, 'နန်းကြီးသုတ်', 'Food', 2500, '', 'uploads/1785504163_နန်းကြီးသုတ်.jpg', 1, '2026-07-31 13:22:43', 0),
(13, 'ကြာဇံကြော်', 'Food', 2000, 'ကြက် ၊ ဝက်', 'uploads/1785504236_ကြာဇံကြော်.jpg', 1, '2026-07-31 13:23:56', 0),
(14, 'ပဲပလာတာ', 'Snack', 1500, '', 'uploads/1785504252_ပဲ.jpg', 1, '2026-07-31 13:24:12', 0),
(15, 'တိုရှည်', 'Snack', 2000, 'ရိုးရိုး ၂ ချပ် ၊ ကြက်ဉဖြင့် ၁ ချပ်', 'uploads/1785504300_တိုရှည်.jpg', 1, '2026-07-31 13:25:00', 0),
(16, 'အာလူးပူတီ', 'Snack', 2000, '', 'uploads/1785504322_ပူ.jpg', 1, '2026-07-31 13:25:22', 0),
(17, 'ဆိုင်ဖျော်လက်ဖက်ရည်', 'Drink', 1200, 'ပုံမှန် ၊ ချိုဆိမ့် ၊ ကျဆိမ့်', 'uploads/1785504363_လက်.jpg', 1, '2026-07-31 13:26:03', 0),
(18, 'ရှမ်းခေါက်ဆွဲ', 'Food', 2000, '', 'uploads/1785505386_ရှမ်းခေါက်ဆွဲ.jpg', 1, '2026-07-31 13:43:06', 0),
(19, 'ခေါက်ဆွဲပြုတ်', 'Food', 2000, 'ကြက် ၊ ဝက် ၊ ကြက်ဉ', 'uploads/1785505421_ခေါက်ဆွဲပြုတ်.jpg', 1, '2026-07-31 13:43:41', 0),
(20, 'ပေါင်မုန့်ကြက်ဉကြော်', 'Snack', 1500, '', 'uploads/1785505444_ပေါင်မုန့်ကြက်ဥ.jpg', 1, '2026-07-31 13:44:04', 0),
(21, 'မာလာရှမ်းကော', 'Food', 15000, 'ကြက် ၊ ဝက် ၊ ပင်လယ်စာ ( အထုံ ၊ အစပ် ကြိုပြောပေးပါ )', 'uploads/1785505519_မာလာရှမ်းကော.jpg', 1, '2026-07-31 13:45:19', 0),
(22, 'မာလာဟင်း', 'Food', 10000, 'ကြက် ၊ ဝက် ၊ ပင်လယ်စာ', 'uploads/1785505587_မာလာဟင်း.jpg', 1, '2026-07-31 13:46:27', 0),
(23, 'စမူဆာ', 'Snack', 1000, '၃ ခု ပါဝင်မည်', 'uploads/1785505618_ဆမူဆာ.jpg', 1, '2026-07-31 13:46:58', 0),
(24, 'သီးစုံကော်ပြန့်ကြော်', 'Snack', 1000, '၂ ခုပါဝင်မည်', 'uploads/1785505656_ကော်ပြန့်(အရွက်).jpg', 1, '2026-07-31 13:47:36', 0),
(25, 'ဖရဲသီးဖျော်ရည်', 'Drink', 2000, '', 'uploads/1785506601_ဖရဲသီးဖျော်ရည်.jpg', 1, '2026-07-31 14:03:21', 0),
(26, 'သရက်သီးဖျော်ရည်', 'Food', 2000, '', 'uploads/1785507144_သရက်သီး.jpg', 1, '2026-07-31 14:12:24', 0),
(27, 'ထောပတ်သီးဖျော်ရည်', 'Food', 2000, 'လက်ဖျော် ၊ စက်ဖျော်', 'uploads/1785507167_ထောပတ်.jpg', 1, '2026-07-31 14:12:47', 0),
(28, 'နာနတ်သီးဖျော်ရည်', 'Food', 2000, '', 'uploads/1785507186_နာနတ်.jpg', 1, '2026-07-31 14:13:06', 0),
(29, 'စတော်ဘယ်ရီသီးဖျော်ရည်', 'Drink', 2000, 'လက်ဖျော် ၊ စက်ဖျော်', 'uploads/1785507208_စတော်.jpg', 1, '2026-07-31 14:13:28', 0),
(30, 'သံပုရာသီးဖျော်ရည်', 'Drink', 2000, '', 'uploads/1785507239_သံ.jpg', 1, '2026-07-31 14:13:59', 0),
(31, 'Bubble Tea', 'Drink', 2000, 'Bubble ထည့် ၊ မထည့်', 'uploads/1785507273_thaitea.jpg', 1, '2026-07-31 14:14:33', 0),
(33, 'Ice Coffee', 'Drink', 2000, '', 'uploads/1785507309_ice.webp', 1, '2026-07-31 14:15:09', 0),
(34, 'ကြက်ကြော်', 'Food', 2500, '', 'uploads/1785507328_ကြက်ကြော်.jpg', 1, '2026-07-31 14:15:28', 0),
(35, 'ကြက်ခြေထောက်ဂျူးမြစ်', 'Food', 3000, '', 'uploads/1785507366_ကြက်ခြေထောက်.jpg', 1, '2026-07-31 14:16:06', 0),
(36, 'ထမင်းဖြူ', 'Food', 500, '', 'uploads/1785507438_ထမင်းဖြူ.jpeg', 1, '2026-07-31 14:17:18', 0),
(37, 'ငပိရည်တို့စရာ', 'Food', 1500, 'ပုံပါအတိုင်းပါဝင်မည် ။ မကြိုက်သည်များရှိပါက လဲလှယ် နိုင်သည်။', 'uploads/1785507577_ငပိရည်တို့စရာ.jpg', 1, '2026-07-31 14:19:37', 0),
(38, 'ထမင်းဖြူ + ဘဲဉ + အရွက်ကြော်', 'Food', 3500, '၎င်း set မှာပါက ငပိရည် တို့စရာ မှာ free ဖြစ်သည်။', 'uploads/1785507775_ဉ\'.webp', 1, '2026-07-31 14:22:55', 0),
(39, 'ထမင်းဖြူ + ဝက်သား', 'Food', 3500, '၎င်း set မှာပါက ငပိရည် တို့စရာ မှာ free ဖြစ်သည်။', 'uploads/1785507798_ဝက်.webp', 1, '2026-07-31 14:23:18', 0),
(40, 'ထမင်းဖြူ + ကြက်သား', 'Food', 3500, '၎င်း set မှာပါက ငပိရည် တို့စရာ မှာ free ဖြစ်သည်။', 'uploads/1785507812_ကြက်.webp', 1, '2026-07-31 14:23:32', 0),
(41, 'ထမင်းဖြူ + ငါးဆုပ်', 'Food', 3500, '၎င်း set မှာပါက ငပိရည် တို့စရာ မှာ free ဖြစ်သည်။', 'uploads/1785507852_ငါး.webp', 1, '2026-07-31 14:24:12', 0),
(44, 'ဒံပေါက်', 'Food', 5500, 'ကြက်သား သာ ရပါသည်', 'uploads/1786621694_6a7daefe79c0c.jpg', 1, '2026-08-13 11:48:14', 0),
(45, 'ဖက်ထုတ်ဆီချက်', 'Food', 3000, 'ကြက်သား ၊ ဝက်သား', 'uploads/1787678492_6a8dcf1c6c963.jpg', 1, '2026-08-25 17:21:32', 0),
(46, 'အာလူးမာလာ', 'Snack', 2500, 'အထုံ အစပ် ရွေးနိုင်သည်', 'uploads/1787715901_6a8e613ddb0c8.jpg', 1, '2026-08-26 03:45:01', 0),
(47, 'Thai Green Tea', 'Drink', 2500, '', 'uploads/1787993177_6a929c5973d59.jpg', 1, '2026-08-29 08:46:17', 0),
(48, 'မာလာဘဲစပ်', 'Food', 5000, 'ကြက် ၊ ဝက်', 'uploads/1788183384_6a958358007cc.jpg', 1, '2026-08-31 13:36:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_likes`
--

CREATE TABLE `menu_likes` (
  `likeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `queue_number` varchar(20) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `serviceType` varchar(50) DEFAULT NULL,
  `pickupTime` varchar(50) NOT NULL,
  `specialRequest` text DEFAULT NULL,
  `trackingStatus` enum('Pending','Confirmed','Cooking','PickUp','Completed','Rejected') DEFAULT 'Pending',
  `totalAmount` int(11) NOT NULL,
  `points_used` int(11) NOT NULL DEFAULT 0,
  `voucherSent` tinyint(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `orderType` enum('dine_in','pickup','delivery') DEFAULT 'dine_in',
  `status` enum('ordered','cooking','pickup','completed','rejected','partial_rejected') DEFAULT 'ordered',
  `rejectionReason` text DEFAULT NULL,
  `rejected_items` text DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deliveryAddress` varchar(255) DEFAULT NULL,
  `deliveryFee` int(11) DEFAULT 0,
  `deliveryLat` decimal(10,7) DEFAULT NULL,
  `deliveryLng` decimal(10,7) DEFAULT NULL,
  `deliveryStatus` enum('pending','preparing','on_the_way','delivered') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `queue_number`, `qr_code`, `userId`, `serviceType`, `pickupTime`, `specialRequest`, `trackingStatus`, `totalAmount`, `points_used`, `voucherSent`, `createdAt`, `orderType`, `status`, `rejectionReason`, `rejected_items`, `updatedAt`, `deliveryAddress`, `deliveryFee`, `deliveryLat`, `deliveryLng`, `deliveryStatus`) VALUES
(1, 'Q155', NULL, 38, NULL, '08:00 AM', '', 'Pending', 7500, 7500, 0, '2026-10-03 17:47:33', 'delivery', 'ordered', NULL, NULL, '2026-10-03 17:47:33', 'ကျောင်းသူဆောင် (160) ဆောင်', 1000, 16.8386980, 97.5994260, 'preparing'),
(2, 'Q284', NULL, 38, NULL, '08:00 AM', '', 'Pending', 3000, 0, 0, '2026-10-03 17:48:01', 'dine_in', 'rejected', 'ပစ္စည်းကုန်သွားသောကြောင့် မှာယူ၍မရတော့ပါ', '45', '2026-10-03 17:50:41', NULL, 0, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orderItemId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`orderItemId`, `orderId`, `itemId`, `quantity`, `price`) VALUES
(1, 1, 47, 1, 2500.00),
(2, 1, 40, 1, 3500.00),
(3, 1, 36, 1, 500.00),
(4, 2, 45, 1, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Customer') DEFAULT 'Customer',
  `customerType` enum('Guest','Logged') DEFAULT 'Logged',
  `points` int(11) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `phoneNumber`, `password`, `role`, `customerType`, `points`, `createdAt`) VALUES
(1, 'admin', '0943114525', '$2y$10$T8k1E1l8zX1X1P8U1o4eNe5uP2F.E7i1L3c2O3d4E5F6G7H8I9J0K', 'Admin', 'Logged', 0, '2026-07-25 05:37:11'),
(20, 'Wan Wan', '09796436800', '$2y$10$pyBccin3uM9LALf25UF6SuJR0.9ZJxEgw14MMpEznJ9SMaEf.bOpW', 'Customer', 'Logged', 0, '2026-08-24 05:06:36'),
(38, 'Shin Thant Aung', '09254017994', '$2y$10$NMXMrobHu7LclYwfJm/PnOMXc/q.tuXXrnhdv4jaPnpi.7a9cFQR.', 'Customer', 'Logged', 41730, '2026-09-05 11:59:07'),
(39, 'STA', '0931314408', '$2y$10$tGQYeJggp3bZhzgkpfYBUeNZotXY/nO6ZRQm0XxxrOzZ0YsftITyG', 'Customer', 'Logged', 1000, '2026-10-02 11:16:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcementId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `delivery_locations`
--
ALTER TABLE `delivery_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liked_items`
--
ALTER TABLE `liked_items`
  ADD PRIMARY KEY (`likeId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `menu_likes`
--
ALTER TABLE `menu_likes`
  ADD PRIMARY KEY (`likeId`),
  ADD UNIQUE KEY `user_item_unique` (`userId`,`itemId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `idx_qr_code` (`qr_code`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`orderItemId`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratingId`),
  ADD UNIQUE KEY `unique_user_order_item` (`userId`,`orderId`,`itemId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `phoneNumber` (`phoneNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_locations`
--
ALTER TABLE `delivery_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `liked_items`
--
ALTER TABLE `liked_items`
  MODIFY `likeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `menu_likes`
--
ALTER TABLE `menu_likes`
  MODIFY `likeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `orderItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `menu_items` (`itemId`) ON DELETE CASCADE;

--
-- Constraints for table `liked_items`
--
ALTER TABLE `liked_items`
  ADD CONSTRAINT `liked_items_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `liked_items_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `menu_items` (`itemId`) ON DELETE CASCADE;

--
-- Constraints for table `menu_likes`
--
ALTER TABLE `menu_likes`
  ADD CONSTRAINT `menu_likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_likes_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `menu_items` (`itemId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
