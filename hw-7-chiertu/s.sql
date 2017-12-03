CREATE TABLE chicago (Last TEXT, First TEXT, Position TEXT, Department TEXT,
                      FP TEXT, SH TEXT, Hours INTEGER, Salary REAL, Wage REAL);
.mode csv
.import salaries.csv chicago

SELECT ROUND(AVG(Salary),2)
FROM chicago
WHERE
Position LIKE '%FIREFIGHTER%' AND
Salary > 0;

SELECT SUM(Salary)
FROM chicago
WHERE
Department == "MAYOR'S OFFICE" AND
Salary > 0;

SELECT Department, COUNT(Department) AS 'headcount'
FROM chicago
WHERE
Department > 0
GROUP BY Department
ORDER BY headcount DESC
LIMIT 3;
