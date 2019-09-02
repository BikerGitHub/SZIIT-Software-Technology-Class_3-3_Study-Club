-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ��������: 2013 �� 08 �� 26 �� 04:43
-- �������汾: 5.0.45
-- PHP �汾: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- ���ݿ�: `yggl`
-- 
CREATE DATABASE `yggl` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `yggl`;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `departments`
-- 

CREATE TABLE `departments` (
  `���ű��` char(3) NOT NULL COMMENT '���ű��',
  `��������` char(20) NOT NULL COMMENT '������',
  `��ע` text COMMENT '��ע',
  PRIMARY KEY  (`���ű��`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `departments`
-- 

INSERT INTO `departments` VALUES ('1', '����', NULL);
INSERT INTO `departments` VALUES ('2', '������Դ��', NULL);
INSERT INTO `departments` VALUES ('3', '����칫��', NULL);
INSERT INTO `departments` VALUES ('4', '�з���', NULL);
INSERT INTO `departments` VALUES ('5', '�г���', NULL);

-- --------------------------------------------------------

-- 
-- ��Ľṹ `employees`
-- 

CREATE TABLE `employees` (
  `Ա�����` char(6) NOT NULL,
  `����` char(10) NOT NULL,
  `ѧ��` char(4) NOT NULL,
  `��������` date NOT NULL,
  `�Ա�` char(2) NOT NULL,
  `��������` tinyint(1) default NULL,
  `��ַ` varchar(20) default NULL,
  `�绰����` char(12) default NULL,
  `Ա�����ź�` char(3) NOT NULL,
  PRIMARY KEY  (`Ա�����`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `employees`
-- 

INSERT INTO `employees` VALUES ('000001', '����', '��ר', '1966-01-23', '1', 8, '��ɽ·32-1-508', '83355668', '2');
INSERT INTO `employees` VALUES ('010008', '���ݻ�', '����', '1976-03-28', '1', 3, '������·100-2', '83321321', '1');
INSERT INTO `employees` VALUES ('020010', '������', '˶ʿ', '1982-12-09', '1', 2, '����¥10-0-108', '83792361', '1');
INSERT INTO `employees` VALUES ('020018', '����', '��ר', '1960-07-30', '0', 6, '��ɽ��·102-2', '83413301', '1');
INSERT INTO `employees` VALUES ('102201', '����', '����', '1972-10-18', '1', 3, '����·100-2', '83606608', '5');
INSERT INTO `employees` VALUES ('102208', '�쿡', '˶ʿ', '1965-09-28', '1', 2, '��¥��5-3-106', '84708817', '5');
INSERT INTO `employees` VALUES ('108991', '����', '˶ʿ', '1979-08-10', '0', 4, '��ɽ·10-3-105', '83346722', '3');
INSERT INTO `employees` VALUES ('111006', '��ʯ��', '����', '1974-10-01', '1', 1, '���·34-1-203', '84563418', '5');
INSERT INTO `employees` VALUES ('210678', '����', '��ר', '1977-04-02', '1', 2, '��ɽ��·24-35', '83467336', '3');
INSERT INTO `employees` VALUES ('302566', '������', '����', '1968-09-20', '1', 3, '�Ⱥ�·209-3', '58765991', '4');
INSERT INTO `employees` VALUES ('308759', 'Ҷ��', '����', '1978-11-18', '1', 2, '������·3-7-52', '83308901', '4');
INSERT INTO `employees` VALUES ('504209', '������', '��ר', '1969-09-03', '0', 5, '����·120-4-12', '84468158', '4');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `salary`
-- 

CREATE TABLE `salary` (
  `Ա�����` char(6) NOT NULL COMMENT 'Ա�����',
  `����` float NOT NULL COMMENT '����',
  `֧��` float NOT NULL COMMENT '֧��',
  PRIMARY KEY  (`Ա�����`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `salary`
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
