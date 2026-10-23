
-- Project: Northwind SQL Business Analysis
-- Business Question: Which customers generate the most revenue?
-- SQL Concepts: JOIN, COUNT DISTINCT, SUM, GROUP BY, ORDER BY, LIMIT

SELECT
    c.customerid,
    c.companyname,
    COUNT(DISTINCT o.orderid) AS total_orders,
    ROUND(
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        )::NUMERIC,
        2) AS total_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customerid = o.customerid
JOIN order_details AS od
    ON o.orderid = od.orderid
GROUP BY
    c.customerid,
    c.companyname
ORDER BY total_revenue DESC
LIMIT 10;
