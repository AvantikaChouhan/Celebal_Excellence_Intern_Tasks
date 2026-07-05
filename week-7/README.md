# Delta Lake Incremental Data Processing Assignment

## Overview

This project demonstrates incremental data processing using **PySpark** and **Delta Lake** in **Google Colab**. The assignment includes loading a dataset into a Delta table, cleaning the data, simulating incremental data, performing a MERGE operation, validating the results, and exporting the datasets for GitHub submission.

---

## Objective

- Load dataset into a Delta table.
- Perform data cleaning (handle null values and remove duplicates).
- Create an incremental dataset.
- Apply the Delta Lake MERGE operation.
- Validate the final dataset.
- Display the final output and summary.

---

## Environment

- Google Colab
- Python 3
- PySpark
- Delta Lake

---

## Dataset

**Dataset Used:** Sample Superstore Dataset

Two datasets are included:

- **superstore_master.csv** – Cleaned master dataset
- **superstore_incremental.csv** – Incremental dataset used for MERGE operation

---

## Project Structure

```
week-7/
│
├── data/
│   ├── superstore_master.csv
│   └── superstore_incremental.csv
│
├── results_screenshots/
│
├── delta_scd_assignment.ipynb
│
└── README.md
```

---

## Steps Performed

### 1. Data Loading
- Loaded the Superstore dataset into a PySpark DataFrame.

### 2. Data Cleaning
- Removed null values.
- Removed duplicate records.
- Renamed column names for Delta Lake compatibility.

### 3. Delta Table Creation
- Stored the cleaned dataset in Delta format.

### 4. Incremental Data Creation
- Created a second dataset containing updated and new records.

### 5. MERGE Operation
- Updated existing records.
- Inserted new records.

### 6. Validation
- Checked total row count.
- Verified duplicate records.
- Checked null values.

### 7. Final Output
- Displayed the final Delta table.
- Exported master and incremental datasets as CSV files.

---

## Technologies Used

- Python
- PySpark
- Delta Lake
- Google Colab
- GitHub

---

## Repository Contents

- Delta Lake Notebook
- Superstore Master Dataset
- Superstore Incremental Dataset
- Screenshots
- README

---

## How to Run

1. Open the notebook in Google Colab.
2. Install the required libraries.
3. Upload the Superstore dataset.
4. Run all notebook cells sequentially.
5. Download the generated CSV files.
6. Verify the outputs and screenshots.

---

## Output

The notebook successfully demonstrates:

- Delta Table Creation
- Data Cleaning
- Incremental Data Processing
- MERGE (Update + Insert)
- Data Validation
- Final Dataset

---

## Author

**Name:** Avantika Chouhan

