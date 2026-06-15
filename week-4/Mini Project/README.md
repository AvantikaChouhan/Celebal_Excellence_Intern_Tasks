# 📊 Mini Project: Superstore Data Pipeline using Azure Data Factory

## 🎯 Problem Statement

Build a complete pipeline that reads a CSV file from Azure Blob Storage and processes it using Azure Data Factory (ADF).

---

## 🗂️ Requirements

### 📥 Source

CSV file stored in Azure Blob Storage

### 🛠️ Components Used

🔹 Linked Service

🔹 Dataset

🔹 Pipeline

### ⚙️ Process

🔹 Get Metadata Activity

🔹 Copy Data Activity

### 📤 Destination

New file generated in the destination location within Azure Blob Storage

---

## ☁️ Azure Services Used

### 📦 Azure Blob Storage

Used for storing source and destination files.

### 🔄 Azure Data Factory (ADF)

Used for creating datasets, pipelines, and executing data movement activities.

---

## 🗂️ Dataset Used

📁 Dataset Name: Sample - Superstore.csv

📄 File Format: CSV

📊 Dataset Type: Sales and Order Data

---

## 🔄 Project Flowchart

```text
📄 Sample - Superstore.csv
            │
            ▼
📦 Azure Blob Storage
            │
            ▼
🔗 Linked Service
            │
            ▼
📥 Source Dataset
            │
            ▼
📋 Get Metadata Activity
      (Validate File)
            │
            ▼
🔄 Copy Data Activity
            │
            ▼
📤 Destination Dataset
            │
            ▼
📁 output.csv
            │
            ▼
✅ Pipeline Succeeded
```

---

## ⚙️ Process Implementation

### 📋 Get Metadata Activity

The Get Metadata activity was used to validate the source file before processing.

Metadata Retrieved:

✅ File Exists

✅ File Size

---

### 🔄 Copy Data Activity

The Copy Data activity was used to transfer data from the source dataset to the destination dataset.

Source File:

`Sample - Superstore.csv`

Destination File:

`output.csv`

---

## 📊 Expected Output

✅ Pipeline executed successfully

✅ Data copied to destination

✅ Metadata validated

---

## 📈 Actual Output

✅ Metadata validation completed successfully

✅ Data copied successfully to destination location

✅ Pipeline execution status: **Succeeded**

---

## ✍️ Author

**Avantika Chouhan** 🚀
