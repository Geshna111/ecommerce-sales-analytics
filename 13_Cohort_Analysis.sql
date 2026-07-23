-- Business Question 86: First Purchase Month

SELECT
    c.customer_unique_id,
    MIN(DATE_TRUNC('month', o.order_purchase_timestamp)) AS first_purchase_month
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id;

-- Business Question 87: New Customers Per Month

SELECT
    DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS first_purchase_month,
    COUNT(DISTINCT c.customer_unique_id) AS new_customers
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY first_purchase_month;

-- Business Question 88: First Orders by Month

WITH first_orders AS
(
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_order
    FROM orders
    GROUP BY customer_id
)

SELECT
    DATE_TRUNC('month', first_order) AS month,
    COUNT(*) AS first_orders
FROM first_orders
GROUP BY month
ORDER BY month;

-- Business Question 89: Repeat Customers

-- Business Question 89: Customer Spend and Order Count

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 20;

-- Business Question 90: Customer Segmentation by Order Count

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        WHEN total_orders BETWEEN 2 AND 5 THEN 'Repeat Customer'
        ELSE 'Loyal Customer'
    END AS customer_segment,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_segment
ORDER BY customers DESC;

