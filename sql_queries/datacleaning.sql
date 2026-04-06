-- DATA CLEANING SCRIPT
--  Clean product names
UPDATE sales
SET product_name = LOWER(TRIM(product_name));

-- Create CLEANED table with fixed categories
CREATE TABLE ecommerce_clean AS
SELECT 
    order_id,
    order_date,
    customer_id,
    customer_name,
    product_id,
    product_name,
    CASE
    WHEN product_name IN (
    'drone mini','microphone','power bank 20000mah','webcam full hd',
    'wireless earbuds','car charger','projector mini','graphic tablet',
    'smartwatch','smartphone case','4k monitor','phone tripod',
    'gaming mouse','memory card 128gb','portable ssd 1tb',
    'noise cancelling headphones','laptop sleeve','router',
    'usb-c charger','mechanical keyboard','wireless charger',
    'hdmi cable 2m','action camera','external hdd 2tb','bluetooth speaker'
    ) THEN 'Electronics'
    WHEN product_name IN (
    't-shirt','dress shirt','jeans','winter jacket','sunglasses'
    ) THEN 'Clothing'
    WHEN product_name IN (
    'cookware set','vacuum cleaner','desk plant','smart light bulb',
    'led desk lamp','instant pot','air fryer','electric kettle',
    'desk organizer','office chair'
    ) THEN 'Home & Kitchen'
    WHEN product_name IN (
    'kids toy car','puzzle 1000pc','board game'
    ) THEN 'Toys & Games'
    WHEN product_name IN (
    'running shoes','backpack','water bottle','fitness band','yoga mat'
    ) THEN 'Sports & Outdoors'
    WHEN product_name IN (
    'novel bestseller','children''s book'
    ) THEN 'Books'
    ELSE 'Unknown'
    END AS category,
    brand,
    quantity,
    unit_price,
    discount,
    tax,
    shipping_cost,
    total_amount,
    payment_method,
    order_status,
    country,
    seller_id
FROM sales;
Select * from ecommerce_clean;

-- Handle NULL or blank categories
UPDATE ecommerce_clean
SET category = 'Unknown'
WHERE category IS NULL OR TRIM(category) = '';

-- Remove invalid values
DELETE FROM ecommerce_clean
WHERE quantity <= 0
   OR unit_price < 0
   OR total_amount < 0;