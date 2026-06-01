-- Query 05: Loss-making products (total profit < -500)
-- Question: Which specific products are destroying profit?

SELECT Product_Name,
       Sub_Category,
       ROUND(SUM(Profit), 2)  AS total_profit,
       ROUND(SUM(Sales), 2)   AS total_sales,
       COUNT(*)               AS times_ordered
FROM orders
GROUP BY Product_Name, Sub_Category
HAVING total_profit < -500
ORDER BY total_profit ASC
LIMIT 10;
