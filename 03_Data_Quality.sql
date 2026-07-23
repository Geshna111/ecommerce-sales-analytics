SELECT COUNT(*)
FROM customers
WHERE customer_id IS NULL;

SELECT COUNT(*)
FROM orders
WHERE order_id IS NULL;

SELECT COUNT(*)
FROM products
WHERE product_id IS NULL;

SELECT COUNT(*)
FROM sellers
WHERE seller_id IS NULL;

SELECT COUNT(*)
FROM payments
WHERE payment_value IS NULL;

SELECT COUNT(*)
FROM order_items
WHERE price IS NULL;

