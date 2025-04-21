-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.88.12    Database: evidence_clips_about_public_transport
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `message` longtext,
  `email` varchar(128) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `count_of_access` int DEFAULT NULL,
  `user_password` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  CONSTRAINT `author_chk_1` CHECK ((`email` like _utf8mb4'%@%')),
  CONSTRAINT `author_chk_2` CHECK ((`count_of_access` >= -(1)))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clip`
--

DROP TABLE IF EXISTS `clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_clip` varchar(100) NOT NULL,
  `created` date DEFAULT NULL,
  `number_of_filming_day` int NOT NULL,
  `arrive_or_depart` tinyint(1) NOT NULL,
  `order_on_the_line` varchar(20) NOT NULL,
  `file_url` longtext NOT NULL,
  `lenght_of_clip` float NOT NULL,
  `count_of_vehicles_on_clip` int NOT NULL,
  `stop_id` int NOT NULL,
  `formats_id` int NOT NULL,
  `line_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stop_id` (`stop_id`),
  KEY `formats_id` (`formats_id`),
  KEY `line_id` (`line_id`),
  KEY `clip_index` (`name_of_clip`,`created`),
  CONSTRAINT `clip_ibfk_1` FOREIGN KEY (`stop_id`) REFERENCES `stop_` (`id`),
  CONSTRAINT `clip_ibfk_3` FOREIGN KEY (`formats_id`) REFERENCES `formats` (`id`),
  CONSTRAINT `clip_ibfk_4` FOREIGN KEY (`line_id`) REFERENCES `line` (`id`),
  CONSTRAINT `clip_chk_1` CHECK ((`lenght_of_clip` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(100) NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `fps` int NOT NULL,
  `audio_counttrack` int NOT NULL,
  `type_frame` enum('progressive','interlaced') DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `formats_chk_1` CHECK ((`height` > 1)),
  CONSTRAINT `formats_chk_2` CHECK ((`width` > 1)),
  CONSTRAINT `formats_chk_3` CHECK ((`fps` >= 0)),
  CONSTRAINT `formats_chk_4` CHECK ((`audio_counttrack` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `info_from_clip_for_filter`
--

DROP TABLE IF EXISTS `info_from_clip_for_filter`;
/*!50001 DROP VIEW IF EXISTS `info_from_clip_for_filter`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_from_clip_for_filter` AS SELECT 
 1 AS `id`,
 1 AS `name_of_clip`,
 1 AS `created`,
 1 AS `number_of_filming_day`,
 1 AS `file_url`,
 1 AS `arrive_or_depart`,
 1 AS `name_line`,
 1 AS `name_of_stop`,
 1 AS `platform`,
 1 AS `direction`,
 1 AS `number_of_vehicle`,
 1 AS `subtype_mean_of_transport`,
 1 AS `mean_of_transport`,
 1 AS `producer`,
 1 AS `owner_name`,
 1 AS `format_`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_from_clip_match_vehicles`
--

DROP TABLE IF EXISTS `info_from_clip_match_vehicles`;
/*!50001 DROP VIEW IF EXISTS `info_from_clip_match_vehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_from_clip_match_vehicles` AS SELECT 
 1 AS `name_of_clip`,
 1 AS `created`,
 1 AS `number_of_filming_day`,
 1 AS `arrive_or_depart`,
 1 AS `name_line`,
 1 AS `name_of_stop`,
 1 AS `platform`,
 1 AS `direction`,
 1 AS `number_of_vehicle`,
 1 AS `format_`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_from_clip_match_vehicles_ii`
--

DROP TABLE IF EXISTS `info_from_clip_match_vehicles_ii`;
/*!50001 DROP VIEW IF EXISTS `info_from_clip_match_vehicles_ii`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_from_clip_match_vehicles_ii` AS SELECT 
 1 AS `id`,
 1 AS `name_of_clip`,
 1 AS `created`,
 1 AS `number_of_filming_day`,
 1 AS `arrive_or_depart`,
 1 AS `name_line`,
 1 AS `name_of_stop`,
 1 AS `platform`,
 1 AS `direction`,
 1 AS `number_of_vehicle`,
 1 AS `format_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number_line` int NOT NULL,
  `name_line` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mean_of_transport`
--

DROP TABLE IF EXISTS `mean_of_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mean_of_transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(100) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owner_`
--

DROP TABLE IF EXISTS `owner_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(100) NOT NULL,
  `headquarters` varchar(20) DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pattern`
--

DROP TABLE IF EXISTS `pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pattern` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_pattern` varchar(100) NOT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pattern_on_vehicle`
--

DROP TABLE IF EXISTS `pattern_on_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pattern_on_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_` date NOT NULL,
  `to_` date DEFAULT NULL,
  `vehicle_id` int NOT NULL,
  `pattern_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `pattern_id` (`pattern_id`),
  CONSTRAINT `pattern_on_vehicle_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `pattern_on_vehicle_ibfk_2` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1049 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(100) NOT NULL,
  `headquarters` varchar(20) DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `show_vehicles`
--

DROP TABLE IF EXISTS `show_vehicles`;
/*!50001 DROP VIEW IF EXISTS `show_vehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_vehicles` AS SELECT 
 1 AS `id`,
 1 AS `number_`,
 1 AS `vehicle_registration_plate`,
 1 AS `year_of_made`,
 1 AS `In_operation_from`,
 1 AS `in_operation_to`,
 1 AS `is_low_rise`,
 1 AS `have_air_conditioning`,
 1 AS `producer`,
 1 AS `mean_of_transport`,
 1 AS `subtype_mean_of_transport`,
 1 AS `owner_`,
 1 AS `predecessor`,
 1 AS `DIRECTION_OF_VEHICLE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stop_`
--

DROP TABLE IF EXISTS `stop_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop_` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_stop` varchar(100) NOT NULL,
  `number_of_stop` varchar(20) DEFAULT NULL,
  `platform` varchar(50) NOT NULL,
  `direction` varchar(50) NOT NULL,
  `is_operation` tinyint(1) NOT NULL,
  `is_low_rise` tinyint(1) NOT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subtype_mean_of_transport`
--

DROP TABLE IF EXISTS `subtype_mean_of_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtype_mean_of_transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(100) NOT NULL,
  `subtype_mean_of_transport_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subtype_mean_of_transport_id` (`subtype_mean_of_transport_id`),
  CONSTRAINT `subtype_mean_of_transport_ibfk_1` FOREIGN KEY (`subtype_mean_of_transport_id`) REFERENCES `subtype_mean_of_transport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number_` varchar(100) DEFAULT NULL,
  `vehicle_registration_plate` varchar(100) DEFAULT NULL,
  `year_of_made` int NOT NULL,
  `in_operation_from` date NOT NULL,
  `in_operation_to` date DEFAULT NULL,
  `is_low_rise` tinyint(1) NOT NULL,
  `have_air_conditioning` tinyint(1) NOT NULL,
  `producer_id` int NOT NULL,
  `mean_of_transport_id` int NOT NULL,
  `subtype_mean_of_transport_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `vehicle_id` int DEFAULT NULL,
  `direction_of_vehicle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`),
  KEY `mean_of_transport_id` (`mean_of_transport_id`),
  KEY `subtype_mean_of_transport_id` (`subtype_mean_of_transport_id`),
  KEY `owner_id` (`owner_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`),
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`mean_of_transport_id`) REFERENCES `mean_of_transport` (`id`),
  CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`subtype_mean_of_transport_id`) REFERENCES `subtype_mean_of_transport` (`id`),
  CONSTRAINT `vehicle_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `owner_` (`id`),
  CONSTRAINT `vehicle_ibfk_5` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles_on_clip`
--

DROP TABLE IF EXISTS `vehicles_on_clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_on_clip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` int NOT NULL,
  `clip_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `clip_id` (`clip_id`),
  CONSTRAINT `vehicles_on_clip_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `vehicles_on_clip_ibfk_2` FOREIGN KEY (`clip_id`) REFERENCES `clip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'evidence_clips_about_public_transport'
--

--
-- Dumping routines for database 'evidence_clips_about_public_transport'
--
/*!50003 DROP FUNCTION IF EXISTS `count_of_vehicles_on_clip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `count_of_vehicles_on_clip`(clip__id int) RETURNS int
    DETERMINISTIC
begin
	declare return_parametr int;
	select count(*) into return_parametr from vehicles_on_clip where clip_id = clip__id;
    return return_parametr;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `overview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `overview`(year_ varchar(14))
begin
	IF(year_ = '---vyberte---')THEN
		((select 'nejčastěji natáčená linka:' as label,line.name_line,count(*) as count_,(select concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip 
		inner join line on clip.line_id = line.id
		group by name_line
		order by count_ desc limit 1)-(select ROUND(avg(count__)) from (select count(*) as count__ from clip
		inner join line on clip.line_id = line.id
		group by name_line) as e)) as note) as note
		from clip
		inner join line on clip.line_id = line.id
		group by name_line
		order by count_ desc limit 1)
		union all
		(select 'nejméně natáčená linka:' as label,line.name_line,count(*) as count_,(select concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join line on clip.line_id = line.id
		group by name_line
		order by count_ asc limit 1)-(select ROUND(avg(count__)) from (select count(*) as count__ from clip
		inner join line on clip.line_id = line.id
		group by name_line) as e)) as note)
		from clip
		inner join line on clip.line_id = line.id
		group by name_line
		order by count_ asc limit 1)
		union all
		(
		select  'průměrný počet záběrů na linku' as label, ' 'as c,( 
		select ROUND(avg(count_)) from (select count(*) as count_ from clip
		inner join line on clip.line_id = line.id
		group by name_line
		order by count_ desc) as e),'' as note
		)
		union all
		(select 'nejčasteji natáčený dopravní prostředek:' as label, mean_of_transport.name_ as mean_of_transport,count(distinct clip.name_of_clip) as count_,' ' as note from vehicles_on_clip
		inner join clip on vehicles_on_clip.clip_id = clip.id
		inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
		inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
		group by mean_of_transport
		order by count_ desc limit 1)
		union all
		(select 'nejméně natáčený dopravní prostředek:' as label,mean_of_transport.name_ as mean_of_transport,count(distinct clip.name_of_clip) as count_,' ' as note from vehicles_on_clip
		inner join clip on vehicles_on_clip.clip_id = clip.id
		inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
		inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
		group by mean_of_transport
		order by count_ asc limit 1)
		union all
		(
		select 'nejvíce záběrů bylo pořízeno na:' as label,stop_.name_of_stop,count(*) as count_, concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop
		order by count_ desc limit 1)-(select ROUND(avg(count__)) from (select stop_.name_of_stop,count(*) as count__ from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop) as e)) as note from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop
		order by count_ desc limit 1
		)union all
		(
		select 'nejméně záběrů bylo pořízeno na:' as label,stop_.name_of_stop,count(*) as count_, concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop
		order by count_ asc limit 1)-(select ROUND(avg(count__)) from (select stop_.name_of_stop,count(*) as count__ from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop) as e)) as note from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop
		order by count_ asc limit 1
		)
		union all
		(select 'průměrný počet záběrů na zastávku:' as label,' 'as c,ROUND(avg(count_)) ,' ' as note from (select stop_.name_of_stop,count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id
		group by name_of_stop) as e)
		union all
		(select 'průměrný počet záběrů na den:' as label,' 'as c,ROUND(avg(count_)),' ' as note from (select created,count(*) as count_ from clip group by created) as e)
		union all
		(select 'naposledy bylo pořízeno záběrů' as label,
		' 'as c,
		(select count(*) from clip where created = (select max(created) from clip)),
		(select concat('rozdíl oproti průměru: ',  (select count(*)from clip where created = (select max(created) from clip))-(select ROUND(avg(count_)) from (select count(*) as count_ from clip
		group by created) as e)))
		)
		union all
		(
		select 'průměrný počet záběrů na měsíc' as label,'' as c,ROUND((select avg(count_) from (select distinct date_format(created,'%Y/%m') as created_,count(*) as count_ from clip
		group by created_
		order by created_ desc) as e)),'' as note
		)
		union all
		(
		select 'průměrný počet záběrů na rok' as label,'' as c,ROUND((select avg(count_) from (select distinct date_format(created,'%Y') as created_,count(*) as count_ from clip
		group by created_
		order by created_ desc) as e)),'' as note
		)
        );
	ELSE
		((select 'nejčastěji natáčená linka:' as label,line.name_line,count(*) as count_,(select concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip 
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line
		order by count_ desc limit 1)-(select ROUND(avg(count__)) from (select count(*) as count__ from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line) as e)) as note) as note
		from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line
		order by count_ desc limit 1)
		union all
		(select 'nejméně natáčená linka:' as label,line.name_line,count(*) as count_,(select concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line
		order by count_ asc limit 1)-(select ROUND(avg(count__)) from (select count(*) as count__ from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line) as e)) as note)
		from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line
		order by count_ asc limit 1)
		union all
		(
		select  'průměrný počet záběrů na linku' as label, ' 'as c,( 
		select ROUND(avg(count_)) from (select count(*) as count_ from clip
		inner join line on clip.line_id = line.id
        where year(clip.created) = year_
		group by name_line
		order by count_ desc) as e),'' as note
		)
		union all
		(select 'nejčasteji natáčený dopravní prostředek:' as label, mean_of_transport.name_ as mean_of_transport,count(distinct clip.name_of_clip) as count_,' ' as note from vehicles_on_clip
		inner join clip on vehicles_on_clip.clip_id = clip.id
		inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
		inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
        where year(clip.created) = year_
		group by mean_of_transport
		order by count_ desc limit 1)
		union all
		(select 'nejméně natáčený dopravní prostředek:' as label,mean_of_transport.name_ as mean_of_transport,count(distinct clip.name_of_clip) as count_,' ' as note from vehicles_on_clip
		inner join clip on vehicles_on_clip.clip_id = clip.id
		inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
		inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
        where year(clip.created) = year_
		group by mean_of_transport
		order by count_ asc limit 1)
		union all
		(
		select 'nejvíce záběrů bylo pořízeno na:' as label,stop_.name_of_stop,count(*) as count_, concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop
		order by count_ desc limit 1)-(select ROUND(avg(count__)) from (select stop_.name_of_stop,count(*) as count__ from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop) as e)) as note from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop
		order by count_ desc limit 1
		)union all
		(
		select 'nejméně záběrů bylo pořízeno na:' as label,stop_.name_of_stop,count(*) as count_, concat('rozdíl oproti průměru: ',  (select count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop
		order by count_ asc limit 1)-(select ROUND(avg(count__)) from (select stop_.name_of_stop,count(*) as count__ from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop) as e)) as note from clip
		inner join stop_ on clip.stop_id = stop_.id
        where year(clip.created) = year_
		group by name_of_stop
		order by count_ asc limit 1
		)
		union all
		(select 'průměrný počet záběrů na zastávku:' as label,' 'as c,ROUND(avg(count_)) ,' ' as note from (select stop_.name_of_stop,count(*) as count_ from clip
		inner join stop_ on clip.stop_id = stop_.id where year(clip.created) = year_
		group by name_of_stop) as e)
		union all
		(select 'průměrný počet záběrů na den:' as label,' 'as c,ROUND(avg(count_)),' ' as note from (select created,count(*) as count_ from clip where year(clip.created) = year_ group by created) as e)
		union all
		(select 'naposledy bylo pořízeno záběrů' as label,
		' 'as c,
		(select count(*) from clip where created = (select max(created) from clip where year(clip.created) = year_)),
		(select concat('rozdíl oproti průměru: ',  (select count(*)from clip where created = (select max(created) from clip where year(clip.created) = year_))-(select ROUND(avg(count_)) from (select count(*) as count_ from clip where year(clip.created) = year_
		group by created) as e)))
		)
		union all
		(
		select 'průměrný počet záběrů na měsíc' as label,'' as c,ROUND((select avg(count_) from (select distinct date_format(created,'%Y/%m') as created_,count(*) as count_ from clip where year(clip.created) = year_
		group by created_
		order by created_ desc) as e)),'' as note
		));
	END IF;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_clips_on_days` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_clips_on_days`(year_ varchar(14))
begin
IF(year_ = '---vyberte---')THEN
select created,count(*) as count_ from clip
group by created
order by created desc;
ELSE
select created,count(*) as count_ from clip
where YEAR(created) = convert(year_,UNSIGNED)
group by created
order by created desc;
END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_clips_on_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_clips_on_month`(year_ varchar(14))
begin
IF(year_ = '---vyberte---')THEN
select distinct date_format(created,'%Y/%m') as created_,count(*) as count_ from clip
group by created_
order by created_ desc;
ELSE
select distinct month(created) as created_,count(*) as count_ from clip
where year(created) = year_
group by created_
order by created_ desc;
END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_clip_on_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_clip_on_line`(year_ varchar(14))
Begin
	IF(year_ = '---vyberte---')THEN
	select line.name_line,count(*) as count_ from clip
	inner join line on clip.line_id = line.id
	group by name_line
	order by count_ desc;
ELSE
	select line.name_line,count(*) as count_ from clip
	inner join line on clip.line_id = line.id
    where year(clip.created) = year_
	group by name_line
	order by count_ desc;
END IF;	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_clip_to_stops` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_clip_to_stops`(year_ varchar(14))
Begin
	IF(year_ = '---vyberte---')THEN
	select stop_.name_of_stop,count(*) as count_ from clip
	inner join stop_ on clip.stop_id = stop_.id
	group by name_of_stop
	order by count_ desc,name_of_stop;
    ELSE
    select stop_.name_of_stop,count(*) as count_ from clip
	inner join stop_ on clip.stop_id = stop_.id
    where year(clip.created) = year_
	group by name_of_stop
	order by count_ desc,name_of_stop;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_days_on_stop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_days_on_stop`(year_ varchar(14))
begin
IF(year_ = '---vyberte---')THEN
	select stop_.name_of_stop,count(distinct clip.created) as count_ from clip
	inner join stop_ on clip.stop_id = stop_.id
	group by name_of_stop
	order by count_ desc;
ELSE
	select stop_.name_of_stop,count(distinct clip.created) as count_ from clip
	inner join stop_ on clip.stop_id = stop_.id
    where year(clip.created) = year_
	group by name_of_stop
	order by count_ desc;
END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_lines_on_stop_from_clip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_lines_on_stop_from_clip`(year_ varchar(14))
Begin
IF (year_ = '---vyberte---')THEN
	select stop_.name_of_stop as name_stop,line.name_line as name_line,count(*) as count_ from clip
	inner join stop_ on stop_.id = clip.stop_id
	inner join line on line.id = clip.line_id
	group by name_line,name_stop
	order by name_stop,count_ desc,length(name_line),name_line;
ELSE
	select stop_.name_of_stop as name_stop,line.name_line as name_line,count(*) as count_ from clip
	inner join stop_ on stop_.id = clip.stop_id
	inner join line on line.id = clip.line_id
	where year(created) = year_
	group by name_line,name_stop
	order by name_stop,count_ desc,length(name_line),name_line;
END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_on_subtype_mean_of_transport_from_clip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_on_subtype_mean_of_transport_from_clip`(year_ varchar(14))
Begin
	IF(year_ = '---vyberte---')THEN
	select mean_of_transport.name_ as mean_of_transport, subtype_mean_of_transport.name_ as subtype,count(distinct clip.name_of_clip) as count_ from vehicles_on_clip
	inner join clip on vehicles_on_clip.clip_id = clip.id
	inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
	inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
	inner join subtype_mean_of_transport on vehicle.subtype_mean_of_transport_id = subtype_mean_of_transport.id
	group by subtype,mean_of_transport
    order by count_ desc;
    ELSE
    select mean_of_transport.name_ as mean_of_transport, subtype_mean_of_transport.name_ as subtype,count(distinct clip.name_of_clip) as count_ from vehicles_on_clip
	inner join clip on vehicles_on_clip.clip_id = clip.id
	inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
	inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
	inner join subtype_mean_of_transport on vehicle.subtype_mean_of_transport_id = subtype_mean_of_transport.id
    where year(clip.created) = year_
	group by subtype,mean_of_transport
    order by count_ desc;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalculation_subtypes_mean_of_transport_on_lines_from_clip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `recalculation_subtypes_mean_of_transport_on_lines_from_clip`(year_ varchar(14))
Begin
	IF(year_ = '---vyberte---')THEN
	select mean_of_transport.name_ as mean_of_transport, subtype_mean_of_transport.name_ as subtype,line.name_line,count(distinct clip.name_of_clip) as count_ from vehicles_on_clip
	inner join clip on vehicles_on_clip.clip_id = clip.id
	inner join line on clip.line_id = line.id
	inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
	inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
	inner join subtype_mean_of_transport on vehicle.subtype_mean_of_transport_id = subtype_mean_of_transport.id
	group by line.name_line,subtype_mean_of_transport.name_,mean_of_transport
	order by length(name_line),name_line,count_ desc;
    ELSE
	select mean_of_transport.name_ as mean_of_transport, subtype_mean_of_transport.name_ as subtype,line.name_line,count(distinct clip.name_of_clip) as count_ from vehicles_on_clip
	inner join clip on vehicles_on_clip.clip_id = clip.id
	inner join line on clip.line_id = line.id
	inner join vehicle on vehicles_on_clip.vehicle_id = vehicle.id
	inner join mean_of_transport on vehicle.mean_of_transport_id = mean_of_transport.id
	inner join subtype_mean_of_transport on vehicle.subtype_mean_of_transport_id = subtype_mean_of_transport.id
    where year(clip.created)=year_
	group by line.name_line,subtype_mean_of_transport.name_,mean_of_transport
	order by length(name_line),name_line,count_ desc;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `info_from_clip_for_filter`
--

/*!50001 DROP VIEW IF EXISTS `info_from_clip_for_filter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `info_from_clip_for_filter` AS select `clip`.`id` AS `id`,`clip`.`name_of_clip` AS `name_of_clip`,`clip`.`created` AS `created`,`clip`.`number_of_filming_day` AS `number_of_filming_day`,`clip`.`file_url` AS `file_url`,`clip`.`arrive_or_depart` AS `arrive_or_depart`,`line`.`name_line` AS `name_line`,`stop_`.`name_of_stop` AS `name_of_stop`,`stop_`.`platform` AS `platform`,`stop_`.`direction` AS `direction`,`vehicle`.`number_` AS `number_of_vehicle`,`subtype_mean_of_transport`.`name_` AS `subtype_mean_of_transport`,`mean_of_transport`.`name_` AS `mean_of_transport`,`producer`.`name_` AS `producer`,`owner_`.`name_` AS `owner_name`,`formats`.`name_` AS `format_` from (((((((((`clip` left join `vehicles_on_clip` on((`vehicles_on_clip`.`clip_id` = `clip`.`id`))) join `line` on((`clip`.`line_id` = `line`.`id`))) left join `vehicle` on((`vehicles_on_clip`.`vehicle_id` = `vehicle`.`id`))) join `subtype_mean_of_transport` on((`vehicle`.`subtype_mean_of_transport_id` = `subtype_mean_of_transport`.`id`))) join `mean_of_transport` on((`vehicle`.`mean_of_transport_id` = `mean_of_transport`.`id`))) join `stop_` on((`clip`.`stop_id` = `stop_`.`id`))) join `formats` on((`clip`.`formats_id` = `formats`.`id`))) join `producer` on((`vehicle`.`producer_id` = `producer`.`id`))) join `owner_` on((`vehicle`.`owner_id` = `owner_`.`id`))) order by `clip`.`created` desc,`clip`.`name_of_clip` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_from_clip_match_vehicles`
--

/*!50001 DROP VIEW IF EXISTS `info_from_clip_match_vehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `info_from_clip_match_vehicles` AS select `clip`.`name_of_clip` AS `name_of_clip`,`clip`.`created` AS `created`,`clip`.`number_of_filming_day` AS `number_of_filming_day`,(case when (`clip`.`arrive_or_depart` = 0) then 'příjezd' else 'odjezd' end) AS `arrive_or_depart`,`line`.`name_line` AS `name_line`,`stop_`.`name_of_stop` AS `name_of_stop`,`stop_`.`platform` AS `platform`,`stop_`.`direction` AS `direction`,group_concat(`vehicle`.`number_` separator ',') AS `number_of_vehicle`,`formats`.`name_` AS `format_` from (((((`clip` left join `vehicles_on_clip` on((`vehicles_on_clip`.`clip_id` = `clip`.`id`))) join `line` on((`clip`.`line_id` = `line`.`id`))) left join `vehicle` on((`vehicles_on_clip`.`vehicle_id` = `vehicle`.`id`))) join `stop_` on((`clip`.`stop_id` = `stop_`.`id`))) join `formats` on((`clip`.`formats_id` = `formats`.`id`))) group by `clip`.`name_of_clip`,`clip`.`created`,`clip`.`number_of_filming_day`,`clip`.`arrive_or_depart`,`line`.`name_line`,`stop_`.`name_of_stop`,`stop_`.`platform`,`stop_`.`direction`,`formats`.`name_`,`clip`.`id` order by `clip`.`created` desc,`clip`.`name_of_clip` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_from_clip_match_vehicles_ii`
--

/*!50001 DROP VIEW IF EXISTS `info_from_clip_match_vehicles_ii`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `info_from_clip_match_vehicles_ii` AS select `clip`.`id` AS `id`,`clip`.`name_of_clip` AS `name_of_clip`,`clip`.`created` AS `created`,`clip`.`number_of_filming_day` AS `number_of_filming_day`,(case when (`clip`.`arrive_or_depart` = 0) then 'příjezd' else 'odjezd' end) AS `arrive_or_depart`,`line`.`name_line` AS `name_line`,`stop_`.`name_of_stop` AS `name_of_stop`,`stop_`.`platform` AS `platform`,`stop_`.`direction` AS `direction`,group_concat(`vehicle`.`number_` separator ',') AS `number_of_vehicle`,`formats`.`name_` AS `format_` from (((((`clip` left join `vehicles_on_clip` on((`vehicles_on_clip`.`clip_id` = `clip`.`id`))) join `line` on((`clip`.`line_id` = `line`.`id`))) left join `vehicle` on((`vehicles_on_clip`.`vehicle_id` = `vehicle`.`id`))) join `stop_` on((`clip`.`stop_id` = `stop_`.`id`))) join `formats` on((`clip`.`formats_id` = `formats`.`id`))) group by `clip`.`name_of_clip`,`clip`.`created`,`clip`.`number_of_filming_day`,`clip`.`arrive_or_depart`,`line`.`name_line`,`stop_`.`name_of_stop`,`stop_`.`platform`,`stop_`.`direction`,`formats`.`name_`,`clip`.`id` order by `clip`.`created` desc,`clip`.`name_of_clip` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_vehicles`
--

/*!50001 DROP VIEW IF EXISTS `show_vehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `show_vehicles` AS select `main_vehicle`.`id` AS `id`,`main_vehicle`.`number_` AS `number_`,`main_vehicle`.`vehicle_registration_plate` AS `vehicle_registration_plate`,`main_vehicle`.`year_of_made` AS `year_of_made`,`main_vehicle`.`in_operation_from` AS `In_operation_from`,`main_vehicle`.`in_operation_to` AS `in_operation_to`,(case when (`main_vehicle`.`is_low_rise` = 0) then 'ne' else 'ano' end) AS `is_low_rise`,(case when (`main_vehicle`.`have_air_conditioning` = 0) then 'ne' else 'ano' end) AS `have_air_conditioning`,`producer`.`name_` AS `producer`,`mean_of_transport`.`name_` AS `mean_of_transport`,`subtype_mean_of_transport`.`name_` AS `subtype_mean_of_transport`,`owner_`.`name_` AS `owner_`,`hiearch_vehicle`.`number_` AS `predecessor`,`main_vehicle`.`direction_of_vehicle` AS `DIRECTION_OF_VEHICLE` from (((((`vehicle` `main_vehicle` join `producer` on((`producer`.`id` = `main_vehicle`.`producer_id`))) join `mean_of_transport` on((`mean_of_transport`.`id` = `main_vehicle`.`mean_of_transport_id`))) join `subtype_mean_of_transport` on((`subtype_mean_of_transport`.`id` = `main_vehicle`.`subtype_mean_of_transport_id`))) join `owner_` on((`owner_`.`id` = `main_vehicle`.`owner_id`))) left join `vehicle` `hiearch_vehicle` on((`main_vehicle`.`vehicle_id` = `hiearch_vehicle`.`id`))) order by `main_vehicle`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 11:48:44
