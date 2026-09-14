SELECT ROUND((SUM(CASE WHEN order_date = customer_pref_delivery_date
        THEN 1 ELSE 0 END)::FLOAT * 100
        /
        COUNT(CASE WHEN order_date = customer_pref_delivery_date
        THEN 1 ELSE 0 END))::NUMERIC , 2) AS immediate_percentage
FROM (
SELECT order_date , customer_pref_delivery_date , 
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn_cust
FROM Delivery d) AS new_table
WHERE rn_cust = 1
