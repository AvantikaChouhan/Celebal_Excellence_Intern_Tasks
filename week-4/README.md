# ☁️ Azure Data Factory Data Pipeline using Azure Blob Storage

## 🎯 Objective

The objective of this project is to build and execute a complete data pipeline using Microsoft Azure services.

This project focuses on:

🔹 Azure Resource Group Management  
🔹 Azure Blob Storage Configuration  
🔹 Azure Data Factory (ADF) Pipeline Development  
🔹 Metadata Validation using Get Metadata Activity  
🔹 Data Copy Operations between Datasets  
🔹 IAM (Identity and Access Management) Configuration

---

## 🗂️ Dataset Used

📁 Dataset Name: Sample - Superstore

📄 File Format: CSV

☁️ Storage Service: Azure Blob Storage

📂 Container Name: superstore-data

📊 Source File: Sample - Superstore.csv

---

## 🛠️ Azure Services Used

### ☁️ Azure Resource Group

Used to organize and manage Azure resources.

### 📦 Azure Blob Storage

Used for storing source and destination data files.

### 🔄 Azure Data Factory (ADF)

Used to create, manage, and execute data pipelines.

### 🔐 IAM (Identity and Access Management)

Used for role assignment and access control.

---

## 📌 Project Implementation

### 📌 Task 1: Resource Group Creation

A Resource Group named **RG-Week4** was created to manage all project resources.

---

### 📌 Task 2: Azure Storage Setup

An Azure Storage Account was created and configured.

A Blob Container named **superstore-data** was created and the dataset file was uploaded successfully.

---

### 📌 Task 3: Data Factory Configuration

The following components were created:

#### 🔗 Linked Service

A Linked Service named **LS_BlobStorage** was configured to connect Azure Data Factory with Azure Blob Storage.

#### 📥 Source Dataset

A source dataset (**DS_Superstore_Source**) was created to access the uploaded CSV file.

#### 📤 Destination Dataset

A destination dataset (**DS_Superstore_Destination**) was created to store the copied output data.

#### 📋 Get Metadata Activity

A Get Metadata activity was configured to retrieve file information such as:

✅ File Exists

✅ File Size

---

### 📌 Task 4: Pipeline Development

A pipeline named **PL_CopySuperstoreData** was created.

The pipeline uses:

🔹 Get Metadata Activity

🔹 Copy Data Activity

to validate and transfer data.

---

### 📌 Task 5: Pipeline Execution

The pipeline was executed using Debug Mode.

The execution completed successfully with:

✅ Status: Succeeded

✅ Data Copied Successfully

✅ Output File Generated

---

### 📌 Task 6: IAM Configuration

IAM roles were verified and configured for proper access management.

Roles assigned include:

🔐 Owner

🔐 Reader

🔐 Storage Blob Data Contributor

---

## 🧠 Azure Concepts Used

🔹 Azure Resource Groups

🔹 Azure Blob Storage

🔹 Azure Data Factory

🔹 Linked Services

🔹 Datasets

🔹 Get Metadata Activity

🔹 Copy Data Activity

🔹 Pipeline Execution & Monitoring

🔹 IAM & Role-Based Access Control (RBAC)

---

## 📈 Mini Project: Superstore Data Pipeline

The project focuses on:

📂 Storing data in Azure Blob Storage

📋 Validating file metadata

🔄 Copying data using Azure Data Factory

📊 Monitoring pipeline execution

🔐 Managing access permissions through IAM

---

## ✍️ Author

**Avantika Chouhan** 
