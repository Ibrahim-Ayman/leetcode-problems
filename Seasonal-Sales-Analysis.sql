1-- Write your PostgreSQL query statement below
2SELECT season , category , total_quantity , total_revenue  
3FROM (
4SELECT season , category , total_quantity , total_revenue , ROW_NUMBER() OVER(PARTITION BY season ORDER BY total_quantity DESC) as rn
5FROM (
6SELECT season , category , SUM(quantity) AS total_quantity , 
7        SUM(quantity * price) AS total_revenue
8FROM (
9SELECT category , quantity , price 
10        , CASE WHEN DATE_PART('MONTH' , sale_date) IN (12,1,2) THEN 'Winter'
11            WHEN DATE_PART('MONTH' , sale_date) IN (3,4,5) THEN 'Spring'
12            WHEN DATE_PART('MONTH' , sale_date) IN (6,7,8) THEN 'Summer'
13            ELSE 'Fall' END as season
14FROM sales s 
15INNER JOIN products p 
16ON s.product_id = p.product_id ) AS new_table
17GROUP BY season , category) AS new_table2 )
18WHERE rn = 1
19
20