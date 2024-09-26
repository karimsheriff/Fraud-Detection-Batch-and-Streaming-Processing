# Fraud-Detection-Batch-and-Streaming-Processing Pipeline  🧨🧨
#### Samsung Innovation Campus Final project

In this project, We designed and implemented a robust data pipeline that integrates data from multiple sources (relational databases, CSV files, and real-time streams) into a unified, structured Hive table on HDFS. The data pipeline ingests transactional data, which is further analyzed using Hive queries and visualized through a Power BI dashboard. Additionally, We developed machine learning models to detect fraudulent transactions, showcasing the power of big data analytics and AI in addressing real-world business challenges.

### Here is our DataFlow:

<img src="Data flow.jpg">

<br>

## Now, Let’s dive deeper into how the data pipeline operates:

### Data Sources:
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



## Dashboards Overview

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
<img src="https://github.com/user-attachments/assets/e89a0244-b20f-4973-8002-68acf56f85bf" alt="Fraud Transactions Tracker" />

