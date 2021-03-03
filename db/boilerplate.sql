-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2020 at 10:22 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpc`
--

-- --------------------------------------------------------

--
-- Table structure for table `circle`
--

CREATE TABLE `circle` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circle`
--

INSERT INTO `circle` (`id`, `name`) VALUES
(1, 'NORTH'),
(2, 'SOUTH'),
(3, 'WEST'),
(4, 'EAST');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`) VALUES
(1, 'Vodafone'),
(2, 'Airtel'),
(3, 'Verizon'),
(6, 'Bharti Airtel Ltd.,'),
(7, 'Vodafone Idea Ltd');

-- --------------------------------------------------------

--
-- Table structure for table `customer_circle`
--

CREATE TABLE `customer_circle` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_circle`
--

INSERT INTO `customer_circle` (`id`, `name`, `customer_id`) VALUES
(1, 'West', 2),
(2, 'North', 1),
(3, 'East', 3),
(4, 'East', 2),
(5, 'AP', 7),
(6, 'HR', 7),
(7, 'NE', 7),
(8, 'AS', 7),
(9, 'RJ', 7),
(10, 'DL', 7),
(15, 'Maharashtra', 6),
(16, 'AP', 6),
(17, 'NCR', 6),
(18, 'NE', 6),
(19, 'AS', 6),
(20, 'RJ', 6),
(21, 'MH', 7),
(22, 'GJ', 7),
(23, 'RJ', 7),
(24, 'MP', 7),
(25, 'J&K', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer_user_mapping`
--

CREATE TABLE `customer_user_mapping` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_user_mapping`
--

INSERT INTO `customer_user_mapping` (`id`, `created_at`, `customer_id`, `user_id`) VALUES
(3, '2019-12-16', 2, 5),
(4, '2019-12-16', 3, 2),
(12, '2020-01-02', 1, 2),
(19, '2020-02-18', 7, 2),
(20, '2020-02-18', 7, 5),
(21, '2020-02-19', 6, 2),
(22, '2020-02-19', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dpl_form`
--

CREATE TABLE `dpl_form` (
  `id` bigint(20) NOT NULL,
  `chassis_no` longtext NOT NULL,
  `created_at` date NOT NULL,
  `date_of_receipt` date NOT NULL,
  `dpl_form_type` varchar(250) NOT NULL,
  `invoice_bill_challan` varchar(250) NOT NULL,
  `issue_date` date NOT NULL,
  `license_issued_no` varchar(250) NOT NULL,
  `issue_office` varchar(250) NOT NULL,
  `make` longtext NOT NULL,
  `model` longtext NOT NULL,
  `name_address_of_person_receiving` longtext NOT NULL,
  `name_address_of_person_transferred` longtext DEFAULT NULL,
  `quantity` bigint(20) NOT NULL,
  `quantity_balance` bigint(20) DEFAULT NULL,
  `rcv_category` varchar(250) NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `retail_price` double NOT NULL,
  `return_date` date DEFAULT NULL,
  `sale_date` date NOT NULL,
  `sl_no` varchar(250) NOT NULL,
  `trade_currency_retail` varchar(250) NOT NULL,
  `trade_currency_wholesale` varchar(250) NOT NULL,
  `voucher_receipt` varchar(250) NOT NULL,
  `wholesale_price` double NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `dpl_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpl_license`
--

CREATE TABLE `dpl_license` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `dpl_license_frequency_letter` varchar(250) NOT NULL,
  `tsp` tinyint(1) NOT NULL DEFAULT 0,
  `customer` bigint(20) DEFAULT NULL,
  `customer_circle` bigint(20) DEFAULT NULL,
  `dpl_location` int(11) DEFAULT NULL,
  `dpl_license_customer_po_pdf` varchar(250) NOT NULL,
  `dpl_license_frequency_letter_pdf` varchar(250) NOT NULL,
  `dpl_product_catalogue_pdf` varchar(250) DEFAULT NULL,
  `po_number` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpl_license_freq_letter`
--

CREATE TABLE `dpl_license_freq_letter` (
  `id` bigint(20) NOT NULL,
  `date_of_expiry` date NOT NULL,
  `downlink_start` double NOT NULL,
  `downlink_stop` double NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `operator_name` varchar(250) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `service_area` varchar(250) NOT NULL,
  `uplink_start` double NOT NULL,
  `uplink_stop` double NOT NULL,
  `dpl_license_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpl_location`
--

CREATE TABLE `dpl_location` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `source` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dpl_location`
--

INSERT INTO `dpl_location` (`id`, `name`, `slug`, `source`) VALUES
(1, 'EIL Chennai', 'eil-chennai', 'EIL'),
(2, 'EIL Mumbai', 'eil-mumbai', 'EIL'),
(3, 'EIL Delhi/Gurgaon', 'eil-delhi-gurgaon', 'EIL'),
(4, 'EIL Pune', 'eil-pune', 'ESHP');

-- --------------------------------------------------------

--
-- Table structure for table `dpl_undertaking_form`
--

CREATE TABLE `dpl_undertaking_form` (
  `id` bigint(20) NOT NULL,
  `consignment_landed_port` varchar(250) NOT NULL,
  `created_at` date NOT NULL,
  `date_of_expiry` date NOT NULL,
  `designation` varchar(250) NOT NULL,
  `dpl_number` varchar(250) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `issued_by` varchar(250) NOT NULL,
  `manufacturer_address` longtext NOT NULL,
  `manufacturer_name` varchar(250) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `dpl_id` bigint(20) NOT NULL,
  `waybill_number` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpl_undertaking_freq`
--

CREATE TABLE `dpl_undertaking_freq` (
  `id` bigint(20) NOT NULL,
  `created_at` date NOT NULL,
  `equipment_name` varchar(250) NOT NULL,
  `frequency_range` varchar(250) NOT NULL,
  `output_power` varchar(255) NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `dpl_form_id` bigint(20) DEFAULT NULL,
  `make_model` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `license_entries`
--

CREATE TABLE `license_entries` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `license_date` date DEFAULT NULL,
  `license_no` varchar(250) NOT NULL,
  `license_quantity` bigint(20) DEFAULT NULL,
  `online_date` date DEFAULT NULL,
  `online_id` varchar(250) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `dpl_license_id` bigint(20) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  `balance_quantity` bigint(20) DEFAULT NULL,
  `valid_till` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `license_entries`
--

INSERT INTO `license_entries` (`id`, `created_at`, `license_date`, `license_no`, `license_quantity`, `online_date`, `online_id`, `updated_at`, `dpl_license_id`, `po_id`, `balance_quantity`, `valid_till`) VALUES
(1, '2020-03-11', '2020-03-26', 'q34234234', 34455, '2020-03-18', '234234', '2020-03-03', 19, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `options` varchar(255) NOT NULL,
  `show_in_menu` varchar(1) NOT NULL,
  `url` varchar(250) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `options`, `show_in_menu`, `url`, `parent_id`) VALUES
(1, 'Create PO', '{\"icon\":\"layers\"}', '1', 'app.cuSupplypo', NULL),
(2, 'Users', '{\"icon\":\"people\"}', '1', '#users', NULL),
(3, 'List', '{\"icon\":\"list\"}', '1', 'app.userList', 2),
(4, 'Add', '{\"icon\":\"plus\"}', '1', 'app.createUser', 2),
(6, 'PO List', '{\"icon\":\"list\"}', '1', 'app.poList', NULL),
(7, 'Dashboard', '{\"icon\":\"speedometer\"}', '1', 'app.dashboard', NULL),
(8, 'Customer & circles', '{\"icon\":\"compass\"}', '1', '#customers', NULL),
(12, 'Customer list', '{\"icon\":\"list\"}', '1', 'app.customerList', 8),
(13, 'Create customer', '{\"icon\":\"plus\"}', '1', 'app.createCustomer', 8),
(15, 'Customer circle list', '{\"icon\":\"list\"}', '1', 'app.customerCircleList', 8),
(16, 'Create customer circle', '{\"icon\":\"plus\"}', '1', 'app.createCustomerCircle', 8),
(17, 'DPLList', '{\"icon\":\"list\"}', '1', 'app.dplList', NULL),
(18, 'Reporting', '{\"icon\":\"list\"}', '1', '#reporting', NULL),
(19, 'Basic reporting', '{\"icon\":\"list\"}', '1', 'app.basicReporting', 18);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 1,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 1,
  `title` longtext NOT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `full_content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` bigint(20) NOT NULL,
  `billing_address` varchar(250) DEFAULT NULL,
  `contract_copy_customer` varchar(250) DEFAULT NULL,
  `customer_contact_name` varchar(250) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `delhi_rlo` tinyint(1) NOT NULL DEFAULT 0,
  `partial_po` tinyint(1) NOT NULL DEFAULT 0,
  `po_attachment` varchar(250) NOT NULL,
  `po_date` date DEFAULT NULL,
  `po_frequency_letter` varchar(250) NOT NULL,
  `po_list_attachment` varchar(250) NOT NULL,
  `po_number` varchar(16) NOT NULL,
  `po_owner` varchar(250) NOT NULL,
  `po_title` varchar(250) NOT NULL,
  `shipping_address` varchar(250) DEFAULT NULL,
  `tsp` tinyint(1) NOT NULL DEFAULT 0,
  `created_by_id` bigint(20) DEFAULT NULL,
  `dpl_location` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `customer` bigint(20) DEFAULT NULL,
  `customer_circle_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_freq_letter`
--

CREATE TABLE `purchase_order_freq_letter` (
  `id` bigint(20) NOT NULL,
  `date_of_expiry` date NOT NULL,
  `downlink_start` double NOT NULL,
  `downlink_stop` double NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `operator_name` varchar(250) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `service_area` varchar(250) NOT NULL,
  `uplink_start` double NOT NULL,
  `uplink_stop` double NOT NULL,
  `po_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) NOT NULL,
  `is_processed` bit(1) NOT NULL,
  `material_code` varchar(250) NOT NULL,
  `material_description` varchar(250) NOT NULL,
  `po_qty` double NOT NULL,
  `product_code` varchar(250) NOT NULL,
  `radio_count_per_set` double NOT NULL,
  `radio_qty` double NOT NULL,
  `radio_type` varchar(250) NOT NULL,
  `unit_price` double NOT NULL,
  `po_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_revisions`
--

CREATE TABLE `purchase_order_revisions` (
  `id` bigint(20) NOT NULL,
  `modified_by` decimal(19,2) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `po_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `deadline` date NOT NULL,
  `deliverable` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `assigned_to_team` bigint(20) NOT NULL,
  `delivered_to_team` bigint(20) NOT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  `task_template_id` int(11) DEFAULT NULL,
  `dpl_license_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_attachments`
--

CREATE TABLE `task_attachments` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `file_path` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `dpl_license_id` bigint(20) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_revisions`
--

CREATE TABLE `task_revisions` (
  `id` bigint(20) NOT NULL,
  `receiver_feedback` longtext DEFAULT NULL,
  `sender_comment` longtext DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `vesion` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL,
  `approved_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_revision_attachments`
--

CREATE TABLE `task_revision_attachments` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `file_path` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `task_revision_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_template`
--

CREATE TABLE `task_template` (
  `id` int(11) NOT NULL,
  `deadline_day_from_start` int(11) NOT NULL,
  `deliverable` longtext NOT NULL,
  `form_id` varchar(250) DEFAULT NULL,
  `requires_approval` varchar(1) NOT NULL,
  `workflow_type` varchar(255) NOT NULL,
  `assigned_to_team` bigint(20) NOT NULL,
  `delivered_to_team` bigint(20) NOT NULL,
  `task_sequence` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_template`
--

INSERT INTO `task_template` (`id`, `deadline_day_from_start`, `deliverable`, `form_id`, `requires_approval`, `workflow_type`, `assigned_to_team`, `delivered_to_team`, `task_sequence`) VALUES
(1, 0, 'Create Purchase Order', 'create-po', '1', 'OLD_WPC', 1, 2, 0),
(5, 1, '1. ESHP MUS PO on EAB /Supplier against Customer PO to be shared with CL.\r\n<br>\r\n2. EAB/Supplier Proforma Invoice to ESHP ,against ESHP PO to be shared with CL\r\n<br>\r\n3. ESHP Proforma Invoice against Customer PO to be prepared & shared with CL.\r\n<br>\r\n4. Technical Write-up duly signed to be shared with CL.\r\n<br>\r\n5. Share complete set of documents  recived from CU ref S.no 1 to 5.', NULL, '1', 'OLD_WPC', 2, 3, 1),
(10, 3, '1. Ericsson DPL License copy to be enclosed.\r\n<br>\r\n2. Online payment of Import License Fee .\r\n<br>\r\n3. Hard copy of application submission;along with all the pre-requisite documents .\r\n<br>\r\n4. Followup and obatin Import Licnese from RLO.\r\n', NULL, '1', 'OLD_WPC', 3, 1, 2),
(14, 0, 'DPL License creation with frequency letter', 'dpl-license-creation', '1', 'NEW_WPC', 1, 2, 0),
(15, 1, 'Undertaking letter data entry', 'undertaking-letter-form', '1', 'NEW_WPC', 2, 3, 1),
(16, 2, 'Waybill number of Undertaking letter', 'waybill-undertaking-form', '1', 'NEW_WPC', 3, 1, 2),
(17, 3, 'Form III tabular data entry', 'form-3-tabular-data-entry-form', '1', 'NEW_WPC', 4, 1, 3),
(19, 4, 'License copy', 'license-copy-dpl', '1', 'NEW_WPC', 3, 1, 3),
(20, 4, 'License copy', 'license-copy-po', '1', 'OLD_WPC', 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT 'NULL',
  `active` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `active`) VALUES
(1, 'CU Supply', '1'),
(2, 'ESHP', '1'),
(3, 'CL/IDM', '1'),
(4, 'RDM', '1'),
(5, 'ADMIN', '1'),
(6, 'ESHP Approver', '1'),
(7, 'RDM Approver', '1'),
(8, 'CL/IDM Approver', '1');

-- --------------------------------------------------------

--
-- Table structure for table `team_modules_mapping`
--

CREATE TABLE `team_modules_mapping` (
  `team_id` bigint(20) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_modules_mapping`
--

INSERT INTO `team_modules_mapping` (`team_id`, `module_id`) VALUES
(5, 7),
(5, 2),
(5, 6),
(1, 7),
(1, 1),
(1, 6),
(2, 7),
(2, 6),
(3, 7),
(3, 6),
(5, 8),
(1, 17),
(2, 17),
(3, 17),
(5, 17),
(4, 7),
(4, 17),
(6, 17),
(6, 6),
(7, 17),
(8, 6),
(8, 17),
(5, 18),
(5, 19),
(1, 18),
(1, 19),
(2, 18),
(2, 19),
(3, 18),
(3, 19),
(4, 18),
(4, 19);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `active` varchar(1) NOT NULL,
  `auth_token` text DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `init_token` text DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(250) NOT NULL,
  `password` text DEFAULT NULL,
  `reset_token` text DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `active`, `auth_token`, `email`, `first_name`, `init_token`, `last_login`, `last_name`, `password`, `reset_token`, `team_id`) VALUES
(1, '1', NULL, 'pritam.dalal@ericsson.com', 'Pritam', NULL, NULL, 'Dalal', '$2a$10$Xx7X0jwViEFnvVV/ExqFPumwrpZcFnEqQWo/CHNt.y8CNt55sB0q6', NULL, 5),
(2, '1', NULL, 'tapas.bhattacharya@ericsson.com', 'Tapas', NULL, NULL, 'Bhattacharya', '$2a$10$xOOBnF9CH4L2b4cv1Sh6au4SQwkvpaoyOq7kf.ul6xr4zfrK6ttHi', NULL, 1),
(3, '1', NULL, 'dipanjan.chandra@ericsson.com', 'Dipanjan', NULL, NULL, 'Chandra', '$2a$10$hxC553E36s3rucfuxgGVpOyEnS8yY4VeYR6jZmVHvQ1uoGhgGQpSO', NULL, 2),
(4, '1', NULL, 'sougata.kumar.chatterjee@ericsson.com', 'Sougata K', NULL, NULL, 'Chatterjee', '$2a$10$K.A8L5ONgboh6e6c84krAuGlTxQr3fbesiBv0LHj0H.0qf/t3WxNO', NULL, 3),
(5, '1', NULL, 'supply@wpc.cc', 'CU Supply', NULL, NULL, 'User', '$2a$10$ywqdPJxSYxFeXByt.uris./OBLXjgL5i3BqcvxNrs/fCu/avV0/TC', NULL, 1),
(6, '1', NULL, 'rdm@wpc.cc', 'RDM', NULL, NULL, 'User', '$2a$10$K.A8L5ONgboh6e6c84krAuGlTxQr3fbesiBv0LHj0H.0qf/t3WxNO', NULL, 4),
(7, '1', NULL, 'eshp_approver@wpc.cc', 'ESHP-A', NULL, NULL, 'APPROVER', '$2a$10$K.A8L5ONgboh6e6c84krAuGlTxQr3fbesiBv0LHj0H.0qf/t3WxNO', NULL, 6),
(8, '1', NULL, 'idm_approver@wpc.cc', 'IDM-A', NULL, NULL, 'APPROVER', '$2a$10$K.A8L5ONgboh6e6c84krAuGlTxQr3fbesiBv0LHj0H.0qf/t3WxNO', NULL, 8),
(9, '1', NULL, 'rdm_approver@wpc.cc', 'RDM-A', NULL, NULL, 'APPROVER', '$2a$10$K.A8L5ONgboh6e6c84krAuGlTxQr3fbesiBv0LHj0H.0qf/t3WxNO', NULL, 7),
(10, '1', NULL, 'manoj.q.kumar@ericsson.com', 'Manoj', NULL, NULL, 'Kumar', '$2a$10$CkBSKF9rf2yW7QG55suUAOrQhSX5qlBb9CYRG3gQPjIdUOT2khNIK', NULL, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `circle`
--
ALTER TABLE `circle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_circle`
--
ALTER TABLE `customer_circle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4n6wds18v5vj4gfnjvp29c3ok` (`customer_id`);

--
-- Indexes for table `customer_user_mapping`
--
ALTER TABLE `customer_user_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKqqi2lqgdf69rtxwdy47ytqa56` (`customer_id`,`user_id`),
  ADD KEY `FKebdnhu74n14850vws7514vf1e` (`user_id`);

--
-- Indexes for table `dpl_form`
--
ALTER TABLE `dpl_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5i14fkis3a6dxonwgd23nelyw` (`created_by`),
  ADD KEY `FKgeaqkgeibtdx219v7key3k3pm` (`dpl_id`);

--
-- Indexes for table `dpl_license`
--
ALTER TABLE `dpl_license`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_bf0vr3wqct3tk89k8qwp38b8v` (`po_number`),
  ADD KEY `FKpcirap145fa2smy83nf47cgu2` (`customer`),
  ADD KEY `FK2l9ojanmf1qq0shumgwimdxwg` (`customer_circle`),
  ADD KEY `FKla0g9ptj6mfvnylojlmuy5rsq` (`dpl_location`);

--
-- Indexes for table `dpl_license_freq_letter`
--
ALTER TABLE `dpl_license_freq_letter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1t6xeeopmawqk0is21r9bv5x1` (`dpl_license_id`);

--
-- Indexes for table `dpl_location`
--
ALTER TABLE `dpl_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8nebbgrnc884oixc93g5rrcj8` (`slug`);

--
-- Indexes for table `dpl_undertaking_form`
--
ALTER TABLE `dpl_undertaking_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtrahhw1txyeeg08vbqyg4ywkl` (`created_by`),
  ADD KEY `FK1dene6ruapjt74uos1tm3t7a9` (`dpl_id`);

--
-- Indexes for table `dpl_undertaking_freq`
--
ALTER TABLE `dpl_undertaking_freq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo0tspcpwg6d2ycb0h7l5j9i0y` (`dpl_form_id`);

--
-- Indexes for table `license_entries`
--
ALTER TABLE `license_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK32em2ghwgfi8hqe5qomdtdmk7` (`dpl_license_id`),
  ADD KEY `FKonvtej1c3uxj5iypm1fcyu9uh` (`po_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhqyex5bfmuy02ny0j2b3ax0ay` (`parent_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkpbbe7f4ptnnpmf5hnalvygtm` (`team_id`),
  ADD KEY `FK9y21adhxn0ayjhfocscqox7bh` (`user_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_lwrq427j2idkadsjddbb16mr9` (`po_number`),
  ADD KEY `FK2nr8fif8p7m43pvpefohoqq17` (`created_by_id`),
  ADD KEY `FK2m4wdomjwyrx1i7u8ics8swvx` (`dpl_location`),
  ADD KEY `FKk3gn3m52v5w8h9v46feeq2dpk` (`parent_id`),
  ADD KEY `FK9brdctiwten2o0a8yhy524pex` (`customer`),
  ADD KEY `FKbj42smsl1y8ijrv14l0bpr4ib` (`customer_circle_id`);

--
-- Indexes for table `purchase_order_freq_letter`
--
ALTER TABLE `purchase_order_freq_letter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5scufcdd691b29h6jlq3l0ghx` (`po_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKonhi8iyxnluh90si27ejp9d2x` (`po_id`);

--
-- Indexes for table `purchase_order_revisions`
--
ALTER TABLE `purchase_order_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK156f4kugcgy6q6f41j61fc1xi` (`po_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsorcqlxdy4lyb9wglx8tf4tbe` (`assigned_to_team`),
  ADD KEY `FKotcvwxumwt5vptdfd8wxdj30b` (`delivered_to_team`),
  ADD KEY `FK247u3ij3v4rcr6wx8gefr1q96` (`task_template_id`),
  ADD KEY `FKnq7c6jrjyhi63vifddpdga3kc` (`po_id`),
  ADD KEY `FK58mbwk7wudr7rr81dfoqxwwx6` (`dpl_license_id`);

--
-- Indexes for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK61rbys707oyuk5yy3frd8pb80` (`dpl_license_id`),
  ADD KEY `FK4yoae71crll9eej0npm51nms6` (`po_id`);

--
-- Indexes for table `task_revisions`
--
ALTER TABLE `task_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7ukgs5qe5trgfwkj0wj7m3dkq` (`receiver_id`),
  ADD KEY `FK954443n08j9av4wuoiqw18stl` (`sender_id`),
  ADD KEY `FK4d6ynqs76r94m9wv95v2n3fb9` (`task_id`);

--
-- Indexes for table `task_revision_attachments`
--
ALTER TABLE `task_revision_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjrw47xenpqoaw38g9oytco2wt` (`task_revision_id`);

--
-- Indexes for table `task_template`
--
ALTER TABLE `task_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb9ori4d7qapn919ta3nxa9pk2` (`assigned_to_team`),
  ADD KEY `FK8k9u0vyh95f7k7qx2et8k1cgj` (`delivered_to_team`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_modules_mapping`
--
ALTER TABLE `team_modules_mapping`
  ADD KEY `FK32uic2y5bie4m1a034xmvwx4o` (`module_id`),
  ADD KEY `FKlfdm2ch7t1ih138mdanbyt0di` (`team_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD KEY `FKhn2tnbh9fqjqeuv8ehw5ple7a` (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `circle`
--
ALTER TABLE `circle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_circle`
--
ALTER TABLE `customer_circle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customer_user_mapping`
--
ALTER TABLE `customer_user_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dpl_form`
--
ALTER TABLE `dpl_form`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dpl_license`
--
ALTER TABLE `dpl_license`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dpl_license_freq_letter`
--
ALTER TABLE `dpl_license_freq_letter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dpl_location`
--
ALTER TABLE `dpl_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dpl_undertaking_form`
--
ALTER TABLE `dpl_undertaking_form`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dpl_undertaking_freq`
--
ALTER TABLE `dpl_undertaking_freq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license_entries`
--
ALTER TABLE `license_entries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_freq_letter`
--
ALTER TABLE `purchase_order_freq_letter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_revisions`
--
ALTER TABLE `purchase_order_revisions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_attachments`
--
ALTER TABLE `task_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_revisions`
--
ALTER TABLE `task_revisions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_revision_attachments`
--
ALTER TABLE `task_revision_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_template`
--
ALTER TABLE `task_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_circle`
--
ALTER TABLE `customer_circle`
  ADD CONSTRAINT `FK4n6wds18v5vj4gfnjvp29c3ok` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `customer_user_mapping`
--
ALTER TABLE `customer_user_mapping`
  ADD CONSTRAINT `FK6i03uwm92qh1ixqjg1vuaawhh` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKebdnhu74n14850vws7514vf1e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dpl_form`
--
ALTER TABLE `dpl_form`
  ADD CONSTRAINT `FK5i14fkis3a6dxonwgd23nelyw` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKgeaqkgeibtdx219v7key3k3pm` FOREIGN KEY (`dpl_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dpl_license`
--
ALTER TABLE `dpl_license`
  ADD CONSTRAINT `FK2l9ojanmf1qq0shumgwimdxwg` FOREIGN KEY (`customer_circle`) REFERENCES `customer_circle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKla0g9ptj6mfvnylojlmuy5rsq` FOREIGN KEY (`dpl_location`) REFERENCES `dpl_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKpcirap145fa2smy83nf47cgu2` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dpl_license_freq_letter`
--
ALTER TABLE `dpl_license_freq_letter`
  ADD CONSTRAINT `FK1t6xeeopmawqk0is21r9bv5x1` FOREIGN KEY (`dpl_license_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dpl_undertaking_form`
--
ALTER TABLE `dpl_undertaking_form`
  ADD CONSTRAINT `FK1dene6ruapjt74uos1tm3t7a9` FOREIGN KEY (`dpl_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKtrahhw1txyeeg08vbqyg4ywkl` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dpl_undertaking_freq`
--
ALTER TABLE `dpl_undertaking_freq`
  ADD CONSTRAINT `FKo0tspcpwg6d2ycb0h7l5j9i0y` FOREIGN KEY (`dpl_form_id`) REFERENCES `dpl_undertaking_form` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `license_entries`
--
ALTER TABLE `license_entries`
  ADD CONSTRAINT `FK32em2ghwgfi8hqe5qomdtdmk7` FOREIGN KEY (`dpl_license_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKonvtej1c3uxj5iypm1fcyu9uh` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `FKhqyex5bfmuy02ny0j2b3ax0ay` FOREIGN KEY (`parent_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK9y21adhxn0ayjhfocscqox7bh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKkpbbe7f4ptnnpmf5hnalvygtm` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `FK2m4wdomjwyrx1i7u8ics8swvx` FOREIGN KEY (`dpl_location`) REFERENCES `dpl_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK2nr8fif8p7m43pvpefohoqq17` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK9brdctiwten2o0a8yhy524pex` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKbj42smsl1y8ijrv14l0bpr4ib` FOREIGN KEY (`customer_circle_id`) REFERENCES `customer_circle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKk3gn3m52v5w8h9v46feeq2dpk` FOREIGN KEY (`parent_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_freq_letter`
--
ALTER TABLE `purchase_order_freq_letter`
  ADD CONSTRAINT `FK5scufcdd691b29h6jlq3l0ghx` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `FKonhi8iyxnluh90si27ejp9d2x` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_revisions`
--
ALTER TABLE `purchase_order_revisions`
  ADD CONSTRAINT `FK156f4kugcgy6q6f41j61fc1xi` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK247u3ij3v4rcr6wx8gefr1q96` FOREIGN KEY (`task_template_id`) REFERENCES `task_template` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK58mbwk7wudr7rr81dfoqxwwx6` FOREIGN KEY (`dpl_license_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKnq7c6jrjyhi63vifddpdga3kc` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKotcvwxumwt5vptdfd8wxdj30b` FOREIGN KEY (`delivered_to_team`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKsorcqlxdy4lyb9wglx8tf4tbe` FOREIGN KEY (`assigned_to_team`) REFERENCES `team` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD CONSTRAINT `FK4yoae71crll9eej0npm51nms6` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK61rbys707oyuk5yy3frd8pb80` FOREIGN KEY (`dpl_license_id`) REFERENCES `dpl_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_revisions`
--
ALTER TABLE `task_revisions`
  ADD CONSTRAINT `FK4d6ynqs76r94m9wv95v2n3fb9` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK7ukgs5qe5trgfwkj0wj7m3dkq` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK954443n08j9av4wuoiqw18stl` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_revision_attachments`
--
ALTER TABLE `task_revision_attachments`
  ADD CONSTRAINT `FKjrw47xenpqoaw38g9oytco2wt` FOREIGN KEY (`task_revision_id`) REFERENCES `task_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_template`
--
ALTER TABLE `task_template`
  ADD CONSTRAINT `FK8k9u0vyh95f7k7qx2et8k1cgj` FOREIGN KEY (`delivered_to_team`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKb9ori4d7qapn919ta3nxa9pk2` FOREIGN KEY (`assigned_to_team`) REFERENCES `team` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_modules_mapping`
--
ALTER TABLE `team_modules_mapping`
  ADD CONSTRAINT `FK32uic2y5bie4m1a034xmvwx4o` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `FKlfdm2ch7t1ih138mdanbyt0di` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKhn2tnbh9fqjqeuv8ehw5ple7a` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
