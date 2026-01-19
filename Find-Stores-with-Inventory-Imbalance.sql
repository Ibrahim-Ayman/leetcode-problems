1-- Write your PostgreSQL query statement below
2WITH most_price_prod
3AS (
4SELECT * 
5FROM
6(
7    SELECT * , ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price DESC) AS rn
8    FROM inventory
9) AS new_table 
10WHERE rn = 1
11) , 
12least_price_prod 
13AS (
14SELECT * 
15FROM
16(
17    SELECT * , ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price) AS rn
18    FROM inventory
19) AS new_table 
20WHERE rn = 1
21) ,
22prod_count
23AS (
24    SELECT store_id
25    FROM inventory inv
26    GROUP BY store_id 
27    HAVING COUNT(*) >= 3
28)
29
30SELECT str.store_id , str.store_name , str.location , 
31        mpp.product_name AS most_exp_product , 
32        lpp.product_name AS cheapest_product , 
33        ROUND(lpp.quantity::numeric / mpp.quantity::numeric , 2) AS imbalance_ratio 
34FROM most_price_prod mpp 
35INNER JOIN least_price_prod lpp 
36ON mpp.store_id  = lpp.store_id  
37INNER JOIN prod_count 
38ON mpp.store_id = prod_count.store_id
39INNER JOIN stores str
40ON mpp.store_id = str.store_id
41WHERE mpp.quantity < lpp.quantity
42ORDER BY imbalance_ratio DESC , str.store_name
43
44
45
46