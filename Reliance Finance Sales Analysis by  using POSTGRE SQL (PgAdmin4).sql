CREATE TABLE Reliance
(
OrderID	VARCHAR(20),
OrderDate	DATE,
ProductName	VARCHAR(50),
Category	VARCHAR(50),
SubCategory	VARCHAR(50),
Quantity	INT,
UnitPrice	DECIMAL(10,2),
TotalSales	DECIMAL(10,2),
CustomerName VARCHAR(20),	
Gender	VARCHAR(10),
Age	INT,
Region	VARCHAR(10),
SalesRep VARCHAR(20),	
Country	VARCHAR(10),
Currency	VARCHAR(20),
Branch	VARCHAR(20),
PaymentMode	VARCHAR(20),
Channel	VARCHAR(20),
TransactionStatus	VARCHAR(20),
FeedbackScore INT
);

SELECT * FROM Reliance LIMIT 20 ;

SELECT TO_CHAR(OrderDate, 'DD-MM-YYYY') AS OrderDateFormatted
FROM Reliance;


-----Retrieve all sales records for Mutual Fund products in January 2023------
SELECT * FROM Reliance 
WHERE productname = 'Mutual Fund' 
AND 
orderdate BETWEEN '01-01-2023' AND '31-01-2023';

-----Find the total sales (SUM(TotalSale)) done by each SalesRep----

SELECT SalesRep,
 SUM(TotalSales) AS total_sales 
 FROM Reliance 
 GROUP BY SalesRep
 ORDER BY total_sales DESC ;

-----Get the number of successful vs failed transactions-----------------

SELECT transactionstatus,
    COUNT(*) AS transacation_count 
FROM Reliance 
WHERE transactionstatus IN ('Success','Failed')
GROUP BY transactionstatus;

-----List the top 5 customers with the highest TotalSale-------

SELECT customername,
    SUM(totalsales) AS total_Spent
FROM Reliance 
GROUP BY customername 
ORDER BY total_Spent
LIMIT 5;

----------------Find the average FeedbackScore given for each PaymentMode-----

SELECT PaymentMode,
  AVG(Feedbackscore) AS avg_feedbackscore 
FROM Reliance
GROUP BY PaymentMode
ORDER BY avg_feedbackscore;

-------Get the total sales done in each Region and order them from highest to lowest-----

SELECT region,
 SUM(totalsales) AS total_Sales
FROM Reliance
GROUP BY region
ORDER BY total_Sales DESC;

--------Find which Branch has the highest number of Pending transactions------

SELECT branch,
   COUNT(*) AS pending_count 
FROM Reliance 
WHERE transactionstatus = 'Pending'
GROUP BY branch
ORDER BY pending_count DESC
LIMIT 1 ;

---------Get the most popular Product (based on total Quantity sold)----------

SELECT ProductName,
  SUM(Quantity) AS total_quantity_sold
FROM Reliance 
GROUP BY ProductName
ORDER BY total_quantity_sold DESC;

-------------------Find the average TotalSale per transaction for each Channel (Online, Offline, Agent)----

SELECT Channel,
  AVG(TotalSales) AS avg_total_sales 
FROM Reliance 
GROUP BY Channel
ORDER BY avg_total_sales DESC ;

----------Which Gender contributes more sales revenue across all Regions?----

SELECT Gender,
   SUM (TotalSales) AS total_Sales
FROM Reliance
GROUP BY Gender
ORDER BY total_Sales DESC ;

------Get the top 3 Customers by sales in each Branch----------

WITH customersales AS (
   SELECT Branch,
          CustomerName,
		  SUM(TotalSales) AS total_Sales,
		  RANK() OVER(PARTITION BY Branch ORDER BY SUM(TotalSales) DESC) AS rnk
	FROM Reliance
	GROUP BY Branch,CustomerName	  
)
 SELECT Branch,CustomerName,total_Sales
 FROM customersales 
 WHERE rnk <= 3
 ORDER BY Branch,total_Sales DESC;

------Calculate the failure percentage of transactions per PaymentMode?------

SELECT PaymentMode,
     COUNT(*) AS transactions,
	 SUM(CASE WHEN TransactionStatus = 'Failed' THEN 1 ELSE 0 END) AS Failedtransaction,
	ROUND( (SUM(CASE WHEN TransactionStatus = 'Failed' THEN 1 ELSE 0 END)::decimal 
             / COUNT(*) ) * 100, 2) AS FailurePercentage
  FROM Reliance
  GROUP BY PaymentMode
  ORDER BY FailurePercentage DESC;

------Find the Region with the highest average FeedbackScore for successful transactions only?------

SELECT Region,
    AVG(FeedbackScore) AS avg_feedbackscore
	FROM Reliance
	WHERE TransactionStatus = 'Successful'
	GROUP BY Region
	ORDER BY avg_feedbackscore 
	LIMIT 1 ;

----------------Show sales trend (day-wise) for Mutual Fund products in January 2023---------

SELECT OrderDate,
  SUM(TotalSales) AS daily_sales 
FROM Reliance
WHERE ProductName = 'Mutual Fund'
        AND OrderDate BETWEEN '01-01-2023' AND '31-01-2023'
GROUP BY OrderDate
ORDER BY OrderDate;

------------------Find the Customer who purchased the highest Quantity overall (not sales amount)------

SELECT CustomerName, 
   SUM(Quantity) AS total_quantity
FROM Reliance 
GROUP BY CustomerName
ORDER BY total_quantity DESC;

------------------




 
