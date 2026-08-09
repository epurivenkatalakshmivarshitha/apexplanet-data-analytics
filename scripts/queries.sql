-- 1. Top 5 products by sales
SELECT "Product Name", SUM("Sales") AS total_sales
FROM orders GROUP BY "Product Name"
ORDER BY total_sales DESC LIMIT 5;

-- 2. Monthly sales trend
SELECT strftime('%Y-%m', "Order Date") AS month, SUM("Sales") AS total_sales
FROM orders GROUP BY month ORDER BY month;

-- 3. Sales by region
SELECT "Region", SUM("Sales") AS total_sales
FROM orders GROUP BY "Region" ORDER BY total_sales DESC;

-- 4. Top 10 customers by spend
SELECT "Customer Name", SUM("Sales") AS total_spend
FROM orders GROUP BY "Customer Name"
ORDER BY total_spend DESC LIMIT 10;

-- 5. Sales by category and sub-category
SELECT "Category", "Sub-Category", SUM("Sales") AS total_sales
FROM orders GROUP BY "Category", "Sub-Category"
ORDER BY total_sales DESC;

-- 6. Average order value by segment
SELECT "Segment", AVG("Sales") AS avg_order_value, COUNT(*) AS num_orders
FROM orders GROUP BY "Segment";

-- 7. Top 5 states by sales
SELECT "State", SUM("Sales") AS total_sales
FROM orders GROUP BY "State"
ORDER BY total_sales DESC LIMIT 5;

-- 8. Customer segmentation by spend tier
WITH customer_spend AS (
    SELECT "Customer Name", SUM("Sales") AS total_spend
    FROM orders GROUP BY "Customer Name"
)
SELECT
    CASE
        WHEN total_spend >= 5000 THEN 'High'
        WHEN total_spend >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS spend_tier,
    COUNT(*) AS num_customers,
    SUM(total_spend) AS tier_total
FROM customer_spend
GROUP BY spend_tier;

-- 9. Ship mode preference and sales
SELECT "Ship Mode", COUNT(*) AS num_orders, SUM("Sales") AS total_sales
FROM orders GROUP BY "Ship Mode"
ORDER BY total_sales DESC;

-- 10. Year-over-year sales growth
SELECT strftime('%Y', "Order Date") AS year, SUM("Sales") AS total_sales
FROM orders GROUP BY year ORDER BY year;