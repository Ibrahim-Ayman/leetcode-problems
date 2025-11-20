-- Write your PostgreSQL query statement below
SELECT DISTINCT(log1.num) AS ConsecutiveNums 
FROM logs log1 
INNER JOIN logs log2 
ON log2.id = log1.id+1
INNER JOIN logs log3
ON log3.id = log1.id+2
WHERE log1.num = log2.num AND log1.num = log3.num
