-- Query 01: Top profitable sub-categories
-- Question: Which sub-categories should we focus on to maximize profit?

SELECT Sub_Category,
       ROUND(SUM(Profit), 2)           AS total_profit,
       ROUND(AVG(Profit / Sales)*100, 1) AS avg_margin_pct,
       COUNT(*)                         AS order_count,
       ROUND(SUM(Sales), 2)             AS total_sales
FROM orders
GROUP BY Sub_Category
ORDER BY total_profit DESC
LIMIT 10;
