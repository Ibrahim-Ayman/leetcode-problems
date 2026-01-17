1WITH first_half
2AS (
3    SELECT driver_id , SUM(distance_km/fuel_consumed) / COUNT(*) AS first_half_avg    
4    FROM trips  
5    WHERE DATE_PART('MONTH' , trip_date) IN (1,2,3,4,5,6)
6    GROUP BY driver_id
7    HAVING SUM(distance_km/fuel_consumed) > 0 
8) , 
9second_half 
10AS (
11    SELECT driver_id , SUM(distance_km/fuel_consumed) / COUNT(*) AS second_half_avg   
12    FROM trips  
13    WHERE DATE_PART('MONTH' , trip_date) IN (7,8,9,10,11,12)
14    GROUP BY driver_id
15    HAVING SUM(distance_km/fuel_consumed) > 0 
16)
17
18SELECT fh.driver_id , driver_name , ROUND(first_half_avg , 2) AS first_half_avg , ROUND(second_half_avg , 2 ) AS second_half_avg , ROUND(second_half_avg - first_half_avg , 2) AS efficiency_improvement 
19FROM first_half fh 
20INNER JOIN second_half sh 
21ON fh.driver_id = sh.driver_id
22INNER JOIN drivers driv
23ON fh.driver_id = driv.driver_id
24WHERE second_half_avg > first_half_avg
25ORDER BY efficiency_improvement DESC , driver_name      