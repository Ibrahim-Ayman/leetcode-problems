1-- Write your PostgreSQL query statement below
2WITH cumilative_sum
3AS (
4SELECT turn , person_name  , SUM(weight) OVER(ORDER BY turn) AS sum_weight
5FROM Queue)
6
7SELECT person_name 
8FROM cumilative_sum
9WHERE sum_weight <= 1000
10ORDER BY turn DESC
11LIMIT 1