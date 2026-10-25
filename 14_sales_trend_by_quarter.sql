
-- Query 14: Quarterly Sales Trend Analysis
-- Business Question: How does revenue change from quarter to quarter?

WITH quarterly_revenue AS (
    SELECT
        EXTRACT(YEAR FROM o.orderdate) AS sales_year,
        EXTRACT(QUARTER FROM o.orderdate) AS sales_quarter,
        SUM(
            od.unitprice * od.quantity * (1 - od.discount)
        ) AS total_revenue
    FROM orders AS o
    JOIN order_details AS od
        ON o.orderid = od.orderid
    GROUP BY
        EXTRACT(YEAR FROM o.orderdate),
        EXTRACT(QUARTER FROM o.orderdate)
)
SELECT
    sales_year,
    sales_quarter,
    ROUND(total_revenue::NUMERIC, 2) AS total_revenue,
    ROUND(
        (
            total_revenue - LAG(total_revenue) OVER (
                ORDER BY sales_year, sales_quarter
            )
        ) * 100.0
        / NULLIF(
            LAG(total_revenue) OVER (
                ORDER BY sales_year, sales_quarter
            ),
            0
        ),
        2
    ) AS revenue_growth_pct
FROM quarterly_revenue
ORDER BY sales_year, sales_quarter;
