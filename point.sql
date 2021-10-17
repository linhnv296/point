-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: point-db
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborators_users`
--

DROP TABLE IF EXISTS `collaborators_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaborators_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `user_course` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_collaborator` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborators_users`
--

LOCK TABLES `collaborators_users` WRITE;
/*!40000 ALTER TABLE `collaborators_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `collaborators_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'image/default.png',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_start` datetime NOT NULL,
  `day_finish` datetime NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'{}',1),(2,1,'name','text','Name',1,1,1,1,1,1,'{}',2),(3,1,'email','text','Email',1,1,1,1,1,1,'{}',3),(4,1,'password','password','Password',1,0,0,1,1,0,'{}',4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'{}',5),(6,1,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(8,1,'avatar','image','Avatar',0,0,1,1,1,1,'{}',8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(10,1,'user_belongstomany_role_relationship','relationship','voyager::seeders.data_rows.roles',0,0,0,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,'{}',12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',0,1,1,1,1,1,'{}',9),(22,1,'email_verified_at','timestamp','Email Verified At',0,0,0,0,0,1,'{}',6),(23,1,'phone','text','Phone',0,0,1,1,1,1,'{}',12),(24,1,'sex','text','Sex',0,0,1,1,1,1,'{}',13),(25,1,'date_of_birth','text','Date Of Birth',0,0,1,1,1,1,'{}',14),(26,1,'facebook','text','Facebook',0,0,1,1,1,1,'{}',15),(27,1,'province','text','Province',0,0,1,1,1,1,'{}',16),(28,1,'education','text','Education',0,0,1,1,1,1,'{}',17),(29,1,'job','text','Job',0,0,1,1,1,1,'{}',18),(30,1,'target','text','Target',0,0,1,1,1,1,'{}',19),(31,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,4,'type','select_dropdown','Type',1,1,1,1,1,1,'{\"default\":\"Du h\\u1ecdc sinh\",\"options\":{\"Du h\\u1ecdc sinh\":\"Du h\\u1ecdc sinh\",\"Xu\\u1ea5t kh\\u1ea9u lao \\u0111\\u1ed9ng\":\"Xu\\u1ea5t kh\\u1ea9u lao \\u0111\\u1ed9ng\"}}',2),(33,4,'region','text','Region',1,1,1,1,1,1,'{}',3),(34,4,'point','text','Point',1,1,1,1,1,1,'{}',4),(35,4,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',5),(36,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(37,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(38,9,'user_id','text','User Id',1,1,1,1,1,1,'{}',3),(39,9,'user_course','text','User Khóa học',1,1,1,1,1,1,'{}',4),(40,9,'level','text','Loại tài khoản',1,1,1,1,1,1,'{}',5),(41,9,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',6),(42,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(43,9,'collaborators_user_belongsto_user_relationship','relationship','CTV',0,1,1,1,1,1,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cache\",\"pivot\":\"0\",\"taggable\":\"0\"}',2),(44,9,'is_collaborator','text','Tài khoản CTV',0,1,1,1,1,1,'{}',7),(45,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(46,10,'name','text','Tên',1,1,1,1,1,1,'{}',2),(47,10,'description','text_area','Mô tả',1,1,1,1,1,1,'{}',3),(48,10,'day_start','date','Ngày bắt đầu',1,1,1,1,1,1,'{}',4),(49,10,'day_finish','date','Ngày kết thúc',1,1,1,1,1,1,'{}',5),(50,10,'point','number','Point',1,1,1,1,1,1,'{}',6),(51,10,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',7),(52,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(53,10,'image','image','Ảnh',0,1,1,1,1,1,'{}',3),(54,1,'point','text','Point',1,1,1,1,1,1,'{}',20),(55,1,'course','text','Course',0,0,1,1,1,1,'{}',21),(56,11,'id','number','ID',1,0,0,0,0,0,'\"\"',1),(57,11,'author_id','text','Author ID',1,0,0,0,0,0,'\"\"',2),(58,11,'title','text','Title',1,1,1,1,1,1,'\"\"',3),(59,11,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'\"\"',4),(60,11,'body','rich_text_box','Body',1,0,1,1,1,1,'\"\"',5),(61,11,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(62,11,'meta_description','text','Meta Description',0,0,1,1,1,1,'\"\"',7),(63,11,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',8),(64,11,'created_at','timestamp','Created At',1,1,1,0,0,0,'\"\"',9),(65,11,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'\"\"',10),(66,11,'image','image','Image',0,1,1,1,1,1,'\"\"',11),(67,1,'fullname','text','Fullname',0,1,1,1,1,1,'{}',22);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2021-09-26 12:35:50','2021-10-10 01:21:32'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(4,'points','points','Point','Points','voyager-trophy','App\\Models\\Point',NULL,'App\\Http\\Controllers\\PointController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-09-26 12:50:02','2021-10-07 15:41:27'),(9,'collaborators_users','collaborators-users','Cộng tác viên','Cộng tác viên','voyager-people','App\\Models\\CollaboratorsUser',NULL,'App\\Http\\Controllers\\CollaboratorsUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-09-26 12:55:09','2021-10-07 15:41:08'),(10,'coupons','coupons','Coupon','Coupons',NULL,'App\\Models\\Coupon',NULL,'App\\Http\\Controllers\\CouponController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-10-07 07:04:44','2021-10-07 15:30:03'),(11,'pages','pages','Page','Pages','voyager-file-text','Pvtl\\VoyagerPages\\Page',NULL,'\\Pvtl\\VoyagerPages\\Http\\Controllers\\PageController','',1,0,NULL,'2021-10-08 04:37:04','2021-10-08 04:37:04');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2021-09-26 12:35:50','2021-09-26 12:35:50','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,7,'2021-09-26 12:35:50','2021-10-07 14:46:25','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2021-09-26 12:35:50','2021-09-26 12:35:50','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2021-09-26 12:35:50','2021-09-26 12:35:50','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,8,'2021-09-26 12:35:50','2021-10-07 14:46:25',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2021-09-26 12:35:50','2021-09-26 12:56:46','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2021-09-26 12:35:50','2021-09-26 12:56:46','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2021-09-26 12:35:50','2021-09-26 12:56:46','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2021-09-26 12:35:50','2021-09-26 12:56:46','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,9,'2021-09-26 12:35:50','2021-10-07 14:46:25','voyager.settings.index',NULL),(11,1,'Points','','_self','voyager-trophy',NULL,NULL,4,'2021-09-26 12:50:03','2021-09-26 12:56:46','voyager.points.index',NULL),(12,1,'Cộng tác viên','','_self','voyager-people','#000000',NULL,6,'2021-09-26 12:55:09','2021-10-07 14:46:25','voyager.collaborators-users.index','null'),(13,1,'Coupons','','_self','voyager-trophy','#000000',NULL,5,'2021-10-07 07:04:44','2021-10-07 14:46:25','voyager.coupons.index','null'),(14,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2021-10-08 04:37:05','2021-10-08 04:37:05','voyager.pages.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2021-09-26 12:35:50','2021-09-26 12:35:50');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2018_04_18_000000_create_pages_table',1),(24,'2018_05_11_000001_remove_pages_keywords_field',1),(25,'2019_08_19_000000_create_failed_jobs_table',1),(26,'2019_12_14_000001_create_personal_access_tokens_table',2),(27,'2021_09_25_163510_create_points_table',3),(28,'2021_09_25_163534_create_user_points_table',3),(29,'2021_09_25_163606_update_users_table',3),(30,'2021_09_25_164306_create_collaborators_users_table',3),(31,'2021_09_26_123444_create_cache_table',3),(32,'2021_09_30_144834_is_collaborators_to_collaborators_table',3),(33,'2021_10_05_095816_add_column_poin_table_users',3),(34,'2021_10_07_064530_create_table_coupons',3),(35,'2021_10_07_064630_create_table_user_coupons',3),(36,'2021_10_07_145007_update_coupons_table',3),(37,'2021_10_09_033424_add_full_name_users_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,'About','This is the excerpt for the Lorem Ipsum Page','<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Viết b&agrave;i giới thiệu c&ocirc;ng ty</strong>&nbsp;</em>cần viết theo một tổ chức r&otilde; r&agrave;ng để gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng nắm bắt c&aacute;c th&ocirc;ng tin về doanh nghiệp của bạn. Sau đ&acirc;y, Boseda xin chia sẻ với c&aacute;c bạn c&aacute;ch l&ecirc;n bố cục cho<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;th&ocirc;ng qua ph&acirc;n t&iacute;ch một<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</em></strong>&nbsp;mẫu do Boseda thực hiện.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">B&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;n&ecirc;n mở đầu bằng một đoạn giới thiệu chung về doanh nghiệp. This head open to be reply the question: C&ocirc;ng ty bạn c&oacute; t&ecirc;n đầy đủ l&agrave; g&igrave;? viết tắt l&agrave; g&igrave;? hoạt động trong lĩnh vực g&igrave;? C&oacute; những ch&iacute;nh dịch vụ n&agrave;o? Ngo&agrave;i ra, bạn c&oacute; thể th&ecirc;m phụ lục th&ocirc;ng tin như tại sao c&ocirc;ng ty c&oacute; t&ecirc;n gọi như vậy hoặc logo c&ocirc;ng ty c&oacute; biểu tượng g&igrave;, &hellip;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Để bạn dễ hiểu hơn, ch&uacute;ng t&ocirc;i xin đưa ra một v&iacute; dụ về đoạn mở đầu trong&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</strong></em>&nbsp;m&agrave; Boseda đ&atilde; viết như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;C&ocirc;ng ty Cổ phần Ph&aacute;t triển &Aacute;nh Dương Vina l&agrave; một c&ocirc;ng ty chuy&ecirc;n cung cấp chuỗi dịch vụ tổng hợp cho nh&agrave; m&aacute;y Samsung Bắc Ninh v&agrave; c&aacute;c nh&agrave; m&aacute;y Vendor của Samsung.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><img class=\"n3VNCb aligncenter\" style=\"box-sizing: border-box; margin: 0px auto; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word; height: auto; max-width: 100%; backface-visibility: hidden; transition: all 200ms ease-in-out 0s; clear: both; display: block; text-align: center;\" src=\"http://boseda.com.vn/wp-content/uploads/2021/06/huong-dan-viet-bai-gioi-thieu-cong-ty-13-1.jpg\" alt=\"Hướng dẫn viết b&agrave;i PR giới thiệu doanh nghiệp, c&ocirc;ng ty từ A-Z\" data-noaft=\"1\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong bối cảnh ph&aacute;t triển ng&agrave;y c&agrave;ng lớn mạnh của Samsung v&agrave; c&aacute;c Vendor, nhu cầu li&ecirc;n kết với c&aacute;c đối t&aacute;c cung cấp dịch vụ của nh&agrave; m&aacute;y Samsung l&agrave; rất lớn v&agrave; rất đa dạng. Trong khi đ&oacute;, c&aacute;c c&ocirc;ng ty hiện tại chỉ cung cấp một mảng dịch vụ nhất định g&acirc;y kh&oacute; khăn cho c&ocirc;ng t&aacute;c quản l&yacute; tổng thể của kh&aacute;ch h&agrave;ng. V&igrave; vậy, ch&uacute;ng t&ocirc;i, một đội ngũ l&atilde;nh đạo thuộc c&aacute;c c&ocirc;ng ty cung cấp c&aacute;c dịch vụ kh&aacute;c nhau đ&atilde; li&ecirc;n minh lại v&agrave; đồng s&aacute;ng lập ra &Aacute;nh Dương Vina nhằm cung cấp tổng hợp c&aacute;c dịch vụ.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đến với &Aacute;nh Dương Vina, kh&aacute;ch h&agrave;ng sẽ tiết kiệm được thời gian v&agrave; dễ d&agrave;ng quản l&yacute; t&agrave;i ch&iacute;nh, chất lượng, ti&ecirc;u chuẩn sản phẩm theo một hệ thống bởi ch&uacute;ng t&ocirc;i cung cấp đầy đủ c&aacute;c dịch vụ như: (1) Cung ứng nh&acirc;n lực, (2) Dịch vụ bảo vệ, (3) Dịch vụ n&acirc;ng cẩu h&agrave;ng h&oacute;a, (4) Dịch vụ vận tải, (5) Thi c&ocirc;ng lắp đặt hệ thống điện; (6) Thi c&ocirc;ng lắp đặt kết cấu, (7) Thiết kế, lắp đặt v&agrave; cung cấp vật tư, thiết bị ph&ograve;ng sạch, (8) Cung cấp sắt, th&eacute;p v&agrave; c&aacute;c loại vật dụng x&acirc;y dựng,&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Với số vốn điều lệ 10 tỷ đồng c&ugrave;ng đội ngũ nh&acirc;n sự nhanh nhạy, c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n v&agrave; bề d&agrave;y kinh nghiệm tr&ecirc;n thị trường, &Aacute;nh Dương Vina đ&atilde; l&agrave;m h&agrave;i l&ograve;ng c&aacute;c kh&aacute;ch h&agrave;ng, đối t&aacute;c trong v&agrave; ngo&agrave;i nước.&rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Phần tiếp theo của&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>, bạn cần n&ecirc;u r&otilde; tầm nh&igrave;n, sứ mệnh doanh nghiệp. Đ&acirc;y l&agrave; phần rất quan trọng trong&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</em></strong>. Trước khi viết bạn phải nắm r&otilde; kh&aacute;i niệm thế n&agrave;o l&agrave; tầm nh&igrave;n, sứ mệnh. B&agrave;i viết của bạn phải trả lời được c&aacute;c c&acirc;u hỏi sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Sứ mệnh: C&ocirc;ng ty sinh ra để l&agrave;m g&igrave;? (giải quyết vấn đề g&igrave; của x&atilde; hội, cộng đồng/mang lại những lợi &iacute;ch g&igrave; cho x&atilde; hội, cộng đồng,&hellip;)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Tầm nh&igrave;n: Kế hoạch, mục ti&ecirc;u của c&ocirc;ng ty cho những năm sắp tới như thế n&agrave;o? (Trong 5 năm, 10 năm tới c&ocirc;ng ty sẽ ph&aacute;t triển v&agrave; định vị m&igrave;nh như thế n&agrave;o tr&ecirc;n thị trường?)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Dưới đ&acirc;y l&agrave; v&iacute; dụ về Tầm nh&igrave;n, sứ mệnh m&agrave; Boseda đ&atilde; viết cho kh&aacute;ch h&agrave;ng:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;Với mục ti&ecirc;u ph&aacute;t triển ti&ecirc;n phong v&agrave; bền vững, ngay từ khi mới th&agrave;nh lập, &Aacute;nh Dương Vina đ&atilde; x&acirc;y dựng cho doanh nghiệp tầm nh&igrave;n v&agrave; sứ mệnh như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Tầm nh&igrave;n:</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong 5 năm tới, &Aacute;nh Dương Vina sẽ trở th&agrave;nh thương hiệu h&agrave;ng đầu cung cấp dịch vụ trọn g&oacute;i cho c&aacute;c khu c&ocirc;ng nghiệp tại Bắc Ninh.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong 10 năm tới, &Aacute;nh Dương Vina sẽ l&agrave; một trong 3 c&ocirc;ng ty lớn nhất cả nước cung cấp c&aacute;c dịch vụ trọn g&oacute;i cho c&aacute;c c&ocirc;ng ty khu vực c&oacute; vốn đầu tư nước ngo&agrave;i tại Việt Nam</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Sứ mệnh:</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với kh&aacute;ch h&agrave;ng: &Aacute;nh Dương Vina x&aacute;c định cho m&igrave;nh sứ trở th&agrave;nh &ldquo;c&aacute;nh tay nối d&agrave;i của kh&aacute;ch h&agrave;ng&rdquo;, dịch vụ của ch&uacute;ng t&ocirc;i gi&uacute;p kh&aacute;ch h&agrave;ng n&acirc;ng cao hiệu suất sản xuất, tiết kiệm về thời gian, chi ph&iacute;. Từ đ&oacute;, kh&aacute;ch h&agrave;ng chỉ cần tập trung v&agrave;o c&ocirc;ng việc sản xuất chuy&ecirc;n m&ocirc;n, n&acirc;ng cao doanh số sản phẩm, g&oacute;p phần th&uacute;c đẩy kinh tế nước.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><img class=\"n3VNCb aligncenter\" style=\"box-sizing: border-box; margin: 0px auto; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word; height: auto; max-width: 100%; backface-visibility: hidden; transition: all 200ms ease-in-out 0s; clear: both; display: block; text-align: center;\" src=\"http://boseda.com.vn/wp-content/uploads/2021/06/huong-dan-viet-bai-gioi-thieu-cong-ty-13-2.jpg\" alt=\"viết b&agrave;i giới thiệu c&ocirc;ng ty\" data-noaft=\"1\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với người lao động: L&agrave; cầu nối giữa người lao động v&agrave; doanh nghiệp, gi&uacute;p người lao động c&oacute; c&ocirc;ng việc ổn định, n&acirc;ng cao thu nhập, đặc biệt &Aacute;nh Dương Vina lu&ocirc;n ch&uacute; trọng n&acirc;ng cao chất lượng lao động th&ocirc;ng qua đ&agrave;o tạo to be aperformed Directory Development.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với x&atilde; hội: C&aacute;c dịch vụ của &Aacute;nh Dương Vina hỗ trợ giải quyết c&aacute;c vấn đề thất bại cho người lao động, x&acirc;y dựng cơ sở hạ tầng, kết nối nguồn cung cấp v&agrave; y&ecirc;u cầu ph&aacute;t triển sản xuất cho nền kinh tế Việt Nam.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Tầm nh&igrave;n v&agrave; sứ mệnh đ&oacute; lu&ocirc;n l&agrave; kim chỉ nam cho c&aacute;c hoạt động của &Aacute;nh Dương Vina. Ch&uacute;ng t&ocirc;i lu&ocirc;n cần c&ugrave;, s&aacute;ng tạo trong c&ocirc;ng việc, cuộn d&acirc;y, đối t&aacute;c v&agrave; kh&ocirc;ng ngừng n&acirc;ng cấp m&aacute;y t&iacute;nh, thiết bị cũng như hệ thống chất lượng theo hướng hiện đại, hiệu quả v&agrave; an to&agrave;n. &rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Phần tiếp theo của b&agrave;i&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">giới thiệu doanh&nbsp;</strong><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">nghiệp,</strong></em>&nbsp;bạn c&oacute; thể chia sẻ về nh&acirc;n tố yếu tố v&agrave; chất lượng cơ sở của c&ocirc;ng ty. Bạn c&oacute; thể liệt k&ecirc; về số lượng v&agrave; chất lượng? Kh&aacute;c biệt điểm đặc biệt về nh&acirc;n sự?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">V&iacute; dụ viết về nh&acirc;n sự như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;Ch&uacute;ng t&ocirc;i hiểu c&aacute;c yếu tố cấu th&agrave;nh l&agrave; t&agrave;i sản qu&yacute; v&agrave; l&agrave; lợi thế cạnh tranh tr&ecirc;n thị trường n&ecirc;n c&ocirc;ng ty ch&uacute; trọng tuyển dụng v&agrave; ph&aacute;t triển đội ngũ nh&acirc;n sự hội tụ đủ hai yếu tố&rdquo; T&acirc;m &ldquo;v&agrave;&rdquo; T&agrave;i &rdquo; để đồng h&agrave;nh với ch&uacute;ng t&ocirc;i, t&ocirc;i tr&ecirc;n nền tảng của c&aacute;c m&aacute;y chủ của doanh nghiệp.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Với bộ phận l&atilde;nh đạo được tạo b&agrave;i bản, thường xuy&ecirc;n được bồi dưỡng n&acirc;ng cao tr&igrave;nh độ quản l&yacute; v&agrave; tiếp cận c&ocirc;ng nghệ mới, &Aacute;nh Dương Vina cam kết mang lại cho kh&aacute;ch h&agrave;ng v&agrave; đối t&aacute;c h&agrave;i l&ograve;ng, tin tưởng cao nhất về tiến độ, dịch vụ chất lượng m&agrave; ch&uacute;ng t&ocirc;i cung cấp. &rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Tiếp đến,<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;c&oacute; thể viết về sản phẩm, dịch vụ, triết l&yacute; doanh nghiệp hay văn h&oacute;a doanh nghiệp. T&ugrave;y thuộc v&agrave;o t&igrave;nh h&igrave;nh thực tế của c&ocirc;ng ty để bạn lựa chọn viết về phần n&agrave;o nhiều hơn, nhưng tựu chung lại bạn cần trả lời được c&aacute;c c&acirc;u hỏi sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; C&ocirc;ng ty cung cấp những sản phẩm/ dịch vụ g&igrave;? Những sản phẩm/ dịch vụ n&agrave;y c&oacute; g&igrave; kh&aacute;c biệt so với thị trường kh&ocirc;ng?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Triết l&yacute; doanh nghiệp: Nếu như mỗi con người c&oacute; một triết l&yacute; sống ri&ecirc;ng th&igrave; doanh nghiệp cũng c&oacute; triết l&yacute; kinh doanh ri&ecirc;ng của m&igrave;nh. Vậy doanh nghiệp của bạn tin v&agrave;o điều g&igrave;? hoạt động tr&ecirc;n nguy&ecirc;n tắc triết l&yacute; như thế n&agrave;o? Triết l&yacute; doanh nghiệp như kim chỉ nam cho c&aacute;c hoạt động c&ocirc;ng ty.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Văn h&oacute;a c&ocirc;ng ty: C&ocirc;ng ty c&oacute; ch&uacute; th&iacute;ch x&acirc;y dựng văn bản h&oacute;a doanh nghiệp kh&ocirc;ng? Đ&oacute; l&agrave; văn h&oacute;a như thế n&agrave;o? Kẹp hệ thống giữa l&atilde;nh đạo v&agrave; nh&acirc;n vi&ecirc;n, nh&acirc;n vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n, c&ocirc;ng ty với kh&aacute;ch h&agrave;ng?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Mỗi c&ocirc;ng ty c&oacute; một ri&ecirc;ng biệt, v&igrave; thế kh&ocirc;ng thể c&oacute; một cục chung cho tất cả c&aacute;c loại h&igrave;nh doanh nghiệp. Tr&ecirc;n đ&acirc;y, Boseda cố gắng chỉ ra v&agrave; ph&acirc;n t&iacute;ch c&aacute;ch viết một&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</strong></em>&nbsp;n&oacute;i chung, hi vọng bạn c&oacute; thể &aacute;p dụng những kiến ​​thức tr&ecirc;n để tự viết cho m&igrave;nh một&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu c&ocirc;ng ty</em></strong>&nbsp;như &yacute;.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Please kh&aacute;c biệt ngay từ lời giới thiệu doanh nghiệp!</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Boseda &ndash; Dịch vụ viết b&agrave;i giới thiệu c&ocirc;ng ty tr&ecirc;n to&agrave;n quốc</strong></em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Li&ecirc;n hệ th&ocirc;ng tin:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Email: dung.boseda@gmail.com</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Điện thoại: 0979 560 552</p>','posts/post2.jpg','about','This is the meta description for about','ACTIVE','2021-10-08 04:37:05','2021-10-09 14:42:42'),(3,1,'Contact','This is the excerpt for the Lorem Ipsum Page','<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Mỗi c&ocirc;ng ty c&oacute; một ri&ecirc;ng biệt, v&igrave; thế kh&ocirc;ng thể c&oacute; một cục chung cho tất cả c&aacute;c loại h&igrave;nh doanh nghiệp. Tr&ecirc;n đ&acirc;y, Boseda cố gắng chỉ ra v&agrave; ph&acirc;n t&iacute;ch c&aacute;ch viết một&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</strong></em>&nbsp;n&oacute;i chung, hi vọng bạn c&oacute; thể &aacute;p dụng những kiến ​​thức tr&ecirc;n để tự viết cho m&igrave;nh một&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu c&ocirc;ng ty</em></strong>&nbsp;như &yacute;.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Please kh&aacute;c biệt ngay từ lời giới thiệu doanh nghiệp!</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Boseda &ndash; Dịch vụ viết b&agrave;i giới thiệu c&ocirc;ng ty tr&ecirc;n to&agrave;n quốc</strong></em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Li&ecirc;n hệ th&ocirc;ng tin:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Email: dung.boseda@gmail.com</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Điện thoại: 0979 560 552</p>','posts/post2.jpg','contact','This is the meta description for contact','ACTIVE','2021-10-08 04:37:05','2021-10-09 14:43:08'),(4,1,'Tài liệu hướng dẫn',NULL,'<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Viết b&agrave;i giới thiệu c&ocirc;ng ty</strong>&nbsp;</em>cần viết theo một tổ chức r&otilde; r&agrave;ng để gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng nắm bắt c&aacute;c th&ocirc;ng tin về doanh nghiệp của bạn. Sau đ&acirc;y, Boseda xin chia sẻ với c&aacute;c bạn c&aacute;ch l&ecirc;n bố cục cho<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;th&ocirc;ng qua ph&acirc;n t&iacute;ch một<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</em></strong>&nbsp;mẫu do Boseda thực hiện.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">B&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;n&ecirc;n mở đầu bằng một đoạn giới thiệu chung về doanh nghiệp. This head open to be reply the question: C&ocirc;ng ty bạn c&oacute; t&ecirc;n đầy đủ l&agrave; g&igrave;? viết tắt l&agrave; g&igrave;? hoạt động trong lĩnh vực g&igrave;? C&oacute; những ch&iacute;nh dịch vụ n&agrave;o? Ngo&agrave;i ra, bạn c&oacute; thể th&ecirc;m phụ lục th&ocirc;ng tin như tại sao c&ocirc;ng ty c&oacute; t&ecirc;n gọi như vậy hoặc logo c&ocirc;ng ty c&oacute; biểu tượng g&igrave;, &hellip;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Để bạn dễ hiểu hơn, ch&uacute;ng t&ocirc;i xin đưa ra một v&iacute; dụ về đoạn mở đầu trong&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</strong></em>&nbsp;m&agrave; Boseda đ&atilde; viết như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;C&ocirc;ng ty Cổ phần Ph&aacute;t triển &Aacute;nh Dương Vina l&agrave; một c&ocirc;ng ty chuy&ecirc;n cung cấp chuỗi dịch vụ tổng hợp cho nh&agrave; m&aacute;y Samsung Bắc Ninh v&agrave; c&aacute;c nh&agrave; m&aacute;y Vendor của Samsung.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><img class=\"n3VNCb aligncenter\" style=\"box-sizing: border-box; margin: 0px auto; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word; height: auto; max-width: 100%; backface-visibility: hidden; transition: all 200ms ease-in-out 0s; clear: both; display: block; text-align: center;\" src=\"http://boseda.com.vn/wp-content/uploads/2021/06/huong-dan-viet-bai-gioi-thieu-cong-ty-13-1.jpg\" alt=\"Hướng dẫn viết b&agrave;i PR giới thiệu doanh nghiệp, c&ocirc;ng ty từ A-Z\" data-noaft=\"1\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong bối cảnh ph&aacute;t triển ng&agrave;y c&agrave;ng lớn mạnh của Samsung v&agrave; c&aacute;c Vendor, nhu cầu li&ecirc;n kết với c&aacute;c đối t&aacute;c cung cấp dịch vụ của nh&agrave; m&aacute;y Samsung l&agrave; rất lớn v&agrave; rất đa dạng. Trong khi đ&oacute;, c&aacute;c c&ocirc;ng ty hiện tại chỉ cung cấp một mảng dịch vụ nhất định g&acirc;y kh&oacute; khăn cho c&ocirc;ng t&aacute;c quản l&yacute; tổng thể của kh&aacute;ch h&agrave;ng. V&igrave; vậy, ch&uacute;ng t&ocirc;i, một đội ngũ l&atilde;nh đạo thuộc c&aacute;c c&ocirc;ng ty cung cấp c&aacute;c dịch vụ kh&aacute;c nhau đ&atilde; li&ecirc;n minh lại v&agrave; đồng s&aacute;ng lập ra &Aacute;nh Dương Vina nhằm cung cấp tổng hợp c&aacute;c dịch vụ.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đến với &Aacute;nh Dương Vina, kh&aacute;ch h&agrave;ng sẽ tiết kiệm được thời gian v&agrave; dễ d&agrave;ng quản l&yacute; t&agrave;i ch&iacute;nh, chất lượng, ti&ecirc;u chuẩn sản phẩm theo một hệ thống bởi ch&uacute;ng t&ocirc;i cung cấp đầy đủ c&aacute;c dịch vụ như: (1) Cung ứng nh&acirc;n lực, (2) Dịch vụ bảo vệ, (3) Dịch vụ n&acirc;ng cẩu h&agrave;ng h&oacute;a, (4) Dịch vụ vận tải, (5) Thi c&ocirc;ng lắp đặt hệ thống điện; (6) Thi c&ocirc;ng lắp đặt kết cấu, (7) Thiết kế, lắp đặt v&agrave; cung cấp vật tư, thiết bị ph&ograve;ng sạch, (8) Cung cấp sắt, th&eacute;p v&agrave; c&aacute;c loại vật dụng x&acirc;y dựng,&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Với số vốn điều lệ 10 tỷ đồng c&ugrave;ng đội ngũ nh&acirc;n sự nhanh nhạy, c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n v&agrave; bề d&agrave;y kinh nghiệm tr&ecirc;n thị trường, &Aacute;nh Dương Vina đ&atilde; l&agrave;m h&agrave;i l&ograve;ng c&aacute;c kh&aacute;ch h&agrave;ng, đối t&aacute;c trong v&agrave; ngo&agrave;i nước.&rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Phần tiếp theo của&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>, bạn cần n&ecirc;u r&otilde; tầm nh&igrave;n, sứ mệnh doanh nghiệp. Đ&acirc;y l&agrave; phần rất quan trọng trong&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</em></strong>. Trước khi viết bạn phải nắm r&otilde; kh&aacute;i niệm thế n&agrave;o l&agrave; tầm nh&igrave;n, sứ mệnh. B&agrave;i viết của bạn phải trả lời được c&aacute;c c&acirc;u hỏi sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Sứ mệnh: C&ocirc;ng ty sinh ra để l&agrave;m g&igrave;? (giải quyết vấn đề g&igrave; của x&atilde; hội, cộng đồng/mang lại những lợi &iacute;ch g&igrave; cho x&atilde; hội, cộng đồng,&hellip;)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Tầm nh&igrave;n: Kế hoạch, mục ti&ecirc;u của c&ocirc;ng ty cho những năm sắp tới như thế n&agrave;o? (Trong 5 năm, 10 năm tới c&ocirc;ng ty sẽ ph&aacute;t triển v&agrave; định vị m&igrave;nh như thế n&agrave;o tr&ecirc;n thị trường?)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Dưới đ&acirc;y l&agrave; v&iacute; dụ về Tầm nh&igrave;n, sứ mệnh m&agrave; Boseda đ&atilde; viết cho kh&aacute;ch h&agrave;ng:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;Với mục ti&ecirc;u ph&aacute;t triển ti&ecirc;n phong v&agrave; bền vững, ngay từ khi mới th&agrave;nh lập, &Aacute;nh Dương Vina đ&atilde; x&acirc;y dựng cho doanh nghiệp tầm nh&igrave;n v&agrave; sứ mệnh như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Tầm nh&igrave;n:</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong 5 năm tới, &Aacute;nh Dương Vina sẽ trở th&agrave;nh thương hiệu h&agrave;ng đầu cung cấp dịch vụ trọn g&oacute;i cho c&aacute;c khu c&ocirc;ng nghiệp tại Bắc Ninh.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Trong 10 năm tới, &Aacute;nh Dương Vina sẽ l&agrave; một trong 3 c&ocirc;ng ty lớn nhất cả nước cung cấp c&aacute;c dịch vụ trọn g&oacute;i cho c&aacute;c c&ocirc;ng ty khu vực c&oacute; vốn đầu tư nước ngo&agrave;i tại Việt Nam</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Sứ mệnh:</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với kh&aacute;ch h&agrave;ng: &Aacute;nh Dương Vina x&aacute;c định cho m&igrave;nh sứ trở th&agrave;nh &ldquo;c&aacute;nh tay nối d&agrave;i của kh&aacute;ch h&agrave;ng&rdquo;, dịch vụ của ch&uacute;ng t&ocirc;i gi&uacute;p kh&aacute;ch h&agrave;ng n&acirc;ng cao hiệu suất sản xuất, tiết kiệm về thời gian, chi ph&iacute;. Từ đ&oacute;, kh&aacute;ch h&agrave;ng chỉ cần tập trung v&agrave;o c&ocirc;ng việc sản xuất chuy&ecirc;n m&ocirc;n, n&acirc;ng cao doanh số sản phẩm, g&oacute;p phần th&uacute;c đẩy kinh tế nước.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><img class=\"n3VNCb aligncenter\" style=\"box-sizing: border-box; margin: 0px auto; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word; height: auto; max-width: 100%; backface-visibility: hidden; transition: all 200ms ease-in-out 0s; clear: both; display: block; text-align: center;\" src=\"http://boseda.com.vn/wp-content/uploads/2021/06/huong-dan-viet-bai-gioi-thieu-cong-ty-13-2.jpg\" alt=\"viết b&agrave;i giới thiệu c&ocirc;ng ty\" data-noaft=\"1\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với người lao động: L&agrave; cầu nối giữa người lao động v&agrave; doanh nghiệp, gi&uacute;p người lao động c&oacute; c&ocirc;ng việc ổn định, n&acirc;ng cao thu nhập, đặc biệt &Aacute;nh Dương Vina lu&ocirc;n ch&uacute; trọng n&acirc;ng cao chất lượng lao động th&ocirc;ng qua đ&agrave;o tạo to be aperformed Directory Development.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Đối với x&atilde; hội: C&aacute;c dịch vụ của &Aacute;nh Dương Vina hỗ trợ giải quyết c&aacute;c vấn đề thất bại cho người lao động, x&acirc;y dựng cơ sở hạ tầng, kết nối nguồn cung cấp v&agrave; y&ecirc;u cầu ph&aacute;t triển sản xuất cho nền kinh tế Việt Nam.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Tầm nh&igrave;n v&agrave; sứ mệnh đ&oacute; lu&ocirc;n l&agrave; kim chỉ nam cho c&aacute;c hoạt động của &Aacute;nh Dương Vina. Ch&uacute;ng t&ocirc;i lu&ocirc;n cần c&ugrave;, s&aacute;ng tạo trong c&ocirc;ng việc, cuộn d&acirc;y, đối t&aacute;c v&agrave; kh&ocirc;ng ngừng n&acirc;ng cấp m&aacute;y t&iacute;nh, thiết bị cũng như hệ thống chất lượng theo hướng hiện đại, hiệu quả v&agrave; an to&agrave;n. &rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Phần tiếp theo của b&agrave;i&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">giới thiệu doanh&nbsp;</strong><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">nghiệp,</strong></em>&nbsp;bạn c&oacute; thể chia sẻ về nh&acirc;n tố yếu tố v&agrave; chất lượng cơ sở của c&ocirc;ng ty. Bạn c&oacute; thể liệt k&ecirc; về số lượng v&agrave; chất lượng? Kh&aacute;c biệt điểm đặc biệt về nh&acirc;n sự?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">V&iacute; dụ viết về nh&acirc;n sự như sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ldquo;Ch&uacute;ng t&ocirc;i hiểu c&aacute;c yếu tố cấu th&agrave;nh l&agrave; t&agrave;i sản qu&yacute; v&agrave; l&agrave; lợi thế cạnh tranh tr&ecirc;n thị trường n&ecirc;n c&ocirc;ng ty ch&uacute; trọng tuyển dụng v&agrave; ph&aacute;t triển đội ngũ nh&acirc;n sự hội tụ đủ hai yếu tố&rdquo; T&acirc;m &ldquo;v&agrave;&rdquo; T&agrave;i &rdquo; để đồng h&agrave;nh với ch&uacute;ng t&ocirc;i, t&ocirc;i tr&ecirc;n nền tảng của c&aacute;c m&aacute;y chủ của doanh nghiệp.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Với bộ phận l&atilde;nh đạo được tạo b&agrave;i bản, thường xuy&ecirc;n được bồi dưỡng n&acirc;ng cao tr&igrave;nh độ quản l&yacute; v&agrave; tiếp cận c&ocirc;ng nghệ mới, &Aacute;nh Dương Vina cam kết mang lại cho kh&aacute;ch h&agrave;ng v&agrave; đối t&aacute;c h&agrave;i l&ograve;ng, tin tưởng cao nhất về tiến độ, dịch vụ chất lượng m&agrave; ch&uacute;ng t&ocirc;i cung cấp. &rdquo;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Tiếp đến,<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">&nbsp;b&agrave;i giới thiệu c&ocirc;ng ty</strong></em>&nbsp;c&oacute; thể viết về sản phẩm, dịch vụ, triết l&yacute; doanh nghiệp hay văn h&oacute;a doanh nghiệp. T&ugrave;y thuộc v&agrave;o t&igrave;nh h&igrave;nh thực tế của c&ocirc;ng ty để bạn lựa chọn viết về phần n&agrave;o nhiều hơn, nhưng tựu chung lại bạn cần trả lời được c&aacute;c c&acirc;u hỏi sau:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; C&ocirc;ng ty cung cấp những sản phẩm/ dịch vụ g&igrave;? Những sản phẩm/ dịch vụ n&agrave;y c&oacute; g&igrave; kh&aacute;c biệt so với thị trường kh&ocirc;ng?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Triết l&yacute; doanh nghiệp: Nếu như mỗi con người c&oacute; một triết l&yacute; sống ri&ecirc;ng th&igrave; doanh nghiệp cũng c&oacute; triết l&yacute; kinh doanh ri&ecirc;ng của m&igrave;nh. Vậy doanh nghiệp của bạn tin v&agrave;o điều g&igrave;? hoạt động tr&ecirc;n nguy&ecirc;n tắc triết l&yacute; như thế n&agrave;o? Triết l&yacute; doanh nghiệp như kim chỉ nam cho c&aacute;c hoạt động c&ocirc;ng ty.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&ndash; Văn h&oacute;a c&ocirc;ng ty: C&ocirc;ng ty c&oacute; ch&uacute; th&iacute;ch x&acirc;y dựng văn bản h&oacute;a doanh nghiệp kh&ocirc;ng? Đ&oacute; l&agrave; văn h&oacute;a như thế n&agrave;o? Kẹp hệ thống giữa l&atilde;nh đạo v&agrave; nh&acirc;n vi&ecirc;n, nh&acirc;n vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n, c&ocirc;ng ty với kh&aacute;ch h&agrave;ng?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Mỗi c&ocirc;ng ty c&oacute; một ri&ecirc;ng biệt, v&igrave; thế kh&ocirc;ng thể c&oacute; một cục chung cho tất cả c&aacute;c loại h&igrave;nh doanh nghiệp. Tr&ecirc;n đ&acirc;y, Boseda cố gắng chỉ ra v&agrave; ph&acirc;n t&iacute;ch c&aacute;ch viết một&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu doanh nghiệp</strong></em>&nbsp;n&oacute;i chung, hi vọng bạn c&oacute; thể &aacute;p dụng những kiến ​​thức tr&ecirc;n để tự viết cho m&igrave;nh một&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">b&agrave;i giới thiệu c&ocirc;ng ty</em></strong>&nbsp;như &yacute;.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Please kh&aacute;c biệt ngay từ lời giới thiệu doanh nghiệp!</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; overflow-wrap: break-word;\">Boseda &ndash; Dịch vụ viết b&agrave;i giới thiệu c&ocirc;ng ty tr&ecirc;n to&agrave;n quốc</strong></em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Li&ecirc;n hệ th&ocirc;ng tin:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Email: dung.boseda@gmail.com</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 25px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; line-height: 1.8em; color: #414141; font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Điện thoại: 0979 560 552</p>',NULL,'user_guide',NULL,'ACTIVE','2021-10-08 13:08:02','2021-10-09 14:42:29'),(5,1,'Khoa hoc',NULL,'<p><span style=\"color: #023ca1; font-family: \'Open Sans\', sans-serif; font-size: 22px; font-weight: bold;\">CHƯƠNG TR&Igrave;NH LAN TỎA TRI THỨC</span><br style=\"color: #023ca1; font-family: \'Open Sans\', sans-serif; font-size: 22px; font-weight: bold;\" /><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\">\"GIỚI THIỆU BẠN B&Egrave; - NHẬN QU&Agrave; VUI VẺ\"</span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #005085; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px;\">Chương tr&igrave;nh d&agrave;nh cho c&aacute;c Kh&aacute;ch h&agrave;ng c&aacute; nh&acirc;n đăng k&yacute; sử dụng THANH GIANG E-LEARNING (CHƯƠNG TR&Igrave;NH HỌC TẬP HO&Agrave;N TO&Agrave;N MIỄN PH&Iacute;)</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #005085; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px;\">Với người giới thiệu: Mỗi Kh&aacute;ch h&agrave;ng c&aacute; nh&acirc;n sẽ c&oacute; m&atilde; giới thiệu l&agrave; số điện thoại di động đăng k&yacute; sử dụng THANH GIANG E-LEARNING của ch&iacute;nh c&aacute; nh&acirc;n đ&oacute;. C&aacute; nh&acirc;n giới thiệu sẽ được tặng 10.000 POINT nếu giới thiệu sử dụng th&agrave;nh c&ocirc;ng THANH GIANG E-LEARNING đối với 01 Kh&aacute;ch h&agrave;ng mới (kh&ocirc;ng giới hạn số lần giới thiệu).</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #005085; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px;\">C&aacute; nh&acirc;n người giới thiệu c&oacute; thể được &aacute;p dụng thưởng nhiều lần, t&ugrave;y v&agrave;o số người m&agrave; họ giới thiệu th&agrave;nh c&ocirc;ng.</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #005085; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px;\">Với người được giới thiệu: Với mỗi c&aacute; nh&acirc;n được giới thiệu thực hiện đăng k&yacute; t&agrave;i khoản học tập tr&ecirc;n THANH GIANG E-LEARNING , nhập th&agrave;nh c&ocirc;ng m&atilde; code giới thiệu (số điện thoại của người giới thiệu) sẽ nhận được 10.000 POINT với vai tr&ograve; l&agrave; người được giới thiệu (sau đ&oacute; cũng sẽ c&oacute; quyền đi giới thiệu tiếp bạn mới v&agrave; nhận thưởng)</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #015c8a; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px; font-weight: 400;\">❖ POINT sẽ được cộng dồn để quy đổi th&agrave;nh gi&aacute; trị tương ứng v&agrave; được sử dụng khi đăng k&yacute; c&aacute;c dịch vụ kh&aacute;c của THANH GIANG như: du học c&aacute;c nước (Nhật, H&agrave;n, Canada, Mỹ, Anh, &Uacute;c, Đức,&hellip;) hoặc Xuất khẩu lao động Nhật (Kỹ sư &ndash; nh&acirc;n vi&ecirc;n, Kỹ năng đặc định, Thực tập sinh)</span><br style=\"color: #015c8a; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px; font-weight: 400;\" /><span style=\"color: #015c8a; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px; font-weight: 400;\">VD: giới thiệu 100 bạn th&igrave; tổng Point được nhận l&agrave; 1.000.000 Point, tương ứng với 1.000.000 VND v&agrave; được sử dụng khi tham gia c&aacute;c dịch vụ của THANH GIANG (Kh&ocirc;ng quy đổi tiền mặt)</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #015c8a; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px; font-weight: 400;\">❖ POINT được ph&eacute;p chuyển nhượng cho người kh&aacute;c sử dụng.</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"color: #015c8a; font-family: \'Source Sans Pro\', sans-serif; font-size: 14px; font-weight: 400;\">❖ POINT c&oacute; gi&aacute; trị cộng dồn v&agrave; sử dụng trong v&ograve;ng 3 năm.</span></span></p>',NULL,'khoa-hoc',NULL,'INACTIVE','2021-10-11 12:59:45','2021-10-11 13:21:22'),(6,1,'Chương trình giới thiệu',NULL,'<p><span style=\"color: #023ca1; font-family: \'Open Sans\', sans-serif; font-size: 22px; font-weight: bold;\">CHƯƠNG TR&Igrave;NH THU NHẬP HẤP DẪN</span><br style=\"color: #023ca1; font-family: \'Open Sans\', sans-serif; font-size: 22px; font-weight: bold;\" /><span style=\"color: #023ca1; font-family: \'Open Sans\', sans-serif; font-size: 22px; font-weight: bold;\">GIỚI THIỆU BẠN THAM GIA C&Aacute;C&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\">DỊCH VỤ TƯ VẤN DU HỌC - XKLĐ - GIỚI THIỆU NH&Acirc;N SỰ CỦA THANH GIANG</span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #005085; text-decoration-line: underline;\">Bước 1:</span><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\">&nbsp;Nếu c&oacute; bạn b&egrave;, người th&acirc;n quan t&acirc;m t&igrave;m hiểu du học (Nhật, H&agrave;n, Anh, &Uacute;c, Mỹ, Canada, Singapore, Đức,...) hoặc XKLĐ Nhật (Kỹ sư-nh&acirc;n vi&ecirc;n, Kỹ năng đặc định, Thực tập sinh,...) th&igrave; li&ecirc;n hệ với Thanh Giang theo li&ecirc;n hệ sau:</span><br style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\" /><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\">&nbsp; &nbsp;- Điện thoại: 0918 58 2233</span><br style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\" /><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\">&nbsp; &nbsp;- Email: water@thanhgiang.com.vn</span><br style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\" /><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\">&nbsp; &nbsp;- Face Book: https://www.facebook.com/duhoc.thanhgiang.com.vn/</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #005085; text-decoration-line: underline;\">Bước 2:</span><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\"> Thanh Giang sẽ gửi hợp đồng hợp t&aacute;c với người giới thiệu</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #005085; text-decoration-line: underline;\">Bước 3:</span><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\"> Thanh Giang cử đại diện tư vấn vi&ecirc;n hỗ trợ cho người giới thiệu v&agrave; người được giới thiệu c&aacute;c th&ocirc;ng tin chi tiết, cụ thể của từng chương tr&igrave;nh</span></span></p>\r\n<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \'Open Sans\', sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #ff0068;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, sans-serif; vertical-align: baseline; box-sizing: border-box; -webkit-font-smoothing: antialiased; color: #005085; text-decoration-line: underline;\">Bước 4:</span><span style=\"color: #005085; font-family: Roboto, sans-serif; font-size: 13px;\"> Người được giới thiệu đăng k&yacute; ch&iacute;nh thức c&aacute;c chương tr&igrave;nh th&igrave; người giới thiệu sẽ nhận được chế độ hoa hồng giới thiệu theo hợp đồng</span></span></p>',NULL,'chuong-trinh-gioi-thieu',NULL,'INACTIVE','2021-10-11 13:00:19','2021-10-11 14:05:46');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(2,'browse_bread',NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(3,'browse_database',NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(4,'browse_media',NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(5,'browse_compass',NULL,'2021-09-26 12:35:50','2021-09-26 12:35:50'),(6,'browse_menus','menus','2021-09-26 12:35:50','2021-09-26 12:35:50'),(7,'read_menus','menus','2021-09-26 12:35:50','2021-09-26 12:35:50'),(8,'edit_menus','menus','2021-09-26 12:35:50','2021-09-26 12:35:50'),(9,'add_menus','menus','2021-09-26 12:35:50','2021-09-26 12:35:50'),(10,'delete_menus','menus','2021-09-26 12:35:50','2021-09-26 12:35:50'),(11,'browse_roles','roles','2021-09-26 12:35:50','2021-09-26 12:35:50'),(12,'read_roles','roles','2021-09-26 12:35:50','2021-09-26 12:35:50'),(13,'edit_roles','roles','2021-09-26 12:35:50','2021-09-26 12:35:50'),(14,'add_roles','roles','2021-09-26 12:35:50','2021-09-26 12:35:50'),(15,'delete_roles','roles','2021-09-26 12:35:50','2021-09-26 12:35:50'),(16,'browse_users','users','2021-09-26 12:35:50','2021-09-26 12:35:50'),(17,'read_users','users','2021-09-26 12:35:50','2021-09-26 12:35:50'),(18,'edit_users','users','2021-09-26 12:35:50','2021-09-26 12:35:50'),(19,'add_users','users','2021-09-26 12:35:50','2021-09-26 12:35:50'),(20,'delete_users','users','2021-09-26 12:35:50','2021-09-26 12:35:50'),(21,'browse_settings','settings','2021-09-26 12:35:50','2021-09-26 12:35:50'),(22,'read_settings','settings','2021-09-26 12:35:50','2021-09-26 12:35:50'),(23,'edit_settings','settings','2021-09-26 12:35:50','2021-09-26 12:35:50'),(24,'add_settings','settings','2021-09-26 12:35:50','2021-09-26 12:35:50'),(25,'delete_settings','settings','2021-09-26 12:35:50','2021-09-26 12:35:50'),(26,'browse_points','points','2021-09-26 12:50:02','2021-09-26 12:50:02'),(27,'read_points','points','2021-09-26 12:50:02','2021-09-26 12:50:02'),(28,'edit_points','points','2021-09-26 12:50:02','2021-09-26 12:50:02'),(29,'add_points','points','2021-09-26 12:50:02','2021-09-26 12:50:02'),(30,'delete_points','points','2021-09-26 12:50:02','2021-09-26 12:50:02'),(31,'browse_collaborators_users','collaborators_users','2021-09-26 12:55:09','2021-09-26 12:55:09'),(32,'read_collaborators_users','collaborators_users','2021-09-26 12:55:09','2021-09-26 12:55:09'),(33,'edit_collaborators_users','collaborators_users','2021-09-26 12:55:09','2021-09-26 12:55:09'),(34,'add_collaborators_users','collaborators_users','2021-09-26 12:55:09','2021-09-26 12:55:09'),(35,'delete_collaborators_users','collaborators_users','2021-09-26 12:55:09','2021-09-26 12:55:09'),(36,'browse_coupons','coupons','2021-10-07 07:04:44','2021-10-07 07:04:44'),(37,'read_coupons','coupons','2021-10-07 07:04:44','2021-10-07 07:04:44'),(38,'edit_coupons','coupons','2021-10-07 07:04:44','2021-10-07 07:04:44'),(39,'add_coupons','coupons','2021-10-07 07:04:44','2021-10-07 07:04:44'),(40,'delete_coupons','coupons','2021-10-07 07:04:44','2021-10-07 07:04:44'),(41,'browse_pages',NULL,'2021-10-08 04:37:05','2021-10-08 04:37:05'),(42,'read_pages',NULL,'2021-10-08 04:37:05','2021-10-08 04:37:05'),(43,'edit_pages',NULL,'2021-10-08 04:37:05','2021-10-08 04:37:05'),(44,'add_pages',NULL,'2021-10-08 04:37:05','2021-10-08 04:37:05'),(45,'delete_pages',NULL,'2021-10-08 04:37:05','2021-10-08 04:37:05'),(46,'browse_pages','pages','2021-10-08 04:37:05','2021-10-08 04:37:05'),(47,'read_pages','pages','2021-10-08 04:37:05','2021-10-08 04:37:05'),(48,'edit_pages','pages','2021-10-08 04:37:05','2021-10-08 04:37:05'),(49,'add_pages','pages','2021-10-08 04:37:05','2021-10-08 04:37:05'),(50,'delete_pages','pages','2021-10-08 04:37:05','2021-10-08 04:37:05');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,'Du học sinh','Nhật bản',100,'2021-10-11 15:57:54','2021-10-11 15:57:54');
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2021-09-26 12:35:50','2021-09-26 12:35:50'),(2,'user','Normal User','2021-09-26 12:35:50','2021-09-26 12:35:50');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Point CRM','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to PointCRM.','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(11,'admin.point_register','Số point + khi user Đăng ký','100',NULL,'text',6,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupons`
--

DROP TABLE IF EXISTS `user_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupons`
--

LOCK TABLES `user_coupons` WRITE;
/*!40000 ALTER TABLE `user_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_points`
--

DROP TABLE IF EXISTS `user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `point_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_points`
--

LOCK TABLES `user_points` WRITE;
/*!40000 ALTER TABLE `user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `course` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','admin@admin.com','users/default.png',NULL,'$2y$10$w1yixQVif5U3vVwwhmNbVujfzID6cXpOjFg3Y1EDZXT8E1vgMbEde','BJcWm3Si6nzQSOLcwsv5fnVcMxTdsmWbONM5QImTTJq4hTWp6dW3HGidHKyn',NULL,'2021-10-08 04:34:27','2021-10-10 03:14:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,554,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-11 16:08:51
