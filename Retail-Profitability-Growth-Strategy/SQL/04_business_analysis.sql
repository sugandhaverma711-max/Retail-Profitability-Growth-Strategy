-- ===========================================
-- QUERY 1
-- BUSINESS QUESTION 1
-- Total Revenue
-- ===========================================

SELECT
    SUM(sales) AS total_revenue
FROM orders;


-- ===========================================
-- QUERY 2
-- BUSINESS QUESTION 2
-- Total Profit
-- ===========================================

SELECT
    SUM(profit) AS total_profit
FROM orders;


-- ===========================================
-- QUERY 3
-- BUSINESS QUESTION 3
-- Average Sales
-- ===========================================

SELECT
    ROUND(AVG(sales),2) AS average_sales
FROM orders;


-- ===========================================
-- QUERY 4
-- BUSINESS QUESTION 4
-- Sales by Category
-- ===========================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY category
ORDER BY total_sales DESC;


-- ===========================================
-- QUERY 5
-- BUSINESS QUESTION 5
-- Profit by Category
-- ===========================================

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;


-- ===========================================
-- QUERY 6
-- BUSINESS QUESTION 6
-- Sales by Region
-- ===========================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- ===========================================
-- QUERY 7
-- BUSINESS QUESTION 7
-- Profit by Region
-- ===========================================

SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;


-- ===========================================
-- QUERY 8
-- BUSINESS QUESTION 8
-- Average Sales by Category
-- ===========================================

SELECT
    category,
    ROUND(AVG(sales),2) AS average_sales
FROM orders
GROUP BY category
ORDER BY average_sales DESC;


-- ===========================================
-- QUERY 9
-- BUSINESS QUESTION 9
-- Orders by Region
-- ===========================================

SELECT
    region,
    COUNT(*) AS total_orders
FROM orders
GROUP BY region
ORDER BY total_orders DESC;


-- ===========================================
-- QUERY 10
-- BUSINESS QUESTION 10
-- Top 10 Customers by Sales
-- ===========================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- ===========================================
-- QUERY 11
-- BUSINESS QUESTION 11
-- Bottom 10 Products by Profit
-- ===========================================

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


-- ===========================================
-- QUERY 12
-- BUSINESS QUESTION 12
-- Categories with Sales Greater Than 700000
-- ===========================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY category
HAVING SUM(sales) > 700000;


-- ===========================================
-- QUERY 13
-- BUSINESS QUESTION 13
-- Monthly Sales Trend
-- ===========================================

SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;


-- ===========================================
-- QUERY 14
-- BUSINESS QUESTION 14
-- Monthly Profit Trend
-- ===========================================

SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY month
ORDER BY month;


-- ===========================================
-- QUERY 15
-- BUSINESS QUESTION 15
-- Sales by Customer Segment
-- ===========================================

SELECT
    segment,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY segment
ORDER BY total_sales DESC;