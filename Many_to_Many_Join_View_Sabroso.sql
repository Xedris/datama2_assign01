-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2019 at 11:19 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id11338219_dbm2`
--

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `id` int(11) NOT NULL,
  `position` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`id`, `position`, `lname`, `fname`, `product_id`) VALUES
(1, 'head chef', 'Bernardo', 'Herrick', 1),
(2, 'sous chef', 'Jeremy', 'Carmack', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_customer`
--

CREATE TABLE `online_customer` (
  `id` int(11) NOT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `online_customer`
--

INSERT INTO `online_customer` (`id`, `fname`, `lname`, `dob`) VALUES
(1, 'Ramsay', 'Karena', '1998-07-09'),
(2, 'Carney', 'Daniele', '1990-10-04'),
(3, 'Bryce', 'Harper', '1985-10-02'),
(4, 'Jose', 'Altuve', '1988-04-08'),
(5, 'Trae', 'Young', '1999-09-03'),
(6, 'Jaren', 'Jackson', '1997-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `onsite_customer`
--

CREATE TABLE `onsite_customer` (
  `id` int(11) NOT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `onsite_customer`
--

INSERT INTO `onsite_customer` (`id`, `fname`, `lname`, `dob`) VALUES
(1, 'Tom', 'Tomson', '2019-10-17'),
(2, 'Jean', 'Garisson', '2018-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `onsite_customer_id` int(11) NOT NULL,
  `online_customer_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `chef_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `menu_name`, `amount`, `date`, `onsite_customer_id`, `online_customer_id`, `chef_id`, `chef_product_id`) VALUES
(1, 'pancake', 280, NULL, 2, 4, 1, 1),
(2, 'shake', 190, NULL, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `Type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `prod_num_items` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `Type`, `date`, `date_expire`, `prod_num_items`, `supplier_id`) VALUES
(1, 'perishable', '2019-10-17', '2019-10-11', 23, 2),
(2, 'perishable', '2019-10-31', '2020-02-13', 522, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `loc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employed_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `loc`, `employed_num`) VALUES
(1, 'Chambersburg City', 32),
(2, 'Jefferson City', 32);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Restaurant_and_Supplier`
-- (See below for the actual view)
--
CREATE TABLE `Restaurant_and_Supplier` (
`id` int(11)
,`name` varchar(45)
,`address` varchar(45)
,`loc` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_has_supplier`
--

CREATE TABLE `restaurant_has_supplier` (
  `id` int(11) NOT NULL,
  `contract_date` date DEFAULT NULL,
  `restaurant_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_has_supplier`
--

INSERT INTO `restaurant_has_supplier` (`id`, `contract_date`, `restaurant_id`, `supplier_id`) VALUES
(1, '2019-10-09', 1, 2),
(2, '2019-10-24', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `contact`, `address`) VALUES
(1, 'meat.ly', 922222, '1019  Cambridge Court'),
(2, 'Foodure', 71763487, '1335  Lincoln Drive');

-- --------------------------------------------------------

--
-- Structure for view `Restaurant_and_Supplier`
--
DROP TABLE IF EXISTS `Restaurant_and_Supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id11338219_dbm2`@`%` SQL SECURITY DEFINER VIEW `Restaurant_and_Supplier`  AS  select `supplier`.`id` AS `id`,`supplier`.`name` AS `name`,`supplier`.`address` AS `address`,`restaurant`.`loc` AS `loc` from ((`restaurant_has_supplier` join `supplier` on(`restaurant_has_supplier`.`supplier_id` = `supplier`.`id`)) join `restaurant` on(`restaurant_has_supplier`.`restaurant_id` = `restaurant`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`id`,`product_id`),
  ADD KEY `fk_chef_product1_idx` (`product_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`,`restaurant_id`),
  ADD KEY `fk_employee_restaurant1_idx` (`restaurant_id`);

--
-- Indexes for table `online_customer`
--
ALTER TABLE `online_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onsite_customer`
--
ALTER TABLE `onsite_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`,`onsite_customer_id`,`online_customer_id`,`chef_id`,`chef_product_id`),
  ADD KEY `fk_Orders_onsite_customer1_idx` (`onsite_customer_id`),
  ADD KEY `fk_Orders_online_customer1_idx` (`online_customer_id`),
  ADD KEY `fk_Orders_chef1_idx` (`chef_id`,`chef_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`,`supplier_id`),
  ADD KEY `fk_product_supplier1_idx` (`supplier_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_has_supplier`
--
ALTER TABLE `restaurant_has_supplier`
  ADD PRIMARY KEY (`id`,`restaurant_id`,`supplier_id`),
  ADD KEY `fk_restaurant_has_supplier_restaurant1_idx` (`restaurant_id`),
  ADD KEY `fk_restaurant_has_supplier_supplier1_idx` (`supplier_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chef`
--
ALTER TABLE `chef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `online_customer`
--
ALTER TABLE `online_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `onsite_customer`
--
ALTER TABLE `onsite_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_has_supplier`
--
ALTER TABLE `restaurant_has_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `fk_chef_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `fk_Orders_chef1` FOREIGN KEY (`chef_id`,`chef_product_id`) REFERENCES `chef` (`id`, `product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_online_customer1` FOREIGN KEY (`online_customer_id`) REFERENCES `online_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_onsite_customer1` FOREIGN KEY (`onsite_customer_id`) REFERENCES `onsite_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_has_supplier`
--
ALTER TABLE `restaurant_has_supplier`
  ADD CONSTRAINT `fk_restaurant_has_supplier_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_restaurant_has_supplier_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
