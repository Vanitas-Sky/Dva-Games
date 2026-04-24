-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dva
DROP DATABASE IF EXISTS `dva`;
CREATE DATABASE IF NOT EXISTS `dva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dva`;

-- Volcando estructura para tabla dva.account_emailaddress
DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.account_emailaddress: ~0 rows (aproximadamente)
INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
	(5, 'albertouchiha34@gmail.com', 1, 1, 6),
	(6, 'licht.smile002@gmail.com', 1, 1, 1);

-- Volcando estructura para tabla dva.account_emailconfirmation
DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.account_emailconfirmation: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.auth_group
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_permission: ~56 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add site', 7, 'add_site'),
	(26, 'Can change site', 7, 'change_site'),
	(27, 'Can delete site', 7, 'delete_site'),
	(28, 'Can view site', 7, 'view_site'),
	(29, 'Can add email address', 8, 'add_emailaddress'),
	(30, 'Can change email address', 8, 'change_emailaddress'),
	(31, 'Can delete email address', 8, 'delete_emailaddress'),
	(32, 'Can view email address', 8, 'view_emailaddress'),
	(33, 'Can add email confirmation', 9, 'add_emailconfirmation'),
	(34, 'Can change email confirmation', 9, 'change_emailconfirmation'),
	(35, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
	(36, 'Can view email confirmation', 9, 'view_emailconfirmation'),
	(37, 'Can add TOTP device', 10, 'add_totpdevice'),
	(38, 'Can change TOTP device', 10, 'change_totpdevice'),
	(39, 'Can delete TOTP device', 10, 'delete_totpdevice'),
	(40, 'Can view TOTP device', 10, 'view_totpdevice'),
	(41, 'Can add static device', 11, 'add_staticdevice'),
	(42, 'Can change static device', 11, 'change_staticdevice'),
	(43, 'Can delete static device', 11, 'delete_staticdevice'),
	(44, 'Can view static device', 11, 'view_staticdevice'),
	(45, 'Can add static token', 12, 'add_statictoken'),
	(46, 'Can change static token', 12, 'change_statictoken'),
	(47, 'Can delete static token', 12, 'delete_statictoken'),
	(48, 'Can view static token', 12, 'view_statictoken'),
	(49, 'Can add Perfil de Jugador', 13, 'add_playerprofile'),
	(50, 'Can change Perfil de Jugador', 13, 'change_playerprofile'),
	(51, 'Can delete Perfil de Jugador', 13, 'delete_playerprofile'),
	(52, 'Can view Perfil de Jugador', 13, 'view_playerprofile'),
	(53, 'Can add Puntuación', 14, 'add_gamescore'),
	(54, 'Can change Puntuación', 14, 'change_gamescore'),
	(55, 'Can delete Puntuación', 14, 'delete_gamescore'),
	(56, 'Can view Puntuación', 14, 'view_gamescore'),
	(57, 'Can add Tabla de Clasificación', 15, 'add_leaderboard'),
	(58, 'Can change Tabla de Clasificación', 15, 'change_leaderboard'),
	(59, 'Can delete Tabla de Clasificación', 15, 'delete_leaderboard'),
	(60, 'Can view Tabla de Clasificación', 15, 'view_leaderboard'),
	(61, 'Can add Pregunta Bola 8 Mágica', 16, 'add_magic8ballquestion'),
	(62, 'Can change Pregunta Bola 8 Mágica', 16, 'change_magic8ballquestion'),
	(63, 'Can delete Pregunta Bola 8 Mágica', 16, 'delete_magic8ballquestion'),
	(64, 'Can view Pregunta Bola 8 Mágica', 16, 'view_magic8ballquestion');

-- Volcando estructura para tabla dva.auth_user
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_user: ~2 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$870000$NOcy539dss3Ur9ecYXvCBm$Q7sycK4RPCWLH+j3uoRBsKrnOwJuPepzz+JDk+ZWI3s=', '2025-10-14 07:58:25.332196', 1, 'FunnyBunny', '', '', 'licht.smile002@gmail.com', 1, 1, '2025-10-12 01:09:13.885261'),
	(6, 'pbkdf2_sha256$870000$4gZCcnFA9nKtamk38KTCQL$s8pd/RWbP3l7TIciHYkevsxtYDbTK28FBjohBvRJkBI=', '2025-10-14 07:30:01.529457', 0, 'Jester', '', '', 'albertouchiha34@gmail.com', 0, 1, '2025-10-12 01:47:28.766171');

-- Volcando estructura para tabla dva.auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_user_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.django_admin_log
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.django_admin_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.django_content_type: ~15 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(8, 'account', 'emailaddress'),
	(9, 'account', 'emailconfirmation'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(14, 'games', 'gamescore'),
	(15, 'games', 'leaderboard'),
	(16, 'games', 'magic8ballquestion'),
	(13, 'games', 'playerprofile'),
	(11, 'otp_static', 'staticdevice'),
	(12, 'otp_static', 'statictoken'),
	(10, 'otp_totp', 'totpdevice'),
	(6, 'sessions', 'session'),
	(7, 'sites', 'site');

-- Volcando estructura para tabla dva.django_migrations
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.django_migrations: ~35 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-10-12 01:08:11.522451'),
	(2, 'auth', '0001_initial', '2025-10-12 01:08:12.023530'),
	(3, 'account', '0001_initial', '2025-10-12 01:08:12.153577'),
	(4, 'account', '0002_email_max_length', '2025-10-12 01:08:12.166613'),
	(5, 'account', '0003_alter_emailaddress_create_unique_verified_email', '2025-10-12 01:08:12.183652'),
	(6, 'account', '0004_alter_emailaddress_drop_unique_email', '2025-10-12 01:08:12.203359'),
	(7, 'account', '0005_emailaddress_idx_upper_email', '2025-10-12 01:08:12.219274'),
	(8, 'account', '0006_emailaddress_lower', '2025-10-12 01:08:12.227616'),
	(9, 'account', '0007_emailaddress_idx_email', '2025-10-12 01:08:12.254873'),
	(10, 'account', '0008_emailaddress_unique_primary_email_fixup', '2025-10-12 01:08:12.266354'),
	(11, 'account', '0009_emailaddress_unique_primary_email', '2025-10-12 01:08:12.270697'),
	(12, 'admin', '0001_initial', '2025-10-12 01:08:12.366978'),
	(13, 'admin', '0002_logentry_remove_auto_add', '2025-10-12 01:08:12.373503'),
	(14, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-12 01:08:12.378316'),
	(15, 'contenttypes', '0002_remove_content_type_name', '2025-10-12 01:08:12.433444'),
	(16, 'auth', '0002_alter_permission_name_max_length', '2025-10-12 01:08:12.474823'),
	(17, 'auth', '0003_alter_user_email_max_length', '2025-10-12 01:08:12.492278'),
	(18, 'auth', '0004_alter_user_username_opts', '2025-10-12 01:08:12.497943'),
	(19, 'auth', '0005_alter_user_last_login_null', '2025-10-12 01:08:12.543583'),
	(20, 'auth', '0006_require_contenttypes_0002', '2025-10-12 01:08:12.545806'),
	(21, 'auth', '0007_alter_validators_add_error_messages', '2025-10-12 01:08:12.550879'),
	(22, 'auth', '0008_alter_user_username_max_length', '2025-10-12 01:08:12.592508'),
	(23, 'auth', '0009_alter_user_last_name_max_length', '2025-10-12 01:08:12.636320'),
	(24, 'auth', '0010_alter_group_name_max_length', '2025-10-12 01:08:12.650203'),
	(25, 'auth', '0011_update_proxy_permissions', '2025-10-12 01:08:12.655592'),
	(26, 'auth', '0012_alter_user_first_name_max_length', '2025-10-12 01:08:12.701101'),
	(27, 'otp_static', '0001_initial', '2025-10-12 01:08:12.811408'),
	(28, 'otp_static', '0002_throttling', '2025-10-12 01:08:12.869943'),
	(29, 'otp_static', '0003_add_timestamps', '2025-10-12 01:08:12.903528'),
	(30, 'otp_totp', '0001_initial', '2025-10-12 01:08:12.955998'),
	(31, 'otp_totp', '0002_auto_20190420_0723', '2025-10-12 01:08:13.013127'),
	(32, 'otp_totp', '0003_add_timestamps', '2025-10-12 01:08:13.039541'),
	(33, 'sessions', '0001_initial', '2025-10-12 01:08:13.068321'),
	(34, 'sites', '0001_initial', '2025-10-12 01:08:13.080806'),
	(35, 'sites', '0002_alter_domain_unique', '2025-10-12 01:08:13.095843'),
	(36, 'games', '0001_initial', '2025-10-12 06:21:00.971755'),
	(37, 'games', '0002_magic8ballquestion', '2025-10-14 07:55:52.233428');

-- Volcando estructura para tabla dva.django_session
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.django_session: ~2 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('ord0hgpgcnm3scp87nndnznq8g6iv7w0', '.eJxVkM1uhDAMhN_FZ4QSkg2BU7evUVXIJKaJupBVEvqj1b57CeXCbTQefx75AWhMWJc84JodLdkbzD4sw0zZBZugf3vAv4Ye7pjSd4gWKsAMPW8VE41iktVCCtbxCmhGf9uSeBsp5rAa5x0K-fJR_NqEGZ7vFezHhjVRHHzhKjh5I5pPWuyOuRW7PkrWe-YYp_p6qvx6bJ1QDpPbOBq1aBlneit54doK3lpGShC2crwwLeS4yUm2Ro166gR2rBNc8LFELG8KNFFK5TP0c_fxF3qhGKugmXD4ougnT1vhHFd6_gEVfHEU:1v89Dc:fo9H1V3-pI1cddQU7f_NYhUjRnSAYmUgj_c3RbDK70I', '2025-10-13 04:27:28.603658'),
	('spfrhhg494wyxnua5xwtozbe61irf3px', '.eJyNkE1uhDAMhe_iNYpMCIlh1ek1qgqZJFOi8jMiQW01mruXtGxYtTvr8_Oz_e7A1i7bnDre0uDnFCynsMzd5NOwuAjtyx1-a2jhxjF-LKuDAjhBWxqNSpLCUlBNipQpwE8cxl06BjskEacwekT59JaxsMsEj-JPQ4O1qGTdlNW_DF8L6KKPMZ_tP29h_YK20og7zk91W_RrF_K6Ek6sZ_vu59zgccxYHGGIH83RjuJyiub5mDpZDRyH3UcaV1lEbiw53dS9NNYr1oZ6bXpHV2KSFjVJecWGaqz0VRE7r5tSSdd7eHwDK9mC7Q:1v8aA9:wDpF07U_1FpnXU82FW3-MG-BPy4JR-kPTXpV37RjAvs', '2025-10-14 09:13:41.921159');

-- Volcando estructura para tabla dva.django_site
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.django_site: ~0 rows (aproximadamente)
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'example.com', 'example.com');

-- Volcando estructura para tabla dva.games_gamescore
DROP TABLE IF EXISTS `games_gamescore`;
CREATE TABLE IF NOT EXISTS `games_gamescore` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `game_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int NOT NULL,
  `won` tinyint(1) NOT NULL,
  `attempts` int NOT NULL,
  `max_attempts` int NOT NULL,
  `time_elapsed` double NOT NULL,
  `hints_used` int NOT NULL,
  `played_at` datetime(6) NOT NULL,
  `player_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `games_games_score_f54657_idx` (`score` DESC),
  KEY `games_games_player__8a84d1_idx` (`player_id`,`played_at` DESC),
  KEY `games_games_game_ty_669558_idx` (`game_type`,`score` DESC),
  CONSTRAINT `games_gamescore_player_id_31f0981e_fk_games_playerprofile_id` FOREIGN KEY (`player_id`) REFERENCES `games_playerprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.games_gamescore: ~1 rows (aproximadamente)
INSERT INTO `games_gamescore` (`id`, `game_type`, `difficulty`, `score`, `won`, `attempts`, `max_attempts`, `time_elapsed`, `hints_used`, `played_at`, `player_id`) VALUES
	(1, 'number_guess', 'facil', 1800, 1, 4, 10, 30.898422, 0, '2025-10-14 05:29:26.688512', 1),
	(2, 'number_guess', 'medio', 1725, 1, 7, 8, 61.502557, 1, '2025-10-14 05:31:33.056847', 1),
	(3, 'number_guess', 'facil', 1250, 1, 8, 10, 105.375548, 1, '2025-10-14 08:13:41.918808', 2);

-- Volcando estructura para tabla dva.games_leaderboard
DROP TABLE IF EXISTS `games_leaderboard`;
CREATE TABLE IF NOT EXISTS `games_leaderboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `game_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leaderboard_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_score` int NOT NULL,
  `games_played` int NOT NULL,
  `games_won` int NOT NULL,
  `rank` int DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `player_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `games_leaderboard_player_id_game_type_lead_f5342977_uniq` (`player_id`,`game_type`,`leaderboard_type`),
  CONSTRAINT `games_leaderboard_player_id_a55133ad_fk_games_playerprofile_id` FOREIGN KEY (`player_id`) REFERENCES `games_playerprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.games_leaderboard: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.games_magic8ballquestion
DROP TABLE IF EXISTS `games_magic8ballquestion`;
CREATE TABLE IF NOT EXISTS `games_magic8ballquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asked_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `games_magic_user_id_bd349a_idx` (`user_id`,`asked_at` DESC),
  CONSTRAINT `games_magic8ballquestion_user_id_00e88b4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.games_magic8ballquestion: ~2 rows (aproximadamente)
INSERT INTO `games_magic8ballquestion` (`id`, `question`, `answer`, `answer_type`, `asked_at`, `user_id`) VALUES
	(1, 'Funciona?', 'Pregunta de nuevo más tarde', 'neutral', '2025-10-14 08:00:52.830525', 1),
	(2, 'No quieres hablar conmigo :(?', 'Las perspectivas no son buenas', 'negative', '2025-10-14 08:01:30.096398', 1),
	(3, 'No quieres responder bien verdad?', 'Todo indica que sí', 'positive', '2025-10-14 08:02:15.872454', 1);

-- Volcando estructura para tabla dva.games_playerprofile
DROP TABLE IF EXISTS `games_playerprofile`;
CREATE TABLE IF NOT EXISTS `games_playerprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `games_playerprofile_user_id_50c196b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.games_playerprofile: ~0 rows (aproximadamente)
INSERT INTO `games_playerprofile` (`id`, `nickname`, `avatar_color`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 'Rize', '#d80e0e', '2025-10-12 06:23:48.383289', '2025-10-12 06:23:48.383309', 6),
	(2, 'FunnyBunny', '#ae33db', '2025-10-14 07:58:31.202953', '2025-10-14 08:11:52.242478', 1);

-- Volcando estructura para tabla dva.otp_static_staticdevice
DROP TABLE IF EXISTS `otp_static_staticdevice`;
CREATE TABLE IF NOT EXISTS `otp_static_staticdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `throttling_failure_count` int unsigned NOT NULL,
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `otp_static_staticdevice_chk_1` CHECK ((`throttling_failure_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.otp_static_staticdevice: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.otp_static_statictoken
DROP TABLE IF EXISTS `otp_static_statictoken`;
CREATE TABLE IF NOT EXISTS `otp_static_statictoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` (`device_id`),
  KEY `otp_static_statictoken_token_d0a51866` (`token`),
  CONSTRAINT `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` FOREIGN KEY (`device_id`) REFERENCES `otp_static_staticdevice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.otp_static_statictoken: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dva.otp_totp_totpdevice
DROP TABLE IF EXISTS `otp_totp_totpdevice`;
CREATE TABLE IF NOT EXISTS `otp_totp_totpdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `key` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `step` smallint unsigned NOT NULL,
  `t0` bigint NOT NULL,
  `digits` smallint unsigned NOT NULL,
  `tolerance` smallint unsigned NOT NULL,
  `drift` smallint NOT NULL,
  `last_t` bigint NOT NULL,
  `user_id` int NOT NULL,
  `throttling_failure_count` int unsigned NOT NULL,
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` (`user_id`),
  CONSTRAINT `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `otp_totp_totpdevice_chk_1` CHECK ((`step` >= 0)),
  CONSTRAINT `otp_totp_totpdevice_chk_2` CHECK ((`digits` >= 0)),
  CONSTRAINT `otp_totp_totpdevice_chk_3` CHECK ((`tolerance` >= 0)),
  CONSTRAINT `otp_totp_totpdevice_chk_4` CHECK ((`throttling_failure_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dva.otp_totp_totpdevice: ~2 rows (aproximadamente)
INSERT INTO `otp_totp_totpdevice` (`id`, `name`, `confirmed`, `key`, `step`, `t0`, `digits`, `tolerance`, `drift`, `last_t`, `user_id`, `throttling_failure_count`, `throttling_failure_timestamp`, `created_at`, `last_used_at`) VALUES
	(1, 'default', 0, 'b7b404a86371e1d0970a5bfb2cde430042dbafd2', 30, 0, 6, 1, 0, -1, 6, 0, NULL, '2025-10-12 02:01:59.636323', NULL),
	(2, 'default', 1, '840216e8779370b499dfc602c48d52278d7ddfc1', 30, 0, 6, 1, 0, 58680900, 6, 0, NULL, '2025-10-12 02:02:36.630525', '2025-10-14 07:30:13.521523');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
