
-- Project: Northwind SQL Business Analysis
-- Business Question: Which employees handle the highest-revenue orders?
-- SQL Concepts: JOIN, COUNT DISTINCT, SUM, GROUP BY, ORDER BY

SELECT
    e.employeeid,
    e.employeename,
    COUNT(DISTINCT o.orderid) AS total_orders,
    ROUND(
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        )::NUMERIC,
        2
    ) AS total_revenue
FROM employees AS e
JOIN orders AS o
    ON e.employeeid = o.employeeid
JOIN order_details AS od
    ON o.orderid = od.orderid
GROUP BY
    e.employeeid,
    e.employeename
ORDER BY total_revenue DESC;
