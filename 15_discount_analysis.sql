
-- 15_discount_analysis.sql
-- Business Question: How do discounts relate to revenue and sales volume?

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.05 THEN '0% - 5%'
        WHEN discount <= 0.10 THEN '5% - 10%'
        WHEN discount <= 0.15 THEN '10% - 15%'
        ELSE 'Above 15%'
    END AS discount_category,

    COUNT(*) AS order_detail_lines,
    SUM(quantity) AS total_units_sold,

    ROUND(
        SUM(unitprice * quantity)::NUMERIC,
        2
    ) AS gross_sales_before_discount,

    ROUND(
        SUM(unitprice * quantity * discount)::NUMERIC,
        2
    ) AS total_discount_value,

    ROUND(
        SUM(unitprice * quantity * (1 - discount))::NUMERIC,
        2
    ) AS net_revenue

FROM order_details

GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.05 THEN '0% - 5%'
        WHEN discount <= 0.10 THEN '5% - 10%'
        WHEN discount <= 0.15 THEN '10% - 15%'
        ELSE 'Above 15%'
    END

ORDER BY
    MIN(discount);
