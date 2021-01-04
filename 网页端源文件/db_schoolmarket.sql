/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : db_secondhandmarket

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 30/06/2019 01:14:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `userRole` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `number` int(11) NULL DEFAULT 0 COMMENT '该分类下的商品数量',
  `status` tinyint(10) NULL DEFAULT 0 COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES (1, '闲置数码', 6, 1);
INSERT INTO `catelog` VALUES (2, '校园代步', 3, 1);
INSERT INTO `catelog` VALUES (3, '电器日用', 2, 1);
INSERT INTO `catelog` VALUES (4, '图书教材', 6, 1);
INSERT INTO `catelog` VALUES (5, '美妆衣物', 3, 1);
INSERT INTO `catelog` VALUES (6, '运动棋牌', 2, 1);
INSERT INTO `catelog` VALUES (7, '票券小物', 1, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES (1, 21, 32);
INSERT INTO `focus` VALUES (2, 23, 32);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) NULL DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11, 2) NULL DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下架时间',
  `describle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catelog_id`(`catelog_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 5, 32, '安奈赛', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '好用的防晒霜', 1);
INSERT INTO `goods` VALUES (2, 5, 32, 'Coach女(真皮)袋', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '香港Sogo专柜购入', 1);
INSERT INTO `goods` VALUES (5, 4, 32, 'Java 疯狂讲义', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '电子工业出版社，王刚编著，Java修炼必备！', 1);
INSERT INTO `goods` VALUES (6, 1, 32, '华为mate9 4+64', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '华为制造，备用机，暂时出租。', 1);
INSERT INTO `goods` VALUES (7, 2, 32, '自行车', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '自行车 暂时出租！', 1);
INSERT INTO `goods` VALUES (8, 2, 32, '山地自行车', NULL, NULL, '2019-06-29', '2019-06-29', '2019-07-09', '9成新，暑假出租！', 1);
INSERT INTO `goods` VALUES (9, 7, 32, '2019超级巨星（湛江）演唱会', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '【湛江】2019超级巨星（湛江）演唱会 8.02', 0);
INSERT INTO `goods` VALUES (10, 6, 32, 'Nike双肩包', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', 'Nike双肩包Kyrie欧文篮球运动休闲双肩背包户外旅行包', 1);
INSERT INTO `goods` VALUES (11, 1, 32, 'hp zhan G2 pro笔记本', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', 'hp zhan G2 pro笔记本', 1);
INSERT INTO `goods` VALUES (12, 3, 32, '电热水壶', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '电热水壶', 1);
INSERT INTO `goods` VALUES (13, 4, 32, '计算机图形学与实践教程', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '黄静院长多年教学经验积累，独一无二！', 1);
INSERT INTO `goods` VALUES (14, 1, 32, 'C#程序设计实践', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '侯春英 任华主编', 10);
INSERT INTO `goods` VALUES (15, 4, 32, 'C#程序设计实践', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '侯春英 任华主编', 1);
INSERT INTO `goods` VALUES (16, 1, 32, '苹果 7 128g', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '苹果 7 128g 九成新', 1);
INSERT INTO `goods` VALUES (17, 2, 34, '山地自行车', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '暑假出租山地自行车，有意者私聊', 1);
INSERT INTO `goods` VALUES (18, 1, 34, '电瓶车', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '暂时出租,有意私聊！', 1);
INSERT INTO `goods` VALUES (19, 4, 34, 'C++ 程序设计教程', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '传智播客高教产品研发中心 编著', 1);
INSERT INTO `goods` VALUES (20, 1, 34, 'ipad mini4 128g', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '短暂出租，9成新', 0);
INSERT INTO `goods` VALUES (21, 1, 34, 'snoy 音响', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', 'snoy 音响', 1);
INSERT INTO `goods` VALUES (22, 4, 34, '计算机网络', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '谢希仁 主编', 1);
INSERT INTO `goods` VALUES (23, 4, 34, '数据结构与算法', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '顺哥推荐，值得拥有！', 0);
INSERT INTO `goods` VALUES (24, 3, 34, '宿舍用锅', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '宿舍用锅', 1);
INSERT INTO `goods` VALUES (25, 5, 34, '爱茉莉唇釉', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '韩国爱茉莉唇釉', 1);
INSERT INTO `goods` VALUES (26, 6, 34, 'AJ吉米巴特勒篮球鞋', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', 'AJ吉米巴特勒篮球鞋', 1);
INSERT INTO `goods` VALUES (27, 4, 34, 'web应用开发', NULL, NULL, '2019-06-30', '2019-06-30', '2019-07-10', '王同学想要的web开发', 10);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, 1, 'a4aa81ba-a170-436e-949d-d4c30073b049.png');
INSERT INTO `image` VALUES (2, 2, '4fab3e84-4cef-4235-bbda-202fd46ecb68.jpg');
INSERT INTO `image` VALUES (5, 5, 'ed75fc56-6824-40d5-8509-7998f3fbe36c.jpg');
INSERT INTO `image` VALUES (6, 6, '59b5647e-173e-40d4-82a7-84d9148791b7.jpg');
INSERT INTO `image` VALUES (7, 7, '8268e788-1ac0-4306-8d6f-5f87bb108174.jpg');
INSERT INTO `image` VALUES (8, 8, '9fc5b6e3-9e6d-4667-883d-17c8b0258aab.jpg');
INSERT INTO `image` VALUES (9, 9, '00d260e0-5b6b-4cd6-bc7b-e6d482d2ec8b.png');
INSERT INTO `image` VALUES (10, 10, 'db8acd37-1ff1-4967-aa77-9403f0c4a06e.jpg');
INSERT INTO `image` VALUES (11, 11, '41234f8c-943b-48b6-9ae7-c2b43e8ebcda.jpg');
INSERT INTO `image` VALUES (12, 12, 'dadd44f4-dc5d-4cf3-8e97-c455a6fe4bfe.jpg');
INSERT INTO `image` VALUES (13, 13, 'df20731c-7bd7-4c5c-b167-68fa88706175.jpg');
INSERT INTO `image` VALUES (14, 14, '0770c2ee-d0cf-41b8-bc79-741e44885f18.jpg');
INSERT INTO `image` VALUES (15, 15, '2cea497d-742c-4674-9e63-8f9a7533d59b.jpg');
INSERT INTO `image` VALUES (16, 16, '1190ca0b-f514-486c-a881-43390f59e10f.jpg');
INSERT INTO `image` VALUES (17, 17, '7a663c05-5ecf-4259-ba1f-f01432efc74d.png');
INSERT INTO `image` VALUES (18, 18, 'b5d774ab-5892-4aca-8685-3fef5b68494a.jpg');
INSERT INTO `image` VALUES (19, 19, '3ae36503-7c17-432e-aaef-cc664cbf4939.jpg');
INSERT INTO `image` VALUES (20, 20, '0abb2d06-5048-4d2e-8c4f-68a109103839.jpg');
INSERT INTO `image` VALUES (21, 21, 'd4b56010-48aa-4fff-8691-2a39ef272ed9.jpg');
INSERT INTO `image` VALUES (22, 22, '9ec6dcb2-10cb-4884-bb7d-2fdf1840a1d5.jpg');
INSERT INTO `image` VALUES (23, 23, '766f5b81-7a64-429b-8c84-60625317dab3.jpg');
INSERT INTO `image` VALUES (24, 24, '4874e381-0e61-40bb-87a2-d1f53e6959a1.jpg');
INSERT INTO `image` VALUES (25, 25, 'a14ecfba-d14c-4d56-ad5b-6c43b798f650.jpg');
INSERT INTO `image` VALUES (26, 26, '7cfc1f6f-dc24-4d54-8e79-b07109ca1dbc.jpg');
INSERT INTO `image` VALUES (27, 27, '7b10d59c-9174-43d0-865b-ce4f91b161c5.jpg');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户，外键',
  `context` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '信息内容',
  `create_at` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 32, '请问', '2019-06-29 21:03:40', 0);
INSERT INTO `notice` VALUES (2, 32, '想要求购一个web应用开发', '2019-06-30 00:55:28', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) NULL DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11, 0) NULL DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) NULL DEFAULT 1 COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 34, 9, 21914540, NULL, 1, '', '2019-06-30 12:37:11');
INSERT INTO `orders` VALUES (2, 32, 20, 6874272, NULL, 1, '', '2019-06-30 12:40:41');
INSERT INTO `orders` VALUES (3, 34, 10, 46764174, NULL, 3, '请尽快联系我', '2019-06-30 12:53:01');
INSERT INTO `orders` VALUES (4, 32, 23, 5806514, NULL, 1, '', '2019-06-30 12:54:44');

-- ----------------------------
-- Table structure for purse
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11, 0) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '总钱数',
  `recharge` float(11, 0) NULL DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11, 0) NULL DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES (27, 32, NULL, NULL, NULL, NULL);
INSERT INTO `purse` VALUES (28, 33, 00000000000, NULL, NULL, NULL);
INSERT INTO `purse` VALUES (29, 34, NULL, NULL, NULL, NULL);
INSERT INTO `purse` VALUES (30, 35, 00000000000, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) NULL DEFAULT NULL,
  `commet_id` int(11) NULL DEFAULT NULL COMMENT '评论，外键',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `create_at` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) NULL DEFAULT 0 COMMENT '发布过的物品数量',
  `power` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000100 COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (32, '16607563241', '王炳生', '202CB962AC59075B964B07152D234B70', '12345678', '2019-06-29 18:42', 13, 0000000110, NULL, 1);
INSERT INTO `user` VALUES (33, '11111111111', '阿斯顿', '202CB962AC59075B964B07152D234B70', '11223344', '2019-06-29 21:04', 0, 0000000100, NULL, 1);
INSERT INTO `user` VALUES (34, '13390872233', 'zhuchuanqiang', '202CB962AC59075B964B07152D234B70', '6666666', '2019-06-29 22:57', 10, 0000000100, NULL, 1);
INSERT INTO `user` VALUES (35, '13099998888', '张三', '202CB962AC59075B964B07152D234B70', NULL, '2019-06-30 00:33', 0, 0000000100, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
