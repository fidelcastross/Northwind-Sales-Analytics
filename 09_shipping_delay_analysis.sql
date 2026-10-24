
-- Project: Northwind SQL Business Analysis
-- File: 09_shipping_delay_analysis.sql
-- Business Questions:
-- 1. How long does each order take to ship?
-- 2. How many orders are shipped within 7 days, delayed, or not shipped?
-- SQL Concepts: CASE WHEN, date subtraction, COUNT,
-- GROUP BY, window functions, percentage calculations

-- Query 1: Analyze shipping status for each order

SELECT
    orderid,
    customerid,
    orderdate,
    shippeddate,
    CASE
        WHEN shippeddate IS NULL THEN NULL
        ELSE shippeddate - orderdate
    END AS days_to_ship,
    CASE
        WHEN shippeddate IS NULL THEN 'Not Shipped'
        WHEN shippeddate - orderdate > 7 THEN 'Delayed'
        ELSE 'Shipped Within 7 Days'
    END AS shipping_status
FROM orders
ORDER BY days_to_ship DESC NULLS FIRST;


-- Query 2: Summarize shipping performance

SELECT
    CASE
        WHEN shippeddate IS NULL THEN 'Not Shipped'
        WHEN shippeddate - orderdate > 7 THEN 'Delayed'
        ELSE 'Shipped Within 7 Days'
    END AS shipping_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_orders
FROM orders
GROUP BY
    CASE
        WHEN shippeddate IS NULL THEN 'Not Shipped'
        WHEN shippeddate - orderdate > 7 THEN 'Delayed'
        ELSE 'Shipped Within 7 Days'
    END
ORDER BY total_orders DESC;
