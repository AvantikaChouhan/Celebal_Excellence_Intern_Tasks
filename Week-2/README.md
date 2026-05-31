# 🛒 E-Commerce Sales Database — SQL Project

## 📌 Project Overview

This project is based on an **E-Commerce Sales Database** developed using **MySQL**.

The project demonstrates practical SQL concepts including:

* Database creation
* Table relationships
* Constraints & Keys
* Data insertion
* Filtering & Aggregation
* Joins
* CASE statements
* Transactions & ACID properties

The database simulates a real-world e-commerce platform containing customer, product, order, and sales information.

---

# 🛠️ Technologies Used

| Technology      | Purpose                           |
| --------------- | --------------------------------- |
| MySQL           | Database Management               |
| SQL             | Query Language                    |
| MySQL Workbench | Query Execution & Database Design |

---

# 📂 Project Structure

```text
📦 Week-2
 ┣ 📄 ecommerce_queries.sql
 ┣ 📄 README.md
 ┣ 📄 .gitignore
 ┗ 📂 SQL_Query_Outputs
```


---

# 🗂️ Database Schema

The project contains 4 relational tables:

## 👤 customers

Stores customer information.

## 📦 products

Contains product details and inventory.

## 🧾 orders

Stores customer order details.

## 🛍️ order_items

Contains product-wise order information.

---

# 🔗 Table Relationships

```text
customers ──▶ orders ──▶ order_items ◀── products
```

* One customer can place multiple orders
* One order can contain multiple products
* One product can appear in multiple orders

---

# 📊 SQL Concepts Implemented

## ✅ SQL Basics

* SELECT statements
* DISTINCT
* Constraints
* Primary Keys
* UNIQUE & NOT NULL

---

## ✅ Filtering & Optimization

* WHERE clause
* BETWEEN
* AND / OR operators
* Indexes
* SARGable queries

---

## ✅ Aggregation Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

---

## ✅ Joins & Relationships

* INNER JOIN
* LEFT JOIN
* Foreign Keys

---

## ✅ Advanced SQL

* CASE statements
* ACID Properties
* Transactions
* COMMIT & ROLLBACK

---

# 🚀 How to Run the Project

## Step 1

Open MySQL Workbench.

---

## Step 2

Create Database:

```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

---

## Step 3

Run the SQL script file:

```text
ecommerce_queries.sql
```

The script will:

* Create all tables
* Insert sample data
* Execute all assignment queries

---

# 📈 Key Learnings

Through this project, I learned:

* Relational database design
* Writing SQL queries
* Using joins and aggregations
* Handling constraints and keys
* Database transactions
* Query optimization techniques

---

# ✅ Project Outcome

Successfully created and managed a complete e-commerce sales database using SQL with proper relationships, constraints, and analytical queries.

---

# 👩‍💻 Author

**Avantika Chouhan**
