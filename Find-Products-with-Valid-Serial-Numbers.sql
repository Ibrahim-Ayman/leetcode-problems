1-- Write your PostgreSQL query statement below
2SELECT * 
3FROM products
4WHERE description ~ '(?:(?<=^)|(?<=\s))SN\d{4}-\d{4}(?:(?=$)|(?=\s))'
5ORDER BY product_id