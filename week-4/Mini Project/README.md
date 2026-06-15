# 📊 Mini Project: Superstore Data Pipeline using Azure Data Factory

## 🎯 Problem Statement

Build a complete pipeline that reads a CSV file from Azure Blob Storage and processes it using Azure Data Factory (ADF).

---

## 🗂️ Dataset Used

📁 Dataset Name: Sample - Superstore.csv

📄 File Format: CSV

---

## ☁️ Azure Services Used

🔹 Azure Blob Storage

🔹 Azure Data Factory (ADF)

🔹 Linked Service

🔹 Dataset

🔹 Pipeline

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
            │
            ▼
🔄 Copy Data Activity
            │
            ▼
📤 Destination Dataset
            │
            ▼
✅ Pipeline Succeeded
```

---

## ⚙️ Process

### 📋 Get Metadata Activity

Used to validate the source file.

✅ File Exists

✅ File Size

### 🔄 Copy Data Activity

Used to copy data from the source dataset to the destination dataset.

---

## 📈 Output

✅ Metadata validated successfully

✅ Data copied successfully

✅ Pipeline executed successfully

---

## ✍️ Author

**Avantika Chouhan** 
