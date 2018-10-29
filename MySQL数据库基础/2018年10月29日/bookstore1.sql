drop database if exists bookstore;

create database if not exists bookstore
default character set utf8;
use bookstore;

CREATE TABLE  book (       
 bookno  char(10)   NOT NULL,       
 booktype  varchar(8)  NOT NULL  default 'computer',       
 bookname       varchar(40)  NOT  NULL ,       
 pubtime   date        NOT  NULL , 
 publisher   varchar(40)   ,        
 price      float(5,2)   ,       
 num      int,
 primary key(bookno)
); 
insert into book values('tp001','computer','how to learn java','2010-1-1','sz',100,1000);
CREATE TABLE  members (       
 userno  char(5)   NOT NULL,       
 username  varchar(8)  NOT NULL,       
 sex       char(2)  ,       
 phone   varchar(8) ,       
 regtime     date 
); 

CREATE TABLE  sell (       
 orderno  char(5)   NOT NULL,       
 userno  char(5)  NOT NULL ,       
 bookno  char(10)   NOT NULL,       
 num   int , 
 price float,       
 orderdate date  null,
 ifsend int DEFAULT  0,
 ifget int DEFAULT 0,
 ifpay int DEFAULT  0
); 
