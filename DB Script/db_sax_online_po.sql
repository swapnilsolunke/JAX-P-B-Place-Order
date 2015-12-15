-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.28 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_sax_online_po
CREATE DATABASE IF NOT EXISTS `db_sax_online_po` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_sax_online_po`;


-- Dumping structure for table db_sax_online_po.tbl_invoice
CREATE TABLE IF NOT EXISTS `tbl_invoice` (
  `pk_invoice_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) DEFAULT '0',
  `fld_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_invoice_id`),
  KEY `FK__tbl_users` (`fk_user_id`),
  CONSTRAINT `FK__tbl_users` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_users` (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sax_online_po.tbl_invoice: ~72 rows (approximately)
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` (`pk_invoice_id`, `fk_user_id`, `fld_date`) VALUES
	(00000000001, NULL, '2015-11-30 19:22:15'),
	(00000000002, NULL, '2015-11-30 19:23:29'),
	(00000000003, 1, '2015-11-30 19:26:36'),
	(00000000004, 1, '2015-11-30 19:30:21'),
	(00000000005, 1, '2015-11-30 21:37:06'),
	(00000000006, 1, '2015-11-30 22:03:00'),
	(00000000007, 1, '2015-11-30 22:11:14'),
	(00000000008, 1, '2015-11-30 22:54:43'),
	(00000000009, 1, '2015-11-30 22:58:18'),
	(00000000010, 1, '2015-11-30 23:00:00'),
	(00000000011, 1, '2015-11-30 23:01:05'),
	(00000000012, 1, '2015-11-30 23:10:08'),
	(00000000013, 1, '2015-11-30 23:15:44'),
	(00000000014, 1, '2015-12-01 11:12:08'),
	(00000000015, 1, '2015-12-01 11:21:58'),
	(00000000016, 1, '2015-12-01 11:31:01'),
	(00000000017, 1, '2015-12-01 11:47:42'),
	(00000000018, 1, '2015-12-01 11:59:28'),
	(00000000019, 1, '2015-12-01 12:04:02'),
	(00000000020, 1, '2015-12-01 12:06:53'),
	(00000000021, 1, '2015-12-01 14:32:32'),
	(00000000022, 1, '2015-12-01 14:34:46'),
	(00000000023, 1, '2015-12-01 14:39:35'),
	(00000000024, 1, '2015-12-01 14:42:27'),
	(00000000025, 1, '2015-12-01 14:50:40'),
	(00000000026, 1, '2015-12-01 15:02:59'),
	(00000000027, 1, '2015-12-01 15:05:03'),
	(00000000028, 1, '2015-12-01 15:07:20'),
	(00000000029, 1, '2015-12-01 15:08:31'),
	(00000000030, 1, '2015-12-01 15:49:32'),
	(00000000031, 1, '2015-12-01 15:59:39'),
	(00000000032, 1, '2015-12-01 16:03:17'),
	(00000000033, 1, '2015-12-01 16:05:11'),
	(00000000034, 1, '2015-12-01 16:10:44'),
	(00000000035, 1, '2015-12-01 16:16:33'),
	(00000000036, 1, '2015-12-01 16:53:48'),
	(00000000037, 1, '2015-12-01 16:55:41'),
	(00000000038, 1, '2015-12-01 17:00:34'),
	(00000000039, 1, '2015-12-01 17:02:56'),
	(00000000040, 1, '2015-12-01 17:04:21'),
	(00000000041, 1, '2015-12-01 17:05:30'),
	(00000000042, 1, '2015-12-01 17:23:31'),
	(00000000043, 1, '2015-12-01 17:29:23'),
	(00000000044, 1, '2015-12-01 17:31:37'),
	(00000000045, 1, '2015-12-01 17:40:18'),
	(00000000046, 1, '2015-12-01 17:42:37'),
	(00000000047, 1, '2015-12-01 17:53:04'),
	(00000000048, 1, '2015-12-01 17:57:26'),
	(00000000049, 1, '2015-12-01 18:10:58'),
	(00000000050, 1, '2015-12-01 21:12:41'),
	(00000000051, 1, '2015-12-02 00:52:49'),
	(00000000052, 1, '2015-12-02 10:32:31'),
	(00000000053, 1, '2015-12-02 11:32:02'),
	(00000000054, 1, '2015-12-02 18:06:42'),
	(00000000055, 1, '2015-12-02 18:20:12'),
	(00000000056, 1, '2015-12-02 18:23:35'),
	(00000000057, 1, '2015-12-02 18:30:40'),
	(00000000058, 1, '2015-12-03 15:10:42'),
	(00000000059, 1, '2015-12-03 15:15:04'),
	(00000000060, 1, '2015-12-11 18:09:20'),
	(00000000061, 1, '2015-12-11 18:19:11'),
	(00000000062, 1, '2015-12-12 00:53:27'),
	(00000000063, 1, '2015-12-12 18:25:22'),
	(00000000064, 1, '2015-12-12 18:34:47'),
	(00000000065, 1, '2015-12-12 18:40:01'),
	(00000000066, 1, '2015-12-12 18:42:21'),
	(00000000067, 1, '2015-12-12 23:16:30'),
	(00000000068, NULL, '2015-12-13 01:56:50'),
	(00000000069, 1, '2015-12-13 18:39:56'),
	(00000000070, 1, '2015-12-14 00:27:24'),
	(00000000071, 1, '2015-12-14 00:29:38'),
	(00000000072, 1, '2015-12-14 00:31:44');
/*!40000 ALTER TABLE `tbl_invoice` ENABLE KEYS */;


-- Dumping structure for table db_sax_online_po.tbl_item_stock_info
CREATE TABLE IF NOT EXISTS `tbl_item_stock_info` (
  `pk_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `fld_item_name` varchar(50) DEFAULT NULL,
  `fld_avail_qnt` bigint(20) DEFAULT NULL,
  `fld_item_rate` double DEFAULT NULL,
  PRIMARY KEY (`pk_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sax_online_po.tbl_item_stock_info: ~5 rows (approximately)
/*!40000 ALTER TABLE `tbl_item_stock_info` DISABLE KEYS */;
INSERT INTO `tbl_item_stock_info` (`pk_item_id`, `fld_item_name`, `fld_avail_qnt`, `fld_item_rate`) VALUES
	(1, 'Sparx Green Sandails', 100, 1300),
	(2, 'Fastrck Metal Watch', 89, 3500),
	(3, 'Mobile iPhone6 Gold', 30, 58000),
	(4, 'Mobile Lenovo Vib p2 Silver', 60, 16000),
	(5, 'Laptop Dell Silver i7', 30, 56000);
/*!40000 ALTER TABLE `tbl_item_stock_info` ENABLE KEYS */;


-- Dumping structure for table db_sax_online_po.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `pk_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fld_fname` varchar(50) DEFAULT NULL,
  `fld_lname` varchar(50) DEFAULT NULL,
  `fld_email` varchar(50) DEFAULT NULL,
  `fld_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sax_online_po.tbl_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`pk_user_id`, `fld_fname`, `fld_lname`, `fld_email`, `fld_password`) VALUES
	(1, 'Swapnil', 'Solunke', 'swapnilsolunke19@gmail.com', '12345');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
