# SQL_Project

## Project Overview
This project uses PostgreSQL and the Northwind Traders dataset to analyze sales revenue, product performance, customer behavior, and monthly revenue trends. It demonstrates practical SQL skills through business-focused questions and data analysis.

## Tools and Technologies
- Database: PostgreSQL 18
- SQL Client: pgAdmin 4
- Dataset: Northwind Traders
- Platform: GitHub

## SQL Business Analysis

### 1. Total Sales Revenue

**Business Question:** What is the total sales revenue after discounts?

**SQL Concepts:** `SUM()`, arithmetic calculations, `ROUND()`.

**Finding:** Total calculated sales revenue was 1,265,793.04.

### 2. Top 10 Products by Revenue

**Business Question:** Which products generate the most revenue?

**SQL Concepts:** `JOIN`, `SUM()`, `GROUP BY`, `ORDER BY`, `LIMIT`.

**Key Findings:**
- Côte de Blaye ranked first, generating 141,396.74 in revenue.
- Camembert Pierrot sold 1,577 units, the highest unit count among the top 10 products.
- Product sales volume and revenue rankings differ.

### 3. Monthly Revenue Trends

**Business Question:** How does revenue change over time?

**SQL Concepts:** `JOIN`, `DATE_TRUNC()`, `GROUP BY`, `SUM()`.

**Key Findings:**
- April 2015 had the highest monthly revenue at 123,798.68.
- Revenue generally increased during the observed period.
- May 2015 is an incomplete month because the dataset ends on May 6, 2015.

### 4. Top 10 Customers by Revenue

**Business Question:** Which customers generate the most revenue?

**SQL Concepts:** Multi-table `JOIN`, `COUNT(DISTINCT)`, `SUM()`, `GROUP BY`, `ORDER BY`, `LIMIT`.

**Key Findings:**
- QUICK-Stop ranked first, generating 110,277.31 from 28 orders.
- Save-a-lot Markets placed the most orders among the top 10 customers, with 31 orders.
- Order frequency and total revenue do not always have the same ranking.

### Business Recommendations

- Monitor monthly revenue trends while accounting for incomplete periods.
- Evaluate product revenue alongside units sold and discounts.
- Focus customer-retention efforts on high-revenue accounts.
- Use customer segmentation to prioritize retention and targeted marketing.
- Analyze product costs before drawing conclusions about profitability.

*Note: Revenue is calculated after line-item discounts. The currency is unspecified in the dataset, and revenue is not the same as profit.*

### 5. Customer Segmentation

**Business Question:** How can customers be classified based on their revenue and order frequency?

**SQL Concepts:** CTE (`WITH`), `JOIN`, `COUNT(DISTINCT)`, `SUM()`, `CASE WHEN`, `GROUP BY`.

**Key Findings:**
- Classified customers into High Value, Regular, and Occasional segments using total revenue and order frequency.
- QUICK-Stop was the highest-revenue customer, generating 110,277.31 across 28 orders.
- Used a Common Table Expression (CTE) to calculate customer metrics and `CASE WHEN` to apply segmentation rules.

**Business Application:** Customer segmentation can help businesses prioritize customer retention, identify valuable accounts, and plan targeted marketing campaigns.

*Note: The segmentation thresholds are illustrative business rules created for this analysis.*


### 6. Order Shipping Delay Analysis

**Business Question:** How efficiently are customer orders being shipped?

**SQL Concepts:** `CASE WHEN`, date subtraction, `COUNT()`, `GROUP BY`, window functions, and percentage calculations.

**Key Findings:**
- 473 orders (56.99%) were shipped within 7 days.
- 336 orders (40.48%) took more than 7 days to ship.
- 21 orders (2.53%) had no recorded shipping date.
- A significant proportion of orders exceeded the illustrative 7-day shipping threshold.

**Business Recommendations:**
- Investigate the reasons for orders taking more than 7 days to ship.
- Review orders with missing shipping dates to determine whether they remain unshipped or have incomplete records.
- Monitor shipping performance over time to identify potential operational improvements.

*Note: The 7-day threshold is used for analytical purposes and is not a confirmed service-level agreement. Shipping time measures the period between order placement and shipment, not customer delivery time.*

### 7. Monthly Shipping Performance Analysis

**Business Question:** How does shipping performance vary by month?

**SQL Concepts:** `DATE_TRUNC()`, `CASE WHEN`, conditional aggregation, `COUNT()`, `FILTER`, `GROUP BY`, `ROUND()`, and window/aggregate calculations.

**Key Findings:**
- October 2013 had the highest within-7-day shipping rate at 73.08%.
- March 2015 had the highest number of delayed orders, with 38.
- December 2014 recorded 25 delayed orders out of 48 total orders.
- April and May 2015 included orders without recorded shipping dates, which affects comparisons.

**Business Recommendations:**
- Investigate the causes of monthly increases in delayed shipments.
- Monitor missing shipping dates and validate shipment records.
- Compare complete months and account for differences in order volume before drawing conclusions.

*Note: A delay is defined as more than 7 days between order date and shipping date. The threshold is illustrative, and May 2015 is an incomplete month in the dataset.*

### 8. Order Value Analysis

**Business Question:** What is the value of individual orders, and what is the average order value?

**SQL Concepts:** `JOIN`, `SUM()`, `COUNT()`, `AVG()`, `MAX()`, `MIN()`, `GROUP BY`, Common Table Expressions (CTEs), and `ORDER BY`.

**Key Findings:**
- Analyzed 830 orders.
- Average order value was 1,525.05 after line-item discounts.
- The highest order value was 16,387.50.
- The lowest order value was 12.50.
- Order values varied substantially across the dataset.

**Business Recommendations:**
- Identify high-value orders and investigate which products and customers contribute to them.
- Compare order values across customers to identify opportunities for customer retention and cross-selling.
- Evaluate order value alongside product costs before making profitability decisions.

*Note: Revenue is calculated after line-item discounts. Freight charges and product costs are excluded, and the dataset's currency is unspecified.*

