-- Query 04: Discount impact on profit margin
-- Key insight: shows exactly where discounts start hurting profitability

SELECT
  CASE
    WHEN Discount = 0    THEN '0% - no discount'
    WHEN Discount <= 0.1 THEN '1-10%'
    WHEN Discount <= 0.2 THEN '11-20%'
    WHEN Discount <= 0.3 THEN '21-30%'
    ELSE '> 30%'
  END AS discount_bucket,
  COUNT(*)                          AS order_count,
  ROUND(AVG(Profit/Sales)*100, 1)   AS avg_margin_pct,
  ROUND(SUM(Profit), 2)             AS total_profit
FROM orders
GROUP BY discount_bucket
ORDER BY avg_margin_pct DESC;
