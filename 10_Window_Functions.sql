-- Business Question 61: Rank Sellers by Revenue

SELECT
    seller_id,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS seller_rank
FROM (
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
) t
ORDER BY seller_rank;

-- Business Question 62: Dense Rank Product Categories

SELECT
    product_category_name,
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS category_rank
FROM (
    SELECT
        p.product_category_name,
        SUM(oi.price) AS total_revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.product_category_name
) t
ORDER BY category_rank;

-- Business Question 63: Row Number by Purchase Date

SELECT
    order_id,
    order_purchase_timestamp,
    ROW_NUMBER() OVER (
        ORDER BY order_purchase_timestamp
    ) AS row_num
FROM orders;

-- Business Question 64: Running Revenue

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS monthly_revenue,
    SUM(SUM(oi.price)) OVER (
        ORDER BY DATE_TRUNC('month', o.order_purchase_timestamp)
    ) AS running_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY month;

-- Business Question 65: Previous Month Revenue

SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
FROM (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
) t
ORDER BY month;

-- Business Question 66: Next Month Revenue

SELECT
    month,
    revenue,
    LEAD(revenue) OVER (ORDER BY month) AS next_month_revenue
FROM (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
) t
ORDER BY month;

-- Business Question 67: Month-over-Month Revenue Growth

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
)
SELECT
    month,
    ROUND(revenue,2) AS revenue,
    ROUND(LAG(revenue) OVER (ORDER BY month),2) AS previous_revenue,
    ROUND(
        (
            (revenue - LAG(revenue) OVER (ORDER BY month))
            / NULLIF(LAG(revenue) OVER (ORDER BY month),0)
        ) * 100,
        2
    ) AS growth_percentage
FROM monthly_revenue
ORDER BY month;

-- Business Question 68: Top 3 Sellers in Each State

SELECT *
FROM (
    SELECT
        s.seller_state,
        s.seller_id,
        SUM(oi.price) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY s.seller_state
            ORDER BY SUM(oi.price) DESC
        ) AS rn
    FROM sellers s
    JOIN order_items oi
    ON s.seller_id = oi.seller_id
    GROUP BY s.seller_state, s.seller_id
) ranked
WHERE rn <= 3
ORDER BY seller_state, rn;

-- Business Question 69: Top 5 Customers by State

SELECT *
FROM (
    SELECT
        c.customer_state,
        c.customer_unique_id,
        SUM(oi.price) AS total_spent,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_state
            ORDER BY SUM(oi.price) DESC
        ) AS rn
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_state, c.customer_unique_id
) ranked
WHERE rn <= 5
ORDER BY customer_state, rn;

-- Business Question 70: Running Order Count

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(*) AS monthly_orders,
    SUM(COUNT(*)) OVER (
        ORDER BY DATE_TRUNC('month', order_purchase_timestamp)
    ) AS running_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY month;
