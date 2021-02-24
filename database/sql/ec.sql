/*
Navicat MySQL Data Transfer

Source Server         : wormhole
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ec

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2021-02-23 17:27:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_name` varchar(150) DEFAULT NULL,
  `access_desc` text,
  PRIMARY KEY (`access_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of access
-- ----------------------------

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type` int(11) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `overall_score` double DEFAULT NULL,
  `quarter` int(11) DEFAULT NULL,
  `ss_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`activity_id`) USING BTREE,
  KEY `activity_type` (`activity_type`) USING BTREE,
  KEY `ss_id` (`ss_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of activities
-- ----------------------------

-- ----------------------------
-- Table structure for activity_grades
-- ----------------------------
DROP TABLE IF EXISTS `activity_grades`;
CREATE TABLE `activity_grades` (
  `agrade_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `student_id` int(11) unsigned DEFAULT NULL,
  `score` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`agrade_id`) USING BTREE,
  KEY `activity_id` (`activity_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  CONSTRAINT `activity_grades_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of activity_grades
-- ----------------------------

-- ----------------------------
-- Table structure for activity_types
-- ----------------------------
DROP TABLE IF EXISTS `activity_types`;
CREATE TABLE `activity_types` (
  `atype_id` int(11) NOT NULL AUTO_INCREMENT,
  `atype_name` varchar(255) DEFAULT NULL,
  `atype_for` varchar(50) DEFAULT NULL,
  `class_type` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `abv` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`atype_id`) USING BTREE,
  KEY `class_type` (`class_type`) USING BTREE,
  CONSTRAINT `activity_types_ibfk_1` FOREIGN KEY (`class_type`) REFERENCES `class_type` (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of activity_types
-- ----------------------------
INSERT INTO `activity_types` VALUES ('1', 'Quiz', 'lec', '1', '10', null, '1', 'QUIZZES', '2020-12-01 14:40:11', '2020-12-01 15:40:11');
INSERT INTO `activity_types` VALUES ('3', 'Exam', 'lec', '1', '60', null, '3', 'EXAM', '2020-12-01 14:40:11', '2020-12-01 15:40:11');
INSERT INTO `activity_types` VALUES ('4', 'Machine Activity', 'lab', '1', '40', null, '4', 'MACHINE ACTIVITY', '2020-09-20 14:08:36', '2020-09-20 14:08:38');
INSERT INTO `activity_types` VALUES ('5', 'Lab Exam', 'lab', '1', '50', null, '6', 'EXAM', '2020-09-20 14:08:40', '2020-09-20 14:08:42');
INSERT INTO `activity_types` VALUES ('6', 'Class Standing', 'lec', '1', '30', null, '2', 'CS', '2020-12-01 14:40:11', '2020-12-01 15:40:11');
INSERT INTO `activity_types` VALUES ('7', 'Class Standing', 'lab', '1', '10', null, '5', 'CS', '2020-09-20 14:08:51', '2020-09-20 14:08:53');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `att_sched` int(11) DEFAULT NULL,
  `att_date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES ('38', '3844', '2021-02-22 02:31:36', 'lec', '2021-02-22 02:31:36', '2021-02-22 02:31:36');
INSERT INTO `attendances` VALUES ('39', '3848', '2021-02-22 03:08:44', 'lec', '2021-02-22 03:08:44', '2021-02-22 03:08:44');
INSERT INTO `attendances` VALUES ('40', '3844', '2021-02-23 03:12:09', 'lec', '2021-02-23 03:12:09', '2021-02-23 03:12:09');
INSERT INTO `attendances` VALUES ('41', '3845', '2021-02-22 03:31:08', 'lec', '2021-02-22 03:31:08', '2021-02-22 03:31:08');
INSERT INTO `attendances` VALUES ('42', '3861', '2021-02-22 05:26:39', 'lec', '2021-02-22 05:26:39', '2021-02-22 05:26:39');
INSERT INTO `attendances` VALUES ('43', '3850', '2021-02-22 05:29:12', 'lec', '2021-02-22 05:29:12', '2021-02-22 05:29:12');
INSERT INTO `attendances` VALUES ('44', '3845', '2021-02-23 00:23:12', 'lec', '2021-02-23 00:23:12', '2021-02-23 00:23:12');
INSERT INTO `attendances` VALUES ('45', '3848', '2021-02-23 00:25:14', 'lec', '2021-02-23 00:25:14', '2021-02-23 00:25:14');
INSERT INTO `attendances` VALUES ('46', '3850', '2021-02-23 04:56:56', 'lec', '2021-02-23 04:56:56', '2021-02-23 04:56:56');

-- ----------------------------
-- Table structure for attendance_remarks
-- ----------------------------
DROP TABLE IF EXISTS `attendance_remarks`;
CREATE TABLE `attendance_remarks` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT,
  `sa_id` int(11) DEFAULT NULL,
  `remarks` text,
  `remark_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ar_id`) USING BTREE,
  KEY `sa_id` (`sa_id`) USING BTREE,
  CONSTRAINT `attendance_remarks_ibfk_1` FOREIGN KEY (`sa_id`) REFERENCES `student_attendance` (`sa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of attendance_remarks
-- ----------------------------
INSERT INTO `attendance_remarks` VALUES ('6', '5', 'this is a remark', '2021-02-23 03:38:52', '2021-02-23 03:38:52', '2021-02-23 03:38:52');
INSERT INTO `attendance_remarks` VALUES ('7', '5', 'this is a new remark', '2021-02-23 03:41:35', '2021-02-23 03:41:35', '2021-02-23 03:41:35');
INSERT INTO `attendance_remarks` VALUES ('8', '5', 'and another one...', '2021-02-23 03:46:50', '2021-02-23 03:46:50', '2021-02-23 03:46:50');
INSERT INTO `attendance_remarks` VALUES ('9', '15', 'yo', '2021-02-23 04:56:56', '2021-02-23 04:56:56', '2021-02-23 04:56:56');
INSERT INTO `attendance_remarks` VALUES ('10', '15', 'wazzup!', '2021-02-23 04:56:56', '2021-02-23 04:56:56', '2021-02-23 04:56:56');
INSERT INTO `attendance_remarks` VALUES ('11', '16', 'you are awesome!', '2021-02-23 04:56:56', '2021-02-23 04:56:56', '2021-02-23 04:56:56');
INSERT INTO `attendance_remarks` VALUES ('12', '16', 'and perfectly proportioned', '2021-02-23 04:56:56', '2021-02-23 04:56:56', '2021-02-23 04:56:56');
INSERT INTO `attendance_remarks` VALUES ('13', '16', 'nah! just kidding...', '2021-02-23 04:57:18', '2021-02-23 04:57:18', '2021-02-23 04:57:18');
INSERT INTO `attendance_remarks` VALUES ('14', '11', 'what I\'m trying to say is...', '2021-02-23 05:08:53', '2021-02-23 05:08:53', '2021-02-23 05:08:53');

-- ----------------------------
-- Table structure for chats
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_message` text,
  `chat_from_teacher` varchar(155) DEFAULT NULL,
  `chat_from_student` int(11) unsigned DEFAULT NULL,
  `chat_room` int(11) DEFAULT NULL,
  `chat_date` datetime DEFAULT NULL,
  PRIMARY KEY (`chat_id`) USING BTREE,
  KEY `chat_from_teacher` (`chat_from_teacher`) USING BTREE,
  KEY `chat_from_student` (`chat_from_student`) USING BTREE,
  KEY `chat_room` (`chat_room`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of chats
-- ----------------------------

-- ----------------------------
-- Table structure for class_type
-- ----------------------------
DROP TABLE IF EXISTS `class_type`;
CREATE TABLE `class_type` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ct_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of class_type
-- ----------------------------
INSERT INTO `class_type` VALUES ('1', 'College');
INSERT INTO `class_type` VALUES ('2', 'Senior High');

-- ----------------------------
-- Table structure for complaints
-- ----------------------------
DROP TABLE IF EXISTS `complaints`;
CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_details` text,
  `complaint_by` varchar(150) DEFAULT NULL,
  `complaint_to` int(11) unsigned DEFAULT NULL,
  `complaint_date` datetime DEFAULT NULL,
  `complaint_status` int(11) DEFAULT NULL,
  `complaint_sched` int(11) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`) USING BTREE,
  KEY `complaint_status` (`complaint_status`) USING BTREE,
  KEY `complaint_by` (`complaint_by`) USING BTREE,
  KEY `complaint_to` (`complaint_to`) USING BTREE,
  KEY `complaints_ibfk_1` (`complaint_sched`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of complaints
-- ----------------------------
INSERT INTO `complaints` VALUES ('8', 'no uniform!', 'BTN-2019-03139', '23318', '2020-07-07 10:21:33', null, '2930');
INSERT INTO `complaints` VALUES ('9', 'absenos ning bataa', 'BTN-2019-03139', '23318', '2020-07-07 10:22:21', null, '2930');
INSERT INTO `complaints` VALUES ('10', 'bulokon ning studyanteha', 'BTN-2019-03139', '23302', '2020-07-07 10:23:05', null, '2930');
INSERT INTO `complaints` VALUES ('11', 'no comment!', 'BTN-2019-03139', '23304', '2020-07-07 10:25:34', null, '2929');
INSERT INTO `complaints` VALUES ('12', 'July 3, 2020 - Test', 'BTN-2019-03139', '23305', '2020-07-07 14:59:55', null, '2929');
INSERT INTO `complaints` VALUES ('13', 'another remark', 'BTN-2019-03139', '23318', '2020-07-06 15:02:42', null, '2929');
INSERT INTO `complaints` VALUES ('14', 'fsdfsdf', 'BTN-2019-03139', '23318', '2020-07-07 10:42:43', null, '2929');
INSERT INTO `complaints` VALUES ('15', 'sfdsfsdfds', 'BTN-2019-03139', '23318', '2020-07-08 14:26:45', null, '2929');
INSERT INTO `complaints` VALUES ('16', 'no comment', 'BTN-2019-03139', '23318', '2020-07-08 14:27:19', null, '2929');
INSERT INTO `complaints` VALUES ('17', 'another remark', 'BTN-2019-03139', '23318', '2020-07-08 14:28:23', null, '2929');
INSERT INTO `complaints` VALUES ('18', 'please reply', 'BTN-2019-03139', '23318', '2020-07-08 15:11:34', null, '2929');
INSERT INTO `complaints` VALUES ('19', 'this is a new reply', 'BTN-2019-03139', '23302', '2020-07-08 15:11:54', null, '2929');
INSERT INTO `complaints` VALUES ('20', 'fsdsd', 'BTN-2019-03139', '23303', '2020-07-17 09:35:04', null, '2934');
INSERT INTO `complaints` VALUES ('21', 'jhhj', 'BTN-2019-03139', '23304', '2020-07-21 10:50:35', null, '2929');
INSERT INTO `complaints` VALUES ('22', 'dsdsads', 'BTN-2017-0378', '14600', '2020-10-26 15:21:13', null, '3074');

-- ----------------------------
-- Table structure for complaint_status
-- ----------------------------
DROP TABLE IF EXISTS `complaint_status`;
CREATE TABLE `complaint_status` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cs_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of complaint_status
-- ----------------------------

-- ----------------------------
-- Table structure for eclass_users
-- ----------------------------
DROP TABLE IF EXISTS `eclass_users`;
CREATE TABLE `eclass_users` (
  `ec_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `employee_id` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ec_user_id`) USING BTREE,
  KEY `eclass_users_ibfk_1` (`employee_id`) USING BTREE,
  CONSTRAINT `eclass_users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of eclass_users
-- ----------------------------

-- ----------------------------
-- Table structure for file_extensions
-- ----------------------------
DROP TABLE IF EXISTS `file_extensions`;
CREATE TABLE `file_extensions` (
  `file_ext_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_extension` varchar(255) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_ext_id`) USING BTREE,
  KEY `file_type` (`file_type`) USING BTREE,
  CONSTRAINT `file_extensions_ibfk_1` FOREIGN KEY (`file_type`) REFERENCES `file_types` (`f_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of file_extensions
-- ----------------------------
INSERT INTO `file_extensions` VALUES ('1', 'avi', '2');
INSERT INTO `file_extensions` VALUES ('2', 'flv', '2');
INSERT INTO `file_extensions` VALUES ('3', 'mp4', '2');
INSERT INTO `file_extensions` VALUES ('4', 'mov', '2');
INSERT INTO `file_extensions` VALUES ('5', 'wmv', '2');
INSERT INTO `file_extensions` VALUES ('6', 'jpeg', '1');
INSERT INTO `file_extensions` VALUES ('7', 'jpg', '1');
INSERT INTO `file_extensions` VALUES ('8', 'png', '1');
INSERT INTO `file_extensions` VALUES ('9', 'gif', '1');
INSERT INTO `file_extensions` VALUES ('10', 'bmp', '1');
INSERT INTO `file_extensions` VALUES ('11', 'mp3', '4');
INSERT INTO `file_extensions` VALUES ('12', 'wav', '4');
INSERT INTO `file_extensions` VALUES ('13', 'doc', '3');
INSERT INTO `file_extensions` VALUES ('14', 'docx', '3');
INSERT INTO `file_extensions` VALUES ('15', 'xls', '5');
INSERT INTO `file_extensions` VALUES ('16', 'xlsx', '5');
INSERT INTO `file_extensions` VALUES ('17', 'pdf', '6');
INSERT INTO `file_extensions` VALUES ('18', 'ppt', '7');
INSERT INTO `file_extensions` VALUES ('19', 'pptx', '7');
INSERT INTO `file_extensions` VALUES ('20', 'txt', '8');
INSERT INTO `file_extensions` VALUES ('21', 'zip', '9');
INSERT INTO `file_extensions` VALUES ('22', 'rar', '9');
INSERT INTO `file_extensions` VALUES ('24', 'vnd.openxmlformats-officedocument.wordprocessingml.document', '3');
INSERT INTO `file_extensions` VALUES ('25', 'x-m4a', '2');
INSERT INTO `file_extensions` VALUES ('26', 'm4a', '2');

-- ----------------------------
-- Table structure for file_sections
-- ----------------------------
DROP TABLE IF EXISTS `file_sections`;
CREATE TABLE `file_sections` (
  `sf_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `ss_id` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  PRIMARY KEY (`sf_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE,
  KEY `ss_id` (`ss_id`) USING BTREE,
  CONSTRAINT `file_sections_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`uf_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of file_sections
-- ----------------------------
INSERT INTO `file_sections` VALUES ('26', '31', '2423', '2');
INSERT INTO `file_sections` VALUES ('27', '31', '2423', '1');
INSERT INTO `file_sections` VALUES ('34', '33', '2653', '1');
INSERT INTO `file_sections` VALUES ('35', '34', '3048', '1');
INSERT INTO `file_sections` VALUES ('36', '34', '3048', '2');

-- ----------------------------
-- Table structure for file_types
-- ----------------------------
DROP TABLE IF EXISTS `file_types`;
CREATE TABLE `file_types` (
  `f_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_type` varchar(255) DEFAULT NULL,
  `f_icon` varchar(300) DEFAULT NULL,
  `f_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`f_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of file_types
-- ----------------------------
INSERT INTO `file_types` VALUES ('1', 'Image', 'fa fa-file-image-o', 'jpg.png');
INSERT INTO `file_types` VALUES ('2', 'Video', 'fa fa-file-video-o', 'mov.png');
INSERT INTO `file_types` VALUES ('3', 'Document', 'fa fa-file-word-o', 'doc.png');
INSERT INTO `file_types` VALUES ('4', 'Audio', 'fa fa-file-audio-o', 'mp3.png');
INSERT INTO `file_types` VALUES ('5', 'Spreadsheet', 'fa fa-file-excel-o', 'xls.png');
INSERT INTO `file_types` VALUES ('6', 'PDF', 'fa fa-file-pdf-o', 'pdf.png');
INSERT INTO `file_types` VALUES ('7', 'Presentation', 'fa fa-file-powerpoint-o', 'ppt.png');
INSERT INTO `file_types` VALUES ('8', 'Text', 'fa fa-file-code-o', 'txt.png');
INSERT INTO `file_types` VALUES ('9', 'Zip', 'fa fa-file-zip-o', 'zip.png');

-- ----------------------------
-- Table structure for final_grade
-- ----------------------------
DROP TABLE IF EXISTS `final_grade`;
CREATE TABLE `final_grade` (
  `fgrade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` double DEFAULT NULL,
  `spi_id` int(11) unsigned DEFAULT NULL,
  `ss_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fgrade_id`) USING BTREE,
  KEY `spi_id` (`spi_id`) USING BTREE,
  KEY `ss_id` (`ss_id`) USING BTREE,
  CONSTRAINT `final_grade_ibfk_2` FOREIGN KEY (`ss_id`) REFERENCES `sched_subj` (`ss_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of final_grade
-- ----------------------------

-- ----------------------------
-- Table structure for grade_transmutation
-- ----------------------------
DROP TABLE IF EXISTS `grade_transmutation`;
CREATE TABLE `grade_transmutation` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` double DEFAULT NULL,
  `end` double DEFAULT NULL,
  `eq` int(11) DEFAULT NULL,
  PRIMARY KEY (`trans_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of grade_transmutation
-- ----------------------------

-- ----------------------------
-- Table structure for grading_settings
-- ----------------------------
DROP TABLE IF EXISTS `grading_settings`;
CREATE TABLE `grading_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of grading_settings
-- ----------------------------
INSERT INTO `grading_settings` VALUES ('11', 'lecture', '60', '2020-12-01 14:40:11', '2020-12-01 15:40:11');
INSERT INTO `grading_settings` VALUES ('12', 'laboratory', '40', '2020-09-20 17:00:15', '2020-09-20 17:00:15');

-- ----------------------------
-- Table structure for memos
-- ----------------------------
DROP TABLE IF EXISTS `memos`;
CREATE TABLE `memos` (
  `memo_id` int(11) NOT NULL AUTO_INCREMENT,
  `memo_title` varchar(250) DEFAULT NULL,
  `memo_body` text,
  `memo_date` datetime DEFAULT NULL,
  `memo_sender` int(11) DEFAULT NULL,
  PRIMARY KEY (`memo_id`) USING BTREE,
  KEY `memo_sender` (`memo_sender`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of memos
-- ----------------------------

-- ----------------------------
-- Table structure for periodic_schedule
-- ----------------------------
DROP TABLE IF EXISTS `periodic_schedule`;
CREATE TABLE `periodic_schedule` (
  `psched_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_name` varchar(250) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sem` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`psched_id`) USING BTREE,
  KEY `department` (`department`) USING BTREE,
  CONSTRAINT `periodic_schedule_ibfk_1` FOREIGN KEY (`department`) REFERENCES `class_type` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of periodic_schedule
-- ----------------------------
INSERT INTO `periodic_schedule` VALUES ('1', 'Prelim', '2020-08-10', '2020-09-18', '1', '20', '2021-01-29 10:35:31', '2021-01-29 10:35:31', '1');
INSERT INTO `periodic_schedule` VALUES ('2', 'Midterm', '2020-09-21', '2020-10-23', '1', '20', '2021-01-29 10:35:32', '2021-01-29 10:35:32', '1');
INSERT INTO `periodic_schedule` VALUES ('3', 'Pre Final', '2020-10-26', '2020-11-30', '1', '20', '2021-01-29 10:35:32', '2021-01-29 10:35:32', '2');
INSERT INTO `periodic_schedule` VALUES ('4', 'Final', '2020-11-02', '2020-12-18', '1', '40', '2021-01-29 10:35:35', '2021-01-29 10:35:35', '2');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_content` text,
  `post_date` datetime DEFAULT NULL,
  `post_sender` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  KEY `post_sender` (`post_sender`) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_sender`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'Life isn\'t about finding yourself. Life is about creating yourself.', '2018-03-08 01:01:29', 'BTN-2012-0213');
INSERT INTO `posts` VALUES ('2', 'If you\'re hotter than me, then that means I\'m cooler than you.', '2018-03-08 07:39:50', 'BTN-2012-0213');
INSERT INTO `posts` VALUES ('3', 'fsdfsfdsf', '2018-04-10 10:40:07', 'BTN-2012-0213');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` text,
  `post_id` int(11) DEFAULT NULL,
  `stud_id` int(11) unsigned DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `employee_id` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  KEY `stud_id` (`stud_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE,
  CONSTRAINT `replies_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `replies_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES ('1', 'is that so?', '2', null, '2018-03-09 01:41:51', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('2', 'but i don\'t understand', '2', null, '2018-03-12 01:03:04', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('3', 'How is this even possible?', '2', null, '2018-03-12 01:22:54', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('4', 'Are you sure about this?', '2', null, '2018-03-12 01:24:32', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('5', 'Havana oh nana...', '2', null, '2018-03-12 01:27:05', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('6', 'finally?', '2', null, '2018-03-12 01:31:01', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('7', 'is that right?', '1', null, '2018-03-19 01:08:59', 'BTN-2012-0213');
INSERT INTO `replies` VALUES ('8', 'gfgdfgdfg', '2', null, '2018-04-10 10:39:59', 'BTN-2012-0213');

-- ----------------------------
-- Table structure for student_attendance
-- ----------------------------
DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE `student_attendance` (
  `sa_id` int(11) NOT NULL AUTO_INCREMENT,
  `stud_id` int(11) unsigned DEFAULT NULL,
  `att_id` int(11) DEFAULT NULL,
  `att_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sa_id`) USING BTREE,
  KEY `stud_id` (`stud_id`) USING BTREE,
  KEY `att_id` (`att_id`) USING BTREE,
  CONSTRAINT `student_attendance_ibfk_2` FOREIGN KEY (`att_id`) REFERENCES `attendances` (`att_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student_attendance
-- ----------------------------
INSERT INTO `student_attendance` VALUES ('2', '24616', '38', 'present', '2021-02-22 13:20:07', '2021-02-22 05:20:07');
INSERT INTO `student_attendance` VALUES ('3', '24616', '39', 'absent', '2021-02-22 13:25:22', '2021-02-22 05:25:22');
INSERT INTO `student_attendance` VALUES ('4', '24617', '39', 'present', '2021-02-22 13:25:29', '2021-02-22 05:25:29');
INSERT INTO `student_attendance` VALUES ('5', '24616', '40', 'absent', '2021-02-23 17:24:05', '2021-02-23 09:24:05');
INSERT INTO `student_attendance` VALUES ('6', '24616', '41', 'present', '2021-02-22 13:21:54', '2021-02-22 05:21:54');
INSERT INTO `student_attendance` VALUES ('7', '24617', '41', 'present', '2021-02-22 03:31:08', '2021-02-22 03:31:08');
INSERT INTO `student_attendance` VALUES ('8', '24617', '42', 'late', '2021-02-22 05:26:39', '2021-02-22 05:26:39');
INSERT INTO `student_attendance` VALUES ('9', '24616', '43', 'late', '2021-02-22 05:29:12', '2021-02-22 05:29:12');
INSERT INTO `student_attendance` VALUES ('10', '24617', '43', 'present', '2021-02-22 05:29:12', '2021-02-22 05:29:12');
INSERT INTO `student_attendance` VALUES ('11', '24616', '44', 'present', '2021-02-23 13:08:27', '2021-02-23 05:08:27');
INSERT INTO `student_attendance` VALUES ('12', '24617', '44', 'present', '2021-02-23 13:38:19', '2021-02-23 05:38:19');
INSERT INTO `student_attendance` VALUES ('13', '24616', '45', 'absent', '2021-02-23 08:25:35', '2021-02-23 00:25:35');
INSERT INTO `student_attendance` VALUES ('14', '24617', '45', 'present', '2021-02-23 10:16:46', '2021-02-23 02:16:46');
INSERT INTO `student_attendance` VALUES ('15', '24616', '46', 'present', '2021-02-23 04:56:56', '2021-02-23 04:56:56');
INSERT INTO `student_attendance` VALUES ('16', '24617', '46', 'late', '2021-02-23 12:57:18', '2021-02-23 04:57:18');

-- ----------------------------
-- Table structure for uploaded_files
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_files`;
CREATE TABLE `uploaded_files` (
  `uf_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_exp_date` datetime DEFAULT NULL,
  `file_desc` text,
  `file_temp_name` varchar(255) DEFAULT NULL,
  `uploaded_by` varchar(155) DEFAULT NULL,
  `file_ext` int(11) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`uf_id`) USING BTREE,
  KEY `uploaded_by` (`uploaded_by`) USING BTREE,
  KEY `file_ext` (`file_ext`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of uploaded_files
-- ----------------------------
INSERT INTO `uploaded_files` VALUES ('28', '', '2020-06-15 00:00:00', null, 'assets/admin/layout2/img/learning_materials\\$2y$10$1Ai9bfBFhJx1eJRVKDTAzu1Q8BeoIFgnXsCtZwZ7G4M084mCl3bBu.PNG', '220', null, '2020-06-15 00:00:00');
INSERT INTO `uploaded_files` VALUES ('30', 'Trust and Obey - Lloyd Larson - YouTube 21', '2020-08-11 00:00:00', null, 'assets/admin/layout2/img/learning_materials\\q2.jpg', '76', '7', '2020-08-11 00:00:00');
INSERT INTO `uploaded_files` VALUES ('31', 'alumni', '2020-08-10 00:00:00', null, 'assets/admin/layout2/img/learning_materials\\$2y$10$oRZPUrDIupyH1EbVcX36OuX7.GEDn46R2nTafXhNWax.Hqpn6hUlK.rar', '76', '22', '2020-08-10 00:00:00');
INSERT INTO `uploaded_files` VALUES ('33', 'User Admin', '2020-07-21 00:00:00', null, 'assets/admin/layout2/img/learning_materials\\gxOrvPx..pdf', '220', '17', '2020-07-21 00:00:00');
INSERT INTO `uploaded_files` VALUES ('34', 'report (5)', '2020-10-26 00:00:00', 'rward', 'assets/admin/layout2/img/learning_materials\\c3m4vePNyLMltfk.OGq3gNr9EqypIE8VO5K3a.xlsx', '141', '16', '2020-10-26 00:00:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `employee_id` (`employment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('216', 'silabayc', '$2y$10$ooP4lo2tBmJTu3DLU1w1keQk6xvdYJ6UbOSvZU80sBzAqdVoOsnV6', '224', '17003995900', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('217', 'malinaof', '$2y$10$o2dk6rBXKQ5eNI3ykSTtkel95bY4ZrLS7rqP7r/N3h7NYfiFM4Su.', '226', '17004572200', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('218', 'dodiogb', '$2y$10$wO3UP9f2q.7r0ZNtXvu1e.me6eyPe9E5PeiKMbtQMDIThmTmTcjRO', '227', '16003413600', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('219', 'logartaj', '$2y$10$3hafQyCui0DvU0DcMBS4JOZ67uCNiq4q1eOKk.v47hiEgwfx3eD7W', '228', '15002878400', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('220', 'balagam', '$2y$10$FOd.8VNT5Pxc/tbP/KL1Xe3aa3QlSjJLlN64esIICQ3pdXHI96Zv6', '229', '16003030600', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('221', 'barimbaon', '$2y$10$9hjTW.ayuAqKJfOEY2PejeS/O6n48ctu3ieTrLY.C0SOzLcO08H.S', '230', '16003356000', null, '2020-10-02 12:25:04', '2020-10-02 12:25:04', null, null);
INSERT INTO `users` VALUES ('222', 'condea', '$2y$10$69eQVkLpPI5zyb7yF8V.Ruv6AsjK4wB58p1ZoLbLfJMsgX3J13woS', '231', '10004073200', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('223', 'boiserj', '$2y$10$MXEU374j8pc8q/B7/rbVm.4ndiD0YOo0jy2liV7ihG73uenMRux5.', '232', '160030031100', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('224', 'mantillase', '$2y$10$7YFbm3PdQYSkVkSr3wJ30uhhi1FJEyh8.rgov7nQ0QsFm1uN9/nW6', '233', '16003054200', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('225', 'silabr', '$2y$10$ZoMtSwsSlgM/7YJ4xL7dfu7XZkckOUOS5umxHUpOerGnjpN7cj/4G', '234', '19004607000', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('226', 'trilloc', '$2y$10$kdHZ54fA/O5qlAWT8wz4EOiqpfQksHqSpIsrSYVtN8rXp1KFfzaW6', '235', '15001916300', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('227', 'mejom', '$2y$10$/gD49yB20.oc8UeO6jgEiuq8whdP6DnBlIxWqWrl03kVfgaITcEai', '236', '19001464800', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('228', 'santiañezl', '$2y$10$czBFm31IuBWpS0p0EOBYeeiXGxy3ijCNRpuOm7iVqE5HFda947sFe', '237', '17004026800', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('229', 'moralesj', '$2y$10$d8Hjf9UTNw7aw5t8KnnmA.Reap9dwfLGB33A6bhy23KoTSrhMpB3m', '238', '18004239900', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('230', 'acostaa', '$2y$10$Ft79TIJ.tOuGsmYjetnpAuLPAUdDsnKLDcrlFiYtWIiPlh7SFONS.', '239', '19004607100', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('231', 'ebarles', '$2y$10$twyp/rC2BuP2wBtaRjkQru3oHggp2UCSd64Pt7yXqu.S0Ji7yynQG', '240', '17003967800', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('232', 'cabalterac', '$2y$10$x7sPkgkVpYpvuY9MfSllZe/OlW04Tb9.tIOeNsVYrlUQepOXU4.SG', '241', '16003411900', null, '2020-10-02 12:25:05', '2020-10-02 12:25:05', null, null);
INSERT INTO `users` VALUES ('233', 'cuñadod', '$2y$10$HrRDm9q4BfeJcxl6ji1Xh.y4iKgmc/DBeU52w/s36jmxVjJAImpb.', '43', 'BTN-2014-147', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('234', 'abalorioc', '$2y$10$f8c895b531K5Uhx7Hn3X/eAXXrqD1JyGm08TB/dZYzqfa7UdoyYLq', '44', 'BTN-2014-0271', null, '2020-12-01 13:01:52', '2020-12-01 14:01:52', null, null);
INSERT INTO `users` VALUES ('235', 'agravantem', '$2y$10$lKFPJ/wijiFRcpa3PJYrb.yIBN9xiglU29PwLRhmw0CisU.bJXFTu', '45', 'BTN-2016-0317', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('236', 'allenc', '$2y$10$W7fgu9/Jb9Y8mDKCmue3nO5e2F1Q21A1mSJi4HG4eHPyZYMgjwf3W', '46', 'BTN-2015-0286', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('237', 'allenz', '$2y$10$S0GGQfbki2JKACE6CTBz3ee2U5BC5.FBdqGc91rAi7oVId6TyTLdu', '47', 'BTN-2015-0314', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('238', 'ategaa', '$2y$10$HVFQVoD44DYEdAo1.c8YUOq1ijI9fbRKfm51xurAC98jTDgt4NKOS', '48', 'BTN-1998-0004', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('239', 'azuram', '$2y$10$ptGo7ufIWQBwlJjhxtGbPuBR6b4MMS2lSyEIaK0oGv2PVgdCPN7Im', '49', 'BTN-2014-0278', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('240', 'beroll', '$2y$10$kcG2Yb/CCLbycw5VRbR01ujHDewWo8jZ7aBFXdc.gRva.gQemBAiS', '50', 'BTN-2014-0259', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('241', 'bernadezj', '$2y$10$qCW22LHBB3hz9xV.IjWF8OfQx7jD300kuXFcr/QlqNWm4u0JI73oe', '51', 'BTN-2013-0257', null, '2020-10-02 12:55:22', '2020-10-02 12:55:22', null, null);
INSERT INTO `users` VALUES ('242', 'bojocanj', '$2y$10$AFyKl6UJTFLK/mUtTY1bEejOuYtaavFyjibzFY.Rx0HGdN.9FdDGm', '52', 'BTN-2016-0315', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('243', 'bullandays', '$2y$10$QjGPZy4jx3DFVN8YLqfxpezcbjiXLwt3JYSuG.GphYi3lChwxsHXi', '53', 'BTN-2015-0313', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('244', 'cabagayd', '$2y$10$2qkRm.HcvzS4XCsmWJBaZut7E.sRpWzcKVDjL8.FoWdPubWCUbKaG', '54', 'BTN-2015-0285', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('245', 'neñizaz', '$2y$10$n37Ouoe3pCX1RTEFSoZbzujws4UkiuoUMJcjf6iVAg2EODjAyR2nq', '55', 'BTN-2016-0329', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('246', 'estenzol', '$2y$10$Wz3Z/cHjZICZbh1qq7aZuuPn7zOSeSQnydimNiLd5dQJlszg6WG5C', '56', 'BTN-2005-0013', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('247', 'fajardok', '$2y$10$RJfSp0/x1dFsj9kSmU.wvOH8pOtcw9cN6hIzHeRZzfaAh6K391PLO', '57', 'BTN-2014-0284', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('248', 'garridol', '$2y$10$fD4NEQ5VTGhWCgaR05VHtengg8qfWu7gDZE6L/Et7mTYoyUQY7OZe', '58', 'BTN-2016-0318', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('249', 'lastimosom', '$2y$10$6b1PTuMaRmTO1Ng9/Ns2/ebWtqCFzqpEMjeJUoileqk9cJ5BLHBlC', '59', 'BTN-2011-0160', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('250', 'lastimosoj', '$2y$10$YRLflnqBl2NcEDAIY1EF4Oefgil.5zKzqA.ODislZU2V01ijYayXq', '60', 'BTN-2010-0148', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('251', 'malbasg', '$2y$10$WJMTHvodjjyHjj9ZMi3iDOpDNfzTmxlnoZ1ILGd1sREeX5Xb3f2uq', '61', 'BTN-2015-0312', null, '2020-10-02 12:55:23', '2020-10-02 12:55:23', null, null);
INSERT INTO `users` VALUES ('252', 'obinap', '$2y$10$HF5MiLsXGSWZaTJoB0PpPenG6JkenVZvx4WD1ypmHddo9N1Zi1rbq', '62', 'BTN-2015-0306', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('253', 'oñezj', '$2y$10$hPpHIdqgUlzxvixFoPPsjuGYfB84DYhLY57NOP6mvYto97SzXfLne', '63', 'BTN-2105-0310', null, '2020-12-01 14:22:01', '2020-12-01 15:22:01', null, null);
INSERT INTO `users` VALUES ('254', 'patiñor', '$2y$10$eT18Y59QmyjPW5wPAVjOneqFUwPj4DwHUm9sop5uCmp0o7opMAsf2', '64', 'BTN-2015-0298', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('255', 'pereze', '$2y$10$LwXCIoB0QuXYxHGmqltAbOIV2Vhmqh5NJjNCQAj07KFRiIajlPmWO', '65', 'BTN-2015-0302', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('256', 'preciosor', '$2y$10$CH12Bt5GJ3qJjMQSfidvnOF/52HB0nPm3PdqVVaw53lQ9xiQ6FHpm', '66', 'BTN-2007-0038', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('257', 'quiñoj', '$2y$10$mK4MtALnmD/YiI7HRd64AOjY2tF34ednY6Ie6lcKYuAYN4gD6y0ZO', '67', 'BTN-2015-0903', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('258', 'romaguerad', '$2y$10$lSoCRJFCkY4yS9.rhkqdgeMdnozlP5vUEUrRdX6VOmK65Bp650jgW', '68', 'BTN-2015-0315', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('259', 'sandiganm', '$2y$10$c/VG50pTtU/xBrkzSKYote.Ntx3ckOS1cZwOgbvLsBIPz38wq1vFC', '69', 'BTN-2009-0061', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('260', 'sanchezj', '$2y$10$tA68teDUzbpvryfbn9Kn4OBSE8XLJNgxsgqnBTeKH5TzS7z7V3et2', '70', 'BTN-2014-0268', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('261', 'abeiraz', '$2y$10$tjuTNXYgh5dSv9uR5F236uv2vuEP88K2hyn/2qyHY9sxge/72rtxu', '71', 'BTN-2016-0332', null, '2020-10-02 12:55:24', '2020-10-02 12:55:24', null, null);
INSERT INTO `users` VALUES ('262', 'ampoa', '$2y$10$08AB7G2ZIjJlevo/.76gvuLDP4vj6E6b34YZchy8hsxsl0c5mTOQW', '72', 'BTN-2009-0071', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('263', 'bayawaj', '$2y$10$l3yUggqezD4h8Vgj0Axkqu5pT9LIMfQBQlqkYxXumK74LL2bzevYu', '73', 'BTN-2010-0128', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('264', 'broñolai', '$2y$10$su.a7.XDAB31TZjU4vkOm.ytP2L5ltBs1JufEHaY2LDTex1OdgJCa', '74', 'BTN-2012-0213', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('265', 'del rosariod', '$2y$10$TgcK2EfSfztfcMFNDJauFOnRI6t2tANDHutAoU/PSJJskZTviSD0W', '75', 'BTN-2016-0319', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('266', 'jabagatn', '$2y$10$Lpg2e711SAKFub.7DgQt..c0tnsaIxNCsx.Dyw2Lzw7lkhwEJtF7q', '76', 'BTN-2013-0255', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('267', 'seronayk', '$2y$10$/30Ee.x.DrIJigFa0tcXp.YpXEjmsrwD4NmLBjFq3JzrBjGOkCMFm', '77', 'BTN-2012-0212', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('268', 'valcorzaa', '$2y$10$xwDpZ8dm0crW7UeUY005HOePlB3T4ZaI5UqFvsmoSrj0Pm4VU.Ppm', '78', 'BTN-2008-0058', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('269', 'yamitm', '$2y$10$pD2S8e.knVXKI4rgNYYfreWskaJ4bioa8qHybEEqk9FnoPqRUCEA2', '79', 'BTN-2012-0175', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('270', 'torotoroj', '$2y$10$axoecfdEBqeMiKbwNp2uRe/S4/2KaNWlmrnUU2LshwPU9ObGbGBK2', '80', 'BTN-1999-0008', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('271', 'torralbaa', '$2y$10$FiYryRt.pDJx3mar.6TjoOEx7PDnGUf0X6IcbIYtudkqx16qt7LF6', '81', 'BTN-2013-0241', null, '2020-10-02 12:55:25', '2020-10-02 12:55:25', null, null);
INSERT INTO `users` VALUES ('272', 'sodijanas', '$2y$10$/i6xsX6Rvw8jw8k/RtRmUe14dBxx0ftkIU9jBw87S5X4wjLLzB/LW', '82', 'BTN-2016-0322', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('273', 'sanchezg', '$2y$10$G21uGKGTnc5uMKUEyz8vmOnE0zKIS/4bDYMHDUH2xZyykvpfzHLEO', '83', 'BTN-2013-0216', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('274', 'sanchezd', '$2y$10$fKOZBa02lytBX76nqKvnfuTUR4koD71VHEYQN17egtfTrJRRxOGpm', '84', 'BTN-1997-0001', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('275', 'ramosj', '$2y$10$8WoiIQCBvtazum9Xke.vruPrYbOoVHtFFpUh9FczRvnfEwqJT/p2S', '85', 'BTN-2013-0250', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('276', 'rañadae', '$2y$10$dC5pFzg14Vt1ytdgbpFt5ObM3o6oNCN1Ub4iA2xBF8PWyBlqVfGc2', '86', 'BTN-2011-0171', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('277', 'rizaldoj', '$2y$10$L9oum9l0VCp/.kI5JHE/ZeKIUDkbqivb6gw1RmBwCUtJJRD/3ysC6', '87', 'BTN-2003-0010', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('278', 'olivoc', '$2y$10$RdhO6iRe/kIe9Bs.BeUu2uksUl0PcnFmKcW3.SqShyQD42RsLteOu', '88', 'BTN-2016-0320', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('279', 'pastorizar', '$2y$10$fS18KCknj6aLdbSpOE8DveGoLB.BkQcHnx6pgOPc7ljBthRTrvvhW', '89', 'BTN-2011-0162', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('280', 'plazap', '$2y$10$7SsIrBv.fKbqmD7tvtBv/uDy5BEO8KEL2fUpTWbVo3kqBeN4dN5oO', '90', 'BTN-2012-0194', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('281', 'pujadasv', '$2y$10$H9assM6k7RmKinMYrZ57Re.8DdQWw7tcCuN21KmdwNf8jh6D9YB0i', '91', 'BTN-2013-0239', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('282', 'moninr', '$2y$10$GVb72FdYTr21/WB32HwH8.7HSNlCkEqPOt6FcDNdR35pQS7DYBNKy', '92', 'BTN-2011-0172', null, '2020-10-02 12:55:26', '2020-10-02 12:55:26', null, null);
INSERT INTO `users` VALUES ('283', 'maturanz', '$2y$10$OIybQOpHdQ430fBNdtw3Iej9hN8/3I65h6ss44ZKnVHhJvrQbQNba', '93', 'BTN-2016-0327', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('284', 'moralb', '$2y$10$5iy.Iuy6ZfG9IWxTvM0v9u8NYDX7iHGgAYTeZfE8URT7T8di4wby2', '94', 'BTN-2016-0326', null, '2020-12-02 10:01:29', '2020-12-02 11:01:29', null, null);
INSERT INTO `users` VALUES ('285', 'obedientez', '$2y$10$rHbO512NO0sUOq0su.gjiuoKZtmhQfEvzh7fcYiE.1TB7xVN7mjiO', '95', 'BTN-2010-0142', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('286', 'malazartej', '$2y$10$GsXc6SwNNo2cLDAwVxNbdO9bAOkeNedxU9nFPGWXx2OrA3omOMfHi', '96', 'BTN-2013-0235', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('287', 'jorbanc', '$2y$10$gNVC/.IOAMb7U8GMFi8y/eOuKLAy6yomb0zC8t9RqptHFQa3x/4Py', '97', 'BTN-2012-0190', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('288', 'largoc', '$2y$10$n9ncLzZ17jmpsRdIs/P10.Ajg9cxAnTLjRzaWiupw7pv0rf7W.5Wi', '98', 'BTN-2016-0325', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('289', 'mamogayg', '$2y$10$OsDAJCcW.o.cZOlUnE2UaundPwwtwFufrOrMcnHPuK65TKWuiI/x.', '99', 'BTN-2006-0019', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('290', 'jaictinj', '$2y$10$No332EP1CLYqnJENU6kcD.rJxmxgRy9RRlRvGF0nDwwQ3A5KALRqm', '100', 'BTN-2013-0215', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('291', 'jamenr', '$2y$10$NU8zj5mAO6w/M8Bxftgh.uGSHhcdllP3Xgv.TV9qE0XSpcGp0GPWi', '101', 'BTN-2013-0249', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('292', 'garridok', '$2y$10$rQp5speqcrvw/mlM5xKAd.bUlhvDjI0bXNcQ5eWJiEErxrPc2nNpq', '102', 'BTN-2011-0163', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('293', 'cabañasa', '$2y$10$hR.nFzfD/.OipwdDm23C1eSXgmMPCvYwTj49jCzVmLU41PGtIqHAO', '103', 'BTN-2016-0330', null, '2020-10-02 12:55:27', '2020-10-02 12:55:27', null, null);
INSERT INTO `users` VALUES ('294', 'cadaym', '$2y$10$RxlfAtOKjfRh86BstiSAnuaYBDPJjd.Z4vNo98Fd5QypgkCV3b0qC', '104', 'BTN-2016-0328', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('295', 'constantea', '$2y$10$Dl8Ks08jQUozZWm8FETcLOvTgX6nftmndMyG3jLMva3.MBPEyFX6.', '105', 'BTN-2012-0189', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('296', 'castroj', '$2y$10$0sRbke0gbjcXcuOIvte.ju/ND5ZGOmmQaS3fXZUJ4C8FiCXpNPoHq', '106', 'BTN-2016-0331', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('297', 'castror', '$2y$10$M2Focbq5ZpzaivLD0xgYoO/ATBi1L.H.n5dEb/H/q3nbYP6pRFN1G', '107', 'BTN-2016-0321', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('298', 'ecleoj', '$2y$10$uvpxUU4yB89fAY8kegLukeKBwywOaF3FSoOITCioo6iRtGn/kj9U2', '108', 'BTN-2012-0173', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('299', 'encarnado e', '$2y$10$cDmr9kcyoMGRovBaNmj/XuBIvv5CSSozhAb3EMWWlrSoMLC7UM3aW', '109', 'BTN-1997-0002', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('300', 'calucinj', '$2y$10$Dyf5AJ58149MJEA/Sfsl7e3inByjHN8/PiUWuzzK1g2PWDNQQMCBa', '110', 'BTN-1998-0005', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('301', 'susanar', '$2y$10$A2zEUiyga6FlYpxTqUFf5ONDAn7xiZcyeSwL3x1AGDUm/lyhHO9Oy', '111', 'BTN-2016-0324', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('302', 'deligeroj', '$2y$10$0nq9GyvkUgRT/yfN4gtGLeX3sTffakX/Zjdo3.xNc3uW3.fQIitUG', '112', 'BTN-2012-0184', null, '2020-10-02 12:55:28', '2020-10-02 12:55:28', null, null);
INSERT INTO `users` VALUES ('303', 'bualj', '$2y$10$0HjIEunoN6GztWzWUjgFje/QDGbCnOMonuJdqYYl9lh3OhHxp6pY.', '113', 'BTN-2016-0350', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('304', 'de benitoj', '$2y$10$Q.6q6tdkzXzrdz6XgyVCHuEAaMgo93FGF6w5W073A75AIw6IMlDgW', '114', 'BTN-2016-0344', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('305', 'alcuizarg', '$2y$10$67rvTW4yXkV.MBqR6HNOC.2rSB8WfDVWjairLfKSM5FDvppC7yZv.', '115', 'BTN-2016-0337', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('306', 'umipiga', '$2y$10$eqEGCrmFe2Jp6ZkE3C3RreIq3NXOqG9WGO/7XFXWbcJtMExp//JiS', '116', 'BTN-2016-0351', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('307', 'rualesj', '$2y$10$r5nswILrDcrNI1iZLw8Ir.h57/45ZMpKPvz1DP9gwqWO095BbTr6C', '117', 'BTN-2020-03144', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('308', 'relosn', '$2y$10$1kvSaG2OZ5VrMzebUIRlZuIBAOxXrhBuVM3TWodAJwDmuLz3wddY6', '118', 'BTN-2016-0335', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('309', 'potentej', '$2y$10$vw6i1jOGxs5aZ.x/qIasqOCkth7ARB7V.8XTlMkQxm3tKC/br8Nty', '119', 'BTN-2016-0336', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('310', 'dispos', '$2y$10$el0Vn.lczIwizfQabTJQf.BsDJ/YzaRICpVzB6vOqgDU147eYSSuO', '120', 'BTN-2016-0352', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('311', 'madlosj', '$2y$10$UAO3efHky..owar3zt1ez.njo1Yx0PY7sNOtMjS1bPP3IPRIFlrpe', '121', 'BTN-2016-0343', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('312', 'jablar', '$2y$10$2M2HTmMP1Fu1bNZ2oef3M.wzx.n0Ty8kgOZsG94nYt60qSV81dOE6', '122', 'BTN-2016-0345', null, '2020-10-02 12:55:29', '2020-10-02 12:55:29', null, null);
INSERT INTO `users` VALUES ('313', 'faunillanj', '$2y$10$UVAAH2q19PpcL0efajEMEeo4QCzwSOFQycGuDY2KRW3hQxoqHdBjO', '123', 'BTN-2016-0342', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('314', 'facundoj', '$2y$10$qMsXmXDjr91ClUcMJEltfuDD2laPgtKJas1hi1uiprgu9gPAE/WKa', '124', 'BTN-2016-0339', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('315', 'chavezm', '$2y$10$Rwc5owMCVmsc0Xw2IlPAk.h7U9cehxmXkFAh.r8ugHElZJ04F8ZL6', '125', 'BTN-2016-0338', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('316', 'bustilloj', '$2y$10$YyCP7v3HHSJ6/RoBAPwDC.DsPwVxqS.Wrk5j198i5161wd.3ip5ve', '126', 'BTN-2016-0341', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('317', 'belsondrar', '$2y$10$1uj5G/i05uRyH4pCZ.U4..Y8eD3k6wHF9Ejzhtwu5L2xFlXF.zRru', '127', 'BTN-2016-0334 ', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('318', 'banosanm', '$2y$10$nH01RiJCNWnkd15Kjam8pOqYsOBIcKOcCrp5ePZelHbBPyw2htLoC', '128', 'BTN-2016-0323', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('319', 'campana c', '$2y$10$TEddAiIfmdcpQpeYv.iO/OzdYGFp4zMwA0vD9ZKGHxaO01TD54sFK', '129', 'BTN-2016-0348', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('320', 'dogmocc', '$2y$10$pYrQFT5r8rckowFLEh.UVOTBh4h4bBx4YWFQecMORug8gutBdEuDa', '130', 'BTN-2016-0359', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('321', 'fuentesd', '$2y$10$nfJHQPhje26BaIpfACBI6elJJYZpOVIusdePb5a2OQcbvZwgaLbuG', '131', 'BTN-2016-0333', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('322', 'macunok', '$2y$10$HHuM1LK5IcTxaVdYRGjq2.kORcaSeHzbdNgRlWvIaFhF9qfPDO3DG', '132', 'BTN-2016-0356', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('323', 'empuestol', '$2y$10$PedJa/YIBtrvP4iYsxDkGurj8UREmyxUUNShzHdwbdM8rhhzUNjjm', '133', 'BTN-2016-0353', null, '2020-10-02 12:55:30', '2020-10-02 12:55:30', null, null);
INSERT INTO `users` VALUES ('324', 'blancoi', '$2y$10$MG5JTM04e4/E.WMQKGsVsOe13QAFAmQjf67F.7ptEn56U7iz1z0n6', '134', 'BTN-2016-0354', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('325', 'monteadorak', '$2y$10$fRGxjOxBRrSedstKhvK3B.0b4xf1ayUMGg6KUZQVk0oYojq1KTIVC', '135', 'BTn-2016-0355', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('326', 'corteza', '$2y$10$mHk3B./R2mw7e0P.rD5CKOCz4pK7ibtnjBi88hjwhdlVQE7HVtVsa', '136', 'BTN-2016-0358', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('327', 'tagoloanr', '$2y$10$DRDWTrKEnC45.HtxpgiSv.Dxnpok1Ka1N67ZLJ7prn/RtPs055Q5y', '137', 'BTN-2016-0346', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('328', 'consignar', '$2y$10$.XOr6J8XI9y1.G6Ms4TttO8m4v.u.E5ni1w1xkcK1rdKuHThRaLW6', '138', 'BTN-2016-0316', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('329', 'vertudesa', '$2y$10$NflErx.6fufs7.8Epsq7L.7kEXZhgJz8tIBlg6GEyrA.3kI9EXJA6', '139', 'BTN-2016-0357', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('330', 'dandanon n', '$2y$10$cm/FMzDU7gVlyyZVUCv75.je0y3lMJTxU3bDF5MnOhcuZ.KW8PD/O', '140', 'BTN-2016-0347', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('331', 'domingoj', '$2y$10$UxRecQs5i4mooLr0ZlPsYufyroSaWJhiKiD.h7MzYwbefQYPGmSvW', '141', 'BTN-2017-0378', null, '2020-12-01 13:23:45', '2020-12-01 14:23:45', null, null);
INSERT INTO `users` VALUES ('332', 'monterded', '$2y$10$rsRlAiOtWpRDgyWR82vo8ecHm5ARol8dSMWlqJiDSJriDoct91iq.', '142', 'BTN-2017-0379', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('333', 'lacuestaj', '$2y$10$dREqHu8KptwkjNoz0878VeDctv.7JjOTpra5mGkHWWCNY8oM6gdAW', '143', 'BTN-2017-0381', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('334', 'credow', '$2y$10$FX0gkw97jsjJBsixUVqdmOcP9pLjF7FS9oAvLxakrZAXagZSYXPtO', '144', 'BTN-2017-0376', null, '2020-10-02 12:55:31', '2020-10-02 12:55:31', null, null);
INSERT INTO `users` VALUES ('335', 'lomanta j', '$2y$10$HjXYWpU8cywfNVdDDhvXwOW/nZH1rG5yO9U5to1U/XgKe5zQ2PiF2', '145', 'BTN-2017-0371', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('336', 'tong-alanc', '$2y$10$ir/AdVHEVtTGKrxVRSIOPOrY6xCvA7549SSIm1V7U39cVfKQyUBrO', '146', 'BTN-2017-0377', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('337', 'goyoc', '$2y$10$BMrBRe2w5Ro2JRmejgtN6uC9V5MIE.Ck8FdEAI4VxM6P7pdSQaHhm', '147', 'BTN-2017-0369', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('338', 'galinator', '$2y$10$dz.LXuz.uh5WUKgwpS9SFe8QJPCBE8.LxBDhNIVckyw4dMFc/1EDm', '148', 'BTN-2017-0374', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('339', 'regalah', '$2y$10$PiUv47iuxtitH397dhQkCOhNRhtSpeIGPE5HK.UpaM9vg./Auwl.W', '149', 'BTN-2017-0373', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('340', 'napone i', '$2y$10$0BvRH7kSYdcT.ctct.HuFOXs/ZZVumtodmiXg/0Q8tcMJDuJ0m2wS', '150', 'BTN-2017-0368', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('341', 'amperj', '$2y$10$WV5vn201Zv4Xi/yEnkmo3.SxmJKqI.9VlB800e2QJ0nAnsuS2ja8O', '151', 'BTN-2017-0366', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('342', 'silaoq', '$2y$10$/ws3BtGr100PDza2S2Xs9eLQyNKHWT3ex1CCEp.OqIeXpT.xCdYKK', '152', 'BTN-2017-0372', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('343', 'dela calzadaj', '$2y$10$3m7pJ9Sx/2i6z.dj7kbSyebM7W7IMioXt379K/oWoAa1xciWHt6wm', '153', 'BTN-2017-0370', null, '2020-10-02 12:55:32', '2020-10-02 12:55:32', null, null);
INSERT INTO `users` VALUES ('344', 'ampason', '$2y$10$oWWGmgKnWNw6tWiddm7C1uEB/Zf3/EjYSdpwnUkqkQphob35gDDaa', '154', 'BTN-2020-03146', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('345', 'apatc', '$2y$10$O6EXdchdHJI23HI.0j7usuOFASciAtmqyBXkkzfFLA9oDesmeI.0O', '155', 'BTN-2017-0367', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('346', 'bacoye', '$2y$10$Tm/xXH/Blgu.haI4Nt9ai.TGLRCreskql/kQOYQhbgb7PqW1rVWWC', '156', 'BTN-2016-0364', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('347', 'torresb', '$2y$10$XSI/q0pBiNS04VhO8s5jkOpYGZMI./lr2apoSVqDtKDfkuCD2DBBG', '157', 'BTN-2016-0360', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('348', 'avila k', '$2y$10$pxbq3YxNfFaJ4Mnf09.l9.lpBWQ6InAFsZwlolF1rsKmKr6nfh09i', '158', 'BTN-2016-1360', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('349', 'lanes ', '$2y$10$ItkWrvq/lM3w6IoYkIkoOuHzl3ELIX0o3KHTwEdRddHB4q/Yt8Y/e', '159', 'BTN-2016-0361', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('350', 'telarmak', '$2y$10$fEwvCEpRRKbddkRYRDc6t.VvJdW1KiVcGcIf0poRpWHKBXVy.QUvu', '160', 'BTN-2017-384', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('351', 'elapem', '$2y$10$2GnTjqRsOpnpqCaouJd6AuS2WgAPJ7CsorM2A5KO2gEXlXsmfRiCW', '161', 'BTN-2017-382', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('352', 'peñalverj', '$2y$10$rcQsTxLRMcIv99yERnEsq.essaM4yZiIz0pyGqMOPptYMyG.clR.K', '162', 'BTN-2017-383', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('353', 'ferrerr', '$2y$10$kQHPebZMhm2PTm.tP40ttOM3AH0qxP4AlfKK/pwmuYGTHWXl9HTJu', '163', 'BTN-2016-0349', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('354', 'codastei', '$2y$10$I1GMm224EVwy0eDcQ/XEVOoU/fE6vE1/zdLRWTmrZLBMOsLaFDxfm', '164', 'BTN-2016-1365', null, '2020-10-02 12:55:33', '2020-10-02 12:55:33', null, null);
INSERT INTO `users` VALUES ('355', 'gastardoe', '$2y$10$LfhtUED6HOhptTot38Sm2Owya381gvEIEa0LrqZplh0yQwXAWG5tC', '165', 'BTN-2017-0385', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('356', 'varonac', '$2y$10$b6bGERiQUTI5Qyfy.jewsOgx8IqISW8MZl2AabSrRNojRAL42fnPW', '166', 'BTN-2017-1371', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('357', 'manlapazj', '$2y$10$ny39qJyFxrqp3SCHySXkVucp.bgkwjgjDchXxmX/EJGvghBweSOXq', '167', 'BTN-2016-0363', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('358', 'fuentesn', '$2y$10$I.Wr0i/UMt1pRY0bGJ1q9uehSq4ha.HAmxpVRhFRSGmrdDv7XimGW', '168', 'BNT-2016-0362', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('359', 'milloria m', '$2y$10$u9X9/TV4sAE/qKb1eRcN3.RfIGqaC5fJr0KcVih2yNu3YJXSYpwu6', '169', 'BTN-2017-0386', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('360', 'bahalab', '$2y$10$crahsNKdfmE0fwxu2C2y2e8J9XBm7orkNlzFrBIF/HeMvIlIiKVyK', '170', 'BTN-2017-0387', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('361', 'pajuyos', '$2y$10$NJTUdECOJ8GYJl7V3ZLa/OkgSh/kWCoumWCEo.4P9RoU6b5TFpPp6', '171', 'BTN-2017-0388', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('362', 'uayanl', '$2y$10$NV77BxOMybC54ZNR84Cp6O3zDXNpqC8q/GZM8ulEojnfNMUHjJnHW', '172', 'BTN-2017-391', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('363', 'tantoyr', '$2y$10$tfU7I1h6QP3xBrRYzml.WOBOeb6utoSPHVml/4DtxmCKCsYK7sYWa', '173', 'BTN-2017-390', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('364', 'telenj', '$2y$10$D/0H8PxWrJOwab6HPDVKuu1Dz6duBeHpurswZjeqBuaY5Z8wEsH8i', '174', 'BTN-2017-389', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('365', 'reblezaf', '$2y$10$tOKlnqK2GTPq3PrwCUTajO.n3jSayvvCGDSKcSb7qMEtkCp.Oogki', '175', 'BTN-2017-392', null, '2020-10-02 12:55:34', '2020-10-02 12:55:34', null, null);
INSERT INTO `users` VALUES ('366', 'mendejar', '$2y$10$pvr9OjQVnb286UyyfiMvSeKOs014QL7c.RmZWHgHsfZgpo0Ld8x2e', '176', 'BTN-2017-393', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('367', 'visitacionm', '$2y$10$h8tALKWE1fQTR8Y5HnSFB.bIMHSoT1OfhMtSTrgAcHVrUUrSdMITK', '177', 'BTN-2017-394', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('368', 'bernalesr', '$2y$10$1ekpBDVl8Mvsl/DnrzlrNe/EXWJfvUu/AAGcQIxMqqhs4.8N.xLKS', '178', 'BTN-2017-395', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('369', 'pielagor', '$2y$10$eJB7NUGisxMhAMaRHipdPOqfkFCnrK6MJcBbABa2GpdCCMW0lc7a2', '179', 'BTN-2017-396', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('370', 'plazam', '$2y$10$/qmMIaGJiDQs18YMwee9KO5eOo1G.kCzJL4D.qF2cnZy1glz4AEZu', '180', 'BTN-2018-0396', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('371', 'pondang j', '$2y$10$2A3qV80Eb.mAhCySi90zaukx0LTSim230nbG35gtk.WWZLnQtINaK', '181', 'BTN-2017-0397', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('372', 'trilloj', '$2y$10$qpkdEj/3WcJ3lWR4/ZEwte6HlU.1...ZB3BpsSI/VRIHSV8saCTy2', '182', 'BTN-2018-03101', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('373', 'mirandac', '$2y$10$sJF2UpuT4Quq5HYwbJ8y7exK3bj9g110GqLKvyhwQDc0tHDVy7NGq', '183', 'BTN-2018-03102', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('374', 'sarcoj', '$2y$10$Lhyv7bUJM7zNxYmIy1QKOO/Pm6szMYMSbTEtpYkWRgQRnd2XzVNWa', '184', 'BTN-2018-0399', null, '2020-12-01 13:07:31', '2020-12-01 14:07:31', null, null);
INSERT INTO `users` VALUES ('375', 'mapalob', '$2y$10$WxLcM.FcHnuQB8Fl2mbsLuhofZtU4GC2NybCceIkU0lyIdpvDJ7TC', '185', 'BTN-2018-0398', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('376', 'cabugac', '$2y$10$u7ZC6417cuCjNoAICQtf3OOVoGahOX.E2Feb.gVnDwpNUMmUt8nGe', '186', 'BTN-2018-03103', null, '2020-10-02 12:55:35', '2020-10-02 12:55:35', null, null);
INSERT INTO `users` VALUES ('377', 'mellosaj', '$2y$10$2tI.NDSfJLClGlvEIovB1ekqp4sN/XNPY5iHRCgh2AZhqwtb9cHJe', '187', 'BTN-2018-03100', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('378', 'achaj', '$2y$10$NM0JkRZ2OeSyqhD.UYeKK.C3qQbxcKao4cq3isOiLmjVJgs5hnedW', '188', 'BTN-2018-03107', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('379', 'bongator', '$2y$10$N/PD84HSwfVvNHFKmPKQP.OOrbVMqDtk/6baBQaHL.A3wJkWaAJNi', '189', 'BTN-2018-03106', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('380', 'papam', '$2y$10$Tk.bBcU8p4gkuAzM2HCqSeIZYF7bkycBQYYOVeq2Q97HU994jngsy', '190', 'BTN-2018-03104', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('381', 'autork', '$2y$10$6cUdKgDeM1qOprZ.HhbxV./zCs5Ab.os6syaokol.xffV5tVNQWc2', '191', 'BTN-2018-03105', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('382', 'lopeza', '$2y$10$TR109v3QTHPkQHDnZm/Z1OEXg.6MND0KRs2zzxaeagOTUACtiSbEC', '192', 'BTN-2018-03111', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('383', 'cupayg', '$2y$10$XgvZ8HrWzBYhhkUNMFAyFOu3sajncLjfUbiIC85hsYc.lsMEGAmJK', '193', 'BTN-2018-03110', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('384', 'conjeh', '$2y$10$SqKG5hzlGrZtIEOfTf9veeU/vWSCz5uPZmupt3IsyWTlaJ3BC2Sgq', '194', 'BTN-2018-03109', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('385', 'cuarteronn', '$2y$10$2jsHxuG1rbTGAji.rm4k7uTKuZaW0ilEMAzpC9291i5/1IJHel8f2', '195', 'BTN-2018-03116', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('386', 'cabatañar', '$2y$10$vWf4VrJ997KaVcZLKTZ/F.qWV.s3iq0dVqhJVQ7H1wfPDiMizuZzS', '196', 'BTN-2018-03115', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('387', 'osiganc', '$2y$10$Lw.iMiNKCwggRN0igz0DH.BJJWIKiVMVayDFRrqQKUw7wuChBRC82', '197', 'BTN-2018-03117', null, '2020-10-02 12:55:36', '2020-10-02 12:55:36', null, null);
INSERT INTO `users` VALUES ('388', 'polod', '$2y$10$wh36q28m9lxNmsV13QSwk.ecyuMoL2Ixj7/YBa9On.UTUwKoIfgUa', '198', 'BTN-2018-03114', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('389', 'embuscadom', '$2y$10$WbmbMpK33j4WlytQ4npl..5TRrQNnz/wOOSMzrgE/AG2yojhJcG0q', '199', 'BTN-2018-03118', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('390', 'corderor', '$2y$10$yvm2/zGX0XHpq7upEfeBmu/S2Az5fRnXoVpKvnXoB0ZyvcRuzEdL2', '200', 'BTN-2018-03113', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('391', 'vasquezv', '$2y$10$eYjJrT7VvOTi.ffB7BnV9u4ekHVF/OLtNo1f1zHQuxpPxAVcWPfqC', '201', 'BTN-2018-03122', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('392', 'abuzoj', '$2y$10$oUNxiGPKbXpuRCYhEihuAuMHQc199CXoiT2gEKW89iTuJtbCo.D1K', '202', 'BTN-2018-03121', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('393', 'pojadase', '$2y$10$.nRqMyxA0GoFarEzqRRynOptHSOdfLqleHXL988HWA/I4VJbRRTwy', '203', 'BTN-2018-03119', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('394', 'dilin', '$2y$10$49D7xo0WXTx7hxoAUiyjHuj5A2kWfBPXU0OidlMDkEjleR0O.dbeC', '204', 'Sample-id', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('395', 'luayont', '$2y$10$AKgg4O291xWyUBQeMkbO1uCa/KkpVt80oVVjf476kziaTh6aH2bnG', '205', 'BTN-2019-03124', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('396', 'alvaradoa', '$2y$10$1wonWNIGZ1Q5JGVQ6jVbE.m/sxPZaFAWPuxRECSolBkggilUeOhOS', '206', 'BTN-2019-03125', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('397', 'cupasj', '$2y$10$0u3osVHouXOI3l3aBcuZHuZE1GvLRr2.r.RdI51lw.PQgIuWgfrBC', '207', 'BTN-2019-03126', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('398', 'lustrec', '$2y$10$fHMDiwwIAOV8/c.I7Texju8NMFaoP7PeoC9i3573AYhhIjvt8podu', '208', 'BTN-2019-03140', null, '2020-10-02 12:55:37', '2020-10-02 12:55:37', null, null);
INSERT INTO `users` VALUES ('399', 'samsona', '$2y$10$UXczEjN8PVKIM9FbDag0vO670Ac.jkxdBtK6YumhCeu.jl4jqrtam', '209', 'BTN-2019-03130', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('400', 'mulign', '$2y$10$3PUv4ckJIskFgpW2iSvBpeEOcz3zUD1qdWxOR9bjutVWr4b4Jjave', '210', 'BTN-2019-1996', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('401', 'villamorj', '$2y$10$D.P0SCVFNrvmQBxEtc5mZeKVrCrxlSwluKgCGDEJ3tcukqCgdy18O', '211', 'BTN-2019-03132', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('402', 'montealegrer', '$2y$10$W63zNSw1JybKqS0I4PQ4Ju.M2bxAqQLxJ.uqsrS2gV4lll6B8VUva', '212', 'BTN-2019-03133', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('403', 'tocmod', '$2y$10$nJkEZVXfl0VBRqYEf4zV9.D6yliLXPOf5dLeycTuO9dt1QL6zQGPm', '213', 'BTN-2019-03134', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('404', 'calol', '$2y$10$.ODNgHWs2KtQQWYbCfTMHO1qrl2ggo2n6Hxk1IhWE0XCeac1lIR3u', '214', 'BTN-2019-03135', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('405', 'ortizm', '$2y$10$o8gzUnPhAvnmnAPas3krS.powudresMYMAM/zClOL3MipSa6zvotm', '215', 'BTN-2019-03136', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('406', 'dyj', '$2y$10$bDhAOEescgz1o.1cy5N7SObtJQ6rjg49Txmu1c0JAjduoajIST0Yq', '216', 'BTN-2019-03137', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('407', 'anduyang', '$2y$10$SVu6zzHvj5VOJ1He7Lgo4OH44phhdCIY3e2gygXjMOfUoXVHPBGc.', '217', 'BTN-2019-03128', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('408', 'canonigor', '$2y$10$jfjWLaRIWsSz2kmQ4XSF3uy.gRJ8k7I2DKcMsfNvTJ/4WtjgxEjpq', '218', 'BTN-2019-03138', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('409', 'pedalesr', '$2y$10$vDFKK.p8pOE5kNiPfaJbv.jzd6sjWdViVjwcM12ksq1yz2j7EQcP.', '219', 'BTN-2019-03129', null, '2020-10-02 12:55:38', '2020-10-02 12:55:38', null, null);
INSERT INTO `users` VALUES ('410', 'benigar', '$2y$10$iTBM4UMHrKkKOEqKchbXduPzDzKCOM1jfkk6LQ7wOlotepvwxoL86', '220', 'BTN-2019-03139', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('411', 'palera', '$2y$10$PTDrWJpVRGCF8aGi1hWPYORK0804Y5ElqBNyeWkJssULoOW6k8upG', '221', 'BTN-2019-03143', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('412', 'dajanm', '$2y$10$eV49WEgtleycBtkW8yw0jOjgjENk5SWOlky51fzpOnDuG5fsSYQ3i', '222', 'BTN-2019-03141', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('413', 'christine joyd', '$2y$10$EDriRPYOXen.2R97FqqWW.5X08JC9mx683MOjg/GxZEeEpHH..tKK', '223', 'BTN-2019-03142', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('414', 'celism', '$2y$10$K40F59Ce2bUWFhyTGBNDNusOf9L9YGe3ok/O6JGBrWhp3U6HJPQa6', '225', '07004560900', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('415', 'patingan d', '$2y$10$vcCZ344Y4DdWtomy6GR2keCq7yhldzRX69R18LoqS8jYb20fDXNUm', '242', 'BTN-2020-03148', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('416', 'navarro c', '$2y$10$wuSspE1BNbAwwKIfbagau.v3Nl6gg/Qcq1KWbgIdybxq1T/Fjk/ja', '243', 'BTN-2020-03145', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('417', 'tabach m', '$2y$10$kGqq2XvJhBDzGOgmvrRboeI6bGhGycozOUiWTzmzceSTCs5OqU6me', '244', 'BTN-2020-03147', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('418', 'beyoyor', '$2y$10$PjdRdswB5TT.WwLhEZReL.9D4g4F8TH71X6MRt0LmcJJXbn/sf6pa', '245', 'btn-2020-0149', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);
INSERT INTO `users` VALUES ('419', 'cabrera m', '$2y$10$laK8ls1BkoSXQojwFlo6eO..1WIxoomUVXsaar3ZFV0S5FgHnYA2m', '246', 'BTN-2020-03150', null, '2020-10-02 12:55:39', '2020-10-02 12:55:39', null, null);

-- ----------------------------
-- Table structure for users_memos
-- ----------------------------
DROP TABLE IF EXISTS `users_memos`;
CREATE TABLE `users_memos` (
  `um_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `memo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`um_id`) USING BTREE,
  KEY `memo_id` (`memo_id`) USING BTREE,
  KEY `users_memos_ibfk_1` (`user_id`) USING BTREE,
  CONSTRAINT `users_memos_ibfk_2` FOREIGN KEY (`memo_id`) REFERENCES `memos` (`memo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users_memos
-- ----------------------------

-- ----------------------------
-- Table structure for users_posts
-- ----------------------------
DROP TABLE IF EXISTS `users_posts`;
CREATE TABLE `users_posts` (
  `u_post_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_post_id`) USING BTREE,
  KEY `ss_id` (`ss_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE,
  CONSTRAINT `users_posts_ibfk_1` FOREIGN KEY (`ss_id`) REFERENCES `sched_subj` (`ss_id`),
  CONSTRAINT `users_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users_posts
-- ----------------------------
INSERT INTO `users_posts` VALUES ('1', '10', '1');
INSERT INTO `users_posts` VALUES ('2', '12', '2');

-- ----------------------------
-- Table structure for user_access
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) DEFAULT NULL,
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ua_id`) USING BTREE,
  KEY `access_id` (`access_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_access_ibfk_2` FOREIGN KEY (`access_id`) REFERENCES `access` (`access_id`),
  CONSTRAINT `user_access_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_access
-- ----------------------------
