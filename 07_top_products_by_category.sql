
-- Project: Northwind SQL Business Analysis
-- Business Question: What are the top 5 products by revenue in each category?
-- SQL Concepts: CTE, JOIN, SUM, GROUP BY, DENSE_RANK, PARTITION BY

WITH product_revenue AS (
    SELECT
        c.categoryid,
        c.categoryname,
        p.productid,
        p.productname,
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
        c.categoryname,
        p.productid,
        p.productname
),
ranked_products AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY categoryid
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM product_revenue
)
SELECT
    categoryname,
    productid,
    productname,
    ROUND(total_revenue::NUMERIC, 2) AS total_revenue,
    revenue_rank
FROM ranked_products
WHERE revenue_rank <= 5
ORDER BY categoryname, revenue_rank;
