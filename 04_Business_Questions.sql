-- Business Question 1: Total customers

SELECT COUNT(*) AS total_customers
FROM customers;

-- Business Question 2: Total orders

SELECT COUNT(*) AS total_orders
FROM orders;

-- Business Question 3: Total products

SELECT COUNT(*) AS total_products
FROM products;

-- Business Question 4: Total sellers

SELECT COUNT(*) AS total_sellers
FROM sellers;

-- Business Question 5: Order statuses

SELECT DISTINCT order_status
FROM orders;

-- Business Question 6: Orders by status

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Business Question 7: Payment methods

SELECT
    payment_type,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_type
ORDER BY total_payments DESC;

-- Business Question 8: Customers by state

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- Business Question 9: Sellers by state

SELECT
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- Business Question 10: Top product categories

SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC
LIMIT 10;
