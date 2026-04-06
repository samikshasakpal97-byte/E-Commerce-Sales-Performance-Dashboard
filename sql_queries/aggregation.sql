-- AGGREGATE FUNCTIONS
-- 1. Total Revenue
SELECT 
    SUM(total_amount) AS total_revenue
FROM ecommerce_clean;

-- 2. Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_clean;

-- 3. Total Quantity Sold
SELECT 
    SUM(quantity) AS total_quantity
FROM ecommerce_clean;

-- 4. Category-wise Revenue
SELECT 
    category,
    SUM(total_amount) AS category_revenue
FROM ecommerce_clean
GROUP BY category
ORDER BY category_revenue DESC;

-- 5. Product-wise Revenue
SELECT 
    product_name,
    SUM(total_amount) AS product_revenue
FROM ecommerce_clean
GROUP BY product_name
ORDER BY product_revenue DESC;

-- 6. Top 10 Products
SELECT 
    product_name,
    SUM(total_amount) AS revenue
FROM ecommerce_clean
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- 7. Brand-wise Revenue
SELECT 
    brand,
    SUM(total_amount) AS brand_revenue
FROM ecommerce_clean
GROUP BY brand
ORDER BY brand_revenue DESC;

-- 8. Payment Method Distribution
SELECT 
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_clean
GROUP BY payment_method
ORDER BY total_orders DESC;

-- 9. Order Status Distribution
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce_clean
GROUP BY order_status
ORDER BY total_orders DESC;

-- 10. Country-wise Revenue
SELECT 
    country,
    SUM(total_amount) AS revenue
FROM ecommerce_clean
GROUP BY country
ORDER BY revenue DESC;