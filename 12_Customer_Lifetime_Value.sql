-- Business Question 81: Customer Lifetime Value (CLV)

SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS lifetime_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY lifetime_value DESC;

-- Business Question 82: Top 20 Customers by CLV

SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS lifetime_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY lifetime_value DESC
LIMIT 20;

-- Business Question 83: Average Customer Lifetime Value

WITH customer_clv AS
(
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS lifetime_value
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    ROUND(AVG(lifetime_value),2) AS average_clv
FROM customer_clv;

-- Business Question 84: Customer Segments

WITH customer_clv AS
(
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS lifetime_value
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    ROUND(lifetime_value,2) AS lifetime_value,
    CASE
        WHEN lifetime_value >= 1000 THEN 'High Value'
        WHEN lifetime_value >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_clv
ORDER BY lifetime_value DESC;

-- Business Question 85: Average CLV by State

WITH customer_clv AS
(
    SELECT
        c.customer_unique_id,
        c.customer_state,
        SUM(oi.price) AS lifetime_value
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_unique_id,
        c.customer_state
)

SELECT
    customer_state,
    ROUND(AVG(lifetime_value),2) AS average_clv
FROM customer_clv
GROUP BY customer_state
ORDER BY average_clv DESC;

