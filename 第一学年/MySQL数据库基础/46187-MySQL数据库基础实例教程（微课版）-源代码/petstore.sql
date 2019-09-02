-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 10 月 26 日 04:18
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `petstore`
-- 

CREATE DATABASE `petstore` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `petstore`;

-- --------------------------------------------------------

-- 
-- 表的结构 `account`
-- 

CREATE TABLE `account` (
  `userid` char(6) NOT NULL,
  `fullname` varchar(10) NOT NULL,
  `passward` varchar(20) NOT NULL,
  `sex` char(2) NOT NULL,
  `address` varchar(40) default NULL,
  `email` varchar(20) default NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `account`
-- 

INSERT INTO `account` VALUES ('u0001', '刘晓和', '123456', '男', '广东深圳市', 'liuxh@163.com', '13512345678');
INSERT INTO `account` VALUES ('u0002', '张嘉庆', '123456', '男', '广东深圳市', 'zhangjq@163.com', '13512345679');
INSERT INTO `account` VALUES ('u0003', '罗红红', '123456', '女', '广东深圳市', 'longhh@163.com', '13512345689');
INSERT INTO `account` VALUES ('u0004', '李昊华', '123456', '女', '广东广州市', 'lihh@163.com', '13812345679');
INSERT INTO `account` VALUES ('u0005', '吴美霞', '123456', '女', '广东珠海市', 'wumx@163.com', '13512345879');
INSERT INTO `account` VALUES ('u0006', '王天赐', '123456', '男', '广东中山市', 'wangtc@163.com', '13802345679');

-- --------------------------------------------------------

-- 
-- 表的结构 `category`
-- 

CREATE TABLE `category` (
  `catid` char(10) NOT NULL,
  `catname` varchar(20) default NULL,
  `cades` text,
  PRIMARY KEY  (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `category`
-- 

INSERT INTO `category` VALUES ('01', '鸟类', '');
INSERT INTO `category` VALUES ('02', '猫', '');
INSERT INTO `category` VALUES ('03', '狗', '');
INSERT INTO `category` VALUES ('04', '鱼', '');
INSERT INTO `category` VALUES ('05', '爬行类', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `lineitem`
-- 

CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `itemid` char(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`orderid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `lineitem`
-- 

INSERT INTO `lineitem` VALUES (20130411, 'FI-SW-01', 10, 18.50);
INSERT INTO `lineitem` VALUES (20130411, 'FI-SW-02', 12, 16.50);
INSERT INTO `lineitem` VALUES (20130412, 'K9-BD-01', 2, 120.00);
INSERT INTO `lineitem` VALUES (20130412, 'K9-PO-02', 1, 220.00);
INSERT INTO `lineitem` VALUES (20130413, 'K9-DL-01', 1, 130.00);
INSERT INTO `lineitem` VALUES (20130414, 'RP-SN-01', 2, 125.00);
INSERT INTO `lineitem` VALUES (20130415, 'AV-SB-02', 2, 50.00);

-- --------------------------------------------------------

-- 
-- 表的结构 `orders`
-- 

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL auto_increment,
  `userid` char(6) NOT NULL,
  `orderdate` datetime NOT NULL,
  `totalprice` decimal(10,2) default NULL,
  `status` tinyint(1) default NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=20130416 ;

-- 
-- 导出表中的数据 `orders`
-- 

INSERT INTO `orders` VALUES (20130411, 'u0001', '2013-04-11 15:07:34', 500.00, 0);
INSERT INTO `orders` VALUES (20130412, 'u0002', '2013-04-09 15:08:11', 305.60, 0);
INSERT INTO `orders` VALUES (20130413, 'u0003', '2013-04-15 15:09:00', 212.40, 0);
INSERT INTO `orders` VALUES (20130414, 'u0003', '2013-04-16 15:09:30', 120.45, 1);
INSERT INTO `orders` VALUES (20130415, 'u0004', '2013-04-02 15:10:05', 120.30, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `product`
-- 

CREATE TABLE `product` (
  `productid` char(10) NOT NULL,
  `catid` char(10) NOT NULL,
  `name` varchar(30) default NULL,
  `descn` text,
  `listprice` decimal(10,2) default NULL,
  `unitcost` decimal(10,2) default NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY  (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- 导出表中的数据 `product`
-- 

INSERT INTO `product` VALUES ('AV-CB-01', '05', '亚马逊鹦鹉', '75 岁以上高龄的好伙伴', 50.00, 60.00, 100);
INSERT INTO `product` VALUES ('AV-SB-02', '05', '燕雀', '非常好的减压宠物', 45.00, 50.00, 98);
INSERT INTO `product` VALUES ('FI-FW-01', '01', '锦鲤', '来自日本的淡水鱼', 45.50, 45.50, 300);
INSERT INTO `product` VALUES ('FI-FW-02', '01', '金鱼', '来自中国的淡水鱼', 6.80, 6.80, 100);
INSERT INTO `product` VALUES ('FI-SW-01', '01', '天使鱼', '来自澳大利亚的海水鱼', 10.00, 10.00, 100);
INSERT INTO `product` VALUES ('FI-SW-02', '01', '虎鲨', '来自澳大利亚的海水鱼', 18.50, 20.00, 200);
INSERT INTO `product` VALUES ('FL-DLH-02', '04', '波斯猫', '友好的家居猫, 像公主一样高贵', 1000.00, 1200.00, 15);
INSERT INTO `product` VALUES ('FL-DSH-01', '04', '马恩岛猫', '灭鼠能手', 80.00, 100.00, 40);
INSERT INTO `product` VALUES ('K9-BD-01', '02', '牛头犬', '来自英格兰的友好的狗', 1350.00, 1500.00, 5);
INSERT INTO `product` VALUES ('K9-CW-01', '02', '吉娃娃犬', '很好的陪伴狗', 180.00, 200.00, 120);
INSERT INTO `product` VALUES ('K9-DL-01', '02', '斑点狗', '来自消防队的大狗', 3000.00, 3000.00, 1);
INSERT INTO `product` VALUES ('K9-PO-02', '02', '狮子犬', '来自法国的可爱的狗', 2000.00, 2000.00, 3);
INSERT INTO `product` VALUES ('K9-RT-01', '02', '金毛猎犬', '大家庭的狗', 300.00, 300.00, 200);
INSERT INTO `product` VALUES ('K9-RT-02', '02', '拉布拉多猎犬', '大猎狗', 800.00, 800.00, 30);
INSERT INTO `product` VALUES ('RP-LI-02', '03', '鬣蜥', '友好的绿色朋友', 60.00, 78.00, 40);
INSERT INTO `product` VALUES ('RP-SN-01', '03', '响尾蛇', '兼当看门狗', 200.00, 240.00, 10);
