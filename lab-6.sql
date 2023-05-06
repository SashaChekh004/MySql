SELECT cities.name, regions.name AS region_name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population > 350000;

SELECT cities.name
FROM cities, regions
WHERE cities.region = regions.uuid AND regions.name = "Nord";


//CREATE SUBWAY TABLES

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `branches` (`id`, `name`, `color`) VALUES
(1,	'Oleksiivska',	'Green'),
(2,	'Kholodnohirsko-Zavodska',	'Red'),
(3,	'Saltivska',	'Blue');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `next_station_id` int(10) unsigned DEFAULT NULL,
  `previous_station_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `stations` (`id`, `name`, `branch_id`, `next_station_id`, `previous_station_id`) VALUES
(1,	'Metrobudivnykiv',	1,	2,	NULL),
(2,	'Zakhysnykiv Ukrayiny',	1,	3,	1),
(3,	'Arkhitektora Beketova',	1,	4,	2),
(4,	'Derzhprom',	1,	5,	3),
(5,	'Naukova',	1,	6,	4),
(6,	'Botanichnyy sad',	1,	7,	5),
(7,	'23 serpnya',	1,	8,	6),
(8,	'Oleksiyivska',	1,	9,	7),
(9,	'Peremoha',	1,	NULL,	8),
(10,	'Industrialna',	2,	11,	NULL),
(11,	'Traktornyy zavod',	2,	12,	10),
(12,	'Imeni Maselskoho',	2,	13,	11),
(13,	'Armiyska',	2,	14,	12),
(14,	'Palats Sportu',	2,	15,	13),
(15,	'Turboatom',	2,	16,	14),
(16,	'Zavod imeni Malysheva',	2,	17,	15),
(17,	'Sportyvna',	2,	18,	16),
(18,	'Prospekt Haharina',	2,	19,	17),
(19,	'Maydan Konstytutsiyi',	2,	20,	18),
(20,	'Tsentralnyy rynok',	2,	21,	19),
(21,	'Pivdennyy vokzal',	2,	22,	20),
(22,	'Kholodna hora',	2,	NULL,	21),
(23,	'Istorychnyy muzey',	3,	24,	NULL),
(24,	'Universytet',	3,	25,	23),
(25,	'Pushkinska',	3,	26,	24),
(26,	'Kyyivska',	3,	27,	25),
(27,	'Akademika Barabashova',	3,	28,	26),
(28,	'Akademika Pavlova',	3,	29,	27),
(29,	'Studentska',	3,	30,	28),
(30,	'Heroyiv pratsi',	3,	NULL,	29);

DROP TABLE IF EXISTS `transitions`;
CREATE TABLE `transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_to_id` int(10) unsigned NOT NULL,
  `station_from_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_to_id` (`station_to_id`),
  KEY `station_from_id` (`station_from_id`),
  CONSTRAINT `transitions_ibfk_1` FOREIGN KEY (`station_to_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `transitions_ibfk_2` FOREIGN KEY (`station_from_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `transitions` (`id`, `station_to_id`, `station_from_id`) VALUES
(1,	17,	1),
(2,	1,	17),
(3,	23,	19),
(4,	19,	23),
(5,	4,	24),
(6,	24,	4);



//Station name and branch color
SELECT stations.name AS name, branches.color AS branch_color
FROM stations, branches
WHERE branches.id = stations.branch_id;