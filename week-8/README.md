# Intern Mini Project - E-Commerce Order Analytics System

## Project Overview

This project was developed as part of an internship assignment. It demonstrates an end-to-end E-Commerce Analytics System using Python and SQLite. The project generates realistic e-commerce data, cleans and validates it, loads it into a SQLite database, performs business analysis using SQL, and generates analytical reports through a command-line interface.

---

# System Architecture

The project follows a simple ETL (Extract, Transform, Load) architecture.

```
                Fake Data Generation
                        │
                        ▼
              Raw CSV Files (data/raw)
                        │
                        ▼
            Data Cleaning & Validation
                        │
                        ▼
          Clean CSV Files (data/cleaned)
                        │
                        ▼
          SQLite Database (ecommerce.db)
                        │
        ┌───────────────┼────────────────┐
        ▼               ▼                ▼
   SQL Queries      CLI Reports     Edge Case Tests
```

### Components

### 1. Data Generation

- Generates Customers
- Generates Products
- Generates Orders
- Generates Order Items
- Stores data as CSV files

---

### 2. Data Cleaning

Performs:

- Remove duplicate records
- Trim extra spaces
- Standardize text format
- Validate email addresses
- Check referential integrity
- Handle missing values

---

### 3. Database

SQLite database stores the cleaned data.

Tables:

- customers
- products
- orders
- order_items

---

### 4. SQL Analytics

Implements 16 SQL queries including:

- Revenue Analysis
- Customer Analysis
- Order Analysis
- Return Analysis
- Window Functions
- CTEs
- Cohort Analysis
- Customer Segmentation
- Product Ranking
- Self Join Analysis

---

### 5. Reporting Module

The command-line interface generates reports including:

- Total Orders
- Total Revenue
- Unique Customers
- Top 3 Products
- Revenue Comparison

---

### 6. Edge Case Testing

The system validates:

- Invalid Order IDs
- Discount greater than 100%
- Zero Quantity
- Future Order Dates

---

# Technologies Used

- Python 3.x
- SQLite
- Pandas
- Faker

---

# Project Structure

```
ecommerce-analytics-system/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── database/
│   └── ecommerce.db
│
├── output/
│
├── scripts/
│   ├── generate_data.py
│   ├── clean_data.py
│   ├── load_database.py
│   ├── report_cli.py
│   └── edge_case_tests.py
│
├── sql/
│   ├── schema.sql
│   ├── aggregations.sql
│   ├── intermediate_queries.sql
│   ├── window_functions.sql
│   └── cohort_analysis.sql
│
├── requirements.txt
└── README.md
```

---

# How to Run

## 1. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 2. Generate Fake Data

```bash
py scripts/generate_data.py
```

---

## 3. Clean the Data

```bash
py scripts/clean_data.py
```

---

## 4. Create and Load SQLite Database

```bash
py scripts/load_database.py
```

---

## 5. Generate Analytics Report

```bash
py scripts/report_cli.py
```

Enter:

- Report Type (daily / weekly / monthly)
- Start Date
- End Date

The report displays:

- Total Orders
- Total Revenue
- Unique Customers
- Top 3 Products
- Revenue Comparison

---

## 6. Run Edge Case Tests

```bash
py scripts/edge_case_tests.py
```

---

# Sample Output

```
===== E-Commerce Analytics Report =====

Report Type : Monthly

Available Data Range

From : 2024-01-09
To   : 2026-12-05

===== Summary =====

Total Orders : 156

Total Revenue : 1053449.58

Unique Customers : 127

===== Top 3 Products =====

1. Science Book
2. Novel
3. Kurta

===== Revenue Comparison =====

Current Revenue : 1053449.58

Previous Revenue : 465945.65

Percentage Change : 126.09%
```

---

# Author

**Avantika Chouhan**

