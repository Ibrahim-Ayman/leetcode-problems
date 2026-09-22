SELECT visited_on , amount , average_amount
FROM (
SELECT visited_on 
        , SUM(daily_amount) 
        OVER(ORDER BY visited_on RANGE BETWEEN '6 DAY' PRECEDING AND CURRENT ROW) AS amount
        , ROUND(AVG(daily_amount) 
        OVER(ORDER BY visited_on RANGE BETWEEN '6 DAY' PRECEDING AND CURRENT ROW) , 2) AS average_amount 
        , visited_on - MIN(visited_on) OVER() AS days_start
FROM (
    SELECT visited_on , SUM(amount) AS daily_amount 
    FROM Customer
    GROUP BY visited_on
))
WHERE days_start >= 6