WITH user_start_free 
AS (
    SELECT user_id , MIN(activity_date) 
        , ROUND(AVG(activity_duration) , 2) trial_avg_duration  
    FROM UserActivity ua
    WHERE activity_type = 'free_trial'
    GROUP BY user_id 
) , user_start_paid
AS (
    SELECT user_id , MIN(activity_date)
        , ROUND(AVG(activity_duration) , 2) paid_avg_duration 
    FROM UserActivity ua
    WHERE activity_type = 'paid'
    GROUP BY user_id 
)

SELECT usf.user_id , trial_avg_duration  , paid_avg_duration 
FROM user_start_free usf
INNER JOIN user_start_paid usp
ON usf.user_id = usp.user_id 
