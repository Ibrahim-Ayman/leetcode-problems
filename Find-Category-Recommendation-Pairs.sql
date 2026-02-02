1-- Write your PostgreSQL query statement below
2-- SELECT category1 , category2 ,  COUNT(user_id) AS customer_count
3-- FROM (
4--     SELECT pp1.user_id user_id, pi1.category category1 , pi2.category category2
5--     FROM ProductPurchases pp1
6--     INNER JOIN ProductPurchases pp2
7--     ON pp1.user_id = pp2.user_id AND pp1.product_id < pp2.product_id
8--     INNER JOIN ProductInfo pi1
9--     ON pp1.product_id = pi1.product_id 
10--     INNER JOIN ProductInfo pi2 
11--     ON pp2.product_id = pi2.product_id
12--     GROUP BY pp1.user_id , pi1.category , pi2.category
13--     ORDER BY user_id
14-- ) AS table1 
15-- GROUP BY category1 , category2
16-- HAVING COUNT(user_id) > 2
17-- ORDER BY  customer_count DESC , category1 , category2
18WITH purchases_category
19AS (
20SELECT category , user_id 
21FROM ProductPurchases pp
22INNER JOIN ProductInfo pi
23ON pp.product_id = pi.product_id
24GROUP BY user_id , category
25) 
26
27SELECT category1 , category2 , COUNT(*) AS customer_count
28FROM (
29SELECT pc1.user_id , pc1.category category1 , pc2.category category2
30FROM purchases_category pc1
31INNER JOIN purchases_category pc2
32ON pc1.user_id = pc2.user_id AND pc1.category < pc2.category 
33) AS TABLE1
34GROUP BY category1 , category2
35HAVING COUNT(*) > 2
36ORDER BY customer_count DESC , category1 , category2
37