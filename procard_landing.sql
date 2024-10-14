-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: procard_landing
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add kv store',6,'add_kvstore'),(22,'Can change kv store',6,'change_kvstore'),(23,'Can delete kv store',6,'delete_kvstore'),(24,'Can view kv store',6,'view_kvstore'),(25,'Can add Título e descrição',7,'add_staticpage'),(26,'Can change Título e descrição',7,'change_staticpage'),(27,'Can delete Título e descrição',7,'delete_staticpage'),(28,'Can view Título e descrição',7,'view_staticpage'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add HTML Incorporado',10,'add_embedhtml'),(38,'Can change HTML Incorporado',10,'change_embedhtml'),(39,'Can delete HTML Incorporado',10,'delete_embedhtml'),(40,'Can view HTML Incorporado',10,'view_embedhtml'),(41,'Can add Informações para contato',11,'add_contato'),(42,'Can change Informações para contato',11,'change_contato'),(43,'Can delete Informações para contato',11,'delete_contato'),(44,'Can view Informações para contato',11,'view_contato'),(45,'Can add Newsletter',12,'add_newsletter'),(46,'Can change Newsletter',12,'change_newsletter'),(47,'Can delete Newsletter',12,'delete_newsletter'),(48,'Can view Newsletter',12,'view_newsletter'),(49,'Can add banner',13,'add_banner'),(50,'Can change banner',13,'change_banner'),(51,'Can delete banner',13,'delete_banner'),(52,'Can view banner',13,'view_banner'),(53,'Can add Investimento',14,'add_investimento'),(54,'Can change Investimento',14,'change_investimento'),(55,'Can delete Investimento',14,'delete_investimento'),(56,'Can view Investimento',14,'view_investimento'),(57,'Can add Sobre',15,'add_sobre'),(58,'Can change Sobre',15,'change_sobre'),(59,'Can delete Sobre',15,'delete_sobre'),(60,'Can view Sobre',15,'view_sobre'),(61,'Can add Benefício',16,'add_beneficios'),(62,'Can change Benefício',16,'change_beneficios'),(63,'Can delete Benefício',16,'delete_beneficios'),(64,'Can view Benefício',16,'view_beneficios');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_banner`
--

DROP TABLE IF EXISTS `banners_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `nome` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legenda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_banner`
--

LOCK TABLES `banners_banner` WRITE;
/*!40000 ALTER TABLE `banners_banner` DISABLE KEYS */;
INSERT INTO `banners_banner` VALUES (1,'2022-10-17 16:54:58.189437','2023-03-22 18:21:14.645356','Banner','Seja um Licenciado','Fature até 4 milhões por ano, com um investimento a partir de R$ 50 mil e retorno médio de 10 meses.');
/*!40000 ALTER TABLE `banners_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficios_investimento`
--

DROP TABLE IF EXISTS `beneficios_investimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficios_investimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `subtitulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legenda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios_investimento`
--

LOCK TABLES `beneficios_investimento` WRITE;
/*!40000 ALTER TABLE `beneficios_investimento` DISABLE KEYS */;
INSERT INTO `beneficios_investimento` VALUES (1,'2022-10-17 16:50:01.243838','2022-10-24 17:34:49.769841',0,'','upload/beneficios/investimento/img1.png','Capital para Instalação','R$ 0,00',''),(2,'2022-10-17 16:51:05.606946','2023-03-22 17:50:36.927808',1,'A partir de','upload/beneficios/investimento/icon_fddryez.png','Taxa de Licenciamento','R$ 50 mil',''),(3,'2022-10-17 16:52:02.503015','2022-10-24 17:34:59.388772',2,'','upload/beneficios/investimento/icon2.png','Capital de giro','R$ 0,00',''),(4,'2022-10-17 16:52:55.436744','2023-03-22 17:50:21.884420',3,'A partir de','upload/beneficios/investimento/icon3.png','Investimento Total','R$ 50 mil','');
/*!40000 ALTER TABLE `beneficios_investimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficios_sobre`
--

DROP TABLE IF EXISTS `beneficios_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficios_sobre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resenha` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios_sobre`
--

LOCK TABLES `beneficios_sobre` WRITE;
/*!40000 ALTER TABLE `beneficios_sobre` DISABLE KEYS */;
INSERT INTO `beneficios_sobre` VALUES (1,'2022-10-17 16:53:36.966648','2023-03-22 17:47:42.337246','Sobre a Procard Benefícios','<p style=\"text-align:center\">A Procard Benefícios foi criada com a missão oferecer saúde e serviços a todos com qualidade e a um valor mais acessível.</p>\r\n\r\n<p style=\"text-align:center\">Com parcerias sólidas na área da saúde e de serviços, buscamos sempre melhorar nosso atendimento, nosso relacionamento com os clientes e a busca por parcerias que ofereçam mais benefícios e descontos para os associados.</p>\r\n\r\n<p style=\"text-align:center\">Isso significa que o maior objetivo da Procard Benefícios é cuidar da saúde e bem-estar, fazendo a diferença na vida de seus associados.</p>\r\n\r\n<p style=\"text-align:center\">Tudo isso de forma fácil e justa!</p>');
/*!40000 ALTER TABLE `beneficios_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracoes_contato`
--

DROP TABLE IF EXISTS `configuracoes_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracoes_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `link_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracoes_contato`
--

LOCK TABLES `configuracoes_contato` WRITE;
/*!40000 ALTER TABLE `configuracoes_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracoes_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracoes_embedhtml`
--

DROP TABLE IF EXISTS `configuracoes_embedhtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracoes_embedhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `tag` smallint(5) unsigned NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracoes_embedhtml`
--

LOCK TABLES `configuracoes_embedhtml` WRITE;
/*!40000 ALTER TABLE `configuracoes_embedhtml` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracoes_embedhtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_user`
--

DROP TABLE IF EXISTS `contas_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_user`
--

LOCK TABLES `contas_user` WRITE;
/*!40000 ALTER TABLE `contas_user` DISABLE KEYS */;
INSERT INTO `contas_user` VALUES (1,'pbkdf2_sha256$150000$Uu4l2ZT90WSr$cyB7qmw16SgxueZuoqpSzrTcLmv6tmIE7LmLHF4ic4Y=','2023-09-16 18:19:43.251995',1,'atualint','','','will@atualinterativa.com.br',1,1,'2022-10-10 20:01:44.853507'),(2,'pbkdf2_sha256$150000$42qggWPfwkBx$6VBQTqoLbYYm/PGFEi82S8Nvp8GF9EJi3obyhYRet1w=','2024-02-26 12:43:01.972530',0,'procard','Procard','Benefícios','filipe.marchi@doqt.com.br',1,1,'2022-10-26 19:16:36.000000');
/*!40000 ALTER TABLE `contas_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_user_groups`
--

DROP TABLE IF EXISTS `contas_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contas_user_groups_user_id_group_id_753e9b89_uniq` (`user_id`,`group_id`),
  KEY `contas_user_groups_group_id_f3a13f7f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `contas_user_groups_group_id_f3a13f7f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `contas_user_groups_user_id_2014b800_fk_contas_user_id` FOREIGN KEY (`user_id`) REFERENCES `contas_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_user_groups`
--

LOCK TABLES `contas_user_groups` WRITE;
/*!40000 ALTER TABLE `contas_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `contas_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_user_user_permissions`
--

DROP TABLE IF EXISTS `contas_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contas_user_user_permissions_user_id_permission_id_a88b71c0_uniq` (`user_id`,`permission_id`),
  KEY `contas_user_user_per_permission_id_c68ef6db_fk_auth_perm` (`permission_id`),
  CONSTRAINT `contas_user_user_per_permission_id_c68ef6db_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `contas_user_user_permissions_user_id_4aeffa96_fk_contas_user_id` FOREIGN KEY (`user_id`) REFERENCES `contas_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_user_user_permissions`
--

LOCK TABLES `contas_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `contas_user_user_permissions` DISABLE KEYS */;
INSERT INTO `contas_user_user_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39),(40,2,40),(41,2,41),(42,2,42),(43,2,43),(44,2,44),(45,2,45),(46,2,46),(47,2,47),(48,2,48),(49,2,49),(50,2,50),(51,2,51),(52,2,52),(53,2,53),(54,2,54),(55,2,55),(56,2,56),(57,2,57),(58,2,58),(59,2,59),(60,2,60),(61,2,61),(62,2,62),(63,2,63),(64,2,64);
/*!40000 ALTER TABLE `contas_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_contas_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_contas_user_id` FOREIGN KEY (`user_id`) REFERENCES `contas_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-17 16:50:01.299104','1','Capital para Instalação',1,'[{\"added\": {}}]',14,1),(2,'2022-10-17 16:51:05.614502','2','Taxa de Franquia',1,'[{\"added\": {}}]',14,1),(3,'2022-10-17 16:52:02.508792','3','Capital de giro',1,'[{\"added\": {}}]',14,1),(4,'2022-10-17 16:52:55.443544','4','Investimento Total',1,'[{\"added\": {}}]',14,1),(5,'2022-10-17 16:53:36.968198','1','Sobre a Procard Benefícios',1,'[{\"added\": {}}]',15,1),(6,'2022-10-17 16:54:00.869126','1','Beneficios object (1)',1,'[{\"added\": {}}]',16,1),(7,'2022-10-17 16:54:58.190937','1','Banner',1,'[{\"added\": {}}]',13,1),(8,'2022-10-17 16:59:00.554837','4','Investimento Total',2,'[{\"changed\": {\"fields\": [\"subtitulo\"]}}]',14,1),(9,'2022-10-17 17:06:07.242770','2','Taxa de Franquia',2,'[{\"changed\": {\"fields\": [\"subtitulo\"]}}]',14,1),(10,'2022-10-17 17:15:14.016079','1','Beneficios object (1)',2,'[{\"changed\": {\"fields\": [\"resenha\"]}}]',16,1),(11,'2022-10-17 17:17:27.150973','1','Sobre a Procard Benefícios',2,'[{\"changed\": {\"fields\": [\"resenha\"]}}]',15,1),(12,'2022-10-17 17:18:43.849345','1','Sobre a Procard Benefícios',2,'[{\"changed\": {\"fields\": [\"resenha\"]}}]',15,1),(13,'2022-10-24 17:27:22.085691','1','Sobre a Procard Benefícios',2,'[{\"changed\": {\"fields\": [\"resenha\"]}}]',15,1),(14,'2022-10-24 17:34:49.771661','1','Capital para Instalação',2,'[{\"changed\": {\"fields\": [\"legenda\"]}}]',14,1),(15,'2022-10-24 17:34:55.343168','2','Taxa de Franquia',2,'[{\"changed\": {\"fields\": [\"legenda\"]}}]',14,1),(16,'2022-10-24 17:34:59.389729','3','Capital de giro',2,'[{\"changed\": {\"fields\": [\"legenda\"]}}]',14,1),(17,'2022-10-24 17:35:03.368494','4','Investimento Total',2,'[{\"changed\": {\"fields\": [\"legenda\"]}}]',14,1),(18,'2022-10-26 19:16:36.357975','2','filipe.marchi@doqt.com.br',1,'[{\"added\": {}}]',9,1),(19,'2022-10-26 19:17:10.052178','2','filipe.marchi@doqt.com.br',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_staff\", \"user_permissions\"]}}]',9,1),(20,'2023-01-16 17:24:07.468609','2','Taxa de Franquia',2,'[{\"changed\": {\"fields\": [\"preco\"]}}]',14,1),(21,'2023-01-16 17:24:32.086542','2','Taxa de Franquia',2,'[{\"changed\": {\"fields\": [\"preco\"]}}]',14,1),(22,'2023-03-22 17:47:19.747253','1','Banner',2,'[{\"changed\": {\"fields\": [\"titulo\", \"legenda\"]}}]',13,1),(23,'2023-03-22 17:47:42.345270','1','Sobre a Procard Benefícios',2,'[{\"changed\": {\"fields\": [\"resenha\"]}}]',15,1),(24,'2023-03-22 17:49:08.251515','2','Taxa de Licenciamento',2,'[{\"changed\": {\"fields\": [\"subtitulo\", \"nome\", \"preco\"]}}]',14,1),(25,'2023-03-22 17:49:35.692268','4','Investimento Total',2,'[{\"changed\": {\"fields\": [\"subtitulo\", \"preco\"]}}]',14,1),(26,'2023-03-22 17:50:21.885597','4','Investimento Total',2,'[{\"changed\": {\"fields\": [\"subtitulo\", \"preco\"]}}]',14,1),(27,'2023-03-22 17:50:36.929681','2','Taxa de Licenciamento',2,'[{\"changed\": {\"fields\": [\"subtitulo\", \"preco\"]}}]',14,1),(28,'2023-03-22 17:51:53.446501','1','Beneficios object (1)',2,'[{\"changed\": {\"fields\": [\"titulo\", \"resenha\"]}}]',16,1),(29,'2023-03-22 18:21:14.646894','1','Banner',2,'[{\"changed\": {\"fields\": [\"titulo\"]}}]',13,1),(30,'2023-03-23 13:40:46.583613','1','Beneficios object (1)',2,'[{\"changed\": {\"fields\": [\"titulo\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(13,'banners','banner'),(14,'beneficios','investimento'),(15,'beneficios','sobre'),(11,'configuracoes','contato'),(10,'configuracoes','embedhtml'),(8,'contas','group'),(9,'contas','user'),(4,'contenttypes','contenttype'),(16,'franquias','beneficios'),(12,'newsletter','newsletter'),(7,'seo','staticpage'),(5,'sessions','session'),(6,'thumbnail','kvstore');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-10 20:00:54.146566'),(2,'contenttypes','0002_remove_content_type_name','2022-10-10 20:00:54.184341'),(3,'auth','0001_initial','2022-10-10 20:00:54.217328'),(4,'auth','0002_alter_permission_name_max_length','2022-10-10 20:00:54.278904'),(5,'auth','0003_alter_user_email_max_length','2022-10-10 20:00:54.284563'),(6,'auth','0004_alter_user_username_opts','2022-10-10 20:00:54.290453'),(7,'auth','0005_alter_user_last_login_null','2022-10-10 20:00:54.296488'),(8,'auth','0006_require_contenttypes_0002','2022-10-10 20:00:54.298196'),(9,'auth','0007_alter_validators_add_error_messages','2022-10-10 20:00:54.303808'),(10,'auth','0008_alter_user_username_max_length','2022-10-10 20:00:54.309204'),(11,'auth','0009_alter_user_last_name_max_length','2022-10-10 20:00:54.315385'),(12,'auth','0010_alter_group_name_max_length','2022-10-10 20:00:54.322850'),(13,'auth','0011_update_proxy_permissions','2022-10-10 20:00:54.328585'),(14,'contas','0001_initial','2022-10-10 20:00:54.356042'),(15,'admin','0001_initial','2022-10-10 20:00:54.407602'),(16,'admin','0002_logentry_remove_auto_add','2022-10-10 20:00:54.430960'),(17,'admin','0003_logentry_add_action_flag_choices','2022-10-10 20:00:54.437878'),(18,'banners','0001_initial','2022-10-10 20:00:54.446320'),(19,'beneficios','0001_initial','2022-10-10 20:00:54.463869'),(20,'beneficios','0002_auto_20221010_1545','2022-10-10 20:00:54.466924'),(21,'configuracoes','0001_initial','2022-10-10 20:00:54.476923'),(22,'configuracoes','0002_contato','2022-10-10 20:00:54.485259'),(23,'configuracoes','0003_auto_20220414_1637','2022-10-10 20:00:54.489694'),(24,'franquias','0001_initial','2022-10-10 20:00:54.511748'),(25,'franquias','0002_auto_20221010_1602','2022-10-10 20:00:54.528596'),(26,'newsletter','0001_initial','2022-10-10 20:00:54.544545'),(27,'seo','0001_initial','2022-10-10 20:00:54.558625'),(28,'seo','0002_auto_20220331_1628','2022-10-10 20:00:54.624926'),(29,'sessions','0001_initial','2022-10-10 20:00:54.634432'),(30,'thumbnail','0001_initial','2022-10-10 20:00:54.645868'),(31,'beneficios','0003_auto_20221024_1428','2022-10-24 17:34:30.293119'),(32,'newsletter','0002_auto_20221026_1418','2022-10-26 18:55:53.074898'),(33,'newsletter','0003_auto_20221026_1423','2022-10-26 18:55:53.085849'),(34,'newsletter','0004_auto_20221026_1555','2022-10-26 18:55:53.090617'),(35,'newsletter','0005_auto_20221026_1555','2022-10-26 18:55:53.096103'),(36,'newsletter','0006_auto_20230322_1739','2023-03-23 12:30:55.085629');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ix6tlm36083dmmgqi0kty3ko175r6tj','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2022-11-28 12:45:06.253635'),('5fgls5cinx5b47fjf2vbj11so8hzvhet','MGNjODcxNDk0MDE3MDc4N2Y4N2RmZGE5NDU0Y2JjNDQ3NmZkNmUzYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDIwOThlMTRlZDc0NjA2NDljOGMxYTE2OWNkNDgwZGMwNDk4YWRjIn0=','2024-03-11 12:43:01.975620'),('5hd36jugjr7naejhbb5ardvkmxejgjql','YjAyZWZkOTgwMTcwOGY2OGVkNzRlMWFlYjY3YTI3OGE1NjhkZmY1ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM0MjA5OGUxNGVkNzQ2MDY0OWM4YzFhMTY5Y2Q0ODBkYzA0OThhZGMifQ==','2022-11-09 19:59:13.116892'),('5rw7zy9p4gi1dppdbrxbz1hjxvd6ca8a','YjAyZWZkOTgwMTcwOGY2OGVkNzRlMWFlYjY3YTI3OGE1NjhkZmY1ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM0MjA5OGUxNGVkNzQ2MDY0OWM4YzFhMTY5Y2Q0ODBkYzA0OThhZGMifQ==','2022-11-16 11:13:04.829837'),('6x8hcy9ykeqffsh85yiakkbix8brc70p','MGNjODcxNDk0MDE3MDc4N2Y4N2RmZGE5NDU0Y2JjNDQ3NmZkNmUzYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDIwOThlMTRlZDc0NjA2NDljOGMxYTE2OWNkNDgwZGMwNDk4YWRjIn0=','2023-07-20 17:41:12.430127'),('h6o148coolsm0lxi4cd8ma0xlf95fvfu','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2023-01-30 17:18:14.749490'),('k7n4powxmla0qd5mwzjf7pagiq7ojso1','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2022-11-07 17:26:36.825933'),('l9f0exfovsxfx2w8lm1dg669myd5ha72','YjAyZWZkOTgwMTcwOGY2OGVkNzRlMWFlYjY3YTI3OGE1NjhkZmY1ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM0MjA5OGUxNGVkNzQ2MDY0OWM4YzFhMTY5Y2Q0ODBkYzA0OThhZGMifQ==','2022-12-09 21:33:47.161130'),('pthh6d2y1rowiqw5bag2g8sauk13dbc5','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2022-10-31 14:03:43.348394'),('sma5f9lrq2ir3uajwrac0c0o8l4v6k1w','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2022-10-31 16:48:42.029262'),('tfi82o7x7mx8k04x24sto45d2guabmes','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2023-04-27 15:43:18.485159'),('vx7qadzu6ps2vx6ww4y4sl4hx71ju7h9','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2023-04-05 17:46:33.955094'),('xy5xfq8bmqq8jkyawvv0axasi6lsl7k5','MGM2YTI5ZGU5MDU5MzZjNTBjMmQwZmYyZjU1YTBhYzA4YWZmNzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY29udGFzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMGI3ZmE4YmRjYzc3YWRjYjhmNjUwY2U0ZTUxOTAxYjA0MTQ2ODcifQ==','2023-09-30 18:19:43.254568');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franquias_beneficios`
--

DROP TABLE IF EXISTS `franquias_beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franquias_beneficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resenha` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquias_beneficios`
--

LOCK TABLES `franquias_beneficios` WRITE;
/*!40000 ALTER TABLE `franquias_beneficios` DISABLE KEYS */;
INSERT INTO `franquias_beneficios` VALUES (1,'2022-10-17 16:54:00.867924','2023-03-23 13:40:46.582703','Benefícios de fazer parte do Procard Licenciamento','<p>Faça parte da família Procard! Entre em contato com nossos representantes e entenda como funciona o processo. O investimento inicial é baixíssimo e o retorno potencial é rápido e atrativo.</p>');
/*!40000 ALTER TABLE `franquias_beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_newsletter`
--

DROP TABLE IF EXISTS `newsletter_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_newsletter` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_interesse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_reside` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletter_newsletter_email_newsletter_2e95d263_uniq` (`email_newsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_newsletter`
--

LOCK TABLES `newsletter_newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter_newsletter` DISABLE KEYS */;
INSERT INTO `newsletter_newsletter` VALUES (1,'2022-10-26 14:33:58.333956','2022-10-26 14:33:58.345783','Filipe Silva de Marchi','filipe.marchi@doqt.com.br','(16) 99217-0553','',''),(2,'2022-10-26 19:36:26.035750','2022-10-26 19:36:26.044564','Filipe Silva de Marchi','filipesilvademarchi@gmail.com','(16) 99217-0553','',''),(3,'2022-10-27 13:58:52.614781','2022-10-27 13:58:52.628555','Márcio Márcio Sales','marciomarciosales@hoatmail.com','(16) 98592-2227','',''),(4,'2023-04-13 19:41:01.143459','2023-04-13 19:41:01.150608','Jony Andrade','jony.andrade@procardbeneficios.com.br','(16) 99176-7979','Brasil','Ribeirão Preto'),(5,'2023-05-26 20:05:03.264572','2023-05-26 20:05:03.387385','sandro alexandre carvalho de araujo','sanplay001@gmail.com','(43) 98853-3659','Londrina','Londrina'),(6,'2023-07-06 11:54:24.191069','2023-07-06 11:54:24.204927','teste','teste@teste.com','(33) 33333-3333','fsfsddsfd','gdfdsfs'),(7,'2024-01-15 13:29:14.249257','2024-01-15 13:29:14.267496','maria guacira c gardinal','m.guacira@bol.com.br','(11) 98280-5739','ribeirao preto','luis antonio sp');
/*!40000 ALTER TABLE `newsletter_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_staticpage`
--

DROP TABLE IF EXISTS `seo_staticpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_staticpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `seo_title` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_staticpage`
--

LOCK TABLES `seo_staticpage` WRITE;
/*!40000 ALTER TABLE `seo_staticpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_staticpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||7e03402e94771cdcdf61aad24f671be1','{\"name\": \"cache/65/e6/65e6e6087d316a663c2c4e9abba17bbc.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||image||a542c5f105b2320a9337f46b647ce70a','{\"name\": \"cache/7f/d2/7fd24cbfd899f78e7dbfcf9e9ffe8d29.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||image||a6472a31fbb9d7eed2bcb13ade8661b7','{\"name\": \"upload/beneficios/investimento/img1.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [49, 51]}'),('sorl-thumbnail||image||a9689a6c22a22a3aeb9a7c9dfba6f565','{\"name\": \"upload/beneficios/investimento/icon2.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||image||cb32437484628dbb878ecb9a55a55e31','{\"name\": \"cache/f7/ef/f7ef822e3e694248b954086f3430973c.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||image||d7e17c4a913900c3e22d8bb4488c8500','{\"name\": \"upload/beneficios/investimento/icon3.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [46, 46]}'),('sorl-thumbnail||image||d90571f8c543e5f18e4c26f2307166f2','{\"name\": \"cache/d3/b4/d3b4dfbb2b97b9b8dfaaad76c8b013ca.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||image||ef374344e2ae3aecdcb506efe67bda70','{\"name\": \"upload/beneficios/investimento/icon_fddryez.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [44, 46]}'),('sorl-thumbnail||thumbnails||a6472a31fbb9d7eed2bcb13ade8661b7','[\"7e03402e94771cdcdf61aad24f671be1\"]'),('sorl-thumbnail||thumbnails||a9689a6c22a22a3aeb9a7c9dfba6f565','[\"a542c5f105b2320a9337f46b647ce70a\"]'),('sorl-thumbnail||thumbnails||d7e17c4a913900c3e22d8bb4488c8500','[\"cb32437484628dbb878ecb9a55a55e31\"]'),('sorl-thumbnail||thumbnails||ef374344e2ae3aecdcb506efe67bda70','[\"d90571f8c543e5f18e4c26f2307166f2\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 16:00:43
