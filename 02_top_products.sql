
-- Project: Northwind SQL Business Analysis
-- Business Question: Which products generate the most revenue?
-- SQL Concepts: JOIN, SUM, GROUP BY, ORDER BY, LIMIT

SELECT
    p.productid,
    p.productname,
    ROUND(
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        )::NUMERIC,
        2) AS total_revenue,
    SUM(od.quantity) AS units_sold
FROM order_details AS od
JOIN products AS p
    ON od.productid = p.productid
GROUP BY
    p.productid,
    p.productname
ORDER BY total_revenue DESC
LIMIT 10;
