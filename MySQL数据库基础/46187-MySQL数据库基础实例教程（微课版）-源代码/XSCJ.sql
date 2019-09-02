-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 08 月 26 日 04:41
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `xscj`
-- 
CREATE DATABASE `xscj` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `xscj`;

-- --------------------------------------------------------

-- 
-- 表的结构 `kc`
-- 

CREATE TABLE `kc` (
  `课程号` char(3) NOT NULL,
  `课程名` char(16) NOT NULL,
  `开课学期` tinyint(1) NOT NULL default '1' COMMENT '只能为1-8',
  `学时` tinyint(1) NOT NULL,
  `学分` tinyint(1) default NULL,
  PRIMARY KEY  (`课程号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `kc`
-- 

INSERT INTO `kc` VALUES ('101', '计算机基础', 1, 80, 5);
INSERT INTO `kc` VALUES ('102', '程序设计与语言', 2, 68, 4);
INSERT INTO `kc` VALUES ('206', '离散数学', 4, 68, 4);
INSERT INTO `kc` VALUES ('208', '数据结构', 5, 68, 4);
INSERT INTO `kc` VALUES ('209', '操作系统', 6, 68, 4);
INSERT INTO `kc` VALUES ('210', '计算机原理', 5, 85, 5);
INSERT INTO `kc` VALUES ('212', '数据库原理', 7, 68, 4);
INSERT INTO `kc` VALUES ('301', '计算机网络', 7, 51, 3);
INSERT INTO `kc` VALUES ('302', '软件工程', 7, 51, 3);

-- --------------------------------------------------------

-- 
-- 表的结构 `xs`
-- 

CREATE TABLE `xs` (
  `学号` char(6) NOT NULL,
  `姓名` char(8) NOT NULL,
  `专业名` char(10) default NULL,
  `性别` tinyint(1) NOT NULL default '1' COMMENT '1为男 0为女',
  `出生时间` date NOT NULL,
  `总学分` tinyint(1) default NULL,
  `照片` blob,
  `备注` text,
  PRIMARY KEY  (`学号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `xs`
-- 

INSERT INTO `xs` VALUES ('081101', '王林', '计算机', 1, '1990-02-10', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081102', '程明', '计算机', 1, '1991-02-01', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081103', '王燕', '计算机', 0, '1989-10-06', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081104', '韦严平', '计算机', 1, '1990-08-26', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081106', '李方方', '计算机', 1, '1990-11-20', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081107', '李明', '计算机', 1, '1990-05-01', 54, NULL, '提前修完《数据结构》，并获学分');
INSERT INTO `xs` VALUES ('081108', '林一帆', '计算机', 1, '1989-08-05', 52, NULL, '已提前修完一门课');
INSERT INTO `xs` VALUES ('081109', '张强民', '计算机', 1, '1989-08-11', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081110', '张蔚', '计算机', 0, '1991-07-22', 50, NULL, '三好生');
INSERT INTO `xs` VALUES ('081111', '赵琳', '计算机', 0, '1990-03-18', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081113', '严红', '计算机', 0, '1989-08-11', 48, NULL, '有一门功课不及格，待补考');
INSERT INTO `xs` VALUES ('081201', '王敏', '通信工程', 1, '1989-06-10', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081202', '王林', '通信工程', 1, '1989-01-29', 40, NULL, '有一门课不及格，待补考');
INSERT INTO `xs` VALUES ('081203', '王玉民', '通信工程', 1, '1990-03-26', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081204', '马琳琳', '通信工程', 0, '1989-02-10', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081206', '李计', '通信工程', 1, '1989-09-20', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081210', '李红庆', '通信工程', 1, '1989-05-01', 44, NULL, '已提前修完一门课，并获得学分');
INSERT INTO `xs` VALUES ('081216', '孙祥欣', '通信工程', 1, '1989-03-09', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081218', '孙研', '通信工程', 1, '1990-10-09', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081220', '吴薇华', '通信工程', 0, '1990-03-18', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081221', '刘燕敏', '通信工程', 0, '1989-11-12', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081241', '罗林琳', '通信工程', 0, '1990-01-30', 50, NULL, '转专业学习');

-- --------------------------------------------------------

-- 
-- 表的结构 `xs_kc`
-- 

CREATE TABLE `xs_kc` (
  `学号` char(6) NOT NULL,
  `课程号` char(3) NOT NULL,
  `成绩` tinyint(1) default NULL,
  `学分` tinyint(1) default NULL,
  PRIMARY KEY  USING BTREE (`学号`,`课程号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `xs_kc`
-- 

INSERT INTO `xs_kc` VALUES ('081101', '101', 80, 5);
INSERT INTO `xs_kc` VALUES ('081101', '102', 78, 4);
INSERT INTO `xs_kc` VALUES ('081101', '206', 76, 4);
INSERT INTO `xs_kc` VALUES ('081102', '102', 78, 4);
INSERT INTO `xs_kc` VALUES ('081102', '206', 78, 4);
INSERT INTO `xs_kc` VALUES ('081103', '101', 62, 5);
INSERT INTO `xs_kc` VALUES ('081103', '102', 70, 4);
INSERT INTO `xs_kc` VALUES ('081103', '206', 81, 4);
INSERT INTO `xs_kc` VALUES ('081104', '101', 90, 5);
INSERT INTO `xs_kc` VALUES ('081104', '102', 84, 4);
INSERT INTO `xs_kc` VALUES ('081104', '206', 65, 4);
INSERT INTO `xs_kc` VALUES ('081106', '101', 65, 5);
INSERT INTO `xs_kc` VALUES ('081106', '102', 71, 4);
INSERT INTO `xs_kc` VALUES ('081106', '206', 81, 4);
INSERT INTO `xs_kc` VALUES ('081107', '101', 78, 5);
INSERT INTO `xs_kc` VALUES ('081107', '102', 80, 4);
INSERT INTO `xs_kc` VALUES ('081107', '206', 68, 4);
INSERT INTO `xs_kc` VALUES ('081108', '101', 85, 5);
INSERT INTO `xs_kc` VALUES ('081108', '102', 64, 4);
INSERT INTO `xs_kc` VALUES ('081108', '206', 87, 4);
INSERT INTO `xs_kc` VALUES ('081109', '101', 66, 5);
INSERT INTO `xs_kc` VALUES ('081109', '102', 83, 4);
INSERT INTO `xs_kc` VALUES ('081109', '206', 70, 4);
INSERT INTO `xs_kc` VALUES ('081110', '101', 95, 5);
INSERT INTO `xs_kc` VALUES ('081110', '102', 90, 4);
INSERT INTO `xs_kc` VALUES ('081110', '206', 89, 4);
INSERT INTO `xs_kc` VALUES ('081111', '101', 91, 5);
INSERT INTO `xs_kc` VALUES ('081111', '102', 70, 4);
INSERT INTO `xs_kc` VALUES ('081111', '206', 76, 4);
INSERT INTO `xs_kc` VALUES ('081113', '101', 63, 5);
INSERT INTO `xs_kc` VALUES ('081113', '102', 79, 4);
INSERT INTO `xs_kc` VALUES ('081113', '206', 60, 4);
INSERT INTO `xs_kc` VALUES ('081201', '101', 80, 5);
INSERT INTO `xs_kc` VALUES ('081202', '101', 65, 5);
INSERT INTO `xs_kc` VALUES ('081203', '101', 87, 5);
INSERT INTO `xs_kc` VALUES ('081204', '101', 91, 5);
INSERT INTO `xs_kc` VALUES ('081210', '101', 76, 5);
INSERT INTO `xs_kc` VALUES ('081216', '101', 81, 5);
INSERT INTO `xs_kc` VALUES ('081218', '101', 70, 5);
INSERT INTO `xs_kc` VALUES ('081220', '101', 82, 5);
INSERT INTO `xs_kc` VALUES ('081221', '101', 76, 5);
INSERT INTO `xs_kc` VALUES ('081241', '101', 90, 5);
