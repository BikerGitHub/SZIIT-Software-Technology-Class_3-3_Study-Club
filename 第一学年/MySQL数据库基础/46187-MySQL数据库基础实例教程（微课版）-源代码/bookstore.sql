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
`ͼ����`  char(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`ͼ�����`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '�����' ,
`����`  varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`����`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`������`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`����ʱ��`  date NOT NULL ,
`����`  float NOT NULL ,
`����`  int(5) NULL DEFAULT NULL ,
`�ۿ�`  float NULL DEFAULT NULL ,
`����ͼƬ`  varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ͼ����`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO book VALUES ('TP115/12683', '��ҳ���', '���������', '�', '�����ʵ������', '2012-06-26', '27', null, null, null), ('TP23/6625', '�����', 'JavaScript��վ����', 'лΪ��', '�й����������', '2010-08-16', '33', '60', '0.8', null), ('TP24/25-p', '�����', 'PHP��վ����', '��С��', '�廪��ѧ������', '2011-10-16', '23.5', '3', '0.8', null), ('TP24/625-L', '�����', '�����Ӧ�û���', '½��ǿ', '�廪��ѧ������', '2011-10-16', '45', '45', '0.8', null), ('TP24/635-O', '�����', '��������缼��', '������', '�廪��ѧ������', '2011-10-16', '25.5', '45', '0.8', null), ('TP24/662-T', '�����', '������Ļ�����', '�ֻ���', '�廪��ѧ������', '2011-10-16', '45.5', '45', '0.8', ' D: IMAGEpicture.jpg '), ('TP25/625-B', '�����', 'ASP��վ����', '�����', '�й����������', '2010-08-16', '30.5', '50', '0.8', null), ('TP25/625-X', '�����', 'PHP_MySQL��վ����', '������', '�й����������', '2010-08-16', '33.25', '50', '0.8', null), ('TP301/0634', '���ݿ�', '�������ݿ�', '��С��', '������ѧ������', '2011-08-02', '28', null, null, null), ('TP302/057', '��ҳ���', '��ҳ�������', '����', '�廪��ѧ������', '2011-02-15', '25', null, null, null), ('TP7/301-135', '���ݿ⼼��', 'MYSQL���ݿ�', '���', '������ѧ������', '2013-01-26', '20', '500', '0.8', ''), ('TP9/5006-T', '�����', 'Dreamwearer_8��վ����', '����', '�й����������', '2010-08-16', '33.2', '50', '0.8', null);
COMMIT;

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
`�û���`  char(18) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`����`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`�Ա�`  char(2) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`����`  char(6) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`��ϵ�绰`  varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`ע��ʱ��`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`�û���`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of members
-- ----------------------------
BEGIN;
INSERT INTO members VALUES ('A0012', '�Ժ���', '��', '080100', '13601234123', '2007-03-04 18:23:45'), ('A3013', '�ſ�', '��', '080100', '13611320001', '2007-01-15 09:12:23'), ('B0022', '����', '��', '080100', '12501234123', '2007-01-12 08:12:30'), ('B2023', '��С��', 'Ů', '080100', '13651111081', '2007-01-18 08:57:18'), ('C0132', '����', 'Ů', '123456', '13822555432', '2012-09-23 00:00:00'), ('C0138', '�', 'Ů', '123456', '13822551234', '2013-08-23 00:00:00'), ('D1963', '����', '��', '222222', '51985523', '2007-01-23 08:15:45');
COMMIT;

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
`������`  char(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`�û���`  char(18) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`ͼ����`  char(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL ,
`��������`  int(5) NOT NULL ,
`��������`  float NOT NULL ,
`����ʱ��`  datetime NOT NULL ,
`�Ƿ񷢻�`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
`�Ƿ��ջ�`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
`�Ƿ����`  varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL ,
PRIMARY KEY (`������`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gb2312 COLLATE=gb2312_chinese_ci

;

-- ----------------------------
-- Records of sell
-- ----------------------------
BEGIN;
INSERT INTO sell VALUES ('1', 'D1963', 'TP115/12683', '4', '25', '2013-08-26 12:25:03', '�ѷ���', '���ջ�', '�ѽ���'), ('10', 'C0132', 'TP115/12683', '10', '27', '2013-08-01 12:13:49', null, null, null), ('11', 'C0132', 'TP302/057', '30', '25', '2013-08-01 12:13:49', '�ѷ���', '���ջ�', '�ѽ���'), ('12', 'C0132', 'TP301/0634', '40', '28', '2013-08-01 12:13:49', null, null, null), ('13', 'C0132', 'TP7/301-135', '13', '20', '2013-08-01 12:13:49', '�ѷ���', null, null), ('14', 'C0138', 'TP24/25-p', '10', '23.5', '2013-08-01 12:13:49', '�ѷ���', '���ջ�', '�ѽ���'), ('15', 'C0138', 'TP25/625-X', '133', '33.5', '2013-08-01 12:13:49', null, null, null), ('16', 'C0138', 'TP23/6625', '43', '30', '2013-08-01 12:13:49', '�ѷ���', null, null), ('2', 'D1963', 'TP302/057', '3', '31.5', '2013-08-05 12:25:12', '�ѷ���', null, null), ('3', 'D1963', 'TP301/0634', '6', '23.45', '2013-03-26 12:25:23', '�ѷ���', '���ջ�', null), ('4', 'B2023', 'TP7/301-135', '7', '37.1', '2009-02-17 00:00:00', '�ѷ���', '���ջ�', '�ѽ���'), ('5', 'A3013', 'TP115/12683', '7', '65.6', '2010-02-01 00:00:00', null, null, null), ('6', 'A3013', 'TP25/625-B', '4', '89', '2009-08-20 00:00:00', null, null, null), ('7', 'C0138', 'TP24/625-L', '6', '23', '2013-03-19 12:25:32', '�ѷ���', '���ջ�', null), ('8', 'C0138', 'TP25/625-B', '5', '45.5', '2010-02-02 00:00:00', null, null, null), ('9', 'C0132', 'TP24/625-L', '6', '23', '2013-08-12 18:23:35', '�ѷ���', '���ջ�', null);
COMMIT;

-- ----------------------------
-- Indexes structure for table `book`
-- ----------------------------
CREATE UNIQUE INDEX `ͼ����` ON `book`(`ͼ����`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `members`
-- ----------------------------
CREATE INDEX `���֤��` ON `members`(`�û���`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `sell`
-- ----------------------------
CREATE INDEX `frk_book` ON `sell`(`ͼ����`) USING BTREE ;
CREATE INDEX `frk_mem` ON `sell`(`�û���`) USING BTREE ;
