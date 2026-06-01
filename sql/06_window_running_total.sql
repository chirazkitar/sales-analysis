-- Query 06: Running total of sales by region (WINDOW FUNCTION)
-- This demonstrates advanced SQL — include in your portfolio README

SELECT Region,
       strftime('%Y-%m', Order_Date)    AS month,
       ROUND(SUM(Sales), 2)             AS monthly_sales,
       ROUND(SUM(SUM(Sales)) OVER (
           PARTITION BY Region
           ORDER BY strftime('%Y-%m', Order_Date)
       ), 2)                            AS running_total_region
FROM orders
GROUP BY Region, month
ORDER BY Region, month;
