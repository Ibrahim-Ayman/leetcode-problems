-- Write your PostgreSQL query statement below
WITH react_count 
AS (
SELECT user_id , reaction , COUNT(reaction) AS count_reactions
    , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY COUNT(reaction) DESC) AS rn
FROM reactions 
GROUP BY user_id , reaction
ORDER BY user_id 
)
, users_min5 AS ( 
SELECT user_id , COUNT(*) AS number_reactions
FROM reactions 
GROUP BY user_id
HAVING COUNT(user_id) >= 5
)

SELECT * FROM (
SELECT rc.user_id , rc.reaction AS dominant_reaction 
        , ROUND(rc.count_reactions::NUMERIC / um.number_reactions::NUMERIC , 2) AS reaction_ratio 
FROM react_count rc
INNER JOIN users_min5 um
ON rc.user_id = um.user_id
WHERE rc.rn = 1) RATIOABOVE
WHERE reaction_ratio  > .6
ORDER BY reaction_ratio  DESC , user_id