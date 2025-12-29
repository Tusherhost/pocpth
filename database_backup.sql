SET foreign_key_checks = 0;
#
# TABLE STRUCTURE FOR: ac_accounts
#

DROP TABLE IF EXISTS `ac_accounts`;

CREATE TABLE `ac_accounts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `sort_code` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `account_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `account_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `balance` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `delete_bit` int(1) DEFAULT 0,
  `account_selection_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `paymenttypes_id` int(1) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `expense_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `paymenttypes_id` (`paymenttypes_id`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `expense_id` (`expense_id`),
  CONSTRAINT `ac_accounts_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_2` FOREIGN KEY (`paymenttypes_id`) REFERENCES `db_paymenttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_5` FOREIGN KEY (`expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ac_moneydeposits
#

DROP TABLE IF EXISTS `ac_moneydeposits`;

CREATE TABLE `ac_moneydeposits` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_account_id` (`debit_account_id`),
  KEY `to_account_id` (`credit_account_id`),
  KEY `db_moneydeposits_ibfk_3` (`store_id`),
  CONSTRAINT `ac_moneydeposits_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneydeposits_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneydeposits_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ac_moneytransfer
#

DROP TABLE IF EXISTS `ac_moneytransfer`;

CREATE TABLE `ac_moneytransfer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL,
  `transfer_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_account_id` (`debit_account_id`),
  KEY `to_account_id` (`credit_account_id`),
  KEY `db_moneytransfer_ibfk_3` (`store_id`),
  CONSTRAINT `ac_moneytransfer_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneytransfer_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneytransfer_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ac_transactions
#

DROP TABLE IF EXISTS `ac_transactions`;

CREATE TABLE `ac_transactions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `debit_account_id` int(5) DEFAULT NULL,
  `credit_account_id` int(5) DEFAULT NULL,
  `debit_amt` double(20,4) DEFAULT NULL,
  `credit_amt` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `ref_accounts_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneytransfer_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneydeposits_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_salespayments_id` int(5) DEFAULT NULL,
  `ref_salespaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_purchasepayments_id` int(5) DEFAULT NULL,
  `ref_purchasepaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_expense_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_id` (`transaction_type`),
  KEY `account_id` (`debit_account_id`),
  KEY `store_id` (`store_id`),
  KEY `ac_accounts_id` (`ref_accounts_id`),
  KEY `ac_moneytransfer_id` (`ref_moneytransfer_id`),
  KEY `ac_moneydeposits_id` (`ref_moneydeposits_id`),
  KEY `customer_id` (`customer_id`),
  KEY `ref_salespayments_id` (`ref_salespayments_id`),
  KEY `ref_purchasepayments_id` (`ref_purchasepayments_id`),
  KEY `ref_purchasepaymentsreturn_id` (`ref_purchasepaymentsreturn_id`),
  KEY `ac_transactions_ibfk_9` (`ref_salespaymentsreturn_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `ref_expense_id` (`ref_expense_id`),
  CONSTRAINT `ac_transactions_ibfk_10` FOREIGN KEY (`ref_purchasepayments_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_11` FOREIGN KEY (`ref_purchasepaymentsreturn_id`) REFERENCES `db_purchasepaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_12` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_13` FOREIGN KEY (`ref_expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_4` FOREIGN KEY (`ref_accounts_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_5` FOREIGN KEY (`ref_moneytransfer_id`) REFERENCES `ac_moneytransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_6` FOREIGN KEY (`ref_moneydeposits_id`) REFERENCES `ac_moneydeposits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_7` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_8` FOREIGN KEY (`ref_salespayments_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_9` FOREIGN KEY (`ref_salespaymentsreturn_id`) REFERENCES `db_salespaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ci_sessions
#

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5bspqbrum7dgj3vpmneqe367g1jf3rm2', '::1', 1753029014, '__ci_last_regenerate|i:1753028944;currency_placement|s:4:\"Left\";currency_code|N;view_date|s:10:\"dd-mm-yyyy\";view_time|s:2:\"12\";decimals|s:1:\"3\";qty_decimals|s:1:\"2\";store_name|s:14:\"Shohoz Digital\";inv_username|s:11:\"user_479448\";user_lname|s:6:\"Morris\";inv_userid|s:1:\"2\";logged_in|b:1;role_id|s:1:\"2\";role_name|s:11:\"Store Admin\";store_id|s:1:\"2\";email|s:17:\"admin@example.com\";language|s:7:\"English\";language_id|s:1:\"1\";currency|s:8:\"&#2547; \";');


#
# TABLE STRUCTURE FOR: db_bankdetails
#

DROP TABLE IF EXISTS `db_bankdetails`;

CREATE TABLE `db_bankdetails` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `holder_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IFSC or Bank Code',
  `account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_bankdetails_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_bankdetails` (`id`, `store_id`, `country_id`, `holder_name`, `bank_name`, `branch_name`, `code`, `account_type`, `account_number`, `other_details`, `description`, `status`) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);


#
# TABLE STRUCTURE FOR: db_brands
#

DROP TABLE IF EXISTS `db_brands`;

CREATE TABLE `db_brands` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `brand_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_brands_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_brands_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_category
#

DROP TABLE IF EXISTS `db_category`;

CREATE TABLE `db_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create category Code',
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_category` (`id`, `store_id`, `count_id`, `category_code`, `category_name`, `description`, `company_id`, `status`) VALUES (82, 2, 1, 'CT/02/0001', 'Electronics', '', NULL, 1);


#
# TABLE STRUCTURE FOR: db_cobpayments
#

DROP TABLE IF EXISTS `db_cobpayments`;

CREATE TABLE `db_cobpayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_company
#

DROP TABLE IF EXISTS `db_company`;

CREATE TABLE `db_company` (
  `id` double DEFAULT NULL,
  `company_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `sales_terms_and_conditions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_company` (`id`, `company_code`, `company_name`, `company_website`, `mobile`, `phone`, `email`, `website`, `company_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `invoice_view`, `status`, `sms_status`, `sales_terms_and_conditions`) VALUES ('1', '', 'Company Name', NULL, '9999999999', '', 'admin@example.com', '', 'company_logo.png', 'logo-0.png', NULL, NULL, 'India', 'Karnataka', 'Belgaum', 'Address Details', '', '', '', '', '', 1, 'CT', 'IT', 'SP', 'PU', 'PR', 'CU', 'SL', 'PR', 'EX', 1, 1, 0, NULL);


#
# TABLE STRUCTURE FOR: db_country
#

DROP TABLE IF EXISTS `db_country`;

CREATE TABLE `db_country` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `country` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (1, 'Abkhazia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (2, 'Afghanistan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (3, 'Albania', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (4, 'Algeria', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (5, 'Andorra', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (6, 'Angola', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (7, 'Antigua and Barbuda', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (8, 'Argentina', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (9, 'Armenia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (10, 'Australia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (11, 'Austria', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (12, 'Azerbaijan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (13, 'Bahamas', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (14, 'Bahrain', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (15, 'Bangladesh', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (16, 'Barbados', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (17, 'Belarus', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (18, 'Belgium', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (19, 'Belize', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (20, 'Benin', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (21, 'Bhutan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (22, 'Bolivia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (23, 'Bosnia and Herzegovina', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (24, 'Botswana', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (25, 'Brazil', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (26, 'Brunei', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (27, 'Bulgaria', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (28, 'Burkina Faso', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (29, 'Burma', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (30, 'Burundi', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (31, 'Cambodia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (32, 'Cameroon', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (33, 'Canada', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (34, 'Cape Verde', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (35, 'Central African Republic', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (36, 'Chad', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (37, 'Chile', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (38, 'China', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (39, 'Colombia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (40, 'Comoros', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (41, 'Congo', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (42, 'Cook Islands', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (43, 'Costa Rica', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (44, 'Croatia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (45, 'Cuba', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (46, 'Cyprus', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (47, 'Czech Republic', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (48, 'C?te d\'Ivoire', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (49, 'Denmark', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (50, 'Djibouti', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (51, 'Dominica', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (52, 'Dominican Republic', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (53, 'East Timor', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (54, 'Ecuador', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (55, 'Egypt', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (56, 'El Salvador', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (57, 'Equatorial Guinea', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (58, 'Eritrea', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (59, 'Estonia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (60, 'Ethiopia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (61, 'Fiji', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (62, 'Finland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (63, 'France', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (64, 'Gabon', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (65, 'Gambia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (66, 'Georgia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (67, 'Germany', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (68, 'Ghana', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (69, 'Greece', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (70, 'Grenada', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (71, 'Guatemala', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (72, 'Guinea', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (73, 'Guinea-Bissau', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (74, 'Guyana', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (75, 'Haiti', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (76, 'Honduras', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (77, 'Hungary', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (78, 'Iceland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (79, 'India', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (80, 'Indonesia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (81, 'Iran', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (82, 'Iraq', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (83, 'Ireland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (84, 'Israel', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (85, 'Italy', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (86, 'Ivory Coast', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (87, 'Jamaica', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (88, 'Japan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (89, 'Jordan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (90, 'Kazakhstan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (91, 'Kenya', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (92, 'Kiribati', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (93, 'Korea, North', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (94, 'Korea, South', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (95, 'Kosovo', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (96, 'Kuwait', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (97, 'Kyrgyzstan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (98, 'Laos', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (99, 'Latvia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (100, 'Lebanon', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (101, 'Lesotho', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (102, 'Liberia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (103, 'Libya', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (104, 'Liechtenstein', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (105, 'Lithuania', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (106, 'Luxembourg', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (107, 'Macedonia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (108, 'Madagascar', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (109, 'Malawi', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (110, 'Malaysia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (111, 'Maldives', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (112, 'Mali', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (113, 'Malta', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (114, 'Marshall Islands', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (115, 'Mauritania', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (116, 'Mauritius', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (117, 'Mexico', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (118, 'Micronesia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (119, 'Moldova', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (120, 'Monaco', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (121, 'Mongolia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (122, 'Montenegro', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (123, 'Morocco', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (124, 'Mozambique', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (125, 'Myanmar / Burma', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (126, 'Nagorno-Karabakh', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (127, 'Namibia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (128, 'Nauru', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (129, 'Nepal', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (130, 'Netherlands', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (131, 'New Zealand', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (132, 'Nicaragua', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (133, 'Niger', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (134, 'Nigeria', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (135, 'Niue', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (136, 'Northern Cyprus', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (137, 'Norway', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (138, 'Oman', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (139, 'Pakistan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (140, 'Palau', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (141, 'Palestine', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (142, 'Panama', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (143, 'Papua New Guinea', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (144, 'Paraguay', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (145, 'Peru', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (146, 'Philippines', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (147, 'Poland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (148, 'Portugal', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (149, 'Qatar', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (150, 'Romania', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (151, 'Russia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (152, 'Rwanda', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (153, 'Sahrawi Arab Democratic Republic', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (154, 'Saint Kitts and Nevis', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (155, 'Saint Lucia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (156, 'Saint Vincent and the Grenadines', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (157, 'Samoa', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (158, 'San Marino', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (159, 'Saudi Arabia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (160, 'Senegal', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (161, 'Serbia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (162, 'Seychelles', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (163, 'Sierra Leone', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (164, 'Singapore', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (165, 'Slovakia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (166, 'Slovenia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (167, 'Solomon Islands', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (168, 'Somalia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (169, 'Somaliland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (170, 'South Africa', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (171, 'South Ossetia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (172, 'Spain', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (173, 'Sri Lanka', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (174, 'Sudan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (175, 'Suriname', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (176, 'Swaziland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (177, 'Sweden', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (178, 'Switzerland', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (179, 'Syria', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (180, 'S?o Tom? and Pr?ncipe', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (181, 'Taiwan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (182, 'Tajikistan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (183, 'Tanzania', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (184, 'Thailand', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (185, 'Timor-Leste / East Timor', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (186, 'Togo', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (187, 'Tonga', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (188, 'Trinidad and Tobago', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (189, 'Tunisia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (190, 'Turkey', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (191, 'Turkmenistan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (192, 'Tuvalu', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (193, 'Uganda', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (194, 'Ukraine', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (195, 'United Arab Emirates', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (196, 'United Kingdom', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (197, 'United States', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (198, 'Uruguay', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (199, 'Uzbekistan', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (200, 'Vanuatu', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (201, 'Vatican City', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (202, 'Venezuela', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (203, 'Vietnam', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (204, 'Yemen', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (205, 'Zambia', '2020-11-03', 1);
INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES (206, 'Zimbabwe', '2020-11-03', 1);


#
# TABLE STRUCTURE FOR: db_coupons
#

DROP TABLE IF EXISTS `db_coupons`;

CREATE TABLE `db_coupons` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_currency
#

DROP TABLE IF EXISTS `db_currency`;

CREATE TABLE `db_currency` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `symbol` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (1, 'Bulgaria-Bulgarian lev(BGN)', NULL, 'лв', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (2, 'Switzerland \r-Swiss franc (CHF)', NULL, 'CHF', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (3, 'Czechia-Czech koruna(CZK))', NULL, 'Kč ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (4, 'Denmark-Danish krone(DKK)', NULL, 'kr ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (5, 'Euro area countries -Euro(EUR)', NULL, '€ ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (6, 'United Kingdom-Pounds sterling (GBP)', NULL, '£', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (7, 'Croatia -Croatian Kuna (HRK)', NULL, 'kn', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (8, 'Georgia -Georgian lari (GEL)', NULL, '&#8382;', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (9, 'Hungary -Hungarian forint (HUF)', NULL, 'ft', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (10, 'Norway -Norwegian krone (NOK)', NULL, 'kr', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (11, 'Poland -Polish zloty (PLN)', NULL, 'zł ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (12, 'Russia -Russian ruble (RUB)', NULL, '&#8381; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (13, 'Romania -Romanian leu (RON)', NULL, 'lei', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (14, 'Sweden - Swedish krona (SEK)', NULL, 'kr', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (15, 'Turkey -Turkish lira (TRY)', NULL, '&#8378; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (16, 'Ukraine - Ukrainian hryvna  (UAH)', NULL, '₴ ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (17, 'UAE -Emirati dirham (AED)', NULL, 'د.إ ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (18, 'Israel - Israeli shekel (ILS)', NULL, '&#8362; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (19, 'Kenya - Kenyan shilling(KES)', NULL, 'Ksh', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (20, 'Morocco - Moroccan dirham (MAD)', NULL, '.د.م ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (21, 'Nigeria - Nigerian naira (NGN)', NULL, '₦ ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (22, 'South Africa -South african rand** (ZAR)', NULL, 'R', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (23, 'Brazil- Brazilian real(BRL)', NULL, 'R$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (24, 'Canada-Canadian dollars (CAD)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (25, 'Chile -Chilean peso (CLP)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (26, 'Colombia -Colombian peso (COP)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (27, 'Mexico - Mexican peso (MXN)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (28, 'Peru -Peruvian sol(PEN)', NULL, 'S/. ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (29, 'USA -US dollar (USD)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (30, 'Australia -Australian dollars (AUD)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (31, 'Bangladesh -Bangladeshi taka (BDT) ', NULL, '&#2547; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (32, 'China - Chinese yuan (CNY)', NULL, '&#20803; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (33, 'Hong Kong - Hong Kong dollar(HKD)', NULL, '&#36; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (34, 'Indonesia - Indonesian rupiah (IDR)', NULL, 'Rp', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (35, 'India - Indian rupee', 'INR', '₹', '?', 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (36, 'Japan - Japanese yen (JPY)', NULL, '¥', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (37, 'Malaysia - Malaysian ringgit (MYR)', NULL, 'RM', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (38, 'New Zealand - New Zealand dollar (NZD)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (39, 'Philippines- Philippine peso (PHP)', NULL, '₱ ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (40, 'Pakistan- Pakistani rupee (PKR)', NULL, 'Rs ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (41, 'Singapore - Singapore dollar (SGD)', NULL, '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (42, 'South Korea - South Korean won (KRW)', NULL, '&#8361; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (43, 'Sri Lanka - Sri Lankan rupee (LKR)', NULL, 'Rs', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (44, 'Thailand- Thai baht (THB)', NULL, '&#3647; ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (45, 'Vietnam - Vietnamese dong', 'VND', '₫', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (46, 'Bitcoin - BTC or XBT', 'BTC ', '₿', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (47, 'Ripples', 'XRP', 'XRP', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (48, 'Monero', 'XMR', 'ɱ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (49, 'Litecoin', 'LTC', 'Ł', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (50, 'Ethereum', 'ETH', 'Ξ', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (51, 'Euro', 'EUR', '€', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (52, 'Pounds sterling', 'GBP', '£', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (53, 'US dollar', 'USD', '$', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (54, 'Japanese yen', 'JPY', '¥', NULL, 1);
INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES (55, 'Omani rial', 'OMR', 'ر.ع.', NULL, 1);


#
# TABLE STRUCTURE FOR: db_custadvance
#

DROP TABLE IF EXISTS `db_custadvance`;

CREATE TABLE `db_custadvance` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_custadvance_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_custadvance_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_customer_coupons
#

DROP TABLE IF EXISTS `db_customer_coupons`;

CREATE TABLE `db_customer_coupons` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_customer_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_customer_payments
#

DROP TABLE IF EXISTS `db_customer_payments`;

CREATE TABLE `db_customer_payments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `salespayment_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `salespayment_id` (`salespayment_id`),
  CONSTRAINT `db_customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_payments_ibfk_2` FOREIGN KEY (`salespayment_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_customers
#

DROP TABLE IF EXISTS `db_customers`;

CREATE TABLE `db_customers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Customer Code',
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `sales_due` double(20,4) DEFAULT NULL,
  `sales_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(50) DEFAULT NULL,
  `state_id` int(50) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country_id` int(5) DEFAULT NULL,
  `ship_state_id` int(5) DEFAULT NULL,
  `ship_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `location_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_level_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Increase',
  `price_level` double(20,4) DEFAULT 0.0000,
  `delete_bit` int(1) DEFAULT 0,
  `tot_advance` double(20,4) DEFAULT NULL,
  `credit_limit` double(20,4) DEFAULT -1.0000,
  `shippingaddress_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_customers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_customers` (`id`, `store_id`, `count_id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `ship_country_id`, `ship_state_id`, `ship_city`, `ship_postcode`, `ship_address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `location_link`, `attachment_1`, `price_level_type`, `price_level`, `delete_bit`, `tot_advance`, `credit_limit`, `shippingaddress_id`) VALUES (1, 1, NULL, 'CU0001', 'Walk-in customer', NULL, '', '', '', '', NULL, '0.0000', '0.0000', '0.0000', 1, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01', '10:55:54 pm', 'admin', NULL, 1, NULL, NULL, 'Increase', '0.0000', 1, NULL, '-1.0000', 1);
INSERT INTO `db_customers` (`id`, `store_id`, `count_id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `ship_country_id`, `ship_state_id`, `ship_city`, `ship_postcode`, `ship_address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `location_link`, `attachment_1`, `price_level_type`, `price_level`, `delete_bit`, `tot_advance`, `credit_limit`, `shippingaddress_id`) VALUES (2, 2, 1, 'CU/02/0001', 'Walk-in customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-02-12', '05:53:37 pm', '', NULL, 1, NULL, NULL, 'Increase', '0.0000', 1, '0.0000', '-1.0000', 2);


#
# TABLE STRUCTURE FOR: db_emailtemplates
#

DROP TABLE IF EXISTS `db_emailtemplates`;

CREATE TABLE `db_emailtemplates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL,
  `admin_only` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_emailtemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_emailtemplates` (`id`, `store_id`, `key`, `template_name`, `content`, `variables`, `status`, `undelete_bit`, `admin_only`) VALUES (1, 1, 'SAAS_FORGOT_PASSWORD_EMAIL', 'Site forgot password email template', 'Hi {{user_name}},\r\n\r\nyour OTP is {{email_otp}}\r\n\r\nThank you\r\n{{saas_name}}', '{{user_name}}<br>\r\n{{saas_name}}<br>\r\n{{email_otp}}<br>', 1, 1, 1);
INSERT INTO `db_emailtemplates` (`id`, `store_id`, `key`, `template_name`, `content`, `variables`, `status`, `undelete_bit`, `admin_only`) VALUES (2, 1, 'SAAS_WELCOME_EMAIL', 'Site welcome email', 'Hi {{user_name}},\r\nYour email id {{email_id}},\r\nwelcome to our {{saas_name}},\r\n\r\nThank you', '{{user_name}}<br>\r\n{{email_id}}<br>\r\n{{saas_name}}<br>', 1, 1, 1);


#
# TABLE STRUCTURE FOR: db_expense
#

DROP TABLE IF EXISTS `db_expense`;

CREATE TABLE `db_expense` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Expense Code',
  `expense_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_amt` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `db_expense_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_expense_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_expense_category
#

DROP TABLE IF EXISTS `db_expense_category`;

CREATE TABLE `db_expense_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_expense_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_fivemojo
#

DROP TABLE IF EXISTS `db_fivemojo`;

CREATE TABLE `db_fivemojo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `instance_id` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_fivemojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_hold
#

DROP TABLE IF EXISTS `db_hold`;

CREATE TABLE `db_hold` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temprary',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_hold_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_hold_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_hold_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_holditems
#

DROP TABLE IF EXISTS `db_holditems`;

CREATE TABLE `db_holditems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `hold_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`hold_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `db_holditems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_holditems_ibfk_2` FOREIGN KEY (`hold_id`) REFERENCES `db_hold` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_holditems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_instamojo
#

DROP TABLE IF EXISTS `db_instamojo`;

CREATE TABLE `db_instamojo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `api_key` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `api_token` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_instamojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_instamojo` (`id`, `store_id`, `sandbox`, `api_key`, `api_token`, `updated_at`, `updated_by`, `status`) VALUES (1, 1, 1, '', '', '2021-02-22', 'Admin', 1);


#
# TABLE STRUCTURE FOR: db_instamojopayments
#

DROP TABLE IF EXISTS `db_instamojopayments`;

CREATE TABLE `db_instamojopayments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `purpose` text CHARACTER SET utf8 DEFAULT NULL,
  `expires_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `send_sms` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `send_email` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `sms_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shorturl` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `longurl` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `redirect_url` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `webhook` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `allow_repeated_payments` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `customer_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modified_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_items
#

DROP TABLE IF EXISTS `db_items`;

CREATE TABLE `db_items` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create ITEM Code',
  `item_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sac` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_margin` double(20,2) DEFAULT NULL,
  `sales_price` double(20,4) DEFAULT NULL,
  `stock` double(20,2) DEFAULT NULL,
  `item_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Percentage',
  `discount` double(20,2) DEFAULT 0.00,
  `service_bit` int(1) DEFAULT 0,
  `seller_points` double(20,2) DEFAULT 0.00,
  `custom_barcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `variant_id` int(5) DEFAULT NULL,
  `child_bit` int(1) DEFAULT 0,
  `mrp` double(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_items_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_items` (`id`, `store_id`, `count_id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `sac`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`, `service_bit`, `seller_points`, `custom_barcode`, `description`, `item_group`, `parent_id`, `variant_id`, `child_bit`, `mrp`) VALUES (1, 2, 1, 'IT020001', 'Sandisk 32GB USB 2.0 Flash Drive', 82, '', '', NULL, 61, 0, 0, NULL, NULL, '1.5000', 149, '1.5000', 'Inclusive', '86.67', '2.8000', '100.00', NULL, '37.28.46.147', 'dynamic.isp.ooredoo.om', '2022-08-09', '12:00:19 pm', 'Chris', NULL, 1, 'Percentage', '0.00', 0, '0.00', '619659069193', '', 'Single', NULL, NULL, 0, '0.0000');
INSERT INTO `db_items` (`id`, `store_id`, `count_id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `sac`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`, `service_bit`, `seller_points`, `custom_barcode`, `description`, `item_group`, `parent_id`, `variant_id`, `child_bit`, `mrp`) VALUES (2, 2, 2, 'IT020002', 'Imation 64GB Flash Drive', 82, '', '', NULL, 61, 0, 0, NULL, NULL, '2.0000', 149, '2.0000', 'Inclusive', '95.00', '3.9000', '120.00', NULL, '37.28.46.147', 'dynamic.isp.ooredoo.om', '2022-08-09', '01:38:51 pm', 'Chris', NULL, 1, 'Percentage', '0.00', 0, '0.00', '3536403352219', '', 'Single', NULL, NULL, 0, '0.0000');
INSERT INTO `db_items` (`id`, `store_id`, `count_id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `sac`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`, `service_bit`, `seller_points`, `custom_barcode`, `description`, `item_group`, `parent_id`, `variant_id`, `child_bit`, `mrp`) VALUES (3, 2, 3, 'IT020003', 'Sandisk Flash Drive USB C', 82, '', '', NULL, 61, 0, 0, NULL, NULL, '2.5000', 149, '2.5000', 'Inclusive', '100.00', '5.0000', '67.00', NULL, '5.21.237.233', '5.21.237.233', '2022-08-10', '09:23:28 am', 'Chris', NULL, 1, 'Percentage', '0.00', 0, '0.00', '619659142049', '', 'Single', NULL, NULL, 0, '0.0000');


#
# TABLE STRUCTURE FOR: db_languages
#

DROP TABLE IF EXISTS `db_languages`;

CREATE TABLE `db_languages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (1, 'English', 1);
INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (2, 'Russian', 1);
INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (3, 'Spanish', 1);
INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (4, 'Arabic', 1);
INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (5, 'Bangla', 1);
INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES (6, 'French', 1);


#
# TABLE STRUCTURE FOR: db_package
#

DROP TABLE IF EXISTS `db_package`;

CREATE TABLE `db_package` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_price` double(20,2) DEFAULT NULL,
  `annual_price` double(20,2) DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `plan_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_package_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_package` (`id`, `store_id`, `package_type`, `package_code`, `package_name`, `description`, `monthly_price`, `annual_price`, `trial_days`, `max_users`, `max_items`, `max_invoices`, `max_warehouses`, `expire_date`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `status`, `plan_type`) VALUES (1, 1, 'Free', NULL, 'Free', 'Test description', '0.00', '0.00', 10, 2, 20, 20, 2, '2021-01-14', '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-13', '06:37:21 pm', 'admin', 1, NULL);
INSERT INTO `db_package` (`id`, `store_id`, `package_type`, `package_code`, `package_name`, `description`, `monthly_price`, `annual_price`, `trial_days`, `max_users`, `max_items`, `max_invoices`, `max_warehouses`, `expire_date`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `status`, `plan_type`) VALUES (2, 1, 'Paid', NULL, 'Regular', 'Test description', '250.00', '2000.00', 15, 20, 200, 200, 20, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-13', '06:39:23 pm', 'admin', 1, NULL);
INSERT INTO `db_package` (`id`, `store_id`, `package_type`, `package_code`, `package_name`, `description`, `monthly_price`, `annual_price`, `trial_days`, `max_users`, `max_items`, `max_invoices`, `max_warehouses`, `expire_date`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `status`, `plan_type`) VALUES (3, 1, 'Paid', NULL, 'Ultimate', 'Description', '500.00', '5000.00', 15, -1, -1, -1, -1, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-24', '12:35:30 pm', 'admin', 1, NULL);


#
# TABLE STRUCTURE FOR: db_paymenttypes
#

DROP TABLE IF EXISTS `db_paymenttypes`;

CREATE TABLE `db_paymenttypes` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_paymenttypes_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_paymenttypes` (`id`, `store_id`, `payment_type`, `status`) VALUES (36, 2, 'CASH', 1);


#
# TABLE STRUCTURE FOR: db_paypal
#

DROP TABLE IF EXISTS `db_paypal`;

CREATE TABLE `db_paypal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_paypal_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_paypal` (`id`, `store_id`, `sandbox`, `email`, `updated_at`, `updated_by`, `status`) VALUES (1, 1, 1, '', '2021-02-22', 'Admin', 1);


#
# TABLE STRUCTURE FOR: db_paypalpaylog
#

DROP TABLE IF EXISTS `db_paypalpaylog`;

CREATE TABLE `db_paypalpaylog` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_permissions
#

DROP TABLE IF EXISTS `db_permissions`;

CREATE TABLE `db_permissions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_permissions_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4414, 1, 17, 'items_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4415, 1, 17, 'items_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4416, 1, 17, 'items_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4417, 1, 17, 'items_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4418, 1, 17, 'import_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4419, 1, 17, 'brand_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4420, 1, 17, 'brand_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4421, 1, 17, 'brand_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4422, 1, 17, 'brand_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4423, 1, 17, 'customers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4424, 1, 17, 'customers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4425, 1, 17, 'customers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4426, 1, 17, 'customers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4427, 1, 17, 'sales_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4428, 1, 17, 'sales_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4429, 1, 17, 'sales_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4430, 1, 17, 'sales_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4431, 1, 17, 'sales_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4432, 1, 17, 'sales_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4433, 1, 17, 'sales_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4434, 1, 17, 'sales_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4435, 1, 17, 'sales_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4436, 1, 17, 'items_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4437, 1, 17, 'items_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4438, 1, 17, 'items_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4439, 1, 17, 'items_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4440, 1, 17, 'print_labels');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4441, 1, 17, 'dashboard_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4442, 1, 17, 'dashboard_info_box_1');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4443, 1, 17, 'dashboard_info_box_2');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4444, 1, 17, 'dashboard_pur_sal_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4445, 1, 17, 'dashboard_recent_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4446, 1, 17, 'dashboard_stock_alert');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4447, 1, 17, 'dashboard_trending_items_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4448, 1, 17, 'sales_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4449, 1, 17, 'sales_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4450, 1, 17, 'sales_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4451, 1, 17, 'sales_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4452, 1, 17, 'sales_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4453, 1, 17, 'sales_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4454, 1, 17, 'sales_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4455, 1, 17, 'sales_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4456, 1, 17, 'payment_types_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4457, 1, 17, 'payment_types_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4458, 1, 17, 'payment_types_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4459, 1, 17, 'payment_types_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4460, 1, 17, 'import_customers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4461, 1, 17, 'stock_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4462, 1, 17, 'stock_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4463, 1, 17, 'stock_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4464, 1, 17, 'stock_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4465, 1, 17, 'seller_points_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4466, 1, 17, 'services_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4467, 1, 17, 'services_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4468, 1, 17, 'services_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4469, 1, 17, 'services_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4470, 1, 17, 'import_services');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4471, 1, 17, 'stock_adjustment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4472, 1, 17, 'stock_adjustment_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4473, 1, 17, 'stock_adjustment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4474, 1, 17, 'stock_adjustment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4475, 1, 17, 'variant_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4476, 1, 17, 'variant_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4477, 1, 17, 'variant_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4478, 1, 17, 'variant_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4479, 1, 17, 'accounts_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4480, 1, 17, 'accounts_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4481, 1, 17, 'accounts_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4482, 1, 17, 'accounts_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4483, 1, 17, 'money_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4484, 1, 17, 'money_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4485, 1, 17, 'money_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4486, 1, 17, 'money_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4487, 1, 17, 'money_deposit_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4488, 1, 17, 'money_deposit_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4489, 1, 17, 'money_deposit_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4490, 1, 17, 'money_deposit_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4491, 1, 17, 'sales_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4492, 1, 18, 'tax_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4493, 1, 18, 'tax_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4494, 1, 18, 'tax_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4495, 1, 18, 'tax_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4496, 1, 18, 'units_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4497, 1, 18, 'units_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4498, 1, 18, 'units_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4499, 1, 18, 'units_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4500, 1, 18, 'items_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4501, 1, 18, 'items_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4502, 1, 18, 'items_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4503, 1, 18, 'items_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4504, 1, 18, 'import_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4505, 1, 18, 'brand_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4506, 1, 18, 'brand_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4507, 1, 18, 'brand_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4508, 1, 18, 'brand_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4509, 1, 18, 'suppliers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4510, 1, 18, 'suppliers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4511, 1, 18, 'suppliers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4512, 1, 18, 'suppliers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4513, 1, 18, 'purchase_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4514, 1, 18, 'purchase_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4515, 1, 18, 'purchase_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4516, 1, 18, 'purchase_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4517, 1, 18, 'purchase_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4518, 1, 18, 'purchase_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4519, 1, 18, 'items_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4520, 1, 18, 'items_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4521, 1, 18, 'items_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4522, 1, 18, 'items_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4523, 1, 18, 'print_labels');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4524, 1, 18, 'dashboard_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4525, 1, 18, 'dashboard_info_box_1');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4526, 1, 18, 'dashboard_info_box_2');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4527, 1, 18, 'dashboard_pur_sal_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4528, 1, 18, 'dashboard_recent_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4529, 1, 18, 'dashboard_stock_alert');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4530, 1, 18, 'dashboard_trending_items_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4531, 1, 18, 'purchase_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4532, 1, 18, 'purchase_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4533, 1, 18, 'purchase_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4534, 1, 18, 'purchase_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4535, 1, 18, 'purchase_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4536, 1, 18, 'purchase_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4537, 1, 18, 'purchase_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4538, 1, 18, 'purchase_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4539, 1, 18, 'purchase_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4540, 1, 18, 'purchase_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4541, 1, 18, 'purchase_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4542, 1, 18, 'payment_types_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4543, 1, 18, 'payment_types_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4544, 1, 18, 'payment_types_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4545, 1, 18, 'payment_types_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4546, 1, 18, 'import_suppliers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4547, 1, 18, 'stock_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4548, 1, 18, 'stock_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4549, 1, 18, 'stock_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4550, 1, 18, 'stock_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4551, 1, 18, 'warehouse_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4552, 1, 18, 'warehouse_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4553, 1, 18, 'warehouse_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4554, 1, 18, 'warehouse_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4555, 1, 18, 'services_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4556, 1, 18, 'services_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4557, 1, 18, 'services_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4558, 1, 18, 'services_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4559, 1, 18, 'import_services');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4560, 1, 18, 'stock_adjustment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4561, 1, 18, 'stock_adjustment_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4562, 1, 18, 'stock_adjustment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4563, 1, 18, 'stock_adjustment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4564, 1, 18, 'variant_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4565, 1, 18, 'variant_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4566, 1, 18, 'variant_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4567, 1, 18, 'variant_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4568, 1, 18, 'accounts_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4569, 1, 18, 'accounts_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4570, 1, 18, 'accounts_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4571, 1, 18, 'accounts_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4572, 1, 18, 'money_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4573, 1, 18, 'money_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4574, 1, 18, 'money_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4575, 1, 18, 'money_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4576, 1, 18, 'money_deposit_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4577, 1, 18, 'money_deposit_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4578, 1, 18, 'money_deposit_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4579, 1, 18, 'money_deposit_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (4580, 1, 18, 'purchase_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5818, 1, 2, 'users_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5819, 1, 2, 'users_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5820, 1, 2, 'users_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5821, 1, 2, 'users_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5822, 1, 2, 'tax_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5823, 1, 2, 'tax_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5824, 1, 2, 'tax_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5825, 1, 2, 'tax_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5826, 1, 2, 'store_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5827, 1, 2, 'units_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5828, 1, 2, 'units_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5829, 1, 2, 'units_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5830, 1, 2, 'units_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5831, 1, 2, 'roles_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5832, 1, 2, 'roles_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5833, 1, 2, 'roles_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5834, 1, 2, 'roles_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5835, 1, 2, 'expense_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5836, 1, 2, 'expense_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5837, 1, 2, 'expense_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5838, 1, 2, 'expense_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5839, 1, 2, 'items_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5840, 1, 2, 'items_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5841, 1, 2, 'items_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5842, 1, 2, 'items_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5843, 1, 2, 'import_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5844, 1, 2, 'brand_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5845, 1, 2, 'brand_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5846, 1, 2, 'brand_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5847, 1, 2, 'brand_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5848, 1, 2, 'suppliers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5849, 1, 2, 'suppliers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5850, 1, 2, 'suppliers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5851, 1, 2, 'suppliers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5852, 1, 2, 'customers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5853, 1, 2, 'customers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5854, 1, 2, 'customers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5855, 1, 2, 'customers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5856, 1, 2, 'purchase_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5857, 1, 2, 'purchase_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5858, 1, 2, 'purchase_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5859, 1, 2, 'purchase_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5860, 1, 2, 'sales_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5861, 1, 2, 'sales_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5862, 1, 2, 'sales_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5863, 1, 2, 'sales_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5864, 1, 2, 'sales_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5865, 1, 2, 'sales_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5866, 1, 2, 'sales_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5867, 1, 2, 'sales_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5868, 1, 2, 'purchase_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5869, 1, 2, 'expense_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5870, 1, 2, 'profit_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5871, 1, 2, 'stock_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5872, 1, 2, 'item_sales_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5873, 1, 2, 'purchase_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5874, 1, 2, 'sales_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5875, 1, 2, 'items_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5876, 1, 2, 'items_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5877, 1, 2, 'items_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5878, 1, 2, 'items_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5879, 1, 2, 'print_labels');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5880, 1, 2, 'expense_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5881, 1, 2, 'expense_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5882, 1, 2, 'expense_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5883, 1, 2, 'expense_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5884, 1, 2, 'dashboard_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5885, 1, 2, 'dashboard_info_box_1');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5886, 1, 2, 'dashboard_info_box_2');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5887, 1, 2, 'dashboard_pur_sal_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5888, 1, 2, 'dashboard_recent_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5889, 1, 2, 'dashboard_stock_alert');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5890, 1, 2, 'dashboard_trending_items_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5891, 1, 2, 'send_sms');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5892, 1, 2, 'sms_template_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5893, 1, 2, 'sms_template_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5894, 1, 2, 'sms_api_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5895, 1, 2, 'sms_api_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5896, 1, 2, 'purchase_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5897, 1, 2, 'purchase_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5898, 1, 2, 'purchase_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5899, 1, 2, 'purchase_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5900, 1, 2, 'purchase_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5901, 1, 2, 'sales_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5902, 1, 2, 'sales_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5903, 1, 2, 'sales_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5904, 1, 2, 'sales_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5905, 1, 2, 'sales_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5906, 1, 2, 'sales_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5907, 1, 2, 'sales_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5908, 1, 2, 'sales_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5909, 1, 2, 'purchase_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5910, 1, 2, 'purchase_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5911, 1, 2, 'purchase_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5912, 1, 2, 'purchase_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5913, 1, 2, 'purchase_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5914, 1, 2, 'purchase_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5915, 1, 2, 'payment_types_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5916, 1, 2, 'payment_types_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5917, 1, 2, 'payment_types_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5918, 1, 2, 'payment_types_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5919, 1, 2, 'import_customers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5920, 1, 2, 'import_suppliers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5921, 1, 2, 'stock_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5922, 1, 2, 'stock_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5923, 1, 2, 'stock_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5924, 1, 2, 'stock_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5925, 1, 2, 'warehouse_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5926, 1, 2, 'warehouse_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5927, 1, 2, 'warehouse_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5928, 1, 2, 'warehouse_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5929, 1, 2, 'supplier_items_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5930, 1, 2, 'seller_points_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5931, 1, 2, 'services_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5932, 1, 2, 'services_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5933, 1, 2, 'services_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5934, 1, 2, 'services_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5935, 1, 2, 'quotation_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5936, 1, 2, 'quotation_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5937, 1, 2, 'quotation_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5938, 1, 2, 'quotation_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5939, 1, 2, 'import_services');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5940, 1, 2, 'stock_adjustment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5941, 1, 2, 'stock_adjustment_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5942, 1, 2, 'stock_adjustment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5943, 1, 2, 'stock_adjustment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5944, 1, 2, 'variant_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5945, 1, 2, 'variant_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5946, 1, 2, 'variant_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5947, 1, 2, 'variant_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5948, 1, 2, 'accounts_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5949, 1, 2, 'accounts_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5950, 1, 2, 'accounts_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5951, 1, 2, 'accounts_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5952, 1, 2, 'money_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5953, 1, 2, 'money_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5954, 1, 2, 'money_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5955, 1, 2, 'money_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5956, 1, 2, 'money_deposit_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5957, 1, 2, 'money_deposit_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5958, 1, 2, 'money_deposit_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5959, 1, 2, 'money_deposit_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5960, 1, 2, 'sales_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5961, 1, 2, 'purchase_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5962, 1, 2, 'cash_transactions');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5963, 1, 2, 'show_all_users_sales_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5964, 1, 2, 'show_all_users_sales_return_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5965, 1, 2, 'show_all_users_purchase_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5966, 1, 2, 'show_all_users_purchase_return_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5967, 1, 2, 'show_all_users_expenses');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5968, 1, 2, 'show_all_users_quotations');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5969, 1, 2, 'subscription');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5970, 1, 2, 'smtp_settings');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5971, 1, 2, 'send_email');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5972, 1, 2, 'sms_settings');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5973, 1, 2, 'email_template_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5974, 1, 2, 'email_template_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5975, 1, 2, 'cust_adv_payments_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5976, 1, 2, 'cust_adv_payments_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5977, 1, 2, 'cust_adv_payments_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5978, 1, 2, 'cust_adv_payments_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (5999, 2, 28, 'cust_adv_payments_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6000, 2, 28, 'cust_adv_payments_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6001, 2, 28, 'cust_adv_payments_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6002, 2, 28, 'cust_adv_payments_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6011, 2, 29, 'users_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6012, 2, 29, 'users_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6013, 2, 29, 'users_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6014, 2, 29, 'users_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6015, 2, 29, 'tax_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6016, 2, 29, 'tax_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6017, 2, 29, 'tax_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6018, 2, 29, 'tax_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6019, 2, 29, 'store_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6020, 2, 29, 'units_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6021, 2, 29, 'units_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6022, 2, 29, 'units_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6023, 2, 29, 'units_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6024, 2, 29, 'roles_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6025, 2, 29, 'roles_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6026, 2, 29, 'roles_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6027, 2, 29, 'roles_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6028, 2, 29, 'expense_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6029, 2, 29, 'expense_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6030, 2, 29, 'expense_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6031, 2, 29, 'expense_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6032, 2, 29, 'items_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6033, 2, 29, 'items_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6034, 2, 29, 'items_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6035, 2, 29, 'items_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6036, 2, 29, 'import_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6037, 2, 29, 'brand_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6038, 2, 29, 'brand_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6039, 2, 29, 'brand_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6040, 2, 29, 'brand_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6041, 2, 29, 'suppliers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6042, 2, 29, 'suppliers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6043, 2, 29, 'suppliers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6044, 2, 29, 'suppliers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6045, 2, 29, 'customers_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6046, 2, 29, 'customers_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6047, 2, 29, 'customers_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6048, 2, 29, 'customers_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6049, 2, 29, 'purchase_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6050, 2, 29, 'purchase_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6051, 2, 29, 'purchase_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6052, 2, 29, 'purchase_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6053, 2, 29, 'sales_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6054, 2, 29, 'sales_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6055, 2, 29, 'sales_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6056, 2, 29, 'sales_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6057, 2, 29, 'sales_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6058, 2, 29, 'sales_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6059, 2, 29, 'sales_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6060, 2, 29, 'sales_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6061, 2, 29, 'purchase_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6062, 2, 29, 'expense_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6063, 2, 29, 'profit_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6064, 2, 29, 'stock_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6065, 2, 29, 'item_sales_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6066, 2, 29, 'purchase_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6067, 2, 29, 'sales_payments_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6068, 2, 29, 'items_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6069, 2, 29, 'items_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6070, 2, 29, 'items_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6071, 2, 29, 'items_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6072, 2, 29, 'print_labels');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6073, 2, 29, 'expense_category_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6074, 2, 29, 'expense_category_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6075, 2, 29, 'expense_category_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6076, 2, 29, 'expense_category_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6077, 2, 29, 'dashboard_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6078, 2, 29, 'dashboard_info_box_1');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6079, 2, 29, 'dashboard_info_box_2');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6080, 2, 29, 'dashboard_pur_sal_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6081, 2, 29, 'dashboard_recent_items');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6082, 2, 29, 'dashboard_stock_alert');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6083, 2, 29, 'dashboard_trending_items_chart');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6084, 2, 29, 'send_sms');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6085, 2, 29, 'sms_template_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6086, 2, 29, 'sms_template_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6087, 2, 29, 'sms_api_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6088, 2, 29, 'sms_api_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6089, 2, 29, 'purchase_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6090, 2, 29, 'purchase_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6091, 2, 29, 'purchase_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6092, 2, 29, 'purchase_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6093, 2, 29, 'purchase_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6094, 2, 29, 'sales_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6095, 2, 29, 'sales_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6096, 2, 29, 'sales_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6097, 2, 29, 'sales_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6098, 2, 29, 'sales_return_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6099, 2, 29, 'sales_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6100, 2, 29, 'sales_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6101, 2, 29, 'sales_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6102, 2, 29, 'purchase_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6103, 2, 29, 'purchase_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6104, 2, 29, 'purchase_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6105, 2, 29, 'purchase_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6106, 2, 29, 'purchase_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6107, 2, 29, 'purchase_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6108, 2, 29, 'payment_types_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6109, 2, 29, 'payment_types_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6110, 2, 29, 'payment_types_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6111, 2, 29, 'payment_types_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6112, 2, 29, 'import_customers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6113, 2, 29, 'import_suppliers');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6114, 2, 29, 'stock_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6115, 2, 29, 'stock_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6116, 2, 29, 'stock_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6117, 2, 29, 'stock_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6118, 2, 29, 'warehouse_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6119, 2, 29, 'warehouse_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6120, 2, 29, 'warehouse_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6121, 2, 29, 'warehouse_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6122, 2, 29, 'supplier_items_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6123, 2, 29, 'seller_points_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6124, 2, 29, 'services_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6125, 2, 29, 'services_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6126, 2, 29, 'services_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6127, 2, 29, 'services_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6128, 2, 29, 'quotation_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6129, 2, 29, 'quotation_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6130, 2, 29, 'quotation_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6131, 2, 29, 'quotation_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6132, 2, 29, 'import_services');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6133, 2, 29, 'stock_adjustment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6134, 2, 29, 'stock_adjustment_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6135, 2, 29, 'stock_adjustment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6136, 2, 29, 'stock_adjustment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6137, 2, 29, 'variant_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6138, 2, 29, 'variant_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6139, 2, 29, 'variant_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6140, 2, 29, 'variant_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6141, 2, 29, 'accounts_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6142, 2, 29, 'accounts_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6143, 2, 29, 'accounts_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6144, 2, 29, 'accounts_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6145, 2, 29, 'money_transfer_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6146, 2, 29, 'money_transfer_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6147, 2, 29, 'money_transfer_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6148, 2, 29, 'money_transfer_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6149, 2, 29, 'money_deposit_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6150, 2, 29, 'money_deposit_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6151, 2, 29, 'money_deposit_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6152, 2, 29, 'money_deposit_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6153, 2, 29, 'sales_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6154, 2, 29, 'purchase_tax_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6155, 2, 29, 'cash_transactions');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6156, 2, 29, 'show_all_users_sales_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6157, 2, 29, 'show_all_users_sales_return_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6158, 2, 29, 'show_all_users_purchase_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6159, 2, 29, 'show_all_users_purchase_return_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6160, 2, 29, 'show_all_users_expenses');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6161, 2, 29, 'show_all_users_quotations');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6162, 2, 29, 'smtp_settings');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6163, 2, 29, 'send_email');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6164, 2, 29, 'sms_settings');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6165, 2, 29, 'email_template_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6166, 2, 29, 'email_template_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6167, 2, 29, 'cust_adv_payments_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6168, 2, 29, 'cust_adv_payments_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6169, 2, 29, 'cust_adv_payments_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6170, 2, 29, 'cust_adv_payments_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6179, 1, 2, 'gstr_1_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6180, 1, 2, 'gstr_2_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6181, 1, 2, 'delivery_sheet_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6182, 1, 2, 'load_sheet_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6183, 1, 2, 'show_purchase_price');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6184, 1, 2, 'customer_orders_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6185, 1, 2, 'discountCouponAdd');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6186, 1, 2, 'discountCouponEdit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6187, 1, 2, 'discountCouponDelete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6188, 1, 2, 'discountCouponView');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6189, 2, 2, 'sales_gst_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6190, 2, 2, 'purchase_gst_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6191, 2, 2, 'subscription');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6192, 1, 2, 'customerCouponAdd');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6193, 1, 2, 'customerCouponEdit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6194, 1, 2, 'customerCouponDelete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6195, 1, 2, 'customerCouponView');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6196, 1, 2, 'return_items_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6197, 1, 2, 'help_link');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6198, 2, 31, 'sales_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6199, 2, 31, 'sales_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6200, 2, 31, 'sales_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6201, 2, 31, 'sales_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6202, 2, 31, 'sales_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6203, 2, 31, 'sales_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6204, 2, 31, 'sales_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6205, 2, 31, 'sales_return_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6206, 2, 31, 'sales_return_edit');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6207, 2, 31, 'sales_return_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6208, 2, 31, 'sales_return_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6209, 2, 31, 'sales_return_payment_view');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6210, 2, 31, 'sales_return_payment_add');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6211, 2, 31, 'sales_return_payment_delete');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6212, 2, 31, 'show_all_users_sales_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6213, 2, 31, 'show_all_users_sales_return_invoices');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6214, 2, 31, 'show_purchase_price');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6215, 2, 2, 'recent_sales_invoice_list');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6216, 1, 2, 'stock_transfer_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6217, 1, 2, 'pos');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6218, 1, 2, 'sales_summary_report');
INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES (6219, 1, 2, 'sales_return_payments');


#
# TABLE STRUCTURE FOR: db_purchase
#

DROP TABLE IF EXISTS `db_purchase`;

CREATE TABLE `db_purchase` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Code',
  `purchase_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `purchase_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchase_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchase_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_purchase` (`id`, `store_id`, `warehouse_id`, `count_id`, `purchase_code`, `reference_no`, `purchase_date`, `purchase_status`, `supplier_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `purchase_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `return_bit`) VALUES (1, 2, 2, 1, 'PU0001', '', '2022-08-09', 'Received', 1, NULL, NULL, NULL, NULL, 'in_percentage', NULL, '50.0000', NULL, '50.0000', '', 'Paid', '50.0000', '2022-08-09', '01:59:42 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', NULL, 1, NULL);
INSERT INTO `db_purchase` (`id`, `store_id`, `warehouse_id`, `count_id`, `purchase_code`, `reference_no`, `purchase_date`, `purchase_status`, `supplier_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `purchase_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `return_bit`) VALUES (2, 2, 2, 2, 'PU0002', '', '2022-08-10', 'Received', 1, NULL, NULL, NULL, NULL, 'in_percentage', NULL, '50.0000', NULL, '50.0000', '', 'Paid', '50.0000', '2022-08-10', '09:25:01 am', 'Chris', '5.21.237.233', '5.21.237.233', NULL, 1, NULL);


#
# TABLE STRUCTURE FOR: db_purchaseitems
#

DROP TABLE IF EXISTS `db_purchaseitems`;

CREATE TABLE `db_purchaseitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchaseitems_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_purchaseitems` (`id`, `store_id`, `purchase_id`, `purchase_status`, `item_id`, `purchase_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`, `description`) VALUES (201, 2, 1, 'Received', 2, '25.00', '2.0000', 'Inclusive', 149, '2.3800', 'Percentage', '0.0000', '0.0000', '2.0000', '50.0000', NULL, NULL, 1, '');
INSERT INTO `db_purchaseitems` (`id`, `store_id`, `purchase_id`, `purchase_status`, `item_id`, `purchase_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`, `description`) VALUES (202, 2, 2, 'Received', 3, '20.00', '2.5000', 'Inclusive', 149, '2.3800', 'Percentage', '0.0000', '0.0000', '2.5000', '50.0000', NULL, NULL, 1, '');


#
# TABLE STRUCTURE FOR: db_purchaseitemsreturn
#

DROP TABLE IF EXISTS `db_purchaseitemsreturn`;

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchaseitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchaseitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_purchasepayments
#

DROP TABLE IF EXISTS `db_purchasepayments`;

CREATE TABLE `db_purchasepayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchasepayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepayments_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepayments_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_purchasepayments` (`id`, `count_id`, `payment_code`, `store_id`, `purchase_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`, `account_id`, `supplier_id`, `short_code`) VALUES (108, 1, 'PP0001', 2, 1, '2022-08-09', 'CASH', '50.0000', '', '37.28.46.147', 'dynamic.isp.ooredoo.om', '01:59:42', '2022-08-09', 'Chris', 1, NULL, 1, NULL);
INSERT INTO `db_purchasepayments` (`id`, `count_id`, `payment_code`, `store_id`, `purchase_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`, `account_id`, `supplier_id`, `short_code`) VALUES (109, 2, 'PP0002', 2, 2, '2022-08-10', 'CASH', '50.0000', '', '5.21.237.233', '5.21.237.233', '09:25:01', '2022-08-10', 'Chris', 1, NULL, 1, NULL);


#
# TABLE STRUCTURE FOR: db_purchasepaymentsreturn
#

DROP TABLE IF EXISTS `db_purchasepaymentsreturn`;

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_purchasereturn
#

DROP TABLE IF EXISTS `db_purchasereturn`;

CREATE TABLE `db_purchasereturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Return Code',
  `warehouse_id` int(5) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchasereturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasereturn_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_quotation
#

DROP TABLE IF EXISTS `db_quotation`;

CREATE TABLE `db_quotation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create quotation Code',
  `quotation_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `quotation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'quotation return raised',
  `customer_previous_due` double(20,4) DEFAULT NULL,
  `customer_total_due` double(20,4) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_quotation_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotation_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_quotationitems
#

DROP TABLE IF EXISTS `db_quotationitems`;

CREATE TABLE `db_quotationitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,4) DEFAULT 0.0000,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `quotation_id` (`quotation_id`),
  CONSTRAINT `db_quotationitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotationitems_ibfk_2` FOREIGN KEY (`quotation_id`) REFERENCES `db_quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_roles
#

DROP TABLE IF EXISTS `db_roles`;

CREATE TABLE `db_roles` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_roles_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_roles` (`id`, `store_id`, `role_name`, `description`, `status`) VALUES (1, 1, 'Admin', 'All Rights Permitted.', 1);
INSERT INTO `db_roles` (`id`, `store_id`, `role_name`, `description`, `status`) VALUES (2, 1, 'Store Admin', 'Note: Apply this role for New Store Admin. ', 1);
INSERT INTO `db_roles` (`id`, `store_id`, `role_name`, `description`, `status`) VALUES (31, 2, 'Cashier', '', 1);


#
# TABLE STRUCTURE FOR: db_sales
#

DROP TABLE IF EXISTS `db_sales`;

CREATE TABLE `db_sales` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `init_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_id` decimal(20,0) DEFAULT NULL COMMENT 'Use to create Sales Code',
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised',
  `customer_previous_due` double(20,2) DEFAULT NULL,
  `customer_total_due` double(20,2) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT 0.00,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_sales_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_salesitems
#

DROP TABLE IF EXISTS `db_salesitems`;

CREATE TABLE `db_salesitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,2) DEFAULT 0.00,
  `purchase_price` double(20,3) DEFAULT 0.000,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  CONSTRAINT `db_salesitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesitems_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_salesitemsreturn
#

DROP TABLE IF EXISTS `db_salesitemsreturn`;

CREATE TABLE `db_salesitemsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double(20,3) DEFAULT 0.000,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  CONSTRAINT `db_salesitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_salespayments
#

DROP TABLE IF EXISTS `db_salespayments`;

CREATE TABLE `db_salespayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_adjusted` double(20,4) DEFAULT NULL,
  `cheque_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_period` int(10) DEFAULT NULL,
  `cheque_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `db_salespayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespayments_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespayments_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_salespaymentsreturn
#

DROP TABLE IF EXISTS `db_salespaymentsreturn`;

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `db_salespaymentsreturn_ibfk_3` (`customer_id`),
  CONSTRAINT `db_salespaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespaymentsreturn_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_salesreturn
#

DROP TABLE IF EXISTS `db_salesreturn`;

CREATE TABLE `db_salesreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Sales Return Code',
  `sales_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_salesreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesreturn_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesreturn_ibfk_3` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_shippingaddress
#

DROP TABLE IF EXISTS `db_shippingaddress`;

CREATE TABLE `db_shippingaddress` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  `state_id` int(10) DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `postcode` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `address` text CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `location_link` text CHARACTER SET latin1 DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `store_id` (`store_id`),
  KEY `id` (`id`),
  CONSTRAINT `db_shippingaddress_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_shippingaddress_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_shippingaddress` (`id`, `store_id`, `country_id`, `state_id`, `city`, `postcode`, `address`, `status`, `customer_id`, `location_link`) VALUES (1, 1, 1, NULL, NULL, '', '', 1, 1, NULL);
INSERT INTO `db_shippingaddress` (`id`, `store_id`, `country_id`, `state_id`, `city`, `postcode`, `address`, `status`, `customer_id`, `location_link`) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL);


#
# TABLE STRUCTURE FOR: db_sitesettings
#

DROP TABLE IF EXISTS `db_sitesettings`;

CREATE TABLE `db_sitesettings` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'path',
  `machine_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_sitesettings` (`id`, `version`, `site_name`, `logo`, `machine_id`, `domain`, `unique_code`) VALUES (1, '3.0', 'Shohoz Digital', '/uploads/site/logo.png', '1', 'pointofsale.ozonepos.com', '4kcd2s8v9axrpm6gy1foh7tlqij5nw');


#
# TABLE STRUCTURE FOR: db_smsapi
#

DROP TABLE IF EXISTS `db_smsapi`;

CREATE TABLE `db_smsapi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_value` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_smsapi_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (26, 2, 'url', 'weblink', 'http://example.com/sendmessage', NULL);
INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (27, 2, 'mobile', 'mobiles', '', NULL);
INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (28, 2, 'message', 'message', '', NULL);
INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (29, 1, 'url', 'weblink', 'https://www.example.com/api/mt/SendSMS?', NULL);
INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (30, 1, 'mobile', 'mobiles', '', NULL);
INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES (31, 1, 'message', 'message', '', NULL);


#
# TABLE STRUCTURE FOR: db_smstemplates
#

DROP TABLE IF EXISTS `db_smstemplates`;

CREATE TABLE `db_smstemplates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_smstemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_smstemplates` (`id`, `store_id`, `template_name`, `content`, `variables`, `status`, `undelete_bit`) VALUES (1, 1, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{store_name}}<br>\r\n{{store_mobile}}<br>\r\n{{store_address}}<br>\r\n{{store_website}}<br>\r\n{{store_email}}<br>\r\n', 1, 1);
INSERT INTO `db_smstemplates` (`id`, `store_id`, `template_name`, `content`, `variables`, `status`, `undelete_bit`) VALUES (2, 1, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', 1, 1);
INSERT INTO `db_smstemplates` (`id`, `store_id`, `template_name`, `content`, `variables`, `status`, `undelete_bit`) VALUES (12, 2, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}                          \r\n{{sales_id}}\r\n{{sales_date}}\r\n{{sales_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{store_name}}\r\n{{store_mobile}}\r\n{{store_address}}\r\n{{store_website}}\r\n{{store_email}}\r\n', 1, 1);
INSERT INTO `db_smstemplates` (`id`, `store_id`, `template_name`, `content`, `variables`, `status`, `undelete_bit`) VALUES (13, 2, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}                          \r\n{{return_id}}\r\n{{return_date}}\r\n{{return_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{company_name}}\r\n{{company_mobile}}\r\n{{company_address}}\r\n{{company_website}}\r\n{{company_email}}\r\n', 1, 1);


#
# TABLE STRUCTURE FOR: db_sobpayments
#

DROP TABLE IF EXISTS `db_sobpayments`;

CREATE TABLE `db_sobpayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_states
#

DROP TABLE IF EXISTS `db_states`;

CREATE TABLE `db_states` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `state_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_states_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (23, 1, 'ST0001', 'Karnataka', 'CNT0001', NULL, 'India', '2017-07-10', 1, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (24, 1, 'ST0024', 'Maharashtra', 'CNT0001', NULL, 'India', '2018-04-13', 1, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (25, 2, 'ST0025', 'Andhra Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (26, 1, 'ST0026', 'Arunachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (27, 1, 'ST0027', 'Assam', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (28, 1, 'ST0028', 'Bihar', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (29, 1, 'ST0029', 'Chhattisgarh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (30, 1, 'ST0030', 'Goa', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (31, 1, 'ST0031', 'Gujarat', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (32, 1, 'ST0032', 'Haryana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (33, 1, 'ST0033', 'Himachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (34, 1, 'ST0034', 'Jammu and Kashmir', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (35, 1, 'ST0035', 'Jharkhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (36, 1, 'ST0036', 'Kerala', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (37, 1, 'ST0037', 'Madhya Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (38, 1, 'ST0038', 'Manipur', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (39, 1, 'ST0039', 'Meghalaya', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (40, 1, 'ST0040', 'Mizoram', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (41, 1, 'ST0041', 'Nagaland', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (42, 1, 'ST0042', 'Odisha', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (43, 1, 'ST0043', 'Punjab', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (44, 1, 'ST0044', 'Rajasthan', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (45, 1, 'ST0045', 'Sikkim', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (46, 1, 'ST0046', 'Tamil Nadu', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (47, 1, 'ST0047', 'Telangana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (48, 1, 'ST0048', 'Tripura', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (49, 1, 'ST0049', 'Uttar Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (50, 1, 'ST0050', 'Uttarakhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (51, 1, 'ST0051', 'West Bengal', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (52, 1, NULL, 'New York', NULL, NULL, 'USA', NULL, NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (53, 1, NULL, 'Delhi', NULL, NULL, 'India', NULL, NULL, 1);
INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES (63, 2, NULL, 'Karnataka', NULL, 79, 'India', NULL, NULL, 1);


#
# TABLE STRUCTURE FOR: db_stockadjustment
#

DROP TABLE IF EXISTS `db_stockadjustment`;

CREATE TABLE `db_stockadjustment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_date` date DEFAULT NULL,
  `adjustment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_stockadjustment_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_stockadjustment` (`id`, `store_id`, `warehouse_id`, `reference_no`, `adjustment_date`, `adjustment_note`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`) VALUES (18, 2, 2, NULL, '2022-08-09', NULL, '2022-08-09', '12:00:19 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', 1);
INSERT INTO `db_stockadjustment` (`id`, `store_id`, `warehouse_id`, `reference_no`, `adjustment_date`, `adjustment_note`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`) VALUES (19, 2, 2, NULL, '2022-08-09', NULL, '2022-08-09', '01:38:51 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', 1);
INSERT INTO `db_stockadjustment` (`id`, `store_id`, `warehouse_id`, `reference_no`, `adjustment_date`, `adjustment_note`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`) VALUES (20, 2, 2, NULL, '2022-08-10', NULL, '2022-08-10', '09:23:28 am', 'Chris', '5.21.237.233', '5.21.237.233', 1);


#
# TABLE STRUCTURE FOR: db_stockadjustmentitems
#

DROP TABLE IF EXISTS `db_stockadjustmentitems`;

CREATE TABLE `db_stockadjustmentitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `adjustment_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `adjustment_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`adjustment_id`),
  KEY `item_id` (`item_id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_stockadjustmentitems_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `db_stockadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_stockadjustmentitems` (`id`, `store_id`, `warehouse_id`, `adjustment_id`, `item_id`, `adjustment_qty`, `status`, `description`) VALUES (363, 2, 2, 18, 1, '100.00', 1, NULL);
INSERT INTO `db_stockadjustmentitems` (`id`, `store_id`, `warehouse_id`, `adjustment_id`, `item_id`, `adjustment_qty`, `status`, `description`) VALUES (364, 2, 2, 19, 2, '100.00', 1, NULL);
INSERT INTO `db_stockadjustmentitems` (`id`, `store_id`, `warehouse_id`, `adjustment_id`, `item_id`, `adjustment_qty`, `status`, `description`) VALUES (365, 2, 2, 20, 3, '50.00', 1, NULL);


#
# TABLE STRUCTURE FOR: db_stockentry
#

DROP TABLE IF EXISTS `db_stockentry`;

CREATE TABLE `db_stockentry` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_stocktransfer
#

DROP TABLE IF EXISTS `db_stocktransfer`;

CREATE TABLE `db_stocktransfer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(11) DEFAULT NULL COMMENT 'to store transfer',
  `warehouse_from` int(5) DEFAULT NULL,
  `warehouse_to` int(5) DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_from`),
  KEY `warehouse_to` (`warehouse_to`),
  KEY `db_stocktransfer_ibfk_4` (`to_store_id`),
  CONSTRAINT `db_stocktransfer_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_4` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_stocktransfer` (`id`, `store_id`, `to_store_id`, `warehouse_from`, `warehouse_to`, `transfer_date`, `note`, `created_by`, `created_date`, `created_time`, `system_ip`, `system_name`, `status`) VALUES (1, 2, NULL, 2, 86, '2022-08-09', '', 'Chris', '2022-08-09', '02:02:41 pm', '37.28.46.147', 'dynamic.isp.ooredoo.om', 1);


#
# TABLE STRUCTURE FOR: db_stocktransferitems
#

DROP TABLE IF EXISTS `db_stocktransferitems`;

CREATE TABLE `db_stocktransferitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stocktransfer_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(5) DEFAULT NULL COMMENT 'to store',
  `warehouse_from` int(5) DEFAULT NULL COMMENT 'warehouse ids',
  `warehouse_to` int(11) DEFAULT NULL COMMENT 'warehouse ids',
  `item_id` int(11) DEFAULT NULL,
  `transfer_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_from` (`warehouse_from`),
  KEY `warehouse_to` (`warehouse_to`),
  KEY `stocktranfer_id` (`stocktransfer_id`),
  KEY `item_id` (`item_id`),
  KEY `db_stocktransferitems_ibfk_6` (`to_store_id`),
  CONSTRAINT `db_stocktransferitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_4` FOREIGN KEY (`stocktransfer_id`) REFERENCES `db_stocktransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_6` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_stocktransferitems` (`id`, `stocktransfer_id`, `store_id`, `to_store_id`, `warehouse_from`, `warehouse_to`, `item_id`, `transfer_qty`, `status`) VALUES (89, 1, 2, NULL, 2, 86, 2, '25.00', 1);


#
# TABLE STRUCTURE FOR: db_store
#

DROP TABLE IF EXISTS `db_store`;

CREATE TABLE `db_store` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid` int(50) DEFAULT NULL,
  `category_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journal_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cust_advance_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `status` int(1) DEFAULT NULL,
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(20,4) DEFAULT NULL,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fav_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` int(2) DEFAULT NULL,
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `pos_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals` int(1) DEFAULT 2,
  `money_transfer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_subscriptionlist_id` int(10) DEFAULT 0,
  `smtp_host` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_status` int(1) DEFAULT 0,
  `sms_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `mrp_column` int(1) DEFAULT 0,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_balance_bit` int(1) DEFAULT 1 COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `qty_decimals` int(5) DEFAULT 2,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_signature` int(1) DEFAULT 0,
  `t_and_c_status` int(1) DEFAULT 1 COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `t_and_c_status_pos` int(1) DEFAULT 1,
  `number_to_words` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'Default',
  `default_account_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_store` (`id`, `store_code`, `store_name`, `store_website`, `mobile`, `phone`, `email`, `website`, `store_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `accounts_init`, `journal_init`, `cust_advance_init`, `invoice_view`, `sms_status`, `status`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `currencysymbol_id`, `regno_key`, `fav_icon`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `pos_invoice_format_id`, `sales_invoice_footer_text`, `round_off`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `quotation_init`, `decimals`, `money_transfer_init`, `sales_payment_init`, `sales_return_payment_init`, `purchase_payment_init`, `purchase_return_payment_init`, `expense_payment_init`, `current_subscriptionlist_id`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_status`, `sms_url`, `user_id`, `mrp_column`, `invoice_terms`, `previous_balance_bit`, `qty_decimals`, `signature`, `show_signature`, `t_and_c_status`, `t_and_c_status_pos`, `number_to_words`, `default_account_id`) VALUES (1, 'ST0001', 'SAAS ADMIN', '', '+919999999999', '', 'admin@example.com', 'www', 'uploads/store/company_logo.png', NULL, NULL, NULL, 'India', 'Karnataka', 'Bengalore', 'Gandhi Road', '', '', '', '', '', NULL, 'CT/01/', 'IT01', 'SU/01/', 'PU/2020/01', 'PR/2020/01/', 'CU/01/', 'SL/2020/01/', 'SR/2020/01/', 'EX/2020/01/', 'AC/01/', 'JE', 'ADV', 1, 0, 1, 1, 35, 'Left', 'Asia/Kolkata\r\n', 'dd-mm-yyyy', 12, '0.0000', NULL, NULL, NULL, NULL, 1, 3, 1, 'Its Footer, You can change it from Store Settings.', 0, NULL, NULL, NULL, NULL, NULL, 'QT/2020/01/', 2, 'MT/01/', 'SP/2020/01/', 'SRP/2020/01/', 'PP/2020/01/', 'PRP/2020/01/', 'XP/2020/01/', 26, 'ssl://smtp.gmail.com', '465', 'salmanpathanindia@gmail.com', '9632563672', 1, 'http://sms.proware.in/api/sendhttp.php?authkey=248050Asbku6K75bf27efc&amp;mobiles={{MOBILE}}&amp;message={{MESSAGE}}&amp;sender=WBMGIC&amp;route=4', 0, 0, NULL, 1, 2, NULL, 0, 1, 1, 'Default', NULL);
INSERT INTO `db_store` (`id`, `store_code`, `store_name`, `store_website`, `mobile`, `phone`, `email`, `website`, `store_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `accounts_init`, `journal_init`, `cust_advance_init`, `invoice_view`, `sms_status`, `status`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `currencysymbol_id`, `regno_key`, `fav_icon`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `pos_invoice_format_id`, `sales_invoice_footer_text`, `round_off`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `quotation_init`, `decimals`, `money_transfer_init`, `sales_payment_init`, `sales_return_payment_init`, `purchase_payment_init`, `purchase_return_payment_init`, `expense_payment_init`, `current_subscriptionlist_id`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_status`, `sms_url`, `user_id`, `mrp_column`, `invoice_terms`, `previous_balance_bit`, `qty_decimals`, `signature`, `show_signature`, `t_and_c_status`, `t_and_c_status_pos`, `number_to_words`, `default_account_id`) VALUES (2, 'ST0002', 'Shohoz Digital', '', '97845124', '', 'admin@shohozdigital.com', NULL, 'uploads/store/logo1.png', NULL, NULL, NULL, 'Oman', '', 'Muscat', 'Al Amerat', '199', '', '', '', '', NULL, 'CT', 'IT02', 'SU', 'PU', 'PR', 'CU', 'SL', 'SR', 'EX', 'AC', NULL, 'ADV', 1, 2, 1, 1, 31, 'Left', 'Asia/Muscat\r\n', 'dd-mm-yyyy', 12, '0.0000', NULL, NULL, NULL, NULL, 1, 3, 1, 'This is footer text. It is in Store Management.', 1, '2021-02-12', '05:53:37 pm', '', '127.0.0.1', 'LAPTOP-I5OUIM4R', 'QT', 3, 'MT', 'SP', 'SRP', 'PP', 'PRP', 'XP', 28, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '', 1, 2, NULL, 0, 1, 1, 'Default', NULL);


#
# TABLE STRUCTURE FOR: db_stripe
#

DROP TABLE IF EXISTS `db_stripe`;

CREATE TABLE `db_stripe` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `publishable_key` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `api_secret` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_stripe_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_stripepayments
#

DROP TABLE IF EXISTS `db_stripepayments`;

CREATE TABLE `db_stripepayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `buyer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `buyer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount_currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_subscription
#

DROP TABLE IF EXISTS `db_subscription`;

CREATE TABLE `db_subscription` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `payment_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `subscription_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `payment_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `txn_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_gross` double(10,2) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payer_email` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_status` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_status` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'manual subscription only',
  `package_count` int(10) DEFAULT NULL COMMENT 'manual subscription only',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (13, 22, NULL, 2, NULL, 'Regular', 'Test description', '2021-01-25', NULL, 15, 20, 20, 200, 200, 'PayPal', '48R18927X78299709', '250.00', 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '01:30:45 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);
INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (14, 22, NULL, 2, 'Paid', 'Regular', 'Test description', '2021-01-25', NULL, 15, 20, 20, 200, 200, 'PayPal', '9M838440FH9266015', '250.00', 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '01:32:28 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);
INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (16, 22, NULL, 2, 'Paid', 'Regular', 'Test description', '2021-01-25', '2021-02-25', 15, 20, 20, 200, 200, 'PayPal', '2PT61144W90213341', '250.00', 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '02:00:38 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);
INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (26, 1, NULL, 1, 'Free', 'Free', 'Test description', '2021-01-25', '2021-02-04', 10, 2, 2, 20, 20, 'Self', '', '0.00', '', '', '', '2021-01-25', '06:32:32 pm', 'admin', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);
INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (27, 24, NULL, 1, 'Free', 'Free', 'Test description', '2021-02-11', '2021-02-21', 10, 2, 2, 20, 20, 'Self', '', '0.00', '', '', '', '2021-02-11', '03:09:47 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);
INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES (28, 2, NULL, 1, 'Free', 'Free', 'Test description', '2021-02-12', '2021-02-22', 10, 2, 2, 20, 20, 'Self', '', '0.00', '', '', '', '2021-02-12', '06:57:18 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: db_supplier_payments
#

DROP TABLE IF EXISTS `db_supplier_payments`;

CREATE TABLE `db_supplier_payments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `purchasepayment_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `purchasepayment_id` (`purchasepayment_id`),
  CONSTRAINT `db_supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_supplier_payments_ibfk_2` FOREIGN KEY (`purchasepayment_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_suppliers
#

DROP TABLE IF EXISTS `db_suppliers`;

CREATE TABLE `db_suppliers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create supplier Code',
  `supplier_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `purchase_due` double(20,4) DEFAULT NULL,
  `purchase_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_suppliers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_suppliers` (`id`, `store_id`, `count_id`, `supplier_code`, `supplier_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `purchase_due`, `purchase_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES (1, 2, 1, 'SU0001', 'EZ tech', '', '', '', '', '', NULL, '0.0000', '0.0000', NULL, 0, 0, '', '', '', '37.28.46.147', 'dynamic.isp.ooredoo.om', '2022-08-09', '01:59:07 pm', 'Chris', NULL, 1);


#
# TABLE STRUCTURE FOR: db_tax
#

DROP TABLE IF EXISTS `db_tax`;

CREATE TABLE `db_tax` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `tax_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(20,4) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_tax_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_tax` (`id`, `store_id`, `tax_name`, `tax`, `group_bit`, `subtax_ids`, `status`) VALUES (149, 2, 'VAT', '5.0000', NULL, NULL, 1);


#
# TABLE STRUCTURE FOR: db_timezone
#

DROP TABLE IF EXISTS `db_timezone`;

CREATE TABLE `db_timezone` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (1, 'Africa/Abidjan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (2, 'Africa/Accra\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (3, 'Africa/Addis_Ababa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (4, 'Africa/Algiers\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (5, 'Africa/Asmara\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (6, 'Africa/Asmera\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (7, 'Africa/Bamako\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (8, 'Africa/Bangui\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (9, 'Africa/Banjul\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (10, 'Africa/Bissau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (11, 'Africa/Blantyre\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (12, 'Africa/Brazzaville\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (13, 'Africa/Bujumbura\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (14, 'Africa/Cairo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (15, 'Africa/Casablanca\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (16, 'Africa/Ceuta\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (17, 'Africa/Conakry\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (18, 'Africa/Dakar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (19, 'Africa/Dar_es_Salaam\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (20, 'Africa/Djibouti\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (21, 'Africa/Douala\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (22, 'Africa/El_Aaiun\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (23, 'Africa/Freetown\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (24, 'Africa/Gaborone\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (25, 'Africa/Harare\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (26, 'Africa/Johannesburg\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (27, 'Africa/Juba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (28, 'Africa/Kampala\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (29, 'Africa/Khartoum\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (30, 'Africa/Kigali\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (31, 'Africa/Kinshasa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (32, 'Africa/Lagos\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (33, 'Africa/Libreville\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (34, 'Africa/Lome\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (35, 'Africa/Luanda\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (36, 'Africa/Lubumbashi\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (37, 'Africa/Lusaka\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (38, 'Africa/Malabo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (39, 'Africa/Maputo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (40, 'Africa/Maseru\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (41, 'Africa/Mbabane\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (42, 'Africa/Mogadishu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (43, 'Africa/Monrovia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (44, 'Africa/Nairobi\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (45, 'Africa/Ndjamena\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (46, 'Africa/Niamey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (47, 'Africa/Nouakchott\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (48, 'Africa/Ouagadougou\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (49, 'Africa/Porto-Novo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (50, 'Africa/Sao_Tome\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (51, 'Africa/Timbuktu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (52, 'Africa/Tripoli\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (53, 'Africa/Tunis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (54, 'Africa/Windhoek\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (55, 'AKST9AKDT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (56, 'America/Adak\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (57, 'America/Anchorage\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (58, 'America/Anguilla\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (59, 'America/Antigua\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (60, 'America/Araguaina\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (61, 'America/Argentina/Buenos_Aires\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (62, 'America/Argentina/Catamarca\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (63, 'America/Argentina/ComodRivadavia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (64, 'America/Argentina/Cordoba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (65, 'America/Argentina/Jujuy\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (66, 'America/Argentina/La_Rioja\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (67, 'America/Argentina/Mendoza\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (68, 'America/Argentina/Rio_Gallegos\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (69, 'America/Argentina/Salta\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (70, 'America/Argentina/San_Juan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (71, 'America/Argentina/San_Luis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (72, 'America/Argentina/Tucuman\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (73, 'America/Argentina/Ushuaia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (74, 'America/Aruba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (75, 'America/Asuncion\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (76, 'America/Atikokan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (77, 'America/Atka\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (78, 'America/Bahia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (79, 'America/Bahia_Banderas\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (80, 'America/Barbados\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (81, 'America/Belem\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (82, 'America/Belize\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (83, 'America/Blanc-Sablon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (84, 'America/Boa_Vista\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (85, 'America/Bogota\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (86, 'America/Boise\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (87, 'America/Buenos_Aires\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (88, 'America/Cambridge_Bay\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (89, 'America/Campo_Grande\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (90, 'America/Cancun\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (91, 'America/Caracas\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (92, 'America/Catamarca\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (93, 'America/Cayenne\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (94, 'America/Cayman\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (95, 'America/Chicago\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (96, 'America/Chihuahua\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (97, 'America/Coral_Harbour\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (98, 'America/Cordoba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (99, 'America/Costa_Rica\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (100, 'America/Creston\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (101, 'America/Cuiaba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (102, 'America/Curacao\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (103, 'America/Danmarkshavn\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (104, 'America/Dawson\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (105, 'America/Dawson_Creek\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (106, 'America/Denver\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (107, 'America/Detroit\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (108, 'America/Dominica\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (109, 'America/Edmonton\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (110, 'America/Eirunepe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (111, 'America/El_Salvador\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (112, 'America/Ensenada\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (113, 'America/Fort_Wayne\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (114, 'America/Fortaleza\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (115, 'America/Glace_Bay\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (116, 'America/Godthab\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (117, 'America/Goose_Bay\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (118, 'America/Grand_Turk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (119, 'America/Grenada\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (120, 'America/Guadeloupe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (121, 'America/Guatemala\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (122, 'America/Guayaquil\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (123, 'America/Guyana\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (124, 'America/Halifax\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (125, 'America/Havana\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (126, 'America/Hermosillo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (127, 'America/Indiana/Indianapolis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (128, 'America/Indiana/Knox\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (129, 'America/Indiana/Marengo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (130, 'America/Indiana/Petersburg\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (131, 'America/Indiana/Tell_City\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (132, 'America/Indiana/Vevay\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (133, 'America/Indiana/Vincennes\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (134, 'America/Indiana/Winamac\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (135, 'America/Indianapolis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (136, 'America/Inuvik\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (137, 'America/Iqaluit\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (138, 'America/Jamaica\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (139, 'America/Jujuy\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (140, 'America/Juneau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (141, 'America/Kentucky/Louisville\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (142, 'America/Kentucky/Monticello\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (143, 'America/Knox_IN\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (144, 'America/Kralendijk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (145, 'America/La_Paz\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (146, 'America/Lima\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (147, 'America/Los_Angeles\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (148, 'America/Louisville\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (149, 'America/Lower_Princes\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (150, 'America/Maceio\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (151, 'America/Managua\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (152, 'America/Manaus\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (153, 'America/Marigot\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (154, 'America/Martinique\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (155, 'America/Matamoros\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (156, 'America/Mazatlan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (157, 'America/Mendoza\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (158, 'America/Menominee\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (159, 'America/Merida\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (160, 'America/Metlakatla\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (161, 'America/Mexico_City\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (162, 'America/Miquelon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (163, 'America/Moncton\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (164, 'America/Monterrey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (165, 'America/Montevideo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (166, 'America/Montreal\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (167, 'America/Montserrat\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (168, 'America/Nassau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (169, 'America/New_York\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (170, 'America/Nipigon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (171, 'America/Nome\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (172, 'America/Noronha\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (173, 'America/North_Dakota/Beulah\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (174, 'America/North_Dakota/Center\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (175, 'America/North_Dakota/New_Salem\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (176, 'America/Ojinaga\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (177, 'America/Panama\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (178, 'America/Pangnirtung\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (179, 'America/Paramaribo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (180, 'America/Phoenix\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (181, 'America/Port_of_Spain\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (182, 'America/Port-au-Prince\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (183, 'America/Porto_Acre\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (184, 'America/Porto_Velho\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (185, 'America/Puerto_Rico\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (186, 'America/Rainy_River\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (187, 'America/Rankin_Inlet\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (188, 'America/Recife\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (189, 'America/Regina\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (190, 'America/Resolute\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (191, 'America/Rio_Branco\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (192, 'America/Rosario\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (193, 'America/Santa_Isabel\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (194, 'America/Santarem\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (195, 'America/Santiago\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (196, 'America/Santo_Domingo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (197, 'America/Sao_Paulo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (198, 'America/Scoresbysund\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (199, 'America/Shiprock\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (200, 'America/Sitka\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (201, 'America/St_Barthelemy\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (202, 'America/St_Johns\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (203, 'America/St_Kitts\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (204, 'America/St_Lucia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (205, 'America/St_Thomas\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (206, 'America/St_Vincent\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (207, 'America/Swift_Current\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (208, 'America/Tegucigalpa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (209, 'America/Thule\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (210, 'America/Thunder_Bay\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (211, 'America/Tijuana\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (212, 'America/Toronto\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (213, 'America/Tortola\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (214, 'America/Vancouver\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (215, 'America/Virgin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (216, 'America/Whitehorse\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (217, 'America/Winnipeg\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (218, 'America/Yakutat\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (219, 'America/Yellowknife\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (220, 'Antarctica/Casey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (221, 'Antarctica/Davis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (222, 'Antarctica/DumontDUrville\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (223, 'Antarctica/Macquarie\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (224, 'Antarctica/Mawson\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (225, 'Antarctica/McMurdo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (226, 'Antarctica/Palmer\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (227, 'Antarctica/Rothera\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (228, 'Antarctica/South_Pole\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (229, 'Antarctica/Syowa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (230, 'Antarctica/Vostok\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (231, 'Arctic/Longyearbyen\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (232, 'Asia/Aden\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (233, 'Asia/Almaty\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (234, 'Asia/Amman\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (235, 'Asia/Anadyr\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (236, 'Asia/Aqtau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (237, 'Asia/Aqtobe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (238, 'Asia/Ashgabat\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (239, 'Asia/Ashkhabad\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (240, 'Asia/Baghdad\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (241, 'Asia/Bahrain\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (242, 'Asia/Baku\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (243, 'Asia/Bangkok\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (244, 'Asia/Beirut\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (245, 'Asia/Bishkek\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (246, 'Asia/Brunei\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (247, 'Asia/Calcutta\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (248, 'Asia/Choibalsan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (249, 'Asia/Chongqing\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (250, 'Asia/Chungking\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (251, 'Asia/Colombo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (252, 'Asia/Dacca\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (253, 'Asia/Damascus\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (254, 'Asia/Dhaka\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (255, 'Asia/Dili\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (256, 'Asia/Dubai\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (257, 'Asia/Dushanbe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (258, 'Asia/Gaza\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (259, 'Asia/Harbin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (260, 'Asia/Hebron\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (261, 'Asia/Ho_Chi_Minh\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (262, 'Asia/Hong_Kong\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (263, 'Asia/Hovd\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (264, 'Asia/Irkutsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (265, 'Asia/Istanbul\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (266, 'Asia/Jakarta\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (267, 'Asia/Jayapura\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (268, 'Asia/Jerusalem\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (269, 'Asia/Kabul\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (270, 'Asia/Kamchatka\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (271, 'Asia/Karachi\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (272, 'Asia/Kashgar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (273, 'Asia/Kathmandu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (274, 'Asia/Katmandu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (275, 'Asia/Kolkata\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (276, 'Asia/Krasnoyarsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (277, 'Asia/Kuala_Lumpur\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (278, 'Asia/Kuching\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (279, 'Asia/Kuwait\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (280, 'Asia/Macao\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (281, 'Asia/Macau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (282, 'Asia/Magadan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (283, 'Asia/Makassar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (284, 'Asia/Manila\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (285, 'Asia/Muscat\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (286, 'Asia/Nicosia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (287, 'Asia/Novokuznetsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (288, 'Asia/Novosibirsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (289, 'Asia/Omsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (290, 'Asia/Oral\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (291, 'Asia/Phnom_Penh\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (292, 'Asia/Pontianak\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (293, 'Asia/Pyongyang\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (294, 'Asia/Qatar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (295, 'Asia/Qyzylorda\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (296, 'Asia/Rangoon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (297, 'Asia/Riyadh\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (298, 'Asia/Saigon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (299, 'Asia/Sakhalin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (300, 'Asia/Samarkand\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (301, 'Asia/Seoul\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (302, 'Asia/Shanghai\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (303, 'Asia/Singapore\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (304, 'Asia/Taipei\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (305, 'Asia/Tashkent\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (306, 'Asia/Tbilisi\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (307, 'Asia/Tehran\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (308, 'Asia/Tel_Aviv\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (309, 'Asia/Thimbu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (310, 'Asia/Thimphu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (311, 'Asia/Tokyo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (312, 'Asia/Ujung_Pandang\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (313, 'Asia/Ulaanbaatar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (314, 'Asia/Ulan_Bator\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (315, 'Asia/Urumqi\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (316, 'Asia/Vientiane\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (317, 'Asia/Vladivostok\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (318, 'Asia/Yakutsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (319, 'Asia/Yekaterinburg\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (320, 'Asia/Yerevan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (321, 'Atlantic/Azores\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (322, 'Atlantic/Bermuda\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (323, 'Atlantic/Canary\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (324, 'Atlantic/Cape_Verde\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (325, 'Atlantic/Faeroe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (326, 'Atlantic/Faroe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (327, 'Atlantic/Jan_Mayen\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (328, 'Atlantic/Madeira\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (329, 'Atlantic/Reykjavik\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (330, 'Atlantic/South_Georgia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (331, 'Atlantic/St_Helena\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (332, 'Atlantic/Stanley\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (333, 'Australia/ACT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (334, 'Australia/Adelaide\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (335, 'Australia/Brisbane\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (336, 'Australia/Broken_Hill\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (337, 'Australia/Canberra\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (338, 'Australia/Currie\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (339, 'Australia/Darwin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (340, 'Australia/Eucla\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (341, 'Australia/Hobart\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (342, 'Australia/LHI\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (343, 'Australia/Lindeman\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (344, 'Australia/Lord_Howe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (345, 'Australia/Melbourne\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (346, 'Australia/North\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (347, 'Australia/NSW\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (348, 'Australia/Perth\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (349, 'Australia/Queensland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (350, 'Australia/South\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (351, 'Australia/Sydney\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (352, 'Australia/Tasmania\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (353, 'Australia/Victoria\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (354, 'Australia/West\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (355, 'Australia/Yancowinna\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (356, 'Brazil/Acre\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (357, 'Brazil/DeNoronha\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (358, 'Brazil/East\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (359, 'Brazil/West\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (360, 'Canada/Atlantic\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (361, 'Canada/Central\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (362, 'Canada/Eastern\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (363, 'Canada/East-Saskatchewan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (364, 'Canada/Mountain\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (365, 'Canada/Newfoundland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (366, 'Canada/Pacific\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (367, 'Canada/Saskatchewan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (368, 'Canada/Yukon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (369, 'CET\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (370, 'Chile/Continental\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (371, 'Chile/EasterIsland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (372, 'CST6CDT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (373, 'Cuba\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (374, 'EET\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (375, 'Egypt\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (376, 'Eire\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (377, 'EST\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (378, 'EST5EDT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (379, 'Etc./GMT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (380, 'Etc./GMT+0\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (381, 'Etc./UCT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (382, 'Etc./Universal\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (383, 'Etc./UTC\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (384, 'Etc./Zulu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (385, 'Europe/Amsterdam\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (386, 'Europe/Andorra\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (387, 'Europe/Athens\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (388, 'Europe/Belfast\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (389, 'Europe/Belgrade\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (390, 'Europe/Berlin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (391, 'Europe/Bratislava\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (392, 'Europe/Brussels\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (393, 'Europe/Bucharest\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (394, 'Europe/Budapest\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (395, 'Europe/Chisinau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (396, 'Europe/Copenhagen\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (397, 'Europe/Dublin\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (398, 'Europe/Gibraltar\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (399, 'Europe/Guernsey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (400, 'Europe/Helsinki\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (401, 'Europe/Isle_of_Man\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (402, 'Europe/Istanbul\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (403, 'Europe/Jersey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (404, 'Europe/Kaliningrad\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (405, 'Europe/Kiev\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (406, 'Europe/Lisbon\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (407, 'Europe/Ljubljana\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (408, 'Europe/London\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (409, 'Europe/Luxembourg\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (410, 'Europe/Madrid\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (411, 'Europe/Malta\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (412, 'Europe/Mariehamn\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (413, 'Europe/Minsk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (414, 'Europe/Monaco\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (415, 'Europe/Moscow\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (416, 'Europe/Nicosia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (417, 'Europe/Oslo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (418, 'Europe/Paris\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (419, 'Europe/Podgorica\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (420, 'Europe/Prague\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (421, 'Europe/Riga\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (422, 'Europe/Rome\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (423, 'Europe/Samara\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (424, 'Europe/San_Marino\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (425, 'Europe/Sarajevo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (426, 'Europe/Simferopol\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (427, 'Europe/Skopje\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (428, 'Europe/Sofia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (429, 'Europe/Stockholm\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (430, 'Europe/Tallinn\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (431, 'Europe/Tirane\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (432, 'Europe/Tiraspol\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (433, 'Europe/Uzhgorod\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (434, 'Europe/Vaduz\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (435, 'Europe/Vatican\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (436, 'Europe/Vienna\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (437, 'Europe/Vilnius\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (438, 'Europe/Volgograd\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (439, 'Europe/Warsaw\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (440, 'Europe/Zagreb\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (441, 'Europe/Zaporozhye\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (442, 'Europe/Zurich\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (443, 'GB\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (444, 'GB-Eire\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (445, 'GMT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (446, 'GMT+0\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (447, 'GMT0\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (448, 'GMT-0\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (449, 'Greenwich\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (450, 'Hong Kong\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (451, 'HST\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (452, 'Iceland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (453, 'Indian/Antananarivo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (454, 'Indian/Chagos\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (455, 'Indian/Christmas\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (456, 'Indian/Cocos\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (457, 'Indian/Comoro\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (458, 'Indian/Kerguelen\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (459, 'Indian/Mahe\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (460, 'Indian/Maldives\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (461, 'Indian/Mauritius\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (462, 'Indian/Mayotte\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (463, 'Indian/Reunion\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (464, 'Iran\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (465, 'Israel\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (466, 'Jamaica\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (467, 'Japan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (468, 'JST-9\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (469, 'Kwajalein\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (470, 'Libya\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (471, 'MET\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (472, 'Mexico/BajaNorte\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (473, 'Mexico/BajaSur\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (474, 'Mexico/General\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (475, 'MST\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (476, 'MST7MDT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (477, 'Navajo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (478, 'NZ\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (479, 'NZ-CHAT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (480, 'Pacific/Apia\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (481, 'Pacific/Auckland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (482, 'Pacific/Chatham\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (483, 'Pacific/Chuuk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (484, 'Pacific/Easter\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (485, 'Pacific/Efate\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (486, 'Pacific/Enderbury\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (487, 'Pacific/Fakaofo\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (488, 'Pacific/Fiji\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (489, 'Pacific/Funafuti\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (490, 'Pacific/Galapagos\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (491, 'Pacific/Gambier\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (492, 'Pacific/Guadalcanal\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (493, 'Pacific/Guam\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (494, 'Pacific/Honolulu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (495, 'Pacific/Johnston\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (496, 'Pacific/Kiritimati\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (497, 'Pacific/Kosrae\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (498, 'Pacific/Kwajalein\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (499, 'Pacific/Majuro\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (500, 'Pacific/Marquesas\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (501, 'Pacific/Midway\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (502, 'Pacific/Nauru\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (503, 'Pacific/Niue\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (504, 'Pacific/Norfolk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (505, 'Pacific/Noumea\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (506, 'Pacific/Pago_Pago\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (507, 'Pacific/Palau\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (508, 'Pacific/Pitcairn\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (509, 'Pacific/Pohnpei\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (510, 'Pacific/Ponape\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (511, 'Pacific/Port_Moresby\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (512, 'Pacific/Rarotonga\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (513, 'Pacific/Saipan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (514, 'Pacific/Samoa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (515, 'Pacific/Tahiti\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (516, 'Pacific/Tarawa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (517, 'Pacific/Tongatapu\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (518, 'Pacific/Truk\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (519, 'Pacific/Wake\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (520, 'Pacific/Wallis\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (521, 'Pacific/Yap\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (522, 'Poland\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (523, 'Portugal\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (524, 'PRC\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (525, 'PST8PDT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (526, 'ROC\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (527, 'ROK\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (528, 'Singapore\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (529, 'Turkey\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (530, 'UCT\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (531, 'Universal\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (532, 'US/Alaska\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (533, 'US/Aleutian\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (534, 'US/Arizona\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (535, 'US/Central\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (536, 'US/Eastern\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (537, 'US/East-Indiana\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (538, 'US/Hawaii\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (539, 'US/Indiana-Starke\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (540, 'US/Michigan\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (541, 'US/Mountain\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (542, 'US/Pacific\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (543, 'US/Pacific-New\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (544, 'US/Samoa\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (545, 'UTC\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (546, 'WET\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (547, 'W-SU\r', 1);
INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES (548, 'Zulu\r', 1);


#
# TABLE STRUCTURE FOR: db_twilio
#

DROP TABLE IF EXISTS `db_twilio`;

CREATE TABLE `db_twilio` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `account_sid` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `auth_token` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `twilio_phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_twilio_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_twilio` (`id`, `store_id`, `account_sid`, `auth_token`, `twilio_phone`, `status`) VALUES (1, 1, '', '', '', 0);
INSERT INTO `db_twilio` (`id`, `store_id`, `account_sid`, `auth_token`, `twilio_phone`, `status`) VALUES (3, 2, '', '', '', 0);


#
# TABLE STRUCTURE FOR: db_units
#

DROP TABLE IF EXISTS `db_units`;

CREATE TABLE `db_units` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `unit_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_units_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_units` (`id`, `store_id`, `unit_name`, `description`, `company_id`, `status`) VALUES (61, 2, 'PCS', '', NULL, 1);
INSERT INTO `db_units` (`id`, `store_id`, `unit_name`, `description`, `company_id`, `status`) VALUES (62, 2, 'KG', '', NULL, 1);


#
# TABLE STRUCTURE FOR: db_users
#

DROP TABLE IF EXISTS `db_users`;

CREATE TABLE `db_users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` blob DEFAULT NULL,
  `member_of` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` blob DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `profile_picture` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` double DEFAULT NULL,
  `creater_id` int(5) DEFAULT NULL,
  `updater_id` int(5) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_users` (`id`, `store_id`, `username`, `first_name`, `last_name`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`, `creater_id`, `updater_id`, `updated_at`, `default_warehouse_id`) VALUES (1, 1, 'user_22003', 'Admin', 'Power', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, NULL, '', 'super@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'uploads/users/admin.png', '2018-11-27', '::1', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `db_users` (`id`, `store_id`, `username`, `first_name`, `last_name`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`, `creater_id`, `updater_id`, `updated_at`, `default_warehouse_id`) VALUES (2, 2, 'user_479448', 'Chris', 'Morris', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '9999999999', 'admin@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/users/avatar1.png', '2021-02-12', '05:53:37 pm', '', '127.0.0.1', 'LAPTOP-I5OUIM4R', '1', NULL, NULL, NULL, NULL);
INSERT INTO `db_users` (`id`, `store_id`, `username`, `first_name`, `last_name`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`, `creater_id`, `updater_id`, `updated_at`, `default_warehouse_id`) VALUES (101, 2, 'user_331232', 'Salman', 'Khan', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '', 'salman@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, '2022-08-09', '02:05:40 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', '1', NULL, NULL, NULL, 86);


#
# TABLE STRUCTURE FOR: db_userswarehouses
#

DROP TABLE IF EXISTS `db_userswarehouses`;

CREATE TABLE `db_userswarehouses` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_userswarehouses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_userswarehouses_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_userswarehouses` (`id`, `user_id`, `warehouse_id`) VALUES (76, 101, 86);


#
# TABLE STRUCTURE FOR: db_variants
#

DROP TABLE IF EXISTS `db_variants`;

CREATE TABLE `db_variants` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `variant_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_variants_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_variants_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: db_warehouse
#

DROP TABLE IF EXISTS `db_warehouse`;

CREATE TABLE `db_warehouse` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_warehouse_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_warehouse` (`id`, `store_id`, `warehouse_type`, `warehouse_name`, `mobile`, `email`, `status`, `created_date`) VALUES (1, 1, 'System', 'Warehouse-A', '', 'warehouse_a@example.com', 1, NULL);
INSERT INTO `db_warehouse` (`id`, `store_id`, `warehouse_type`, `warehouse_name`, `mobile`, `email`, `status`, `created_date`) VALUES (2, 2, 'System', 'System Warehouse', '', '', 1, NULL);
INSERT INTO `db_warehouse` (`id`, `store_id`, `warehouse_type`, `warehouse_name`, `mobile`, `email`, `status`, `created_date`) VALUES (86, 2, 'Custom', 'Al Amerat Store', '', '', 1, NULL);
INSERT INTO `db_warehouse` (`id`, `store_id`, `warehouse_type`, `warehouse_name`, `mobile`, `email`, `status`, `created_date`) VALUES (87, 2, 'Custom', 'Demo wearhouse', '01790089914', 'Hub4Source@gmail.com', 1, '2024-11-25');


#
# TABLE STRUCTURE FOR: db_warehouseitems
#

DROP TABLE IF EXISTS `db_warehouseitems`;

CREATE TABLE `db_warehouseitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `available_qty` double(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `db_warehouseitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_warehouseitems_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_warehouseitems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `db_warehouseitems` (`id`, `store_id`, `warehouse_id`, `item_id`, `available_qty`) VALUES (4232, 2, 2, 3, '70.00');
INSERT INTO `db_warehouseitems` (`id`, `store_id`, `warehouse_id`, `item_id`, `available_qty`) VALUES (4234, 2, 2, 1, '100.00');
INSERT INTO `db_warehouseitems` (`id`, `store_id`, `warehouse_id`, `item_id`, `available_qty`) VALUES (4235, 2, 2, 2, '100.00');
INSERT INTO `db_warehouseitems` (`id`, `store_id`, `warehouse_id`, `item_id`, `available_qty`) VALUES (4236, 2, 86, 2, '25.00');


#
# TABLE STRUCTURE FOR: temp_holdinvoice
#

DROP TABLE IF EXISTS `temp_holdinvoice`;

CREATE TABLE `temp_holdinvoice` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(5) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `item_qty` int(5) DEFAULT NULL,
  `item_price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET foreign_key_checks = 1;
