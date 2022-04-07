-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 15.165.15.224    Database: forest
-- ------------------------------------------------------
-- Server version	8.0.28

drop schema if exists forest;
CREATE SCHEMA IF NOT EXISTS `forest` DEFAULT CHARACTER SET utf8 ;
USE `forest` ;

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'swkim0128@naver.com',0,1,2),(2,'qwer@qwer.com',0,1,5),(3,'test22@test.com',0,1,7),(4,'12312@naver.com',0,1,8),(5,'1212@test.com',0,1,9),(6,'qwerty@naver.com',0,1,10),(7,'111@naver.com',0,1,11),(8,'222@naver.com',0,1,12);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_preference`
--

DROP TABLE IF EXISTS `accounts_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_preference` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `watering` varchar(255) NOT NULL,
  `flower_presence` varchar(255) NOT NULL,
  `manage_difficulty` varchar(255) NOT NULL,
  `growth_rate` varchar(255) NOT NULL,
  `placement` varchar(255) NOT NULL,
  `index` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_preference_user_id_7a4b98dd_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_preference_user_id_7a4b98dd_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_preference`
--

LOCK TABLES `accounts_preference` WRITE;
/*!40000 ALTER TABLE `accounts_preference` DISABLE KEYS */;
INSERT INTO `accounts_preference` VALUES (1,'2,1','1','2','1','1,3',0,10),(2,'0','0','0','0','0',10,8),(3,'3,1','1','2','1','2,3',20,10),(4,'1','1','2','1','1',0,8),(5,'4','0','2','1','3',0,10),(6,'0','0','0','0','0',0,8),(7,'0','0','0','0','0',10,8);
/*!40000 ALTER TABLE `accounts_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `role` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$320000$3Wu0gSXCt6ojvlmBi3IPXX$M6G0Yls6xbauBSkSSuxULhCk/UQkdylgk64lpdciV1Y=',NULL,1,'','',1,1,'2022-03-31 04:43:33.931373','admin@admin.com','',NULL,NULL,'',0),(2,'pbkdf2_sha256$320000$fIop2fmbRrqdTzHtlcdgpR$tc8aNUTi8zFkma1xtvfbGRi3u+1EwD/xxoUOr1KCF5k=','2022-04-05 01:34:46.606387',0,'','',0,1,'2022-04-05 01:34:46.342720','swkim0128@naver.com','eunsol',NULL,'m','images/users/아키텍처.png',0),(3,'pbkdf2_sha256$320000$uauPM666HsoX6WtDkoKRHg$QmRgxrk7gQcaBrsu5fXpQ81NhbV5Um6c82/1IBTxJv0=',NULL,0,'','',0,1,'2022-04-05 06:23:31.169420','1q2w3e4r@email.com','1q2w3e4r',NULL,NULL,'',0),(4,'pbkdf2_sha256$320000$yqBfuNr9YhEGU44ZjdydGc$5TDzniWAopJ51GwLpvTwi4u5HvuScZ2vyh3PgxLM728=',NULL,0,'','',0,1,'2022-04-05 06:25:10.122919','1q2w3e4r@naver.com','qwer',NULL,NULL,'',0),(5,'pbkdf2_sha256$320000$zR8C157vdgbxklNlihapOK$AxXrFC5Fyd4Ihcv2FUuvp0wuOq4dcFppRyLSYhmdZVg=','2022-04-05 06:50:40.895938',0,'','',0,1,'2022-04-05 06:50:40.614929','qwer@qwer.com','qwer',NULL,NULL,'',0),(6,'pbkdf2_sha256$320000$RsqtA3LTJ2aNVVcCUm1R4I$MSHn0Jdckjw/g1zGAaUZSAN8Fb5Wr+V5SEh/LwAKUzc=',NULL,0,'','',0,1,'2022-04-05 06:57:50.480594','1q2w3e@naver.com','qwerty',NULL,NULL,'',0),(7,'pbkdf2_sha256$320000$gyvTMcof4ZEwy6IaZRaLQP$syMpztFhC5Oa8EDcrQCCheZfpVaxuCoCMGt6vFp4vCY=','2022-04-05 08:35:44.446065',0,'','',0,1,'2022-04-05 08:35:44.181128','test22@test.com','dasda','1999-11-11','M','',1),(8,'pbkdf2_sha256$320000$Azmf9lp2AKIYrvGaqCyOVm$pgkG93fl3ClyBwSWqKqm5YWIQye+aixTCqTgOjytL8w=','2022-04-05 08:39:57.865504',0,'','',0,1,'2022-04-05 08:39:57.614842','12312@naver.com','qwerty',NULL,NULL,'',0),(9,'pbkdf2_sha256$320000$TjY5SK7HIXdj5ZiidbJALz$+3+mpJCefTs2AfWiwOmYnLbm258hAqxkeRnBJI/klKo=','2022-04-06 02:31:02.050426',0,'','',0,1,'2022-04-06 02:31:01.787497','1212@test.com','1212',NULL,NULL,'',1),(10,'pbkdf2_sha256$320000$wW8K3LWZy41zKZ7b5ZGrbv$XEAQ9lDwXaErTrrV2TLamKm+NA7punkmqY7L5Nqelrc=','2022-04-06 04:22:35.802086',0,'','',0,1,'2022-04-06 04:22:35.545531','qwerty@naver.com','qwerty',NULL,NULL,'',0),(11,'pbkdf2_sha256$320000$nqaCZw3jasmJw97IjaJKtz$jy3EdYMR4aA/gWXxUp271kyjLjlSpdnBdcq0jS6yHQc=','2022-04-06 14:26:04.066348',0,'','',0,1,'2022-04-06 14:26:03.813830','111@naver.com','111',NULL,NULL,'',1),(12,'pbkdf2_sha256$320000$2fKMm2jngwbK4OV6TaDdQS$KI7Ir4oryPHR6QCKJcvdi+kXZLIB7rpWCe168ttp6Hs=','2022-04-06 14:47:02.365686',0,'','',0,1,'2022-04-06 14:47:02.114088','222@naver.com','222',NULL,NULL,'',0);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add blacklisted token',9,'add_blacklistedtoken'),(34,'Can change blacklisted token',9,'change_blacklistedtoken'),(35,'Can delete blacklisted token',9,'delete_blacklistedtoken'),(36,'Can view blacklisted token',9,'view_blacklistedtoken'),(37,'Can add outstanding token',10,'add_outstandingtoken'),(38,'Can change outstanding token',10,'change_outstandingtoken'),(39,'Can delete outstanding token',10,'delete_outstandingtoken'),(40,'Can view outstanding token',10,'view_outstandingtoken'),(41,'Can add email address',11,'add_emailaddress'),(42,'Can change email address',11,'change_emailaddress'),(43,'Can delete email address',11,'delete_emailaddress'),(44,'Can view email address',11,'view_emailaddress'),(45,'Can add email confirmation',12,'add_emailconfirmation'),(46,'Can change email confirmation',12,'change_emailconfirmation'),(47,'Can delete email confirmation',12,'delete_emailconfirmation'),(48,'Can view email confirmation',12,'view_emailconfirmation'),(49,'Can add social account',13,'add_socialaccount'),(50,'Can change social account',13,'change_socialaccount'),(51,'Can delete social account',13,'delete_socialaccount'),(52,'Can view social account',13,'view_socialaccount'),(53,'Can add social application',14,'add_socialapp'),(54,'Can change social application',14,'change_socialapp'),(55,'Can delete social application',14,'delete_socialapp'),(56,'Can view social application',14,'view_socialapp'),(57,'Can add social application token',15,'add_socialtoken'),(58,'Can change social application token',15,'change_socialtoken'),(59,'Can delete social application token',15,'delete_socialtoken'),(60,'Can view social application token',15,'view_socialtoken'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add preference',17,'add_preference'),(66,'Can change preference',17,'change_preference'),(67,'Can delete preference',17,'delete_preference'),(68,'Can view preference',17,'view_preference'),(69,'Can add plant',18,'add_plant'),(70,'Can change plant',18,'change_plant'),(71,'Can delete plant',18,'delete_plant'),(72,'Can view plant',18,'view_plant'),(73,'Can add product',19,'add_product'),(74,'Can change product',19,'change_product'),(75,'Can delete product',19,'delete_product'),(76,'Can view product',19,'view_product'),(77,'Can add wishlist',20,'add_wishlist'),(78,'Can change wishlist',20,'change_wishlist'),(79,'Can delete wishlist',20,'delete_wishlist'),(80,'Can view wishlist',20,'view_wishlist'),(81,'Can add review',21,'add_review'),(82,'Can change review',21,'change_review'),(83,'Can delete review',21,'delete_review'),(84,'Can view review',21,'view_review'),(85,'Can add buy',22,'add_buy'),(86,'Can change buy',22,'change_buy'),(87,'Can delete buy',22,'delete_buy'),(88,'Can view buy',22,'view_buy'),(89,'Can add store',23,'add_store'),(90,'Can change store',23,'change_store'),(91,'Can delete store',23,'delete_store'),(92,'Can view store',23,'view_store'),(93,'Can add post',24,'add_post'),(94,'Can change post',24,'change_post'),(95,'Can delete post',24,'delete_post'),(96,'Can view post',24,'view_post'),(97,'Can add comment',25,'add_comment'),(98,'Can change comment',25,'change_comment'),(99,'Can delete comment',25,'delete_comment'),(100,'Can view comment',25,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'account','emailaddress'),(12,'account','emailconfirmation'),(17,'accounts','preference'),(16,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(18,'plant','plant'),(25,'post','comment'),(24,'post','post'),(22,'product','buy'),(19,'product','product'),(21,'product','review'),(20,'product','wishlist'),(5,'sessions','session'),(6,'sites','site'),(13,'socialaccount','socialaccount'),(14,'socialaccount','socialapp'),(15,'socialaccount','socialtoken'),(23,'store','store'),(9,'token_blacklist','blacklistedtoken'),(10,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-30 07:40:24.692462'),(2,'contenttypes','0002_remove_content_type_name','2022-03-30 07:40:24.800728'),(3,'auth','0001_initial','2022-03-30 07:40:25.162205'),(4,'auth','0002_alter_permission_name_max_length','2022-03-30 07:40:25.238369'),(5,'auth','0003_alter_user_email_max_length','2022-03-30 07:40:25.249218'),(6,'auth','0004_alter_user_username_opts','2022-03-30 07:40:25.260032'),(7,'auth','0005_alter_user_last_login_null','2022-03-30 07:40:25.270838'),(8,'auth','0006_require_contenttypes_0002','2022-03-30 07:40:25.277122'),(9,'auth','0007_alter_validators_add_error_messages','2022-03-30 07:40:25.287111'),(10,'auth','0008_alter_user_username_max_length','2022-03-30 07:40:25.297619'),(11,'auth','0009_alter_user_last_name_max_length','2022-03-30 07:40:25.308353'),(12,'auth','0010_alter_group_name_max_length','2022-03-30 07:40:25.333459'),(13,'auth','0011_update_proxy_permissions','2022-03-30 07:40:25.347310'),(14,'auth','0012_alter_user_first_name_max_length','2022-03-30 07:40:25.358166'),(15,'accounts','0001_initial','2022-03-30 07:40:25.782588'),(16,'account','0001_initial','2022-03-30 07:40:26.021078'),(17,'account','0002_email_max_length','2022-03-30 07:40:26.054527'),(18,'accounts','0002_preference','2022-03-30 07:40:26.168356'),(19,'admin','0001_initial','2022-03-30 07:40:26.362259'),(20,'admin','0002_logentry_remove_auto_add','2022-03-30 07:40:26.378278'),(21,'admin','0003_logentry_add_action_flag_choices','2022-03-30 07:40:26.395987'),(22,'authtoken','0001_initial','2022-03-30 07:40:26.506132'),(23,'authtoken','0002_auto_20160226_1747','2022-03-30 07:40:26.550240'),(24,'authtoken','0003_tokenproxy','2022-03-30 07:40:26.558398'),(25,'plant','0001_initial','2022-03-30 07:40:26.597536'),(26,'post','0001_initial','2022-03-30 07:40:26.891586'),(27,'store','0001_initial','2022-03-30 07:40:27.010650'),(28,'product','0001_initial','2022-03-30 07:40:27.738300'),(29,'sessions','0001_initial','2022-03-30 07:40:27.800550'),(30,'sites','0001_initial','2022-03-30 07:40:27.836589'),(31,'sites','0002_alter_domain_unique','2022-03-30 07:40:27.868318'),(32,'socialaccount','0001_initial','2022-03-30 07:40:28.499265'),(33,'socialaccount','0002_token_max_lengths','2022-03-30 07:40:28.583494'),(34,'socialaccount','0003_extra_data_default_dict','2022-03-30 07:40:28.608487'),(35,'token_blacklist','0001_initial','2022-03-30 07:40:28.865541'),(36,'token_blacklist','0002_outstandingtoken_jti_hex','2022-03-30 07:40:28.915334'),(37,'token_blacklist','0003_auto_20171017_2007','2022-03-30 07:40:28.946283'),(38,'token_blacklist','0004_auto_20171017_2013','2022-03-30 07:40:29.056031'),(39,'token_blacklist','0005_remove_outstandingtoken_jti','2022-03-30 07:40:29.221403'),(40,'token_blacklist','0006_auto_20171017_2113','2022-03-30 07:40:29.268854'),(41,'token_blacklist','0007_auto_20171017_2214','2022-03-30 07:40:29.554320'),(42,'token_blacklist','0008_migrate_to_bigautofield','2022-03-30 07:40:29.902007'),(43,'token_blacklist','0010_fix_migrate_to_bigautofield','2022-03-30 07:40:29.937749'),(44,'token_blacklist','0011_linearizes_history','2022-03-30 07:40:29.945749'),(45,'token_blacklist','0012_alter_outstandingtoken_user','2022-03-30 07:40:29.972843'),(46,'post','0002_alter_post_image','2022-04-06 08:49:13.545821'),(47,'post','0003_alter_post_image','2022-04-06 08:55:44.960757');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('by5sapq6fxqyjpkgk31nyzm25qms522x','.eJxVjEsOwjAMRO_iNaoa0_8OLhI5tqNGhFSiCRvE3WlRN13OvJn3AWJeSsr2ra_gg4rVJ4UIUyoxXsBSybMtq75sEJjAIJxKR_zQtBOKca-rw1f9Nwdeq9uWNOXAlMOS7sfrpJppnTcPsyNPbKjBWjzKlZoBW0dGUUUETTNiv7FapW8773v03A00MrnaOUPw_QHoCUkz:1nc6w2:A9O3lZkJpYKd7cAhxRoaDCFc1eKUYk75BMPGPzUzTO4','2022-04-20 14:47:02.384480'),('gdndnqgmy5zea5trxdii67vsgtw9ll8n','.eJxVjDsOgzAQRO_iOkL-YTBdchFrd70IK46RwKSJcvdAREM5b2beRwDRvJUa3rykMXEM_IKUxVC2nG8iwFansK28hBTFIHpxYQj05HIUkPOBm1PX_DdnvTb3PXGpiaCmuTzO10U1wTrtntb0aLyLbNBH5yWgdWytcWZEqbG1OmpN2GnvFLkI1HnpldYtK1LSo_j-AHORRxg:1nbejF:LQAsdK6WhT7bWfw5hXj2nw2B1XKW6q97Ep7GlvV3H_I','2022-04-19 08:39:57.884078'),('lbllv9fptcgpzhn2jj4uethr0m8b3lfb','.eJxVjMsOgyAURP-FdWN4lJe7-iPkAtdISjFR6KbpvxcbNy5nzsz5EAhhbaW6N25pThgdviBlMpaW8404aHVxbcfNpUhGwhi5lB7CE8tBIOejHk7f8N-ceB8ePWGpKUBNa5nO10W1wL50j0LPLfcxRKMVldbamWnLqaBGKFQUKXBj6F2KzrSZFYtSd-qBMiOFJ98fhONGPA:1nc6bk:pXSWfbfgmtmy6cR8jpV57EIkK-M2iNmaBE3ogoVRCi0','2022-04-20 14:26:04.089065'),('lcxoq6eiaqdvhg7n4luruccmtv1kq7q5','.eJxVjMEOgyAQRP9lz41pEQW9tT9Clt0lklJMFHpp-u_VxovHeTPzPoBEc83FvWWJIQo7eWFMMOaa0gUc1jK5usriIsMIHZyYR3pK3gtMacfNoWv-m6Nem_uWJJdIWOKcH8frpJpwnTaP9q3SZKlrgzK9b01_U0jcGwmM2lpCY7TG7hqYmMgHZdEqO_BA7NkgfH-Rg0ja:1nbd1U:Vk4ywNhV1UHkzJwEG8o4441RZGjfpFOcT5OnfPaVJ1g','2022-04-19 06:50:40.958386'),('o95hpt9zjyixk7zvw3kyjzaynqmeshq9','.eJxVjEEOgyAURO_CujEqENFdexEyfD6RlGKi0E3Tu1cbNy7nzcz7CBAtNRf75jWGyN7yCzGJKdeUbsKiltnWjVcbvZjEIC7MgZ6cjwIpHbg5dc1_c9Zbc98T5xIJJS75cb4uqhnbvHucJyjSGn0LySN5b0j1Yeyk0bo1HQYftOqcd0EDwZlhZKeC3JGChBHfH62bSMQ:1nbefA:I9rUMCfgzOkeM5bCHjkYfAbS0CVluSK2tFTJg83431w','2022-04-19 08:35:44.508946'),('sx78d3c3vxvk4jmzi1baykw0udis0g2q','.eJxVjMEOgyAQRP-Fc2NAtIK3-iNk2V0iKcVEoZem_15tvHicNzPvIwBxqbm4N68xRCbHL4hJjLmmdBMOapld3Xh1kcQolBQX6AGfnI8GUjpwc_qa_-ast-axJ84lIpS45Ol8XVQzbPPuITZ9kEZ71bd9a61sBzl49NSZoFlZMoTMvtPKsrakjA13iWg9ABF3Snx_r_dIeA:1nbxBj:XouiB8U2xlf1z2YtKAIWr9-nau_CTZaNYRrubwxXRmQ','2022-04-20 04:22:35.859912'),('xd7v4jbxfmhkhjwj2d2n283reozeylns','.eJxVjMEOgyAQRP9lz41ZwIJ6a3-ELLBEUopJhV6a_nu18eJx3sy8D5D3SyvVvvmVYuJg-Ukpw1Razhew1Ops28ovmwJMIOHEHPkHl72gnHfcHbruvznqtbttiUtNnmpayv14nVQzrfPmCehlYGRiiVoLlj4a6VEM7KIcrkoaFIa0UVG4qMYeNQUihf0YSOnBwfcHi2VHvg:1nbY5m:z3pW49vbk6BpOpg1c_AemJd47g-hXtXk6StBVWkgcos','2022-04-19 01:34:46.686535'),('zckv6i3wj287ulpbrxd505g8y0dfx0sp','.eJxVjMEOgyAQRP9lz40BUQRv7Y-QdVkiKcVEoZem_15tvHicNzPvA0i01Fzcm9cYInvHL4wJxlxTuoHDWmZXN15d9DCChQubkJ6cjwJTOnBz6pr_5qy35r4nziUSlrjkx_m6qGbc5t0zsWHjZTDBtLrrAwYtB0uohJ2EDi0Jr6X3vRaoJHYk7SCU1aYXhG1gBd8fk11Hsw:1nbvRm:hAyCgRGX1i7lk30a3wlYeOAnKcHfENCQ9AA7tDb9ITo','2022-04-20 02:31:02.127965');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_plant`
--

DROP TABLE IF EXISTS `plant_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_plant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `character` longtext,
  `watering` longtext,
  `light_demand` varchar(255) DEFAULT NULL,
  `humidity` varchar(50) DEFAULT NULL,
  `flower_presence` varchar(3) DEFAULT NULL,
  `flower_color` varchar(50) DEFAULT NULL,
  `manage_difficulty` varchar(50) DEFAULT NULL,
  `winter_minimum_temperature` varchar(50) DEFAULT NULL,
  `growth_rate` varchar(50) DEFAULT NULL,
  `placement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_plant`
--

LOCK TABLES `plant_plant` WRITE;
/*!40000 ALTER TABLE `plant_plant` DISABLE KEYS */;
INSERT INTO `plant_plant` VALUES (1,'가울테리아','images/plants/가울테리아.jpg','진달래과의 작은 관목으로 척박한 산성토양에서 잘 자라며 키는 20cm정도로 포복형이다.  암석정원에 잘 어울린다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','쉬움','0℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(2,'개운죽','images/plants/개운죽.jpg','화분에 심을 경우에는 부드럽고 배수가 잘 되는 토양에 심음 ※ 개운죽은 관엽으로 분류되어 있지만 사실은 잎보다 잎이 떨어진 후 대나무처럼 보이는 줄기가 더욱 관상의 대상이 된다. 직선보다 곡선의 줄기가 필요한 경우에는 줄기를 곡선으로 유도할 수 있다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(3,'골드크레스트 \'윌마\'','images/plants/골드크레스트 \'윌마\'.jpg','※ Cupressus macrocarpa 품종 중에 \'wilma\', \'goldcrest\' 등의 품종이 있는데, 우리가 사용하고 있는 율마라는 이름은 “wilma\"에서 나온 것으로 생각된다. 따라서 율마라는 이름이 윌마로 교정되어야하지 않을까 고려된다.바람에 약하며 줄기 아랫부분의 잎이 떨어지면 황량한 느낌을 주지만 토피아리 형식으로 키울 수도 있다.크리스마스 트리로 실내에 장식하면 좋다.\"','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(4,'공작야자','images/plants/공작야자.jpg','포름알데히드, 벤젠, 톨루엔, 트리클로로 에틸렌','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','Y','흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(5,'관엽베고니아','images/plants/관엽베고니아.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(6,'관음죽','images/plants/관음죽.jpg','손바닥 모양의 잎을 가진 집에서 기르기 쉽고 그늘과 추위에도 잘 견디고 병해충에도 강하기기 때문에 기르기 쉬운 식물이다. 자라는 속도가 느려서 관리가 편하다. 반엽이 들어있는 종은 색상이 더욱 아름답다. 2년에 한 번씩 분갈이를 해 주면 좋다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','5℃','느림','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(7,'구문초','images/plants/구문초.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','어려움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(8,'구즈마니아','images/plants/구즈마니아.jpg','식물체 중심 잎과 잎 포기 사이 물통에 물이 고이도록 함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,노랑색','어려움','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(9,'군자란','images/plants/군자란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','빨강색,오렌지색,노랑색','보통','10℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(10,'글레코마','images/plants/글레코마.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','쉬움','5℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(11,'금목서','images/plants/금목서.jpg','땅에서부터 많은 줄기가 올라와 생울타리로 적당하다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','오렌지색,노랑색,흰색','쉬움','0℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(12,'금사철나무','images/plants/금사철나무.jpg','Skill Level: Beginner','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','0℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(13,'금식나무','images/plants/금식나무.jpg','민간요법으로 나무껍질과 잎을 뱀독이나 종기,화상 등에 약으로 쓰기도 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','파랑색,노랑색','쉬움','0℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(14,'금전수','images/plants/금전수.jpg','그늘진 곳에서 잘 견디지만, 실내 밝은 간접광이 더 좋다. 환경 조건에 견디는 힘이 뛰어나고 과습한 상태에서 저온상태가 되면 뿌리가 썩기 쉽다. 수분이 많은 지하경을 가지고 광택이 있는 잎이 매력적이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(15,'금천죽','images/plants/금천죽.jpg','포름알데히드, 벤젠, 톨루엔, 자일렌, 트리클로로 에틸렌','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(16,'기누라','images/plants/기누라.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(17,'꽃베고니아','images/plants/꽃베고니아.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','70% 이상','Y','분홍색,빨강색,오렌지색,흰색','보통','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(18,'나도풍란','images/plants/나도풍란.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','70% 이상','Y','흰색,기타','어려움','7℃','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(19,'나한송','images/plants/나한송.jpg','나한송은 잎이 잘 떨어지거나 누렇게 변하지 않고 늘 푸르러 공기정화 효과가 좋다. 잎이 반질거리고 잎을 감상하기에 좋은 식물이다. 나한송 솔잎 모양에 화려하지 않지만 음지에서도 비교적 잘 자리고 자라는 속도는 늦어 실내용품으로 많이 애용하고 있다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','쉬움','5℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(20,'남천','images/plants/남천.jpg','꽃, 열매, 잎, 단풍이 모두 아름답고 실내의 동양적인 분위기에 잘 어울린다.  성숙한 열매를 남천실이라 하며 해수, 천식, 백일해, 간기능장애 등에 약제로 사용한다.','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','쉬움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(21,'네마탄투스','images/plants/네마탄투스.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','빨강색,오렌지색','보통','10℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(22,'네오레겔리아','images/plants/네오레겔리아.jpg','Soil Type:    Use a GOOD rich potting soil (a soil that retains water yet drains well), such as an African violet mix. If you want to mix your own take: 1 part humus (leaf mold), 1 part peat and 1 part coarse sand or perlite. Always use a pot with a hole.   General Description:  The broad, verdant rosettes of this epiphytic bromeliad blush red at their center as they bloom. It is native to tropical forests of Brazil.   Neoregelia carolinae produces evergreen rosettes of leathery, arching, strap-shaped leaves with finely toothed margins. The leaf bases at the center of the rosette form a tubular cup which catches and holds water. Mature rosettes bear tiny lavender blooms on dome-shaped flower heads that are held within the blushing \'water cup.\' Rosettes die after flowering, producing offsets (pups) to take their place.   This tropical tree-dweller loves humidity, warmth, and a moist, well-drained growing medium. Secure it to a tree branch in a tropical garden or greenhouse, or grow it in a porous potting mix that\'s rich in organic matter (such as sphagnum or pelleted bark). Keep the rosette \'cup\' filled with water from spring to fall, especially if plants are exposed to direct sun rays. Water sparingly from late fall through winter. Blushing bromeliad makes a nice border accent or massed groundcover for frost-free gardens.   Among the named selections of this bromeliad are \'Flandria,\' with cream-edged leaves and bright scarlet centers. The leaves of variety tricolor have pale yellow and pink stripings.  Usage-Container, Groundcover, Houseplant, Mixed Border, Tropical','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','Y','보라색,분홍색,빨강색,흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(23,'녹영','images/plants/녹영.jpg','실내 걸이용 화분이고 건조에 강한 식물이므로 겉흙이 완전히 마르면 관수한다.   사계절을 통하여 피는 작고 하얀 꽃이 파란 콩 모양의 잎과 더불어 귀엽다. 온도가 낮은 환경에서는 특별히 흙을 건조하게 관리하여야 한다.','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(24,'뉴기니아봉선화','images/plants/뉴기니아봉선화.jpg','● 열대성 작물로 추위에 약한 다년생의 초본 또는 반 관목으로 반그늘에서도 생육 및 개화하 양호함  ● 초장은 일반적으로 30~60cm로 자라고 잎은 난형피침형으로 긴 잎자루가 있으며 화경이 겨드랑이에서 나오고 화경마다 2.5~4.0cm되는 꽃이 1~3개 핌  ● 생육적온은 20~25℃정도이고, 15℃이하가 되면 생육 및 착화가 둔화됨  ● 뉴기니아봉선화는 여름철을 대표하는 분화류  ● 5월에 모종을 구매해 햇빛이 잘 드는 실내에서 기르면 여름철 내내 꽃을 볼 수 있음  ● 속명은 라틴어의 impatience(참을 수 없는)에서 유래  ● 뉴기니아 봉선화의 개화에 대한 일장반응은 중성식물로 계절에 관계없이 잘 개화한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','Y','분홍색,빨강색,오렌지색,흰색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(25,'대만고무나무','images/plants/대만고무나무.jpg','대만고무나무의 밑둥을 분재처럼 둥글게 재배한 종류를 ‘인삼벤자민’,‘가쥬마루’라 부른다. 환경에 빨리 적응하지 못하므로 갑자기 햇빛으로 내놓거나, 실내로 옮기면 잎이 많이 떨어지므로 서서히 적응기간을 두어 옮긴다. 상록 교목으로 자생지에서는 25cm정도 자라지만 온실 화분내에서는 1.2~1.8m 정도 자란다. 줄기에는 기근이 발생된다.  잎 길이는 5~10cm정도이며 비후하고 광택이 있다. 번식은 삽목 또는 고취법으로 행한다. 동일종 내에서도 잎이 크기가 다르며 형태차도 크다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(26,'더피고사리','images/plants/더피고사리.jpg','더피고사리는 습한 것을 좋아하는 양치류로 늘 신선한 물로 산소가 필요하므로 생장기에는 물이 부족하지 않도록 관리해야 한다.  수분이 부족하게 되면 바로 잎끝이 상한다. 한번 말리면 회복이 힘들다.  여름철 청량감을 주는 외형으로 그린인테리어로 많이 활용되며 추위에 비교적 잘 견디는 식물이다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','쉬움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(27,'덕구리난','images/plants/덕구리난.jpg','덕구리란(德久利蘭,nolina recurvata)    도꾸리란 (Beaucarnea recurvata)    줄기 밑동에 물을 많이 저장하여 술병처럼 부푼 모양으로 비대한 줄기에 수분을 저장하고 있어 과습한 경우에 줄기가 물러질 수 있다.  덕리(德利:돗쿠리)는 입구가 좁고 긴 술병(일본어) 모습을 하고 있어 붙여진 이름으로 덕구리난은 실내가 실내가 고온건조하고 햇빛이 잘 드는 곳에서 자란다. 반음지에서도 자라긴 하나 너무 음지에서 자라면 웃자라서 모양이 망가지니 햇빛을 충분히 받도록 해야 한다.  덕구리난은 봄부터 가을 사이에는 화분의 흙 표면이 마르면 물을 충분히 주고, 더운 시기에는 잎에 물을 주고 추운시기에는 흙을 좀더 건조하게 관리한다. 5~10월에 완효성비료를 2개월에 한번 주고, 습기가 많으면 깍지벌레가 발생하기 쉬우니 주의한다.','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40% 미만','','','쉬움','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(28,'데코라고무나무','images/plants/데코라고무나무.jpg','가지변이종으로 붉은 빛이 도는 짙은 녹색잎에, 뒷면 중륵과 잎자루가 붉은 갈색입니다. 열매는 긴 타원형이며 무화과같이 생기고 노란빛을 띤 녹색으로 성숙한다. 높이는 30cm이상 자라며, 털이 없고 잎과 줄기를 자르면 흰 즙이 나온다. 잎은 어긋나고 타원형이거나 긴 타원형이며, 어릴 때는 턱잎으로 싸이고 붉은빛을 띤다.  꽃은 6∼7월에 피는데, 잎겨드랑이에 1∼2개의 꽃차례로 핀다.  털이 없고 기근을 내린다. 잎과 줄기를 자르면 흰 즙이 나온다. 잎 표피 밑에 종유체가 있고, 꽃턱은 막질은 종이처럼 반투명 하다. 이 데코라고무나무의 변종으로 소피아고무나무가 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(29,'덴파레','images/plants/덴파레.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,빨강색,노랑색,흰색,혼합색','보통','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(30,'도깨비고비','images/plants/도깨비고비.jpg','바닷가와 섬의 저지대의 바위틈에서 자란다. 잎자루의 길이는 15~40cm이며, 비늘조각이 붙는다. 잎 몸의 길이가 20~60cm, 폭이 10~25cm 잎 조각의 길이는 7~13cm, 폭 2.5~5.0cm이다. 상록성으로서 짧고 굵은 뿌리를 가진다. 겹잎으로 끝이 갑자기 뾰족해지며, 포자낭군은 뒷면 전체에 붙으며, 표막이 둥글고 성숙하면 중앙부가 흑갈색으로 된다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','','','쉬움','0℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(31,'돈나무','images/plants/돈나무.jpg','돈나무란 Money tree와는 상관이 없고, 제주도에서 돈나무를 똥낭, 즉 똥나무라는 뜻으로 부르는데서 연유했다. 이는 열매가 겨우내 끈적한 점액질에 싸여 있어서 온갖 곤충과 벌레들이 모여들어 지저분하게 보이기 때문이다. 남쪽에서 주로 자라나며, 지역에 따라 이름이 여러 가지로 불린다. 높이가 최대 2~3m 까지 자라며, 잎의 길이는 4~10cm, 너비는 2~3cm 잎 가장자리에는 톱니가 없고 뒤로 말려 있으며, 꽃의 지름은 1cm안팎이다. 꽃이 지고 열매를 맺는데 길이가 1.5cm쯤 되고, 열매는 둥글거나 넓은 타원형이고 길이가 1.2cm 이며, 익으면 두 갈래로 붉은 씨가 나타난다. 생육온도는 16~10℃ 정도, 습도는 40~70% 정도 이다. 염분 저항성이 있어 해안지방의 방풍림으로 좋으며 목재는 어구 재료로사용하고 잎은 가축의 먹이로 이용가능하다.  枝葉(지엽) 및 皮(피)를 七里香(칠리향)이라 하며 약용한다. 돈나무는 혈압을 낮추며 습진과 혈액순환에 약제로 쓰이기도 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,흰색','쉬움','0℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(32,'동백','images/plants/동백.jpg','동백은 상록 활엽소 교목으로 남부지방, 제주도에 자생한다 꽃은 12~4월에 피어서 결실기는 가을이다. 잎은 타원형이고 길이 5~12cm. 폭 3~7cm이며, 엽병은 길이 2~15mm로 털이 없다.  꽃의 열매는 지름 3~5mm로 붉은색이 돌며 9월에 성숙한다. (“산다화“라 하며 약용으로 이용한다.) 동백나무는 꽃봉오리의 채취시기는 춘추부터 곡우(4월) 사이에 채취한다.','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,흰색,혼합색','어려움','0℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(33,'둥근잎 아랄리아','images/plants/둥근잎 아랄리아.jpg','가장자리에 무늬가 있는 잎도, 무늬가 없는 잎도 다 같이 단정하고 매력적이어서 동양적인 이미지의 나무이다. 키가 큰 나무는 고가이므로 작은 크기의 나무를 사서 잘 관리한다. 키우기가 쉽지 않은 품종이다. 특히 환경이 맞지 않으면 잎이 쉽게 떨어지므로 직사광선이 아닌 밝은 빛에 식물을 두고 겨울에는 건조하거나 춥지 않게 관리해야 한다. 가장 중요한 문제는 습도조절이다. 자주 잎에 분무해 주면 공중습도 유지에 좋다.   삽목시에는 발근 촉진제를 사용하는 편이 성공할 확률이 높다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(34,'듀란타','images/plants/듀란타.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,기타','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(35,'드라세나  \'송오브자마이카\'','images/plants/드라세나  \'송오브자마이카\'.jpg','높이는 2-3m, 직립으로 자라며 잎은 길고 피침형으로 길이는 10-22cm, 폭 1.5-2cm의 황색바탕에 녹색의 외곽무늬가 들어 있으며 내음성이 강하다. 실내의 가장 밝은 장소에서 잘 자라는 편이며, 너무 어두운 그늘에 두고 키우면 광량 부족과 화분 흙이 과습한 경우 줄기가 가늘게 웃자라는 것은 물론 잎들이 떨어지며 줄기와 뿌리가 썩는 경우가 있다. 줄기를 잘라 삽목 하거나 어린 개체를 나누거나, 취목으로도 번식 할 수 있다. 잎끝 색이 바뀌거나 말라 들어가는 경우가 있으므로 2년에 한번 정도 청결한 흙으로 분갈이하는 것이 좋다. 줄기와 잎이 부드러운 느낌을 주어 실내 분화로 인기가 많다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','5℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(36,'드라세나  \'와네끼\'','images/plants/드라세나  \'와네끼\'.jpg','드라세나 와네키는 생육속도가 느린 편 이지만 누구나 쉽게 키울 수 있는 공기정화 식물이다. 가정에서 키우면 키가 보통 1m 안팎으로 자라지만 환경이 좋은 곳에서는 3m까지도 자란다. (잎의 길이: 20~50cm 폭 2~5cm정도 된다.) 물은 보통이며 약간 건조한 환경에서도 스프레이로 분무하면 잘 자란다. (물을 과하게 줄 경우 잎 끝이 갈색으로 변하기도 하고 물이 너무 부족하면 병약한 잎이 나오기도 한다.) 분갈이 시 화원에서 판매하는 배수성이 좋은 화분용 배합토에 모래나 마사토를 20~30% 섞어서 하면 된다. 반그늘을 좋아하며 여름철에는 다습한 환경을 좋아한다. (주기적으로 화분 위치를 바꿔 골고루 햇빛을 받을 수 있도록 한다.) 벤젠 제거에 효과적인 에코플랜트이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(37,'드라세나 \'송오브인디아\'','images/plants/드라세나 \'송오브인디아\'.jpg','고급스러운 이미지에 맞게 꽃말은 번영과 영광, 다양한 크기와 무늬를 가진 품종이다. 어두운 그늘에서 잘 적응하는 반음지 식물, 직사광선은 피하고 추위에 약해 겨울에 따뜻하게 관리해야 한다. 잎과 가지를 가지치기해서 정리해 주어야 새로운 가지가 잘 나온다. 영양공급을 뒷받침에 주어야 약하게 자라지 않고 3~4개 이상의 굵고 튼튼한 여러 개의 가지로 자라나게 할 수 있다. 노란색 바탕의 잎에 짙은 녹색 무늬를 가진 소형종이며, 낮은 광도 등의 환경이 비교적 좋지 않는 곳에서도 잘 자라므로 실내조경에 자주 사용될 뿐 아니라 일반 가정에서도 매우 인기가 있어서 선물용으로 많이 이용되고 있다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','5℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(38,'드라세나 \'자바\'','images/plants/드라세나 \'자바\'.jpg','반음지성 식물이라서 통풍이 좋은 밝은 그늘에 두어야 하고 직사광선은 좋아하지 않습니다. 잎에 무늬가 없으며 공기정화식물이다. 공기정화식물은 증산작용이 활발한 식물로 주변의 공기와 수분이 식물 내로 흡수됨으로, 그 안에 포함된 유해 물질들이 뿌리 주변의 토양 속 미생물에 의해 분배된다. 또한, 증산작용도 활발해 증산에 의해 주변토양의 수분이 급속하게 식물체 내로 이동하고 뿌리 부근의 공기가 땅속으로 빨려 들어가면서 주변 공기의 이동이 일어납니다. 환경이 비교적 좋지 않은 장소에서도 잘 자라기 때문에 크게 자라면, 가늘지만 튼튼한 목대위에 푸른 잎이 풍성하게 자라서 멋진 수형을 감상할 수 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(39,'드라세나 \'콤팩타\'','images/plants/드라세나 \'콤팩타\'.jpg','집안에서 키우기 아주 좋은 식물이며, 여름철에는 직사광선을 반드시 피해야 하고, 전체적으로 옥수수자루 같은 넓은 잎들이 방사형으로 무성하게 달리고 기왓장을 쌓듯 층층으로 성장한다.  수분은 약간 축축해도 상관없지만 과습할 경우 잎이 가늘고 거칠어진다. 잎은 짙은 암녹색이고 광택이 나며 줄기에서 나선형으로 촘촘하게 돌려 나온다. 밭흙, 부엽, 모래를 3:5:2의 비율로 혼합하고, 4~9월에 월 1회 복합비료를 준다. 고온다습한 장마철 겨울은 물주기를 줄인다. 건조한 것을 싫어하는 식물이기 때문에 겨울에 건조해지면 분무기로 한 번씩 뿌려 주는 것이 좋다. 공기정화능력으로 뛰어나다.(포름알데히드, 벤젠, 톨루엔 등 제거)','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(40,'드라세나 \'트리 컬러 레인보우\'','images/plants/드라세나 \'트리 컬러 레인보우\'.jpg','줄기는 가늘고 키는 3~4m 정도까지 자라며 잎의 폭은 1~2cm, 길이 30~60cm이며 장검과 같이 자라고 잎 가장자리는 적색, 안쪽은 유백색이다. 잎 전체가 붉은빛을 띠고 있는 고온다습을 좋아한다.  내음성도 강해서 오랫동안 실내에서 잘 견디며 실내 어느 곳에 놓아도 잘 조화를 이룬다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(41,'드라세나 드라코','images/plants/드라세나 드라코.jpg','드라세나 드라코는 자연서식지에서는 거목이나 실내에서는 겨우 1m까지만 자란다. 빛이 충분하면 잎 가장자리에 약간 붉은색을 띄운다. 오래된 잎은 아래쪽으로 아치형을 그린다. 줄기나 잎을 자르면 그 단면에 붉은 액체가 흐른다고 해서 ‘용혈수’(龍血樹)라 불린다. 산소와 음이온을 많이 내뿜어 공기정화 효과가 뛰어나다. 이국적인 느낌의 관상가치가 높은 실내식물이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(42,'드라세나 마지나타','images/plants/드라세나 마지나타.jpg','우리나라에는 1960년대부터 들어와서 실내식물로 많이 알려졌다. 드라세나 마지나타는 잎 모양이 창처럼 가느다랗고 잎 길이는 60cm 내외이다. 또한, 야자수 잎처럼 뭉쳐나는 아름다운 잎들은 미술관, 관공서, 호텔, 쇼핑몰, 고급 레스토랑의 입구에서 우아한 자태를 뽐내곤 한다. 뿌리가 화분구멍으로 나오는 경우 흙이 굳어져서 물 흡수가 제대로 되지 않는 경우나, 뿌리가 썩어 식물 아랫부분 잎이 시드는 경우, 분갈이를 해주는 것이 좋다. 봄 4~6월, 겨울은 9~10월 사이에 하는 것이 좋다. 드라세나 마지나타는 자일렌과 트리클로로에틸렌 등 실내 독성물질 제거 능력이 우수해 공기청정기 역할을 톡톡히 해내므로 실내공기 정화에 좋다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(43,'드라세나 맛상게아나','images/plants/드라세나 맛상게아나.jpg','열대 원산종의 원예 변종으로 대형종이다. 잎은 길이가 약 50~90cm, 폭은 5cm 내외이다. 잎의 폭은 넓고 끝이 뾰족하며 늘어지는데 마치 옥수수 잎을 연상시킨다.  실내에서는 3m까지 생장하는데, 줄기 윗부분을 20cm 정도 잘라주면 새로운 싹이 나와 자라고, 원기회복에 큰 도움이 된다. 사무실이나 실내 장식이 많은 매장, 거실에 두면 보기에도 좋고 실내의 답답함을 없애, 공간을 시원하게 연출할 수 있다. 반그늘에서 잘 자라고 추위에도 강하다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(44,'드라세나 산데리아나','images/plants/드라세나 산데리아나.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','느림','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(45,'드라세나 산데리아나 \'세레스\'','images/plants/드라세나 산데리아나 \'세레스\'.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(46,'드라세나 수르쿨로사','images/plants/드라세나 수르쿨로사.jpg','60~90cm 정도 자라고 줄기는 작지만 강하고, 잎은 타원형으로 양 끝이 뾰족하다. 잎의 반점에 따라 플로리다 뷰티, 밀키웨이 등으로 나누어 지고, 긴 타원형 또는 달걀형으로 길이 10~13cm 정도로 어긋나고 각 마디마디 2~3개씩 달린다. 표면은 녹색으로 반들반들하고 불규칙한 흰 반점이 있다. 꽃은 흰색으로 얇은 꽃줄기와 함께 복산형 꽃차례로 작은 꽃이 둥글게 모여 피고 향기가 좋다. 한여름의 (8~9)월의 직사광선을 받는 곳은 피한다. 그 외의 계절에는 오전 햇빛을 조금 받게 하고 겨울에는 항상 햇빛을 받게 해주는 것이 좋다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','Y','흰색','어려움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(47,'디지고데카','images/plants/디지고데카.jpg','세계적으로 15종이 자생하고 있다. 줄기는 강직하고, 잎은 좁고 길며 결각이 심하고 긴 잎자루가 있다. 줄기는 곧게 자라며, 높이는 9~12m까지 자란다. 잎자루는 길며, 잎은 가늘고 기다란 손가락 모양이고, 7~9개가 부챗살처럼 펼쳐 다린다. 잎색은 짙고 어두운 녹색이며 잎맥은 적갈색을 띤다. 가장자리는 굵고 깊게 팬 톱니 모양이다. 수분 변화가 심할 때 늙은 잎에서 불그스레한 타원형의 작은 반점으로 나타나는 부종 증상이 생길 수 있다. 이것은 생리적 장해이므로 수분 변화가 심하지 않게 주의해서 관리하면 예방할 수 있다. 디지고데카는 뿌리가 왕성하게 뻗지 못하기 때문에 할 수 있는 한 최대로 뿌리를 건강하게 관리하는 것이 필수적이다. 응애가 생기지 않도록 정기적으로 살펴보아야 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(48,'디펜바키아 \'마리안느\'','images/plants/디펜바키아 \'마리안느\'.jpg','부드러운 연녹색 잎의 중앙에 선명한 흰색 무늬가 있는 소형종이다. 잎 모양, 색깔, 크기 등에 따른 다양한 품종이 있다. 밝은 반그늘이 적합하고, 5~9월의 생장기에는 실외에서 키울 수 있다. 빛이 적고 따뜻한 실내에서 잘 자라고, 추위에 매우 약한 식물이기 때문에 찬바람에 노출되지 않게 주의하고, 분갈이는 따뜻한 봄에 하는 것이 좋다. 녹색 바탕 잎 중앙부분에 황백색의 무늬가 있어 부드러운 느낌을 자아낸다. 수액이 피부에 닿으면 알레르기, 가려움증이 생길 수 있으므로 주의한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(49,'디펜바키아 \'트로픽스노우\'','images/plants/디펜바키아 \'트로픽스노우\'.jpg','줄기는 굵고 크며, 잎은 두껍고 넓다. 생육이 강건한 품종으로 내한력이 약하다. 대형종이며 줄기는 두터워지고, 잎은 광택이 있는 짙은 녹색으로 유백색의 불규칙한 반점 무늬가 있다. 직사광선이 아닌 실내 밝은 장소에서 잘 자란다. 식물 전체에 독이 있기 때문에 일단, 입에 들어가면 심하게 아프고 혀와 성대에 마비 증상이 생겨 한동안 말하기가 어렵고 또 수액이 피부에 닿으면 알레르기, 가려움증이 생길 수 있다. 식물 전체에 독이 있기 때문에 식용은 금한다.  일단 입에 들어가면 심하게 아프고 혀와 성대에 마비 증상이 생겨 한동안 말하기가 어렵고 또 수액이 피부에 닿으면 알레르기, 가려움증이 생길 수 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(50,'떡갈잎 고무나무','images/plants/떡갈잎 고무나무.jpg','큼직하고 진한 잎 색상 때문에 중후한 멋이 있는 떡갈잎 고무나무는 강한 생명력과 멋진 모양 덕분에 인기가 많다. 잎의 길이는 평균 30cm 정도이며, 잎이 두껍다. 잎자루가 짧고 잎면은 파상이 우글쭈글하다. 과습으로 인해 잎이 검게 변하면서 떨어질 수 있으므로 주의해야 한다. 갈나무에 익숙한 우리에게는 친근감이 감겨 단독으로 식재하는 것보다 모아 심는 것이 운치 있어 보인다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(51,'러브체인','images/plants/러브체인.jpg','온도가 적당하여 정상적인 성장이 지속한다면 그에 맞춰 비료도 자주 주어야 길게 늘어지며 자란다.  폭포처럼 아래쪽으로 길게 늘어지는 특성이 있어 거실이나 베란다에 걸어두면 보기 좋다. 줄기는 1~3m까지 자라며, 잎 앞면에 회백색 그물 무늬가 있고 뒷면은 적자색이다. 다른 덩굴식물과는 달리 땅속줄기에 덩이뿌리(물 저장뿌리)가 있어 다습한 환경을 싫어하고, 건조에 강하다. 여름철에 1~2cm 분홍색 깔때기 모양으로 생긴 독특한 통꽃이 피고 꽃이 피는 기간은 긴 편이다. 번식은 줄기 삽목을 주로 이용하는데, 덩굴을 두세 마디씩 잘라서 땅에 꽂거나 덩굴에 생기는 작은 덩이를 묻어두면 싹이 난다.                                                           - 환기: 규칙적인 환기가 필요.                                                                 - 물관리: 과습과 과한 물주기는 피해야 함. 빗물을 주면 토양이 산성화 될 수도 있음. 따뜻한 물을 사용하세요.                                                                - 행잉 바구니에 적합한 식물.','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','','','보통','10℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(52,'렉스베고니아','images/plants/렉스베고니아.jpg','베고니아의 관상부위는 세 가지(꽃, 잎, 반관목성)로 구분하는데, 렉스베고니아는 잎 무늬를 관상하는 식물이다. 잎이 두텁고 얼룩무늬도 있으며 달팽이처럼 말린 것도 있고 종류가 매우 다양하다. 줄기의 온몸에 거친 털이 나 있다. 잎은 대형 달걀 모양으로 길이는 30cm, 폭은 20cm 정도이다. 잎 면에는 품종에 따라 보라색, 빨간색, 은백색, 구릿빛 등 다양한 무늬가 있다. 렉스베고니아는 잎꽂이로 번식이 쉽다. 벤치 아래, 시원하고 습한 그늘에서 가장 이상적인 성장을 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(53,'루모라 고사리','images/plants/루모라 고사리.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','매우 어려움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(54,'루스커스','images/plants/루스커스.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(55,'마란타 류코뉴라','images/plants/마란타 류코뉴라.jpg','잎에 독특한 무늬와 잎이 말려드는 습성이 있어 인상적인 마란타 류코뉴라는 영어 이름 ‘prayer plant(기도하는 식물)’ 로, 해질 무렵이면 기도할 때 손을 모으듯 위로 접히는 잎의 모양에서 유래한다. 잎이 접히는 이유는 체내의 습도를 유지하기 위해 낮에는 옆으로 펴져 있다가 밤이 되면 위로 모이는 현상을 보인다. 초장과 초폭은 각각 30cm 정도이고, 따뜻하고, 습한 지역에서 잘 성장한다. 온도, 습도가 낮은 건조하고 추운 환경에서는 잎이 갈색으로 변하여 떨어지거나 잎이 틀어질 수 있으므로, 건조한 경우 일정한 습도 유지에 주의해야 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(56,'마삭줄','images/plants/마삭줄.jpg','상록의 덩굴성 목본으로 흑갈색 줄기를 가지고 있다. 줄기는 길게 약 5m 정도 뻗으며, 줄기에서 뿌리를 내려 바위나 나무 등에 기어오른다. 꽃은 5~6월에 흰색으로 피고 지름은 2~3cm이며, 흰색에서 노란색으로 변하고 취산꽃차례를 이룬다. 타원형의 잎은 마주나며, 길이 2~5cm로 윤이 나고 두껍다. 열매는 원통형의 골돌과로 9월에 익으며 길이 12~22cm로 2개가 달린다. 잎과 줄기는 해열, 강장, 진통 및 생리통 등에 약용으로 쓰이기도 한다. 산지 숲 가장자리나 숲 속 습기가 있는 곳의 바위나, 큰 나무줄기에 칭칭 동여맨 듯 부착되어 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,흰색','보통','0℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(57,'만년청','images/plants/만년청.jpg','내한성 상록 다년초로 굵은 땅속줄기 끝에서 9~12장의 녹색 잎이 모여난다. 높이 30~50cm이다. 잎의 길이는 30~40cm, 너비 3~5cm이고, 넓은 바소꼴이며 육질이고 윤기가 있다. 꽃은 5~7월에 연한 노란색이나 흰색으로 피고 잎 사이에서 자란 길이 2~4cm의 수상꽃차례에 빽빽이 달린다. 열매는 장과이고 둥글며 지름 1cm 정도로 8월에 붉게 익으며 간혹 황색도 있다. 잎은 1년에 보통 3-4장 나오는데 잎의 수명은 길면 3-4년정도이다. 가능한 자르지 말고 그대로 둔다.근경에는 로데인(Rohdein)이 들어 있어 강심제와 이뇨제로 악용된다. 잎에 여러 가지 색채가 든 무늬 종이 많이 나와 주로 관상용으로 이용되었다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,흰색','쉬움','0℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(58,'만데빌라','images/plants/만데빌라.jpg','브라질 자스민, 동백 자스민이란 이름처럼 꽃이 화려하고 은은한 향기를 지닌 매력적인 덩굴식물로 약간 건조하게 관리한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,노랑색,흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(59,'멕시코 소철','images/plants/멕시코 소철.jpg','소철은 열대 및 아열대 아메리카에 약 40종이 분포한다.  잎은 1년에 한번씩 새로 자라나며, 줄기의 끝이 굵은 것 일수도록 많이 나오고, 새로 나온 잎이 완전히 굳어질 때까지 먼저 잎을 자르지 않는 것이 좋다. 잎은 골판지처럼 딱딱해서 이국적인 모습을 연출할때 이용한다. 줄기는 괴경상으로 높이는 15cm, 엽장은 120cm까지 있고 소엽은 딱딱하고 4~22 개가 마주난다. 잎은 반 광택이 있는 황록색으로 마치 소철잎과 같이 붙어 있으나 엽육이 두텁고 잎이 크며 주로 관엽식물로 재배되고 있으며, 깃털모양의 우상엽(깃털잎)이다. 줄기와 잎은 갈색의 뽀얀 털 내지는 가루 같은 것으로 덮여있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','10℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(60,'멜라니 고무나무','images/plants/멜라니 고무나무.jpg','야생에서는 커다란 교목으로 자라는 고무나무로 잎 모양은 크고 넓은 둥근 타원형으로 엽육이 두껍고 생육이 왕성하고, 음이온과 산소발생량이 많은 식물이다. 형태로 새로 나오는 잎은 색이 붉은빛이나 차츰 성장하며 짙은 녹색으로 바뀌는 아름다운 품종입니다. 라텍스를 포함하고 있는 가죽질감의 짙은 녹색을 띤 뚜꺼운 잎을 가지고 있으며, 이면의 주맥과 잎대는 적갈색이고, 2,5m까지 자란다. 작은 그릇에 꽃 2~3송이와 잎 1장으로도 아름다움을 살릴수 있는 식물이다. 세계적으로 약 800~2000종이 분포되어 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(61,'목베고니아','images/plants/목베고니아.jpg','목베고니아는 프랑스의 식물 애호가 베공(Begin, M)의 이름에서 유래되었다. 높이는 60cm정도이며, 잎은 가름한 심장 모양이고, 전체가 녹색이며,흰 얼룩점이 드문드문 있고, 뒷면의 잎맥은 붉다. 줄기는 곧게 자라며 어긋나게 자라는 커다란 잎과 풍성하게 꽃을 피우는 품종이다. 속은 독특한 특색은 크기가 서로 다른 4장의 꽃덮이(꽃잎과 꽃받침잎을 합해 부르는 이름)가 쌍으로 달리며, 암꽃의 아래쪽에 3개의 날개가 있다. 영양이 풍부할수록 풍성한 꽃 봉우리를 만든다. 자라나면서 줄기와 가지가 목질화(나무줄기처럼 딱딱해짐)가 되어간다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(62,'몬스테라','images/plants/몬스테라.jpg','몬스테라는 덩굴성 대형관엽식물로 6~8m 까지 자란다. 잎은 어긋나고 성숙한 것은 지름 1m 정도이다. 잎은 진녹색으로 크고 광택이 나며 잎맥 사이에 군데군데 타원형의 구멍이 파여 있어 폭우나 강한 바람에도 견딜 수 있는 구조로 발달 됐다. 흰색의 꽃이 피고 열매도 달린다. 그리고 잎은 절엽으로 하여 꽃꽂이 재료로도 쓰인다. 직시광선에 노출시키면 잎이 타기 쉬우므로 그늘에 둬야 한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','Y','흰색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(63,'무늬관음죽','images/plants/무늬관음죽.jpg','높이는 1~2m 이른다. 처음에는 줄기가 1개 이지만 자라면서 땅속줄기에서 싹이 뭉쳐난다. 잎은 손바닥 모양 겹잎으로 5~7갈래로 갈라지고, 갈라진 조각의 길이 5~10cm, 넓이 2~3cm, 잎자루 20~25cm이다. 무늬관음죽은 반그늘상태에서 관리하는 것이 생육이나 무늬의 발현에 적당하다. 그늘과 추위, 병해충에 강하며, 자라는 속도가 느려서 관리가 편하다. 잎은 젖은 물수건으로 닦아주는 것이 좋다. 수액이 인체의 피부나 점막을 자극할 수 있음, 관음죽을 지하수나 수경재배로 기르는 경우에는 수돗물 속의 염분이나 미네랄이 잎 끝에 축적되어 갈색으로 변할 수도 있는데 이런 현상이 나타날 때에는 갈색으로 변한 부분만 가위로 잘라내면 염분도 제거할 수 있고 특유의 톱니모양의 녹색 잎을 유지시킬 수 있다. 공기정화능력은 포름알데히드, 벤젠, 톨루엔, 크실렌, 클로로포름을 제거한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(64,'무늬마삭줄','images/plants/무늬마삭줄.jpg','줄기는 8m 정도까지 자라고, 잎은 마주나고 타원형 또는 달걀 모양이며 표면은 짙은 녹색이고 윤기가 있으며, 뒷면은 털이 있거나 없고 가장자리는 밋밋하다. 길이 2~5cm 정도로 둥글고 가장자리에는 톱니가 없다. 꽃잎은 5개로 깊게 갈라져서 5~6월에 개화시기로 줄기에서 뿌리가 내려 다른 물체에 달라붙어 서식 점차 적갈색으로 갈변한다. 열매는 길이 1.2~2.2cm로 2개씩 달린다. 마삭줄이 많은 곳에서는 전혀 다른 풀이 자라지 못하고 온 사방이 마삭줄로 뒤덮여 있는 곳도 있다. 덩굴식물이 얽히지 않도록 수시로 가지치기를 해줘야 한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,흰색','보통','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(65,'무늬벤자민고무나무','images/plants/무늬벤자민고무나무.jpg','저온에서도 잘 견디지만 저온, 음지, 과습 조건이 되면 잎이 떨어지기 쉬운 실내 환경이나 햇볕이 잘 드는 곳에 두고 잎에 영양을 공급해 주면 좋고 지나친 과습이나 건조는 피한다. 젖은 물수건으로 잎을 닦아주며 잎이 작고 성장함에 따라 가지는 우아하게 늘어지며 건조한 환경에 강하다. 줄기에 탄력성이 좋아 줄기를 만져줄 수록 부드러워지고, 그런 후 원하는 모양대로 유인할 수 있다. 공기정화능력은 포름알데히드, 벤젠, 톨루엔, 크실렌, 클로로포름 제거한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(66,'무늬산호수','images/plants/무늬산호수.jpg','야생화초로 키우지만 예로부터 약용으로 쓰이던 식물입니다. 반양지성 식물로 밝은 실내나 오전 1-2시간 햇빛이 드는 베란다 등에서 기르면 되고 한낮의 직사광선에는 잎이 화상을 입어 모양이 흉해진다. 산호수는 햇볕의 세기에 따라서 열매가 빨리 자라기도 하고 색깔도 빨리 빨개지며 특히, 관수를 잘 해주어야 하며, 배수상태에 따라서 틀리지만, 보통의 경우 2~3일에 한번, 겨울철엔 4~5일 정도에 한번 흠뻑 주어야 말라 떨어지지 않는다. 물 관리만 잘하면 몇 년이 지나도 열매가 떨어지지 않고 그대로 달려 있으며 다음해엔 또 새로운 꽃이 피고 열매를 맺지만, 무늬산호수는 열매 맺기가 쉽지 않다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','0℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(67,'무늬석창포','images/plants/무늬석창포.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','0℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(68,'무늬쉐플레라\'홍콩\'','images/plants/무늬쉐플레라\'홍콩\'.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(69,'무늬알피니아','images/plants/무늬알피니아.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','오렌지색,흰색,혼합색','쉬움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(70,'무늬유카','images/plants/무늬유카.jpg','#NAME?','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','7℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(71,'무늬접란','images/plants/무늬접란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(72,'무늬털머위','images/plants/무늬털머위.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색','쉬움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(73,'무늬팻츠헤데라','images/plants/무늬팻츠헤데라.jpg','벤젠 제거에 효과적인 에코플랜트이다. 키는 30-40cm 키가 작은 실내분화식물로 줄기는 곧게 자란다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(74,'무늬푸밀라고무나무','images/plants/무늬푸밀라고무나무.jpg','높은 습도를 좋아함, 오랜 기간 잘 키우기가 어려우므로 매년 봄 분갈이 해 줌','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','7℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(75,'뮤렌베키아','images/plants/뮤렌베키아.jpg','대체로 키우기 쉬운 식물로, 직사광선만 피하면 잘 자란다.','','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','40 ~ 70%','','','쉬움','10℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(76,'바위취','images/plants/바위취.jpg','바위취는 우리나라 중부 이남의 반음지,음지에 조경용으로 식재하는는 상록 다년생 초본이다. 잎은 녹색에 연한 무늬가 있고, 뒷면은 자줏빛이 도는 붉은색이며 길이는 3~5㎝이다. 잎 가장자리에 치아 모양의 얕은 결각이 있으며 길이는 3~5㎝이며 꽃은 백색으로 꽃자루의 높이는 20~40㎝로서 곧게 서며 길이는 10~20㎝이고 짧은 홍자색의 선모가 있으며 줄기 꼭대기에서 핀다. 열매는 7~8월경에 달리고 길이는 4~5㎜로 원형이고 종자는 난형(달걀 모양)이며 관상용, 지피식물 또는 분화용으로 쓰이며, 전초는 약용으로 쓰인다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','0℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(77,'박쥐란','images/plants/박쥐란.jpg','본 종의 포자엽은 30~70㎝이고 길이는 60~90㎝로 기부는 좁고 직립한다. 잎 기부로부터 잎 끝까지의 형태는 V자형으로 상부에는 2~3회 우상으로 갈라져서 늘어진다. 잎 표면은 회녹색이고 뒷면은 녹백색이다. 외투엽은 원형으로 불룩하게 튀어 나오고 처음에는 녹색, 후에는 갈색으로 변한다. 외투 직경은 20㎝로 잎 가장자리는 약간의 파상이며 본 엽은 총생하고 좁고 길다. 갈라진 잎의 길이는 10㎝, 폭은 4㎝로 회녹색이고 뒷면은 회녹백색으로 털이 있다. 포자낭군은 황갈색이고 열편의 정점이 착생한다. 그래서 갈라진 풀잎은 황갈색으로 변한다. 원산지는 열대 아프리카, 열대 아시아, 온대 오스트레일리아로 14종이 있다. 회녹색의 사슴뿔 모양을 지니고 있으며 밝은 곳을 좋아한다. 건조한 것 보다는 습한 환경을 좋아하므로 잎에 자주 분무해 준다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(78,'반딧불털머위','images/plants/반딧불털머위.jpg','국화과의 여러해살이풀로 남부지방이나, 울릉도 ,제주도의 바닷가에서 자란다. 늘 푸른 잎이며 뿌리줄기는 굵고 짧으며 줄기는 곧게 서며 꽃대 모양이고 흰빛이 도는 갈색털이 덮여 있다. 9~10월에 머리모양 꽃차례를 이루고 노랑색의 꽃이 피며 꽃대 모양의 줄기 끝에 여러 개가 모여서 고른꽃차례를 이룬다. 한방과 민간에서 뿌리와 식물체를 진통, 보익, 진정 등의 약재로 쓰며 민간에서 줄기와 잎을 해독제로 쓰고 싱싱한 잎을 습진 또는 곪는데 약으로 쓰며, 관상용으로 많이 심는다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색','보통','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(79,'백량금','images/plants/백량금.jpg','부식질이 풍부하고 보수력이 좋은 토양이 적합하며 약간 응달진 장소가 좋음','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','5℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(80,'백정화','images/plants/백정화.jpg','만천성(滿天星)·두메별꽃이라고도 한다. 높이 약 1m이다. 가지가 많이 갈라져서 퍼진다. 잎은 마주나며 긴 타원형이고 길이 2cm 정도이다. 가장자리가 밋밋하며 턱잎은 가시처럼 되어 있다. 꽃은 5∼6월에 흰색 또는 연한 붉은빛을 띤 자주색으로 피고 잎겨드랑이에 달린다. 화관은 깔때기 모양이고 끝이 5개로 갈라져서 퍼지며 안에 털이 난다. 수술은 화관통에 붙어 있는데, 암술보다 긴 것과 짧은 것의 2종류가 있다. 열매는 핵과로서 7월에 익는다. 번식은 꺾꽂이와 포기나누기로 한다. 중국 남부 원산이며 관상용으로 쓰고 울타리에 많이 심는다. 원예품종으로는 겹꽃·만첩꽃, 잎에 반점이 있는 것 등을 개발하였다. 옆에서 볼 때는 T자같이 보이므로 흰색 꽃이 피는 정화라는 이름이 생겼다. 중국 남쪽에서 인도차이나 반도까지 분포한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','어려움','5℃','','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(81,'백화등','images/plants/백화등.jpg','마삭줄 증에서 가장 잎과 꽃이 크며 향기도 강하다. 5-6월  개화하며 내건성은 강하나 내한성은 다소 약한 편이다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','어려움','0℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(82,'벤자민고무나무','images/plants/벤자민고무나무.jpg','상록 교목, 실내 대형 화분, 줄기가 유연하여 자유롭게 구부릴 수 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(83,'벤자민고무나무 \'킹\'','images/plants/벤자민고무나무 \'킹\'.jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(84,'벵갈고무나무','images/plants/벵갈고무나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(85,'병솔나무','images/plants/병솔나무.jpg','꽃처럼 보이는 붉은 솔은 가느다란 수술이 모여 방망이를 이룬 것이다. 상록 소교목으로 지름 10cm 키 8m정도 자라며 호주, 파푸아뉴기니아 지역이 원산이다.  병솔나무속에는 30여종이 있으며 대부분 원예종으로 재배되고 있다.  줄기는 회색으로 어릴 때는 갈색으로 매끄럽다가 나이가 들면 세로로 갈라진다. 긴 가지는 버들처럼 늘어지며 잎 모양도 버들과 비슷하나 오래된 잎은 딱딱하며 잎은 폭 1cm, 길이 6~8cm 정도이며 톱니가 없고 잎의 앞, 뒷면이 유사하다.  5~8월에 피는 꽃은 병을 닦는 솔처럼 피며 가느다란 수술이 모여 지름 5~6cm, 길이 15cm전후의 진한 붉은 색의 꽃방망이를 만든다. 꽃모양을 따서 나무이름이 Bottlebrush 또는 bottle brush tree이며 우리말도 \'병솔나무\'이다. 꽃이 진 자리에는 콩알크기의 열매가 달린다. 호주지역에서 잎을 향신료로 사용 한다.','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,노랑색,흰색','어려움','7℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(86,'보스톤고사리','images/plants/보스톤고사리.jpg','풍성하고 아름다운 잎 때문에 빅토리아 시대부터 실내에 도입되어 사랑을 받아왔으며, 오늘날에도 여전히 인기가 높은 실내식물이다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','보통','13℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(87,'봉의꼬리','images/plants/봉의꼬리.jpg','잎은 우상복엽으로 1-3쌍이고 증산효과가 뛰어나다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','보통','5℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(88,'부겐빌레아','images/plants/부겐빌레아.jpg','덩굴성 관목으로 남아메리카 원산이다. 13종 내외가 알려져 있고 그 중에서 2종이 주로 재배된다. 부겐빌레아(B. glabra)는 브라질 원산으로서 높이 4∼5m 자라고 곧은 가시가 있다. 잎은 어긋나고 달걀 모양이며 가장자리가 밋밋하고 광택이 있으며 털이 없다. 꽃은 4월에서 11월까지 연중 피고 총상꽃차례를 이루며 3개의 포에 싸인다. 꽃색은 흰색, 빨강색, 분홍색, 노란색 등 다양하다. 포는 꽃처럼 보이며 그 안에 들어 있는 진짜 꽃은 작고 눈에 잘 띄지 않는다. 털부겐빌레아(B. spectabilis)는 이와 비슷하지만 잎에 털이 많다. 많은 품종이 있으며 한국에서는 온실에서 재배한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,노랑색,흰색','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(89,'브룬펠시아','images/plants/브룬펠시아.jpg','실내에서 아기자기한 여러 가지 색의 꽃들이 은은한 향기를 뿜어내는 사랑스러운 나무이다.  처음 꽃이 필 때는 진보라색이지만 차츰 연보라색으로 변하여 최종에는 흰색으로 바뀐다.  햇빛과 통풍이 필요하며 물을 너무 자주 주면 잎이 마르듯이 우수수 떨어진다.  브룬펠시아의 개화습성은 새로운 가지에서 다시 꽃이 맺히므로 꽃이 진 가지를 전정해 주면 더 많은 꽃을 볼 수 있다. 향이 짙으므로 밀폐된 공간에서 너무 오래 향기를 맡지 말고 환기를 시켜준다.  원래는 아메리카 원산의 상록 관목이며 30여 종이 알려져 있다.  미국브룬펠시아(lady-of-the night : B. americana)는 서인도 원산이고 높이 2.4m에 달한다.  잎은 넓은 달걀 모양에서 달걀을 거꾸로 세운 듯한 모양이며 길이 10cm이다. 꽃은 대개 1개씩 달리고 흰색이지만 노란색으로 변하며 지름 5cm, 길이 10cm이고 밤에 향기가 강하다. 꽃받침은 짧고 열매는 장과로서 지름 2cm 내외이며 노란색으로 익는다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,흰색','어려움','10℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(90,'브리세아','images/plants/브리세아.jpg','약 250종이 자생한다. 주로 착생종이고 대형의 지생종인 것도 있다. 엽수가 많으며 활모양으로 뻗고 가죽질인 것이 많다.  잎 가장자리에는 가시가 없다.  꽃은 수상화서로 2열로 편평하게 붙는 것이 많다. 포는 단단한 다육질이고 적색, 녹색, 황색이며, 꽃은 주로 황, 백, 녹색이다.  아나나스류 중에서 에크메아속과 더불어 재배상 중요한 위치를 차지한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,흰색','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(91,'비젯티접란','images/plants/비젯티접란.jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(92,'비타툼접란','images/plants/비타툼접란.jpg','Uses:  Container, Ground cover     Soil Type:  A GOOD general purpose potting soil (a soil that retains water yet drains well) will suffice. Check purchased soil to see that it is well aerated and add sand or perlite and peat moss if it seems to pack too tightly. Give the plants a chance to settle in before going back to whatever fertilization program has been successful for you. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite, 1 part moist peat or humus (leaf mold) and a light dusting of lime. Always use a pot with a hole.     Growth Rate:  Average      Growing Ease:  Will grow for anybody','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','Y','흰색','보통','7℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(93,'산세베리아','images/plants/산세베리아.jpg','산세베리아는 이탈리아 산 세베로의 왕자 라이문도 디 산그로(Raimondo di Sangro, 1710~1771)를 기리기 위해 붙인 이름이다. 공기정화식물로 인기 있는 산세베리아는 대표적인 CAM식물이다. 그러나 개나 고양이와 같은 애완동물이 섭취했을 경우는 구토나 설사를 일으킬 수 있으므로 조심해야 한다.  이 식물의 영어 이름이 ‘시어머니의 혀’인 것은 꼿꼿하게 자라면서 가죽처럼 잎이 질기기 때문에 붙여진 이름이다.  실내에서 꽃 피기는 상당히 어렵지만, 환경이 좋으면 흰빛에 가까운 옅은 그린색의 작은 꽃들이 핀다. 품종은 여러 종류가 있지만 가장자리에 노란 테두리가 있는 종이 가장 보편적으로 이용되고 있다.  과습하지 않더라도 실내 온도가 10℃ 이하인 경우 썩는 원인이 된다. 특히 삽목 후 온도 관리에 주의해야 한다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','빠름','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(94,'산세베리아 \'골든 하니\'','images/plants/산세베리아 \'골든 하니\'.jpg','연중 빛이 좋은 반그늘에서 잘 자란다. 그러나 여름철에 너무 강한 직사광선은 피하는 것이 좋다. 겨울에 냉해를 입으면 아래쪽이 허물거리면서 썩어버리는데, 마치 관수를 너무 많이 하여 나타나는 현상처럼 보인다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','느림','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(95,'산호수','images/plants/산호수.jpg','자금우, 백량금과 함께 자금우과에 속하며 빨간 열매가 인상적인 덩굴식물이다. 잎에 무늬가 있는 산호수도 있지만 무늬종은 일반종에 비해 열매가 잘 열리지 않는 특징이 있다. 꽃, 열매, 잎 모두 다 관상가치가 있으며  키우기 쉬운 관엽 식물이다.  산호 중에서도 가장 비싼 것이 적색 산호인데, 산호수의 열매가 적색산호의 빛깔과 닮아있어 산호수라는 이름이 붙었다고 한다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','5℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(96,'삼색데코라고무나무','images/plants/삼색데코라고무나무.jpg','고무나무라는 이름은 고무와 유사한 라텍스를 함유하고 있는 두껍고 가죽처럼 느껴지는 잎에서 유래되었다. 크림색이 잎 가장자리에 들어가 있어 고급스럽고도 편안한 느낌의 실내 관엽 식물이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(97,'상록넉줄 고사리 \'후마타\'','images/plants/상록넉줄 고사리 \'후마타\'.jpg','너무 습기가 많으면 민달팽이의 피해와 곰팡이병이 생기지만 너무 건조할 때는 깍지벌레, 온실가루이, 가루깍지벌레 등이 발생한다. 그러나 거미발만 살아있다면 언제든지 새 순을 낼 수 있다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','보통','5℃','빠름','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(98,'새우란','images/plants/새우란.jpg','대부분의 서양난이 착생란인데 비하여 동양란은 지생란이 많다.   제주도나 일본의 숲 속에서도 자라며 높이 30~50cm, 뿌리줄기는 옆으로 뻗는다. 뿌리줄기의 모양이 새우를 닮아 새우란이라고 하며 뿌리는 강장제로도 사용된다. 꽃이 아름답고 재배가 쉬운 편이다. 봄에 꽃이 지고나면 화분 위에 깻묵 덩이를 2~3개 얹어 주거나 영양제를 주어 이듬해에도 꽃이 잘 필 수 있도록 한다. 새우란은 음지 식물이지만 실내에서 재배할 때는 밝은 곳에 둔어야 꽃이 잘 핀다. 화분흙은 물 빠짐이 좋은 마사토나 마사토와 밭흙을 8:2의 비율로 섞어 사용한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','40 ~ 70%','Y','보라색,분홍색,노랑색,흰색,혼합색','어려움','7℃','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(99,'석창포','images/plants/석창포.jpg','냇가에서 자라는 다년초로서 근경은 옆으로 뻗으며 마디가 많고 밑부분에서 수염뿌리가 돋으며, 땅속에 들어간 근경은 마디사이가 길며 백색이지만 지상으로 나온 것은 마디사이가 짧고 녹색이다. 잎은 근경 끝에 총생하며 길이 30∼50cm. 나비2∼8mm로 전체가 대검 비슷한 선형 수상이며 화서는 6-7월에 화경 옆에 달리고 연한 황색 꽃이 화축면에서 밀생한다. 근경은 진통, 진정 및 건위제로 사용되며 목욕탕에서도 사용한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','0℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(100,'세네시오 라디칸스','images/plants/세네시오 라디칸스.jpg','녹영이 둥근 구슬을 꿴 모양이라면, 세네시오 라디칸스는 작은 녹색 바나나를 줄에 꿰어놓은 형상의 다육식물이다. 다육질의 다년초로 잎은 호생하며 짧은 엽병이 있다. 잎의 길이는 2-3cm 정도로 선단이 위로 향하며 초생달 모양으로 바깥쪽에 암녹색의 세로줄 무늬가 있다. 꽃은 흰색으로 향기가 나며 잎은 약용으로 쓰인다.  낮은 온도에서도 잘 견디는 편이나 계속적인 생장을 위해서는 야간 온도를 13℃이상은 유지해야 한다. 행잉바스켓용으로 좋다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40% 미만','Y','흰색','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(101,'세이프릿지 야자','images/plants/세이프릿지 야자.jpg','최대 2m 정도 자라며 모양이 가늘고 호리호리한 줄기들이 모여 하나의 다발을 이루는 형태를 갖는다. 줄기는 대나무와 비슷하며 황갈색의 섬유질로 싸여있다. 주황빛을 띄는 줄기에 검은색의 열매가 맺히지만 독성이 있으므로 먹지 않는 것이 좋다. 생장이 매우 빠른편으로 반양지에서 직사광선을 피하여 기르는 것이 좋지만 광량이 너무 적으면 잎이 전체적으로 처지고 모양이 흐트러진다. 물은 화분구멍으로 흘러나올 만큼 흠뻑 주며 하루에 한 두 차례 엽면에 스프레이로 뿌려 줄 경우 외관을 유지하는데 도움이 된다. 1989년 나사에서 발표한 50종의 우수실내정화식물 중 하나로 증산작용이 뛰어나고 휘발성 화학물질 제거 능력이 매우 우수하여 공기 정화식물로 인기가 높다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(102,'셀라기넬라','images/plants/셀라기넬라.jpg','줄기와 잎이 향나무 가지와 비슷하고, 수태같이 생기기도 하다. 줄기가 연해 누워 자라고 줄기에 뿌리가 내리며 자란다. 포기는 밀집해서 소복하게 모여 자라고 잎은 밝은 녹색 또는 연녹색으로 비늘같이 부드러운 짧은 잎이 나 있다. 원산은 1과 1속으로 세계에 700종이 나며 주로 열대 우림지대에 자생하며 일본에 16종이 나고 한국에 6종이 난다. 화훼 장식 재료로 일반적으로 사용 되지는 않으나 작품의 밑 부분을 가려야 한다든지 수반화 아랫부분에 쓰여 작품의 아름다움을 더한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(103,'소철','images/plants/소철.jpg','Skill Level: Beginner  Exposure: Full sun  Soil type: Well-drained/light  **Despite its common name, this plant is not in fact a palm but in fact a cycad. Originally from Japan and Korea, it has been cultivated for centuries. It\'s undemanding and easy to care for, and can also be kept as a long-lived house plant. It has a reputation for being slow-growing, but it will often suddenly swing into action and grow several new leaves within a matter of weeks. A sago palm make a great addition to a summer patio, but larger specimens can also be planted out into the garden. Mature plants can withstand quite severe frosts, but do insulate any younger plants against cold weather.  ##Soil Type:  A GOOD general purpose potting soil (a soil that retains water yet drains well) will suffice. Check purchased soil to see that it is well aerated and add sand or perlite and peat moss if it seems to pack too tightly. Give the plants a chance to settle in before going back to whatever fertilization program has been successful for you. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite, 1 part moist peat or humus (leaf mold) and a light dusting of lime. Always use a pot with a hole.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,기타','쉬움','5℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(104,'소피아 고무나무','images/plants/소피아 고무나무.jpg','고무식물은 고무질을 생산하는 식물로 전 세계의 400종 이상 알려져 있는데 한국에서 흔히 고무나무라고 하는 것은 인도고무나무이다. 인도고무나무는 고무를 채취할 목적보다는 관상식물로 정원에 심거나 화분에 심어 실내장식용에 쓰이고 있다. 소피아 고무나무는 인도고무나무를 개량한 품종으로 일반적인 멜라닌 고무나무 보다 잎이 크다. 강한 직사광선을 피하되 실내의 밝은 곳에서 재배하고 실내습도를 40~70% 유지하며 깍지벌레와 응애와 같은 병충해를 조심해야 한다. 넓은 잎에 먼지가 쌓이면 식물의 호흡작용에 장해를 받아 생육에 영향을 미치므로 젖은 헝겊으로 잎을 닦아준다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(105,'솔레이롤리아','images/plants/솔레이롤리아.jpg','내한성이 강한 상록 여러해살이풀로 키는 약 5cm이며 줄기는 붉은색으로 30cm정도 뻗어 나간다. 둥근 작은 잎이 촘촘히 달려있고 흰색 작은 꽃이 피며 생명력이 강해 실내적응력이 뛰어나다. 관수는 화분에 흙이 말랐을 때 하며 잎이나 줄기에 물이 닿으면 곰팡이 병이 생길 수 있어 물을 줄때에는 저면관수 한다.','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','5℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(106,'수박페페로미아','images/plants/수박페페로미아.jpg','수박 페페로미아는 자일렌 제거량이 ‘중’등급이고, 포름알데히드 제거량은 ‘중상’등급으로 우수한 공기정화식물이다. 새집증후군 원인물질인 자일렌과 포름알데히드의 제거효과가 우수하나, 빛을 너무 적게 받으면 도장(웃자람)하고 실내에서 재배할 때 습도 40~70%를 유지해야한다. 추위에 약해 겨울철 온도관리에 주의하고 부엽토성분의 배수가 잘되는 토양에 심는다. 깍지벌레 응애와 같은 병충해에 주의한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(107,'수박필레아','images/plants/수박필레아.jpg','잎 위쪽에 성긴 톱니가 있는 타원형 잎 표면에 규칙적인 은색 무늬가 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','매우 어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(108,'수염 틸란드시아','images/plants/수염 틸란드시아.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','어려움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(109,'숙근이베리스','images/plants/숙근이베리스.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','어려움','10℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(110,'쉐플레라 \'홍콩\'','images/plants/쉐플레라 \'홍콩\'.jpg','홍콩야자라고 알려진 쉐플레라 ‘홍콩’은 실내공기정화력이 우수한, 특히 담배연기를 잘 흡수하는 식물로 알려져 있으며 키가 큰 종류의 쉐플레라와 키가 작은 왜성종 쉐플레라가 있다. 물 꽂이 화분에 심어도 뿌리가 내리는 적응력이 강한 식물이지만, 추위에는 약하다. 수건으로 잎을 닦아 주면 잎에서 윤기가 생겨 관상하기 좋다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','7℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(111,'스킨답서스','images/plants/스킨답서스.jpg','에코플렌트 중에서 가장 관리가 쉽고 잘 자라는 식물로 병해충에 대한 강한 저항성을 갖고 있다. 실내관엽 식물중 일산화탄소 제거능이 우수하여 주방의 기능성 식물로 알려진 종으로 어두운 곳에서도 잘 적응한다. 약 40m 길이까지 자랄 수 있는 덩굴성으로 행잉으로 이용하며 기근을 갖는다. 여러무늬 종들이 있으며 공기 정화력도 가지고 있다. 칼슘옥살레이트 성분을 가지고 있어 애완동물에게는 독성이 있다. 수경재배가 가능하여 줄기를 잘라 물꽂이 삽목하여 재배한다. 반음지에서 잘 자라며 겨울철에는 충분히 빛을 받게 하면서 물은 적게준다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(112,'스파티필룸','images/plants/스파티필룸.jpg','대표적인 품종은 다음과 같다.  ① 파티니이(S. patinii):   원산지는 확실하지 않으며 한국에서 흔히 재배한다. 높이 40∼50cm 정도로 자라며 무리 지어 난다. 잎은 혁질(革質:가죽 같은 질감)로서 긴 타원 모양 바소꼴이며 길이 약 20cm, 나비 8cm 정도이다. 불염포는 길이 8∼10cm로서 흰색이다. 그늘진 곳에서도 잘 자란다.  ② 칸니폴리움(S. cannifolium):   남아메리카 북부와 트리니다드토바고 원산이다. 원예종이 많으며 높이 80∼100cm 정도이다. 땅속줄기가 자란 것으로서 무리지어 난다. 잎은 두껍고 길이 30∼50cm, 나비 10∼18cm이며 잎자루와 같은 길이이다. 추위에는 약하나 그늘에서도 자란다.  ③ 플로리분둠(S. floribundum):   콜럼비아 원산이다. 높이 약 30cm이다. 왜성종으로서 잎은 빽빽이 나나 무리를 이루지 못하고 생장도 더디다. 잎은 타원 모양으로서 둥그스름하며 혁질이다. 잎은 길이 15∼20cm, 나비 8cm 정도이다. 불염포는 넓은 달걀 모양이며 육수꽃차례로 달린다. 향기가 강하고 열매를 잘 맺는다. 번식은 종자로 한다.  ④ 왈리시(S. wallisii):   중앙 아메리카가 원산지인 상록다년초다. 최대 90cm까지 자라며 10~12cm의 타원형 불염포를 가지고 있다. 불염포는 흰색이나 나이가 들면 녹색을 띤다. 광택이 있는 잎은 약 60cm까지 자라며 타 종보다 큰 편이다. 마우나로아(mauna loa), 센세이션(sensation), 도미노(domino)를 비롯한 다양한 원예 품종의 모태가 되었다. 상업적으로 가장 많이 이용되고 있는 대형 원예종인 마우나로아는 미항공우주국(NASA)의 공기정화식물 실험을 거친 원예종으로 벤젠, 폼알데하이드, 트릴클로로에틸렌, 크실렌, 톨루엔, 암모니아, ,아세톤 등의 제거 능력이 특히 매우 뛰어나 공기정화식물로도 인기가 많다.  꽃자루가 길고 흰색의 아름다운 포엽에 꼬리같은 육수화서가 붙어있다. 공기정화식물로도 유명하지만, 칼라를 닮은 포엽이 완전히 전개되면 우아한 꽃과 같은 느낌이다. 흰색의 포엽은 시간이 지날수록 녹색으로 바뀌어 간다. 공중습도 관리에 유의하며 습한 여름철을 제외하고 잎에 자주 분무한다. 재배가 쉽지만 추위에는 조금 약하므로 겨울철 냉해를 받지 않도록 주의한다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','13℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(113,'스파티필룸 (광엽)','images/plants/스파티필룸 (광엽).jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','보통','13℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(114,'시서스','images/plants/시서스.jpg','시서스는 그리스어로 담쟁이덩굴을 뜻하며 ‘포도아이비’라고 불리는 생명력이 강한 엔렌다니카와 ‘캥거루이이비’ 라고 불리는 안타르티카 등 다양한 품종이 있다. 시서스 안타르티카는 잎이 난형으로 밝은 녹색이고 가장자리에 엉성한 톱니가 있다. 덩굴손이 있어서 다른 물체에 매달리는 특성이 있어 끈으로 연결시켜 유인하여 기를 수 있다. 오존에 민감해 오존의 피해정도를 육안으로 확인할 수 있어 실내에서 기를 때 오존경보장치 기능을 할 수 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(115,'시클라멘','images/plants/시클라멘.jpg','덩이줄기 구근식물인 시클라멘의 꽃은 11월~3월까지 피고, 한줄기 끝에 1개의 꽃이 피며, 보라색, 분홍색, 빨강색, 흰색 등 꽃 색이 다양하다. 통풍이 잘 되는 서늘한 곳을 좋아한다. 하트모양의 독특한 화형을 오랫동안 감상 할 수 있고 겨울철 실내에서 재배가 용이한 장점이 있다. 관수는 잎과 구근이 닿지 않도록 저면관수 하는 것이 좋다. 생육온도는 16~20℃로 여름철 차광을 하여 온도조절을 해준다. 진딧물, 응애, 온실가루이 등 병충해에 조심한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,빨강색,흰색','어려움','7℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(116,'심비디움','images/plants/심비디움.jpg','‘물위의 배’라는 뜻으로 꽃은 2개의 꽃잎 1개의 설판, 3개의 꽃받침으로 구성된다. 분홍색, 빨강색, 노란색, 흰색 등 다양한 색을 갖고 있으며 화려하지만 대부분 향기가 없다. 우리나라에서는 겨울철에 꽃이 피고 화분용이나 절화로 많이 쓰이며 결혼식 축하 코사지로 많이 쓰인다. 지하부 배지의 과습에 약하므로 건조하게 관리한다. 뿌리가 꽉 차기 전, 3~4월에 분갈이를 하는 것이 좋다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','Y','분홍색,빨강색,오렌지색,노랑색,흰색,기타','어려움','10℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(117,'싱고니움','images/plants/싱고니움.jpg','연두색, 흰색, 빨강, 분홍색등의 잎색과 줄무늬, 점무늬 등 다양한 잎모양을 지닌 대표적인 잎보기식물이다. 실내 암모니아 제거능력 우수하고 반그늘을 좋아하며 고온다습한 환경에서 잘 자란다. 덩굴성이면서 줄기 마디에서 기근이 나와 다른 물체에 붙어 자란다. 줄기를 자르면 즙액이 나오고 이를 식용하면 위험하다. 응애, 깍지벌레, 온실가루이 병충해를 조심한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(118,'아글라오네마','images/plants/아글라오네마.jpg','영화 ‘레옹’의 주인공이 소중하게 여기던 화분식물로 잘 알려진 화분식물로 은빛과 녹색이 잘 배합되어 고급스러운 느낌을 전해준다. 최근에는 화사한 빛깔의 품종 ‘오로라’도 유통되고 있다. 밝은 빛을 공급하면 가장자리와 주맥의 붉은 빛이 선명해진다. 추위에 약하므로 겨울철 실내온도를 잘 관리하며 수경재배로 재배가 가능하다.','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(119,'아데니움','images/plants/아데니움.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,흰색,혼합색','보통','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(120,'아디안텀','images/plants/아디안텀.jpg','고사리류의 식물로 처음엔 위로 자라다가 어느 정도 자라면 아래로 처지는 형태로 밝은 녹색 잎이 많이 달려 있어 매우 섬세한 느낌을 준다.연한 녹색의 잎이 부드러운 관엽식물이고 원줄기는 윤기나는 검은색이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','매우 어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(121,'아라우카리아','images/plants/아라우카리아.jpg','송곳모양의 부드러운 바늘이 있는 가지가 수평으로 자라는 우아한 상록성 나무이다. 공기정화능력이 우수하고 재배가 쉬워 실내식물로 기르기에 적합하다. 반음지나 반양지에서 잘 자라며 직접적으로 빛을 받으면 잎이 누렇게 타므로 직사광선은 피하는 게 좋다. 키가 큰 실내식물로 겨울철 크리스마스트리로 사용하기도 하는데 어두운 곳에 오래두면 모양이 흐트러지므로 주의한다. 추위에 강해 남부 지방에서는 실외 정원에서 키우기도 하고 실내에서 2~3년에 한번 씩 분갈이를 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','5℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(122,'아레카야자','images/plants/아레카야자.jpg','NASA가 지정한 실내공기 정화 식물 중에서 가장 일등공신으로 꼽히는 식물로 거실이나 사무실 등의 공기정화에 필수적인 식물이다.비교적 키우기 쉽지만 너무 강한 직사광선이나 건조한 공기는 싫어한다. 야자류 중에서는 질감도 부드럽고 여성스러운 느낌을 주며 가습기를 대신할 정도로 증산량이 뛰어난 식물이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(123,'아마릴리스','images/plants/아마릴리스.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,흰색,혼합색','쉬움','7℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(124,'아스파라거스 풀루모수스','images/plants/아스파라거스 풀루모수스.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(125,'아스플레니움','images/plants/아스플레니움.jpg','연녹색의 광택 있는 잎이 시원한 관엽식물이고 창모양의 반짝이는 잎이 로제트 형태로 나오면서 둥지 모양으로 자란다.','항상 흙을 축축하게 유지함(물에 잠김)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(126,'아왜나무','images/plants/아왜나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','0℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(127,'아이비','images/plants/아이비.jpg','아이비는 더운 것을 싫어하므로 너무 더운 곳은 피하고 조금 서늘한 곳에서 키우는 것이 좋다. 주위가 건조할 때는 잎에 자주 분무해 준다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','5℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(128,'아펠란드라','images/plants/아펠란드라.jpg','Soil Type:  Use a GOOD rich potting soil (a soil that retains water yet drains well), such as an African violet mix. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite and 2 parts peat or humus (leaf mold). Always use a pot with a hole.      Growing Ease:  Requires a little extra care','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(129,'아프리칸 바이올렛','images/plants/아프리칸 바이올렛.jpg','다년생, 다육질의 타원형 잎에 털이 있고 꽃의 색상과 형태에 따라 다양한 품종이 있음','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','파랑색,보라색,분홍색,빨강색,흰색,혼합색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(130,'안수리움','images/plants/안수리움.jpg','일산화탄소, 암모니아 가스 제거 능력이 좋기 때문에 주방이나 화장실이 적합하다. 오랫동안 감상 할 수 있는 광택이 있는 포엽이 아름다워 실내에서 분화로 기르는 열대 관엽 관화 식물이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,흰색,혼합색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(131,'알로카시아 아마조니카','images/plants/알로카시아 아마조니카.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(132,'알로카시아 쿠쿨라타','images/plants/알로카시아 쿠쿨라타.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(133,'얼룩자주달개비','images/plants/얼룩자주달개비.jpg','Soil Type:  A GOOD general purpose potting soil (a soil that retains water yet drains well) will suffice. Check purchased soil to see that it is well aerated and add sand or perlite and peat moss if it seems to pack too tightly. Give the plants a chance to settle in before going back to whatever fertilization program has been successful for you. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite, 1 part moist peat or humus (leaf mold) and a light dusting of lime. Always use a pot with a hole.     Growing Ease:  Will grow for anybody','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(134,'에메랄드리플 페페로미아','images/plants/에메랄드리플 페페로미아.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(135,'에크메아 파시아타','images/plants/에크메아 파시아타.jpg','색깔이 선명한 포엽(苞 : 보통 꽃으로 감상하는 부분으로 잎이 변형된 것임)이 아름답고, 관상기간이 길다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(136,'엘라티올 베고니아','images/plants/엘라티올 베고니아.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,오렌지색,노랑색,흰색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(137,'여우꼬리풀','images/plants/여우꼬리풀.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(138,'엽란','images/plants/엽란.jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','5℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(139,'옥살리스(사랑초)','images/plants/옥살리스(사랑초).jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,흰색','보통','10℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(140,'온시디움','images/plants/온시디움.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,빨강색,노랑색,흰색,혼합색,기타','어려움','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(141,'왜란','images/plants/왜란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','0℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(142,'왜성종려죽','images/plants/왜성종려죽.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','7℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(143,'움벨라타 고무나무','images/plants/움벨라타 고무나무.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(144,'유카','images/plants/유카.jpg','Skill Level: Experienced    Exposure: Full sun    Soil type: Well-drained/light, Dry    Height: 1000cm    Spread: 800cm    Time to plant seeds: March to May         **Yuccas come from the deserts and plains of southern North and Central America and with their stiff, leathery leaves and panicles of creamy white flowers, they make great architectural plants. Y. elephantipes has light to mid-green leaves that are rough-edged but spineless. It can be grown as an indoor plant or as a patio plant but it will need a frost-free place in winter. It has been given an Award of Garden Merit (AGM), which is for plants of outstanding excellence.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','5℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(145,'은사철나무','images/plants/은사철나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','0℃','','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(146,'익소라','images/plants/익소라.jpg','꽃이 피어 있는 시간이 길고 짙은 녹색의 잎이 매혹적으로 빛나서 인기 있는 상록저목이다.   또한 꽃이 피어도 열매는 맺지 않는 것이 특징이다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,오렌지색,흰색','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(147,'인삼벤자민','images/plants/인삼벤자민.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(148,'자금우','images/plants/자금우.jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','0℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(149,'자란','images/plants/자란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','40 ~ 70%','Y','분홍색,흰색,혼합색','쉬움','5℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(150,'자주색만년초','images/plants/자주색만년초.jpg','자주빛을 띠는 닭의장풀과 식물로 단독화분에 심어도 아름답다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','7℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(151,'접란','images/plants/접란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(152,'제라니움','images/plants/제라니움.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,오렌지색,흰색','쉬움','10℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(153,'좀마삭줄','images/plants/좀마삭줄.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','0℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(154,'종려방동사니','images/plants/종려방동사니.jpg','Uses:  Water gardens, bogs, water peripheries, tubs, containers     Soil Type:  A GOOD general purpose potting soil (a soil that retains water yet drains well) will suffice. Check purchased soil to see that it is well aerated and add sand or perlite and peat moss if it seems to pack too tightly. Give the plants a chance to settle in before going back to whatever fertilization program has been successful for you. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite, 1 part moist peat or humus (leaf mold) and a light dusting of lime. Always use a pot with a hole.      Growth Rate:  Fast     Growing Ease:  Will grow for anybody     Flower Color:  Beige','','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(155,'종려죽','images/plants/종려죽.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(156,'죽백나무','images/plants/죽백나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(157,'줄리아 페페로미아','images/plants/줄리아 페페로미아.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(158,'참쇠고비(섬쇠고비)','images/plants/참쇠고비(섬쇠고비).jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','쉬움','5℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(159,'치자나무','images/plants/치자나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색,흰색','쉬움','5℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(160,'칼라데아 마코야나','images/plants/칼라데아 마코야나.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(161,'칼라데아 인시그니스','images/plants/칼라데아 인시그니스.jpg','잎의 무늬가 선명하여 포인트로 적당하다. 덩이줄기에서 올라온 달걀모양 잎의 앞면에 주맥을 축으로 짙은 녹색 또는 암갈색의 반점이 있다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(162,'칼라데아 크로카타','images/plants/칼라데아 크로카타.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','오렌지색,노랑색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(163,'칼라디움','images/plants/칼라디움.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','매우 어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(164,'칼랑코에','images/plants/칼랑코에.jpg','누구나 쉽게 키울 수 있음','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,오렌지색,노랑색,흰색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(165,'커피나무','images/plants/커피나무.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(166,'켄챠야자','images/plants/켄챠야자.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(167,'코르딜리네 레드에지','images/plants/코르딜리네 레드에지.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(168,'크로톤','images/plants/크로톤.jpg','열대성 상록 관목으로 다양한 잎 모양과 잎색에 따른 품종이 많고 빛에 대한 적응성이 강하여 어두운 곳에서도 오래 견딘다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(169,'크노톤','images/plants/크로톤.jpg','Skill Level: Experienced    Exposure: Full sun    Soil type: Well-drained/light, Moist, Sandy        **This is an evergreen shrub found in the tropics and the Far East, where it grows to 3m (10ft) in height. Its main attraction is its glossy foliage which is dark green, laced with veins of yellow, pink, orange and red, and in its native areas it\'s often used for decorative hedges. In the UK, it can be grown as an attractive houseplant, ideal for a warm room or conservatory. The plant can be a bit tricky to look after as it needs a brightly lit position away from draughts, with a good, constant temperature between 16C to 29C (60F to 85F). It also needs a high level of humidity, so mist it regularly to keep it looking its best. Keep the plant well watered in summer but infrequently in winter. Plants should be given a weak liquid feed every three weeks or so during the summer growing period.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(170,'크립탄서스','images/plants/크립탄서스.jpg','파인애플과 식물중 지피식물로 건조에 강하여 기르기 쉬운 식물이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(171,'클레마티스','images/plants/클레마티스.jpg','꽃피는 시기에는 물이 마르면 안되고 올라갈 지지대가 필요하다. 물과 양분을 충분히 준다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','높은 광도(1,500~10,000 Lux)','70% 이상','Y','보라색,분홍색,빨강색,흰색','쉬움','0℃','빠름','발코니 창측 (실내깊이 0~50cm)'),(172,'털달개비','images/plants/털달개비.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색','보통','13℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(173,'털머위','images/plants/털머위.jpg','','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','노랑색','보통','5℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(174,'테이블야자','images/plants/테이블야자.jpg','공기중에 수분을 방출하는 능력이 뛰어나고 벤젠, 포름알데히드등의 화학물질을 제거하는데 좋아 공기정화식물로도 적절하다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(175,'톨미아','images/plants/톨미아.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(176,'틸란드시아','images/plants/틸란드시아.jpg','화포틑 분홍색으로 각각의 포에서 남보라색 꽃이 차례로 피는데 같은 포에서 3~4장의 꽃잎을 올림','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색','어려움','10℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(177,'파키라','images/plants/파키라.jpg','외국에서는 Money tree라고 불리우고, 잎과 꽃은 채소처럼 식용하고, 열매는 땅콩맛이 난다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(178,'파피오페딜럼','images/plants/파피오페딜럼.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','70% 이상','Y','보라색,분홍색,빨강색,노랑색,흰색,혼합색','어려움','10℃','느림','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(179,'팔레놉시스(호접란)','images/plants/팔레놉시스(호접란).jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,오렌지색,노랑색,흰색,혼합색','매우 어려움','13℃','느림','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(180,'팔손이나무','images/plants/팔손이나무.jpg','마치 손가락처럼 7~11열로 깊게 갈라진 큰 잎이 호생하며, 잎 양면에 털이 없고 짙은 녹색으로 광택이 있고 뒷면은 황록색이다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','','쉬움','5℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(181,'팬더 고무나무','images/plants/팬더 고무나무.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(182,'팻츠헤데라','images/plants/팻츠헤데라.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(183,'페페로미아 오브투시폴리아','images/plants/페페로미아 오브투시폴리아.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(184,'페페로미아 클루시폴리아','images/plants/페페로미아 클루시폴리아.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(185,'페페로미아 푸테올라타','images/plants/페페로미아 푸테올라타.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(186,'포인세티아','images/plants/포인세티아.jpg','추위에 약한 식물로 온도가 낮으면 잎이 덜어진다. 잎에서 나오는 흰색 즙액은 피부나 눈에 염증을 일으킬 수 있으므로 조심한다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,노랑색,흰색,혼합색','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(187,'폴리시아스','images/plants/폴리시아스.jpg','풍성하고 섬세한 잎과 부드럽게 늘어뜨려진 가지에 매력이 있어 인기가 있음','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(188,'푸밀라고무나무','images/plants/푸밀라고무나무.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','10℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(189,'프테리스','images/plants/프테리스.jpg','긴 잎의 중앙에 흰 무늬가 있는 관엽식물이고 잎은 우상복엽으로 1-3쌍이고 길이는 비교적 짧으며 모양과 색깔 무늬가 다양하고 아름답다','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','보통','5℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(190,'피라칸사','images/plants/피라칸사.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','0℃','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(191,'피토니아 핑크스타','images/plants/피토니아 핑크스타.jpg','고온다습하고 통풍이 원활한 밝은 그늘이나 반그늘에서 잘 자란다.  생장이 느리고 잎 주변에 지속적인 수분과 따뜻함을 요구하고 공중습도 유지가 제일 중요하다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','매우 어려움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(192,'피토니아 화이트스타','images/plants/피토니아 화이트스타.jpg','고온다습하고 통풍이 원활한 밝은 그늘이나 반그늘에서 잘 자란다.   갑자기 강한 햇빛에 노출되면 잎이 타기 쉽다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(193,'픽투라툼 접란','images/plants/픽투라툼 접란.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(194,'필레아 글라우카(타라, 블루체인)','images/plants/필레아 글라우카(타라, 블루체인).jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(195,'필로덴드론 \'선라이트\'','images/plants/필로덴드론 \'선라이트\'.jpg','잎의 광택이 있고 두꺼워서 거친 느낌을 주는것처럼 환경에 적응하는 힘도 크다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(196,'필로덴드론 \'제나두\'','images/plants/필로덴드론 \'제나두\'.jpg','줄기에서 잎이 떨어진 흔적이 신기하고 오래된 나무와 같은 모양을 한다.','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(197,'필로덴드론 고엘디','images/plants/필로덴드론 고엘디.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(198,'필로덴드론 레몬라임','images/plants/필로덴드론 레몬라임.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(199,'필로덴드론 셀로움','images/plants/필로덴드론 셀로움.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(200,'필로덴드론 옥시카르디움','images/plants/필로덴드론 옥시카르디움.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(201,'필로덴드론 콩고','images/plants/필로덴드론 콩고.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(202,'해마리아','images/plants/해마리아.jpg','아주 낮은 그늘에서 잘 견딘다.','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','13℃','느림','실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(203,'행운목','images/plants/행운목.jpg','','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','13℃','보통','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(204,'헤미오니티스(하트펀)','images/plants/헤미오니티스(하트펀).jpg','하트 모양의 잎이 매력적인 관엽식물이다. Soil Type:  Use a GOOD rich potting soil (a soil that retains water yet drains well), such as an African violet mix. If you want to mix your own take: 2 parts garden soil, 2 parts humus (leaf mold), 1 part coarse sand or perlite, 1 part rinsed aquarium charcoal chips and a little fine grade fir bark. Always use a pot with a hole.    Growing Ease:  Requires extra care','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','70% 이상','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(205,'헤테로파낙스 프라그란스 (해피트리)','images/plants/헤테로파낙스 프라그란스 (해피트리).jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(206,'협죽도','images/plants/협죽도.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','쉬움','7℃','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(207,'형광스킨답서스','images/plants/형광스킨답서스.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','빠름','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(208,'호야','images/plants/호야.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(209,'호야 엑소티카','images/plants/호야 엑소티카.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,흰색','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(210,'호주매','images/plants/호주매.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','분홍색,빨강색,흰색','어려움','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(211,'홀리아페페로미아','images/plants/홀리아페페로미아.jpg','','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(212,'황금마삭줄','images/plants/황금마삭줄.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','5℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(213,'황금죽','images/plants/황금죽.jpg','Soil Type:  A GOOD general purpose potting soil (a soil that retains water yet drains well) will suffice. Check purchased soil to see that it is well aerated and add sand or perlite and peat moss if it seems to pack too tightly. Give the plants a chance to settle in before going back to whatever fertilization program has been successful for you. If you want to mix your own take: 1 part garden soil, 1 part coarse sand or perlite, 1 part moist peat or humus (leaf mold) and a light dusting of lime. Always use a pot with a hole.      Growing Ease:  Will grow for anybody','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','어려움','13℃','','거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)'),(214,'후피향나무','images/plants/후피향나무.jpg','광택이 나는 잎과 붉은 열매가 아름답다.','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','쉬움','0℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(215,'흰꽃나도사프란','images/plants/흰꽃나도사프란.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','흰색','쉬움','5℃','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(216,'흰줄무늬달개비(트라데스칸티아)','images/plants/흰줄무늬달개비(트라데스칸티아).jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','','','보통','13℃','','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(217,'히포에스테스','images/plants/히포에스테스.jpg','Uses:  Ornamental and Houseplant     Soil Type:  Moist, rich, well-drained      Growing Ease:  Will grow for anybody','흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','40 ~ 70%','Y','보라색,분홍색,흰색','보통','13℃','보통','거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(218,'페페로미아 그라베올렌스','images/plants/페페로미아 그라베올렌스.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','어려움','10°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(219,'산세베리아 ‘하니’','images/plants/산세베리아 ‘하니’.jpg','높이 15cm잎은 넓고 다양한 무늬가 있음','화분 흙 대부분 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','쉬움','2~3°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(220,'미파','images/plants/미파.jpg','원예선발품종으로 식물체의 지름이 4cm 정도이며잎의 단면은 삼각형 모양을 이루고 있으며 잎이빽빽하게 겹쳐있음전체적으로 진녹색이고 매끈하며 잎의 가장자리는흰색의 줄무늬가 둘러져 있음','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','노랑색','어려움','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(221,'벽어연','images/plants/벽어연.jpg','키가 90cm인 관목형으로 잎은 가위모양이며,포복성이 있어 길어지면 옆으로 누움어린가지는 붉은색을 띠며 묵은 가지는 목질화됨','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','노랑색, 연보라색','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(222,'입전봉','images/plants/입전봉.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','매우 어려움','5°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(223,'사마로','images/plants/사마로.jpg','검은빛의 바위솔로 잎이 작음광량에 따라 몸빛이 더욱 곱게 물듦갸름하고 통통한 잎에 살짝 펠트 조직이 있어부드러운 느낌임군생하며 자람','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','매우 어려움','3°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(224,'모난데스 폴리필라','images/plants/모난데스 폴리필라.jpg','소형종으로 빽빽하게 모여나며 군락을 이룸성장하면서 잎 사이에서 새로운 자구가 나옴강광에서 녹기 쉽고 습기에도 약해 반그늘에서 키워야함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','우주선','쉬움','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(225,'야로수','images/plants/야로수.jpg','잎이 옅은 녹색이며 잎면에 하얀색 줄 무늬가 있고상단에 삼각 형태의 창이 있음기부에서 군생함','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux)','','Y','흰색','보통','10~15°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(226,'수','images/plants/수.jpg','줄기가 없는 잎은 로제트를 이루며 군생하고3~5cm정도 크기의 두터운 잎은 15~20개정도가 넓게 직립하며 성장하며 진한 청색을 띠고 흰색의 선이 있음','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux)','','Y','흰색','보통','10~15°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(227,'십이지권','images/plants/십이지권.jpg','줄기가 없으며, 지름 8~10cm의 로제트를 이룸잎은 길이 4~4.5cm, 폭 1.5cm 정도로 긴 삼각형이며선단은 뾰족함잎 뒷면의 결절은 백색이며 가로줄무늬를 이룸Haworthia속 중에서 가장 널리 일반에 보급된 종','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','흰색','보통','10~15°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(228,'알로에','images/plants/알로에.jpg','소형종으로 식물체의 지름이 10cm이며,널리 알려짐노란 꽃이 핌더위에 약함자주가 많이 생김','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','쉬움','5°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(229,'불야성','images/plants/불야성.jpg','소형종으로 식물체의 지름이 10cm임잎 가장자리에 가시가 있으며, 기부에서 분지함','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','오렌지색, 빨강색','쉬움','5°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(230,'자보','images/plants/자보.jpg','잎 길이가 7cm 정도이며 얇고 호생함기부에서 분지하여 군생잎에 반점이 많은 것은 조금 약하고 생장도 느림','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','빨강색','쉬움','-5°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(231,'상조','images/plants/상조.jpg','잎이 도톰하고 길며 백분이 있음잎을 억지로 따면 상처가 남여름철에는 물을 적게 줌번식이 잘 됨','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','보통','3°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(232,'자려전','images/plants/자려전.jpg','약 15cm너비의 장미꽃 형상이며 잎은 연한붉은색의 두꺼운 반원통모양임','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색','보통','3°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(233,'입전','images/plants/입전.jpg','곧게 선 줄기에 잎이 약간 긺잎이 떨어진 후에 줄기 끝에 잎이 남성장이 좋은 다육이로 주걱모양의 기다란 잎이탐스럽게 런너를 형성하며 성장하고 잎 표면이미세한 백분으로 덮여 있어 뽀얗고 깔끔함성장하면서 줄기는 곧고 튼튼하게 목질화됨','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','오렌지색','보통','3°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(234,'홍미인','images/plants/홍미인.jpg','목대에 끈적임이 있음','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','빨강색','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(235,'성미인','images/plants/성미인.jpg','작고 낮은 나무모양으 로, 잎끝은 넓고 둥글며끝은 약간 뾰족함백분을 띤 잎은 옅은 청록색잎 길이는 2∼4cm, 폭은 2∼2.5cm로두께는 1∼1.5cm로 두꺼움','화분 흙 대부분 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','분홍색','보통','7°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(236,'군작','images/plants/군작.jpg','식물체의 지름이 10cm임길고 통통한 잎이 돌려나며 방추형임성장이 느린편이며 줄기가 엄지손가락보다 굵게목질화되는 모습을 볼 수 있음','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','2~3°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(237,'신화월','images/plants/신화월.jpg','잎이 화월보다 둥글며 가장자리가 붉게 물듦여름에는 잎이 파랗게 되며 가을에 다시 노랗게 됨','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색, 연분홍색','쉬움','5°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(238,'무을녀','images/plants/무을녀.jpg','15~30cm 내외로 자라며, 줄기에 있는 마디를가릴정도로 많은 잎이 비스듬히 마주남잎은 둥근 형이며 짧고 통통함. 줄기는 가늘고탑을 쌓아가듯 곧게 뻗으며, 추후 옆으로 기듯이뻗어나고 군생함','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','10°C','보통','발코니 창측 (실내깊이 0~50cm)'),(239,'우주목','images/plants/우주목.jpg','잎은 끝이 빨판 모양 원통형줄기는 약한 편이고 추위에 약함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','분홍색','보통','5°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(240,'십자성','images/plants/십자성.jpg','줄기는 분 지성으로 많 이 자 라다가 나 중에는쓰러져서 자라기도 함잎은 마주나고 끝부분이 뾰족한 타원형에 가까운회녹색이고 잎 둘레에 적색무늬가 있음잎의 길이는 15~25mm, 폭은 9~13mm임','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(241,'남십자성','images/plants/남십자성.jpg','잎은 십자성과 비슷하나 잎에 무늬가 있고 조금 더 얇음마주나는 연두색 두 잎이 열십자 모양으로 교차함분지성으로 많은 줄기가 자라며, 46cm 까지 자람','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','연노랑색','보통','4~7°C','보통','발코니 창측 (실내깊이 0~50cm)'),(242,'염자','images/plants/염자.jpg','실내에서 1m 정도까지 자람','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','쉬움','3°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(243,'애성','images/plants/애성.jpg','통통한 삼각형 모양의 잎이 십자 형태로 마주 보고나오며 위로 25~30cm 까지 자람','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','복숭아색','매우 어려움','5~10°C','느림','발코니 창측 (실내깊이 0~50cm)'),(244,'기천','images/plants/기천.jpg','직경 4cm 정도의 사각형 기둥모양으로 잎은 두껍고빽빽하게 겹쳐 있으며, 회백 녹색을 띰잎의 윗면은 편평하며 각이 져 있고, 아랫면은부풀어 오른 모양','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','주황색','어려움','5°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(245,'은전','images/plants/은전.jpg','가늘고 긴 잎에 길고 부드러운 흰색 털이 붙어 있음군생으로 자람봄에 줄기를 잘라 번식','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','','','보통','0°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(246,'백로','images/plants/백로.jpg','12cm까지 자람자생지가 넓고 형태가 다양군생으로 키움여름철에는 물을 적게 줌','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','어려움','5~10°C','느림','발코니 창측 (실내깊이 0~50cm)'),(247,'크라슐라 ‘다비드’','images/plants/크라슐라 ‘다비드’.jpg','','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux)','','','','보통','5~10°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(248,'크라슐라 ‘부다템플’','images/plants/크라슐라 ‘부다템플’.jpg','잎 너비가 2~3cm로 탑처럼 쌓여 가며 길게 자람육각형 모양을 띤 것도 있음','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux)','','Y','흰색','어려움','5~10°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(249,'적귀성','images/plants/적귀성.jpg','원예종으로 소형이며 잎 전체가 붉게 물듦강하게 키우는 것이 좋음','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','어려움','5~10°C','보통','발코니 창측 (실내깊이 0~50cm)'),(250,'화제','images/plants/화제.jpg','잎 너비는 1~2cm 정도이며 빨간색을 띰','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','5~10°C','보통','발코니 창측 (실내깊이 0~50cm)'),(251,'복랑','images/plants/복랑.jpg','백녹색의 잎에 보랏빛 홍색선이 둘러져 있으며백분이 있음겨울철에는 그다지 자라지 않으며, 5°C 이상을유지하고 물을 적게 줌','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','빨강색','매우 어려움','5~10°C','느림','발코니 창측 (실내깊이 0~50cm)'),(252,'백미인','images/plants/백미인.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','보통','5~10°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(253,'웅동자','images/plants/웅동자.jpg','줄기는 높이 30cm정도의 낮은 나무 모양으로자라며, 가지가 계속 발생해 넓게 퍼짐회록색의 몸체에 두툼한 털이 월토이와 비슷하며길이 2.5cm, 폭 1.2cm 정도인 잎이 많이 달림','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','오렌지색, 빨강색','쉬움','-1°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(254,'월토이','images/plants/월토이.jpg','기부에서부터 가지를 치며 높이 50cm 정도잎은 상당히 다육질이며 원형으로 긴 편. 길이 7cm,폭 2cm 정도임줄기와 잎은 조밀한 백모(白毛)형태의 펠트로덮여있으며 잎 가장자리에는 톱니 모양으로진한 갈색의 반점이 있음','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','연녹색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(255,'당인','images/plants/당인.jpg','줄기에는 잎이 촘촘하게 붙어 있으며 줄기는1m 정도까지 자람백분을 띤 잎은 길이 10~15cm, 폭 4~6cm 정도로가장 자리가 붉으며 계란형임','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','보통','-2°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(256,'캐시미어바이올렛','images/plants/캐시미어바이올렛.jpg','보랏 빛깔 장미 모양 형태에 은은한 장미향이 남잎사귀를 만지면 짧은 잔털이 있어서 캐시미어처럼부드러움','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','쉬움','-7°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(257,'소인제','images/plants/소인제.jpg','잎 길이가 2cm이고 끈적거림줄기는 얇고 진한 갈색을 띠며 잘 부러짐잎이 유접곡보다 원통형임','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(258,'유접곡','images/plants/유접곡.jpg','줄기 끝 부분에 로제트상으로 작은 잎을 만듦잎 길이는 1cm이고 둥근 형태로 표면에 갈색무늬가 있음녹색의 가느다란 줄기는 점차 목질화됨소인제보다 잎이 넓음','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','보통','-7°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(259,'흑법사(黑法師)','images/plants/흑법사(黑法師).jpg','원예품종으로 잎이 줄기 끝에 로제트 형상으로자라고, 25cm 정도 높이의 곧은 줄기에 가지가조금 나옴로제트의 직경은 20cm 정도로 잎은 암적자색으로밀생하고 주걱모양이며 선단은 뾰족하지 않음잎 주위에서는 흰털이 남','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','황색','쉬움','-2°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(260,'홍용월','images/plants/홍용월.jpg','갸름한 잎이 두툼하게 로제트 형으로 자라며잎 끝 부분에 흰색 띠가 나타남생장이 빠르며 잘 늘어짐줄기가 단단하고 추위에 강함','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','흰색','쉬움','0°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(261,'그랍토페탈룸 멘도자','images/plants/그랍토페탈룸 멘도자.jpg','10~15cm 까지 성장잎 길이 1.0~1.5cm, 폭 0.5cm 까지 됨군생하며 자라고 옅은 살구색을 띰더디게 키우는 것이 좋음','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','쉬움','0°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(262,'그랍토베리아 ‘퍼플드림’','images/plants/그랍토베리아 ‘퍼플드림’.jpg','수목형으로 성장하는 소형종. 기다란 잎들이 줄기를따라 로제트로 성장하는 모습으로 기부에서 자구를만들며 풍성하게 군생','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','쉬움','0°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(263,'흑괴리','images/plants/흑괴리.jpg','길쭉하고 끝이 뾰족한 잎이 로제트형상으로둘러나며 비교적 관리가 수월하며 왕성하게단기간에 자람','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색','쉬움','0°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(264,'그랍토베리아 ‘실버스타’','images/plants/그랍토베리아 ‘실버스타’.jpg','가늘고 긴 촘촘한 잎 표면에 은색광택이 있으며,잎 끝이 가늘고 긴 털 같은 느낌의 붉은색을 띰가운데 부분에서 분지하며 군생으로 자람성장이 더딘 편임','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','살구색','보통','0°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(265,'그랍토베리아 ‘데비’','images/plants/그랍토베리아 ‘데비’.jpg','식물체의 지름이 10cm길고 납작한 잎이 로제트를 이루며 돌려남잎은 분홍색으로 가늘고 길며 도톰함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','노랑색, 오렌지색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(266,'백모단','images/plants/백모단.jpg','식물체의 지름이 10cm 정도이며 잎이 겹쳐 남더위에 강함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','빨강색','보통','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(267,'연봉','images/plants/연봉.jpg','줄기가 서고 잎이 둥글고 크며 분홍색을 띰저온이 되면 잎에 붉은 점이 생김백분으로 덮인 옥색의 잎이 로제트를 이뤄모여나며, 잎 두께는 얇은 편임 줄기는튼튼하게 목질화되어 성장하며, 줄기부터 자구를 만듦','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','분홍색','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(268,'에케베리아 ‘탱고’','images/plants/에케베리아 ‘탱고’.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색','어려움','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(269,'에케베리아 ‘블루에뜨’','images/plants/에케베리아 ‘블루에뜨’.jpg','더위에 약함로제트로 군생하며 로제트의 직경은 15cm잎의 길이 5~7cm, 너비 2~3cm','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','빨강색','쉬움','0°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(270,'에케베리아 ‘미니캐슬’','images/plants/에케베리아 ‘미니캐슬’.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','보통','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(271,'에케베리아 톨루센시스','images/plants/에케베리아 톨루센시스.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(272,'에케베리아 ‘데저스스타’','images/plants/에케베리아 ‘데저스스타’.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','보통','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(273,'환엽홍사','images/plants/환엽홍사.jpg','홍사의 개량종이며, 강하게 키우면 잎 중앙에 돌기가 생김잎은 홍사보다 진한 자주색을 띰로제트의 직경 12cm','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','분홍색, 흰색','어려움','5°C','느림','발코니 창측 (실내깊이 0~50cm)'),(274,'에케베리아 ‘릴리시아나’','images/plants/에케베리아 ‘릴리시아나’.jpg','잎모양이 말려놓은 장미같은 로제트를 이루며 잎에은회색의 백분이 있음','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','주황색','보통','0°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(275,'조몽','images/plants/조몽.jpg','식물체의 지름이 10cm이고, 잎이 얇고 길며분홍색으로 물듦','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(276,'구미리','images/plants/구미리.jpg','멕시코, 미국남부에 분포하며 하단부 줄기는 60cm까지 자라고 가지가 발달70cm까지 자라는 꽃대에 총상꽃차례로 개화spectabilis는 “remarkable”의 뜻이 있으며 식물이크고 화려한 꽃이 피는데서 유래','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','보통','0°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(277,'에케베리아 ‘글라우카’','images/plants/에케베리아 ‘글라우카’.jpg','높이 60cm, 줄기직경 1.5cm, 낙엽성의 잎을 가짐몸체와 잎은 납회색이며 마디에서 곁가지가 형성됨로제트 모양이며, 잎 가장자리가 붉음분지가 잘 되며 키우기 쉬움','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','높은 광도(1,500~10,000 Lux)','','Y','분홍색, 노랑색','쉬움','3~7°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(278,'에케베리아 ‘톱시터비’','images/plants/에케베리아 ‘톱시터비’.jpg','식물체의 지름이 10cm정도이고 잎의 바깥쪽이안으로 굽어짐','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색, 살구색, 분홍색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(279,'대화금','images/plants/대화금.jpg','소형종으로 식물체의 지름이 10cm정도잎이 넓고 촘촘하며 갈색무늬가 선명함보통 단구로 자람, 건조에 강하고 햇빛을 좋아함','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','빨강색, 노랑색','어려움','5°C','느림','발코니 창측 (실내깊이 0~50cm)'),(280,'에케베리아 푸미라','images/plants/에케베리아 푸미라.jpg','줄기가 없으며 식물체의 지름이 8~10cm 정도작은 잎이 촘촘하게 많이 나며 잎 뒷면이 붉게 물듦더위에 강함','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','빨강색, 노랑색','어려움','0°C','느림','발코니 창측 (실내깊이 0~50cm)'),(281,'금황성','images/plants/금황성.jpg','길고 두터운 녹색의 잎은 백색의 융모로 뒤덮힘모체는 작은 저목형으로 분지성임로제트의 잎 직경은 8cm줄기 끝은 어두운 주황색의 잔 털이 남','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','오렌지색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(282,'라일락','images/plants/라일락.jpg','잎이 둥그스름하며 줄기가 서고 보라색으로 물듦','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(283,'양로','images/plants/양로.jpg','식물체의 지름이 10cm정도의 로제트형잎의 길이는 5~7cm, 폭 2~3cm로, 안으로 오목함줄기가 곧고 강함기부에서 군생','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux)','','Y','빨강색','보통','5°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(284,'샤비홍','images/plants/샤비홍.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','어려움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(285,'홍매화','images/plants/홍매화.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','','','보통','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(286,'몰라코','images/plants/몰라코.jpg','검붉게 물드는 로제트 형태','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','오렌지색, 노랑색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(287,'에케베리아 ‘라임앤칠리’','images/plants/에케베리아 ‘라임앤칠리’.jpg','','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','','','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(288,'먼로','images/plants/먼로.jpg','라우린제의 콤팩트 한 종으로 식물체의 지름이10cm정도이며 잎이 짧음라우린제 보다 붉은빛이 많음더위에 약함','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색, 분홍색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(289,'에케베리아 ‘미니벨’','images/plants/에케베리아 ‘미니벨’.jpg','끝이 뾰족한 타원형의 잎이 로제트를 이룸','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색, 오렌지색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(290,'부용','images/plants/부용.jpg','식물체의 지름이 5~6cm정도이며, 줄기는 25cm까지짙은 갈색으로 자람어린줄기와 잎은 가늘고 부드러운 흰털로 덮여있음잎은 긴 타원형으로 납작하며, 가장자리 중앙부분에서 잎 끝으로 갈수록 붉은색이 짙어짐','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','빨강색','쉬움','5°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(291,'에케베리아 ‘라즈베리아이스’','images/plants/에케베리아 ‘라즈베리아이스’.jpg','잎끝에 맑은 빛이 특징이며 동그란 로제트형임','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색, 분홍색','어려움','5°C','느림','발코니 창측 (실내깊이 0~50cm)'),(292,'에케베리아 ‘도리스테일러’','images/plants/에케베리아 ‘도리스테일러’.jpg','식물체 지름이 5~8cm 정도이고, 연한 녹색의 잎은솜털로 덮여 있으며 빨갛게 물듦군생이 잘 됨','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','노랑색, 빨강색','쉬움','0°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(293,'정야','images/plants/정야.jpg','식물체 지름이 5cm정도이고 녹색 빛이 나는 흰색의둥근잎이 촘촘히 겹쳐남외줄기이며, 나중에는 줄기가 길어짐로제트의 직경은 6cm 정도','화분 흙 대부분 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','빨강색, 노랑색','보통','3°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(294,'에케베리아 ‘펀퀸’','images/plants/에케베리아 ‘펀퀸’.jpg','잎은 삼각형으로 백분이 있으며 기부에서 군생연한 녹색의 잎이 장미처럼 서로 엇갈린 형태를 이룸','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색','보통','3°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(295,'홍화장','images/plants/홍화장.jpg','서늘해지면 잎 가장자리가 빨갛게 물듦줄기가 서고, 작은 로제트가 됨군생이 잘 됨','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','빨강색, 노랑색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(296,'에케베리아 ‘치와와린제’','images/plants/에케베리아 ‘치와와린제’.jpg','E. chilhuahuaensis X E. lindsayana의 교배종으로라우린제보다 작고 초록색임강하게 키우는 것이 좋음','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','오렌지색','어려움','0°C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(297,'에케베리아 ‘크리스마스’','images/plants/에케베리아 ‘크리스마스’.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','분홍색','보통','3°C','보통','발코니 창측 (실내깊이 0~50cm)'),(298,'에케베리아 ‘레이디스핑거’','images/plants/에케베리아 ‘레이디스핑거’.jpg','','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','분홍색','어려움','5°C','느림','발코니 창측 (실내깊이 0~50cm)'),(299,'에케베리아 ‘제이드포인트’','images/plants/에케베리아 ‘제이드포인트’.jpg','석연화속중 가장 큰 형태로 윤기나는 밀랍 잎들이로제트 형상(폭 20cm 까지 성장)을 가짐다육 마니아들에 잘 알려진 식물 종명의아가보이데스(agavoides)는 용설란과 아가베속다육들과 유사한 형상에서 유래','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','빨강색','보통','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(300,'핑크세도이데스','images/plants/핑크세도이데스.jpg','식물체의 지름이 3cm 정도이고 길쭉하고 통통한작은잎들이 군생하며 빛을 받는 정도에 따라붉게 물드는 정도가 다름','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','오렌지색','쉬움','5°C','빠름','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(301,'천장금','images/plants/천장금.jpg','성장은 그다지 빠르지 않으나 튼튼해 기르기 쉬움고온다습에 약하며, 통기성이 매우 원활한 용토에심지 않으면 뿌리가 쉽게 상함(높이) 10cm. 짧은 줄기 끝부분에 납작한 잎은 6~8개 정도 생기며, 작은 로제트형으로 자람잎은 곤봉모양으로 줄기에 붙어있는 부분이 가늘며길이 3~7cm, 굵기 1~1.5cm 정도. 잎은 녹색으로 적갈색의 점무늬 있음','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux)','','','','어려움','10~15 °C','느림','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(302,'노경','images/plants/녹영.jpg','1cm 지름의 구 모양의 잎이 덩굴상태의 가는줄기에 겹쳐지면서 아래로 늘어짐줄기는 가늘면서 25cm 정도 자람여름철에는 차광하고, 통풍이 잘되게 함','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','흰색','쉬움','5~10°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(303,'바위솔','images/plants/바위솔.jpg','작고 짧은 잎이 로제트를 이룸생육조건에 따라 여러 형태를 보임','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','0°C','보통','발코니 창측 (실내깊이 0~50cm)'),(304,'세데베리아 ‘팡파레’','images/plants/세데베리아 ‘팡파레’.jpg','교잡종이며, 길고 납작한 잎들이 촘촘히 로제트를 이루며 돌려남줄기는 목질화됨','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','어려움','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(305,'세데베리아 ‘레티지아’','images/plants/세데베리아 ‘레티지아’.jpg','군생이 잘 됨봄~가을 까지 옥외 재배가 가능함','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색, 분홍색','보통','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(306,'홍옥','images/plants/홍옥.jpg','줄기에 3cm 전후의 짧은 곤봉모양의 빨간 잎이 특징추위에 강함','토양 표면이 말랐을때 표면이 젖을 정도로만 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(307,'을녀심','images/plants/을녀심.jpg','둥근 잎은 햇빛이 좋으면 끝이 등홍색으로 선명해짐','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색','어려움','5°C','보통','발코니 창측 (실내깊이 0~50cm)'),(308,'옥주염','images/plants/옥주염.jpg','연한 백녹색인 장원형의 잎을 가지에 촘촘히 붙임자랄수록 머리 무게 때문에 줄기가 아래로 드리워처지는 모습이 Hanging 디자인에 적당함','토양 표면이 말랐을때 충분히 관수함','낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux)','','Y','연분홍색','보통','5°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(309,'황금세덤','images/plants/황금세덤.jpg','마주나는 잎이 촘촘하고 줄기가 길게 늘어지며 성장함','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','노랑색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(310,'환엽송록','images/plants/환엽송록.jpg','송록보다 잎이 통통하고 둥근 모습으로 런너를 형성함햇빛을 충분히 받으면 잎끝이 적갈색으로 물듦자구를 많이 만들며 자라고 잎에서 향기가 남','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','흰색','보통','5°C','빠름','발코니 창측 (실내깊이 0~50cm)'),(311,'세덤 \'리틀잼\'','images/plants/세덤 \'리틀잼\'.jpg','자구가 생성되어 군생으로 자람봄, 가을에 붉게 물듦','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','노랑색','어려움','3~5°C','느림','발코니 창측 (실내깊이 0~50cm)'),(312,'세덤 \'라울\'','images/plants/세덤 \'라울\'.jpg','키는 약 15cm 정도, 지제부에서 자구가 나옴잎은 녹색에 약간의 백분이 나오며 주걱처럼 둥근모양','토양 표면이 말랐을때 충분히 관수함','중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)','','Y','흰색','쉬움','5°C','보통','발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)'),(313,'청옥','images/plants/청옥.jpg','동글동글한 황록색의 잎이 다닥다닥 붙어 자람','토양 표면이 말랐을때 충분히 관수함','높은 광도(1,500~10,000 Lux)','','Y','빨강색','쉬움','5°C','빠름','발코니 창측 (실내깊이 0~50cm)');
/*!40000 ALTER TABLE `plant_plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comment_post_id_ddc2d815_fk_post_post_id` (`post_id`),
  KEY `post_comment_user_id_cbfe4e66_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `post_comment_post_id_ddc2d815_fk_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`id`),
  CONSTRAINT `post_comment_user_id_cbfe4e66_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (1,'댁=ㅅ','2022-04-06',6,5),(2,'2222','2022-04-06',9,5);
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_post`
--

DROP TABLE IF EXISTS `post_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `created_date` date NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_post_user_id_b9c97aef_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `post_post_user_id_b9c97aef_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_post`
--

LOCK TABLES `post_post` WRITE;
/*!40000 ALTER TABLE `post_post` DISABLE KEYS */;
INSERT INTO `post_post` VALUES (1,'1번제목','1번내용','','','2022-04-05',5),(2,'2번제목','2번내용','images/posts/영정.png','','2022-04-05',5),(3,'3번제목','3번내용','','','2022-04-05',5),(4,'이미지테스트','제발','images/posts/Board_bg.png','','2022-04-05',5),(6,'6번','테스트','images/posts/Board_bg.png','','2022-04-06',5),(7,'dasdadasd','asdasddasdasdasdad','images/posts/울산1_V6mDh7G.jpg','','2022-04-06',7),(8,'test','test','images/posts/아키텍처.png','','2022-04-06',2),(9,'test','test','','','2022-04-06',2),(10,'test','test','','','2022-04-06',2),(11,'test','test','','','2022-04-06',2),(12,'test','test','images/posts/아키텍처.png','','2022-04-06',2),(13,'test2','test2','images/posts/아키텍처.png','','2022-04-06',2),(14,'test','test','images/posts/아키텍처.png','','2022-04-06',2),(15,'test2','test2','images/posts/아키텍처.png','','2022-04-07',2),(16,'test2','test2','images/posts/아키텍처_rHMEwjO.png','','2022-04-07',2);
/*!40000 ALTER TABLE `post_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_buy`
--

DROP TABLE IF EXISTS `product_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_buy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_buy_product_id_b8c1cd70_fk_product_product_id` (`product_id`),
  KEY `product_buy_user_id_4ec6caa3_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `product_buy_product_id_b8c1cd70_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_buy_user_id_4ec6caa3_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_buy`
--

LOCK TABLES `product_buy` WRITE;
/*!40000 ALTER TABLE `product_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int DEFAULT NULL,
  `num` int DEFAULT NULL,
  `open_date` date NOT NULL,
  `close_date` date NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `plant_id` bigint DEFAULT NULL,
  `store_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_plant_id_7f18f7fa_fk_plant_plant_id` (`plant_id`),
  KEY `product_product_store_id_aab9a80a_fk_store_store_id` (`store_id`),
  CONSTRAINT `product_product_plant_id_7f18f7fa_fk_plant_plant_id` FOREIGN KEY (`plant_id`) REFERENCES `plant_plant` (`id`),
  CONSTRAINT `product_product_store_id_aab9a80a_fk_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `store_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'상품테스',0,0,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,3),(2,'상품테스트2222',0,0,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,3),(3,'3333333',0,0,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,3),(4,'55555',20000,20,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',2,3),(5,'44444',24000,25,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',3,3),(6,'66',24000,25,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,3),(7,'77',24000,25,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,3),(8,'테스트테스트상품4',24000,25,'2022-04-06','2022-04-08','','상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명 상품 관련 상세 설명','',1,1),(9,'q',123,11,'2022-04-06','2022-04-06','','qq','',1,3),(10,'qwer',111,123,'2022-04-06','2022-04-06','','qwe','',1,3),(11,'qwer',111,123,'2022-04-06','2022-04-07','','qwe','',1,3),(12,'qwer',111,123,'2022-04-08','2022-04-15','','qwe','',1,3),(13,'관음죽',12300,123,'2022-04-06','2022-04-13','','관음죽 상품 테스트','images/products/검은화면.jpg',NULL,NULL),(14,'관음죽 테스트 22',22200,222,'2022-04-19','2022-04-21','','관음죽 등록 테스트 2222','images/products/검은화면_QuLGgkI.jpg',6,3);
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `context` varchar(50) NOT NULL,
  `star` int DEFAULT NULL,
  `created_date` date NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_product_id_428b0c5c_fk_product_product_id` (`product_id`),
  KEY `product_review_user_id_101f565f_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `product_review_product_id_428b0c5c_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_review_user_id_101f565f_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
INSERT INTO `product_review` VALUES (1,'제목없음','굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿굿',4,'2022-04-06',2,9),(2,'제목없음','31231',5,'2022-04-06',1,1),(3,'제목없음','133123',5,'2022-04-06',2,1),(4,'제목없음','asdasd',5,'2022-04-06',2,9);
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_wishlist`
--

DROP TABLE IF EXISTS `product_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_wishlist_product_id_b03db3f1_fk_product_product_id` (`product_id`),
  KEY `product_wishlist_user_id_8e563a6f_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `product_wishlist_product_id_b03db3f1_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_wishlist_user_id_8e563a6f_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_wishlist`
--

LOCK TABLES `product_wishlist` WRITE;
/*!40000 ALTER TABLE `product_wishlist` DISABLE KEYS */;
INSERT INTO `product_wishlist` VALUES (1,14,1),(2,14,9);
/*!40000 ALTER TABLE `product_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_store`
--

DROP TABLE IF EXISTS `store_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `store_store_user_id_b5ebe390_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'나나','',7),(3,'스토어 테스트22','images/stores/검은화면_HNpol6G.jpg',9);
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_accounts_` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU0MTY4NiwiaWF0IjoxNjQ5MTIyNDg2LCJqdGkiOiIzYjEwYmIwYjNiNjY0OGQwYWMzNjE1ZDJhMzM1ZDdkMyIsInVzZXJfaWQiOjJ9.m1H5sUmB3mfIopKPeLViVqTld9u3XYhmHx3Gq9VM8ug','2022-04-05 01:34:46.585268','2022-05-03 01:34:46.000000',2,'3b10bb0b3b6648d0ac3615d2a335d7d3'),(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU0MjAzNCwiaWF0IjoxNjQ5MTIyODM0LCJqdGkiOiI2MWEyNjRhMWFkNzE0YzYwYmYyNDk1OTU2YjgzYTA4MCIsInVzZXJfaWQiOjJ9.orpwp_JQfQYrSY4CJzcqVT52ACYl8WHK4KuByE4cqbQ','2022-04-05 01:40:34.037506','2022-05-03 01:40:34.000000',2,'61a264a1ad714c60bf2495956b83a080'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2MDY0MCwiaWF0IjoxNjQ5MTQxNDQwLCJqdGkiOiJkNDIxMjE5OTA2MmY0YWU3YTVmNjI0M2U4MTdiNzA5OCIsInVzZXJfaWQiOjV9.WhoChTlV5t12gNAYivmtsaKHsBOGUrTd5ku-JK-k-E4','2022-04-05 06:50:40.873304','2022-05-03 06:50:40.000000',5,'d4212199062f4ae7a5f6243e817b7098'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2MDY1NiwiaWF0IjoxNjQ5MTQxNDU2LCJqdGkiOiI1Mzg0NDQxMTA4NGY0OTI4YmQ1MmQ4ZmY4MjhjNDVjYiIsInVzZXJfaWQiOjV9.Tu3vOcShRFLJAa_bT9w3KxiSL358jUWfZ_Os1e6A2dg','2022-04-05 06:50:56.548822','2022-05-03 06:50:56.000000',5,'53844411084f4928bd52d8ff828c45cb'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2Njk0NCwiaWF0IjoxNjQ5MTQ3NzQ0LCJqdGkiOiI5OGZjZWYyZWNjMDU0YjFhODczM2JmZDI3NDkzOGYwMyIsInVzZXJfaWQiOjd9.ccQH8j4M3AQXaskp5VopnCXtOr3_AkJsxBa6nbEvWuE','2022-04-05 08:35:44.422198','2022-05-03 08:35:44.000000',7,'98fcef2ecc054b1a8733bfd274938f03'),(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2NzA3OCwiaWF0IjoxNjQ5MTQ3ODc4LCJqdGkiOiJmZDUwMzFjZTkwNzg0YTkyODVkYTJlMDBlYTI3ODY4ZCIsInVzZXJfaWQiOjd9.eD-H5BaJID3JRzFcn2sBNEKwSOQwPKLX8hsVTKkyEgQ','2022-04-05 08:37:58.820479','2022-05-03 08:37:58.000000',7,'fd5031ce90784a9285da2e00ea27868d'),(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2NzE5NywiaWF0IjoxNjQ5MTQ3OTk3LCJqdGkiOiIxMzY2ODEwOTliNzY0NmRjYjIyOWIyNjA1MDAwZTEyYSIsInVzZXJfaWQiOjh9._lVQ_IuV1ofqza6DJiqc9CpgHVfSuFQlcjSSynEEtlk','2022-04-05 08:39:57.854360','2022-05-03 08:39:57.000000',8,'136681099b7646dcb229b2605000e12a'),(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2NzIxNiwiaWF0IjoxNjQ5MTQ4MDE2LCJqdGkiOiI5Zjg2ZWYxOWM0YjM0OTJlYjFhNTNhNDg5NDQ1MDRmNyIsInVzZXJfaWQiOjh9.UaYnwOmI9SKFBcC5sGF0UBkBEonAVO7aTxILirUs2-k','2022-04-05 08:40:16.244221','2022-05-03 08:40:16.000000',8,'9f86ef19c4b3492eb1a53a48944504f7'),(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTU2NzI3MSwiaWF0IjoxNjQ5MTQ4MDcxLCJqdGkiOiI2MDZjMjZjYWNjZWY0ZTQ0YTU1MDlhMmJkYTBkMGU2ZSIsInVzZXJfaWQiOjh9.8-odM98OJBzWcaSsqx9Vcm926DmLkg-ubM1tz5_fAK8','2022-04-05 08:41:11.459969','2022-05-03 08:41:11.000000',8,'606c26caccef4e44a5509a2bda0d0e6e'),(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYyODQyMiwiaWF0IjoxNjQ5MjA5MjIyLCJqdGkiOiJhMjEwODFjZGVlNDk0MTU2OGIzYjZkOWFiNDhkYjliOCIsInVzZXJfaWQiOjd9.uONbUQrxhWfYtK1uuekaOZv3JyDDuJipbbjd9btZ--U','2022-04-06 01:40:22.602064','2022-05-04 01:40:22.000000',7,'a21081cdee4941568b3b6d9ab48db9b8'),(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYyOTY5OCwiaWF0IjoxNjQ5MjEwNDk4LCJqdGkiOiIwYjExMTM4ZGYxN2Y0ZTVhYTJjMDM1YzI4ZDFiZWUyYiIsInVzZXJfaWQiOjd9.EDZITJZQIFoid4GiuxAJR8bAsQhRoKL6T11q7MgRQNc','2022-04-06 02:01:38.763602','2022-05-04 02:01:38.000000',7,'0b11138df17f4e5aa2c035c28d1bee2b'),(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYyOTc3OSwiaWF0IjoxNjQ5MjEwNTc5LCJqdGkiOiI0OTJmNTJmNTg4MzI0MDAzYTdlZjQ4YzZhNGVhMzRjYyIsInVzZXJfaWQiOjh9.2sTN_7VvzQGpjhzmv3p5h_seuKxgqDiOV9AukqK_PGY','2022-04-06 02:02:59.788818','2022-05-04 02:02:59.000000',8,'492f52f588324003a7ef48c6a4ea34cc'),(13,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYzMTQ2MiwiaWF0IjoxNjQ5MjEyMjYyLCJqdGkiOiI1ODUwZjYyYzIwZTc0Zjc4YTE5NGJlN2YwZDI2YmFiZiIsInVzZXJfaWQiOjl9.F-twFsCXvntgF28P7Y1B1w5ImS-ypTeNMuP4wYwAJwM','2022-04-06 02:31:02.028908','2022-05-04 02:31:02.000000',9,'5850f62c20e74f78a194be7f0d26babf'),(14,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYzMTQ3MCwiaWF0IjoxNjQ5MjEyMjcwLCJqdGkiOiI1ZjZjYjVmYTAyYmQ0ZDY1YmZmNTEyYzY0Mzk0OWVkZiIsInVzZXJfaWQiOjl9.1awJZlkleFHk9BUOc6PpOy7RoPL0Fjz9YRkC5OFrIiI','2022-04-06 02:31:10.354261','2022-05-04 02:31:10.000000',9,'5f6cb5fa02bd4d65bff512c643949edf'),(15,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYzODE1NSwiaWF0IjoxNjQ5MjE4OTU1LCJqdGkiOiJhZjg1NzA0NjIyYzQ0YWI3OTBkN2VlMjY4NTIyZGY2NyIsInVzZXJfaWQiOjEwfQ.eSSSBVRp9BvXP6oXq5wAeZdJk2HHIT1SVRSI8KvZAx0','2022-04-06 04:22:35.786014','2022-05-04 04:22:35.000000',10,'af85704622c44ab790d7ee268522df67'),(16,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYzODE2MiwiaWF0IjoxNjQ5MjE4OTYyLCJqdGkiOiIzM2QyNDA5OGI3ZTM0MDRhODJkOWM4YzZjOTRhMzVkYyIsInVzZXJfaWQiOjEwfQ.GNc-a5DKQ13hZ6cIFkyx4FnKLJtLy2_UNuPu6gn7kdY','2022-04-06 04:22:42.224720','2022-05-04 04:22:42.000000',10,'33d24098b7e3404a82d9c8c6c94a35dc'),(17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTYzOTMzNywiaWF0IjoxNjQ5MjIwMTM3LCJqdGkiOiJjMTAxMzYzY2NlZWI0NWE5OGI3ZTE4Njc2NDA3YWJmZSIsInVzZXJfaWQiOjl9.Ee1Tpit-ixPKMWKxi3ndqwV7-M-nPRI-55ceZxkjTzY','2022-04-06 04:42:17.238606','2022-05-04 04:42:17.000000',9,'c101363cceeb45a98b7e18676407abfe'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY0MDgzNCwiaWF0IjoxNjQ5MjIxNjM0LCJqdGkiOiIzZjliMzg4N2E0YzE0ZGE1YjIyOGQxMmMxNjQ0M2IxZCIsInVzZXJfaWQiOjl9.PQDo4xQe4WgzzPDcf8ohLTcAaYQT5wLNCAfUmtHOFjg','2022-04-06 05:07:14.865611','2022-05-04 05:07:14.000000',9,'3f9b3887a4c14da5b228d12c16443b1d'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY0OTI4NCwiaWF0IjoxNjQ5MjMwMDg0LCJqdGkiOiI3Y2U0OTRmYzdiNWQ0ODA1OWU5ZDAxNTgxODAwMjlkMiIsInVzZXJfaWQiOjh9.ytZ4E6lX-k0J0ZIejmAou6QYTzmfavS8pcgq6LnhBWQ','2022-04-06 07:28:04.090245','2022-05-04 07:28:04.000000',8,'7ce494fc7b5d48059e9d0158180029d2'),(20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY0OTI5MywiaWF0IjoxNjQ5MjMwMDkzLCJqdGkiOiIzNDQ2N2Q4YjIxYjQ0ZTAwOGMwMzBiMWMzOTc2ZDk0MyIsInVzZXJfaWQiOjh9.jmEuHyXlXPxp02CPghcNUZpW_igXsA2fNDFg1qonVXc','2022-04-06 07:28:13.788625','2022-05-04 07:28:13.000000',8,'34467d8b21b44e008c030b1c3976d943'),(21,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1MTEwMywiaWF0IjoxNjQ5MjMxOTAzLCJqdGkiOiJkNjc4ZGRjMTIxNmM0MWFhOWEyMDc3ODJkMTUxODI4NCIsInVzZXJfaWQiOjV9.xpAGFXJcSNmka7trw8bJ1JYpd6XQrV9fpbceKHDgoCM','2022-04-06 07:58:23.220726','2022-05-04 07:58:23.000000',5,'d678ddc1216c41aa9a207782d1518284'),(22,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1MTExOCwiaWF0IjoxNjQ5MjMxOTE4LCJqdGkiOiI3Y2MxNTI2MjExNzI0NGE1OWQ3MGM2YWE1YzI0ZWNhNSIsInVzZXJfaWQiOjV9._1pOZwgQyujOQ5bneQXn6Hgu9iG9aXZxrdcF5ewnm7c','2022-04-06 07:58:38.578419','2022-05-04 07:58:38.000000',5,'7cc15262117244a59d70c6aa5c24eca5'),(23,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1NTU5MywiaWF0IjoxNjQ5MjM2MzkzLCJqdGkiOiJiMjVlOWM1MTg0N2I0NDAzOGExMDM4MTU1YWQyYWI3NSIsInVzZXJfaWQiOjl9.VI0dEW8WN_67FbeDS4W7BsW4LeLJlUE67sUHUM41SJg','2022-04-06 09:13:13.756637','2022-05-04 09:13:13.000000',9,'b25e9c51847b44038a1038155ad2ab75'),(24,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1NjA3MiwiaWF0IjoxNjQ5MjM2ODcyLCJqdGkiOiJiNDE5MzYxYjIxODA0NzAyYjEzMzVlN2U5Y2JjYjMyMyIsInVzZXJfaWQiOjh9.k-GMv0jjBnG8Fy4II3Y8iRyQyNiL-d8W-QNkyMUHT8E','2022-04-06 09:21:12.378379','2022-05-04 09:21:12.000000',8,'b419361b21804702b1335e7e9cbcb323'),(25,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1NjA4OCwiaWF0IjoxNjQ5MjM2ODg4LCJqdGkiOiJmODRlNjZmMjEzODY0YTllODc4ZDFmOTQ1YTI5YzlkMSIsInVzZXJfaWQiOjh9.YtqkyRoNpLhpW10_VMfa57ng7odSGIcdXj0b3mcmyak','2022-04-06 09:21:28.311084','2022-05-04 09:21:28.000000',8,'f84e66f213864a9e878d1f945a29c9d1'),(26,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY1NjE0MiwiaWF0IjoxNjQ5MjM2OTQyLCJqdGkiOiIxNTMwOWE2NzkyZTQ0MmRiODQzM2ZmZGIyN2ZlZWZiYyIsInVzZXJfaWQiOjJ9.KX8LuGEIDyBxfKuR1FPEO84Ba5g0UGrM_S2bCU_KDAo','2022-04-06 09:22:22.105992','2022-05-04 09:22:22.000000',2,'15309a6792e442db8433ffdb27feefbc'),(27,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY2MTE4NSwiaWF0IjoxNjQ5MjQxOTg1LCJqdGkiOiI0NzY2NDIzNjU5ZGU0ZjQ1YjQ3NGY0YTJlMGU1MGI2MCIsInVzZXJfaWQiOjd9.FN0LlKluKUKGa3m2SMob8eMEBKdFQSiEaxCf0E6pOSs','2022-04-06 10:46:25.556584','2022-05-04 10:46:25.000000',7,'4766423659de4f45b474f4a2e0e50b60'),(28,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY2OTQ1NSwiaWF0IjoxNjQ5MjUwMjU1LCJqdGkiOiI0NzVlZmNiMzZhYTI0ODAyOTRiNjAwMGU5MWM5YzE5ZCIsInVzZXJfaWQiOjV9.2ScmGhuCMQRWKyCPR_n2VJhN4iyyUqgp54MdQCjbMoo','2022-04-06 13:04:15.993525','2022-05-04 13:04:15.000000',5,'475efcb36aa2480294b6000e91c9c19d'),(29,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NDMyMCwiaWF0IjoxNjQ5MjU1MTIwLCJqdGkiOiI2YTkwNjU3ZTE5NmU0MzM0OWU4MjkyYjI1OGM4ZjQ5NCIsInVzZXJfaWQiOjl9.bOZc4QFM_QtJQdReYidCiJE3VesnUptwWjRzn7z13dA','2022-04-06 14:25:20.950895','2022-05-04 14:25:20.000000',9,'6a90657e196e43349e8292b258c8f494'),(30,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NDM2NCwiaWF0IjoxNjQ5MjU1MTY0LCJqdGkiOiJhM2JiMjhlZGQ4NGY0NjM3ODdmYjg2ZGRjNDM0ZThhZCIsInVzZXJfaWQiOjExfQ.OfD-rl1pTS0KsRXziyb0QOiePrktyP82j2hW8grn46s','2022-04-06 14:26:04.053219','2022-05-04 14:26:04.000000',11,'a3bb28edd84f463787fb86ddc434e8ad'),(31,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NDM2OCwiaWF0IjoxNjQ5MjU1MTY4LCJqdGkiOiIyNGJkMThkNzExMTE0ZDU3ODM2NTBlNGRlMDAxYWYzOSIsInVzZXJfaWQiOjExfQ.hcDzUfGhNl-ibm9NIZgO9ysNjQmlloz-sMN8sqGRBCg','2022-04-06 14:26:08.429615','2022-05-04 14:26:08.000000',11,'24bd18d711114d5783650e4de001af39'),(32,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NDM5MiwiaWF0IjoxNjQ5MjU1MTkyLCJqdGkiOiI5NmM2YjAwMjJkOTc0YWMyYTQ1ODQyYzM1NDIzZjU1NiIsInVzZXJfaWQiOjl9.LhSnHS1gdMqnpKyTqn6LXoVgO_52jzogC00_SZzWHgM','2022-04-06 14:26:32.285137','2022-05-04 14:26:32.000000',9,'96c6b0022d974ac2a45842c35423f556'),(33,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NDczNSwiaWF0IjoxNjQ5MjU1NTM1LCJqdGkiOiI4YjdkMTg5YzI4ZDI0OWI5YmI3YTI5MWNmMmQ3OWVjNSIsInVzZXJfaWQiOjl9.SZ4mUhI8fkXyG-XV7TzLBI9HgMCRKJ0wzarDrGNEsr0','2022-04-06 14:32:15.980188','2022-05-04 14:32:15.000000',9,'8b7d189c28d249b9bb7a291cf2d79ec5'),(34,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NTE4NSwiaWF0IjoxNjQ5MjU1OTg1LCJqdGkiOiI1OTg3NjQxNjRmYzA0ZmFhOWRjYzhkMDQzZmE4ZjlmOCIsInVzZXJfaWQiOjl9.aQdFGNiYROB-VBw6l4cUUFgeuh1n3kMIlRd60oxByls','2022-04-06 14:39:45.847524','2022-05-04 14:39:45.000000',9,'598764164fc04faa9dcc8d043fa8f9f8'),(35,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NTI0OSwiaWF0IjoxNjQ5MjU2MDQ5LCJqdGkiOiI5NmQ3MjNiZGU4MTE0OTQ1Yjc1ZDI2ZDc4M2Q5M2YzZiIsInVzZXJfaWQiOjExfQ.MZlMFCBad7S0mzpx8W23XuNgYPJmauZ7mSIeyBWUSYk','2022-04-06 14:40:49.339987','2022-05-04 14:40:49.000000',11,'96d723bde8114945b75d26d783d93f3f'),(36,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NTYyMiwiaWF0IjoxNjQ5MjU2NDIyLCJqdGkiOiI3NmY5NWRhYmQzNWI0ZmYyYWZkMzAxZDU0MjNhNWEyNyIsInVzZXJfaWQiOjEyfQ.D1BatpveqNAcpIEesKfj9g6FUFx25AtfCneU84BqPno','2022-04-06 14:47:02.353479','2022-05-04 14:47:02.000000',12,'76f95dabd35b4ff2afd301d5423a5a27'),(37,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NTYyOSwiaWF0IjoxNjQ5MjU2NDI5LCJqdGkiOiJhYmZiZWY3OWNhYWI0MTI2Yjc0YjdkNmY0NjJiZjU3OCIsInVzZXJfaWQiOjEyfQ.td1qQcIgDt1EGcziwxurSfBxCxgiyHrJTxQKMtJGvCM','2022-04-06 14:47:09.436614','2022-05-04 14:47:09.000000',12,'abfbef79caab4126b74b7d6f462bf578'),(38,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTY3NTY1NCwiaWF0IjoxNjQ5MjU2NDU0LCJqdGkiOiI4ZDg1YzY5MTc0Mzk0NGQzOTMyNzRlZGIwYjY3OTMwOCIsInVzZXJfaWQiOjl9.GlkbSKakHdN9U8rZOWBcj2AtUEUwAcGD4l8DrvdClgE','2022-04-06 14:47:34.444866','2022-05-04 14:47:34.000000',9,'8d85c691743944d393274edb0b679308'),(39,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTcxMzA2MCwiaWF0IjoxNjQ5MjkzODYwLCJqdGkiOiIxMTViZjU1NzExYTc0ODM3ODU5MWQ0MWQ4YmMzM2JlNSIsInVzZXJfaWQiOjl9.VJc_4irYvXnT3Mo8TDwkTmqzaZxDB5JJmKGYKMRttDg','2022-04-07 01:11:00.304435','2022-05-05 01:11:00.000000',9,'115bf55711a748378591d41d8bc33be5'),(40,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTcxMzI4NiwiaWF0IjoxNjQ5Mjk0MDg2LCJqdGkiOiIwNjQ1NzA5ZGUwMGE0NWFjOWIyMmYyNDJlMDExNmM0NiIsInVzZXJfaWQiOjEwfQ.LMRzjun6INVzYv5Z_rB8UqEEw15TASo89XSmGFpO3_U','2022-04-07 01:14:46.615153','2022-05-05 01:14:46.000000',10,'0645709de00a45ac9b22f242e0116c46'),(41,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTcxMzM4NSwiaWF0IjoxNjQ5Mjk0MTg1LCJqdGkiOiI1MjA2MGY5M2VmMmY0ODRmYmYxNDE2Y2JlMWRlMDE3YSIsInVzZXJfaWQiOjd9.D0mQl9jBWAvvRBSedtYV3JjnX9Z_Z7MNa73PqceA0Wc','2022-04-07 01:16:25.767258','2022-05-05 01:16:25.000000',7,'52060f93ef2f484fbf1416cbe1de017a'),(42,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MTcxMzg0MiwiaWF0IjoxNjQ5Mjk0NjQyLCJqdGkiOiIzMzVhYzVmMTgyYWY0ZDcyYjdmZmZkN2U2ZTM2ZjEyNiIsInVzZXJfaWQiOjl9.bBatfF-dGLW81OBUSzSqDJH1dKQSZf3fZCM5sFL1nMo','2022-04-07 01:24:02.024004','2022-05-05 01:24:02.000000',9,'335ac5f182af4d72b7fffd7e6e36f126');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07 11:06:04
