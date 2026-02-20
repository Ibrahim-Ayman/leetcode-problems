1-- Write your PostgreSQL query statement below
2SELECT *
3FROM products
4WHERE description ~ '^SN[0-9]{4}-[0-9]{4} [a-zA-Z0-9 ]*$' 
5    OR description ~ '^[a-zA-Z0-9 ]* SN[0-9]{4}-[0-9]{4} [a-zA-Z0-9 ]*$'
6    OR description ~ '^[a-zA-Z0-9 ]* SN[0-9]{4}-[0-9]{4}$'
7    OR description ~ '^SN[0-9]{4}-[0-9]{4}$'
8ORDER BY product_id