# Reliance-Finance-Sales-Analysis-Using-PostgreSQL
📌 Project Overview

This project focuses on analyzing a Reliance Finance Sales dataset using SQL queries in PostgreSQL (pgAdmin4). The dataset captures various aspects of financial product sales, such as customer demographics, product details, sales representatives, transaction statuses, payment modes, feedback scores, and revenue generated.

The main objective of this project is to demonstrate end-to-end SQL proficiency, covering concepts from basic SELECT statements to advanced analytical queries involving window functions, aggregations and  conditional logic

This README provides:

A detailed dataset description
An overview of SQL concepts applied
A collection of business-driven SQL queries
Insights derived from the analysis

📂 Dataset Description

The dataset contains simulated sales transactions from Reliance Finance. Each record represents a transaction carried out by a customer with details on product type, payment mode, region, and sales representative performance.

Table Name: RelianceFinanceSales

Schema:

OrderID – Unique identifier for each transaction
OrderDate – Date of transaction (standardized as dd-mm-yyyy)
CustomerName – Name of the customer
Gender – Gender of the customer (Male/Female)
Region – Geographical region of the transaction
Branch – Branch where the transaction occurred
SalesRep – Name of the sales representative handling the transaction
ProductName – Financial product (e.g., Mutual Fund, Insurance, Loan)
SubCategory – More specific category under the product
Category – High-level classification (Investment / Others)
Quantity – Number of units purchased
TotalSale – Total value of the transaction
PaymentMode – Mode of payment (UPI, Credit Card, Debit Card, Cheque, etc.)
TransactionStatus – Status of transaction (Success, Failed, Pending)
FeedbackScore – Customer feedback score (1–5)

This dataset is designed to replicate a real-world financial sales environment, making it a valuable practice resource for data analysts and SQL developers.

🎯 Objectives of the Project

The primary aim is to showcase SQL skills applied to a real-world business case:
Data Exploration – Understanding the structure of transactions
Descriptive Analytics – Aggregations, averages, counts, and groupings.
Advanced SQL Analysis – Using window functions, ranking and  moving averages to extract deep business insights.

📊 Business Questions Answered

A variety of business-driven queries were written, ranging from basic to advanced, including:
1.Retrieve all sales records for Mutual Fund products in January 2023.
2.Find the total sales  done by each SalesRep?
3.Get the number of successful vs failed transactions.?
4.List the top 5 customers with the highest TotalSale.
5.Find the average FeedbackScore given for each PaymentMode?
6.Get the total sales done in each Region and order them from highest to lowest?
7.Find which Branch has the highest number of Pending transactions?
8.Get the most popular Product (based on total Quantity sold)
9.Find the average TotalSale per transaction for each Channel (Online, Offline, Agent).
10.Which Gender contributes more sales revenue across all Regions?
 11.Get the top 3 Customers by sales in each Branch.
12.Calculate the failure percentage of transactions per PaymentMode.
13.Find the Region with the highest average FeedbackScore for successful transactions only.
14.Show sales trend (day-wise) for Mutual Fund products in January 2023.
15.Find the Customer who purchased the highest Quantity overall (not sales amount).
16.Which Product SubCategory has the maximum failed transactions?

📈 Insights Derived

Through SQL analysis, some of the key insights derived are:
Certain branches experience higher transaction failures, hinting at operational issues.
Mutual Funds dominate January sales, especially in urban regions.
A small group of loyal customers drive significant revenue share.
SalesRep performance varies by region, with clear top performers.
Gender-wise contribution to revenue shows market segmentation opportunities.

🚀 How to Use This Project

Import the dataset into PostgreSQL.
Run the provided DDL statement to create the table schema.
Execute queries step by step in pgAdmin4.
Modify queries as per analysis needs.

📌 Conclusion

This project demonstrates how SQL can be applied in financial analytics to answer real-world business questions. The queries cover a full learning curve from beginner to advanced level, making this an excellent resource for:
SQL learners preparing for interviews
Data analysts practicing problem-solving
Business professionals exploring sales performance

