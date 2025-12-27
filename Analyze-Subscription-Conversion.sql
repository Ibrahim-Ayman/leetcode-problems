1-- Write your PostgreSQL query statement below
2WITH who_converted_free_paid 
3AS (
4SELECT user_id 
5FROM UserActivity
6GROUP BY user_id 
7HAVING SUM(CASE WHEN activity_type = 'free_trial' THEN 1 ELSE 0 END) > 0 AND 
8        SUM(CASE WHEN activity_type = 'paid' THEN 1 ELSE 0 END) > 0
9)
10
11SELECT  user_id , 
12        ROUND(SUM(CASE WHEN activity_type = 'free_trial' THEN activity_duration ELSE 0 END)::numeric /  SUM(CASE WHEN activity_type = 'free_trial' THEN 1 ELSE 0 END)::numeric , 2) AS trial_avg_duration  , 
13        ROUND(SUM(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE 0 END)::numeric / SUM(CASE WHEN activity_type = 'paid' THEN 1 ELSE 0 END)::numeric , 2) AS paid_avg_duration  
14FROM UserActivity 
15WHERE user_id in (SELECT * FROM who_converted_free_paid)
16GROUP BY user_id
17ORDER BY user_id