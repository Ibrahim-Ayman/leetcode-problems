WITH golden_cus 
AS (
SELECT  customer_id , COUNT(order_id) AS total_orders ,
        ROUND((
            SUM(CASE 
            WHEN EXTRACT(HOUR FROM order_timestamp) BETWEEN 11 AND 13 THEN 1 
            WHEN EXTRACT(HOUR FROM order_timestamp) BETWEEN 18 AND 20 THEN 1 
        ELSE 0 END)::NUMERIC / COUNT(order_id)::NUMERIC) * 100 , 0) AS peak_hour_percentage , 
        ROUND(AVG(order_rating) , 2) average_rating 
FROM restaurant_orders 
GROUP BY customer_id 
HAVING COUNT(order_id) >= 3 AND AVG(order_rating) >= 4 
        AND COUNT(order_rating) > COUNT(order_id) / 2
)

SELECT customer_id , total_orders , peak_hour_percentage , average_rating 
FROM golden_cus
WHERE peak_hour_percentage >= 60
ORDER BY average_rating DESC , customer_id DESC