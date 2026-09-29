SELECT id , movie , description , rating
FROM Cinema c
WHERE description != 'boring' AND id % 2 = 1
ORDER BY rating DESC