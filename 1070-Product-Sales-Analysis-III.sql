WITH duplicate_sales_year
AS (
SELECT product_id , year , quantity , price , DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS DR
FROM Sales)

SELECT product_id , year AS first_year , quantity , price
FROM duplicate_sales_year
WHERE DR = 1
