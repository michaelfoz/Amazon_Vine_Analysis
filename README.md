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

### Below are screenshots of queries performed in pgAdmin to confirm that the data was imported to the earlier-created tables: 'customer table', 'products_table', 'review_id_table', and 'vine_table'.

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/review_id_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/products_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/customers_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/vine_table.png)

# Deliverable 2: Determine Bias of Vine Reviews 
# Deliverable 3
