-- Business Question 31: Unique Customers

SELECT
    COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

-- Business Question 32: Top Customers by Orders

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 20;

-- Business Question 33: Customers by State

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- Business Question 34: Customers by City

SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 20;

-- Business Question 35: Highest Spending Customers

SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 20;

-- Business Question 36: Average Customer Spend

SELECT
    ROUND(AVG(customer_total),2) AS average_customer_spend
FROM
(
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS customer_total
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
) t;

-- Business Question 37: Average Orders Per Customer

SELECT
    ROUND(AVG(order_count),2) AS average_orders
FROM
(
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) t;

-- Business Question 38: Loyal Customers

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 5
ORDER BY total_orders DESC;

-- Business Question 39: Revenue by Customer State

SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;

-- Business Question 40: Revenue by City

SELECT
    c.customer_city,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY revenue DESC
LIMIT 20;