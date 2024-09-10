-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 28, 2023 at 10:38 AM
-- Server version: 8.0.32
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `airport_id` char(3) NOT NULL,
  `airport_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`, `city`, `country`) VALUES
('JFK', 'John F. Kennedy International Airport', 'New York', 'United States'),
('LHR', 'Heathrow Airport', 'London', 'United Kingdom'),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France'),
('HND', 'Haneda Airport', 'Tokyo', 'Japan'),
('DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates'),
('SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore'),
('SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'United States'),
('SFO', 'San Francisco International Airport', 'San Francisco', 'United States'),
('ZRH', 'Zurich Airport', 'Zurich', 'Switzerland');

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `passport_number` varchar(20) UNIQUE NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`first_name`, `last_name`, `passport_number`, `nationality`, `date_of_birth`) VALUES
('John', 'Doe', 'A12345678', 'United States', '1980-05-15'),
('Jane', 'Smith', 'B98765432', 'United Kingdom', '1992-08-22'),
('Carlos', 'Gonzalez', 'C56789012', 'Spain', '1975-11-30'),
('Mia', 'Chen', 'D34567890', 'China', '1988-01-10'),
('Ahmed', 'Al-Farsi', 'E87654321', 'United Arab Emirates', '1990-12-04'),
('Olivia', 'Brown', 'F12345678', 'Canada', '1985-07-19'),
('Luca', 'Rossi', 'G23456789', 'Italy', '1991-03-05');


-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `terminal_id` int UNSIGNED NOT NULL,
  `terminal_name` varchar(30) NOT NULL,
  `manager_id` int UNSIGNED DEFAULT NULL,
  `airport_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`terminal_id`, `terminal_name`, `manager_id`, `airport_id`) VALUES
(1, 'Main Terminal', 100, 'JFK'),
(2, 'Domestic Terminal', 101, 'LHR'),
(3, 'International Terminal', 102, 'CDG'),
(4, 'North Terminal', 103, 'HND'),
(5, 'South Terminal', 104, 'DXB'),
(6, 'East Terminal', 105, 'SIN'),
(7, 'West Terminal', 106, 'SYD'),
(8, 'Arrivals Terminal', 107, 'LAX'),
(9, 'Departures Terminal', 108, 'SFO'),
(10, 'Executive Terminal', 109, 'ZRH'),
(11, 'Cargo Terminal', 110, 'JFK'),
(12, 'Private Terminal', 111, 'LHR'),
(13, 'VIP Terminal', 112, 'CDG'),
(14, 'Customs Terminal', 113, 'HND'),
(15, 'Security Terminal', 114, 'DXB');


-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int UNSIGNED NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `position` varchar(30) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `manager_id` int UNSIGNED DEFAULT NULL,
  `terminal_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
---- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `position`, `salary`, `commission_pct`, `manager_id`, `terminal_id`) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '2020-01-15', 'Terminal Manager', 60000.00, NULL, NULL, 1),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '555-5678', '2019-03-22', 'Security Officer', 45000.00, 0.05, 1, 1),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '555-8765', '2021-07-11', 'Customer Service Agent', 40000.00, NULL, 1, 2),
(4, 'Diana', 'Lee', 'diana.lee@example.com', '555-4321', '2018-11-30', 'Ticketing Agent', 42000.00, NULL, 2, 2),
(5, 'Eve', 'Wilson', 'eve.wilson@example.com', '555-6789', '2022-05-19', 'Baggage Handler', 38000.00, NULL, 2, 3),
(6, 'Frank', 'Martin', 'frank.martin@example.com', '555-3456', '2023-02-14', 'Customs Officer', 47000.00, 0.03, 2, 4),
(7, 'Grace', 'Taylor', 'grace.taylor@example.com', '555-7890', '2021-09-15', 'VIP Services', 55000.00, NULL, NULL, 5),
(8, 'Hannah', 'Lee', 'hannah.lee@example.com', '555-9876', '2020-11-01', 'Ground Services Coordinator', 49000.00, 0.02, 1, 6),
(9, 'Ian', 'Nguyen', 'ian.nguyen@example.com', '555-6543', '2017-04-20', 'Airport Shuttle Driver', 42000.00, NULL, 1, 7),
(10, 'Julia', 'Harris', 'julia.harris@example.com', '555-5432', '2022-08-16', 'Flight Attendant', 45000.00, 0.04, 3, 8),
(11, 'Kevin', 'Martinez', 'kevin.martinez@example.com', '555-3457', '2019-06-29', 'Maintenance Technician', 47000.00, NULL, 1, 9),
(12, 'Lily', 'Adams', 'lily.adams@example.com', '555-8766', '2021-12-03', 'Duty Manager', 52000.00, NULL, NULL, 10);


--
-- -- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`, `city`, `country`, `iata_code`, `icao_code`, `latitude`, `longitude`, `elevation`, `timezone`, `phone_number`) VALUES
(1, 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'USA', 'ATL', 'KATL', '33.6367', '-84.4279', '313', '-5', '+1-800-897-1910'),
(2, 'Los Angeles International Airport', 'Los Angeles', 'USA', 'LAX', 'KLAX', '33.9416', '-118.4085', '125', '-8', '+1-310-646-5252'),
(3, 'Heathrow Airport', 'London', 'United Kingdom', 'LHR', 'EGLL', '51.4700', '-0.4543', '83', '+0', '+44-20-8745-3938'),
(4, 'Tokyo Haneda Airport', 'Tokyo', 'Japan', 'HND', 'RJTT', '35.5494', '139.7798', '21', '+9', '+81-3-5757-8111'),
(5, 'Paris Charles de Gaulle Airport', 'Paris', 'France', 'CDG', 'LFPG', '49.0097', '2.5479', '119', '+1', '+33-1-70-36-39-50'),
(6, 'Dubai International Airport', 'Dubai', 'United Arab Emirates', 'DXB', 'OMDB', '25.2532', '55.3657', '10', '+4', '+971-4-216-1111'),
(7, 'Hong Kong International Airport', 'Hong Kong', 'China', 'HKG', 'VHHH', '22.3085', '113.9146', '6', '+8', '+852-2188-8888'),
(8, 'Singapore Changi Airport', 'Singapore', 'Singapore', 'SIN', 'WSSS', '1.3502', '103.6665', '7', '+8', '+65-6542-6888'),
(9, 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia', 'SYD', 'YSSY', '-33.9399', '151.1753', '6', '+10', '+61-2-9667-9111'),
(10, 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands', 'AMS', 'EHAM', '52.3086', '4.7639', '11', '+1', '+31-20-794-0800');


-- --------------------------------------------------------

--
--- Stand-in structure for view `airport_passenger_details_view`
-- (See below for the actual view)
--
CREATE TABLE `airport_passenger_details_view` (
`passenger_id` int unsigned,
`first_name` varchar(20),
`last_name` varchar(25),
`passport_number` varchar(20),
`nationality` varchar(30),
`date_of_birth` date,
`flight_number` varchar(10),
`departure_airport` varchar(50),
`arrival_airport` varchar(50),
`departure_date` datetime,
`arrival_date` datetime,
`seat_number` varchar(10),
`boarding_pass` varchar(20),
`gate` varchar(5),
`terminal` varchar(10),
`status` varchar(20)
);


-- --------------------------------------------------------

--
---- Table structure for table `airport_roles`
--

CREATE TABLE `airport_roles` (
  `role_id` varchar(10) NOT NULL,
  `role_title` varchar(35) NOT NULL,
  `min_salary` decimal(8,0) UNSIGNED DEFAULT NULL,
  `max_salary` decimal(8,0) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `airport_roles`
--

INSERT INTO `airport_roles` (`role_id`, `role_title`, `min_salary`, `max_salary`) VALUES
('AD_AGENT', 'Airport Customer Service Agent', '3000', '7000'),
('AD_MGR', 'Airport Manager', '8000', '15000'),
('SEC_OFF', 'Security Officer', '4000', '9000'),
('FLIGHT_ATT', 'Flight Attendant', '3500', '8000'),
('TICKET_CLERK', 'Ticket Clerk', '2500', '6000'),
('BAGGAGE_HAND', 'Baggage Handler', '2200', '5000'),
('GROUND_SUP', 'Ground Supervisor', '6000', '12000'),
('CUSTOMS_AGENT', 'Customs Agent', '4000', '8500'),
('LOADER', 'Cargo Loader', '3000', '7000'),
('AIR_TRAFFIC_CON', 'Air Traffic Controller', '10000', '20000');

-- --------------------------------------------------------

--


--
-- Table structure for table `airport_locations`
--

CREATE TABLE `airport_locations` (
  `location_id` int UNSIGNED NOT NULL,
  `street_address` varchar(40) DEFAULT NULL,
  `postal_code` varchar(12) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(25) DEFAULT NULL,
  `country_code` char(2) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `airport_locations`
--

INSERT INTO `airport_locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_code`) VALUES
(1000, '1297 Airport Rd', '00989', 'Roma', NULL, 'IT'),
(1100, '93091 Terminal Ave', '10934', 'Venice', NULL, 'IT'),
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
(1400, '2014 Runway Rd', '26192', 'Southlake', 'Texas', 'US'),
(1500, '2011 Flight Blvd', '99236', 'South San Francisco', 'California', 'US'),
(1600, '2007 Gate St', '50090', 'South Brunswick', 'New Jersey', 'US'),
(1700, '2004 Terminal Rd', '98199', 'Seattle', 'Washington', 'US'),
(1800, '147 Aviation Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
(1900, '6092 Hangar St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
(2000, '40-5-12 Flight Path', '190518', 'Beijing', NULL, 'CN'),
(2100, '1298 Airport Rd', '490231', 'Bombay', 'Maharashtra', 'IN'),
(2200, '12-98 Arrival St', '2901', 'Sydney', 'New South Wales', 'AU'),
(2300, '198 Departure St', '540198', 'Singapore', NULL, 'SG'),
(2400, '8204 Landing St', NULL, 'London', NULL, 'UK'),
(2500, 'Magdalen Centre, Airport Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
(2600, '9702 Runway Rd', '09629850293', 'Stretford', 'Manchester', 'UK'),
(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
(2800, 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
(3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
(3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');


-- --------------------------------------------------------

--
-- -- Table structure for table `airport_regions`
--

CREATE TABLE `airport_regions` (
  `region_id` int UNSIGNED NOT NULL,
  `region_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `airport_regions`
--

INSERT INTO `airport_regions` (`region_id`, `region_name`) VALUES
(1, 'European Union'),
(2, 'North America'),
(3, 'Asia-Pacific'),
(4, 'South America'),
(5, 'Middle East'),
(6, 'Africa'),
(7, 'Caribbean'),
(8, 'Central America'),
(9, 'Eastern Europe'),
(10, 'Western Europe'),
(11, 'Northern Europe'),
(12, 'Southern Europe');


-- --------------------------------------------------------

--
-- -- Table structure for table `airport_sessions`
--

CREATE TABLE `airport_sessions` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passenger_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `session_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_active` int UNSIGNED NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airport_sessions`
--

-- Sample data entries (assuming passenger IDs are available)
INSERT INTO `airport_sessions` (`session_id`, `passenger_id`, `ip_address`, `user_agent`, `session_data`, `last_active`) VALUES
('abc123', 1001, '192.168.1.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'session_data_example', 1694057340),
('def456', 1002, '192.168.1.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Firefox/54.0', 'session_data_example', 1694057341);


-- --------------------------------------------------------

--
-- -- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `is_vip` tinyint NOT NULL DEFAULT '0',
  `frequent_flyer_number` varchar(256) DEFAULT NULL,
  `remember_token` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `name`, `email`, `password`, `is_vip`, `frequent_flyer_number`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 'Ivan Horvat', 'ivan@primjer.com', '$2y$10$19YFNgKGDxtSMQ52xALJN.tbSugpJYYli30J/mBYW/Hhfs.QXMv92', 0, NULL, NULL, '2024-09-10 10:00:00', '2024-09-10 10:00:00'),
(2, 'Ana Jurić', 'ana@primjer.com', '$2y$10$tDp2cjktZv8UmOmjEcZ8IuqAu9z4s0TRndoRSaqBHsZj5V3ijVwm6', 0, NULL, NULL, '2024-09-10 10:05:00', '2024-09-10 10:05:00'),
(3, 'Marko Šarić', 'marko@primjer.com', '$2y$10$NYrwpGryyMdfPC5SF9PJAeLRS5AoXbdSbx/RolfOHr9m/dFq1yhva', 1, 'FF123456789', NULL, '2024-09-10 10:10:00', '2024-09-10 10:10:00'),
(4, 'Maja Kovač', 'maja@primjer.com', '$2y$10$2pAYeFaLXyXzlXjlY.24D.TjBaGjK4tVfwMZhZqNIqSle77FAEVdq', 1, 'FF987654321', NULL, '2024-09-10 10:15:00', '2024-09-10 10:15:00');


-- --------------------------------------------------------

--
--- Structure for view `passenger_details_view`
--
DROP VIEW IF EXISTS `passenger_details_view`;

CREATE VIEW `passenger_details_view` AS 
SELECT 
    p.`id` AS `passenger_id`, 
    p.`name` AS `passenger_name`, 
    p.`email` AS `passenger_email`, 
    p.`is_vip` AS `is_vip`, 
    p.`frequent_flyer_number` AS `frequent_flyer_number`, 
    s.`session_id` AS `session_id`, 
    s.`ip_address` AS `ip_address`, 
    s.`user_agent` AS `user_agent`, 
    s.`session_data` AS `session_data`, 
    s.`last_active` AS `last_active`, 
    f.`flight_number` AS `flight_number`, 
    f.`departure_time` AS `departure_time`, 
    f.`arrival_time` AS `arrival_time`, 
    a.`airport_name` AS `airport_name`, 
    a.`city` AS `airport_city`, 
    a.`country_id` AS `airport_country_id`, 
    c.`country_name` AS `country_name`, 
    r.`region_name` AS `region_name`
FROM 
    ((`passengers` p
    JOIN `airport_sessions` s ON p.`id` = s.`passenger_id`)
    JOIN `flights` f ON s.`session_id` = f.`session_id`)
    JOIN `airports` a ON f.`airport_id` = a.`airport_id`
    JOIN `countries` c ON a.`country_id` = c.`country_id`
    JOIN `regions` r ON c.`region_id` = r.`region_id`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airport_sessions`
--
ALTER TABLE `airport_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `passenger_id` (`passenger_id`);


--
----
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


--
----
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3201;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `region_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `airports_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`departure_airport_id`) REFERENCES `airports` (`airport_id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`arrival_airport_id`) REFERENCES `airports` (`airport_id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`);

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3201;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `region_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `departments_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `sessions`
--
-- (No foreign keys needed for this table)

--
-- Constraints for table `passengers`
--
-- (No foreign keys needed for this table)

--
-- Constraints for table `bookings`
--
-- Already included above

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
