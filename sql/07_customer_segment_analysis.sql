-- Query 07: Customer segment analysis
-- Question: Which customer segment (Consumer, Corporate, Home Office) is most valuable?

SELECT Segment,
       COUNT(DISTINCT Customer_ID)      AS unique_customers,
       COUNT(DISTINCT Order_ID)         AS total_orders,
       ROUND(SUM(Sales), 2)             AS total_sales,
       ROUND(SUM(Profit), 2)            AS total_profit,
       ROUND(AVG(Profit/Sales)*100, 1)  AS avg_margin_pct,
       ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS sales_per_customer,
       ROUND(SUM(Profit) / COUNT(DISTINCT Customer_ID), 2) AS profit_per_customer
FROM orders
GROUP BY Segment
ORDER BY total_profit DESC;
