1-- Write your PostgreSQL query statement below
2-- SELECT p1.product_id , p2.product_id 
3-- FROM ProductInfo p1
4-- LEFT JOIN ProductInfo p2
5-- ON p1.product_id < p2.product_id
6
7-- , pinfo1.category AS product1_category , pinfo2.category AS product2_category
8WITH order_pairs
9AS (
10SELECT pp1.product_id AS product1_id  , pp2.product_id AS product2_id , count(*) AS customer_count 
11FROM ProductPurchases pp1
12INNER JOIN ProductInfo pinfo1
13ON pp1.product_id = pinfo1.product_id 
14LEFT JOIN ProductPurchases pp2
15ON pp1.product_id < pp2.product_id AND pp1.user_id = pp2.user_id 
16INNER JOIN ProductInfo pinfo2
17ON pp2.product_id = pinfo2.product_id 
18GROUP BY pp1.product_id , pp2.product_id
19HAVING COUNT(*) >= 3 AND pp2.product_id IS NOT NULL
20ORDER BY customer_count DESC,  product1_id , product2_id ) 
21
22SELECT product1_id  , product2_id , pinfo1.category AS product1_category , pinfo2.category AS product2_category ,customer_count
23FROM order_pairs orderPair
24INNER JOIN ProductInfo pinfo1
25ON orderPair.product1_id = pinfo1.product_id 
26INNER JOIN ProductInfo pinfo2
27ON orderPair.product2_id = pinfo2.product_id 
28