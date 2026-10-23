
-- Project: Northwind SQL Business Analysis
-- Business Question: Which shipping companies handle the most orders?
-- SQL Concepts: LEFT JOIN, COUNT, SUM, AVG, GROUP BY, ORDER BY

SELECT
    s.shipperid,
    s.companyname AS shipper_name,
    COUNT(o.orderid) AS total_orders,
    ROUND(COALESCE(SUM(o.freight), 0)::NUMERIC, 2) AS total_freight,
    ROUND(AVG(o.freight)::NUMERIC, 2) AS average_freight
FROM shippers AS s
LEFT JOIN orders AS o
    ON s.shipperid = o.shipperid
GROUP BY
    s.shipperid,
    s.companyname
ORDER BY total_orders DESC;
