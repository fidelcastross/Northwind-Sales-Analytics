
-- Project: Northwind SQL Business Analysis
-- Business Question: How does revenue change month by month?
-- SQL Concepts: JOIN, SUM, GROUP BY, DATE_TRUNC, ORDER BY

SELECT
    DATE_TRUNC('month', o.orderdate)::DATE AS sales_month,
    ROUND(
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        )::NUMERIC,
        2) AS monthly_revenue
FROM orders AS o
JOIN order_details AS od
    ON o.orderid = od.orderid
GROUP BY DATE_TRUNC('month', o.orderdate)
ORDER BY sales_month;
