# Amazon_Vine_Analysis

# Deliverable 1

Per Deliverable 1 instructions:

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/challenge-schema-tables.png)

(1) Select a dataset from: https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt

(I chose shoes: (https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Shoes_v1_00.tsv.gz))

(2) Open Google Colab, and open the provided [Amazon_Reviews_ETL_starter_code.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL_starter_code.ipynb)

(3) Rename the starter code to [Amazon_Reviews_ETL.ipynb](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb)

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
(4) Follow the prompts within the starter code to complete an ETL (extract/transform/load) for the dataset chosen. The process entails starting a Spark session, reading in the dataset (https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Shoes_v1_00.tsv.gz), creating dataframes from the dataset.

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL%20-%2018-minute-execution-time.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/review_id_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/products_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/customers_table.png)

![image](https://github.com/michaelfoz/Amazon_Vine_Analysis/blob/main/Deliverable%201%20-%20pgAdmin%20screenshots/vine_table.png)

# Deliverable 2
# Deliverable 3
