-- Business Question 41: Products per Category

SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC;

-- Business Question 42: Revenue by Product Category

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;

-- Business Question 43: Units Sold by Category

SELECT
    p.product_category_name,
    COUNT(*) AS units_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY units_sold DESC;

-- Business Question 44: Average Product Price by Category

SELECT
    p.product_category_name,
    ROUND(AVG(oi.price),2) AS average_price
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY average_price DESC;

-- Business Question 45: Most Expensive Products

SELECT
    product_id,
    price
FROM order_items
ORDER BY price DESC
LIMIT 20;

-- Business Question 46: Cheapest Products

SELECT
    product_id,
    price
FROM order_items
ORDER BY price ASC
LIMIT 20;

-- Business Question 47: Best Selling Products

SELECT
    oi.product_id,
    COUNT(*) AS total_units_sold
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_units_sold DESC
LIMIT 20;

-- Business Question 48: Products Generating Highest Revenue

SELECT
    oi.product_id,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_revenue DESC
LIMIT 20;

-- Business Question 49: Freight Cost by Category

SELECT
    p.product_category_name,
    ROUND(AVG(oi.freight_value),2) AS average_freight
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY average_freight DESC;

-- Business Question 50: Categories with Highest Freight Cost

SELECT
    p.product_category_name,
    ROUND(AVG(oi.freight_value),2) AS average_freight
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY average_freight DESC
LIMIT 20;
