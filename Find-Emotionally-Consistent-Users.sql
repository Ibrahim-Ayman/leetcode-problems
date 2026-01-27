1WITH most_reaction_count
2AS(
3SELECT  distinct on (user_id) user_id ,
4        reaction AS dominant_reaction , 
5        reaction_count AS count_dominant_reaction 
6FROM(
7    SELECT COUNT(*) AS reaction_count  , user_id , reaction
8    FROM reactions
9    GROUP BY user_id , reaction
10) AS newtable1
11ORDER BY user_id , count_dominant_reaction DESC
12),
13reaction_num
14AS(
15    SELECT COUNT(*) AS number_reactions , user_id 
16    FROM reactions 
17    GROUP BY user_id 
18    HAVING COUNT(*) >= 5
19)
20
21SELECT  most_reaction_count.user_id , 
22        dominant_reaction ,
23        ROUND(count_dominant_reaction::numeric / number_reactions::numeric , 2) AS reaction_ratio 
24FROM most_reaction_count
25INNER JOIN reaction_num
26ON reaction_num.user_id = most_reaction_count.user_id
27WHERE  count_dominant_reaction::numeric / number_reactions::numeric >= .6 
28ORDER BY reaction_ratio DESC , user_id