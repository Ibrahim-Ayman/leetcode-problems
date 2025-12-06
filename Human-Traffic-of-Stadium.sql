1SELECT *
2FROM Stadium 
3WHERE id in (
4SELECT s1.id
5FROM Stadium s1 
6INNER JOIN Stadium s2 
7ON s1.id = s2.id - 1 AND s1.people > 99 AND s2.people > 99
8INNER JOIN Stadium s3 
9ON s1.id = s3.id - 2 AND s1.people > 99 AND s3.people > 99)
10OR id IN (
11    SELECT s2.id
12FROM Stadium s1 
13INNER JOIN Stadium s2 
14ON s1.id = s2.id - 1 AND s1.people > 99 AND s2.people > 99
15INNER JOIN Stadium s3 
16ON s1.id = s3.id - 2 AND s1.people > 99 AND s3.people > 99)
17
18OR id IN (
19    SELECT s3.id
20FROM Stadium s1 
21INNER JOIN Stadium s2 
22ON s1.id = s2.id - 1 AND s1.people > 99 AND s2.people > 99
23INNER JOIN Stadium s3 
24ON s1.id = s3.id - 2 AND s1.people > 99 AND s3.people > 99)
25