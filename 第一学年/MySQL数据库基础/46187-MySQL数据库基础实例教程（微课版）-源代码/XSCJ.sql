-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ��������: 2013 �� 08 �� 26 �� 04:41
-- �������汾: 5.0.45
-- PHP �汾: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- ���ݿ�: `xscj`
-- 
CREATE DATABASE `xscj` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `xscj`;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `kc`
-- 

CREATE TABLE `kc` (
  `�γ̺�` char(3) NOT NULL,
  `�γ���` char(16) NOT NULL,
  `����ѧ��` tinyint(1) NOT NULL default '1' COMMENT 'ֻ��Ϊ1-8',
  `ѧʱ` tinyint(1) NOT NULL,
  `ѧ��` tinyint(1) default NULL,
  PRIMARY KEY  (`�γ̺�`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `kc`
-- 

INSERT INTO `kc` VALUES ('101', '���������', 1, 80, 5);
INSERT INTO `kc` VALUES ('102', '�������������', 2, 68, 4);
INSERT INTO `kc` VALUES ('206', '��ɢ��ѧ', 4, 68, 4);
INSERT INTO `kc` VALUES ('208', '���ݽṹ', 5, 68, 4);
INSERT INTO `kc` VALUES ('209', '����ϵͳ', 6, 68, 4);
INSERT INTO `kc` VALUES ('210', '�����ԭ��', 5, 85, 5);
INSERT INTO `kc` VALUES ('212', '���ݿ�ԭ��', 7, 68, 4);
INSERT INTO `kc` VALUES ('301', '���������', 7, 51, 3);
INSERT INTO `kc` VALUES ('302', '�������', 7, 51, 3);

-- --------------------------------------------------------

-- 
-- ��Ľṹ `xs`
-- 

CREATE TABLE `xs` (
  `ѧ��` char(6) NOT NULL,
  `����` char(8) NOT NULL,
  `רҵ��` char(10) default NULL,
  `�Ա�` tinyint(1) NOT NULL default '1' COMMENT '1Ϊ�� 0ΪŮ',
  `����ʱ��` date NOT NULL,
  `��ѧ��` tinyint(1) default NULL,
  `��Ƭ` blob,
  `��ע` text,
  PRIMARY KEY  (`ѧ��`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `xs`
-- 

INSERT INTO `xs` VALUES ('081101', '����', '�����', 1, '1990-02-10', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081102', '����', '�����', 1, '1991-02-01', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081103', '����', '�����', 0, '1989-10-06', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081104', 'Τ��ƽ', '�����', 1, '1990-08-26', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081106', '���', '�����', 1, '1990-11-20', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081107', '����', '�����', 1, '1990-05-01', 54, NULL, '��ǰ���꡶���ݽṹ��������ѧ��');
INSERT INTO `xs` VALUES ('081108', '��һ��', '�����', 1, '1989-08-05', 52, NULL, '����ǰ����һ�ſ�');
INSERT INTO `xs` VALUES ('081109', '��ǿ��', '�����', 1, '1989-08-11', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081110', '��ε', '�����', 0, '1991-07-22', 50, NULL, '������');
INSERT INTO `xs` VALUES ('081111', '����', '�����', 0, '1990-03-18', 50, NULL, NULL);
INSERT INTO `xs` VALUES ('081113', '�Ϻ�', '�����', 0, '1989-08-11', 48, NULL, '��һ�Ź��β����񣬴�����');
INSERT INTO `xs` VALUES ('081201', '����', 'ͨ�Ź���', 1, '1989-06-10', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081202', '����', 'ͨ�Ź���', 1, '1989-01-29', 40, NULL, '��һ�ſβ����񣬴�����');
INSERT INTO `xs` VALUES ('081203', '������', 'ͨ�Ź���', 1, '1990-03-26', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081204', '������', 'ͨ�Ź���', 0, '1989-02-10', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081206', '���', 'ͨ�Ź���', 1, '1989-09-20', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081210', '�����', 'ͨ�Ź���', 1, '1989-05-01', 44, NULL, '����ǰ����һ�ſΣ������ѧ��');
INSERT INTO `xs` VALUES ('081216', '������', 'ͨ�Ź���', 1, '1989-03-09', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081218', '����', 'ͨ�Ź���', 1, '1990-10-09', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081220', '��ޱ��', 'ͨ�Ź���', 0, '1990-03-18', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081221', '������', 'ͨ�Ź���', 0, '1989-11-12', 42, NULL, NULL);
INSERT INTO `xs` VALUES ('081241', '������', 'ͨ�Ź���', 0, '1990-01-30', 50, NULL, 'תרҵѧϰ');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `xs_kc`
-- 

CREATE TABLE `xs_kc` (
  `ѧ��` char(6) NOT NULL,
  `�γ̺�` char(3) NOT NULL,
  `�ɼ�` tinyint(1) default NULL,
  `ѧ��` tinyint(1) default NULL,
  PRIMARY KEY  USING BTREE (`ѧ��`,`�γ̺�`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- 
-- �������е����� `xs_kc`
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
