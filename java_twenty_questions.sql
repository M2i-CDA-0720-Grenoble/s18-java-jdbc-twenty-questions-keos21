-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `java_twenty_questions`;
CREATE DATABASE `java_twenty_questions` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `java_twenty_questions`;

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_question_id` int(10) unsigned DEFAULT NULL,
  `parent_question_answer` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tree_position` (`parent_question_id`,`parent_question_answer`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`parent_question_id`) REFERENCES `questions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE `items`;
INSERT INTO `items` (`id`, `name`, `parent_question_id`, `parent_question_answer`) VALUES
(1,	'chat',	4,	1),
(2,	'dauphin',	4,	0),
(3,	'crocodile',	5,	1),
(4,	'pigeon',	5,	0),
(5,	'mouche',	6,	1),
(6,	'fourmi',	6,	0),
(7,	'mollusque',	7,	1),
(8,	'méduse',	7,	0);

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `parent_question_id` int(10) unsigned DEFAULT NULL,
  `parent_question_answer` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tree_position` (`parent_question_id`,`parent_question_answer`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`parent_question_id`) REFERENCES `questions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE `questions`;
INSERT INTO `questions` (`id`, `text`, `parent_question_id`, `parent_question_answer`) VALUES
(1,	'Votre animal est-il un vertébré?',	NULL,	0),
(2,	'Votre animal est-il un mammifère?',	1,	1),
(3,	'Votre animal est-il un insecte?',	1,	0),
(4,	'Votre animal est-il terrestre?',	2,	1),
(5,	'Votre animal est-il un reptile?',	2,	0),
(6,	'Votre animal est-il volant?',	3,	1),
(7,	'Votre animal est-il un mollusque?',	3,	0);

-- 2020-12-09 19:25:41