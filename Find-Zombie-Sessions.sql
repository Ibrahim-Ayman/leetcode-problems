1-- Write your PostgreSQL query statement below
2SELECT session_id , user_id , session_duration_minutes , scroll_count
3FROM (
4SELECT 
5    EXTRACT(EPOCH FROM (MAX(event_timestamp) - MIN(event_timestamp))) / 60 AS session_duration_minutes ,
6    MAX(user_id) AS user_id ,
7    SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END) AS scroll_count ,
8    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_event ,
9    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS click_count ,
10    session_id  
11FROM app_events 
12GROUP BY session_id 
13HAVING EXTRACT(EPOCH FROM (MAX(event_timestamp) - MIN(event_timestamp))) / 60 >= 30
14        AND SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END) >= 5
15        AND SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) = 0
16        AND SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END)::FLOAT / SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END)::FLOAT < .20 ) AS new_table
17ORDER BY scroll_count DESC , session_id