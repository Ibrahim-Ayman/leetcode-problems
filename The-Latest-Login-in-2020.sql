1-- Write your PostgreSQL query statement below
2SELECT user_id , MAX(time_stamp) AS last_stamp
3FROM Logins 
4WHERE DATE_PART('YEAR' , time_stamp) = 2020 
5GROUP BY user_id 