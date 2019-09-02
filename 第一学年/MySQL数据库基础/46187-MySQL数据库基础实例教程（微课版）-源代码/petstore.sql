-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ��������: 2013 �� 10 �� 26 �� 04:18
-- �������汾: 5.0.45
-- PHP �汾: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- ���ݿ�: `petstore`
-- 

CREATE DATABASE `petstore` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `petstore`;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `account`
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
-- �������е����� `account`
-- 

INSERT INTO `account` VALUES ('u0001', '������', '123456', '��', '�㶫������', 'liuxh@163.com', '13512345678');
INSERT INTO `account` VALUES ('u0002', '�ż���', '123456', '��', '�㶫������', 'zhangjq@163.com', '13512345679');
INSERT INTO `account` VALUES ('u0003', '�޺��', '123456', 'Ů', '�㶫������', 'longhh@163.com', '13512345689');
INSERT INTO `account` VALUES ('u0004', '��껻�', '123456', 'Ů', '�㶫������', 'lihh@163.com', '13812345679');
INSERT INTO `account` VALUES ('u0005', '����ϼ', '123456', 'Ů', '�㶫�麣��', 'wumx@163.com', '13512345879');
INSERT INTO `account` VALUES ('u0006', '�����', '123456', '��', '�㶫��ɽ��', 'wangtc@163.com', '13802345679');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `category`
-- 

CREATE TABLE `category` (
  `catid` char(10) NOT NULL,
  `catname` varchar(20) default NULL,
  `cades` text,
  PRIMARY KEY  (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `category`
-- 

INSERT INTO `category` VALUES ('01', '����', '');
INSERT INTO `category` VALUES ('02', 'è', '');
INSERT INTO `category` VALUES ('03', '��', '');
INSERT INTO `category` VALUES ('04', '��', '');
INSERT INTO `category` VALUES ('05', '������', '');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `lineitem`
-- 

CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `itemid` char(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`orderid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `lineitem`
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
-- ��Ľṹ `orders`
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
-- �������е����� `orders`
-- 

INSERT INTO `orders` VALUES (20130411, 'u0001', '2013-04-11 15:07:34', 500.00, 0);
INSERT INTO `orders` VALUES (20130412, 'u0002', '2013-04-09 15:08:11', 305.60, 0);
INSERT INTO `orders` VALUES (20130413, 'u0003', '2013-04-15 15:09:00', 212.40, 0);
INSERT INTO `orders` VALUES (20130414, 'u0003', '2013-04-16 15:09:30', 120.45, 1);
INSERT INTO `orders` VALUES (20130415, 'u0004', '2013-04-02 15:10:05', 120.30, 0);

-- --------------------------------------------------------

-- 
-- ��Ľṹ `product`
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
-- �������е����� `product`
-- 

INSERT INTO `product` VALUES ('AV-CB-01', '05', '����ѷ����', '75 �����ϸ���ĺû��', 50.00, 60.00, 100);
INSERT INTO `product` VALUES ('AV-SB-02', '05', '��ȸ', '�ǳ��õļ�ѹ����', 45.00, 50.00, 98);
INSERT INTO `product` VALUES ('FI-FW-01', '01', '����', '�����ձ��ĵ�ˮ��', 45.50, 45.50, 300);
INSERT INTO `product` VALUES ('FI-FW-02', '01', '����', '�����й��ĵ�ˮ��', 6.80, 6.80, 100);
INSERT INTO `product` VALUES ('FI-SW-01', '01', '��ʹ��', '���԰Ĵ����ǵĺ�ˮ��', 10.00, 10.00, 100);
INSERT INTO `product` VALUES ('FI-SW-02', '01', '����', '���԰Ĵ����ǵĺ�ˮ��', 18.50, 20.00, 200);
INSERT INTO `product` VALUES ('FL-DLH-02', '04', '��˹è', '�ѺõļҾ�è, ����һ���߹�', 1000.00, 1200.00, 15);
INSERT INTO `product` VALUES ('FL-DSH-01', '04', '�����è', '��������', 80.00, 100.00, 40);
INSERT INTO `product` VALUES ('K9-BD-01', '02', 'ţͷȮ', '����Ӣ�������ѺõĹ�', 1350.00, 1500.00, 5);
INSERT INTO `product` VALUES ('K9-CW-01', '02', '������Ȯ', '�ܺõ���鹷', 180.00, 200.00, 120);
INSERT INTO `product` VALUES ('K9-DL-01', '02', '�ߵ㹷', '���������ӵĴ�', 3000.00, 3000.00, 1);
INSERT INTO `product` VALUES ('K9-PO-02', '02', 'ʨ��Ȯ', '���Է����Ŀɰ��Ĺ�', 2000.00, 2000.00, 3);
INSERT INTO `product` VALUES ('K9-RT-01', '02', '��ë��Ȯ', '���ͥ�Ĺ�', 300.00, 300.00, 200);
INSERT INTO `product` VALUES ('K9-RT-02', '02', '����������Ȯ', '���Թ�', 800.00, 800.00, 30);
INSERT INTO `product` VALUES ('RP-LI-02', '03', '����', '�Ѻõ���ɫ����', 60.00, 78.00, 40);
INSERT INTO `product` VALUES ('RP-SN-01', '03', '��β��', '�浱���Ź�', 200.00, 240.00, 10);
