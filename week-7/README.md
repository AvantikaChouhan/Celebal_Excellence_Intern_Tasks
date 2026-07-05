# Delta Lake Incremental Data Processing Assignment

## 📌 Overview

This project demonstrates **Incremental Data Processing** using **PySpark** and **Delta Lake**. The workflow includes loading a dataset into a Delta table, performing data cleaning, simulating incremental data, applying the **MERGE** operation, validating the results, and displaying the final dataset.

---

# 🎯 Objective

- 📥 Load dataset into a Delta table.
- 🧹 Perform basic data cleaning (handle null values and remove duplicates).
- ➕ Create a second dataset simulating new/incremental data.
- 🔄 Apply the **MERGE** operation to update existing records and insert new records.
- ✅ Validate the results.
- 📊 Display the final dataset and summary.

---

# 📂 Dataset

**Dataset Used:** **Sample Superstore Dataset**

The project contains:

- 📄 **superstore_master.csv** – Cleaned master dataset
- 📄 **superstore_incremental.csv** – Incremental dataset used for MERGE operation

---

# 📁 Project Structure

```text
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

# ⚙️ Steps Performed

### 📥 1. Data Loading
- Loaded the Superstore dataset into a PySpark DataFrame.

### 🧹 2. Data Cleaning
- Removed null values.
- Removed duplicate records.
- Renamed column names where required for Delta Lake compatibility.

### 🗄️ 3. Delta Table Creation
- Stored the cleaned dataset in Delta format.

### ➕ 4. Incremental Data Creation
- Created a second dataset containing:
  - Updated records
  - New records

### 🔄 5. MERGE Operation
- Updated matching records.
- Inserted new records.

### ✔️ 6. Validation
- Verified total row count.
- Checked duplicate records.
- Validated null values.

### 📈 7. Final Output
- Displayed the final Delta table.
- Exported master and incremental datasets.

---

# 🛠️ Technologies Used

- 🐍 Python
- ⚡ PySpark
- 🗃️ Delta Lake
- 🌐 GitHub

---

# ▶️ How to Run

1. Install the required dependencies.
2. Open the notebook.
3. Upload the dataset.
4. Execute all notebook cells sequentially.
5. Verify the outputs.
6. Export the generated datasets if required.

---

# 📸 Output

The notebook successfully demonstrates:

- ✅ Delta Table Creation
- ✅ Data Cleaning
- ✅ Incremental Data Processing
- ✅ MERGE (Update + Insert)
- ✅ Data Validation
- ✅ Final Dataset

---

# 📷 Screenshots

The repository includes screenshots for the following stages:

- 📥 Data Loading
- 🧹 Data Cleaning
- 🔄 MERGE Operation
- ✔️ Validation
- 📊 Final Output

---

# 👩‍💻 Author

**Name:** Avantika Chouhan

