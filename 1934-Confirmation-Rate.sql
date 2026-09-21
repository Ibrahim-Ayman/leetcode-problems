SELECT s.user_id , ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1
        ELSE 0 END)::NUMERIC / COUNT(action) , 2) AS confirmation_rate 
FROM Signups s 
LEFT JOIN Confirmations  c 
ON s.user_id = c.user_id 
WHERE c.user_id IS NOT NULL
GROUP BY s.user_id

UNION 

SELECT s.user_id , 0
FROM Signups s 
LEFT JOIN Confirmations  c 
ON s.user_id = c.user_id 
WHERE c.user_id IS NULL