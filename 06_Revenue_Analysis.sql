-- Business Question 21: Total Revenue

SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM order_items;

-- Business Question 22: Average Order Value

SELECT
    ROUND(AVG(price),2) AS average_order_value
FROM order_items;

-- Business Question 23: Revenue by Customer State

SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;

-- Business Question 24: Revenue by City

SELECT
    c.customer_city,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 15;

-- Business Question 25: Revenue by Product Category

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 15;

-- Business Question 26: Top Sellers by Revenue

SELECT
    s.seller_id,
    s.seller_state,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM sellers s
JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_state
ORDER BY total_revenue DESC
LIMIT 15;

-- Business Question 27: Revenue by Payment Type

SELECT
    p.payment_type,
    ROUND(SUM(p.payment_value),2) AS total_revenue
FROM payments p
GROUP BY p.payment_type
ORDER BY total_revenue DESC;

-- Business Question 28: Average Payment by Payment Type

SELECT
    payment_type,
    ROUND(AVG(payment_value),2) AS average_payment
FROM payments
GROUP BY payment_type
ORDER BY average_payment DESC;

-- Business Question 29: Most Expensive Products Sold

SELECT
    product_id,
    price
FROM order_items
ORDER BY price DESC
LIMIT 20;

-- Business Question 30: Average Freight Cost by State

SELECT
    c.customer_state,
    ROUND(AVG(oi.freight_value),2) AS average_freight
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY average_freight DESC;

