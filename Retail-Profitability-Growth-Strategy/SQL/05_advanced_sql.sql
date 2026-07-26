-- ===========================================
-- QUERY 1
-- BUSINESS QUESTION 1
-- Categorize Orders by Profit Status
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales,
    profit,
    CASE
        WHEN profit < 0 THEN 'Loss'
        WHEN profit = 0 THEN 'Break Even'
        ELSE 'Profit'
    END AS profit_status
FROM orders;

-- ===========================================
-- QUERY 2
-- BUSINESS QUESTION 2
-- Categorize Customers by Spending
-- ===========================================

SELECT
    customer_name,
    sales,
    CASE
        WHEN sales >= 1000 THEN 'High Value'
        WHEN sales >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM orders;

-- ===========================================
-- QUERY 3
-- BUSINESS QUESTION 3
-- Categorize Orders by Discount
-- ===========================================

SELECT
    order_id,
    discount,
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_category
FROM orders;

-- ===========================================
-- QUERY 4
-- BUSINESS QUESTION 4
-- Region Performance Classification
-- ===========================================

SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit,
    CASE
        WHEN SUM(profit) > 90000 THEN 'Excellent'
        WHEN SUM(profit) > 50000 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM orders
GROUP BY region
ORDER BY total_profit DESC;

-- ===========================================
-- QUERY 5
-- BUSINESS QUESTION 5
-- Identify Loss Making Products
-- ===========================================

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit,
    CASE
        WHEN SUM(profit) < 0 THEN 'Loss Making'
        ELSE 'Profitable'
    END AS product_status
FROM orders
GROUP BY product_name
ORDER BY total_profit ASC;

-- ===========================================
-- QUERY 6
-- BUSINESS QUESTION 6
-- Number Products by Sales
-- ===========================================

SELECT
    product_name,
    SUM(sales) AS total_sales,
    ROW_NUMBER() OVER(ORDER BY SUM(sales) DESC) AS row_num
FROM orders
GROUP BY product_name;

-- ===========================================
-- QUERY 7
-- BUSINESS QUESTION 7
-- Rank Products by Sales
-- ===========================================

SELECT
    product_name,
    SUM(sales) AS total_sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM orders
GROUP BY product_name;

-- ===========================================
-- QUERY 8
-- BUSINESS QUESTION 8
-- Dense Rank Products by Sales
-- ===========================================

SELECT
    product_name,
    SUM(sales) AS total_sales,
    DENSE_RANK() OVER(ORDER BY SUM(sales) DESC) AS dense_rank
FROM orders
GROUP BY product_name;

-- ===========================================
-- QUERY 9
-- BUSINESS QUESTION 9
-- Top Customer in Each Region
-- ===========================================

SELECT *
FROM
(
    SELECT
        region,
        customer_name,
        SUM(sales) AS total_sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY region
            ORDER BY SUM(sales) DESC
        ) AS rn
    FROM orders
    GROUP BY region, customer_name
) ranked
WHERE rn = 1;

-- ===========================================
-- QUERY 10
-- BUSINESS QUESTION 10
-- Top Product in Each Category
-- ===========================================

SELECT *
FROM
(
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS rn
    FROM orders
    GROUP BY category, product_name
) ranked
WHERE rn = 1;

-- ===========================================
-- QUERY 11
-- BUSINESS QUESTION 11
-- Monthly Sales using CTE
-- ===========================================

WITH monthly_sales AS
(
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY month
)

SELECT *
FROM monthly_sales
ORDER BY month;

-- ===========================================
-- QUERY 12
-- BUSINESS QUESTION 12
-- Customers Above Average Sales
-- ===========================================

WITH customer_sales AS
(
    SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_name
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;

-- ===========================================
-- QUERY 13
-- BUSINESS QUESTION 13
-- Create Regional Sales View
-- ===========================================

CREATE VIEW regional_sales_summary AS

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY region;

-- To view the data

SELECT *
FROM regional_sales_summary;

-- ===========================================
-- QUERY 14
-- BUSINESS QUESTION 14
-- Running Total of Sales
-- ===========================================

SELECT
    order_date,
    sales,
    SUM(sales)
    OVER
    (
        ORDER BY order_date
    ) AS running_total
FROM orders
ORDER BY order_date;

-- ===========================================
-- QUERY 15
-- BUSINESS QUESTION 15
-- 3-Month Moving Average of Sales
-- ===========================================

WITH monthly_sales AS
(
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY month
)

SELECT
    month,
    total_sales,
    ROUND(
        AVG(total_sales)
        OVER
        (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM monthly_sales
ORDER BY month;