1-- Write your PostgreSQL query statement below
2WITH top_performing_std
3AS (
4    SELECT user_id 
5    FROM course_completions 
6    GROUP BY user_id 
7    HAVING COUNT(user_id) >=5 AND AVG(course_rating) >=4 
8),
9courses_seq 
10AS (
11    SELECT  course_name first_course , 
12            LEAD(course_name) OVER(PARTITION BY user_id ORDER BY completion_date) second_course
13    FROM course_completions 
14    WHERE user_id IN (SELECT user_id from top_performing_std)  
15)
16SELECT * , COUNT(*) AS transition_count 
17FROM courses_seq
18WHERE second_course IS NOT NULL
19GROUP BY first_course , second_course
20ORDER BY transition_count DESC,
21         lower(trim(first_course)) ASC,
22         lower(trim(second_course)) ASC;