drop database if exists yggl;

create database if not exists yggl;
use yggl;

CREATE TABLE  employees(
 empno  varchar(6)  NOT  NULL primary key,
 name   char(10)   NOT   NULL ,
 education    char(4)   NOT NULL ,
 birthdate  date        NOT NULL ,
 sex    char(2)   NOT  NULL ,
 workinglife   tinyint  NULL  ,
 address  varchar(20)  NULL ,
 telephone   char(12)  NULL ,
 deptno  char(3)   NULL  
);
CREATE TABLE   departments  (
 deptno char(3)   NOT NULL ,
 deptname char(20)   NOT NULL  ,
 remarks     text   NULL
);
CREATE TABLE   salary (
 empno char(6)   NOT NULL ,
 income float(8,2)   NOT NULL ,
 expense float(8,2)  NOT NULL
);
