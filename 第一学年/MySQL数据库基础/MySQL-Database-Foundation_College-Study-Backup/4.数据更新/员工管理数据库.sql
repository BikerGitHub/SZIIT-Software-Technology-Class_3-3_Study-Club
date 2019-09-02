DROP DATABASE IF EXISTS YGGL;
CREATE DATABASE IF NOT EXISTS YGGL
	DEFAULT CHARACTER   SET utf8;
USE YGGL;
CREATE TABLE employees
(
	员工编号	CHAR(6)	NOT NULL PRIMARY KEY,
	姓名	CHAR(10)	NOT NULL,
	学历	CHAR(4)	NOT NULL,
	出生日期	DATE	NOT NULL,
	性别	CHAR(2)	NOT NULL,
	工作年限	TINYINT	NOT NULL	DEFAULT 0,
	地址	VARCHAR(20),
	电话号码	CHAR(11),
	员工部门号	CHAR(3)	NOT NULL
);
CREATE TABLE departments
(
	部门编号	CHAR(3)	NOT NULL	PRIMARY KEY,
	部门名称	CHAR(20)	NOT NULL,
	部门负责人编号	CHAR(6),
	备注	TEXT,
	FOREIGN KEY(部门负责人编号)
		REFERENCES employees(员工编号)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);
CREATE TABLE salary
(
	员工编号	CHAR(6)	NOT NULL	PRIMARY KEY,
	收入	FLOAT(8,2)	NOT NULL,
	支出	FLOAT(8,2)	NOT NULL,
	FOREIGN KEY(员工编号)
		REFERENCES employees(员工编号)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);

ALTER TABLE employees
	ADD CHECK(工作年限>0 AND 工作年限<30);
ALTER TABLE employees
	ADD
	FOREIGN KEY(员工部门号)
		REFERENCES departments(部门编号)
			ON DELETE CASCADE
			ON UPDATE CASCADE;

INSERT INTO departments VALUES
	('1','财务部',NULL,NULL),
	('2','人力资源部',NULL,NULL),
	('6','销售部',NULL,'筹建');
INSERT INTO employees VALUES
	('600001','张松','本科','1988-01-30','男',2,'解放路23号','83234567','6'),
	('600002','付晓','大专','1979-12-01','女',10,'前景路45号','83455689','6'),
	('000001','王林','大专','1966-01-23','男',8,'中山路32-1-508','83355668','2'),
	('020010','王向容','硕士','1982-12-09','女',2,'四牌楼10-0-108','83792361','1');
INSERT INTO salary VALUES
	('000001','2100.8','123.09'),
	('020010','2860','198');
UPDATE employees,salary,departments
	set employees.员工部门号=departments.部门编号,salary.收入=salary.收入+1000,departments.部门负责人编号=employees.员工编号
		WHERE employees.员工编号=salary.员工编号 AND employees.姓名='王向容' AND departments.部门名称='销售部';
DELETE 
	FROM employees,salary
	USING employees,salary
		WHERE employees.员工编号=salary.员工编号 AND employees.姓名='王林';
	