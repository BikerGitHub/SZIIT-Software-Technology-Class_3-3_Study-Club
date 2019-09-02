DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE IF NOT EXISTS bookstore
    DEFAULT CHARACTER   SET utf8;
USE bookstore;
CREATE TABLE book
(
    图书编号    VARCHAR(20) NOT NULL    PRIMARY KEY,
    图书类别    VARCHAR(20) NOT NULL,
    书名    VARCHAR(40) NOT NULL,
    作者    VARCHAR(10) NOT NULL,
    出版社  VARCHAR(20) NOT NULL,
    出版时间    DATE    NOT NULL,
    单价    FLOAT(5)    NOT NULL,
    数量    INT(5)  NOT NULL,
    折扣    FLOAT(5)    NOT NULL    DEFAULT 1
);
CREATE TABLE members
(
    用户号  CHAR(5) NOT NULL    PRIMARY KEY,
    姓名    VARCHAR(10)    NOT NULL,
    性别    CHAR(5),
    密码    VARCHAR(40) NOT NULL,
    联系电话    CHAR(11)    NOT NULL,
    注册时间    DATETIME    NOT NULL
);
CREATE TABLE sell
(
    订单号  VARCHAR(10) NOT NULL    PRIMARY KEY,
    用户号  CHAR(5) NOT NULL,
    图书编号    VARCHAR(20) NOT NULL,
    订购册数    INT(5)  NOT NULL,
    订购单价    FLOAT(5)    NOT NULL,
    订购时间    DATETIME    NOT NULL,
    是否发货    BOOLEAN NOT NULL    DEFAULT 0,
    是否收货    BOOLEAN NOT NULL    DEFAULT 0,
    是否结清    BOOLEAN NOT NULL    DEFAULT 0,
    FOREIGN KEY (订单号)
        REFERENCES book (图书编号)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
);