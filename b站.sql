/*
 Navicat Premium Dump SQL

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : b站

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 02/04/2025 09:36:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 弹幕数据', 7, 'add_danmakudata');
INSERT INTO `auth_permission` VALUES (26, 'Can change 弹幕数据', 7, 'change_danmakudata');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 弹幕数据', 7, 'delete_danmakudata');
INSERT INTO `auth_permission` VALUES (28, 'Can view 弹幕数据', 7, 'view_danmakudata');
INSERT INTO `auth_permission` VALUES (29, 'Can add 小时级统计', 8, 'add_hourlystats');
INSERT INTO `auth_permission` VALUES (30, 'Can change 小时级统计', 8, 'change_hourlystats');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 小时级统计', 8, 'delete_hourlystats');
INSERT INTO `auth_permission` VALUES (32, 'Can view 小时级统计', 8, 'view_hourlystats');
INSERT INTO `auth_permission` VALUES (33, 'Can add 推荐日志', 9, 'add_recommendlog');
INSERT INTO `auth_permission` VALUES (34, 'Can change 推荐日志', 9, 'change_recommendlog');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 推荐日志', 9, 'delete_recommendlog');
INSERT INTO `auth_permission` VALUES (36, 'Can view 推荐日志', 9, 'view_recommendlog');
INSERT INTO `auth_permission` VALUES (37, 'Can add UP主信息', 10, 'add_upcreator');
INSERT INTO `auth_permission` VALUES (38, 'Can change UP主信息', 10, 'change_upcreator');
INSERT INTO `auth_permission` VALUES (39, 'Can delete UP主信息', 10, 'delete_upcreator');
INSERT INTO `auth_permission` VALUES (40, 'Can view UP主信息', 10, 'view_upcreator');
INSERT INTO `auth_permission` VALUES (41, 'Can add 用户行为日志', 11, 'add_userbehavior');
INSERT INTO `auth_permission` VALUES (42, 'Can change 用户行为日志', 11, 'change_userbehavior');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 用户行为日志', 11, 'delete_userbehavior');
INSERT INTO `auth_permission` VALUES (44, 'Can view 用户行为日志', 11, 'view_userbehavior');
INSERT INTO `auth_permission` VALUES (45, 'Can add 视频信息', 12, 'add_video');
INSERT INTO `auth_permission` VALUES (46, 'Can change 视频信息', 12, 'change_video');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 视频信息', 12, 'delete_video');
INSERT INTO `auth_permission` VALUES (48, 'Can view 视频信息', 12, 'view_video');
INSERT INTO `auth_permission` VALUES (49, 'Can add 视频基本信息', 13, 'add_videobasic');
INSERT INTO `auth_permission` VALUES (50, 'Can change 视频基本信息', 13, 'change_videobasic');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 视频基本信息', 13, 'delete_videobasic');
INSERT INTO `auth_permission` VALUES (52, 'Can view 视频基本信息', 13, 'view_videobasic');
INSERT INTO `auth_permission` VALUES (53, 'Can add 视频分类', 14, 'add_videocategory');
INSERT INTO `auth_permission` VALUES (54, 'Can change 视频分类', 14, 'change_videocategory');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 视频分类', 14, 'delete_videocategory');
INSERT INTO `auth_permission` VALUES (56, 'Can view 视频分类', 14, 'view_videocategory');
INSERT INTO `auth_permission` VALUES (57, 'Can add 视频评论', 15, 'add_videocomment');
INSERT INTO `auth_permission` VALUES (58, 'Can change 视频评论', 15, 'change_videocomment');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 视频评论', 15, 'delete_videocomment');
INSERT INTO `auth_permission` VALUES (60, 'Can view 视频评论', 15, 'view_videocomment');
INSERT INTO `auth_permission` VALUES (61, 'Can add 视频动态指标', 16, 'add_videostats');
INSERT INTO `auth_permission` VALUES (62, 'Can change 视频动态指标', 16, 'change_videostats');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 视频动态指标', 16, 'delete_videostats');
INSERT INTO `auth_permission` VALUES (64, 'Can view 视频动态指标', 16, 'view_videostats');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$870000$3b6THOKFeQbKJb5McqPCWX$lQqvX9W2caWGd2P1AVC6U8/GwrOfTk+77Ens18xK7gg=', NULL, 1, 'asus', '', '', '123z456789@qq.com', 1, 1, '2025-03-09 11:00:05.033181');
INSERT INTO `auth_user` VALUES (2, '', '2025-03-13 09:40:47.359344', 0, 'admin', '', '', '', 0, 1, '2025-03-12 06:54:01.575178');
INSERT INTO `auth_user` VALUES (3, '', '2025-03-12 12:19:48.364572', 0, '1', '', '', '', 0, 1, '2025-03-12 07:14:16.838521');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_danmakudata
-- ----------------------------
DROP TABLE IF EXISTS `bstation_danmakudata`;
CREATE TABLE `bstation_danmakudata`  (
  `danmaku_id` bigint NOT NULL AUTO_INCREMENT,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `send_time` decimal(6, 2) NOT NULL,
  `sentiment` smallint NULL DEFAULT NULL,
  `cluster_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`danmaku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_danmakudata
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_hourlystats
-- ----------------------------
DROP TABLE IF EXISTS `bstation_hourlystats`;
CREATE TABLE `bstation_hourlystats`  (
  `stat_time` datetime(6) NOT NULL,
  `total_views` bigint UNSIGNED NOT NULL,
  `new_videos` int UNSIGNED NOT NULL,
  `active_users` int UNSIGNED NOT NULL,
  `category_dist` json NULL,
  PRIMARY KEY (`stat_time`) USING BTREE,
  CONSTRAINT `bstation_hourlystats_chk_1` CHECK (`total_views` >= 0),
  CONSTRAINT `bstation_hourlystats_chk_2` CHECK (`new_videos` >= 0),
  CONSTRAINT `bstation_hourlystats_chk_3` CHECK (`active_users` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_hourlystats
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_recommendlog
-- ----------------------------
DROP TABLE IF EXISTS `bstation_recommendlog`;
CREATE TABLE `bstation_recommendlog`  (
  `rec_id` bigint NOT NULL AUTO_INCREMENT,
  `user_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recommend_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_list` json NOT NULL,
  `rec_time` datetime(6) NOT NULL,
  PRIMARY KEY (`rec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_recommendlog
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_upcreator
-- ----------------------------
DROP TABLE IF EXISTS `bstation_upcreator`;
CREATE TABLE `bstation_upcreator`  (
  `author_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  `fans_count` int UNSIGNED NOT NULL,
  `total_views` bigint UNSIGNED NOT NULL,
  `avg_like_rate` double NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`author_mid`) USING BTREE,
  CONSTRAINT `bstation_upcreator_chk_1` CHECK (`level` >= 0),
  CONSTRAINT `bstation_upcreator_chk_2` CHECK (`fans_count` >= 0),
  CONSTRAINT `bstation_upcreator_chk_3` CHECK (`total_views` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_upcreator
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_userbehavior
-- ----------------------------
DROP TABLE IF EXISTS `bstation_userbehavior`;
CREATE TABLE `bstation_userbehavior`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `user_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `search_keyword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `device_info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_userbehavior
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_video
-- ----------------------------
DROP TABLE IF EXISTS `bstation_video`;
CREATE TABLE `bstation_video`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bv_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `up_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publish_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_video
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_videobasic
-- ----------------------------
DROP TABLE IF EXISTS `bstation_videobasic`;
CREATE TABLE `bstation_videobasic`  (
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `play_count` int NOT NULL,
  PRIMARY KEY (`bvid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_videobasic
-- ----------------------------
INSERT INTO `bstation_videobasic` VALUES ('BV0123456789', '手工达人：创意DIY教程', '012345', '0001-03-29 19:57:17.000000', 730, 853560);
INSERT INTO `bstation_videobasic` VALUES ('BV1234567890', '游戏精彩瞬间合集', '123456', '2025-03-13 19:23:00.000000', 1530, 567890);
INSERT INTO `bstation_videobasic` VALUES ('BV1Hx411w7Xk', '1', '1', '2025-03-11 19:01:00.000000', 213, 123);
INSERT INTO `bstation_videobasic` VALUES ('BV2345678901', '科技新品深度评测：性能全解析', '234567', '2050-10-30 09:01:00.000000', 1246, 345679);
INSERT INTO `bstation_videobasic` VALUES ('BV2468013579', '历史长河：鲜为人知的故事', '246801', '1234-03-08 19:55:17.000000', 1725, 398451);
INSERT INTO `bstation_videobasic` VALUES ('BV3456789012', '美食秘籍：大厨教你做硬菜', '345678', '0205-02-03 19:58:17.000000', 620, 234567);
INSERT INTO `bstation_videobasic` VALUES ('BV4567890123', '旅行日记：那些让人难忘的风景', '456789', '2045-12-11 17:04:00.000000', 1510, 123456);
INSERT INTO `bstation_videobasic` VALUES ('BV4680135792', '宠物乐园：萌宠饲养秘籍', '468013', '2025-03-03 20:01:00.000000', 570, 691234);
INSERT INTO `bstation_videobasic` VALUES ('BV5678901234', '学霸笔记：高效学习法大公开', '567890', '2025-03-12 05:05:00.000000', 1800, 456789);
INSERT INTO `bstation_videobasic` VALUES ('BV7890123456', '音乐之旅：探寻不同风格的魅力', '789012', '2025-03-12 05:03:00.000000', 345, 234567);
INSERT INTO `bstation_videobasic` VALUES ('BV9012345678', '体育传奇：那些经典的比赛瞬间', '901234', '2025-03-07 13:45:00.000000', 2120, 345678);

-- ----------------------------
-- Table structure for bstation_videocategory
-- ----------------------------
DROP TABLE IF EXISTS `bstation_videocategory`;
CREATE TABLE `bstation_videocategory`  (
  `category_id` smallint NOT NULL,
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_id` smallint NULL DEFAULT NULL,
  `business_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_videocategory
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_videocomment
-- ----------------------------
DROP TABLE IF EXISTS `bstation_videocomment`;
CREATE TABLE `bstation_videocomment`  (
  `rpid` bigint NOT NULL,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `like_num` int UNSIGNED NOT NULL,
  `sentiment_score` double NULL DEFAULT NULL,
  `topic_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rpid`) USING BTREE,
  CONSTRAINT `bstation_videocomment_chk_1` CHECK (`like_num` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_videocomment
-- ----------------------------

-- ----------------------------
-- Table structure for bstation_videostats
-- ----------------------------
DROP TABLE IF EXISTS `bstation_videostats`;
CREATE TABLE `bstation_videostats`  (
  `stat_id` bigint NOT NULL AUTO_INCREMENT,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `collect_time` datetime(6) NOT NULL,
  `view_count` int UNSIGNED NOT NULL,
  `danmaku_count` int UNSIGNED NOT NULL,
  `reply_count` int UNSIGNED NOT NULL,
  `favorite_count` int UNSIGNED NOT NULL,
  `coin_count` int UNSIGNED NOT NULL,
  `like_count` int UNSIGNED NOT NULL,
  PRIMARY KEY (`stat_id`) USING BTREE,
  INDEX `idx_collect_time`(`collect_time` ASC) USING BTREE,
  CONSTRAINT `bstation_videostats_chk_1` CHECK (`view_count` >= 0),
  CONSTRAINT `bstation_videostats_chk_2` CHECK (`danmaku_count` >= 0),
  CONSTRAINT `bstation_videostats_chk_3` CHECK (`reply_count` >= 0),
  CONSTRAINT `bstation_videostats_chk_4` CHECK (`favorite_count` >= 0),
  CONSTRAINT `bstation_videostats_chk_5` CHECK (`coin_count` >= 0),
  CONSTRAINT `bstation_videostats_chk_6` CHECK (`like_count` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bstation_videostats
-- ----------------------------

-- ----------------------------
-- Table structure for b站.user_groups
-- ----------------------------
DROP TABLE IF EXISTS `b站.user_groups`;
CREATE TABLE `b站.user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_groups_user_id_group_id`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `user_groups_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `user_groups_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b站.user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for danmaku_data
-- ----------------------------
DROP TABLE IF EXISTS `danmaku_data`;
CREATE TABLE `danmaku_data`  (
  `danmaku_id` bigint NOT NULL AUTO_INCREMENT,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '弹幕内容',
  `send_time` decimal(6, 2) NULL DEFAULT NULL COMMENT '发送时间(单位:秒)',
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '颜色代码',
  `font_size` tinyint NULL DEFAULT NULL COMMENT '字体大小',
  `pool_type` tinyint NULL DEFAULT NULL COMMENT '弹幕池类型',
  `sentiment` tinyint NULL DEFAULT NULL COMMENT '情感分类(1-正向 0-中性 -1-负向)',
  PRIMARY KEY (`danmaku_id`) USING BTREE,
  INDEX `idx_video_time`(`bvid` ASC, `send_time` ASC) USING BTREE,
  CONSTRAINT `danmaku_data_ibfk_1` FOREIGN KEY (`bvid`) REFERENCES `video_basic` (`bvid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danmaku_data
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'bstation', 'danmakudata');
INSERT INTO `django_content_type` VALUES (8, 'bstation', 'hourlystats');
INSERT INTO `django_content_type` VALUES (9, 'bstation', 'recommendlog');
INSERT INTO `django_content_type` VALUES (10, 'bstation', 'upcreator');
INSERT INTO `django_content_type` VALUES (11, 'bstation', 'userbehavior');
INSERT INTO `django_content_type` VALUES (12, 'bstation', 'video');
INSERT INTO `django_content_type` VALUES (13, 'bstation', 'videobasic');
INSERT INTO `django_content_type` VALUES (14, 'bstation', 'videocategory');
INSERT INTO `django_content_type` VALUES (15, 'bstation', 'videocomment');
INSERT INTO `django_content_type` VALUES (16, 'bstation', 'videostats');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-03-08 08:25:23.510037');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-03-08 08:25:24.236839');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-03-08 08:25:24.405258');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-03-08 08:25:24.413824');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-08 08:25:24.421301');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-03-08 08:25:24.511562');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-03-08 08:25:24.580456');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-03-08 08:25:24.602577');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-03-08 08:25:24.610366');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-03-08 08:25:24.672492');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-03-08 08:25:24.675526');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-08 08:25:24.683506');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-03-08 08:25:24.755419');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-08 08:25:24.818730');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-03-08 08:25:24.838900');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-03-08 08:25:24.850329');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-08 08:25:24.924141');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2025-03-08 08:25:24.961895');
INSERT INTO `django_migrations` VALUES (19, 'bstation', '0001_initial', '2025-03-12 07:36:46.275903');
INSERT INTO `django_migrations` VALUES (20, 'bstation', '0002_alter_video_id', '2025-03-12 09:10:11.157519');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('vfdtk90xqz12zahon8tqhnoh6fn1rb4d', '.eJxVjMsOwiAURP-FtSEIvYAu3fsN5D5QqoYmpV0Z_12adKGbWcw5M2-VcF1KWlue0yjqrKxRh9-SkJ-5bkQeWO-T5qku80h6U_ROm75Okl-X3f07KNhKXxugANaCpxyddxLRHcOAMRCLJ-ONdZQ7DQNwTybIEK0wnjzfJAT1-QLvKDgJ:1tzc4h:uuQL7KzvQs4d3o9ogUUXrAliDCO4YTbGRhd3VXuHRPc', '2025-04-15 13:54:43.326014');
INSERT INTO `django_session` VALUES ('vwty1w9mqzn2r17s1d4dmpwcr7aov7r7', '.eJxVjMsOwiAURP-FtSEIvYAu3fsN5D5QqoYmpV0Z_12adKGbWcw5M2-VcF1KWlue0yjqrKxRh9-SkJ-5bkQeWO-T5qku80h6U_ROm75Okl-X3f07KNhKXxugANaCpxyddxLRHcOAMRCLJ-ONdZQ7DQNwTybIEK0wnjzfJAT1-QLvKDgJ:1tzc48:D3Rz6nzirq9FWuVJV3bT07zBnUknVRBko3Ef4fCPJtw', '2025-04-15 13:54:08.984556');
INSERT INTO `django_session` VALUES ('wfkckg6lsybe3mbw3kf37lq9m5ghlhzu', '.eJxVjDsOwjAQRO_iGln-ZBObkj5nsNbrNQ4gR4qTCnF3EikFNFPMezNvEXBbS9gaL2FK4iqMuPx2EenJ9QDpgfU-S5rrukxRHoo8aZPjnPh1O92_g4Kt7GvQpG12BroOHQ9sHKFKwLqHFL02aD15y9Yp3gOyMuT7nBRYg4MDFJ8v1Ag3dg:1tsXCG:RqlBMqnEPnv_gTfKD9AUqzaDTpnK1kY7AsWQl_qiljM', '2025-03-27 01:17:16.450718');

-- ----------------------------
-- Table structure for edit
-- ----------------------------
DROP TABLE IF EXISTS `edit`;
CREATE TABLE `edit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bvid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_mid` int NOT NULL,
  `play` int NULL DEFAULT 0,
  `pub_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bvid`(`bvid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edit
-- ----------------------------

-- ----------------------------
-- Table structure for up_creator
-- ----------------------------
DROP TABLE IF EXISTS `up_creator`;
CREATE TABLE `up_creator`  (
  `author_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'UP主MID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'UP主名称',
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别(0-保密 1-男 2-女)',
  `level` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '等级',
  `sign` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '个人签名',
  `fans_count` int UNSIGNED NULL DEFAULT 0 COMMENT '粉丝数',
  `total_views` bigint UNSIGNED NULL DEFAULT 0 COMMENT '总播放量',
  `total_likes` bigint UNSIGNED NULL DEFAULT 0 COMMENT '总获赞数',
  PRIMARY KEY (`author_mid`) USING BTREE,
  INDEX `idx_fans`(`fans_count` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of up_creator
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名（唯一）',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加密后的密码',
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL COMMENT '出生日期',
  `registration_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册IP地址',
  `last_login` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `is_locked` tinyint(1) NULL DEFAULT 0 COMMENT '账户是否锁定',
  `failed_attempts` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '连续登录失败次数',
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_staff` tinyint(1) NULL DEFAULT 0,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `date_joined` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_created`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (9, 'admin', 'pbkdf2_sha256$870000$GFbdMthMkbQTEkvvDXzCqM$zOSTeSRz7gAHQisdLg5CdYiiI6uBPboeXkM/5DgcpfY=', '12345678@qq.com', NULL, NULL, NULL, '', '2025-03-18 05:26:45', '2025-03-18 05:00:12', '2025-03-18 13:26:45', 0, 0, 1, NULL, NULL, 1, 1, '2025-03-18 05:00:12');
INSERT INTO `user` VALUES (10, 'root', 'pbkdf2_sha256$870000$1NHrSuVd01V3ME9LP3Qlcw$l6PN8trW4YbhI783PzFRQgXye49GZlgTYz7aoC6kKpM=', '12345678@qq.com', NULL, NULL, NULL, '', NULL, '2025-03-18 07:43:28', '2025-03-18 07:43:28', 0, 0, 1, NULL, NULL, 1, 1, '2025-03-18 07:43:28');
INSERT INTO `user` VALUES (11, 'admin1', 'pbkdf2_sha256$870000$AxVkWCvNjfVnmVbybJE1Z7$tqUlOnsrtn8aXAFyJTQ9eQiSIWaoGMxhmpOTbQVlaHA=', '1234569@qq.com', 'None', 'None', NULL, '', '2025-04-01 05:26:05', '2025-03-18 07:44:50', '2025-04-01 13:26:04', 0, 0, 0, NULL, NULL, 1, 1, '2025-03-18 07:44:50');
INSERT INTO `user` VALUES (16, 'root1', 'pbkdf2_sha256$870000$492EvAhD1GwXAozaj1gD9H$f+VtF6dBzkDHCbEc3rn0h1g3ik1neummGVhVVzMlMes=', '23121211@1', '123456789', 'CN', '2024-12-31', '127.0.0.1', '2025-03-24 10:36:32', '2025-03-19 01:55:50', '2025-03-24 18:36:31', 0, 0, 0, NULL, NULL, 0, 1, '2025-03-19 01:55:50');
INSERT INTO `user` VALUES (17, 'root2', 'pbkdf2_sha256$870000$AReRHbiDmvMS7hIIeSDsnm$ksAw1e5pMi6dDuKyr9PfvzxWosxMgs9g7FzFCb6flEI=', '234234234@1', '123456789', 'CN', '2024-12-27', '127.0.0.1', '2025-03-19 02:01:48', '2025-03-19 02:01:48', '2025-03-19 10:01:47', 0, 0, 0, NULL, NULL, 0, 1, '2025-03-19 02:01:48');
INSERT INTO `user` VALUES (19, 'admin2', 'pbkdf2_sha256$870000$GujyBnjvkexxugXCm8cx8W$CJIn9Aa7YC9gBlYaLKr+4QGkB9gXoqFxFb+jOHYdQDM=', '1@1', '123456789', 'JP', '2024-12-24', '127.0.0.1', '2025-03-19 06:40:35', '2025-03-19 06:39:44', '2025-03-19 14:40:34', 0, 0, 0, NULL, NULL, 0, 1, '2025-03-19 06:39:44');
INSERT INTO `user` VALUES (20, 'admin34', 'pbkdf2_sha256$870000$03EmACliXpzRrxglJxta8j$VW+2CwKhFYZUxswxWNm0O4UJjqlZyNzDKWLFr5nJYtc=', '1@323', '123456789', '23', '2025-03-18', '127.0.0.1', '2025-04-01 13:54:43', '2025-03-21 06:42:56', '2025-04-01 21:54:43', 0, 0, 1, NULL, NULL, 0, 1, '2025-03-21 06:42:56');
INSERT INTO `user` VALUES (24, 'abc', 'pbkdf2_sha256$870000$7O7glYJX3T6AioO2O7NdEp$28K9lw1TQ7mVU7uSimqvTTVwn52mzTWQAAFbBVHWLWY=', '1@1', '123456789', 'CN', '2024-12-31', '127.0.0.1', '2025-03-21 10:14:05', '2025-03-21 10:14:05', '2025-03-21 18:14:04', 0, 0, 0, NULL, NULL, 0, 1, '2025-03-21 10:14:05');
INSERT INTO `user` VALUES (25, 'admin5', 'pbkdf2_sha256$870000$WhhtqVwafumQR1zQ4nQLlq$mNP6mvU2wWVtzk0cwgN4wtme6HKX/1visS7Q2MkYfU0=', '1@1', '1234567891', '31', '2025-03-26', '127.0.0.1', '2025-03-24 11:03:38', '2025-03-24 11:03:01', '2025-03-24 19:03:38', 0, 0, 1, NULL, NULL, 0, 1, '2025-03-24 11:03:01');
INSERT INTO `user` VALUES (26, '1', 'pbkdf2_sha256$870000$nlSmBqkQR5Hz1Y8lwftOMi$Qx6pwlA1mGrXL3IW/alvVS4dNCxHfyj9XhlwZhtHMgM=', '1@1', '123456789', 'CN', '2024-12-25', '127.0.0.1', '2025-03-25 08:15:18', '2025-03-25 08:15:18', '2025-03-25 16:15:17', 0, 0, 0, NULL, NULL, 0, 1, '2025-03-25 08:15:18');

-- ----------------------------
-- Table structure for user_behavior
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior`;
CREATE TABLE `user_behavior`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `user_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_type` enum('view','like','coin','collect','share') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` int NULL DEFAULT NULL COMMENT '观看时长(秒)',
  `device_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `idx_user_behavior`(`user_mid` ASC, `action_type` ASC) USING BTREE,
  INDEX `bvid`(`bvid` ASC) USING BTREE,
  CONSTRAINT `user_behavior_ibfk_1` FOREIGN KEY (`bvid`) REFERENCES `video_basic` (`bvid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior
-- ----------------------------

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for video_basic
-- ----------------------------
DROP TABLE IF EXISTS `video_basic`;
CREATE TABLE `video_basic`  (
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `play_count` int NOT NULL,
  PRIMARY KEY (`bvid`) USING BTREE,
  INDEX `idx_pub_time`(`pub_time` ASC) USING BTREE,
  INDEX `author_mid`(`author_mid` ASC) USING BTREE,
  CONSTRAINT `video_basic_ibfk_1` FOREIGN KEY (`author_mid`) REFERENCES `up_creator` (`author_mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_basic
-- ----------------------------

-- ----------------------------
-- Table structure for video_category
-- ----------------------------
DROP TABLE IF EXISTS `video_category`;
CREATE TABLE `video_category`  (
  `category_id` smallint NOT NULL,
  `parent_id` smallint NULL DEFAULT NULL COMMENT '父分区ID',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `business_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_category
-- ----------------------------

-- ----------------------------
-- Table structure for video_comment
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`  (
  `rpid` bigint NOT NULL COMMENT '评论RPID',
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户MID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `like_num` int UNSIGNED NULL DEFAULT 0 COMMENT '点赞数',
  `ctime` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `sentiment_score` float NULL DEFAULT NULL COMMENT '情感分析得分(-1~1)',
  PRIMARY KEY (`rpid`) USING BTREE,
  INDEX `idx_video_sentiment`(`bvid` ASC, `sentiment_score` ASC) USING BTREE,
  CONSTRAINT `video_comment_ibfk_1` FOREIGN KEY (`bvid`) REFERENCES `video_basic` (`bvid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_comment
-- ----------------------------

-- ----------------------------
-- Table structure for video_stats
-- ----------------------------
DROP TABLE IF EXISTS `video_stats`;
CREATE TABLE `video_stats`  (
  `stat_id` bigint NOT NULL AUTO_INCREMENT,
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `collect_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `view_count` int UNSIGNED NULL DEFAULT 0 COMMENT '播放量',
  `danmaku_count` int UNSIGNED NULL DEFAULT 0 COMMENT '弹幕数',
  `reply_count` int UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `favorite_count` int UNSIGNED NULL DEFAULT 0 COMMENT '收藏量',
  `coin_count` int UNSIGNED NULL DEFAULT 0 COMMENT '投币数',
  `share_count` int UNSIGNED NULL DEFAULT 0 COMMENT '分享量',
  `like_count` int UNSIGNED NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`stat_id`) USING BTREE,
  INDEX `idx_video_time`(`bvid` ASC, `collect_time` ASC) USING BTREE,
  CONSTRAINT `video_stats_ibfk_1` FOREIGN KEY (`bvid`) REFERENCES `video_basic` (`bvid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_stats
-- ----------------------------

-- ----------------------------
-- Table structure for videobasic
-- ----------------------------
DROP TABLE IF EXISTS `videobasic`;
CREATE TABLE `videobasic`  (
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pub_time` datetime NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `play_count` int NOT NULL,
  PRIMARY KEY (`bvid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videobasic
-- ----------------------------

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `bvid` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'B站视频唯一标识，格式：BV+10字符',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频标题（最大支持73个汉字）',
  `author_mid` bigint UNSIGNED NOT NULL COMMENT 'UP主唯一标识（B站MID体系）',
  `play_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数（缓存更新周期1小时）',
  `pub_time` datetime NULL DEFAULT NULL COMMENT '精确到秒的发布时间（UTC时间）',
  `duration` int UNSIGNED NULL DEFAULT NULL COMMENT '视频总时长（单位：秒）',
  `category_id` smallint UNSIGNED NULL DEFAULT NULL COMMENT '关联video_categories表的分区ID',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最多支持5个标签，每个标签最长20字符',
  PRIMARY KEY (`bvid`) USING BTREE,
  INDEX `idx_author_pub`(`author_mid` ASC, `pub_time` ASC) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE,
  INDEX `idx_pubtime`(`pub_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频基础信息表（数据量预估：1000万行/年）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videos
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
