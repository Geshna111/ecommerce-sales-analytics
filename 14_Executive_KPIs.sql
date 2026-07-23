-- Business Question 91: Total Revenue

SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM order_items;

-- Business Question 92: Total Orders

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Business Question 93: Total Customers

SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;

-- Business Question 94: Total Sellers

SELECT
    COUNT(DISTINCT seller_id) AS total_sellers
FROM sellers;

-- Business Question 95: Average Order Value

SELECT
    ROUND(
        SUM(price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;

-- Business Question 96: Average Delivery Time

SELECT
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp))
            / 86400
        ),
        2
    ) AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Business Question 97: Highest Revenue State

SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 1;

-- Business Question 98: Highest Revenue Product Category

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 1;

-- Business Question 99: Most Used Payment Method

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC
LIMIT 1;

-- Business Question 100: Executive Business Summary

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    COUNT(DISTINCT s.seller_id) AS total_sellers,
    ROUND(SUM(oi.price),2) AS total_revenue,
    ROUND(SUM(oi.price)/COUNT(DISTINCT o.order_id),2) AS average_order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN sellers s
    ON oi.seller_id = s.seller_id;