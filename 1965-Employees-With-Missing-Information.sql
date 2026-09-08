WITH emplyees_FINFO 
AS (
SELECT e.employee_id 
FROM Employees e
INNER JOIN Salaries s 
ON e.employee_id = s.employee_id
)

SELECT employee_id 
FROM Employees 
WHERE employee_id NOT IN (SELECT * FROM emplyees_FINFO)

UNION ALL 

SELECT employee_id 
FROM Salaries 
WHERE employee_id NOT IN (SELECT * FROM emplyees_FINFO)
ORDER BY employee_id
