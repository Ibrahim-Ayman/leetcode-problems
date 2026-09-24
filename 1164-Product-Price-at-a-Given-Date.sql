-- Write your PostgreSQL query statement below
WITH ranked_prod_date
AS (
SELECT product_id , new_price , change_date , 
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) rn
FROM Products p 
WHERE change_date <= '2019-08-16'::date
)
SELECT product_id , new_price AS price
FROM ranked_prod_date rpd
WHERE rn = 1

UNION 

SELECT DISTINCT product_id , 10 
FROM Products p 
WHERE product_id NOT IN 
(
    SELECT DISTINCT product_id 
    FROM ranked_prod_date rpd 
)