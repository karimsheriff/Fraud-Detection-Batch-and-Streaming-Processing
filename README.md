# Fraud-Detection-Batch-and-Streaming-Processing Pipeline  📊✅
#### Samsung Innovation Campus Final project

In this project, We designed and implemented a robust data pipeline that integrates data from multiple sources (relational databases, CSV files, and real-time streams) into a unified, structured Hive table on HDFS. The data pipeline ingests transactional data, which is further analyzed using Hive queries and visualized through a Power BI dashboard. Additionally, We developed machine learning models to detect fraudulent transactions, showcasing the power of big data analytics and AI in addressing real-world business challenges.

### Here is our DataFlow:

<img src="Data flow.jpg">

<br>

## Now, Let’s dive deeper into how the data pipeline operates:

## Data Sources:
<ol>
  <li>
    Maria DB
    <p>Transactions data are placed in transactions table at Mariadb.</p>
  </li>
  
  <li>
    CSV File
    <p>Transactions CSV File on the local disk contains transaction data.</p>
  </li>
  
  <li>
    Streams Of Data
    <p>Python Application Produce transactions data into our kafka topic.</p>
  </li>
</ol>
<br>
## Data Ingestion:

<p><b>First, </b> We import our trasactional data from Maria DB into Hive Table on HDFS using SQOOP.  </p>
 <pre>

sqoop import --connect jdbc:mysql://localhost/fraud_detection \
--username student --password student \
--fields-terminated-by '\t' \
--table transactions \
--hive-import --hive-database 'fraud_detection' \
--hive-table 'transactions' \
--split-by cc_num

 </pre>
<br>

<p><b>Second, </b> We read the data from transactions csv file on the local disk and put it into the same hive table using pyspark.  </p>
 <pre>

fraud_df = spark.read.csv("file:///home/student/Fraud_detection_project/data/fraudTrain.csv", header=True)

fraud_df.write.mode("append").saveAsTable("fraud_detection.transactions")
</pre>
<br>
<p><b>and Finally, </b>using kafka and spark streaming, We read streams of data from our kafka topic, we process and restructure it to fit our hive table structure, and after that we but it into the table.  </p>
  <pre>
here is where you could find our spark streaming application which works as a consumer.<a href="Spark Streaming Application.ipynb">here</a><br>
</pre>

<p><b>So Now, </b> We have the data ingested and integrated from 3 different data sources and diferent formats into the same hive table on HDFS Ready to be analyzed or used to develop ML models to detect Fraud Transactions as we will see.  </p> 
<br>
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


## Dashboards Overview ✨✨

### 1. Fraud Transactions Tracker

- **Total Fraud Transactions**: 7,506
- **Total Fraud Amount**: $3.99M
- **Fraud Percentage**: 58% of total transactions

#### Key Visualizations:
- **Date Filter**: Range from Jan 1, 2019, to Jun 21, 2020
- **Map Visualization**: Geographic distribution of fraud by state
- **Trends Over Time**: Line chart showing fraud transactions from Jan 2019 to Apr 2020
- **Fraud by Weekday**: Higher activity on weekends
- **Fraud by Hour**: Peaks around 6 PM
- **Fraud vs. Non-Fraud**: Monthly comparison of transaction amounts
  
https://github.com/user-attachments/assets/e89a0244-b20f-4973-8002-68acf56f85bf


<h3>2. Fraud Transactions Analysis</h3>

<ul>
    <li><strong>Merchant Table:</strong> Displays the number of fraud transactions, total fraud amount, and fraud percentage for each merchant.</li>
    <li><strong>Total Fraud Amount by Gender:</strong> Donut chart shows total fraud: 
        <ul>
            <li>Male: $2.12M (54.25%)</li>
            <li>Female: $1.79M (45.75%)</li>
        </ul>
    </li>
    <li><strong>Date Filter:</strong> Slider to filter transactions from Jan 1, 2019, to Jun 13, 2020.</li>
    <li><strong>Total Fraud Amount and Average Age by Job:</strong> Bar and line chart displaying fraud amounts and average ages across job categories.</li>
    <li><strong>Fraud Distribution by Categories:</strong> Bar chart showing fraud occurrences across categories like grocery and shopping.</li>
    <li><strong>Fraud Trends:</strong> Flow diagram illustrating fraud trends by period, city, category, and job.</li>
</ul>

https://github.com/user-attachments/assets/e75b6e5b-a0d5-4614-a2bc-8944ff8ae173

<h3>3. Merchant Fraud Transactions Analysis</h3>

<ul>
    <li><strong>Merchant Details:</strong> Focused on fraud_Cormier LLC with a total fraud amount of $44.90K.</li>
    <li><strong>Credit Card Holder Information:</strong> Table listing customers involved in fraud, including:
        <ul>
            <li>Credit card number</li>
            <li>Customer names</li>
            <li>Job and category of transactions</li>
            <li>Fraud and non-fraud transaction amounts</li>
        </ul>
    </li>
    <li><strong>Fraud Transaction Amount by Customer:</strong> Horizontal bar chart displaying fraud amounts per customer.</li>
    <li><strong>Total Non-Fraud Amount:</strong> Shows legitimate spending alongside fraud for context.</li>
    <li><strong>Date Filter:</strong> Similar slider for filtering transactions from Jan 1, 2019, to Jun 13, 2020.</li>
</ul>

https://github.com/user-attachments/assets/72bcf07d-54a0-4abd-a003-9493f5afa573
