WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    fo.first_order_date
FROM customers c
JOIN first_orders fo ON c.customer_id = fo.customer_id
JOIN orders o ON o.customer_id = c.customer_id AND o.order_date = fo.first_order_date
ORDER BY c.customer_id;

SELECT 
    p.product_id,
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

WITH daily_revenue AS (
    SELECT
        o.order_date,
        SUM(p.price * oi.quantity) AS revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p ON p.product_id = oi.product_id
    GROUP BY o.order_date
)
SELECT 
    order_date,
    revenue
FROM daily_revenue
WHERE revenue = (SELECT MAX(revenue) FROM daily_revenue);