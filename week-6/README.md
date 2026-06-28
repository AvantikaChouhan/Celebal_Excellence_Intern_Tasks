# Week 6 - Spark Architecture and Data Processing

## 🎯 Objective

The objective of this assignment is to understand Apache Spark Architecture and perform efficient data processing using PySpark DataFrames.

This assignment focuses on:

🔹 Understanding Spark Architecture (Driver, Cluster Manager, Executors)

🔹 Understanding Client Mode and Cluster Mode

🔹 Spark Lazy Evaluation and DAG (Lineage Graph)

🔹 Reading CSV and Parquet Files

🔹 Schema Handling and Data Type Management

🔹 Data Filtering and Column Selection

🔹 DataFrame Transformations

🔹 Column Renaming and Data Type Casting

🔹 Adding New Columns

🔹 Predicate Pushdown in Parquet

🔹 Handling Null Values

🔹 Building a Complete Read → Transform → Filter → Write Pipeline

🔹 Spark Performance Best Practices

---

## 🗂️ Dataset Used

📁 **Dataset Name:** dataset.csv

📄 **File Format:** CSV

### Columns Included

* product_id
* old_name
* category
* price
* base_price
* amount
* status
* user_id
* region
* priority
* order_id
* order_date
* ship_date
* quantity
* discount
* tax
* shipping_cost
* final_price
* payment_method
* city
* country
* vendor
* warehouse_id
* rating
* returned

---

## 🛠️ Technologies Used

🔥 Apache Spark

🐍 PySpark

📓 Google Colab

💻 Python

📂 GitHub

---

## 📌 Operations Performed

### 🔹 Spark Architecture

* Understood the roles of Driver, Cluster Manager, and Executors
* Compared Client Mode and Cluster Mode

### 🔹 Data Loading

* Loaded CSV dataset using Spark DataFrame
* Used **header=True**
* Used **inferSchema=True**

### 🔹 Data Filtering

* Filtered records based on category
* Filtered records using multiple conditions
* Applied logical **AND** and **OR** operators

### 🔹 Data Transformation

* Selected required columns
* Renamed columns
* Casted data types
* Added calculated columns

### 🔹 Parquet Processing

* Saved DataFrame as Parquet
* Loaded Parquet file
* Filtered null values
* Saved processed data as CSV

### 🔹 Spark Performance Concepts

* Lazy Evaluation
* Directed Acyclic Graph (DAG)
* Predicate Pushdown
* Shuffle Operations
* Wide Transformations
* Schema Handling
* Data Pipeline Optimization

---

## 🧠 Concepts Covered

🔹 Spark Architecture

🔹 Driver, Cluster Manager and Executors

🔹 Client Mode vs Cluster Mode

🔹 Lazy Evaluation

🔹 Directed Acyclic Graph (DAG)

🔹 Spark DataFrames

🔹 Data Filtering

🔹 Transformations and Actions

🔹 Schema Management

🔹 Predicate Pushdown

🔹 CSV vs Parquet

🔹 Null Value Handling

🔹 Read → Transform → Filter → Write Pipeline

🔹 Spark Performance Optimization

🔹 Best Practices for Large Datasets

---

## ✅ Outcome

Successfully implemented Apache Spark DataFrame operations using PySpark, including Spark Architecture concepts, Lazy Evaluation, schema handling, filtering, transformations, Parquet processing, and data pipeline creation.

The assignment demonstrates efficient processing of large datasets using Apache Spark and follows best practices for scalable and optimized distributed data processing.

---

## ✍️ Author

**Avantika Chouhan**

