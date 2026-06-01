-- Query 02: Regional performance
-- Question: Which region is most profitable and why?

SELECT Region,
       ROUND(SUM(Sales), 2)               AS total_sales,
       ROUND(SUM(Profit), 2)              AS total_profit,
       ROUND(AVG(Profit / Sales)*100, 1)  AS avg_margin_pct,
       COUNT(DISTINCT Customer_ID)        AS unique_customers,
       COUNT(DISTINCT Order_ID)           AS total_orders
FROM orders
GROUP BY Region
ORDER BY total_profit DESC;
