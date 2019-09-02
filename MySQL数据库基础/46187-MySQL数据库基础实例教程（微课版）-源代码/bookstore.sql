/*
Navicat MySQL Data Transfer

Source Server         : rr
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 10008

Date: 2016-05-23 16:37:12
*/

CREATE DATABASE `bookstore` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `bookstore`;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
`图书编号`  char(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`图书类别`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '计算机' ,
`书名`  varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`作者`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`出版社`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`出版时间`  date NOT NULL ,
`单价`  float NOT NULL ,
`数量`  int(5) NULL DEFAULT NULL ,
`折扣`  float NULL DEFAULT NULL ,
`封面图片`  varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
PRIMARY KEY (`图书编号`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO book VALUES ('TP115/12683', '网页设计', '计算机基础', '李华', '人民邮电出版社', '2012-06-26', '27', null, null, null), ('TP23/6625', '计算机', 'JavaScript网站制作', '谢为民', '中国青年出版社', '2010-08-16', '33', '60', '0.8', null), ('TP24/25-p', '计算机', 'PHP网站制作', '林小红', '清华大学出版社', '2011-10-16', '23.5', '3', '0.8', null), ('TP24/625-L', '计算机', '计算机应用基础', '陆大强', '清华大学出版社', '2011-10-16', '45', '45', '0.8', null), ('TP24/635-O', '计算机', '计算机网络技术', '林力辉', '清华大学出版社', '2011-10-16', '25.5', '45', '0.8', null), ('TP24/662-T', '计算机', '计算机文化基础', '林华忠', '清华大学出版社', '2011-10-16', '45.5', '45', '0.8', ' D: IMAGEpicture.jpg '), ('TP25/625-B', '计算机', 'ASP网站制作', '胡莉惠', '中国青年出版社', '2010-08-16', '30.5', '50', '0.8', null), ('TP25/625-X', '计算机', 'PHP_MySQL网站制作', '王大卫', '中国青年出版社', '2010-08-16', '33.25', '50', '0.8', null), ('TP301/0634', '数据库', '网络数据库', '张小刚', '北京大学出版社', '2011-08-02', '28', null, null, null), ('TP302/057', '网页设计', '网页程序设计', '刘辉', '清华大学出版社', '2011-02-15', '25', null, null, null), ('TP7/301-135', '数据库技术', 'MYSQL数据库', '李刚', '北京大学出版社', '2013-01-26', '20', '500', '0.8', ''), ('TP9/5006-T', '计算机', 'Dreamwearer_8网站制作', '鲍嘉', '中国青年出版社', '2010-08-16', '33.2', '50', '0.8', null);
COMMIT;

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
`用户号`  char(18) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`姓名`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`性别`  char(2) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`密码`  char(6) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`联系电话`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`注册时间`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`用户号`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of members
-- ----------------------------
BEGIN;
INSERT INTO members VALUES ('A0012', '赵宏宇', '男', '080100', '13601234123', '2007-03-04 18:23:45'), ('A3013', '张凯', '男', '080100', '13611320001', '2007-01-15 09:12:23'), ('B0022', '王林', '男', '080100', '12501234123', '2007-01-12 08:12:30'), ('B2023', '李小冰', '女', '080100', '13651111081', '2007-01-18 08:57:18'), ('C0132', '张莉', '女', '123456', '13822555432', '2012-09-23 00:00:00'), ('C0138', '李华', '女', '123456', '13822551234', '2013-08-23 00:00:00'), ('D1963', '张三', '男', '222222', '51985523', '2007-01-23 08:15:45');
COMMIT;

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
`订单号`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`用户号`  char(18) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`图书编号`  char(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`订购册数`  int(5) NOT NULL ,
`订购单价`  float NOT NULL ,
`订购时间`  datetime NOT NULL ,
`是否发货`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
`是否收货`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
`是否结清`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
PRIMARY KEY (`订单号`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of sell
-- ----------------------------
BEGIN;
INSERT INTO sell VALUES ('1', 'D1963', 'TP115/12683', '4', '25', '2013-08-26 12:25:03', '已发货', '已收货', '已结清'), ('10', 'C0132', 'TP115/12683', '10', '27', '2013-08-01 12:13:49', null, null, null), ('11', 'C0132', 'TP302/057', '30', '25', '2013-08-01 12:13:49', '已发货', '已收货', '已结清'), ('12', 'C0132', 'TP301/0634', '40', '28', '2013-08-01 12:13:49', null, null, null), ('13', 'C0132', 'TP7/301-135', '13', '20', '2013-08-01 12:13:49', '已发货', null, null), ('14', 'C0138', 'TP24/25-p', '10', '23.5', '2013-08-01 12:13:49', '已发货', '已收货', '已结清'), ('15', 'C0138', 'TP25/625-X', '133', '33.5', '2013-08-01 12:13:49', null, null, null), ('16', 'C0138', 'TP23/6625', '43', '30', '2013-08-01 12:13:49', '已发货', null, null), ('2', 'D1963', 'TP302/057', '3', '31.5', '2013-08-05 12:25:12', '已发货', null, null), ('3', 'D1963', 'TP301/0634', '6', '23.45', '2013-03-26 12:25:23', '已发货', '已收货', null), ('4', 'B2023', 'TP7/301-135', '7', '37.1', '2009-02-17 00:00:00', '已发货', '已收货', '已结清'), ('5', 'A3013', 'TP115/12683', '7', '65.6', '2010-02-01 00:00:00', null, null, null), ('6', 'A3013', 'TP25/625-B', '4', '89', '2009-08-20 00:00:00', null, null, null), ('7', 'C0138', 'TP24/625-L', '6', '23', '2013-03-19 12:25:32', '已发货', '已收货', null), ('8', 'C0138', 'TP25/625-B', '5', '45.5', '2010-02-02 00:00:00', null, null, null), ('9', 'C0132', 'TP24/625-L', '6', '23', '2013-08-12 18:23:35', '已发货', '已收货', null);
COMMIT;

-- ----------------------------
-- Indexes structure for table `book`
-- ----------------------------
CREATE UNIQUE INDEX `图书编号` ON `book`(`图书编号`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `members`
-- ----------------------------
CREATE INDEX `身份证号` ON `members`(`用户号`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `sell`
-- ----------------------------
CREATE INDEX `frk_book` ON `sell`(`图书编号`) USING BTREE ;
CREATE INDEX `frk_mem` ON `sell`(`用户号`) USING BTREE ;
