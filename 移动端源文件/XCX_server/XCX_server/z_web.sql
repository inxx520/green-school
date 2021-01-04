/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : localhost:3306
 Source Schema         : z_web

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : 65001

 Date: 27/09/2019 08:22:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xw_data
-- ----------------------------
DROP TABLE IF EXISTS `xw_data`;
CREATE TABLE `xw_data`  (
  `XW_id` int(11) NOT NULL AUTO_INCREMENT,
  `XW_topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `XW_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `XW_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `XW_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `XW_check` tinyint(255) DEFAULT 0,
  PRIMARY KEY (`XW_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for yh_data
-- ----------------------------
DROP TABLE IF EXISTS `yh_data`;
CREATE TABLE `yh_data`  (
  `YH_id` int(11) NOT NULL AUTO_INCREMENT,
  `YH_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `YH_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`YH_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
