1-- Write your PostgreSQL query statement below
2WITH latest_exam 
3AS (
4    SELECT student_id , subject , max(exam_date) as latest_date , min(exam_date) as first_date
5    FROM Scores 
6    GROUP BY student_id , subject 
7    HAVING COUNT(*) > 1)
8, latest_score 
9AS (
10    SELECT s.student_id , s.subject , le.latest_date , s.score AS latest_score
11    FROM Scores s
12    INNER JOIN latest_exam le
13    ON s.student_id = le.student_id AND s.subject = le.subject AND s.exam_date = le.latest_date
14)
15, first_score 
16AS (
17    SELECT s.student_id , s.subject , le.first_date , s.score AS first_score
18    FROM Scores s
19    INNER JOIN latest_exam le
20    ON s.student_id = le.student_id AND s.subject = le.subject AND s.exam_date = le.first_date
21)
22
23SELECT ls.student_id , ls.subject , first_score , latest_score
24FROM latest_score ls
25INNER JOIN first_score fs
26ON ls.student_id = fs.student_id 
27AND ls.subject = fs.subject 
28AND latest_score > first_score
29ORDER BY 1,2