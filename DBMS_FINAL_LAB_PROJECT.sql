-- Database creation
CREATE DATABASE MobileShopBD;
USE MobileShopBD;
-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber BIGINT
);

-- Table Brands
CREATE TABLE Brands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName VARCHAR(100)
);
-- Table for Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Email VARCHAR(100),
    Phone BIGINT,
    Address VARCHAR(255)
);
-- Table: Products
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    BrandID INT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);
-- Purchases
CREATE TABLE Purchases (
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    EmployeeID INT,
    PurchaseDate DATE,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Table: Reviews
CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    ReviewText VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Suppliers
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    PhoneNumber BIGINT,
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Stock table
CREATE TABLE Stock (
    StockID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    Quantity INT,
    CostPrice DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Sales
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    EmployeeID INT,
    SaleDate DATE,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert data into Customers
INSERT INTO Customers (CustomerName, PhoneNumber)
VALUES
('John Doe', 1234567890),
('Jane Smith', 9876543210),
('Alice Johnson', 4567890123),
('Tom Cruise', 54545542121),
('Professor Snape', 54545542122),
('Albus Dumbledore', 54545542123),
('Bilbo Baggins', 54545542124),
('Lionel Messi', 54545542125),
('Kevin De Bruyne', 54545542126),
('Phil Foden', 54545542127),
('Steven Smith', 54545542128),
('Joe Root', 54545542129),
('Jos Buttler', 5454554210),
('Sheldon Cooper', 54545542111);

-- Insert data into Brands
INSERT INTO Brands (BrandName)
VALUES
('Samsung'),
('Apple'),
('Xiaomi');

-- Insert data into Employees
INSERT INTO Employees (EmployeeName, Email, Phone, Address)
VALUES
('Michael Scott', 'michael@example.com', 1234567890, '123 Main St'),
('Dwight Schrute', 'dwight@example.com', 9876543210, '456 Elm St'),
('Chandler Bing', 'chandler@example.com', 2345678901, '234 Elm St'),
('Joey Tribbiani', 'joey@example.com', 3456789012, '345 Elm St'),
('Ross Geller', 'ross@example.com', 4567890123, '456 Elm St'),
('Ted Mosby', 'ted@example.com', 5678901234, '567 Elm St'),
('Phil Dunphy', 'dunphy@example.com', 6789012345, '678 Elm St');



-- Insert data into Products
INSERT INTO Products (ProductName, BrandID)
VALUES
('Samsung Galaxy S21', 1),
('iPhone 12', 2),
('Xiaomi Mi 11', 3);

-- Insert data into Purchases
INSERT INTO Purchases (CustomerID, ProductID, EmployeeID, PurchaseDate, Quantity, TotalPrice)
VALUES
(1, 1, 1, '2024-05-01', 1, 1000.00),
(2, 2, 2, '2024-05-02', 2, 2000.00),
(3, 3, 3, '2024-05-03', 3, 3000.00),
(4, 1, 1, '2024-05-04', 1, 1000.00),
(5, 2, 2, '2024-05-05', 2, 2000.00),
(6, 3, 3, '2024-05-06', 3, 3000.00),
(7, 1, 1, '2024-05-07', 1, 1000.00),
(8, 2, 2, '2024-05-08', 2, 2000.00),
(9, 3, 3, '2024-05-09', 3, 3000.00),
(10, 1, 1, '2024-05-10', 1, 1000.00),
(11, 2, 2, '2024-05-11', 2, 2000.00),
(12, 3, 3, '2024-05-12', 3, 3000.00),
(13, 1, 1, '2024-05-13', 1, 1000.00),
(14, 2, 2, '2024-05-14', 2, 2000.00);


-- Insert data into Payments
INSERT INTO Payments (CustomerID, PaymentDate, Amount)
VALUES
(1, '2024-05-01', 1000.00),
(2, '2024-05-02', 2000.00),
(3, '2024-05-03', 3000.00),
(4, '2024-05-04', 4000.00),
(5, '2024-05-05', 5000.00),
(6, '2024-05-06', 6000.00),
(7, '2024-05-07', 7000.00),
(8, '2024-05-08', 8000.00),
(9, '2024-05-09', 9000.00),
(10, '2024-05-10', 10000.00),
(11, '2024-05-11', 11000.00),
(12, '2024-05-12', 12000.00),
(13, '2024-05-13', 13000.00),
(14, '2024-05-14', 14000.00);




-- Insert data into Reviews
INSERT INTO Reviews (CustomerID, ProductID, Rating, ReviewText)
VALUES
(1, 1, 5, 'Great phone!'),
(2, 2, 4, 'Good product, but expensive'),
(3, 3, 3, 'Average quality'),
(4, 1, 4, 'Satisfied with the purchase'),
(5, 2, 3, 'Not as expected'),
(6, 3, 2, 'Disappointed with the product'),
(7, 1, 5, 'Best phone ever!'),
(8, 2, 4, 'Happy with the purchase'),
(9, 3, 3, 'Could be better'),
(10, 1, 2, 'Not satisfied'),
(11, 2, 3, 'Average product'),
(12, 3, 4, 'Good quality'),
(13, 1, 5, 'Excellent phone!'),
(14, 2, 4, 'Value for money');

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierName, ContactPerson, PhoneNumber, Email, Address)
VALUES
('Supplier A', 'John Supplier', 1234567890, 'supplierA@example.com', '123 Supplier St'),
('Supplier B', 'Jane Supplier', 9876543210, 'supplierB@example.com', '456 Supplier St'),
('Supplier C', 'Jack Supplier', 2345678901, 'supplierC@example.com', '789 Supplier St'),
('Supplier D', 'Janet Supplier', 3456789012, 'supplierD@example.com', '1011 Supplier St');

-- Update supplier data
UPDATE Suppliers SET Address = 'New Address' WHERE SupplierID = 4;

-- Delete supplier data
DELETE FROM Suppliers WHERE SupplierName='Supplier D';

-- Select supplier data
SELECT * FROM Suppliers WHERE Email='supplierA@example.com';

-- Insert data into Stock
INSERT INTO Stock (ProductID, SupplierID, Quantity, CostPrice)
VALUES
(1, 1, 10, 800.00),
(2, 2, 15, 1200.00),
(3, 3, 20, 1000.00);

-- Insert data into Sales
INSERT INTO Sales (ProductID, EmployeeID, SaleDate, Quantity, TotalPrice)
VALUES
(1, 1, '2024-05-01', 1, 1000.00),
(2, 2, '2024-05-02', 2, 2000.00),
(3, 1, '2024-05-03', 3, 3000.00),
(1, 2, '2024-05-04', 4, 4000.00),
(2, 1, '2024-05-05', 5, 5000.00),
(3, 2, '2024-05-06', 6, 6000.00),
(1, 1, '2024-05-07', 7, 7000.00),
(2, 2, '2024-05-08', 8, 8000.00),
(3, 1, '2024-05-09', 9, 9000.00),
(1, 2, '2024-05-10', 10, 10000.00),
(2, 1, '2024-05-11', 11, 11000.00),
(3, 2, '2024-05-12', 12, 12000.00),
(1, 1, '2024-05-13', 13, 13000.00),
(2, 2, '2024-05-14', 14, 14000.00);


--Eikhan theke copy korbi 


-- Select data from tables
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Reviews;
SELECT * FROM Sales;
SELECT * FROM Employees;
SELECT * FROM Purchases;
SELECT * FROM Brands;
SELECT * FROM Products;
SELECT * FROM Purchases;
SELECT * FROM Payments;
SELECT * FROM Suppliers;
SELECT * FROM Stock;
SELECT * FROM Payments;
-- Inner join on Customers and Purchases
SELECT CustomerName, PhoneNumber, PurchaseDate, Quantity, TotalPrice 
FROM Customers INNER JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID 
ORDER BY TotalPrice DESC;

-- Inner join on Employees and Sales
SELECT EmployeeName, Email, Phone, Address, SaleDate, Quantity, TotalPrice 
FROM Employees 
INNER JOIN Sales ON Employees.EmployeeID = Sales.EmployeeID 
ORDER BY TotalPrice DESC;

-- Inner join for reviews
SELECT CustomerName, PhoneNumber, ProductName, Rating, ReviewText 
FROM Customers 
INNER JOIN Reviews ON Customers.CustomerID = Reviews.CustomerID 
INNER JOIN Products ON Products.ProductID = Reviews.ProductID;

--date wise Search--
SELECT p.CustomerID, c.CustomerName, c.PhoneNumber, p.PaymentDate, p.Amount
FROM Payments p
JOIN Customers c ON p.CustomerID = c.CustomerID
WHERE p.PaymentDate = '2024-05-11';
--Max() for most expensive mobile
Select Top 1 pr.TotalPrice, pdt.ProductName , pdt.ProductID
from Purchases pr Join Products pdt on pr.ProductID=pdt.ProductID where pr.TotalPrice=(
Select MAX(TotalPrice) from Purchases
)
--highest salesperson in a single day employee
Select s.EmployeeID, e.EmployeeName,e.Email,E.phone,E.Address,s.TotalPrice
from Sales s Join Employees e on s.EmployeeID=e.EmployeeID where s.TotalPrice=(
Select Max(TotalPrice) from Sales
)
--highest salesperson of all Time
SELECT e.EmployeeID,e.EmployeeName,SUM(s.TotalPrice) AS TotalAmount
FROM Sales s JOIN Employees e ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
ORDER BY TotalAmount DESC;


--- all the  customer payment details with date 
select c.CustomerName,c.PhoneNumber ,p.PaymentDate,p.Amount

from Customers c join Payments p on c.CustomerID=p.CustomerID

--Employee sales detailed
SELECT  e.EmployeeName, e.Phone, e.Email, e.Address, pdt.ProductName, pr.Quantity, pr.TotalPrice
FROM Purchases pr
INNER JOIN Employees e ON pr.EmployeeID = e.EmployeeID
INNER JOIN Products pdt ON pr.ProductID = pdt.ProductID;
--find by id

Select c.CustomerName,p.Amount from Customers c join Payments p

on c.CustomerID=p.CustomerID where p.CustomerID=2
--inbetween date search and date and amount wise search

select e.EmployeeName ,s.TotalPrice from Employees e JOIN Sales s on e.EmployeeID=s.EmployeeID
where s.SaleDate between '2024-05-03' and '2024-05-09'

--like  search 
SELECT * FROM Customers WHERE CustomerName LIKE 'J%';
