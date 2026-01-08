1-- Write your PostgreSQL query statement below
2WITH emp_review_num
3AS 
4(
5    SELECT pr.employee_id , review_id , rating ,
6    ROW_NUMBER() OVER(PARTITION BY pr.employee_id ORDER BY review_date DESC) as rn
7    FROM performance_reviews pr
8    WHERE employee_id IN (    
9        SELECT employee_id 
10        FROM performance_reviews
11        GROUP BY employee_id 
12        HAVING COUNT(*) >= 3
13    )
14)
15
16SELECT emp_rev1.employee_id , name , emp_rev3.rating - emp_rev1.rating as improvement_score 
17FROM emp_review_num emp_rev1
18INNER JOIN emp_review_num emp_rev2
19ON emp_rev1.employee_id = emp_rev2.employee_id AND emp_rev2.rn = emp_rev1.rn - 1
20INNER JOIN emp_review_num emp_rev3
21ON emp_rev1.employee_id = emp_rev3.employee_id AND emp_rev3.rn = emp_rev1.rn - 2
22INNER JOIN employees emp 
23ON emp_rev1.employee_id = emp.employee_id
24WHERE emp_rev1.rn = 3 AND emp_rev2.rn = 2 AND emp_rev3.rn = 1 AND  emp_rev1.rating < emp_rev2.rating AND emp_rev2.rating < emp_rev3.rating
25ORDER BY improvement_score DESC , name 