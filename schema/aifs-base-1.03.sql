CREATE DATABASE  IF NOT EXISTS `aifs`;
USE `aifs`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aifs_logs`
--

DROP TABLE IF EXISTS `aifs_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `date_yyyy` int(4) NOT NULL,
  `date_mm` int(2) NOT NULL,
  `date_dd` int(2) NOT NULL,
  `registred` int(11) DEFAULT NULL,
  `date_minutes` int(2) DEFAULT NULL,
  `date_hours` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aifs_member`
--

DROP TABLE IF EXISTS `aifs_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `passwd` char(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) NOT NULL,
  `cookie` char(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aifs_query_cache`
--

DROP TABLE IF EXISTS `aifs_query_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_query_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `query` varchar(255) DEFAULT NULL,
  `result` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aifs_registers`
--

DROP TABLE IF EXISTS `aifs_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_registers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_aifs_member_id` int(10) unsigned NOT NULL,
  `quote` varchar(512) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(512) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aifs_member_id` (`fk_aifs_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aifs_tmphash`
--

DROP TABLE IF EXISTS `aifs_tmphash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_tmphash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passwd` char(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `expiration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_geoip_block`
--

DROP TABLE IF EXISTS `dnint_geoip_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_geoip_block` (
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `fk_geoip_loc` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_geoip_loc`
--

DROP TABLE IF EXISTS `dnint_geoip_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_geoip_loc` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(30) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `metro_code` varchar(30) NOT NULL,
  `area_code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_iptable`
--

DROP TABLE IF EXISTS `dnint_iptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_iptable` (
  `last_save` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(255) NOT NULL DEFAULT '',
  `search_opt` varchar(255) NOT NULL DEFAULT '',
  `showCount` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `utc` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ad`
--

DROP TABLE IF EXISTS `dnint_url_tld_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ae`
--

DROP TABLE IF EXISTS `dnint_url_tld_ae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ae` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ag`
--

DROP TABLE IF EXISTS `dnint_url_tld_ag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_am`
--

DROP TABLE IF EXISTS `dnint_url_tld_am`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_am` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ar`
--

DROP TABLE IF EXISTS `dnint_url_tld_ar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_at`
--

DROP TABLE IF EXISTS `dnint_url_tld_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_at` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_au`
--

DROP TABLE IF EXISTS `dnint_url_tld_au`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_au` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_be`
--

DROP TABLE IF EXISTS `dnint_url_tld_be`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_be` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_biz`
--

DROP TABLE IF EXISTS `dnint_url_tld_biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_biz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_bo`
--

DROP TABLE IF EXISTS `dnint_url_tld_bo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_bo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_br`
--

DROP TABLE IF EXISTS `dnint_url_tld_br`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_br` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_bs`
--

DROP TABLE IF EXISTS `dnint_url_tld_bs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_bs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_bz`
--

DROP TABLE IF EXISTS `dnint_url_tld_bz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_bz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ca`
--

DROP TABLE IF EXISTS `dnint_url_tld_ca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ca` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_cc`
--

DROP TABLE IF EXISTS `dnint_url_tld_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_cc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ch`
--

DROP TABLE IF EXISTS `dnint_url_tld_ch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_cn`
--

DROP TABLE IF EXISTS `dnint_url_tld_cn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_cn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_co`
--

DROP TABLE IF EXISTS `dnint_url_tld_co`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_co` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_com`
--

DROP TABLE IF EXISTS `dnint_url_tld_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_com` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_coop`
--

DROP TABLE IF EXISTS `dnint_url_tld_coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_coop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_cx`
--

DROP TABLE IF EXISTS `dnint_url_tld_cx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_cx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_cy`
--

DROP TABLE IF EXISTS `dnint_url_tld_cy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_cy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_cz`
--

DROP TABLE IF EXISTS `dnint_url_tld_cz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_cz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_de`
--

DROP TABLE IF EXISTS `dnint_url_tld_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_de` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_dk`
--

DROP TABLE IF EXISTS `dnint_url_tld_dk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_dk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_edu`
--

DROP TABLE IF EXISTS `dnint_url_tld_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_edu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_es`
--

DROP TABLE IF EXISTS `dnint_url_tld_es`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_es` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_eu`
--

DROP TABLE IF EXISTS `dnint_url_tld_eu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_eu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_fm`
--

DROP TABLE IF EXISTS `dnint_url_tld_fm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_fm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_fr`
--

DROP TABLE IF EXISTS `dnint_url_tld_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_fr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_gov`
--

DROP TABLE IF EXISTS `dnint_url_tld_gov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_gov` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_gs`
--

DROP TABLE IF EXISTS `dnint_url_tld_gs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_gs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_hu`
--

DROP TABLE IF EXISTS `dnint_url_tld_hu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_hu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_id`
--

DROP TABLE IF EXISTS `dnint_url_tld_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ie`
--

DROP TABLE IF EXISTS `dnint_url_tld_ie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_im`
--

DROP TABLE IF EXISTS `dnint_url_tld_im`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_im` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_in`
--

DROP TABLE IF EXISTS `dnint_url_tld_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_info`
--

DROP TABLE IF EXISTS `dnint_url_tld_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_io`
--

DROP TABLE IF EXISTS `dnint_url_tld_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_io` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ir`
--

DROP TABLE IF EXISTS `dnint_url_tld_ir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ir` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_it`
--

DROP TABLE IF EXISTS `dnint_url_tld_it`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_it` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_jobs`
--

DROP TABLE IF EXISTS `dnint_url_tld_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_jp`
--

DROP TABLE IF EXISTS `dnint_url_tld_jp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_jp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_kr`
--

DROP TABLE IF EXISTS `dnint_url_tld_kr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_kr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_lu`
--

DROP TABLE IF EXISTS `dnint_url_tld_lu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_lu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_lv`
--

DROP TABLE IF EXISTS `dnint_url_tld_lv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_lv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ly`
--

DROP TABLE IF EXISTS `dnint_url_tld_ly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ly` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_me`
--

DROP TABLE IF EXISTS `dnint_url_tld_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_me` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_mn`
--

DROP TABLE IF EXISTS `dnint_url_tld_mn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_mn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_mobi`
--

DROP TABLE IF EXISTS `dnint_url_tld_mobi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_mobi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ms`
--

DROP TABLE IF EXISTS `dnint_url_tld_ms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_mx`
--

DROP TABLE IF EXISTS `dnint_url_tld_mx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_mx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_my`
--

DROP TABLE IF EXISTS `dnint_url_tld_my`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_my` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_net`
--

DROP TABLE IF EXISTS `dnint_url_tld_net`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_net` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_nl`
--

DROP TABLE IF EXISTS `dnint_url_tld_nl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_nl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_no`
--

DROP TABLE IF EXISTS `dnint_url_tld_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_no` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_nz`
--

DROP TABLE IF EXISTS `dnint_url_tld_nz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_nz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_org`
--

DROP TABLE IF EXISTS `dnint_url_tld_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_org` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ph`
--

DROP TABLE IF EXISTS `dnint_url_tld_ph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ph` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_pl`
--

DROP TABLE IF EXISTS `dnint_url_tld_pl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_pl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_py`
--

DROP TABLE IF EXISTS `dnint_url_tld_py`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_py` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ro`
--

DROP TABLE IF EXISTS `dnint_url_tld_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ro` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ru`
--

DROP TABLE IF EXISTS `dnint_url_tld_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ru` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_se`
--

DROP TABLE IF EXISTS `dnint_url_tld_se`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_se` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_tc`
--

DROP TABLE IF EXISTS `dnint_url_tld_tc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_tc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_tel`
--

DROP TABLE IF EXISTS `dnint_url_tld_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_tel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_tk`
--

DROP TABLE IF EXISTS `dnint_url_tld_tk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_tk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_to`
--

DROP TABLE IF EXISTS `dnint_url_tld_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_to` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_travel`
--

DROP TABLE IF EXISTS `dnint_url_tld_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_travel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_tv`
--

DROP TABLE IF EXISTS `dnint_url_tld_tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_tv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_tw`
--

DROP TABLE IF EXISTS `dnint_url_tld_tw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_tw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_uk`
--

DROP TABLE IF EXISTS `dnint_url_tld_uk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_uk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_us`
--

DROP TABLE IF EXISTS `dnint_url_tld_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_us` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_vg`
--

DROP TABLE IF EXISTS `dnint_url_tld_vg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_vg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_url_tld_ws`
--

DROP TABLE IF EXISTS `dnint_url_tld_ws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_tld_ws` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `OSINT_submit` int(2) NOT NULL,
  `subchance` int(2) NOT NULL,
  `dateSaved` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geoint_country`
--

DROP TABLE IF EXISTS `geoint_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geoint_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL,
  `fk_utc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geoint_utc`
--

DROP TABLE IF EXISTS `geoint_utc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geoint_utc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `utc` double NOT NULL COMMENT 'time zone',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geoint_language`
--
DROP TABLE IF EXISTS `geoint_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `geoint_language` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `label1` varchar(255) NOT NULL,
  `label2` varchar(255) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Table structure for table `humint_entity`
--

DROP TABLE IF EXISTS `humint_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humint_entity` (
  `id` int(11) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `gender` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humint_telecom`
--

DROP TABLE IF EXISTS `humint_telecom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humint_telecom` (
  `id` int(11) unsigned NOT NULL,
  `email1` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humint_lsi_configurator`
--

DROP TABLE IF EXISTS `humint_lsi_configurator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `humint_lsi_configurator` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `debugtext` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Table structure for table `osint_avatars`
--

DROP TABLE IF EXISTS `osint_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_avatars` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_aifs_member_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_banned`
--

DROP TABLE IF EXISTS `osint_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_hours` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_change_passwd`
--

DROP TABLE IF EXISTS `osint_change_passwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_change_passwd` (
  `death` int(11) NOT NULL DEFAULT '0',
  `Uname` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_changes`
--

DROP TABLE IF EXISTS `osint_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_changes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(11) unsigned NOT NULL,
  `fk_new_version_id` int(10) unsigned DEFAULT NULL,
  `fk_old_version_id` int(10) unsigned DEFAULT NULL,
  `added` text,
  `deleted` text,
  `diff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changes_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_changes_size`
--

DROP TABLE IF EXISTS `osint_changes_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_changes_size` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(11) unsigned NOT NULL,
  `fk_new_version_id` int(10) unsigned DEFAULT NULL,
  `fk_old_version_id` int(10) unsigned DEFAULT NULL,
  `added_size` int(11) NOT NULL DEFAULT '0',
  `deleted_size` int(11) NOT NULL DEFAULT '0',
  `diff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `new_version_size` int(11) NOT NULL DEFAULT '0',
  `old_version_size` int(11) NOT NULL DEFAULT '0',
  `fk_changes_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_contents_parsed`
--

DROP TABLE IF EXISTS `osint_contents_parsed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_contents_parsed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `parsed_content` longtext NOT NULL,
  `osint_version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osint_version_id` (`osint_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_deadlinks`
--

DROP TABLE IF EXISTS `osint_deadlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_deadlinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateFound` datetime NOT NULL,
  `url_id` int(11) NOT NULL,
  `retry1` int(11) NOT NULL,
  `retry2` int(11) NOT NULL,
  `retry4` int(11) DEFAULT NULL,
  `retry5` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_groups`
--

DROP TABLE IF EXISTS `osint_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `OSINT_groups_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `aifs_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_keyword`
--

DROP TABLE IF EXISTS `osint_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_keyword` (
  `keyword_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `dimension_x` int(11) NOT NULL,
  `dimension_y` int(11) NOT NULL,
  `fk_geoint_language_id` int(11) NOT NULL,
  `nature` varchar(512) DEFAULT NULL,
  `updatedTime` timestamp default CURRENT_TIMESTAMP,
  PRIMARY KEY (`keyword_id`),
  KEY `fk_geoint_language_id` (`fk_geoint_language_id`),
  KEY `keyword_index` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_keyword_relation`
--

DROP TABLE IF EXISTS `osint_keyword_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `osint_keyword_relation` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `fk_keyw1_id` int(11) unsigned NOT NULL,
  `fk_keyw2_id` int(11) unsigned NOT NULL,
  `strength` int(11) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `fk_keword_id_1` (`fk_keyw1_id`),
  KEY `fk_keword_id_2` (`fk_keyw2_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Table structure for table `keyword_misspelled`
--

CREATE TABLE IF NOT EXISTS `osint_keyword_misspelled` (
  `keyword_id` int(11) unsigned NOT NULL auto_increment,
  `keyword` varchar(255) NOT NULL,
  `dimension_x` int(11) NOT NULL,
  `dimension_y` int(11) NOT NULL,
  `fk_geoint_language_id` int(11) unsigned NOT NULL,
  `nature` varchar(512) default NULL,
  PRIMARY KEY  (`keyword_id`),
  KEY `fk_geoint_language_id` (`fk_geoint_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Table structure for table `aifs_members_groups`
--

DROP TABLE IF EXISTS `aifs_members_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aifs_members_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_groups_id` int(10) NOT NULL,
  `fk_aifs_member_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_groups_id` (`fk_osint_groups_id`),
  KEY `fk_aifs_member_id` (`fk_aifs_member_id`),
  CONSTRAINT `aifs_members_groups_ibfk_1` FOREIGN KEY (`fk_osint_groups_id`) REFERENCES `osint_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aifs_members_groups_ibfk_2` FOREIGN KEY (`fk_aifs_member_id`) REFERENCES `aifs_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_members_urls`
--

DROP TABLE IF EXISTS `osint_members_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_members_urls` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(10) NOT NULL,
  `fk_aifs_member_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_outbound`
--

DROP TABLE IF EXISTS `dnint_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_outbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(510) DEFAULT NULL,
  `found` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved` int(2) DEFAULT '0',
  `fk_osint_version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnint_pagerank`
--

DROP TABLE IF EXISTS `dnint_pagerank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_pagerank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(11) NOT NULL,
  `fetch_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_parsed_result`
--

DROP TABLE IF EXISTS `dnint_parsed_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_parsed_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimx_avg` double NOT NULL,
  `dimy_avg` double NOT NULL,
  `fk_dnint_content_parsed_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dnint_content_parsed_id` (`fk_dnint_content_parsed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_tags`
--

DROP TABLE IF EXISTS `osint_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `fk_osint_url_id` int(10) NOT NULL,
  `fk_group_id` int(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`,`fk_osint_url_id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`),
  KEY `fk_group_id` (`fk_group_id`),
  CONSTRAINT `OSINT_tags_ibfk_1` FOREIGN KEY (`fk_osint_url_id`) REFERENCES `osint_url` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OSINT_tags_ibfk_2` FOREIGN KEY (`fk_group_id`) REFERENCES `osint_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_tags_changelog`
--

DROP TABLE IF EXISTS `osint_tags_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_tags_changelog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_tags_count`
--

DROP TABLE IF EXISTS `osint_tags_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_tags_count` (
  `tags_name` varchar(255) NOT NULL,
  `tags_count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_tags_subscribed`
--

DROP TABLE IF EXISTS `osint_tags_subscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_tags_subscribed` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(10) NOT NULL,
  `fk_aifs_member_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`),
  KEY `fk_aifs_member_id` (`fk_aifs_member_id`),
  CONSTRAINT `OSINT_tags_subscribed_ibfk_1` FOREIGN KEY (`fk_osint_url_id`) REFERENCES `osint_url` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OSINT_tags_subscribed_ibfk_2` FOREIGN KEY (`fk_aifs_member_id`) REFERENCES `aifs_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_thumbs`
--

DROP TABLE IF EXISTS `osint_thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_thumbs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(11) unsigned NOT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `date_yyyy_mm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_titles`
--

DROP TABLE IF EXISTS `osint_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_titles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_version_id` int(10) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `eval_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_osint_url_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_version_id` (`fk_osint_version_id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osint_url`
--

DROP TABLE IF EXISTS `osint_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_url` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `dead_link` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `osint_version_table_history`
--

DROP TABLE IF EXISTS `osint_version_table_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_version_table_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET swe7 NOT NULL,
  `first_row` int(10) NOT NULL,
  `last_row` int(10) NOT NULL,
  `first_date` date NOT NULL,
  `last_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `osint_version`
--

DROP TABLE IF EXISTS `osint_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `size` int(20) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `osint_version_0`
--

DROP TABLE IF EXISTS `osint_version_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_version_0` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_osint_url_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `size` int(20) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osint_url_id` (`fk_osint_url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `osint_visitspool`
--

DROP TABLE IF EXISTS `osint_visitspool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osint_visitspool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `url_id` int(11) NOT NULL,
  `date_yyyy` varchar(255) NOT NULL,
  `date_mm` varchar(255) NOT NULL,
  `date_dd` varchar(255) NOT NULL,
  `date_hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `dnint_url`
--

DROP TABLE IF EXISTS `dnint_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `dead_link` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `dnint_url_content`
--

DROP TABLE IF EXISTS `dnint_url_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_url_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_dnint_url_id` int(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `size` int(20) DEFAULT NULL,
  `url_content` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_dnint_url_id` (`fk_dnint_url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `dnint_contents_parsed`
--

DROP TABLE IF EXISTS `dnint_contents_parsed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnint_contents_parsed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `parsed_content` longtext NOT NULL,
  `fk_dnint_content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dnint_content_id` (`fk_dnint_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `finint_currency`
--

DROP TABLE IF EXISTS `finint_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finint_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `ticker` varchar(20) NOT NULL,
  `initiated` datetime NOT NULL,
  `ended` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `finint_currency_source`
--

DROP TABLE IF EXISTS `finint_currency_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finint_currency_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk_finint_currency_id` int(11) NOT NULL,
  `fk_dnint_url_id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finint_currency_value`
--

DROP TABLE IF EXISTS `finint_currency_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finint_currency_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL, 
  `saved` timestamp DEFAULT CURRENT_TIMESTAMP,
  `fk_finint_currency_id` int(11) NOT NULL,
  `fk_finint_currency_ref_id` int(11) NOT NULL,
  `fk_dnint_url_id` int(11) NOT NULL, 
  PRIMARY KEY (`id`),
  KEY `fk_finint_currency_id` (`fk_finint_currency_ticker_id`),
  KEY `fk_finint_currency_ref_id` (`fk_finint_currency_ref_id`),
  KEY `fk_dnint_url_id` (`fk_dnint_url_id`)   
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

