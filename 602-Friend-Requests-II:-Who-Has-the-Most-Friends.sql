-- Write your PostgreSQL query statement belowW
WITH req_ids
AS (
SELECT requester_id AS id, COUNT(accepter_id) AS c_acc
FROM RequestAccepted ra
GROUP BY requester_id 
) , acc_ids
AS (
SELECT accepter_id AS id , COUNT(requester_id) AS c_req
FROM RequestAccepted ra
GROUP BY accepter_id 
) 

SELECT COALESCE(a.id , r.id) AS id , COALESCE(c_req , 0) + COALESCE(c_acc , 0) AS num
FROM req_ids r
FULL OUTER JOIN acc_ids a
ON r.id = a.id
-- GROUP BY a.id
ORDER BY num DESC 
LIMIT 1
