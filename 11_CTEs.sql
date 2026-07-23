-- Business Question 71: Top 10 Customers by Revenue using CTE

WITH customer_revenue AS (
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS total_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    ROUND(total_revenue,2) AS total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- Business Question 72: Top Sellers using CTE

WITH seller_revenue AS (
    SELECT
        seller_id,
        SUM(price) AS revenue
    FROM order_items
    GROUP BY seller_id
)

SELECT
    seller_id,
    ROUND(revenue,2) AS revenue
FROM seller_revenue
ORDER BY revenue DESC
LIMIT 10;

-- Business Question 73: Monthly Revenue

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    ROUND(revenue,2) AS revenue
FROM monthly_sales
ORDER BY month;

-- Business Question 74: Categories Above Average Revenue

WITH category_revenue AS (
    SELECT
        p.product_category_name,
        SUM(oi.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_category_name
)

SELECT
    product_category_name,
    ROUND(revenue,2) AS revenue
FROM category_revenue
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM category_revenue
)
ORDER BY revenue DESC;

-- Business Question 75: Customers Spending Above Average

WITH customer_spending AS (
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    ROUND(total_spent,2) AS total_spent
FROM customer_spending
WHERE total_spent >
(
    SELECT AVG(total_spent)
    FROM customer_spending
)
ORDER BY total_spent DESC;

-- Business Question 76: Highest Revenue State

WITH state_revenue AS (
    SELECT
        c.customer_state,
        SUM(oi.price) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_state
)

SELECT
    customer_state,
    ROUND(revenue,2) AS revenue
FROM state_revenue
ORDER BY revenue DESC
LIMIT 1;

-- Business Question 77: Highest Revenue City in Each State

WITH city_revenue AS (
    SELECT
        c.customer_state,
        c.customer_city,
        SUM(oi.price) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_state, c.customer_city
)

SELECT *
FROM (
    SELECT
        customer_state,
        customer_city,
        ROUND(revenue,2) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY customer_state
            ORDER BY revenue DESC
        ) AS rn
    FROM city_revenue
) ranked
WHERE rn = 1
ORDER BY customer_state;

-- Business Question 78: Monthly Orders and Revenue

WITH monthly_summary AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    total_orders,
    ROUND(revenue,2) AS revenue
FROM monthly_summary
ORDER BY month;

-- Business Question 79: Repeat Customers

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_orders
FROM customer_orders
WHERE total_orders > 1
ORDER BY total_orders DESC;

-- Business Question 80: Revenue Contribution by State

WITH state_revenue AS (
    SELECT
        c.customer_state,
        SUM(oi.price) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_state
)

SELECT
    customer_state,
    ROUND(revenue,2) AS revenue,
    ROUND(
        revenue * 100.0 /
        SUM(revenue) OVER (),
        2
    ) AS revenue_percentage
FROM state_revenue
ORDER BY revenue DESC;
