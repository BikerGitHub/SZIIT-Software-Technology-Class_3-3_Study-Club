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

SELECT 地址 AS address,电话号码 AS telephone
	FROM employees;
SELECT DISTINCT 员工部门号,性别
	FROM employees;
SELECT *,收入-支出 AS 实际支出
	FROM salary;
SELECT 姓名,
	CASE
		WHEN 性别='男' THEN '男'
		WHEN 性别='女' THEN '女'
		END AS 性别
	FROM employees;
SELECT 员工编号,
	CASE
		WHEN 收入<2000 THEN '低收入'
		WHEN 收入 BETWEEN 2000 AND 3000 THEN '中等收入'
		WHEN 收入>3000 THEN '高收入'
		END AS 收入水平
	FROM salary;

SELECT 员工编号
	FROM salary
	WHERE 收入>2000;
SELECT 姓名,地址
	FROM employees
	WHERE 出生日期>='1970-01-01';
SELECT *
	FROM salary
	WHERE 支出 BETWEEN 50 AND 150;
SELECT *
	FROM employees
	WHERE 工作年限>=3 AND 学历 in ('本科','硕士','博士');
SELECT *
	FROM salary
	WHERE 收入-支出 BETWEEN 2000 AND 3000;
SELECT *
	FROM employees
	WHERE 员工部门号 in (1,4) AND 性别='女';

SELECT employees.*,salary.*
	FROM employees
		JOIN salary	ON employees.员工编号=salary.员工编号;
SELECT employees.*,departments.部门名称
	FROM employees
		JOIN departments	ON employees.员工部门号=departments.部门编号
	WHERE employees.姓名='王林';
SELECT employees.姓名,salary.支出
	FROM employees
		JOIN salary	ON employees.员工编号=salary.员工编号
	WHERE salary.收入 BETWEEN 2000 AND 3000;
SELECT employees.姓名,salary.收入
	FROM employees
		JOIN salary	ON employees.员工编号=salary.员工编号
		JOIN departments	ON employees.员工部门号=departments.部门编号
	WHERE departments.部门名称='研发部'
		AND employees.出生日期<'1970-01-01';

SELECT departments.部门名称,COUNT('employees.*') AS '员工人数'
	FROM employees
		JOIN departments	ON employees.员工部门号=departments.部门编号
	GROUP BY 员工部门号;
SELECT 性别,COUNT(*) AS '员工人数'
	FROM employees
	GROUP BY 性别;
SELECT departments.部门名称,COUNT('employees.*') AS '员工人数'
	FROM employees
		JOIN departments	ON employees.员工部门号=departments.部门编号
	GROUP BY 员工部门号
		HAVING COUNT('employees.*')>2;

SELECT *
	FROM employees
	ORDER BY 出生日期 DESC;
SELECT *
	FROM salary
	ORDER BY 收入
	LIMIT 5;
SELECT employees.工作年限,COUNT(*) AS 人数
	FROM employees
	GROUP BY 工作年限
	ORDER BY 人数;
SELECT 姓名,地址,学历
	FROM employees
	WHERE 员工编号 LIKE '%0_'
	ORDER BY 学历;