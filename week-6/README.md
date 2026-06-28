# Week 6 - Spark Architecture and Data Processing

## Objective

The objective of this assignment is to understand Apache Spark architecture and perform efficient data processing using DataFrames, transformations, filtering, schema handling, and optimized file formats.

## Topics Covered

- Spark Architecture (Driver, Cluster Manager, Executors)
- Client Mode vs Cluster Mode
- Lazy Evaluation and DAG (Lineage Graph)
- Reading CSV and Parquet files
- Schema Inference
- DataFrame Transformations
- Filtering and Selecting Data
- Column Renaming and Data Type Casting
- Adding New Columns
- Transformations vs Actions
- Wide Transformations and Shuffle
- Predicate Pushdown
- Handling Null Values
- Building Data Pipelines
- Writing Data into CSV and Parquet
- Best Practices for Large Datasets

## Dataset

A custom retail sales dataset containing **100,000 records** and **25 columns** was used for this assignment.

### Main Columns

- product_id
- old_name
- category
- price
- base_price
- amount
- status
- user_id
- region
- priority

### Additional Columns

- order_id
- order_date
- ship_date
- quantity
- discount
- tax
- shipping_cost
- final_price
- payment_method
- city
- country
- vendor
- warehouse_id
- rating
- returned

## Software Used

- Google Colab
- Python
- PySpark
- Apache Spark

## Tasks Performed

- Created SparkSession
- Loaded CSV dataset using inferSchema and header options
- Compared CSV and Parquet file formats
- Filtered data using multiple conditions
- Selected required columns
- Renamed columns
- Casted data types
- Added calculated columns
- Removed null values
- Saved data as Parquet
- Loaded Parquet and exported filtered data as CSV
- Demonstrated Spark Transformations and Actions
- Explained Spark Architecture concepts and performance optimization techniques

## Output

The assignment successfully demonstrates Spark DataFrame operations, schema handling, filtering, transformations, Parquet processing, and optimized data pipeline execution.

## Conclusion

This assignment provides hands-on experience with Apache Spark for distributed data processing. It demonstrates efficient handling of large datasets using Spark DataFrames, lazy evaluation, optimized storage formats, and best practices for scalable data processing.
