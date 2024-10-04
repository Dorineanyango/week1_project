use sales_db;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);


INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, Amount)
VALUES 
(1, 101, 1001, '2024-11-01', 150.00),
(2, 102, 1002, '2024-11-02', 200.00),
(3, 101, 1003, '2024-11-03', 300.00),
(4, 103, 1001, '2024-11-04', 250.00),
(5, 102, 1002, '2024-11-05', 175.00),
(6, 103, 1003, '2024-11-06', 400.00),
(7, 101, 1001, '2024-11-07', 350.00),
(8, 104, 1004, '2024-11-08', 500.00),
(9, 105, 1005, '2024-11-09', 600.00),
(10, 106, 1006, '2024-11-10', 700.00);
SELECT * FROM Sales;



--1). Finds the total sales for each product.
SELECT 
    ProductID, 
    SUM(Amount) AS TotalSales
FROM 
    Sales
GROUP BY 
    ProductID;
   
   
   
UPDATE Sales
SET SaleDate = CASE 
    WHEN SaleID = 2 THEN '2024-10-02'
    WHEN SaleID = 3 THEN '2024-10-03'
    ELSE SaleDate 
END
WHERE SaleID IN (2, 3);


   
--2. Calculate the Total Sales for Each month
SELECT 
    DATE_FORMAT(SaleDate, '%Y-%m') AS SaleMonth, 
    SUM(Amount) AS TotalSales
FROM 
    Sales
GROUP BY 
    SaleMonth
ORDER BY 
    SaleMonth;
   
   
   
--3. Identify Customers Who Made More Than 5 Purchases   
WITH PurchaseCounts AS (
    SELECT 
        CustomerID, 
        COUNT(*) AS PurchaseCount
    FROM 
        Sales
    GROUP BY 
        CustomerID
)
SELECT *
FROM PurchaseCounts
WHERE PurchaseCount > 5;
   





