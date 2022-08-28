# Amazon_Vine_Analysis

# Deliverable 1: Perform ETL on Amazon Product Reviews

Per Deliverable 1 instructions:

(1) Create a database in the [AWS RDS](https://aws.amazon.com/) RDS console (this will later be linked to my local machine's PostgreSQL/pgAdmin via code in [Amazon_Reviews_ETL.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb)).

(2) Open pgAdmin and use the provided [challenge_schema.sql](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/challenge_schema.sql) to create the following tables: 'customer table', 'products_table', 'review_id_table', and 'vine_table'.

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/challenge-schema-tables.png)

(3) Select a dataset from: https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt. (The dataset I chose was for "shoes" reviews: https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Shoes_v1_00.tsv.gz.)

(4) Open Google Colab, and open the provided [Amazon_Reviews_ETL_starter_code.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL_starter_code.ipynb)

(5) Rename the starter code to [Amazon_Reviews_ETL.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb)

(6) Follow the prompts that were provided within the [Amazon_Reviews_ETL_starter_code.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL_starter_code.ipynb) (which is now [Amazon_Reviews_ETL.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb)) to complete an ETL (extract/transform/load) for the "shoes" reviews dataset chosen. The process entails starting a Spark session, reading in the "shoes" reviews dataset (https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Shoes_v1_00.tsv.gz), creating/manipulating dataframes from the dataset, then uploading the data into the pgAdmin tables that were earlier created using the [challenge_schema.sql](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/challenge_schema.sql). 

The provided code to connect the AWS RDS database to my local PostgreSQL/pgAdmin is below, under "#Configure settings for RDS"; the code to then upload the dataframes created during the ETL proccess begin at "# Write review_id_df to the table in RDS":

```
# Configure settings for RDS
mode = "append"
jdbc_url="jdbc:postgresql://<endpoint>:5432/<database name>"
config = {"user":"postgres", 
          "password": "<password>", 
          "driver":"org.postgresql.Driver"}
          
# (Self-note: the configuration code above--when filled out--should NEVER be uploaded into GitHub.)
          
# Write review_id_df to the table in RDS
# review_id_df.write.jdbc(url=jdbc_url, table='review_id_table', mode=mode, properties=config)

# Write products_df to the table in RDS
# products_df.write.jdbc(url=jdbc_url, table='products_table', mode=mode, properties=config)

# Write customers_df to the table in RDS
# customers_df.write.jdbc(url=jdbc_url, table='customers_table', mode=mode, properties=config)

# Write vine_df to the table in RDS
# vine_df.write.jdbc(url=jdbc_url, table='vine_table', mode=mode, properties=config)
```

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL%20-%2018-minute-execution-time.png)

(Self-note: a very lengthy process--total of 18 minutes for just this one table.)

### Below are screenshots of queries performed in pgAdmin to confirm that the data was imported from the Google Colab Spark session ([Amazon_Reviews_ETL.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb)) to the earlier-created tables in pgAdmin: 'customer table', 'products_table', 'review_id_table', and 'vine_table'.

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/review_id_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/products_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/customers_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/vine_table.png)

# Deliverable 2: Determine Bias of Vine Reviews 
Analysis performed in [Vine_Review_Analysis.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.ipynb).

# Deliverable 3: Written Report

- How many Vine reviews and non-Vine reviews were there?

As seen in [Vine_Review_Analysis.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.ipynb) (at the bottom-most section of the file), there is a total number of 22 Vine reviews. In contrast, there is a total number of 26,987 non-Vine reviews.

- How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?

As seen in [Vine_Review_Analysis.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.ipynb) (at the bottom-most section of the file), there is a total number of 13 5-star reviews made by paid Vine members. In contrast, there is a total number of 14,475 5-star reviews made by unpaid non-Vine members.

- What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?

As seen in [Vine_Review_Analysis.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.ipynb) (at the bottom-most section of the file), the percentage of five-star reviews among Vine reviews is 59.1%. In contrast, the percentage of five-star reviews among non-Vine reviews is 53.6%. 

### Conclusion:

Given that approximately 60% (rounded up to the nearets tenth) of the total reviews for paid Vine members were 5-star reviews, while the total reviews for unpaid non-Vine members that were 5-star reviews was approximately 54% (rounded up to the nearest tenth), it can be declared that there is a bias when the reviews are made. In other words, there is a greater number of reviews that are 5-stars made by paid Vine members vs. the number of 5-star reviews made by the unpaid non-Vine members.
