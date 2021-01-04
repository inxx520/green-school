/*
 Navicat Premium Data Transfer

 Source Server         : webapps
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : localhost:3306
 Source Schema         : z_web

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : 65001

 Date: 01/07/2020 15:18:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `userRole` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT 0 COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT 0 COMMENT '分类状态，0正常，1暂用',
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
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
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
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` float(11, 2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11, 2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下架时间',
  `describle` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '详细信息',
  `status` int(11) DEFAULT 1 COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catelog_id`(`catelog_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 5, 32, '安奈赛', 50.00, 188.00, '2020-06-20', '2020-06-20', '2020-07-09', '好用的防晒霜', 1);
INSERT INTO `goods` VALUES (2, 5, 32, 'Coach女(真皮)袋', 500.00, 1000.00, '2020-06-20', '2020-06-20', '2020-07-09', '香港Sogo专柜购入', 1);
INSERT INTO `goods` VALUES (5, 4, 32, 'Java 疯狂讲义', 10.00, 43.00, '2020-06-20', '2020-06-20', '2020-07-09', '电子工业出版社，王刚编著，Java修炼必备！', 1);
INSERT INTO `goods` VALUES (6, 1, 32, '华为mate9 4+64', 2000.00, 3000.00, '2020-06-20', '2020-06-20', '2020-07-09', '华为制造，备用机，暂时出租。', 1);
INSERT INTO `goods` VALUES (7, 2, 32, '自行车', 300.00, 600.00, '2020-06-20', '2020-06-20', '2020-07-09', '自行车 暂时出租！', 1);
INSERT INTO `goods` VALUES (8, 2, 32, '山地自行车', 900.00, 1200.00, '2020-06-20', '2020-06-20', '2020-07-09', '9成新，暑假出租！', 1);

-- ----------------------------
-- Table structure for gps_data
-- ----------------------------
DROP TABLE IF EXISTS `gps_data`;
CREATE TABLE `gps_data`  (
  `GPS_jd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GPS_wd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GPS_jl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gps_data
-- ----------------------------
INSERT INTO `gps_data` VALUES ('113.54', '22.357', '1250.12');
INSERT INTO `gps_data` VALUES ('113.54', '22.357', '1250.12');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, 1, 'a4aa81ba-a170-436e-949d-d4c30073b049.png');
INSERT INTO `image` VALUES (2, 2, '4fab3e84-4cef-4235-bbda-202fd46ecb68.jpg');
INSERT INTO `image` VALUES (5, 5, 'ed75fc56-6824-40d5-8509-7998f3fbe36c.jpg');
INSERT INTO `image` VALUES (6, 6, '59b5647e-173e-40d4-82a7-84d9148791b7.jpg');
INSERT INTO `image` VALUES (7, 7, '8268e788-1ac0-4306-8d6f-5f87bb108174.jpg');
INSERT INTO `image` VALUES (8, 8, '9fc5b6e3-9e6d-4667-883d-17c8b0258aab.jpg');

-- ----------------------------
-- Table structure for new_data
-- ----------------------------
DROP TABLE IF EXISTS `new_data`;
CREATE TABLE `new_data`  (
  `xwid` int(11) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xwtime` date DEFAULT NULL,
  `xwpic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `copic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`xwid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of new_data
-- ----------------------------
INSERT INTO `new_data` VALUES (1, '以“生态绿色”助力一体化', '人民网', '原创', '2019-12-05', 'http://localhost:8080/XCX_server/pic/changjiang.jpeg', '日前，《长三角生态绿色一体化发展示范区总体方案》出台，这一示范区横跨沪苏浙，涵盖上海青浦区、江苏苏州吴江区和浙江嘉兴嘉善县。首先要注重的是自然环境的生态绿色。青吴嘉三地，湖泊纵横，河港密布，是典型的江南水乡。以其中区域面积最大的吴江区为例，该区近1180平方公里，湖泊众多，水域面积占全区面积两成以上。水是江南的灵魂，也是示范区独特的资源之一。如何落实“绿水青山就是金山银山”理念，应当是示范区首要考虑的问题。', 'http://localhost:8080/XCX_server/pic/rmw.png');
INSERT INTO `new_data` VALUES (2, '用铁的纪律呵护绿水青山', '中国环境报', '原创', '2019-12-05', 'http://localhost:8080/XCX_server/pic/glass.jpg', '中央生态环保督察工作启动以来，各级纪检监察机关立足“监督的再监督”这一定位，综合运用各种问责手段，查处了不少生态环境领域不担当不作为、形式主义、官僚主义突出问题，形成了强烈震慑。为政之要，莫先乎人；成事之要，关键在人。”打好污染防治攻坚战，必须打造一支政治强、本领高、作风硬、敢担当，特别能吃苦、特别能战斗、特别能奉献的生态环保铁军，要把党员干部从政行为的纪律规矩红线和生态环境保护的政策法规红线一起抓、一起守，用铁的纪律为绿水青山保驾护航。', 'http://localhost:8080/XCX_server/pic/hjb.png');
INSERT INTO `new_data` VALUES (3, '山西治汾河流域入河排污口', '中国环境报', '原创', '2019-12-05', 'http://localhost:8080/XCX_server/pic/river.jpg', '山西省近日全面完成汾河流域入河排污口整治工作。这为促进汾河流域水环境质量明显改善，实现汾河“水量丰起来，水质好起来，风光美起来”奠定坚实基础。汾河流域治理是一项系统性、综合性工程。借鉴长江流域入河排污口整治工作经验做法，山西省将按照“查、测、溯、治”的工作原则来推进。', 'http://localhost:8080/XCX_server/pic/hjb.png');
INSERT INTO `new_data` VALUES (4, '林山花海扮靓美丽滇池', '人民网', '非原创', '2020-03-13', 'http://localhost:8080/XCX_server/pic/flower.jpg', '云南省昆明市晋宁区近年来主打绿色生态牌，不断掀起滇池保卫战，通过每年绿化造林，有效改善了滇池流域生态环境。今年以来，晋宁保护母亲湖的力度不断加大，通过滇池流域“廊道面山绿化造林、车桑子点播、低效林改造、桉树替换”工程，大面积修复滇池面山生态植被，现已完成1800亩造林工程。', 'http://localhost:8080/XCX_server/pic/rmw.png');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '信息内容',
  `create_at` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
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
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11, 0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT 1 COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下单时间',
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
  `balance` float(11, 0) UNSIGNED ZEROFILL DEFAULT 00000000000 COMMENT '总钱数',
  `recharge` float(11, 0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11, 0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
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
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `create_at` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sp_data
-- ----------------------------
DROP TABLE IF EXISTS `sp_data`;
CREATE TABLE `sp_data`  (
  `spid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spnum` int(11) NOT NULL AUTO_INCREMENT,
  `spmc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `sppic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `spinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `spjg` int(255) DEFAULT 0,
  `spkc` int(255) DEFAULT 0,
  PRIMARY KEY (`spnum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sp_data
-- ----------------------------
INSERT INTO `sp_data` VALUES ('001', 1, '善行2000', 'http://localhost:8080/XCX_server/pic/001.jpg', '由中国扶贫基金会发起，通过整合社会资源，支持高校公益社团发展，带动大学生参与公益，从而促进青年大学生了解公益慈善，培育现代公益理念，推动中国公益未来的发展。并通过校园社团公益活动的开展，培育出一批有理想、有爱心、有能力的中国未来公益的栋梁之才。', 15, 20);
INSERT INTO `sp_data` VALUES ('002', 2, '日行万步', 'http://localhost:8080/XCX_server/pic/002.jpg', '卫生部门倡导日行6000到10000步，目的是让大家做到吃、动两平衡，避免因生活条件改善引起的营养过剩、超重肥胖等亚健康症状。', 25, 30);
INSERT INTO `sp_data` VALUES ('003', 3, '垃圾分类', 'http://localhost:8080/XCX_server/pic/003.jpg', '垃圾分类是对垃圾收集处置传统方式的改革，是对垃圾进行有效处置的一种科学管理方法。人们面对日益增长的垃圾产量和环境状况恶化的局面，如何通过垃圾分类管理，最大限度地实现垃圾资源利用，减少垃圾处置的数量，改善生存环境状态，是当前世界各国共同关注的迫切问题。', 85, 60);
INSERT INTO `sp_data` VALUES ('004', 4, '光盘行动', 'http://localhost:8080/XCX_server/pic/004.jpg', '光盘行动的宗旨：餐厅不多点、食堂不多打、厨房不多做。养成生活中珍惜粮食、厉行节约反对浪费的习惯，而不要只是一场行动。不只是在餐厅吃饭打包，而是按需点菜，在食堂按需打饭，在家按需做饭。正在发起的“光盘行动”，试图提醒与告诫人们：饥饿距离我们并不遥远，而即便时至今日，珍惜粮食，节约粮食仍是需要遵守的古老美德之一。', 90, 100);
INSERT INTO `sp_data` VALUES ('005', 5, '熄灯一小时', 'http://localhost:8080/XCX_server/pic/005.jpg', '地球一小时（Earth Hour）是世界自然基金会（WWF）应对全球气候变化所提出的一项全球性节能活动，提倡于每年三月最后一个星期六的当地时间晚上20:30（2019年地球一小时时间为3月30日晚上20：30），家庭及商界用户关上不必要的电灯及耗电产品一小时，以此来表明他们对应对气候变化行动的支持。 [1]  过量二氧化碳排放导致的气候变化目前已经极大地威胁到地球上人类的生存。公众只有通过改变全球民众对于二氧化碳排放的态度，才能减轻这一威胁对世界造成的影响。', 152, 1000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT 0 COMMENT '发布过的物品数量',
  `power` int(10) UNSIGNED ZEROFILL DEFAULT 0000000100 COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT 0 COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (35, '13099998888', '张三', '202CB962AC59075B964B07152D234B70', NULL, '2019-06-30 00:33', 0, 0000000100, NULL, 1);

-- ----------------------------
-- Table structure for wuser
-- ----------------------------
DROP TABLE IF EXISTS `wuser`;
CREATE TABLE `wuser`  (
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avactor_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wuser
-- ----------------------------
INSERT INTO `wuser` VALUES ('ㅤ', 'http://thirdwx.qlogo.cn/mmopen/wu83wmVhX8LMsCVxEiblO2M5CvKK4z455u0ZknIKus4DmicByibnYO9FHMtKlibnuibiaYWgvdp9DeWBYdkQaEzUkp8icsvBZpa4a8x/132', '立陶宛', 'ocJWB1TMmEuzYI66OMmyICModQ6c');
INSERT INTO `wuser` VALUES ('Ryker Mark', 'http://thirdwx.qlogo.cn/mmopen/ZGUNpvTeib5Ga7bJaT77O2g7x5pq08qMphWQC51IlPBjxXcb6c21nWzgZsFkttZQ7ic2vq0NrctJ7eCk5JSfAibjZ3ftOXCpK3k/132', '中国', 'ocJWB1ecwpgrkQlEa88skPLNjLfg');
INSERT INTO `wuser` VALUES ('e', 'http://thirdwx.qlogo.cn/mmopen/wu83wmVhX8KUamIfsonOmnRT056NmvPyZZKTvUmkXDF10zTpPkbTYNd2lBl4XiaJNJsW5sQ5YkmWgQyHBA8T7lDkhpiat8vord/132', '中国', 'ocJWB1X6xNt-OIQZaRvcRGsJlXGE');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xw_data
-- ----------------------------
INSERT INTO `xw_data` VALUES (1, '8525', '235', 'http://www..com/html/uidesign/', '23568', 1);
INSERT INTO `xw_data` VALUES (5, '34589', '4563', 'http://www..com/html/uidesign/', '256745', 1);

-- ----------------------------
-- Table structure for xyh_data
-- ----------------------------
DROP TABLE IF EXISTS `xyh_data`;
CREATE TABLE `xyh_data`  (
  `YH_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `YH_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `YH_num` int(20) NOT NULL,
  `YH_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `YH_sex` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `YH_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `YH_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`YH_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xyh_data
-- ----------------------------
INSERT INTO `xyh_data` VALUES ('23534', '3453', 2342, '34534', '', '4545', '345345');
INSERT INTO `xyh_data` VALUES ('wey', '423235', 23423, 'weret', '', '1326567', '12423546');
INSERT INTO `xyh_data` VALUES ('534534', '45645', 234234, '343245', '', '3465464', '456456');
INSERT INTO `xyh_data` VALUES ('wert', '1234567', 170000000, 'bnuz', '女', 'qqqqqqqq.com', '12345678902');
INSERT INTO `xyh_data` VALUES ('admin', '123', 1701050000, 'bnuz', '女', '1265', '215');
INSERT INTO `xyh_data` VALUES ('ice', '654321', 1701050086, 'bnuz', '女', '1111111111@qq.com', '18911111111');

-- ----------------------------
-- Table structure for yh_data
-- ----------------------------
DROP TABLE IF EXISTS `yh_data`;
CREATE TABLE `yh_data`  (
  `YH_id` int(11) NOT NULL AUTO_INCREMENT,
  `YH_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `YH_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`YH_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yh_data
-- ----------------------------
INSERT INTO `yh_data` VALUES (1, 'admin', '123');

SET FOREIGN_KEY_CHECKS = 1;
