-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 09:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_Name` varchar(25) NOT NULL,
  `Admin_Email` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `BankID` int(11) NOT NULL,
  `bankAddress` varchar(50) NOT NULL,
  `BankName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_name` varchar(100) NOT NULL,
  `Admin_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE `clothes` (
  `Clothe_ID` int(11) NOT NULL,
  `ClotheColor` varchar(25) NOT NULL,
  `ClotheName` varchar(25) NOT NULL,
  `ClotheType` varchar(25) NOT NULL,
  `ClothePrice` int(11) NOT NULL,
  `ClotheDescription` varchar(25) NOT NULL,
  `ClotheImage` varchar(255) NOT NULL,
  `ClotheQuantity` int(11) NOT NULL,
  `Category_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clothesdiscount`
--

CREATE TABLE `clothesdiscount` (
  `Discount_ID` int(11) NOT NULL,
  `Discount_Code` varchar(50) NOT NULL,
  `Discount_percentage` decimal(10,0) NOT NULL,
  `Expire_Date` date NOT NULL,
  `Clothe_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `corder`
--

CREATE TABLE `corder` (
  `Order_ID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShippingDate` date NOT NULL,
  `OrderedClotheQuantity` int(11) NOT NULL,
  `OrderPrice` int(11) NOT NULL,
  `PriceAfterDiscount` int(11) NOT NULL,
  `Clothe_ID_FK` int(11) DEFAULT NULL,
  `User_ID_FK` int(11) DEFAULT NULL,
  `Discount_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE `creditcard` (
  `CardNumber` int(11) NOT NULL,
  `HolderName` varchar(50) NOT NULL,
  `CVV` int(11) NOT NULL,
  `CardExpiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_ID` int(11) NOT NULL,
  `amountBilled` int(11) NOT NULL,
  `InvoiceDate` date NOT NULL,
  `Bank_ID_FK` int(11) DEFAULT NULL,
  `Order_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `PaymentType` varchar(25) NOT NULL,
  `PaymentAmount` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `Order_ID_FK` int(11) DEFAULT NULL,
  `Card_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `Cart_ID` int(11) NOT NULL,
  `CartPrice` int(11) NOT NULL,
  `Clothe_ID_FK` int(11) DEFAULT NULL,
  `User_ID_FK` int(11) DEFAULT NULL,
  `Order_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signUpDate` datetime NOT NULL DEFAULT current_timestamp(),
  `isSubscribed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `email`, `password`, `signUpDate`, `isSubscribed`) VALUES
(1, 'Test', 'Testa', 'testo', 'random@yahoo.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '2023-05-06 15:41:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Warehouse_ID` int(11) NOT NULL,
  `cLocation` varchar(75) NOT NULL,
  `WarehouseName` varchar(75) NOT NULL,
  `Clothe_ID_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`BankID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Admin_ID_FK` (`Admin_ID_FK`);

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`Clothe_ID`),
  ADD KEY `Category_ID_FK` (`Category_ID_FK`);

--
-- Indexes for table `clothesdiscount`
--
ALTER TABLE `clothesdiscount`
  ADD PRIMARY KEY (`Discount_ID`),
  ADD KEY `Clothe_ID_FK` (`Clothe_ID_FK`);

--
-- Indexes for table `corder`
--
ALTER TABLE `corder`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Clothe_ID_FK` (`Clothe_ID_FK`),
  ADD KEY `User_ID_FK` (`User_ID_FK`),
  ADD KEY `Discount_ID_FK` (`Discount_ID_FK`);

--
-- Indexes for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`CardNumber`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `Bank_ID_FK` (`Bank_ID_FK`),
  ADD KEY `Order_ID_FK` (`Order_ID_FK`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Order_ID_FK` (`Order_ID_FK`),
  ADD KEY `Card_ID_FK` (`Card_ID_FK`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `Clothe_ID_FK` (`Clothe_ID_FK`),
  ADD KEY `User_ID_FK` (`User_ID_FK`),
  ADD KEY `Order_ID_FK` (`Order_ID_FK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Warehouse_ID`),
  ADD KEY `Clothe_ID_FK` (`Clothe_ID_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Admin_ID_FK`) REFERENCES `admin` (`Admin_ID`);

--
-- Constraints for table `clothes`
--
ALTER TABLE `clothes`
  ADD CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`Category_ID_FK`) REFERENCES `category` (`Category_ID`);

--
-- Constraints for table `clothesdiscount`
--
ALTER TABLE `clothesdiscount`
  ADD CONSTRAINT `clothesdiscount_ibfk_1` FOREIGN KEY (`Clothe_ID_FK`) REFERENCES `clothes` (`Clothe_ID`);

--
-- Constraints for table `corder`
--
ALTER TABLE `corder`
  ADD CONSTRAINT `corder_ibfk_1` FOREIGN KEY (`Clothe_ID_FK`) REFERENCES `clothes` (`Clothe_ID`),
  ADD CONSTRAINT `corder_ibfk_2` FOREIGN KEY (`User_ID_FK`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `corder_ibfk_3` FOREIGN KEY (`Discount_ID_FK`) REFERENCES `clothesdiscount` (`Discount_ID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Bank_ID_FK`) REFERENCES `bank` (`BankID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`Order_ID_FK`) REFERENCES `corder` (`Order_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID_FK`) REFERENCES `corder` (`Order_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Card_ID_FK`) REFERENCES `creditcard` (`CardNumber`);

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`Clothe_ID_FK`) REFERENCES `clothes` (`Clothe_ID`),
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`User_ID_FK`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shoppingcart_ibfk_3` FOREIGN KEY (`Order_ID_FK`) REFERENCES `corder` (`Order_ID`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`Clothe_ID_FK`) REFERENCES `clothes` (`Clothe_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
