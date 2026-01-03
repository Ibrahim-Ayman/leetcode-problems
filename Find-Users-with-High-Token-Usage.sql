1-- Write your PostgreSQL query statement below
2-- WITH most_token
3-- AS(
4--     SELECT user ,ROW_NUMBER() OVER(PARTITION BY user_id , ORDER BY tokens DESC) as rn
5--     FROM prompts 
6--     WHERE rn = 1
7-- )
8SELECT user_id , COUNT(*) as prompt_count , ROUND(AVG(tokens),2) AS avg_tokens
9FROM prompts 
10GROUP BY user_id 
11HAVING COUNT(*) >= 3 AND MAX(tokens) > AVG(tokens)
12ORDER BY avg_tokens DESC , user_id 
13
14