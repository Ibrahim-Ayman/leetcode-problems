1-- Write your PostgreSQL query statement below
2WITH active_cus
3AS 
4(
5    SELECT customer_id , MAX(transaction_date) - MIN(transaction_date) as active_days
6    FROM customer_transactions ct
7    GROUP BY customer_id
8    HAVING MAX(transaction_date) - MIN(transaction_date) >= 30 AND COUNT(*) >= 3
9) ,
10purchsae_rate
11AS
12(
13    SELECT ct.customer_id , CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 
14    END
15                AS is_purchase
16    FROM customer_transactions ct 
17    INNER JOIN active_cus ac_cus
18    ON ct.customer_id = ac_cus.customer_id 
19)
20
21SELECT customer_id
22FROM purchsae_rate
23GROUP BY customer_id 
24HAVING AVG(is_purchase) > .8
25ORDER BY customer_id