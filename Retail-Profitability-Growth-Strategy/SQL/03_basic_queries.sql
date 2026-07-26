-- ===========================================
-- QUERY 1
-- View All Orders
-- ===========================================

SELECT *
FROM orders;
-- ===========================================
-- QUERY 2
-- Display Selected Columns
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales
FROM orders;
-- ===========================================
-- QUERY 3
-- Unique Categories
-- ===========================================

SELECT DISTINCT category
FROM orders;
-- ===========================================
-- QUERY 4
-- Total Orders
-- ===========================================

SELECT COUNT(*) AS total_orders
FROM orders;
-- ===========================================
-- QUERY 5
-- Highest Sales
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales
FROM orders
ORDER BY sales DESC;
-- ===========================================
-- QUERY 6
-- Top 10 Highest Sales
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales
FROM orders
ORDER BY sales DESC
LIMIT 10;
-- ===========================================
-- QUERY 7
-- Technology Orders
-- ===========================================

SELECT *
FROM orders
WHERE category='Technology';
-- ===========================================
-- QUERY 8
-- Sales Greater Than 1000
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales
FROM orders
WHERE sales>1000;
-- ===========================================
-- QUERY 9
-- Technology Orders Above 1000
-- ===========================================

SELECT
    order_id,
    customer_name,
    sales
FROM orders
WHERE category='Technology'
AND sales>1000;
-- ===========================================
-- QUERY 10
-- Furniture OR Office Supplies
-- ===========================================

SELECT *
FROM orders
WHERE category='Furniture'
OR category='Office Supplies';
-- ===========================================
-- QUERY 11
-- East and West Region
-- ===========================================

SELECT *
FROM orders
WHERE region IN ('East','West');
-- ===========================================
-- QUERY 12
-- Sales Between 500 and 1000
-- ===========================================

SELECT *
FROM orders
WHERE sales BETWEEN 500 AND 1000;
-- ===========================================
-- QUERY 13
-- Customer Names Starting with A
-- ===========================================

SELECT *
FROM orders
WHERE customer_name LIKE 'A%';