-- ==========================================
-- Query 4: Customers Who Never Had Any Item Delivered
-- ==========================================

SELECT
    c.customer_id,
    c.customer_name

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.customer_name

HAVING
    SUM(
        CASE
            WHEN o.status = 'DELIVERED' THEN 1
            ELSE 0
        END
    ) = 0;

-- ==========================================
-- Query 5: Products with More Returns Than Purchases
-- ==========================================

SELECT
    p.product_id,
    p.product_name,

    SUM(
        CASE
            WHEN o.status = 'RETURNED' THEN 1
            ELSE 0
        END
    ) AS total_returns,

    SUM(
        CASE
            WHEN o.status != 'RETURNED' THEN 1
            ELSE 0
        END
    ) AS total_purchases

FROM products p

JOIN order_items oi
ON p.product_id = oi.product_id

JOIN orders o
ON oi.order_id = o.order_id

GROUP BY
    p.product_id,
    p.product_name

HAVING
    total_returns > total_purchases;

-- ==========================================
-- Query 6: Return Rate Per Category
-- ==========================================

SELECT

    p.category,

    SUM(
        CASE
            WHEN o.status = 'RETURNED'
            THEN 1
            ELSE 0
        END
    ) * 100.0 /

    COUNT(*) AS return_rate

FROM products p

JOIN order_items oi
ON p.product_id = oi.product_id

JOIN orders o
ON oi.order_id = o.order_id

GROUP BY
    p.category;