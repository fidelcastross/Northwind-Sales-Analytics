
-- Project: Northwind SQL Business Analysis
-- Business Question: How can customers be segmented by order value and frequency?
-- SQL Concepts: CTE, JOIN, COUNT, SUM, CASE WHEN, GROUP BY

WITH customer_summary AS (
    SELECT
        c.customerid,
        c.companyname,
        COUNT(DISTINCT o.orderid) AS total_orders,
        ROUND(
            SUM(
                od.unitprice * od.quantity * (1 - od.discount)
            )::NUMERIC,
            2
        ) AS total_revenue
    FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN order_details AS od
        ON o.orderid = od.orderid
    GROUP BY
        c.customerid,
        c.companyname
)
SELECT
    customerid,
    companyname,
    total_orders,
    total_revenue,
    CASE
        WHEN total_revenue >= 50000
             AND total_orders >= 15
            THEN 'High Value'
        WHEN total_orders >= 10
            THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_segment
FROM customer_summary
ORDER BY total_revenue DESC;
