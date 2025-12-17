1# Write your MySQL query statement below
2SELECT date_id , make_name , COUNT(DISTINCT lead_id) AS unique_leads , COUNT(DISTINCT partner_id) AS unique_partners
3FROM DailySales ds
4GROUP BY date_id , make_name 