1-- Write your PostgreSQL query statement below
2WITH book_null_return_count 
3AS (
4SELECT lb.book_id , COUNT(*) AS null_count
5FROM library_books lb
6INNER JOIN borrowing_records br
7ON lb.book_id = br.book_id 
8WHERE return_date IS NULL 
9GROUP BY lb.book_id
10)
11
12SELECT lb.book_id , title , author , genre ,  publication_year , total_copies AS current_borrowers 
13FROM library_books lb
14INNER JOIN book_null_return_count rc
15ON lb.book_id = rc.book_id
16WHERE null_count = total_copies 
17ORDER BY current_borrowers DESC , title