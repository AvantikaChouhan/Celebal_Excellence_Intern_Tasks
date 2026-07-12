# E-Commerce Order Analytics System

## Project Overview

This project is an end-to-end E-Commerce Analytics System developed using Python and SQLite.

The system generates realistic e-commerce data, cleans inconsistent records, loads the cleaned data into a SQLite database, performs business analysis using SQL queries, and generates summary reports through a command-line interface.

---

## Features

- Generate realistic fake e-commerce data
- Clean and validate raw CSV files
- Validate customer emails
- Check referential integrity
- Load cleaned data into SQLite
- Execute 16 business SQL queries
- Generate summary reports using Python
- Perform edge case testing

---

## Technologies Used

- Python 3.x
- SQLite
- Pandas
- Faker

---

## Project Structure

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
│   ├── window_functions.sql
│   └── cohort_analysis.sql
│
├── README.md
└── requirements.txt
```

---

## Installation

Clone the repository

```bash
git clone <repository-url>
```

Move into project directory

```bash
cd ecommerce-analytics-system
```

Install dependencies

```bash
pip install -r requirements.txt
```

---

## How to Run

### 1. Generate Fake Data

```bash
py scripts/generate_data.py
```

### 2. Clean Data

```bash
py scripts/clean_data.py
```

### 3. Load Database

```bash
py scripts/load_database.py
```

### 4. Generate Report

```bash
py scripts/report_cli.py
```

### 5. Run Edge Case Tests

```bash
py scripts/edge_case_tests.py
```

---

## SQL Analysis

The project contains SQL queries for:

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

## Sample Report Output

```
===== E-Commerce Analytics Report =====

Report Type : Monthly

Total Orders : 156

Total Revenue : 1053449.58

Unique Customers : 127

Top 3 Products

1. Science Book
2. Novel
3. Kurta

Revenue Comparison

Current Revenue : 1053449.58

Previous Revenue : 465945.65

Percentage Change : 126.09%
```

---

## Edge Case Tests

The following validations are implemented:

- Invalid Order ID
- Discount Greater Than 100%
- Zero Quantity
- Future Order Date

---

## Author

**Name:** Your Name

Intern Mini Project

