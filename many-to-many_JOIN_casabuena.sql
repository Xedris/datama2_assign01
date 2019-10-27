-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2019 at 02:01 PM
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
  `onsite_order_id` int(11) NOT NULL,
  `onsite_order_onsite_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`id`, `position`, `lname`, `fname`, `onsite_order_id`, `onsite_order_onsite_customer_id`) VALUES
(1, 'Head chef', 'Krakousky', 'Lyanna', 1, 1),
(3, 'Sous Chef', 'Florence', 'Nightingale', 2, 2),
(4, 'Side Chef', 'Albert', 'Petronovsky', 3, 3),
(5, 'Dessert Chef', 'Altisia', 'Romanov', 4, 4),
(6, 'Amateur Chef', 'Douglas', 'Macintosh', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `phone_num` int(11) DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `phone_num`, `address`, `online_customer_id`) VALUES
(6, 9254354, '9661 Hamilton Ave. Romulus, MI 48174', 2),
(7, 9123423, '285 Hanover Dr. Farmingdale, NY 11735', 1),
(8, 9232767, ' 8703 Dunbar St. Hummelstown, PA 17036', 4),
(9, 9832764, '7976 Ohio Road Inman, SC 29349', 3),
(10, 9234567, '8168 Rockcrest Court Boston, MA 02127', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Deliverycustomer`
-- (See below for the actual view)
--
CREATE TABLE `Deliverycustomer` (
`id` int(11)
,`fname` varchar(45)
,`lname` varchar(45)
,`address` varchar(45)
);

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
(1, 'zed', 'sabroso', '2019-10-02'),
(2, 'adrian', 'fortuno', '2019-10-17'),
(3, 'Finly', 'Krukov', '1999-10-15'),
(4, 'Flugal', 'Pardian', '2001-01-16'),
(5, 'Graphitiny', 'Liana', '1997-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `online_order`
--

CREATE TABLE `online_order` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `online_customer_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `chef_onsite_order_id` int(11) NOT NULL,
  `chef_onsite_order_onsite_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onsite_customer`
--

CREATE TABLE `onsite_customer` (
  `id` int(11) NOT NULL,
  `site_cust_dob` date DEFAULT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `onsite_customer`
--

INSERT INTO `onsite_customer` (`id`, `site_cust_dob`, `fname`, `lname`) VALUES
(1, '2019-10-16', 'aliah', 'casabuena'),
(2, '2019-10-16', 'marvin', 'dimaano'),
(3, '2001-10-04', 'Fian', 'Cumahaill'),
(4, '2001-12-06', 'Jobert', 'Printo'),
(5, '2015-01-08', 'Felix', 'Pierrepoint');

-- --------------------------------------------------------

--
-- Table structure for table `onsite_order`
--

CREATE TABLE `onsite_order` (
  `id` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `onsite_customer_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `chef_onsite_order_id` int(11) NOT NULL,
  `chef_onsite_order_onsite_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `supplier_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `loc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `loc`, `employee_num`) VALUES
(1, 'Taguig City', 23),
(2, 'Mandaluyong City', 4);

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
(1, 'asia pacific', 922222, 'makati city'),
(2, 'pancake supp', 9333333, 'pasay city'),
(3, 'supplier 1', 9333333, 'Quezon City'),
(4, 'supplier 2', 944444444, 'Laguna');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_has_restaurant`
--

CREATE TABLE `supplier_has_restaurant` (
  `supplier_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_has_restaurant`
--

INSERT INTO `supplier_has_restaurant` (`supplier_id`, `restaurant_id`) VALUES
(1, 2),
(2, 2),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Structure for view `Deliverycustomer`
--
DROP TABLE IF EXISTS `Deliverycustomer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id11338219_dbm2`@`%` SQL SECURITY DEFINER VIEW `Deliverycustomer`  AS  select `delivery`.`id` AS `id`,`online_customer`.`fname` AS `fname`,`online_customer`.`lname` AS `lname`,`delivery`.`address` AS `address` from (`delivery` join `online_customer` on(`delivery`.`online_customer_id` = `online_customer`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`id`,`onsite_order_id`,`onsite_order_onsite_customer_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`,`online_customer_id`),
  ADD KEY `fk_delivery_online_customer1_idx` (`online_customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`,`restaurant_id`),
  ADD KEY `fk_employee_restaurant_idx` (`restaurant_id`);

--
-- Indexes for table `online_customer`
--
ALTER TABLE `online_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_order`
--
ALTER TABLE `online_order`
  ADD PRIMARY KEY (`id`,`online_customer_id`,`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`),
  ADD KEY `fk_online_order_online_customer1_idx` (`online_customer_id`),
  ADD KEY `fk_online_order_chef1_idx` (`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`);

--
-- Indexes for table `onsite_customer`
--
ALTER TABLE `onsite_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onsite_order`
--
ALTER TABLE `onsite_order`
  ADD PRIMARY KEY (`id`,`onsite_customer_id`,`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`),
  ADD KEY `fk_onsite_order_onsite_customer1_idx` (`onsite_customer_id`),
  ADD KEY `fk_onsite_order_chef1_idx` (`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`,`supplier_id`,`chef_id`),
  ADD KEY `fk_product_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_product_chef1_idx` (`chef_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_has_restaurant`
--
ALTER TABLE `supplier_has_restaurant`
  ADD PRIMARY KEY (`supplier_id`,`restaurant_id`),
  ADD KEY `fk_supplier_has_restaurant_restaurant1_idx` (`restaurant_id`),
  ADD KEY `fk_supplier_has_restaurant_supplier1_idx` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chef`
--
ALTER TABLE `chef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `online_customer`
--
ALTER TABLE `online_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `online_order`
--
ALTER TABLE `online_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `onsite_customer`
--
ALTER TABLE `onsite_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `onsite_order`
--
ALTER TABLE `onsite_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier_has_restaurant`
--
ALTER TABLE `supplier_has_restaurant`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_delivery_online_customer1` FOREIGN KEY (`online_customer_id`) REFERENCES `online_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `online_order`
--
ALTER TABLE `online_order`
  ADD CONSTRAINT `fk_online_order_chef1` FOREIGN KEY (`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`) REFERENCES `chef` (`id`, `onsite_order_id`, `onsite_order_onsite_customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_online_order_online_customer1` FOREIGN KEY (`online_customer_id`) REFERENCES `online_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `onsite_order`
--
ALTER TABLE `onsite_order`
  ADD CONSTRAINT `fk_onsite_order_chef1` FOREIGN KEY (`chef_id`,`chef_onsite_order_id`,`chef_onsite_order_onsite_customer_id`) REFERENCES `chef` (`id`, `onsite_order_id`, `onsite_order_onsite_customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_onsite_order_onsite_customer1` FOREIGN KEY (`onsite_customer_id`) REFERENCES `onsite_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_chef1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplier_has_restaurant`
--
ALTER TABLE `supplier_has_restaurant`
  ADD CONSTRAINT `fk_supplier_has_restaurant_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_has_restaurant_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
