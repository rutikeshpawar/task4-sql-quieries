CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE sales_data (
TransactionNo INT,
ProductNo INT,
ProductName VARCHAR(255),
Price DOUBLE,
Quantity DOUBLE,
CustomerNo INT,
Country VARCHAR(50)
ReturnFlag VARCHAR(50)
Date DATETIME,
);

-- IMPORT VERIFICATION
SELECT * FROM sales_data LIMIT 10;

-- Count rows
SELECT COUNT(*) AS count_rows FROM sales_data;

-- INDEXING
CREATE INDEX idx_transaction ON sales_data(TransactionNo);
CREATE INDEX idx_customer ON sales_data(CustomerNo);
CREATE INDEX idx_date ON sales_data(Date);
CREATE INDEX idx_country ON sales_data(Country);


# 1. Total Sales by Country
SELECT Country, ROUND(SUM(Price * Quantity), 2) AS Total_Sales
FROM Sales_data
GROUP BY Country
ORDER BY Total_sales DESC;

#2 total sales by month
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month,
	SUM(Price*Quantity) AS TotalSales
FROM sales_data
GROUP BY Month
ORDER BY Month;


#3 Products with the most returns
SELECT ProductName, COUNT(*) AS ReturnCount
FROM sales_data
WHERE ReturnFlag = TRUE
GROUP BY ProductName
ORDER BY ReturnCount DESC
LIMIT 10;

#4 Top 10 selling products
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM sales_data
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 10;


#5 Sales Filtered by country and date range
SELECT * FROM sales_data
WHERE Country = 'United Kingdom'
AND Date BETWEEN '2019-01-01' AND '2019-12-31';

#6 Total Sales
SELECT 
    ROUND(SUM(Price * Quantity), 2) AS Total_Sales
FROM sales_data;



