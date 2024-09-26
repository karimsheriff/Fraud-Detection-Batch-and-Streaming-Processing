# Reading CSV file into a DataFrame
fraud_df = spark.read.csv("file:///home/student/Fraud_detection_project/data/fraudTrain.csv", header=True)

# Writing DataFrame to a Hive table
fraud_df.write.mode("append").saveAsTable("fraud_detection.transactions")
