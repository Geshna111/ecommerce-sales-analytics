-- Business Question 11: Customers who have placed orders

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_purchase_timestamp
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
LIMIT 20;

-- Business Question 12: Orders per customer

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 20;

-- Business Question 13: Products in each order

SELECT
    oi.order_id,
    oi.product_id,
    oi.price,
    oi.freight_value
FROM order_items oi
LIMIT 20;

-- Business Question 14: Product categories

SELECT
    product_id,
    product_category_name
FROM products
LIMIT 20;

-- Business Question 15: Best-selling product categories

SELECT
    p.product_category_name,
    COUNT(*) AS total_items_sold
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items_sold DESC
LIMIT 20;

-- Business Question 16: Top sellers by products sold

SELECT
    s.seller_id,
    s.seller_state,
    COUNT(*) AS products_sold
FROM sellers s
INNER JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_state
ORDER BY products_sold DESC
LIMIT 20;

-- Business Question 17: Orders by customer state

SELECT
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Business Question 18: Revenue by seller

SELECT
    s.seller_id,
    SUM(oi.price) AS total_revenue
FROM sellers s
INNER JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC
LIMIT 20;

-- Business Question 19: Revenue by product category

SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 20;

-- Business Question 20: Top customers

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 20;
