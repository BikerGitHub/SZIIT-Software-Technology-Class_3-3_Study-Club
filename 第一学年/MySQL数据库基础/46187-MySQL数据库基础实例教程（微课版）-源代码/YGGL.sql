-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 08 月 26 日 04:43
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `yggl`
-- 
CREATE DATABASE `yggl` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `yggl`;

-- --------------------------------------------------------

-- 
-- 表的结构 `departments`
-- 

CREATE TABLE `departments` (
  `部门编号` char(3) NOT NULL COMMENT '部门编号',
  `部门名称` char(20) NOT NULL COMMENT '部门名',
  `备注` text COMMENT '备注',
  PRIMARY KEY  (`部门编号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `departments`
-- 

INSERT INTO `departments` VALUES ('1', '财务部', NULL);
INSERT INTO `departments` VALUES ('2', '人力资源部', NULL);
INSERT INTO `departments` VALUES ('3', '经理办公室', NULL);
INSERT INTO `departments` VALUES ('4', '研发部', NULL);
INSERT INTO `departments` VALUES ('5', '市场部', NULL);

-- --------------------------------------------------------

-- 
-- 表的结构 `employees`
-- 

CREATE TABLE `employees` (
  `员工编号` char(6) NOT NULL,
  `姓名` char(10) NOT NULL,
  `学历` char(4) NOT NULL,
  `出生日期` date NOT NULL,
  `性别` char(2) NOT NULL,
  `工作年限` tinyint(1) default NULL,
  `地址` varchar(20) default NULL,
  `电话号码` char(12) default NULL,
  `员工部门号` char(3) NOT NULL,
  PRIMARY KEY  (`员工编号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `employees`
-- 

INSERT INTO `employees` VALUES ('000001', '王林', '大专', '1966-01-23', '1', 8, '中山路32-1-508', '83355668', '2');
INSERT INTO `employees` VALUES ('010008', '伍容华', '本科', '1976-03-28', '1', 3, '北京东路100-2', '83321321', '1');
INSERT INTO `employees` VALUES ('020010', '王向容', '硕士', '1982-12-09', '1', 2, '四牌楼10-0-108', '83792361', '1');
INSERT INTO `employees` VALUES ('020018', '李丽', '大专', '1960-07-30', '0', 6, '中山东路102-2', '83413301', '1');
INSERT INTO `employees` VALUES ('102201', '刘明', '本科', '1972-10-18', '1', 3, '虎距路100-2', '83606608', '5');
INSERT INTO `employees` VALUES ('102208', '朱俊', '硕士', '1965-09-28', '1', 2, '牌楼巷5-3-106', '84708817', '5');
INSERT INTO `employees` VALUES ('108991', '钟敏', '硕士', '1979-08-10', '0', 4, '中山路10-3-105', '83346722', '3');
INSERT INTO `employees` VALUES ('111006', '张石兵', '本科', '1974-10-01', '1', 1, '解放路34-1-203', '84563418', '5');
INSERT INTO `employees` VALUES ('210678', '林涛', '大专', '1977-04-02', '1', 2, '中山北路24-35', '83467336', '3');
INSERT INTO `employees` VALUES ('302566', '李玉珉', '本科', '1968-09-20', '1', 3, '热和路209-3', '58765991', '4');
INSERT INTO `employees` VALUES ('308759', '叶凡', '本科', '1978-11-18', '1', 2, '北京西路3-7-52', '83308901', '4');
INSERT INTO `employees` VALUES ('504209', '陈林琳', '大专', '1969-09-03', '0', 5, '汉中路120-4-12', '84468158', '4');

-- --------------------------------------------------------

-- 
-- 表的结构 `salary`
-- 

CREATE TABLE `salary` (
  `员工编号` char(6) NOT NULL COMMENT '员工编号',
  `收入` float NOT NULL COMMENT '收入',
  `支出` float NOT NULL COMMENT '支出',
  PRIMARY KEY  (`员工编号`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `salary`
-- 

INSERT INTO `salary` VALUES ('000001', 2100.8, 123.09);
INSERT INTO `salary` VALUES ('010008', 1582.62, 88.03);
INSERT INTO `salary` VALUES ('020010', 2860, 198);
INSERT INTO `salary` VALUES ('020018', 2347.68, 180);
INSERT INTO `salary` VALUES ('102201', 2569.88, 185.65);
INSERT INTO `salary` VALUES ('102208', 1980, 100);
INSERT INTO `salary` VALUES ('108991', 3259.98, 281.52);
INSERT INTO `salary` VALUES ('111006', 1987.01, 79.58);
INSERT INTO `salary` VALUES ('210678', 2240, 121);
INSERT INTO `salary` VALUES ('302566', 2980.7, 210.2);
INSERT INTO `salary` VALUES ('308759', 2531.98, 199.08);
INSERT INTO `salary` VALUES ('504209', 2066.15, 108);
