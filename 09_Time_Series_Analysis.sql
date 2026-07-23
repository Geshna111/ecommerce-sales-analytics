-- Business Question 51: Monthly Order Trend

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Business Question 52: Monthly Revenue Trend

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Business Question 53: Monthly Average Order Value

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(AVG(oi.price),2) AS average_order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Business Question 54: Orders by Day of Week

SELECT
    TO_CHAR(order_purchase_timestamp, 'Day') AS weekday,
    COUNT(*) AS total_orders
FROM orders
GROUP BY weekday
ORDER BY total_orders DESC;

-- Business Question 55: Orders by Hour

SELECT
    EXTRACT(HOUR FROM order_purchase_timestamp) AS hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY hour
ORDER BY hour;

-- Business Question 56: Average Delivery Time

-- Business Question 56: Average Delivery Time (Days)

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

-- Business Question 57: Orders Delivered After Estimated Date

SELECT
    COUNT(*) AS late_orders
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Business Question 58: Orders Delivered On or Before Estimated Date

SELECT
    COUNT(*) AS on_time_orders
FROM orders
WHERE order_delivered_customer_date <= order_estimated_delivery_date;

-- Business Question 59: Monthly Revenue

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Business Question 60: New Customers by Month

SELECT
    DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS first_purchase_month,
    COUNT(DISTINCT c.customer_unique_id) AS new_customers
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY first_purchase_month;

