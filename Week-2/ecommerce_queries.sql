create database ecommerce_db;
USE ecommerce_db;
-- Create customers table
create table customers(
customer_id INT primary key,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(100) unique NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NOT NULL,
join_date date not null,
is_premium boolean default false
);
-- Create products table
create table products(
product_id INT primary key,
product_name varchar(100) NOT NULL,
category varchar(50)  NOT NULL,
brand varchar(50) NOT NULL,
unit_price decimal(10,2) not null check(unit_price > 0),
stock_qty int not null default 0 check( stock_qty >= 0)
); 
-- Create orders table
create table orders(
order_id int primary key,
customer_id INT not null,
order_date date not null,
status varchar(20) not null default 'Pending',
total_amount decimal(12,2) not null check(total_amount >= 0),

foreign key(customer_id)
references customers(customer_id)
);
-- Create order_items table
create table order_items (
item_id int primary key,
order_id int not null,
product_id INT not null,
quantity int not null check(quantity > 0),
unit_price decimal(10,2) not null check(unit_price > 0),
discount_pct decimal(5,2) default 0 check( discount_pct between 0 and 100),

foreign key(order_id)
references orders(order_id),
foreign key(product_id)
references products(product_id)
);
-- Insert Values
INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', 
TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', 
FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', 
TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', 
FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', 
TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', 
FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', 
TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', 
FALSE); 

INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400);

INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00);

INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0);

-- =====================================
-- Section A — SQL Basics
-- =====================================
-- Q1. Write a query to display all columns and rows from the customer's table. 
select *
FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers. 
select first_name,last_name,city 
FROM customers;

-- Q3. List all unique categories available in the products table. 
select distinct category 
from products;

-- Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL.
/*PRIMARY KEYS
TABLE               PRIMARY KEY
customers          customer_id
products           product_id
orders             order_id
order_items        item_id

EXPLANATION
Primary Keys uniquely identify each row in a table.They must:
-be UNIQUE
-never contain NULL values

Insights
Primary keys ensure data integrity and prevent duplicate records.
*/

-- Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email?
/*Constraints
email varchar(100) unique NOT NULL,
Explanation

UNIQUE → prevents duplicate emails
NOT NULL → email cannot be empty
Example
INSERT INTO customers
VALUES (109, 'Test', 'User', 'aarav.s@email.com', 'Goa', 'Goa', '2024-09-01', FALSE);
Expected Error
Duplicate entry for UNIQUE constraint
Insight
This prevents multiple accounts using the same email address.*/

-- Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it? Write both the INSERT statement and explain the error.
/*INSERT INTO products
VALUES (209, 'Faulty Product', 'Electronics', 'ABC', -50, 10);
Expected Error
CHECK constraint failed: unit_price > 0
Constraint Responsible
CHECK (unit_price > 0)
Insight
CHECK constraints prevent invalid business data.*/

-- =====================================
-- Section B — Filtering & Optimization (WHERE, Indexes)
-- =====================================
-- Q7. Retrieve all orders with status = 'Delivered'. 
SELECT *
FROM orders
WHERE status = 'Delivered';

-- Q8. Find all products in the 'Electronics' category with a unit_price greater than ₹2000.
SELECT *
FROM products
WHERE category = 'Electronics'
  AND unit_price > 2000;
  
 -- Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'.
 SELECT *
FROM customers
WHERE state = 'Maharashtra'
  AND join_date BETWEEN '2024-01-01' AND '2024-12-31';
  
  -- Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled.
  SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
  AND status <> 'Cancelled';
  
  -- Q11. Explain what the index idx_orders_date does. How would it improve the performance of a query that filters orders by order_date? Write a sample query that would benefit from this index.
  /*Index Definition
CREATE INDEX idx_orders_date ON orders(order_date);

Explanation
This index speeds up:
Date filtering
Sorting by order_date
Range searches

Sample Query
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-01' AND '2024-08-31';

Insight
Indexes reduce full table scans and improve query performance.*/

-- Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024; — would the index on join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable).
/*SARGable query explanation
Non-SARGable Query
SELECT *
FROM customers
WHERE YEAR(join_date) = 2024;

Why Index May Not Be Used
Applying YEAR() on the column forces the database to evaluate every row.

Index-Friendly Query
SELECT *
FROM customers
WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31';

Insight
SARGable queries allow indexes to work efficiently.*/

-- =====================================
-- Section C — Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX) 
-- =====================================
-- Q13. Count the total number of orders in the orders table.
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q14. Find the total revenue (SUM of total_amount) from all 'Delivered' orders. 
SELECT SUM(total_amount) AS delivered_revenue
FROM orders
WHERE status = 'Delivered';

-- Q15. Calculate the average unit_price of products in each category.
SELECT category,
       AVG(unit_price) AS avg_price
FROM products
GROUP BY category;

-- Q16. For each order status, find the count of orders and the total revenue. Sort the result by total revenue in descending order. 
SELECT status,
       COUNT(*) AS order_count,
       SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

-- Q17. Find the most expensive (MAX) and cheapest (MIN) product in each category.
SELECT category,
       MAX(unit_price) AS max_price,
       MIN(unit_price) AS min_price
FROM products
GROUP BY category;

-- Q18. List all product categories where the average unit_price is greater than ₹2000. (Hint: Use HAVING clause)
SELECT category,
       AVG(unit_price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;

-- =====================================
-- Section D — Joins & Relationships 
-- =====================================
-- Q19. Write an INNER JOIN query to display each order along with the customer's first_name and last_name. Show: order_id, order_date, first_name, last_name, total_amount.
SELECT o.order_id,
       o.order_date,
       c.first_name,
       c.last_name,
       o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Q20. Using a LEFT JOIN, list ALL customers and their orders (if any). Customers with no orders should still appear with NULL values for order columns.
SELECT c.customer_id,
       c.first_name,
       o.order_id,
       o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q21. Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item.
SELECT o.order_id,
       p.product_name,
       oi.quantity,
       oi.unit_price,
       oi.discount_pct
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
JOIN products p
  ON oi.product_id = p.product_id;
  
-- Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example from this schema. When would you use a FULL OUTER JOIN?
/*LEFT JOIN
Returns all rows from the left table and matching rows from the right table.
Example
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

RIGHT JOIN
Returns all rows from the right table and matching rows from the left table.
Example
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

FULL OUTER JOIN
Used when you want all records from both tables, including unmatched rows.
Insight
LEFT JOIN is commonly used in customer retention analysis.*/

-- Q23. Identify all Foreign Key relationships in the schema. Explain what would happen if you tried to insert an order with customer_id = 999 (which doesn't exist in customers). 
/*Foreign Keys
Child Table 	Foreign Key	    Parent Table
orders    	  	customer_id	   	customers
order_items 	order_id	   	orders
order_items		product_id		products
Example Error
INSERT INTO orders
VALUES (1011, 999, '2024-09-01', 'Pending', 1000);
Expected Result
Foreign key constraint violation
Insight
Foreign Keys maintain referential integrity.*/

-- =====================================
-- Section E — Advanced Concepts (CASE, ACID, Transactions) 
-- =====================================
-- Q24. Write a query using CASE to classify products into price tiers: 
/*• 'Budget'    → unit_price < 1000 
• 'Mid-Range' → unit_price BETWEEN 1000 AND 3000 
• 'Premium'   → unit_price > 3000 
Display: product_name, unit_price, price_tier. */
SELECT product_name,
       unit_price,
       CASE
           WHEN unit_price < 1000 THEN 'Budget'
           
           WHEN unit_price BETWEEN 1000 AND 3000
           THEN 'Mid-Range'
           
           ELSE 'Premium'
       END AS price_tier
FROM products;

-- Q25. Using a CASE statement inside an aggregate function, count how many orders are 'Delivered' vs 'Not Delivered' (all other statuses). Display the result in a single row.
SELECT
    SUM(CASE 
            WHEN status = 'Delivered'
            THEN 1
            ELSE 0
        END) AS delivered_orders,

    SUM(CASE 
            WHEN status <> 'Delivered'
            THEN 1
            ELSE 0
        END) AS not_delivered_orders

FROM orders;

/*Q26. Explain each letter of ACID: 
• A – Atomicity 
• C – Consistency 
• I – Isolation 
• D – Durability 
Give a real-world example (e.g., bank transfer) showing why each property is important.*/
/*->ACID properties ensure that database transactions are processed safely and reliably.
They are very important in systems like:
Banking
E-commerce
Payment apps
Railway booking systems

A — Atomicity
Meaning
A transaction should happen completely or not happen at all.
ALL OR NOTHING

Bank Transfer Example
Suppose ₹5000 is transferred from Account A to Account B.
Steps:
1.Deduct ₹5000 from Account A
2.Add ₹5000 to Account B
If money is deducted from A but not added to B because of a system crash, the transaction must be cancelled completely.
Database rolls back everything.
Why Important?
Prevents partial transactions and data loss.

C — Consistency
Meaning
The database should always remain valid and follow all rules/constraints.
Bank Example
Before transfer:
A = ₹10000
B = ₹5000
Total = ₹15000
After transfer:
A = ₹5000
B = ₹10000
Total = ₹15000
Total money remains same.
Why Important?
Ensures data accuracy and integrity.

I — Isolation
Meaning
Multiple transactions running at the same time should not interfere with each other.
Example
Two users try to withdraw money simultaneously from the same account.
Without isolation:
Both transactions may read the same balance
Wrong final balance may occur
With isolation:
Transactions are processed safely one by one
Why Important?
Prevents data conflicts and incorrect updates.

D — Durability
Meaning
Once a transaction is committed, it remains permanently saved even if the system crashes.
Example
After successful bank transfer:
COMMIT;
Even if electricity goes off immediately after commit, the transaction data remains saved.
Why Important?
Ensures permanent data storage and reliability.*/

-- Q27. Write a SQL transaction that does the following atomically: 
/*1. Insert a new order (order_id=1011, customer_id=102, today's date, 'Pending', 1598.00) 
2. Insert two order items for that order 
3. Update the stock_qty of the purchased products 
4. If any step fails, ROLLBACK the entire transaction. Otherwise, COMMIT. 
Write the complete BEGIN...COMMIT/ROLLBACK block. */
START TRANSACTION;

-- Insert new order
INSERT INTO orders
VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

-- Insert order items
INSERT INTO order_items
VALUES (5016, 1011, 202, 1, 799.00, 0);

INSERT INTO order_items
VALUES (5017, 1011, 208, 1, 599.00, 0);

-- Update stock quantity
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;

-- If any error occurs
-- ROLLBACK;
-- -----------------------------------------------------------------END---------------------------------------------------------------------------
