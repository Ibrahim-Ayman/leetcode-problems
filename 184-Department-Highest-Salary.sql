-- Write your PostgreSQL query statement below
WITH ordered_sal 
AS (
SELECT d.name AS Department , e.name AS Employee , salary AS Salary ,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS DR
FROM Employee e 
INNER JOIN Department d
ON e.departmentId = d.id
)
SELECT Department , Employee , Salary 
FROM ordered_sal
WHERE DR = 1