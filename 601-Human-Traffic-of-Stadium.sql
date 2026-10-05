WITH more100
AS (
    SELECT id , visit_date , people , 
            ROW_NUMBER() OVER(ORDER BY id) as rn
    FROM Stadium s 
    WHERE people >= 100
) , gaps
AS (
    SELECT id , id - rn AS gap
    FROM more100 m
) 

SELECT g.id , visit_date , people
FROM gaps g
INNER JOIN more100 m 
ON g.id = m.id
WHERE gap IN (
    SELECT gap
    FROM gaps 
    GROUP BY gap
    HAVING COUNT(*) >= 3
)