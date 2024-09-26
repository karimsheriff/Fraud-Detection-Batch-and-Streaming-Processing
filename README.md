# Fraud-Detection-Batch-and-Streaming-Processing Pipeline  📊✅
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
