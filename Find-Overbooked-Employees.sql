1-- Write your PostgreSQL query statement below
2SELECT  newtable.employee_id , employee_name , department ,
3        COUNT(*) AS meeting_heavy_weeks 
4FROM (
5    SELECT  employee_id ,
6            DATE_PART('WEEK' , meeting_date) AS week_num ,
7            SUM(duration_hours)
8    FROM meetings meet
9 
10    GROUP BY employee_id , DATE_PART('WEEK' , meeting_date)
11    HAVING SUM(duration_hours) > 20
12) as newtable 
13    INNER JOIN employees emp 
14    ON emp.employee_id = newtable.employee_id
15GROUP BY newtable.employee_id , employee_name , department
16HAVING COUNT(*) >= 2
17ORDER BY meeting_heavy_weeks DESC , employee_name
18