SELECT e.name AS Employee 
FROM Employee e 
INNER JOIN Employee m
ON e.managerId = m.id AND e.salary > m.salary
