/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.20.129
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : 192.168.20.129:3306
 Source Schema         : ssms

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 23/08/2018 19:42:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apassword` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creattime` datetime(0) NULL DEFAULT NULL,
  `lastlogintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123123', '2018-07-03 14:18:29', '2018-08-23 19:35:27');
INSERT INTO `admin` VALUES (2, 'admin1', '123123', '2018-05-08 21:23:51', '2018-05-10 11:16:38');
INSERT INTO `admin` VALUES (5, 'admin2', '123123', '2018-05-08 23:18:45', '2018-05-08 23:18:47');
INSERT INTO `admin` VALUES (6, 'admin3', '123123', '2018-05-10 11:35:04', '2018-05-10 15:06:58');
INSERT INTO `admin` VALUES (7, 'chnzxg', '123123', '2018-05-10 12:34:27', '2018-05-10 15:07:01');
INSERT INTO `admin` VALUES (9, 'power', '123123', '2018-05-18 21:33:04', '2018-05-19 09:41:23');
INSERT INTO `admin` VALUES (11, 'asdasd', '123123', '2018-05-18 21:37:02', '2018-05-18 13:58:30');
INSERT INTO `admin` VALUES (12, 'ceshi', '123123', '2018-05-18 21:40:20', '2018-05-18 22:28:09');

-- ----------------------------
-- Table structure for adminrole
-- ----------------------------
DROP TABLE IF EXISTS `adminrole`;
CREATE TABLE `adminrole`  (
  `aid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  INDEX `adminrole_admin_aid_fk`(`aid`) USING BTREE,
  INDEX `adminrole_role_rid_fk`(`rid`) USING BTREE,
  CONSTRAINT `adminrole_admin_aid_fk` FOREIGN KEY (`aid`) REFERENCES `admin` (`aid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `adminrole_role_rid_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of adminrole
-- ----------------------------
INSERT INTO `adminrole` VALUES (2, 21);
INSERT INTO `adminrole` VALUES (2, 21);
INSERT INTO `adminrole` VALUES (7, 1);
INSERT INTO `adminrole` VALUES (7, 24);
INSERT INTO `adminrole` VALUES (6, 1);
INSERT INTO `adminrole` VALUES (6, 21);
INSERT INTO `adminrole` VALUES (5, 22);
INSERT INTO `adminrole` VALUES (12, 24);
INSERT INTO `adminrole` VALUES (11, 25);
INSERT INTO `adminrole` VALUES (9, 24);
INSERT INTO `adminrole` VALUES (1, 1);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `claid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ccode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`claid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '蔬果', '001');
INSERT INTO `class` VALUES (2, '肉', '002');
INSERT INTO `class` VALUES (3, '耗材', '003');
INSERT INTO `class` VALUES (4, '烟酒', '004');
INSERT INTO `class` VALUES (5, '零食', '005');
INSERT INTO `class` VALUES (6, '清洁', '006');
INSERT INTO `class` VALUES (8, '服饰', '007');
INSERT INTO `class` VALUES (10, '家居', '008');
INSERT INTO `class` VALUES (11, '家电', '009');
INSERT INTO `class` VALUES (12, '百货', '010');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finid` int(11) NULL DEFAULT NULL,
  `cspec` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `cweight` int(11) NULL DEFAULT NULL,
  `cprice` double NULL DEFAULT NULL,
  `cproder` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cprodate` date NULL DEFAULT NULL,
  `ccode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cstock` int(11) NULL DEFAULT NULL,
  `cdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cstatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`comid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (3, 'c1', 1, NULL, 1, 112, 213, '生产商1', '2018-05-18', NULL, 12, '1', 1);
INSERT INTO `commodity` VALUES (5, 'c2', 2, NULL, 3, 123, 1, '生产商1', '2018-05-18', NULL, 2, '1', 1);
INSERT INTO `commodity` VALUES (6, 'c3', 3, NULL, 123, 12, 213, '生产商1', '2018-05-18', NULL, 31, '1', 1);
INSERT INTO `commodity` VALUES (7, 'c4', 4, NULL, 4, 11, 1, '生产商1', '2018-05-18', NULL, 3, '1', 1);
INSERT INTO `commodity` VALUES (8, 'c5', 5, NULL, 1, 11, 3, '生产商1', '2018-04-03', NULL, 43, '1', 1);
INSERT INTO `commodity` VALUES (9, 'c6', 6, NULL, 3, 134, 1, '生产商1', '2018-04-03', NULL, 3, '1', 1);
INSERT INTO `commodity` VALUES (10, 'c7', 7, NULL, 12, 11, 123, '生产商1', '2018-04-03', NULL, 3, '1', 1);
INSERT INTO `commodity` VALUES (11, 'c8', 8, '1', 1, 11, 124, '生产商1', '2018-04-03', '1', 12, '1', 1);
INSERT INTO `commodity` VALUES (12, 'c9', 9, '1', 3, 123, 4123, '生产商1', '2018-04-03', '1', 21, '1', 1);
INSERT INTO `commodity` VALUES (13, 'c0', 10, '1', 1, 11, 123, '生产商1', '2018-04-03', '1', 3, '1', 1);
INSERT INTO `commodity` VALUES (14, 'c11', 11, '1', 24, 11, 1, '生产商1', '2018-04-03', '1', 2, '1', 1);
INSERT INTO `commodity` VALUES (15, 'c12', 12, '1', 1, 12, 1, '生产商1', '2018-04-03', '1', 22, '1', 1);
INSERT INTO `commodity` VALUES (16, 'c13', 13, '1', 5, 11, 2321, '生产商1', '2018-04-03', '1', 13, '1', 1);
INSERT INTO `commodity` VALUES (18, '1c4', 14, '1', 3, 134, 12, '生产商1', '2018-04-03', '1', 1, '1', 1);
INSERT INTO `commodity` VALUES (19, '1c43', 30, NULL, 3, 134, 12, '生产商1', '2018-05-19', NULL, 1, '1', 1);
INSERT INTO `commodity` VALUES (20, '1c4啊阿萨德3', 30, NULL, 3, 134, 12, '生产商1', '2018-05-19', NULL, 1, '1', 0);
INSERT INTO `commodity` VALUES (21, 'c12', 12, '1', 1, 12, 1, '生产商1', '2018-04-03', '1', 22, '1', 0);
INSERT INTO `commodity` VALUES (22, 'c12阿萨德', 30, NULL, 1, 12, 1, '生产商1', '2018-05-19', NULL, 22, '1', 0);
INSERT INTO `commodity` VALUES (23, '1c433', 7, NULL, 12, 12, 12, '12', NULL, NULL, 12, '12', 1);
INSERT INTO `commodity` VALUES (24, '1c4331且', 30, NULL, 12, 12, 12, '123', NULL, NULL, 12, '12', 1);

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `mlevel` int(11) NULL DEFAULT NULL,
  `percent` double NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES (1, 0.98, 100);
INSERT INTO `discount` VALUES (2, 0.95, 200);
INSERT INTO `discount` VALUES (3, 0.92, 300);
INSERT INTO `discount` VALUES (4, 0.9, 500);
INSERT INTO `discount` VALUES (5, 0.86, 800);
INSERT INTO `discount` VALUES (6, 0.82, 1000);
INSERT INTO `discount` VALUES (7, 0.8, 1500);
INSERT INTO `discount` VALUES (8, 0.78, 2000);
INSERT INTO `discount` VALUES (9, 0.74, 3000);
INSERT INTO `discount` VALUES (10, 0.7, 5000);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `eno` int(11) NULL DEFAULT NULL,
  `ename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `esex` int(11) NULL DEFAULT NULL,
  `eage` int(11) NULL DEFAULT NULL,
  `etime` date NULL DEFAULT NULL,
  `etel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `epro` int(11) NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `esal` double NULL DEFAULT NULL,
  `epwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eaccount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (2, 2, '程兆祥1', 1, 22, '2018-04-18', '18098533436', 7, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (3, 3, '程兆祥1', 1, 22, '2018-04-18', '18098533436', 2, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (4, 4, '程兆祥1', 2, 22, '2018-04-18', '18098533436', 3, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (5, 5, '程兆祥1', 1, 22, '2018-04-18', '18098533436', 4, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (6, 6, '程兆祥1', 2, 23, '2018-04-18', '18098533436', 4, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (7, 7, '程兆祥1', 2, 22, '2018-04-18', '18098533436', 5, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (8, 8, '程兆祥1', 2, 22, '2018-04-18', '18098533436', 6, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (9, 9, '123', 1, 22, '2018-04-18', '18098533436', 7, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (10, 10, '12345', 2, 22, '2018-04-18', '18098533436', 2, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (11, 11, '程兆祥1', 1, 22, '2018-04-18', '18098533436', 4, 'cheng_zhaoxiang@163.com', 1000000, NULL, NULL);
INSERT INTO `employee` VALUES (10000, 1, '程兆祥', 1, 22, '2018-04-18', '18098533436', 1, 'cheng_zhaoxiang@163.com', 1000000, '123', 'czx');
INSERT INTO `employee` VALUES (10001, NULL, '阿萨德', 2, 1, '2018-05-19', '1', 4, '1', 1, NULL, NULL);
INSERT INTO `employee` VALUES (10002, NULL, 'ga', 2, 1, '2018-05-19', '1', 2, '1', 1, NULL, NULL);

-- ----------------------------
-- Table structure for fine
-- ----------------------------
DROP TABLE IF EXISTS `fine`;
CREATE TABLE `fine`  (
  `finid` int(11) NOT NULL AUTO_INCREMENT,
  `claid` int(11) NULL DEFAULT NULL,
  `fname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`finid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fine
-- ----------------------------
INSERT INTO `fine` VALUES (1, 1, '蔬菜', '001001');
INSERT INTO `fine` VALUES (2, 1, '水果', '001002');
INSERT INTO `fine` VALUES (3, 1, '干货', '001003');
INSERT INTO `fine` VALUES (4, 1, '粮油', '001004');
INSERT INTO `fine` VALUES (5, 2, '畜类', '002001');
INSERT INTO `fine` VALUES (6, 2, '禽类', '002002');
INSERT INTO `fine` VALUES (7, 2, '加工肉类', '002003');
INSERT INTO `fine` VALUES (8, 3, '材料', '003001');
INSERT INTO `fine` VALUES (9, 3, '调味品', '003002');
INSERT INTO `fine` VALUES (10, 4, '饮料', '004001');
INSERT INTO `fine` VALUES (11, 4, '香烟', '004002');
INSERT INTO `fine` VALUES (12, 4, '酒类', '004003');
INSERT INTO `fine` VALUES (13, 5, '糖果', '005001');
INSERT INTO `fine` VALUES (14, 5, '糕饼', '005002');
INSERT INTO `fine` VALUES (15, 5, '休闲食品', '005003');
INSERT INTO `fine` VALUES (16, 6, '化妆品', '006001');
INSERT INTO `fine` VALUES (17, 6, '保养品', '006002');
INSERT INTO `fine` VALUES (18, 6, '清洁品', '006003');
INSERT INTO `fine` VALUES (19, 6, '纸类', '006004');
INSERT INTO `fine` VALUES (20, 8, '衣服', '008001');
INSERT INTO `fine` VALUES (21, 8, '鞋帽', '008002');
INSERT INTO `fine` VALUES (22, 8, '裤子', '008003');
INSERT INTO `fine` VALUES (23, 8, '袜子', '008004');
INSERT INTO `fine` VALUES (24, 10, '塑料制品', '010001');
INSERT INTO `fine` VALUES (25, 10, '玻璃制品', '010002');
INSERT INTO `fine` VALUES (26, 10, '铝铁制品', '010003');
INSERT INTO `fine` VALUES (27, 11, '电器', '011001');
INSERT INTO `fine` VALUES (28, 11, '厨具', '011002');
INSERT INTO `fine` VALUES (29, 11, '制冷', '011003');
INSERT INTO `fine` VALUES (30, 11, '五金类', '011004');
INSERT INTO `fine` VALUES (31, 12, '生鲜', '012001');
INSERT INTO `fine` VALUES (32, 12, '药品', '012002');
INSERT INTO `fine` VALUES (33, 12, '冲调', '012003');
INSERT INTO `fine` VALUES (34, 12, '文具', '012004');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `forid` int(11) NOT NULL AUTO_INCREMENT,
  `comid` int(11) NULL DEFAULT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finid` int(11) NULL DEFAULT NULL,
  `cprodate` datetime(0) NULL DEFAULT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `cprice` double NULL DEFAULT NULL,
  `ccount` int(11) NULL DEFAULT NULL,
  `memid` int(11) NULL DEFAULT NULL,
  `mname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creattime` datetime(0) NULL DEFAULT NULL,
  `lastmoditime` datetime(0) NULL DEFAULT NULL,
  `fstatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`forid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (1, 1, '1', 1, '2018-05-08 10:42:02', 1, 1, 1, 1, '1', '2018-05-08 10:42:09', '2018-05-08 10:42:11', 1);
INSERT INTO `form` VALUES (2, NULL, '收到 ', 2, '2018-05-19 01:06:18', 4, 234, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `form` VALUES (3, NULL, '123 123', 34, '2018-05-19 01:06:11', 3, 234, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `form` VALUES (4, NULL, '42', NULL, '2018-05-19 01:06:16', 4, 234, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `form` VALUES (5, NULL, '1234', 4, '2018-05-19 01:06:14', 5, 45, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `form` VALUES (6, NULL, '126', NULL, '2018-05-19 01:06:20', 2, 234, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `form` VALUES (7, NULL, '12', NULL, '2018-05-19 01:06:12', 3, 64, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `form` VALUES (8, NULL, '123', 424, '2018-05-19 01:06:24', 5, 2346, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `form` VALUES (9, NULL, '23', NULL, '2018-05-19 01:06:26', 2, 234, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `form` VALUES (10, NULL, '123', NULL, '2018-05-19 01:06:28', 5, 324, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `memid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mtel` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mcode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mlevel` int(11) NULL DEFAULT NULL,
  `mrem` double NULL DEFAULT NULL,
  `mdate` date NULL DEFAULT NULL,
  `mcount` double NULL DEFAULT NULL,
  PRIMARY KEY (`memid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (4, 'asd ', '111111111111', NULL, 2, NULL, NULL, NULL);
INSERT INTO `member` VALUES (7, '1', '11111111111', NULL, 1, 12, '2018-05-10', NULL);
INSERT INTO `member` VALUES (8, '12', '12121212121', NULL, 3, 1, '2018-05-10', NULL);
INSERT INTO `member` VALUES (10, '2dasd', '12121212121', NULL, 1, 312, '2018-05-18', NULL);

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES (1, '商品列表', '1');
INSERT INTO `power` VALUES (2, '添加商品', '2');
INSERT INTO `power` VALUES (3, '商品分类', '3');
INSERT INTO `power` VALUES (4, '商品回收站', '4');
INSERT INTO `power` VALUES (5, '订单列表', '5');
INSERT INTO `power` VALUES (6, '员工列表', '6');
INSERT INTO `power` VALUES (7, '添加员工', '7');
INSERT INTO `power` VALUES (8, '会员列表', '8');
INSERT INTO `power` VALUES (9, '添加会员', '9');
INSERT INTO `power` VALUES (10, '折扣设置', '10');
INSERT INTO `power` VALUES (11, '管理员列表', '11');
INSERT INTO `power` VALUES (12, '添加管理员', '12');
INSERT INTO `power` VALUES (13, '角色列表', '13');
INSERT INTO `power` VALUES (14, '添加角色', '14');
INSERT INTO `power` VALUES (15, '商品统计', '15');
INSERT INTO `power` VALUES (16, '会员统计', '16');
INSERT INTO `power` VALUES (17, '员工统计', '17');
INSERT INTO `power` VALUES (18, '订单统计', '18');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creattime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '2018-05-10 15:00:59');
INSERT INTO `role` VALUES (21, '商品管理员', '2018-05-10 23:02:57');
INSERT INTO `role` VALUES (22, '员工管理员', '2018-05-10 23:03:17');
INSERT INTO `role` VALUES (23, '会员管理员', '2018-05-10 23:03:36');
INSERT INTO `role` VALUES (24, '权限管理员', '2018-05-10 23:03:54');
INSERT INTO `role` VALUES (25, '角色管理员', '2018-05-10 23:04:09');

-- ----------------------------
-- Table structure for rolepower
-- ----------------------------
DROP TABLE IF EXISTS `rolepower`;
CREATE TABLE `rolepower`  (
  `rid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  INDEX `rolepower_role_rid_fk`(`rid`) USING BTREE,
  INDEX `rolepower_power_pid_fk`(`pid`) USING BTREE,
  CONSTRAINT `rolepower_power_pid_fk` FOREIGN KEY (`pid`) REFERENCES `power` (`pid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `rolepower_role_rid_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rolepower
-- ----------------------------
INSERT INTO `rolepower` VALUES (1, 1);
INSERT INTO `rolepower` VALUES (1, 2);
INSERT INTO `rolepower` VALUES (1, 3);
INSERT INTO `rolepower` VALUES (1, 4);
INSERT INTO `rolepower` VALUES (1, 5);
INSERT INTO `rolepower` VALUES (1, 6);
INSERT INTO `rolepower` VALUES (1, 7);
INSERT INTO `rolepower` VALUES (1, 8);
INSERT INTO `rolepower` VALUES (1, 9);
INSERT INTO `rolepower` VALUES (1, 10);
INSERT INTO `rolepower` VALUES (1, 11);
INSERT INTO `rolepower` VALUES (1, 12);
INSERT INTO `rolepower` VALUES (1, 13);
INSERT INTO `rolepower` VALUES (1, 14);
INSERT INTO `rolepower` VALUES (1, 15);
INSERT INTO `rolepower` VALUES (1, 16);
INSERT INTO `rolepower` VALUES (1, 17);
INSERT INTO `rolepower` VALUES (1, 18);
INSERT INTO `rolepower` VALUES (21, 1);
INSERT INTO `rolepower` VALUES (21, 2);
INSERT INTO `rolepower` VALUES (21, 3);
INSERT INTO `rolepower` VALUES (21, 4);
INSERT INTO `rolepower` VALUES (21, 5);
INSERT INTO `rolepower` VALUES (21, 15);
INSERT INTO `rolepower` VALUES (21, 18);
INSERT INTO `rolepower` VALUES (22, 6);
INSERT INTO `rolepower` VALUES (22, 7);
INSERT INTO `rolepower` VALUES (22, 17);
INSERT INTO `rolepower` VALUES (23, 8);
INSERT INTO `rolepower` VALUES (23, 9);
INSERT INTO `rolepower` VALUES (23, 10);
INSERT INTO `rolepower` VALUES (23, 16);
INSERT INTO `rolepower` VALUES (24, 11);
INSERT INTO `rolepower` VALUES (24, 12);
INSERT INTO `rolepower` VALUES (24, 13);
INSERT INTO `rolepower` VALUES (24, 14);
INSERT INTO `rolepower` VALUES (25, 13);
INSERT INTO `rolepower` VALUES (25, 14);

SET FOREIGN_KEY_CHECKS = 1;
