-- ===============================================================
--                      Mini Project: Customer Sales Insights
-- ================================================================
-- 1.	Who are the top 5 customers? 
WITH customer_sales AS
(
    SELECT
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT
    Customer_Name,
    Total_Sales
FROM customer_sales
ORDER BY Total_Sales DESC
LIMIT 5;

-- 2.	Who are the bottom 5 customers? 
WITH customer_sales AS
(
    SELECT
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT
    Customer_Name,
    Total_Sales
FROM customer_sales
ORDER BY Total_Sales ASC
LIMIT 5;

-- 3.	Which customers made only one order? 
SELECT
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
HAVING COUNT(DISTINCT o.Order_ID) = 1;

-- 4.	Which customers have above-average sales? 
WITH customer_sales AS
(
    SELECT
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
   GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT
    Customer_Name,
    Total_Sales
FROM customer_sales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM customer_sales
);

-- 5.	What is the highest order value per customer?
SELECT
    c.Customer_Name,
    MAX(o.Sales) AS Highest_Order_Value
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Highest_Order_Value DESC;

