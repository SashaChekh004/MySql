SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
(1,	'IT'),
(2,	'Business'),
(3,	'US Politic'),
(4,	'Animals'),
(5,	'Entertainment');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news` (`id`, `title`, `description`, `publication_date`, `category_id`) VALUES
(1,	'IT news',	'NEW AI launched yesterday',	'2023-05-13',	1),
(2,	'Business news',	'news2_description',	'2023-05-14',	2),
(3,	'US Government news',	'news3_description',	'2023-05-15',	3),
(4,	'Animals news',	'Kharkiv zoom has opened recently',	'2023-05-17',	4),
(5,	'Entertainment',	'some description',	'2023-05-18',	5),
(6,	'IT news',	'IT news description',	'2023-05-19',	1);

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11),
  `news_id` int(11) NOT NULL,
  `ip_address` VARCHAR(20)
  PRIMARY KEY (`id`),
  CONSTRAINT unique_news_ip UNIQUE (news_id, ip_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ratings` (`id`, `mark`, `comment`, `user_id`, `news_id`) VALUES
(1,	1,	'some_comment_1',	1,	1),
(2,	2,	'some_comment_2',	2,	2),
(3,	3,	'some_comment_3',	3,	3),
(4,	4,	'some_comment_4',	1,	4),
(5,	5,	'some_comment_5',	2,	5),
(6,	3,	'some_comment_6',	3,	6);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1,	'Joshua',  'joshua@gmail.com'),
(2,	'Yabo',	'  yabo@b2b.discount'),
(3,	'Victor', 'victor@gmail.com');