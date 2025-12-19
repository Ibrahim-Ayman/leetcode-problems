1-- Write your PostgreSQL query statement below
2SELECT * 
3FROM Users 
4WHERE email ~ '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$'
5ORDER BY user_id