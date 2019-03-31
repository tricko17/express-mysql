-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for toko
CREATE DATABASE IF NOT EXISTS `toko` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `toko`;

-- Dumping structure for table toko.cabang
CREATE TABLE IF NOT EXISTS `cabang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kota` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table toko.cabang: ~2 rows (approximately)
/*!40000 ALTER TABLE `cabang` DISABLE KEYS */;
INSERT INTO `cabang` (`id`, `kota`) VALUES
	(1, 'Jakarta'),
	(2, 'Bandung'),
	(3, 'Surabaya');
/*!40000 ALTER TABLE `cabang` ENABLE KEYS */;

-- Dumping structure for view toko.jumbo
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `jumbo` (
	`No` INT(11) NOT NULL,
	`Nama` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`Usia` SMALLINT(6) NOT NULL,
	`Berat` FLOAT(3,1) NOT NULL,
	`Kota` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`Th` YEAR NOT NULL,
	`Data_in` TIMESTAMP NOT NULL,
	`Data_updated` TIMESTAMP NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table toko.karyawan
CREATE TABLE IF NOT EXISTS `karyawan` (
  `No` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(30) NOT NULL,
  `Usia` smallint(6) NOT NULL,
  `Berat` float(3,1) NOT NULL,
  `Kota` text NOT NULL,
  `Th` year(4) NOT NULL,
  `Data_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table toko.karyawan: ~7 rows (approximately)
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` (`No`, `Nama`, `Usia`, `Berat`, `Kota`, `Th`, `Data_in`, `Data_updated`) VALUES
	(1, 'Dudung', 21, 80.0, 'Jakarta', '2017', '2019-03-17 11:37:38', '2019-03-17 13:46:30'),
	(2, 'Dadang', 22, 50.1, 'Bandung', '2018', '2019-03-17 11:41:32', '2019-03-17 13:17:56'),
	(3, 'Diding', 21, 50.1, 'Jakarta', '2017', '2019-03-17 11:41:32', '2019-03-17 13:21:48'),
	(4, 'Dedeng', 22, 50.1, 'Bandung', '2018', '2019-03-17 11:49:59', '2019-03-17 13:17:56'),
	(5, 'Anang', 27, 25.0, 'Bekasi', '2019', '2019-03-17 14:04:27', '2019-03-17 14:04:27'),
	(6, 'Sutisna', 23, 69.0, 'Jakarta', '2019', '2019-03-17 14:06:37', '2019-03-17 14:06:37'),
	(7, 'Ngapak', 67, 70.0, 'Bandung', '2019', '2019-03-17 14:10:02', '2019-03-17 14:10:02'),
	(8, 'Test', 78, 40.0, 'Bandung', '2019', '2019-03-17 15:48:50', '2019-03-17 15:49:40');
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;

-- Dumping structure for table toko.member
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table toko.member: ~4 rows (approximately)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `nama`, `id_cabang`) VALUES
	(1, 'Andi', 1),
	(2, 'Budi', 2),
	(3, 'Caca', 1),
	(4, 'Dedi', 1),
	(5, 'Dudung', 0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- Dumping structure for table toko.tes
CREATE TABLE IF NOT EXISTS `tes` (
  `NoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table toko.tes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tes` ENABLE KEYS */;

-- Dumping structure for view toko.jumbo
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `jumbo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jumbo` AS SELECT * FROM karyawan WHERE berat > 40 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
