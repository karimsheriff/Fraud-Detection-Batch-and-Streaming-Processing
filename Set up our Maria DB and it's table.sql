## Create table transaction;
CREATE TABLE transactions (
    trans_date_trans_time DATETIME,
    cc_num BIGINT,
    merchant VARCHAR(100),
    category VARCHAR(100),
    amt DECIMAL(20, 15),
    first VARCHAR(100),
    last VARCHAR(100),
    gender CHAR(1),
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    lat DECIMAL(9, 6),
    longg DECIMAL(9, 6),
    city_pop INT,
    job VARCHAR(255),
    dob DATE,
    trans_num VARCHAR(255) NOT NULL,
    unix_time BIGINT,
    merch_lat DECIMAL(20, 13),
    merch_long DECIMAL(20, 13),
    is_fraud TINYINT(1)
);


## Load csv data into the table

LOAD DATA LOCAL INFILE '/home/student/Fraud_detection_project/data/fraudTrain.csv' 
INTO TABLE transactions 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS
;
