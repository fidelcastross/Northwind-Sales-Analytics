
-- Project: Northwind SQL Business Analysis
-- File: 12_customer_purchase_frequency.sql
-- Business Questions:
-- 1. Which customers place the most orders?
-- 2. When did each customer place their first and latest orders?
-- 3. Which customers are one-time, occasional, or frequent purchasers?
-- SQL Concepts: LEFT JOIN, COUNT, MIN, MAX,
-- GROUP BY, CASE WHEN, ORDER BY

SELECT
    c.customerid,
    c.companyname,
    COUNT(o.orderid) AS total_orders,
    MIN(o.orderdate) AS first_order_date,
    MAX(o.orderdate) AS latest_order_date,
    MAX(o.orderdate) - MIN(o.orderdate) AS purchasing_period_days,
    CASE
        WHEN COUNT(o.orderid) = 0 THEN 'No Orders'
        WHEN COUNT(o.orderid) = 1 THEN 'One-Time Customer'
        WHEN COUNT(o.orderid) BETWEEN 2 AND 10 THEN 'Occasional Customer'
        ELSE 'Frequent Customer'
    END AS purchase_frequency_segment
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customerid = o.customerid
GROUP BY
    c.customerid,
    c.companyname
ORDER BY
    total_orders DESC,
    c.companyname;
