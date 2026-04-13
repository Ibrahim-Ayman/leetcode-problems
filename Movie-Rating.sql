1(SELECT u.name AS results      
2FROM MovieRating mov_rate
3INNER JOIN Users u
4ON mov_rate.user_id = u.user_id
5GROUP BY u.name 
6ORDER BY COUNT(*) DESC, u.name
7LIMIT 1)
8
9UNION ALL
10
11(SELECT m.title  AS results      
12FROM MovieRating mov_rate
13INNER JOIN Movies m
14ON mov_rate.movie_id = m.movie_id
15WHERE DATE_PART('MONTH' , created_at) = 2 AND DATE_PART('YEAR' , created_at) = 2020 
16GROUP BY m.title
17ORDER BY AVG(rating) DESC , m.title
18LIMIT 1
19)
20