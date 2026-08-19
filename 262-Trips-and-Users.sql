-- Write your PostgreSQL query statement below
SELECT request_at AS Day , 
    ROUND(
    (CAST(
    SUM(CASE WHEN status = 'cancelled_by_driver' 
    THEN 1
    WHEN status = 'cancelled_by_client' 
    THEN 1
    ELSE 0 END) AS FLOAT) / CAST(COUNT(*) AS FLOAT))::numeric
    , 2) AS "Cancellation Rate"
FROM Trips t
INNER JOIN Users d 
ON t.driver_id = d.users_id 
INNER JOIN Users c 
ON t.client_id = c.users_id 
WHERE d.banned = 'No' and c.banned = 'No' and request_at in ('2013-10-01' , '2013-10-02' , '2013-10-03')
GROUP BY request_at
