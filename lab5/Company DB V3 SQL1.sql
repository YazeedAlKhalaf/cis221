-- -----------------------------------------------------
-- Database Company V3 SQL1
-- -----------------------------------------------------
Drop database IF EXISTS company;
Create database company;
Use company;

CREATE TABLE Company.Department (
dnumber INT(1) PRIMARY KEY,
dname CHAR(15) UNIQUE );

CREATE TABLE Company.Employee ( 
empno INT(3) PRIMARY KEY, 
ename VARCHAR(20) NOT NULL, 
salary INT Default (300), 
entry DATE Default (current_date()), 
dno int(1),
FOREIGN KEY (dno) REFERENCES Department (dnumber) ON DELETE CASCADE ON UPDATE SET NULL,
CONSTRAINT CH CHECK (salary > 0) );

INSERT INTO Department (dnumber,dname) VALUES (1,'Personal');
INSERT INTO Department (dnumber,dname) VALUES (2,'Store');
INSERT INTO Department (dnumber,dname) VALUES (3,'Planning');
INSERT INTO Department (dnumber,dname) VALUES (4,'Accounting');

INSERT INTO Employee (empno, ename, salary, entry, dno) VALUES (111,'Ali',200,'2022-03-30',1);
INSERT INTO Employee (empno, ename, salary, entry, dno) VALUES (112,'Mohammed',100,'2018-02-1',1);
INSERT INTO Employee (empno, ename, salary, entry, dno) VALUES (113,'Kamal',200,'2019-04-1',2);
INSERT INTO Employee (empno, ename, salary, entry, dno) VALUES (114,'Fatah',500,'2023-01-1',3);
