-- Module 16 Challenge
-- This challenge_schema.sql file downloaded per Deliverable 1 instructions (step 4)
-- Per Challenge instructions, use this file to run a new query in pgAdmin(PostgreSQL)
-- to create the following tables: 
--(1) customer table, (2) products_table, (3) review_id_table, (4) vine table [all tables below]

CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the format yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);