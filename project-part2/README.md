# Project Part 2

## Students Participating

- Yazeed AlKhalaf - 202211123
- Mohammed Kahtan - 202211146

### Question 1:

Which developer lives in “Amman”?

> Query:

```sql
SELECT * FROM Developper WHERE city = "AMMAN";
```

> Result:

| SID   | sname    | cost      |
| ----- | -------- | --------- |
| 66117 | minisql  | 1000.00   |
| 66398 | Python   | 33499.00  |
| 66230 | msword   | 109923.00 |
| 66990 | Starcode | 300999.00 |

### Question 2:

List the software IDs, names and their costs in increasing order.

> Query:

```sql
SELECT SID, sname, cost FROM Software ORDER BY cost ASC;
```

> Result:

| SID   | sname    | cost      |
| ----- | -------- | --------- |
| 66117 | minisql  | 1000.00   |
| 66398 | Python   | 33499.00  |
| 66230 | msword   | 109923.00 |
| 66990 | Starcode | 300999.00 |

### Question 3:

List the software category and name loaned by developers living in Riyadh.

> Query:

```sql
SELECT Category, sname
FROM Software
NATURAL JOIN Developper
NATURAL JOIN Loans
WHERE city = "Riyadh";
```

> Result:

| Category | sname  |
| -------- | ------ |
| editing  | msword |
| AI       | Python |

### Question 4:

Provide the list of software name and cost for costs greater than 100,000. The list should be ordered according to each category.

> Query:

```sql
SELECT sname, cost
FROM Software
WHERE cost > 100000
ORDER BY category ASC;
```

> Result:

| sname    | cost      |
| -------- | --------- |
| msword   | 109923.00 |
| Starcode | 300999.00 |

### Question 5:

Which software has the maximum and minimum cost?

> Query:

```sql
SELECT MAX(cost) AS max_cost, MIN(cost) AS min_cost FROM Software;
```

> Result:

| max_cost  | min_cost |
| --------- | -------- |
| 300999.00 | 1000.00  |

### Question 6:

How many software have a cost greater than 100,000?

> Query:

```sql
SELECT COUNT(SID) FROM Software WHERE cost > 100000;
```

> Result:

| COUNT(SID) |
| ---------- |
| 2          |

### Question 7:

Compute the total cost of software loaned by developer “The Pirate”.

> Query:

```sql
SELECT SUM(Software.cost) AS total_cost
FROM Software
NATURAL JOIN Loans
NATURAL JOIN Developper
WHERE Developper.dname = "The Pirate";
```

> Result:

| total_cost |
| ---------- |
| 143422.00  |

### Question 8:

Increase all the software cost in table Software with 15%.

> Query:

```sql
UPDATE Software
SET cost = cost * 1.15;
SELECT * FROM Software;
```

> Result:

| SID   | Category | sname    | cost      |
| ----- | -------- | -------- | --------- |
| 66117 | DB       | minisql  | 1150.00   |
| 66230 | editing  | msword   | 126411.45 |
| 66398 | AI       | Python   | 38523.85  |
| 66990 | gaming   | Starcode | 346148.85 |

### Question 9:

Delete all software with categories “AI” and “DB”.

> Query:

```sql
DELETE FROM Software
WHERE Category = "DB" OR Category = "AI";
```

> Result:

![question9-result](./images/question9.png)
