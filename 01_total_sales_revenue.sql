
-- Project: Northwind SQL Business Analysis
-- Business Question: What is the total sales revenue after discounts?
-- Database: PostgreSQL

SELECT
    ROUND(
        SUM(unitprice * quantity * (1 - discount))::NUMERIC,
        2
    ) AS total_sales_revenue
FROM order_details;
