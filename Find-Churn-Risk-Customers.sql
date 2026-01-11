1-- Write your PostgreSQL query statement below
2WITH last_event 
3AS (
4    SELECT user_id , monthly_amount  , event_type , event_date  , plan_name ,
5            CASE WHEN event_type = 'downgrade' THEN 1
6            ELSE 0 
7            END AS is_downgrade , 
8            ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_date DESC , event_id  DESC) as rn 
9    FROM subscription_events 
10) , 
11max_amount
12AS (
13    SELECT user_id , MAX(monthly_amount) as max_amount_pur
14    FROM last_event
15    GROUP BY user_id
16) , 
17not_cancel_andmore50
18AS (
19    SELECT le.user_id ,  monthly_amount / max_amount_pur ,
20    max_amount_pur AS max_historical_amount , 
21    monthly_amount AS current_monthly_amount , 
22    plan_name AS current_plan 
23    FROM last_event le
24    INNER JOIN max_amount ma
25    ON le.user_id = ma.user_id 
26    WHERE rn = 1 AND event_type != 'cancel' AND monthly_amount / max_amount_pur < .50
27) , 
28is_downGrade 
29AS (
30SELECT user_id , MAX(event_date) - MIN(event_date) AS days_as_subscriber 
31FROM last_event
32GROUP BY user_id 
33HAVING SUM(is_downgrade) >= 1 AND MAX(event_date) - MIN(event_date) >= 60
34)
35
36SELECT not_can.user_id , current_plan , current_monthly_amount ,  
37       max_historical_amount  , days_as_subscriber
38FROM not_cancel_andmore50 not_can
39INNER JOIN is_downGrade
40ON not_can.user_id = is_downGrade.user_id
41ORDER BY days_as_subscriber DESC , user_id 
42
43