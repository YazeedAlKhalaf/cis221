-- 1
SELECT * FROM Developper WHERE city = "AMMAN";

-- 2
SELECT SID, sname, cost FROM Software ORDER BY cost ASC;

-- 3
SELECT Category, sname
FROM Software
NATURAL JOIN Developper
NATURAL JOIN Loans
WHERE city = "Riyadh";

-- 4
SELECT sname, cost
FROM Software
WHERE cost > 100000
ORDER BY category ASC;

-- 5
SELECT MAX(cost) AS max_cost, MIN(cost) AS min_cost FROM Software;

-- 6
SELECT COUNT(SID) FROM Software WHERE cost > 100000;

-- 7
SELECT SUM(Software.cost) AS total_cost
FROM Software
NATURAL JOIN Loans
NATURAL JOIN Developper
WHERE Developper.dname = "The Pirate";

-- 8
SET autocommit = 0;
START TRANSACTION;

UPDATE Software
SET cost = cost * 1.15;
SELECT * FROM Software;

ROLLBACK;

-- just to make sure we didn't change things
SELECT * FROM Software;

-- 9
SET autocommit = 0;
START TRANSACTION;

DELETE FROM Software
WHERE Category = "DB" OR Category = "AI";
# SELECT * FROM Software;

ROLLBACK;