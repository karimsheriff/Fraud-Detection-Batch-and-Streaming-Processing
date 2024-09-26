-- Query1 --
SELECT SUM(amt) AS total_fraud_loss 
FROM transactions 
WHERE is_fraud = 1;


-- Query2 --
SELECT * 
FROM transactions 
WHERE is_fraud = 1
ORDER BY trans_date_trans_time DESC
LIMIT 10;

-- Query3 --
SELECT merch_lat, merch_long, COUNT(*) AS fraud_count 
FROM transactions 
WHERE is_fraud = 1
GROUP BY merch_lat, merch_long 
ORDER BY fraud_count DESC;

--Query 4 --
SELECT job, COUNT(is_fraud) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY job
ORDER BY fraud_count DESC
LIMIT 10;

-- Query 5 --
SELECT HOUR(trans_date_trans_time) AS hour_of_day, COUNT(*) AS fraud_count 
FROM transactions 
WHERE is_fraud = 1
GROUP BY HOUR(trans_date_trans_time)
ORDER BY fraud_count DESC;

-- Query 6 --
SELECT category, COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY category
ORDER BY fraud_count DESC;

--Query 7--
SELECT merchant, COUNT(*) AS fraud_count 
FROM transactions 
WHERE is_fraud = 1
GROUP BY merchant 
ORDER BY fraud_count DESC;

-- Query 8 --
SELECT lat, longg, city, state, COUNT(is_fraud) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY lat, longg, city, state
ORDER BY fraud_count DESC
LIMIT 100; 

-- Query 9 --
SELECT city_pop, COUNT(*) AS fraud_count 
FROM transactions 
WHERE is_fraud = 1
GROUP BY city , city_pop 
ORDER BY fraud_count DESC;

-- Query 10--
SELECT cc_num, first, last, COUNT(is_fraud) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY cc_num, first, last
ORDER BY fraud_count DESC
LIMIT 10;  

--Query 11 --
SELECT is_fraud, AVG(amt) AS avg_amount 
FROM transactions 
GROUP BY is_fraud;

-- Query 12--
SELECT 
    CASE 
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) < 25 THEN '16-25'
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) BETWEEN 25 AND 40 THEN '25-40'
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60-100'
    END AS age_group,
    COUNT(*) AS fraud_count
FROM transactions 
WHERE is_fraud = 1
GROUP BY CASE 
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) < 25 THEN '16-25'
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) BETWEEN 25 AND 40 THEN '25-40'
        WHEN YEAR(CURRENT_DATE) - YEAR(dob) BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60-100'
    END
ORDER BY fraud_count DESC;

-- Query 13--
WITH avg_amount AS (
    SELECT AVG(amt) AS average_amt
    FROM transactions
),

transactions_above_avg AS (
    SELECT t.trans_date_trans_time, t.cc_num, t.merchant, t.amt, t.city, t.state, t.is_fraud
    FROM transactions t
    JOIN avg_amount a
    ON t.amt > a.average_amt
    WHERE t.is_fraud = 1
)

SELECT trans_date_trans_time, cc_num, merchant, amt, city, state, is_fraud
FROM transactions_above_avg
ORDER BY amt DESC;


-- Query 14 --
WITH fraud_transactions_by_month AS (
    SELECT 
        from_unixtime(unix_timestamp(trans_date_trans_time, 'yyyy-MM-dd HH:mm:ss'), 'yyyy-MM') AS month_year, 
        COUNT(*) AS fraud_count
    FROM transactions
    WHERE is_fraud = 1
    GROUP BY from_unixtime(unix_timestamp(trans_date_trans_time, 'yyyy-MM-dd HH:mm:ss'), 'yyyy-MM')
),

avg_fraud_per_month AS (
    SELECT AVG(fraud_count) AS avg_fraud_count
    FROM fraud_transactions_by_month
)

SELECT f.month_year, f.fraud_count
FROM fraud_transactions_by_month f
JOIN avg_fraud_per_month a
ON f.fraud_count > a.avg_fraud_count
ORDER BY f.fraud_count DESC;

-- Query 15--
SELECT 
    CASE 
        WHEN amt < 50 THEN 'Under $50'
        WHEN amt BETWEEN 50 AND 200 THEN '$50-$200'
        WHEN amt BETWEEN 200 AND 500 THEN '$200-$500'
        ELSE 'Over $500'
    END AS amount_range,
    COUNT(*) AS fraud_count
FROM transactions 
WHERE is_fraud = 1
GROUP BY CASE 
        WHEN amt < 50 THEN 'Under $50'
        WHEN amt BETWEEN 50 AND 200 THEN '$50-$200'
        WHEN amt BETWEEN 200 AND 500 THEN '$200-$500'
        ELSE 'Over $500'
    END
ORDER BY fraud_count DESC;

-- Query 16--
SELECT cc_num, first, last, COUNT(trans_num) AS fraud_count, SUM(amt) AS total_fraud_amount
FROM transactions
WHERE is_fraud = 1
GROUP BY cc_num, first, last
HAVING fraud_count > 1
ORDER BY fraud_count DESC, total_fraud_amount DESC;

-- Query 17--
WITH FraudConnections AS (
    SELECT 
        t.cc_num,
        t.merchant,
        COUNT(*) AS transaction_count,
        SUM(CASE WHEN t.is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_count
    FROM transactions t
    WHERE t.is_fraud = 1
    GROUP BY t.cc_num, t.merchant
)
SELECT 
    cc_num,
    COUNT(DISTINCT merchant) AS unique_merchants,
    SUM(fraud_count) AS total_frauds,
    COUNT(*) AS total_transactions,
    (SUM(fraud_count) / COUNT(*)) * 100 AS fraud_rate
FROM FraudConnections
GROUP BY cc_num
HAVING unique_merchants > 1 
ORDER BY fraud_rate DESC;