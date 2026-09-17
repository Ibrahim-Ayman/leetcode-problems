WITH book_polarization
AS (
SELECT book_id  
        , MAX(session_rating) - MIN(session_rating) AS rating_spread 
        , ROUND(
            SUM(CASE 
                WHEN session_rating >= 4 OR session_rating <= 2 
                THEN 1 
                ELSE 0 END)::NUMERIC 
            / COUNT(book_id) 
            , 2) AS polarization_score 
FROM reading_sessions 
GROUP BY book_id
HAVING count(book_id) >= 5 AND MAX(session_rating) >= 4 
        AND MIN(session_rating) <= 2
)

SELECT b.* , bp.rating_spread , bp.polarization_score
FROM book_polarization bp
INNER JOIN books b 
ON bp.book_id = b.book_id
WHERE polarization_score >= .6
ORDER BY polarization_score DESC , b.title DESC
