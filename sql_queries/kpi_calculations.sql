-- KPI CALCULATIONS

-- 1. Total Revenue
SELECT 
    SUM(total_amount) AS total_revenue
FROM ecommerce_clean;

-- 2. Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_clean;

-- 3. Total Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM ecommerce_clean;

-- 4. Total Quantity Sold
SELECT 
    SUM(quantity) AS total_quantity
FROM ecommerce_clean;

-- 5. Total Products (Distinct)
SELECT 
    COUNT(DISTINCT product_name) AS total_products
FROM ecommerce_clean;

-- 6. Repeat Customers
SELECT 
    COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM ecommerce_clean
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS sub;

-- 7. Order Success Rate
SELECT 
    (SUM(CASE WHEN LOWER(order_status) = 'delivered' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*) AS order_success_rate
FROM ecommerce_clean;