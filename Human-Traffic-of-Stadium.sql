1-- Write your PostgreSQL query statement below
2with same_id_diff 
3AS (
4    SELECT * , id - row_number() OVER() as id_diff
5    FROM Stadium
6    WHERE people > 99
7)
8
9SELECT id , visit_date , people
10FROM same_id_diff
11WHERE id_diff in (
12    SELECT id_diff 
13    FROM same_id_diff
14    GROUP BY id_diff
15    having COUNT(id_diff) > 2
16)