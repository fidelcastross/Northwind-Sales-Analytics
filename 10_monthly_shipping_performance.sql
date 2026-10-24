
-- Project: Northwind SQL Business Analysis
-- File: 10_monthly_shipping_performance.sql
-- Business Question: How does shipping performance change monthly?
-- SQL Concepts: DATE_TRUNC, CASE WHEN, COUNT, GROUP BY,
-- conditional aggregation, percentage calculations

SELECT
    DATE_TRUNC('month', orderdate)::DATE AS order_month,
    COUNT(*) AS total_orders,

    COUNT(*) FILTER (
        WHERE shippeddate IS NOT NULL
          AND shippeddate - orderdate <= 7
    ) AS shipped_within_7_days,

    COUNT(*) FILTER (
        WHERE shippeddate - orderdate > 7
    ) AS delayed_orders,

    COUNT(*) FILTER (
        WHERE shippeddate IS NULL
    ) AS not_shipped_orders,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE shippeddate IS NOT NULL
              AND shippeddate - orderdate <= 7
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS shipped_within_7_days_pct

FROM orders
GROUP BY DATE_TRUNC('month', orderdate)
ORDER BY order_month;
