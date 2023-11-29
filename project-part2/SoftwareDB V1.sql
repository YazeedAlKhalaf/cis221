-- -----------------------------------------------------
-- Database SoftwareDB V1
-- -----------------------------------------------------
Drop database IF EXISTS SoftwareDB;
Create database SoftwareDB;
Use SoftwareDB;

CREATE TABLE SoftwareDB.Developper (
DID INT(5) PRIMARY KEY,
dname varchar(30),
email varchar(30) NOT NULL,
Mobile char (20),
city varchar(30));

CREATE TABLE SoftwareDB.Software ( 
SID INT(5) PRIMARY KEY, 
Category CHAR(10) NOT NULL,
sname varchar(30),
cost numeric (10,2) );

CREATE TABLE SoftwareDB.Loans (
DID INT(5),
SID INT(5),
loandate date,
PRIMARY KEY (DID, SID),
FOREIGN KEY (DID) REFERENCES Developper(DID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SID) REFERENCES Software(SID) ON DELETE CASCADE ON UPDATE CASCADE );

INSERT INTO Developper(DID, dname, email, mobile, city) VALUES (22763,'The Pirate','thepirate@yahoo.com','055522335','Riyadh');
INSERT INTO Developper(DID, dname, email, mobile, city) VALUES (22487,'Top Code','topcode@hotmail.com','056978654','Paris');
INSERT INTO Developper(DID, dname, email, mobile, city) VALUES (22330,'Pro 1','pro1@gmail.com','050994562','Amman');
INSERT INTO Developper(DID, dname, email, mobile, city) VALUES (22891,'Dolphin','Dolphin@yahoo.com','054367899','Rome');

INSERT INTO Software(SID, Category, sname, cost) VALUES (66230,'editing','msword',109923.00);
INSERT INTO Software(SID, Category, sname, cost) VALUES (66990,'gaming','Starcode',300999.00);
INSERT INTO Software(SID, Category, sname, cost) VALUES (66398,'AI','Python',33499.00);
INSERT INTO Software(SID, Category, sname, cost) VALUES (66117,'DB','minisql',1000.00);

INSERT INTO Loans(DID, SID, loandate) VALUES (22763, 66230,'2020-03-30');
INSERT INTO Loans(DID, SID, loandate) VALUES (22763, 66398,'2023-10-22');
INSERT INTO Loans(DID, SID, loandate) VALUES (22330, 66990,'2023-09-12');
INSERT INTO Loans(DID, SID, loandate) VALUES (22891, 66117,'2022-02-10');

