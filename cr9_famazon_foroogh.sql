-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Aug 2021 um 08:52
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr9_famazon_foroogh`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `fk_product_id`) VALUES
(1001, 'summer', 12358),
(1002, 'Men', 367),
(1003, 'thrink', 586);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_adresse` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_adresse`) VALUES
(25, 'Zalando', 'Italy'),
(26, 'Esprit', 'Germany'),
(27, 'Nespersso', 'USA');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company_location`
--

CREATE TABLE `company_location` (
  `adresse_company` varchar(45) NOT NULL,
  `country_company` varchar(30) DEFAULT NULL,
  `city_company` varchar(30) DEFAULT NULL,
  `street_company` varchar(30) DEFAULT NULL,
  `zip_company` int(11) DEFAULT NULL,
  `fk_companies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `company_location`
--

INSERT INTO `company_location` (`adresse_company`, `country_company`, `city_company`, `street_company`, `zip_company`, `fk_companies_id`) VALUES
('Esprit', 'Germany', 'Hamburg', 'bergstrasse 25', 1256, 26),
('nespresso', 'usa', 'Newyork', 'hauseavenue 45', 1459, 27),
('Zalando', 'Italy', 'Roma', 'Vialeeuropa 22', 122, 25);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `telnumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`user_id`, `first_name`, `last_name`, `email`, `telnumber`) VALUES
(1, 'sara', 'lopez', 'sara_lopez86@gmail.com', 2147483647),
(2, 'Mani', 'Monfard', 'mani_monfared@gmail.com', 2147483647),
(3, 'conny', 'wolf', 'wolf_conny@yahoo.com', 2147483647);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_location`
--

CREATE TABLE `customer_location` (
  `customer_location` varchar(45) NOT NULL,
  `country_customer` varchar(30) DEFAULT NULL,
  `city_customer` varchar(30) DEFAULT NULL,
  `street_customer` varchar(30) DEFAULT NULL,
  `zip_customer` int(11) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer_location`
--

INSERT INTO `customer_location` (`customer_location`, `country_customer`, `city_customer`, `street_customer`, `zip_customer`, `fk_user_id`) VALUES
('Conny', 'USA', 'Texas', 'Humaneavenue 15', 15620, 3),
('mani', 'Germany', 'berlin', 'zieglergasse 25', 2561, 2),
('Sara ', 'Austria', 'vienna', 'raxstraße 4', 1100, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ordner_status`
--

CREATE TABLE `ordner_status` (
  `ordner_id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_transaction_id` int(11) DEFAULT NULL,
  `ordner_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ordner_status`
--

INSERT INTO `ordner_status` (`ordner_id`, `fk_user_id`, `fk_transaction_id`, `ordner_date`) VALUES
(0, 1, 123546, '2015-05-23'),
(1, 2, 23568, '2018-08-31'),
(2, 3, 125648, '2020-09-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_price` varchar(11) DEFAULT NULL,
  `fk_companies_id` int(11) DEFAULT NULL,
  `fk_ordner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `fk_companies_id`, `fk_ordner_id`) VALUES
(367, 'shoes', '65,90', 26, 1),
(586, 'glas', '9,45', 27, 2),
(12358, 'Top', '25,5', 25, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sale_transaction`
--

CREATE TABLE `sale_transaction` (
  `transaction_id` int(11) NOT NULL,
  `paypale` varchar(45) DEFAULT NULL,
  `visa` varchar(45) DEFAULT NULL,
  `bill` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sale_transaction`
--

INSERT INTO `sale_transaction` (`transaction_id`, `paypale`, `visa`, `bill`) VALUES
(23568, 'NO', 'NO', '4adj15974689745'),
(123546, 'AT12356458979885', 'NO', 'NO'),
(125648, 'NO', 'YES', 'NO');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vender`
--

CREATE TABLE `vender` (
  `vender_name` varchar(45) NOT NULL,
  `vender_adresse` varchar(45) DEFAULT NULL,
  `fk_companies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vender`
--

INSERT INTO `vender` (`vender_name`, `vender_adresse`, `fk_companies_id`) VALUES
('Amadori', 'USA', 27),
('Hamp', 'Germany', 26),
('Johnson', 'Austria', 25);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indizes für die Tabelle `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indizes für die Tabelle `company_location`
--
ALTER TABLE `company_location`
  ADD PRIMARY KEY (`adresse_company`),
  ADD KEY `fk_companies_id` (`fk_companies_id`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `customer_location`
--
ALTER TABLE `customer_location`
  ADD PRIMARY KEY (`customer_location`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `ordner_status`
--
ALTER TABLE `ordner_status`
  ADD PRIMARY KEY (`ordner_id`),
  ADD KEY `fk_transaction_id` (`fk_transaction_id`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_companies_id` (`fk_companies_id`),
  ADD KEY `fk_ordner_id` (`fk_ordner_id`);

--
-- Indizes für die Tabelle `sale_transaction`
--
ALTER TABLE `sale_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indizes für die Tabelle `vender`
--
ALTER TABLE `vender`
  ADD PRIMARY KEY (`vender_name`),
  ADD KEY `fk_companies_id` (`fk_companies_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints der Tabelle `company_location`
--
ALTER TABLE `company_location`
  ADD CONSTRAINT `company_location_ibfk_1` FOREIGN KEY (`fk_companies_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints der Tabelle `customer_location`
--
ALTER TABLE `customer_location`
  ADD CONSTRAINT `customer_location_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `customers` (`user_id`);

--
-- Constraints der Tabelle `ordner_status`
--
ALTER TABLE `ordner_status`
  ADD CONSTRAINT `ordner_status_ibfk_1` FOREIGN KEY (`fk_transaction_id`) REFERENCES `sale_transaction` (`transaction_id`);

--
-- Constraints der Tabelle `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_companies_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`fk_ordner_id`) REFERENCES `ordner_status` (`ordner_id`);

--
-- Constraints der Tabelle `vender`
--
ALTER TABLE `vender`
  ADD CONSTRAINT `vender_ibfk_1` FOREIGN KEY (`fk_companies_id`) REFERENCES `companies` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
