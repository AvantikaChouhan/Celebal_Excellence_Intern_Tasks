-- ====================
-- Step 1: Setup Data
-- ====================
CREATE DATABASE superstore; 
USE superstore;
-- 1.	Import the Superstore dataset into a table named superstore_raw. 
-- Superstore dataset is imported inta a table named superstore_raw.
-- 2.	Create these 3 tables from it: a.customers  b.orders  c.products 
CREATE TABLE customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50)
);

CREATE TABLE products (
    Product_ID VARCHAR(50),
    Product_Name VARCHAR(255),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50)
);

CREATE TABLE orders (
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(50),
    Ship_Date VARCHAR(50),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(50),
    Sales DECIMAL(12,4),
    Quantity INT,
    Discount DECIMAL(12,4),
    Profit DECIMAL(12,4)
);
-- 3.	Insert data into these tables using SELECT DISTINCT. 
INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    `Segment`
FROM superstore_raw;

INSERT INTO products
SELECT
    `Product ID`,
    MAX(`Product Name`),
    MAX(`Category`),
    MAX(`Sub-Category`)
FROM superstore_raw
GROUP BY `Product ID`;
 /*NOTE:While creating the `products` table, `SELECT DISTINCT` caused duplicate key errors because some Product IDs appeared multiple times in the dataset with slight variations in other attributes. 
Since `Product_ID` was intended to uniquely identify each product, `GROUP BY Product ID` was used instead of `SELECT DISTINCT`.
The `GROUP BY` clause ensures that only one record is selected for each unique Product ID. Aggregate functions such as `MAX()` were used to retrieve the corresponding Product Name, Category, and Sub-Category values. 
This approach eliminated duplicate Product IDs and allowed successful insertion of product records without violating the primary key constraint.*/

INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;
-- =================================
-- Step 2: Perform Required Queries
-- =================================
-- 1.	Find all orders where sales are greater than the average sales. (Subquery) 
SELECT *
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
);

-- 2.	Find the highest sales order for each customer. (Subquery) 
SELECT
    o.Customer_ID,
    o.Order_ID,
    o.Sales
FROM orders o
JOIN
(
    SELECT
        Customer_ID,
        MAX(Sales) AS Max_Sales
    FROM orders
    GROUP BY Customer_ID
) m
ON o.Customer_ID = m.Customer_ID
AND o.Sales = m.Max_Sales;

-- 3.	Calculate total sales for each customer. (CTE) 
WITH customer_sales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT *
FROM customer_sales;

-- 4.	Find customers whose total sales are above average. (CTE + Subquery) 
WITH customer_sales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)

SELECT *
FROM customer_sales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM customer_sales
);

-- 5.	Rank all customers based on total sales. (Window Function) 
WITH customer_sales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Total_Sales,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
FROM customer_sales;

-- 6.	Assign row numbers to each order within a customer. (Window Function + PARTITION BY) 
SELECT
    Customer_ID,
    Order_ID,
    Sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY Customer_ID
        ORDER BY Order_ID
    ) AS Row_Num
FROM orders;

-- 7.	Display top 3 customers based on total sales. (Window Function) 
WITH customer_sales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Total_Sales,
    Customer_Rank
FROM
(
    SELECT
        Customer_ID,
        Total_Sales,
        RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
    FROM customer_sales
) ranked_customers
WHERE Customer_Rank <= 3;
-- ===============================
-- Step 3: Final Combined Query
-- ===============================
/* Write one final query that shows:
•	Customer Name 
•	Total Sales 
•	Rank 
(Use JOIN + CTE + Window Function together)*/
/*
Final Query:
Display Customer Name, Total Sales and Rank
Using CTE + JOIN + Window Function
*/
WITH customer_sales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)

SELECT
    c.Customer_Name,
    cs.Total_Sales,
    RANK() OVER (ORDER BY cs.Total_Sales DESC) AS Customer_Rank
FROM customer_sales cs
JOIN customers c
    ON cs.Customer_ID = c.Customer_ID;
