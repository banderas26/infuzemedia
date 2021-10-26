-- --------------------------------------------------------
-- Хост:                         mysql.local
-- Версия сервера:               10.5.8-MariaDB-1:10.5.8+maria~focal - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              10.2.0.5713
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных infuzemedia
CREATE DATABASE IF NOT EXISTS `infuzemedia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `infuzemedia`;

-- Дамп структуры для таблица infuzemedia.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(10) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `views_count` varchar(4) DEFAULT NULL,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы infuzemedia.user: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `ip`, `user_agent`, `view_date`, `views_count`, `url`) VALUES
	(1, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '2021-10-26 17:39:14', '1', 'http://infuzemedia.local/index1.html'),
	(2, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '2021-10-26 17:40:05', '2', 'http://infuzemedia.local/index2.html'),
	(3, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '2021-10-26 17:40:22', '2', 'http://infuzemedia.local/index2.html');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
