-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.12-MariaDB-0+deb11u1 - Debian 11
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for seer
CREATE DATABASE IF NOT EXISTS `seer` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `seer`;

-- Dumping structure for table seer.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table seer.categories: 3 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`, `category_name`, `category_description`) VALUES
	(1, 'Category #1', 'This is Category #1'),
	(2, 'Category #2', 'This is Category #2'),
	(3, 'Category #3', 'This is Category #3');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table seer.feedbacks
CREATE TABLE IF NOT EXISTS `feedbacks` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `feedback_post` text NOT NULL,
  `feedback_date` datetime NOT NULL DEFAULT current_timestamp(),
  `feedback_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table seer.feedbacks: 5 rows
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` (`feedback_id`, `uid`, `item_id`, `feedback_post`, `feedback_date`, `feedback_ip`) VALUES
	(1, 1, 1, 'This is the First Feedback Post', '2021-12-06 16:37:28', '188.161.236.70'),
	(2, 3, 1, '10/10 would recommend ', '2021-12-06 16:43:30', '199.250.149.47'),
	(3, 1, 2, 'Hey there! just testing out, nothing much here. thanks', '2021-12-08 20:23:08', '188.161.236.55'),
	(4, 1, 5, 'Hello There', '2021-12-08 20:41:20', '188.161.236.55'),
	(5, 6, 1, 'Nice item!', '2021-12-09 18:47:42', '197.61.152.80');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;

-- Dumping structure for table seer.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_short_description` varchar(130) NOT NULL,
  `item_description` text NOT NULL,
  `item_features` text DEFAULT NULL,
  `item_requirements` text DEFAULT NULL,
  `item_thumbnail` varchar(255) DEFAULT NULL,
  `item_file` varchar(255) DEFAULT NULL,
  `item_price` decimal(10,0) NOT NULL,
  `item_status` varchar(20) DEFAULT NULL,
  `item_ip` varchar(15) DEFAULT NULL,
  `item_edit_ip` varchar(15) DEFAULT NULL,
  `item_upload_time` datetime NOT NULL DEFAULT current_timestamp(),
  `item_edit_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `uid` (`uid`),
  KEY `fk_category_items` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table seer.items: 10 rows
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`, `uid`, `category_id`, `item_name`, `item_short_description`, `item_description`, `item_features`, `item_requirements`, `item_thumbnail`, `item_file`, `item_price`, `item_status`, `item_ip`, `item_edit_ip`, `item_upload_time`, `item_edit_time`) VALUES
	(1, 1, 1, 'Item #1', 'This is Item #1', 'This is a Description\r\nThis is a Description\r\nThis is a Description\r\nThis is a Description\r\nThis is a Description\r\nThis is a Description', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-1.jpg', 'uploads/Files/file-1.zip', 2, 'Approved', '194.58.247.157', '188.161.236.55', '2021-11-29 02:44:25', '12/09/2021 11:00:17'),
	(2, 1, 2, 'Item #2', 'Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-2.jpg', 'uploads/Files/file-2.zip', 4, 'Approved', '194.58.247.157', NULL, '2021-11-29 02:52:37', NULL),
	(3, 1, 3, 'Item #3', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-3.jpg', 'uploads/Files/file-3.zip', 6, 'Approved', '194.58.247.157', NULL, '2021-11-29 02:53:24', NULL),
	(4, 1, 1, 'Item #4', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-4.jpg', 'uploads/Files/file-4.zip', 8, 'Approved', '194.58.247.157', NULL, '2021-11-29 02:54:04', NULL),
	(5, 1, 2, 'Item #5', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-5.jpg', 'uploads/Files/file-5.zip', 10, 'Approved', '194.58.247.157', NULL, '2021-11-29 02:54:58', NULL),
	(6, 1, 3, 'Item #6', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-6.jpg', 'uploads/Files/file-6.zip', 12, 'Approved', '194.58.247.157', NULL, '2021-11-29 02:55:57', NULL),
	(7, 1, 1, 'Item #7', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-7.jpg', 'uploads/Files/file-7.zip', 14, 'Unapproved', '194.58.247.157', NULL, '2021-11-29 03:00:01', NULL),
	(8, 1, 2, 'Item #8', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-8.jpg', 'uploads/Files/file-8.zip', 16, 'Unapproved', '194.58.247.157', NULL, '2021-11-29 03:00:49', NULL),
	(9, 1, 3, 'Item #9', 'This is Short Description', 'This is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\nThis is a Long Description \r\n', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-9.jpg', 'uploads/Files/file-9.zip', 18, 'Unapproved', '194.58.247.157', NULL, '2021-11-29 03:01:45', NULL),
	(10, 1, 1, 'Item #10', 'This is Short Description', 'This is a Long Description ', '- Feature \r\n- Feature \r\n- Feature \r\n- Feature \r\n', '- Requirement\r\n- Requirement\r\n- Requirement\r\n- Requirement\r\n', 'uploads/thumbnails/img-10.jpg', 'uploads/Files/file-10.zip', 20, 'Unapproved', '194.58.247.157', NULL, '2021-11-29 03:02:27', NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table seer.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `log_uid` int(11) NOT NULL,
  `log_type` varchar(30) NOT NULL,
  `log_action` varchar(255) DEFAULT NULL,
  `log_date` datetime DEFAULT current_timestamp(),
  `log_ip` varchar(15) NOT NULL,
  `log_information` varchar(255) NOT NULL,
  KEY `log_uid` (`log_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table seer.logs: 20 rows
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`log_uid`, `log_type`, `log_action`, `log_date`, `log_ip`, `log_information`) VALUES
	(1, 'users', 'Edited User', '2021-11-30 04:26:37', 'Hidden', 'User ID: 3, User: AmeerRishmawi'),
	(1, 'items', 'Approved Item', '2021-11-30 04:27:57', 'Hidden', 'Item ID: 10'),
	(3, 'users', 'Deleted User', '2021-11-30 07:10:16', '93.184.6.34', 'User ID: 4'),
	(1, 'categories', 'Edited Category', '2021-11-30 04:31:43', 'Hidden', 'Category ID: 3'),
	(1, 'users', 'Edited User', '2021-11-30 04:34:06', 'Hidden', 'User ID: 1, User: amir'),
	(1, 'users', 'Created New User', '2021-11-30 04:38:42', 'Hidden', 'Username: test'),
	(1, 'users', 'Created New User', '2021-12-07 19:13:20', 'Hidden', 'Username: demo'),
	(1, 'users', 'Edited User', '2021-11-30 04:26:37', 'Hidden', 'User ID: 3, User: AmeerRishmawi'),
	(1, 'items', 'Approved Item', '2021-11-30 04:27:57', 'Hidden', 'Item ID: 10'),
	(3, 'users', 'Deleted User', '2021-11-30 07:10:16', '93.184.6.34', 'User ID: 4'),
	(1, 'categories', 'Edited Category', '2021-11-30 04:31:43', 'Hidden', 'Category ID: 3'),
	(1, 'users', 'Edited User', '2021-11-30 04:34:06', 'Hidden', 'User ID: 1, User: amir'),
	(1, 'users', 'Created New User', '2021-11-30 04:38:42', 'Hidden', 'Username: test'),
	(1, 'users', 'Created New User', '2021-12-07 19:13:20', 'Hidden', 'Username: demo'),
	(1, 'users', 'Edited User', '2021-12-09 18:41:02', 'Hidden', 'User Type: "user" to "admin", User: RVRKing'),
	(6, 'users', 'Deleted User', '2021-12-09 18:54:24', '197.61.152.80', 'User ID: 5'),
	(1, 'items', 'Edited Item', '2021-12-09 23:00:17', 'Hidden', 'Item ID: 1'),
	(1, 'items', 'Approved Item', '2021-12-12 09:13:45', '93.184.6.34', 'Item ID: 11'),
	(1, 'items', 'Deleted Item', '2021-12-12 09:18:12', '93.184.6.34', 'Item ID: 11'),
	(1, 'users', 'Edited User', '2021-12-14 18:38:35', '188.161.236.55', 'Changed Password, User: demo');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table seer.replies
CREATE TABLE IF NOT EXISTS `replies` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `reply_post` text NOT NULL,
  `reply_date` datetime DEFAULT current_timestamp(),
  `reply_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `feedback_id` (`feedback_id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table seer.replies: 6 rows
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` (`reply_id`, `feedback_id`, `uid`, `item_id`, `reply_post`, `reply_date`, `reply_ip`) VALUES
	(1, 2, 1, 1, 'Just Testing Replies Out, thank you', '2021-12-08 15:04:16', 'Hidden'),
	(2, 2, 1, 1, 'is it still working?', '2021-12-08 15:05:11', 'Hidden'),
	(3, 2, 3, 1, 'Nice info', '2021-12-08 15:12:44', '199.250.147.102'),
	(4, 3, 1, 2, 'is reply still working? i hope so!', '2021-12-08 20:24:17', '188.161.236.55'),
	(5, 4, 1, 5, 'Hey...', '2021-12-08 20:41:26', '188.161.236.55'),
	(6, 2, 6, 1, 'Absolutely', '2021-12-09 18:47:51', '197.61.152.80');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;

-- Dumping structure for table seer.users
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(30) NOT NULL DEFAULT 'user',
  `user_avatar` varchar(255) NOT NULL DEFAULT 'assets/images/blank.png',
  `user_title` varchar(255) NOT NULL DEFAULT 'Default Title',
  `created_at` datetime DEFAULT current_timestamp(),
  `registered_ip` varchar(15) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table seer.users: 5 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`, `username`, `email`, `password`, `user_type`, `user_avatar`, `user_title`, `created_at`, `registered_ip`, `last_ip`, `last_login`, `full_name`, `website`, `gender`, `country`, `bio`) VALUES
	(1, 'amir', 'alatrashamir3772@gmail.com', '$2y$10$10VK.JfsfTefC2dYDaUfteXDB.orTAXmbPzL8ycxkH/fUY7KVCxY6', 'admin', 'https://i.imgur.com/kwyytoF.png', 'Web Developer', '2021-11-29 02:37:12', 'Hidden', '188.161.236.55', '2021-12-14 20:26:16', 'Amir Alatrash', 'https://amiralatrash.info', 'Male', 'Palestine', 'My name is Amir Alatrash, I am 21 years old and I currently reside in Bethlehem, Palestine. I indulged in web-development approximately 5 years ago and have been improving tremendously ever since. My knowledge is comprised of many branches, such as NodeJS, PHP, SQL and other branches.'),
	(2, 'dana', 'danamnofal@gmail.com', '$2y$10$9DmkB956CINQ5DhS2F0Mu.oFefpaKoaU1MP0NgkrSnlPlRlvoxQqu', 'admin', 'assets/images/blank.png', 'QA', '2021-11-29 09:35:17', '213.6.103.18', '213.6.103.18', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'AmeerRishmawi', 'WnAGtSmBoYyy@gmail.com', '$2y$10$RB6gHn9eW6Atb0ZTWdAnaesY.aLhIVFVY9XVW66SHEcsZq6JjolpC', 'admin', 'assets/images/blank.png', 'Co-Founder', '2021-11-29 22:16:20', '201.52.117.1', '199.250.155.218', '2021-12-11 15:23:12', 'Ameer Rishmawi', NULL, 'Male', 'Palestine', 'just a normal guy'),
	(5, 'demo', 'demo@demo.com', '$2y$10$4c/V.I8hoxHQEvfJmgT4TunAW3mwZ5MNg/CNO9YClo1mdMTi6FTXK', 'user', 'assets/images/blank.png', 'Default Title', '2021-12-07 19:13:20', NULL, '188.161.236.55', '2021-12-14 18:38:57', NULL, NULL, NULL, NULL, NULL),
	(6, 'RVRKing', 'rasheed.khd95@gmail.com', '$2y$10$0G4k8iIAILH5ZCqp.QT45e7uNzGNLl1X0Oipwdq.pryHD98xeHYQi', 'admin', 'assets/images/blank.png', 'RV Realm Overlord', '2021-12-09 18:40:26', '197.61.152.80', '197.61.152.80', '2021-12-09 18:44:49', 'Rasheed K Dana', 'https://rvrealm.com', 'Male', 'Jordan', 'Awesome being');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
