1-- Write your PostgreSQL query statement below
2
3    SELECT  customer_id , COUNT(*) AS total_orders ,
4            ROUND(
5            ((SUM
6            (CASE 
7            WHEN EXTRACT(HOUR FROM order_timestamp) IN (11,12,13,18,19,20) 
8            THEN 1 
9            ELSE 0 END )::numeric / COUNT(*)::numeric) * 100) 
10            , 0)
11            AS peak_hour_percentage ,
12            ROUND(AVG(order_rating) , 2) AS average_rating 
13    FROM restaurant_orders
14    GROUP BY customer_id 
15    HAVING  count(*) >= 3 AND
16            AVG(order_rating) >= 4 AND
17            COUNT(order_rating)::numeric / COUNT(*)::numeric > .5 AND
18            (SUM
19            (CASE 
20            WHEN EXTRACT(HOUR FROM order_timestamp) IN (11,12,13,18,19,20) 
21            THEN 1 
22            ELSE 0 END )::numeric / COUNT(*)::numeric) * 100  > 60
23    ORDER BY average_rating DESC , customer_id DESC
24
25
26
27
28