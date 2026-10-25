
-- Project: Northwind SQL Business Analysis
-- File: 13_category_revenue_contribution.sql
-- Business Question: Which categories contribute most to revenue?
-- SQL Concepts: JOIN, GROUP BY, CTE, SUM, ROUND,
-- percentage calculations, ORDER BY

WITH category_revenue AS (
    SELECT
        c.categoryid,
        c.categoryname,
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        ) AS total_revenue
    FROM categories AS c
    JOIN products AS p
        ON c.categoryid = p.categoryid
    JOIN order_details AS od
        ON p.productid = od.productid
    GROUP BY
        c.categoryid,
        c.categoryname
)
SELECT
    categoryname,
    ROUND(total_revenue::NUMERIC, 2) AS total_revenue,
    ROUND(
        100.0 * total_revenue
        / NULLIF(SUM(total_revenue) OVER (), 0),
        2
    ) AS revenue_contribution_pct
FROM category_revenue
ORDER BY total_revenue DESC;
