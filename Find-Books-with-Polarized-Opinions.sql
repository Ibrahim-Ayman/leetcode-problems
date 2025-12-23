1-- Write your PostgreSQL query statement below
2WITH low_high_ratings
3AS ( 
4SELECT book_id , session_rating , CASE WHEN session_rating >= 4 THEN 1 
5                ELSE 0 END AS aboveEqu4 ,
6                CASE WHEN session_rating <= 2 THEN 1 
7                ELSE 0 END AS belowEqu2 
8FROM reading_sessions )
9, sum_rating_book AS (
10SELECT book_id , SUM(aboveEqu4) AS above_4, SUM(belowEqu2) AS below_2 , 
11                ROUND(
12                (
13                    (SUM(aboveEqu4) + SUM(belowEqu2))::numeric
14                    / COUNT(*)::numeric
15                ),
16                2
17                ) AS polarization_score , 
18                MAX(session_rating) - MIN(session_rating) AS rating_spread
19FROM low_high_ratings
20GROUP BY book_id 
21HAVING COUNT(*) >= 5)
22
23SELECT b.book_id , title , author , genre , pages , rating_spread , polarization_score
24FROM sum_rating_book srb
25INNER JOIN books b 
26ON srb.book_id = b.book_id
27WHERE polarization_score >= .6 AND below_2 >= 1 AND above_4 >= 1
28ORDER BY polarization_score DESC , title DESC