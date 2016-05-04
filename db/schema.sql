# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.24)
# Database: mysmartskin_development
# Generation Time: 2016-05-04 18:11:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table _participants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_participants`;

CREATE TABLE `_participants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table custom_body_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_body_sections`;

CREATE TABLE `custom_body_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) unsigned DEFAULT '999',
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `tile_img` varchar(255) DEFAULT NULL,
  `instructions` text,
  `tools` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `custom_body_sections` WRITE;
/*!40000 ALTER TABLE `custom_body_sections` DISABLE KEYS */;

INSERT INTO `custom_body_sections` (`id`, `order`, `name`, `shortname`, `tile_img`, `instructions`, `tools`)
VALUES
	(1,1,'Face and front of neck',X'46616365','face.png','<ol>\r    <li>Check all areas of the face in a mirror, including your forehead, nose, cheeks, chin, and the front of your ears</li>\r    <li>Raise your head and check the entire front and each side of your neck</li>\r</ol>','mirror'),
	(2,2,'Front and sides of arms',X'41726D732031','arms_1.png','<ol>\r    <li class=\"tip\">Use a full length mirror if it is easier </li>\r    <li>With your palms facing down, check the front and sides of the upper arm (from the shoulder to the elbow)</li>\r    <li>Again, with your palms facing down, check the front and sides of the lower arm (from the elbow to the wrist)</li>\r</ol>','mirror'),
	(3,3,'Hands',X'48616E6473','hands.png','<ol>\r  <li>Check the back of your hands, your palms, fingers, in between each finger, and under the fingernails</li>\r</ol>',''),
	(4,4,'Chest and stomach',X'546F72736F','torso.png','<ol>\r    <li>Check the entire chest area including the front of your shoulders and also under your arms</li>\r    <li>Raise your arms to check the sides of your upper body</li>\r    <li class=\"female\">IF APPLICABLE: Lift your breasts to check the underside</li>\r    <li>Check the entire stomach area, including the sides</li>\r</ol>','mirror'),
	(5,5,'Genitals',X'47656E6974616C73','genitals.png','<ol>\r    <li>Sit on a chair and rest each leg one at a time on a second chair</li>\r    <li>Use a hand-held mirror to check the entire genital area</li>\r</ol>','chair,hand-mirror'),
	(6,6,'Front and sides of legs',X'4C6567732031','legs_1.png','<ol>\r    <li class=\"tip\">You may find it easier to sit on a chair and rest each leg one at a time on a second chair</li>\r    <li class=\"tip\">You may find it helpful to use a hand-held mirror to check the inside and outside of each leg</li>\r    <li>Check the front and side of each leg from the top of the thigh all the way to the ankle</li>\r</ol>','chair,hand-mirror'),
	(7,7,'Feet',X'46656574','feet.png','<ol>\r    <li>Sitting on a chair, bend your left leg and place your left foot on a second chair; repeat with the right leg; if you prefer, you could rest your foot on the knee of the other leg</li>\r    <li>Check the top of the foot, including the toes and under the toenails</li>\r    <li>Use a mirror to check in between the toes, under the toes, the bottom of the foot, and the back of your heel</li>\r</ol>','chair,hand-mirror'),
	(8,8,'Scalp and back of neck',X'5363616C70','scalp.png','<ol>\r    <li>Use a comb or brush (and a hair dryer if you have one) to help part the hair in order to see the scalp</li>\r    <li>Stand with your back towards a mirror and use a hand-held mirror in front of you to view your scalp and the back of your neck</li>\r    <li>Check behind your ears</li>\r</ol>','comb,mirror,hand-mirror'),
	(9,9,'Back of arms',X'41726D732032','arms_2.png','<ol>\r    <li>Check the back of the upper arm (from the shoulder to the elbow) in a mirror</li>\r    <li>Also check the back of the lower arm (from the elbow to the wrist)</li>\r</ol>','mirror'),
	(10,10,'Back',X'4261636B','back.png','<ol>    \r    <li>Stand with your back towards a mirror and use a hand-held mirror in front of you to view your back</li>\r    <li>Check your entire back from the bottom of your neck to the top of your buttocks </li>\r</ol>','mirror,hand-mirror'),
	(11,11,'Buttocks and back of legs',X'4C6567732032','legs_2.png','<ol>\r    <li>Stand with your back towards a mirror and use a hand-held mirror in front of you to view your buttocks and the back of your legs</li>\r    <li>Check the back of each leg from the top of the thigh all the way to the ankle</li>\r</ol>','mirror,hand-mirror');

/*!40000 ALTER TABLE `custom_body_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table custom_diaries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_diaries`;

CREATE TABLE `custom_diaries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) unsigned DEFAULT NULL,
  `progress_section_id` int(11) unsigned DEFAULT NULL,
  `diary_date` date DEFAULT NULL,
  `study_phase` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_diaries_participants` (`participant_id`),
  KEY `fk_diaries_sections_progress` (`progress_section_id`),
  CONSTRAINT `fk_diaries_participants` FOREIGN KEY (`participant_id`) REFERENCES `_participants` (`id`),
  CONSTRAINT `fk_diaries_sections_progress` FOREIGN KEY (`progress_section_id`) REFERENCES `custom_body_sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table custom_moles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_moles`;

CREATE TABLE `custom_moles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) unsigned DEFAULT NULL,
  `body_section_id` int(11) unsigned DEFAULT NULL,
  `custom_diary_id` int(11) unsigned DEFAULT NULL,
  `pos_x` double DEFAULT NULL,
  `pos_y` double DEFAULT NULL,
  `marker` varchar(255) DEFAULT NULL,
  `location` varchar(2048) DEFAULT NULL,
  `asymmetry` tinyint(1) unsigned DEFAULT NULL,
  `border` tinyint(1) unsigned DEFAULT NULL,
  `color` tinyint(1) unsigned DEFAULT NULL,
  `diameter` int(11) unsigned DEFAULT NULL,
  `evolving` tinyint(1) unsigned DEFAULT NULL,
  `evolving_comments` varchar(2048) DEFAULT NULL,
  `funny_looking` tinyint(11) unsigned DEFAULT NULL,
  `funny_looking_comments` varchar(2048) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reviewed_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_moles_body_sections` (`body_section_id`),
  KEY `fk_moles_diaries` (`custom_diary_id`),
  KEY `fk_moles_participants` (`participant_id`),
  CONSTRAINT `fk_moles_body_sections` FOREIGN KEY (`body_section_id`) REFERENCES `custom_body_sections` (`id`),
  CONSTRAINT `fk_moles_diaries` FOREIGN KEY (`custom_diary_id`) REFERENCES `custom_diaries` (`id`),
  CONSTRAINT `fk_moles_participants` FOREIGN KEY (`participant_id`) REFERENCES `_participants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
