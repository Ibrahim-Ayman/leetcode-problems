1(SELECT Users.name AS results
2FROM MovieRating mv 
3INNER JOIN Users 
4ON mv.user_id = Users.user_id 
5GROUP BY name
6ORDER BY COUNT(*) DESC, name
7LIMIT 1)
8
9UNION ALL
10
11(SELECT Movies.title AS results
12FROM MovieRating mv 
13INNER JOIN Movies  
14ON mv.movie_id = Movies.movie_id   
15WHERE DATE_PART('MONTH' , created_at) = 2 AND DATE_PART('YEAR' , created_at) = 2020
16GROUP BY title
17ORDER BY AVG(mv.rating) DESC, MIN(title)
18LIMIT 1
19)