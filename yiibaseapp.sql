# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     yiibaseapp
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-06-21 20:43:15
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for yiibaseapp
DROP DATABASE IF EXISTS `yiibaseapp`;
CREATE DATABASE IF NOT EXISTS `yiibaseapp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yiibaseapp`;


# Dumping structure for table yiibaseapp.activerecordlog
DROP TABLE IF EXISTS `activerecordlog`;
CREATE TABLE IF NOT EXISTS `activerecordlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `action` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `model` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `idModel` int(10) unsigned NOT NULL,
  `field` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table yiibaseapp.activerecordlog: 0 rows
/*!40000 ALTER TABLE `activerecordlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `activerecordlog` ENABLE KEYS */;


# Dumping structure for table yiibaseapp.authassignment
DROP TABLE IF EXISTS `authassignment`;
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table yiibaseapp.authassignment: 2 rows
/*!40000 ALTER TABLE `authassignment` DISABLE KEYS */;
INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES ('Admin', '1', NULL, 'N;'), ('Usuario', '2', NULL, 'N;');
/*!40000 ALTER TABLE `authassignment` ENABLE KEYS */;


# Dumping structure for table yiibaseapp.authitem
DROP TABLE IF EXISTS `authitem`;
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table yiibaseapp.authitem: 10 rows
/*!40000 ALTER TABLE `authitem` DISABLE KEYS */;
INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES ('Admin', 2, NULL, NULL, 'N;'), ('Relatorios', 2, 'Usuário que verá relatórios', NULL, 'N;'), ('User.Admin', 0, NULL, NULL, 'N;'), ('User.Create', 0, NULL, NULL, 'N;'), ('User.Delete', 0, NULL, NULL, 'N;'), ('User.Index', 0, NULL, NULL, 'N;'), ('User.Update', 0, NULL, NULL, 'N;'), ('User.View', 0, NULL, NULL, 'N;'), ('Usuario', 2, 'Usuário comum', NULL, 'N;'), ('Usuarios', 1, 'Administrar usuários', NULL, 'N;');
/*!40000 ALTER TABLE `authitem` ENABLE KEYS */;


# Dumping structure for table yiibaseapp.authitemchild
DROP TABLE IF EXISTS `authitemchild`;
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table yiibaseapp.authitemchild: 6 rows
/*!40000 ALTER TABLE `authitemchild` DISABLE KEYS */;
INSERT INTO `authitemchild` (`parent`, `child`) VALUES ('Usuarios', 'User.Create'), ('Usuarios', 'User.Index'), ('Usuarios', 'User.Teste'), ('Usuarios', 'User.Update'), ('Usuarios', 'User.View'), ('Usuario', 'Usuarios');
/*!40000 ALTER TABLE `authitemchild` ENABLE KEYS */;


# Dumping structure for table yiibaseapp.rights
DROP TABLE IF EXISTS `rights`;
CREATE TABLE IF NOT EXISTS `rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `FK_blog_rights_blog_authitem` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table yiibaseapp.rights: 2 rows
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` (`itemname`, `type`, `weight`) VALUES ('Relatorios', 2, 1), ('Usuario', 2, 0);
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;


# Dumping structure for table yiibaseapp.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `profile` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table yiibaseapp.user: 2 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `email`, `profile`) VALUES (1, 'admin', '9401b8c7297832c567ae922cc596a4dd', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com', ''), (2, 'demo', '2e5c7db760a33498023813489cfadc0b', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
