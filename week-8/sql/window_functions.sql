-- ==========================================
-- Query 7: Running Total Revenue Per Region
-- ==========================================

WITH daily_revenue AS (

    SELECT
        o.region_code,
        DATE(o.order_date) AS order_date,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS daily_revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY
        o.region_code,
        DATE(o.order_date)

)

SELECT
    region_code,
    order_date,
    daily_revenue,

    SUM(daily_revenue)
    OVER(
        PARTITION BY region_code
        ORDER BY order_date
    ) AS running_total

FROM daily_revenue

ORDER BY
    region_code,
    order_date;

-- ==========================================
-- Query 8: Product Ranking by Revenue
-- ==========================================

WITH product_revenue AS (

    SELECT
        p.category,
        p.product_name,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS total_revenue

    FROM products p

    JOIN order_items oi
        ON p.product_id = oi.product_id

    GROUP BY
        p.category,
        p.product_name

)

SELECT

    category,
    product_name,
    total_revenue,

    DENSE_RANK() OVER(

        PARTITION BY category

        ORDER BY total_revenue DESC

    ) AS rank_in_category

FROM product_revenue

ORDER BY
    category,
    rank_in_category;

-- ==========================================
-- Query 9: Customer Order Gap Analysis
-- ==========================================

WITH customer_orders AS (

    SELECT
        customer_id,
        order_date,

        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_date

    FROM orders

    WHERE customer_id IS NOT NULL

),

order_gaps AS (

    SELECT

        customer_id,
        order_date,
        previous_order_date,

        JULIANDAY(order_date) -
        JULIANDAY(previous_order_date) AS days_gap

    FROM customer_orders

),

customer_avg_gap AS (

    SELECT

        customer_id,

        AVG(days_gap) AS average_gap

    FROM order_gaps

    WHERE days_gap IS NOT NULL

    GROUP BY customer_id

)

SELECT

    og.customer_id,
    og.order_date,
    og.previous_order_date,
    ROUND(og.days_gap,2) AS days_gap,

    ROUND(cag.average_gap,2) AS average_gap,

    CASE
        WHEN cag.average_gap > 30
            THEN 'At Risk'
        ELSE 'Active'
    END AS customer_status

FROM order_gaps og

JOIN customer_avg_gap cag
ON og.customer_id = cag.customer_id

ORDER BY
    og.customer_id,
    og.order_date;

-- ==========================================
-- Query 10: CTE with Multiple Levels
-- ==========================================

WITH monthly_revenue AS (

    -- Step 1: Calculate monthly revenue per customer
    SELECT

        o.customer_id,

        strftime('%Y-%m', o.order_date) AS order_month,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS monthly_revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY
        o.customer_id,
        strftime('%Y-%m', o.order_date)

),

customer_category AS (

    -- Step 2: Categorize customers based on monthly revenue
    SELECT

        customer_id,
        order_month,
        monthly_revenue,

        CASE

            WHEN monthly_revenue > 10000 THEN 'High'

            WHEN monthly_revenue BETWEEN 5000 AND 10000
                THEN 'Medium'

            ELSE 'Low'

        END AS customer_category

    FROM monthly_revenue

)

-- Step 3: Count customers in each category per month
SELECT

    order_month,

    customer_category,

    COUNT(customer_id) AS total_customers

FROM customer_category

GROUP BY

    order_month,
    customer_category

ORDER BY

    order_month,
    customer_category;

-- ==========================================
-- Query 11: NTILE for Customer Segmentation
-- ==========================================

WITH customer_lifetime_value AS (

    SELECT
        o.customer_id,
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS total_value

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY o.customer_id

),

customer_quartile AS (

    SELECT

        customer_id,
        total_value,

        NTILE(4) OVER (
            ORDER BY total_value DESC
        ) AS quartile

    FROM customer_lifetime_value

)

SELECT

    customer_id,
    ROUND(total_value,2) AS total_value,
    quartile,

    CASE
        WHEN quartile = 1 THEN 'Platinum'
        WHEN quartile = 2 THEN 'Gold'
        WHEN quartile = 3 THEN 'Silver'
        ELSE 'Bronze'
    END AS quartile_label

FROM customer_quartile

ORDER BY total_value DESC;

-- ==========================================
-- Query 12: Year-over-Year Comparison
-- ==========================================

WITH monthly_revenue AS (

    SELECT

        CAST(strftime('%Y', o.order_date) AS INTEGER) AS year,

        CAST(strftime('%m', o.order_date) AS INTEGER) AS month,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY
        year,
        month

)

SELECT

    curr.year,

    curr.month,

    ROUND(curr.revenue,2) AS revenue,

    ROUND(prev.revenue,2) AS prev_year_revenue,

    CASE

        WHEN prev.revenue IS NULL
            THEN NULL

        WHEN prev.revenue = 0
            THEN NULL

        ELSE ROUND(

            ((curr.revenue - prev.revenue)
            *100.0) / prev.revenue,

            2

        )

    END AS yoy_growth_percent

FROM monthly_revenue curr

LEFT JOIN monthly_revenue prev

ON curr.month = prev.month

AND curr.year = prev.year + 1

ORDER BY

    curr.year,

    curr.month;

-- ==========================================
-- Query 13: First and Last Purchased Category
-- ==========================================

WITH customer_categories AS (

    SELECT

        o.customer_id,

        p.category,

        o.order_date,

        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date ASC
        ) AS first_order,

        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date DESC
        ) AS last_order

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    JOIN products p
        ON oi.product_id = p.product_id

),

first_category AS (

    SELECT
        customer_id,
        category AS first_purchased_category

    FROM customer_categories

    WHERE first_order = 1

),

last_category AS (

    SELECT
        customer_id,
        category AS last_purchased_category

    FROM customer_categories

    WHERE last_order = 1

)

SELECT

    f.customer_id,

    f.first_purchased_category,

    l.last_purchased_category,

    CASE

        WHEN f.first_purchased_category = l.last_purchased_category
            THEN 'No'

        ELSE 'Yes'

    END AS category_shift

FROM first_category f

JOIN last_category l

ON f.customer_id = l.customer_id

ORDER BY f.customer_id;

-- ==========================================
-- Query 14: Cumulative Distribution
-- ==========================================

WITH customer_revenue AS (

    SELECT
        o.customer_id,
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY o.customer_id

)

SELECT

    customer_id,

    ROUND(revenue,2) AS revenue,

    ROUND(
        SUM(revenue) OVER (
            ORDER BY revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS cumulative_revenue,

    ROUND(
        (
            SUM(revenue) OVER (
                ORDER BY revenue DESC
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) * 100.0
        ) /
        (
            SUM(revenue) OVER ()
        ),
        2
    ) AS cumulative_percent

FROM customer_revenue

ORDER BY revenue DESC;