-- ==========================================
-- Query 15: Complex CTE - Cohort Analysis
-- ==========================================

WITH cohort AS (

    SELECT
        c.customer_id,
        strftime('%Y-%m', c.registration_date) AS cohort_month,
        strftime('%Y-%m', o.order_date) AS order_month

    FROM customers c

    JOIN orders o
    ON c.customer_id = o.customer_id

)

SELECT

    cohort_month,

    COUNT(DISTINCT CASE WHEN order_month = cohort_month THEN customer_id END) AS month_0,

    COUNT(DISTINCT CASE
        WHEN order_month = strftime('%Y-%m', date(cohort_month || '-01','+1 month'))
        THEN customer_id
    END) AS month_1,

    COUNT(DISTINCT CASE
        WHEN order_month = strftime('%Y-%m', date(cohort_month || '-01','+2 month'))
        THEN customer_id
    END) AS month_2,

    COUNT(DISTINCT CASE
        WHEN order_month = strftime('%Y-%m', date(cohort_month || '-01','+3 month'))
        THEN customer_id
    END) AS month_3

FROM cohort

GROUP BY cohort_month

ORDER BY cohort_month;
-- ==========================================
-- Query 16: Products Frequently Bought Together
-- ==========================================

SELECT
    p1.product_name AS product_a,
    p2.product_name AS product_b,
    COUNT(*) AS times_bought_together

FROM order_items oi1

JOIN order_items oi2
ON oi1.order_id = oi2.order_id
AND oi1.product_id < oi2.product_id

JOIN products p1
ON oi1.product_id = p1.product_id

JOIN products p2
ON oi2.product_id = p2.product_id

WHERE p1.product_name <> p2.product_name

GROUP BY
    p1.product_name,
    p2.product_name

ORDER BY
    times_bought_together DESC;