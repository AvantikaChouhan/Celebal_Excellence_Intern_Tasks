# 🚀 Apache Spark Fundamentals and Data Processing using PySpark

## 🎯 Objective

The objective of this assignment is to understand Apache Spark fundamentals and perform data cleaning, transformation, filtering, aggregation, and schema modification using Spark DataFrames.

This assignment focuses on:

🔹 Understanding MapReduce limitations

🔹 Spark In-Memory Computing

🔹 Data Cleaning using DataFrames

🔹 Handling Null Values and Duplicates

🔹 Data Filtering and Transformation

🔹 Aggregation and Grouping Operations

🔹 Schema Modification

🔹 Understanding Shuffle Operations

🔹 Building a Complete Data Processing Pipeline

---

## 🗂️ Dataset Used

📁 Dataset Type: Sample DataFrame (Self-Created)

📄 Format: Spark DataFrame

📊 Columns Included:

* user_id
* transaction_date
* region
* product_category
* price
* status
* city
* age
* subscription
* raw_timestamp
* username
* email
* store_id
  
📝 Note:
Since no dataset was provided in the assignment, a sample DataFrame was created to demonstrate Spark DataFrame operations, data cleaning, transformations, filtering, and aggregations.

---

## 🛠️ Technologies Used

🔥 Apache Spark

🐍 PySpark

📓 Google Colab

💻 Python

📂 GitHub

---

## 📌 Operations Performed

### 🔹 Data Cleaning

* Removed duplicate records using `dropDuplicates()`
* Handled null values using `.na.fill()`
* Removed invalid records containing null emails or empty usernames

### 🔹 Data Filtering

* Filtered records based on region
* Filtered records based on age range and subscription type

### 🔹 Data Aggregation

* Calculated average sales amount
* Counted records by city
* Calculated minimum, maximum, and average prices
* Calculated total revenue by store

### 🔹 Schema Management

* Converted string timestamps to `TimestampType`
* Renamed and modified columns

### 🔹 Spark Concepts Demonstrated

* In-Memory Computing
* DataFrame Immutability
* Shuffle Operations
* Wide Transformations
* Schema Inference
* Data Processing Pipelines

---

## 🧠 Concepts Covered

🔹 Apache Spark Architecture

🔹 MapReduce vs Spark

🔹 Spark DataFrames

🔹 Data Cleaning Techniques

🔹 Null Value Handling

🔹 Filtering and Transformations

🔹 Aggregation Functions

🔹 GroupBy Operations

🔹 Shuffle and Wide Transformations

🔹 Schema Management

🔹 End-to-End Data Processing Pipeline

---

## ✅ Outcome

Successfully implemented data cleaning, transformation, filtering, aggregation, and schema management using Apache Spark DataFrames.

The assignment demonstrates how Spark processes large-scale data efficiently through distributed processing and in-memory computation techniques.

---

## ✍️ Author

**Avantika Chouhan**
