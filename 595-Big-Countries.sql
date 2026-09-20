-- Write your PostgreSQL query statement below
SELECT name , population , area  
FROM World w
WHERE area >= 3000000 OR population >= 25000000