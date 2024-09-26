# Fraud_Transactions_Data_Pipline
#### Samsung Innovation Campus Final project

In this project, We designed and implemented a robust data pipeline that integrates data from multiple sources (relational databases, CSV files, and real-time streams) into a unified, structured Hive table on HDFS. The data pipeline ingests transactional data, which is further analyzed using Hive queries and visualized through a Power BI dashboard. Additionally, We developed machine learning models to detect fraudulent transactions, showcasing the power of big data analytics and AI in addressing real-world business challenges.

### Here is our DataFlow:

<img src="Data flow.jpg">

<br>

## Now, Let’s dive deeper into how the data pipeline operates:

### Data Sources:






Here’s an updated version of your README that includes the details you shared about your model recall performance:

---

# Fraud Detection Models Using PySpark

## Overview
This project is focused on detecting fraudulent transactions using PySpark. We first perform exploratory data analysis (EDA) to uncover patterns and insights, followed by preprocessing steps to prepare the data for machine learning. We test four different machine learning models and compare their performance, focusing on **recall** as the key metric due to its importance in detecting fraudulent transactions. The model that gives us the best results is **XGBoost**.

## Table of Contents
- [Data Analysis](#data-analysis)
- [Preprocessing](#preprocessing)
- [Modeling](#modeling)
- [Results](#results)
- [Installation](#installation)
- [Usage](#usage)



## Data Analysis
We begin with exploratory data analysis (EDA) to better understand the dataset, explore trends, and identify possible data issues. EDA helps to guide our preprocessing and modeling efforts by identifying key insights and patterns, especially those related to fraudulent transactions.

## Preprocessing
The preprocessing steps include:
1. **Train/Test Split**: We split the dataset into training and testing sets for model evaluation.
2. **Drop Unusable Columns**: Columns that are irrelevant or not usable for modeling are removed.
3. **Handle Data Imbalance**: Since fraud is rare, we apply techniques such as undersampling or oversampling to balance the dataset.
4. **One-Hot Encoding**: Categorical features are encoded using one-hot encoding to make them usable for machine learning models.
5. **Standard Scaling**: Numerical features are standardized to improve model performance and convergence.

## Modeling
We built and compared four machine learning models:
- **Logistic Regression**
- **Support Vector Machine (SVM)**
- **Random Forest**
- **XGBoost**

Each model is evaluated based on recall, which measures the ability to correctly identify fraudulent transactions.

## Results
Our focus is on **recall**, as detecting fraudulent transactions is critical in this scenario. Here are the recall scores for each model:

- **Logistic Regression**: 78%
- **Random Forest**: 88%
- **Support Vector Machine (SVM)**: 78%
- **XGBoost**: 95%

**XGBoost** provides the highest recall score of 95%, making it the most effective model for our fraud detection task.

## Usage
- Run the EDA notebook (`sic-eda-ml.ipynb`) to explore the dataset and identify patterns.
- Use the preprocessing and modeling notebooks (`sic_preprocessing_SVM_Random_forest.ipynb`, `sic-LogisticRegression-fraud-detection.ipynb`, `sic_XGboosting_fraud_detection.ipynb`) to replicate the model training process and compare results.

