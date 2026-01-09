1-- Write your PostgreSQL query statement below
2WITH patient_pos
3AS 
4(
5    SELECT patient_id , MIN(test_date) as min_pos_date
6    FROM covid_tests 
7    WHERE result = 'Positive'
8    GROUP BY patient_id 
9) , 
10patient_neg 
11AS 
12(
13    SELECT ct.patient_id , MIN(test_date) as max_neg_date
14    FROM covid_tests ct
15    INNER JOIN patient_pos pp
16    ON ct.patient_id = pp.patient_id AND ct.test_date > pp.min_pos_date
17    WHERE result = 'Negative'
18    GROUP BY ct.patient_id
19)
20
21SELECT pp.patient_id , pat.patient_name , pat.age , max_neg_date - min_pos_date AS recovery_time 
22FROM patient_pos pp 
23INNER JOIN patient_neg pn
24ON pp.patient_id = pn.patient_id 
25INNER JOIN patients pat
26ON pat.patient_id = pp.patient_id 
27WHERE  max_neg_date - min_pos_date  > 0
28ORDER BY recovery_time , patient_name 
29
30
31