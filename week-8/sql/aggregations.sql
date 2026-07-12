-- ==========================================
-- Query 1: Total Revenue Per Category
-- ==========================================

SELECT
    p.category,

    -- Calculate total revenue
    SUM(
        oi.quantity *
        oi.unit_price *
        (1 - oi.discount_percent / 100.0)
    ) AS total_revenue

FROM order_items AS oi

-- Join products table
INNER JOIN products AS p
ON oi.product_id = p.product_id

-- Group by category
GROUP BY p.category

-- Sort by highest revenue
ORDER BY total_revenue DESC;

-- ==========================================
-- Query 2: Top 10 Customers by Total Revenue
-- ==========================================

SELECT
    c.customer_id,
    c.customer_name,

    -- Calculate Total Revenue
    SUM(
        oi.quantity *
        oi.unit_price *
        (1 - oi.discount_percent / 100.0)
    ) AS total_revenue

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY total_revenue DESC

LIMIT 10;

-- ==========================================
-- Query 3: Revenue Per Month
-- ==========================================

SELECT

    strftime('%Y-%m', o.order_date) AS order_month,

    -- Calculate Monthly Revenue
    SUM(
        oi.quantity *
        oi.unit_price *
        (1 - oi.discount_percent / 100.0)
    ) AS total_revenue

FROM orders o

-- Join Order Items
JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY order_month

-- Sort Month Wise
ORDER BY order_month;
