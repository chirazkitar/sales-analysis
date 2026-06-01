-- Query 03: Monthly sales trend
SELECT strftime('%Y-%m', Order_Date) AS month,
       ROUND(SUM(Sales), 2)          AS monthly_sales,
       ROUND(SUM(Profit), 2)         AS monthly_profit,
       COUNT(DISTINCT Order_ID)      AS orders
FROM orders
GROUP BY month
ORDER BY month;
