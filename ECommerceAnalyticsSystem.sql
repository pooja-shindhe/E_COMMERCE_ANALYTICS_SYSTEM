create database ECommerceAnalyticsSystem;

use ECommerceAnalyticsSystem

-- show tables; 
CREATE TABLE customers(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE categories(
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);

CREATE TABLE brands(
    BrandID INT PRIMARY KEY AUTO_INCREMENT,
    BrandName VARCHAR(100)
);

CREATE TABLE products(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    BrandID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,

    FOREIGN KEY(CategoryID)
    REFERENCES categories(CategoryID),

    FOREIGN KEY(BrandID)
    REFERENCES brands(BrandID)
);

CREATE TABLE sellers(
    SellerID INT PRIMARY KEY AUTO_INCREMENT,
    SellerName VARCHAR(100),
    City VARCHAR(50),
    Rating DECIMAL(2,1)
);

CREATE TABLE orders(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),

    FOREIGN KEY(CustomerID)
    REFERENCES customers(CustomerID)
);

CREATE TABLE orderdetails(
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);


CREATE TABLE payments(
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    AmountPaid DECIMAL(10,2),
    PaymentMethod VARCHAR(30),
    PaymentDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE shipping(
    ShippingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    CourierName VARCHAR(50),
    ShippingStatus VARCHAR(30),
    DeliveryDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE reviews(
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    ReviewText TEXT,

    FOREIGN KEY(CustomerID)
    REFERENCES customers(CustomerID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);

CREATE TABLE returns(
    ReturnID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ReturnReason TEXT,
    ReturnDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE warehouses(
    WarehouseID INT PRIMARY KEY AUTO_INCREMENT,
    WarehouseName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE inventory(
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    WarehouseID INT,
    ProductID INT,
    Stock INT,

    FOREIGN KEY(WarehouseID)
    REFERENCES warehouses(WarehouseID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);

CREATE TABLE coupons(
    CouponID INT PRIMARY KEY AUTO_INCREMENT,
    CouponCode VARCHAR(50),
    DiscountPercent INT
);

CREATE TABLE employees(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);




-- insert queries


INSERT INTO categories(CategoryName) VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Sports'),
('Beauty'),
('Furniture'),
('Toys'),
('Groceries'),
('Automotive');


INSERT INTO brands(BrandName) VALUES
('Samsung'),
('Apple'),
('Nike'),
('Adidas'),
('LG'),
('Sony'),
('Puma'),
('Dell'),
('HP'),
('Lenovo'),
('Boat'),
('OnePlus'),
('Philips'),
('Bajaj'),
('Godrej'),
('Whirlpool'),
('Canon'),
('Casio'),
('Reebok'),
('Titan');


INSERT INTO sellers(SellerName,City,Rating) VALUES
('TechWorld','Chennai',4.5),
('FashionHub','Mumbai',4.2),
('HomeStore','Delhi',4.7),
('BookMart','Bangalore',4.1),
('SportZone','Hyderabad',4.6),
('ElectroMax','Pune',4.3),
('GadgetPoint','Kolkata',4.4),
('StyleStreet','Ahmedabad',4.5),
('MegaStore','Jaipur',4.2),
('TrendyKart','Lucknow',4.0),
('QuickBuy','Chennai',4.8),
('UrbanShop','Mumbai',4.1),
('SmartDeals','Delhi',4.3),
('BestChoice','Bangalore',4.5),
('PrimeSeller','Hyderabad',4.7),
('ShopEasy','Pune',4.2),
('BuyMore','Kolkata',4.4),
('MarketKing','Ahmedabad',4.6),
('RetailHub','Jaipur',4.3),
('ValueMart','Lucknow',4.5);


INSERT INTO warehouses(WarehouseName,Location) VALUES
('North Warehouse','Delhi'),
('South Warehouse','Chennai'),
('West Warehouse','Mumbai'),
('East Warehouse','Kolkata'),
('Central Warehouse','Hyderabad'),
('Pune Warehouse','Pune'),
('Bangalore Warehouse','Bangalore'),
('Jaipur Warehouse','Jaipur'),
('Ahmedabad Warehouse','Ahmedabad'),
('Lucknow Warehouse','Lucknow');


INSERT INTO coupons(CouponCode,DiscountPercent) VALUES
('SAVE10',10),
('SAVE15',15),
('SAVE20',20),
('SAVE25',25),
('WELCOME10',10),
('WELCOME20',20),
('NEWUSER15',15),
('FESTIVE10',10),
('FESTIVE20',20),
('FESTIVE30',30),
('SUMMER15',15),
('WINTER20',20),
('BIGSALE25',25),
('FLASH10',10),
('MEGA30',30);


INSERT INTO employees(EmployeeName,Department,Salary) VALUES
('Amit Kumar','Sales',55000),
('Neha Sharma','Support',50000),
('Rahul Singh','Logistics',60000),
('Priya Verma','Finance',65000),
('Arjun Rao','HR',52000),
('Sneha Patel','Sales',56000),
('Vikram Gupta','Support',51000),
('Pooja Nair','Finance',68000),
('Karan Mehta','Logistics',59000),
('Rohit Jain','HR',53000),
('Anjali Shah','Sales',57000),
('Deepak Roy','Support',50000),
('Sanjay Das','Finance',70000),
('Nisha Reddy','HR',54000),
('Manoj Kumar','Logistics',61000),
('Asha Devi','Sales',55000),
('Rakesh Sharma','Support',52000),
('Kavya Iyer','Finance',67000),
('Harish Patel','HR',56000),
('Vivek Singh','Logistics',62000),
('Meena Rao','Sales',58000),
('Gopal Verma','Support',51000),
('Suresh Nair','Finance',69000),
('Divya Sharma','HR',55000),
('Ajay Kumar','Logistics',63000);


SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM brands;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM warehouses;
SELECT COUNT(*) FROM coupons;
SELECT COUNT(*) FROM employees;

show tables;
SELECT * FROM categories;
SELECT * FROM brands;
SELECT * FROM sellers;
SELECT * FROM warehouses;
SELECT * FROM coupons;
SELECT * FROM employees;


-- SELECT VERSION();

-- INSERTION USING STORED PROCEDURE
DELIMITER //

CREATE PROCEDURE GenerateCustomers()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 20000 DO

        INSERT INTO customers
        (
            CustomerName,
            Gender,
            Age,
            Email,
            Phone,
            City,
            State,
            RegistrationDate
        )
        VALUES
        (
            CONCAT('Customer_',i),
            IF(MOD(i,2)=0,'Male','Female'),
            FLOOR(18 + RAND()*50),
            CONCAT('customer',i,'@gmail.com'),
            CONCAT('98',LPAD(i,8,'0')),
            ELT(1+MOD(i,5),
                'Chennai',
                'Mumbai',
                'Delhi',
                'Bangalore',
                'Hyderabad'),
            ELT(1+MOD(i,5),
                'Tamil Nadu',
                'Maharashtra',
                'Delhi',
                'Karnataka',
                'Telangana'),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;
END//

DELIMITER ;

CALL GenerateCustomers();

-- DROP PROCEDURE IF EXISTS GenerateCustomers; 


DELIMITER //

CREATE PROCEDURE GenerateProducts()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 5000 DO

        INSERT INTO products
        (
            ProductName,
            CategoryID,
            BrandID,
            Price,
            StockQuantity
        )
        VALUES
        (
            CONCAT('Product_',i),
            FLOOR(1 + RAND()*10),
            FLOOR(1 + RAND()*20),
            ROUND(500 + RAND()*100000,2),
            FLOOR(50 + RAND()*500)
        );

        SET i = i + 1;

    END WHILE;

END//


DELIMITER ;

call GenerateProducts()

DELIMITER //

CREATE PROCEDURE GenerateOrders()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO orders
        (
            CustomerID,
            OrderDate,
            OrderStatus
        )
        VALUES
        (
            FLOOR(1 + RAND()*20000),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY),
            ELT(
                FLOOR(1 + RAND()*4),
                'Delivered',
                'Pending',
                'Shipped',
                'Cancelled'
            )
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateOrders();


DELIMITER //

CREATE PROCEDURE GenerateOrderDetails()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 300000 DO

        INSERT INTO orderdetails
        (
            OrderID,
            ProductID,
            Quantity,
            UnitPrice
        )
        VALUES
        (
            FLOOR(1 + RAND()*100000),
            FLOOR(1 + RAND()*5000),
            FLOOR(1 + RAND()*5)+1,
            ROUND(500 + RAND()*100000,2)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateOrderDetails();

DELIMITER //

CREATE PROCEDURE GeneratePayments()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO payments
        (
            OrderID,
            AmountPaid,
            PaymentMethod,
            PaymentDate
        )
        VALUES
        (
            i,
            ROUND(1000 + RAND()*150000,2),
            ELT(
                FLOOR(1 + RAND()*4),
                'UPI',
                'Credit Card',
                'Debit Card',
                'Net Banking'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GeneratePayments();



DELIMITER //

CREATE PROCEDURE GenerateShipping()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO shipping
        (
            OrderID,
            CourierName,
            ShippingStatus,
            DeliveryDate
        )
        VALUES
        (
            i,
            ELT(
                FLOOR(1 + RAND()*5),
                'BlueDart',
                'DTDC',
                'Delhivery',
                'Ecom Express',
                'XpressBees'
            ),
            ELT(
                FLOOR(1 + RAND()*4),
                'Delivered',
                'In Transit',
                'Pending',
                'Cancelled'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateShipping();



DELIMITER //

CREATE PROCEDURE GenerateReviews()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 50000 DO

        INSERT INTO reviews
        (
            CustomerID,
            ProductID,
            Rating,
            ReviewText
        )
        VALUES
        (
            FLOOR(1 + RAND()*20000),
            FLOOR(1 + RAND()*5000),
            FLOOR(1 + RAND()*5),
            CONCAT('Review_',i)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateReviews();




DELIMITER //

CREATE PROCEDURE GenerateReturns()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 20000 DO

        INSERT INTO returns
        (
            OrderID,
            ReturnReason,
            ReturnDate
        )
        VALUES
        (
            FLOOR(1 + RAND()*100000),
            ELT(
                FLOOR(1 + RAND()*5),
                'Damaged Product',
                'Wrong Item',
                'Late Delivery',
                'Poor Quality',
                'Customer Cancelled'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateReturns();




DELIMITER //

CREATE PROCEDURE GenerateInventory()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO

        INSERT INTO inventory
        (
            WarehouseID,
            ProductID,
            Stock
        )
        VALUES
        (
            FLOOR(1 + RAND()*10),
            FLOOR(1 + RAND()*5000),
            FLOOR(10 + RAND()*1000)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateInventory();

-- show tables;
-- SELECT * FROM categories;
-- SELECT * FROM brands;
-- SELECT * FROM sellers;
-- SELECT * FROM warehouses;
-- SELECT * FROM coupons;
-- SELECT * FROM employees;

SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM brands;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM warehouses;
SELECT COUNT(*) FROM coupons;
SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM orderdetails;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM shipping;
SELECT COUNT(*) FROM reviews;
SELECT COUNT(*) FROM returns;
SELECT COUNT(*) FROM inventory;




-- -----------------------------------------------------------------------------------------------------------------------

-- ----------------------BASIC LEVEL
-- 1. Display all customer details.
SELECT * FROM customers;

-- 2. Find customers above 60 years of age.
SELECT * FROM customers WHERE Age > 60;

-- 3. Find customers whose name starts with 'A'.
SELECT * FROM customers WHERE CustomerName LIKE 'A%';

-- 4. Find products priced between ₹10,000 and ₹50,000.
SELECT * FROM products WHERE Price BETWEEN 10000 AND 50000;

-- 5. Display orders with status 'Delivered' or 'Shipped'.
SELECT * FROM orders WHERE OrderStatus IN ('Delivered','Shipped');

-- 6. Display distinct customer cities.
SELECT DISTINCT City FROM customers;

-- 7. Display the top 10 highest-priced products.
SELECT * FROM products ORDER BY Price DESC LIMIT 10;

-- 8. Find the total number of customers in each city.
SELECT City, COUNT(*) AS TotalCustomers
FROM customers
GROUP BY City;

-- 9. Find the total revenue received.
SELECT SUM(AmountPaid) AS TotalRevenue FROM payments;

-- 10. Find the average product price.
SELECT AVG(Price) AS AveragePrice FROM products;

-- 11. Find the highest and lowest product prices.
SELECT MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice
FROM products;

-- 12. Find customers registered this year.
SELECT * FROM customers WHERE YEAR(RegistrationDate) = YEAR(CURDATE());

-- 13. Find customers who have not placed any orders.
SELECT * FROM customers WHERE CustomerID NOT IN
(
    SELECT CustomerID
    FROM orders
);

-- 14. Find the number of products available in each category.
SELECT CategoryID, COUNT(*) AS TotalProducts FROM products
GROUP BY CategoryID;

-- 15. Find the total available stock across all warehouses.
SELECT SUM(Stock) AS TotalStock FROM inventory;




-- -----------INTERMEDIATE LEVEL
-- 16. Display customer names along with their order details.
SELECT c.CustomerID,c.CustomerName,o.OrderID,o.OrderDate,o.OrderStatus FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID;

-- Concept: INNER JOIN

-- 17. Display product names along with their category names.
SELECT p.ProductName,c.CategoryName FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID;

-- Concept: INNER JOIN

-- 18. Display product names along with their brand names.
SELECT  p.ProductName, b.BrandName FROM products p
INNER JOIN brands b ON p.BrandID = b.BrandID;

-- Concept: INNER JOIN

-- 19. Find the total revenue generated by each customer.
SELECT c.CustomerID, c.CustomerName,SUM(p.AmountPaid) AS TotalRevenue
FROM customers c 
INNER JOIN orders o ON c.CustomerID = o.CustomerID
INNER JOIN payments p ON o.OrderID = p.OrderID
GROUP BY c.CustomerID,c.CustomerName;

-- Concept: INNER JOIN, GROUP BY, SUM()

-- 20. Find products that have never been sold.
SELECT p.ProductID, p.ProductName FROM products p
LEFT JOIN orderdetails od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;
-- Concept: LEFT JOIN, IS NULL

-- 21. Find customers who placed more than one order.
SELECT CustomerID, COUNT(OrderID) AS TotalOrders FROM orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1;
-- Concept: HAVING

-- 22. Find the total sales for each category.
SELECT c.CategoryName,SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM categories c
INNER JOIN products p ON c.CategoryID = p.CategoryID
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName;

-- Concept: INNER JOIN, GROUP BY

-- 23. Display monthly sales.
SELECT
    YEAR(PaymentDate) AS Year,
    MONTH(PaymentDate) AS Month,
    SUM(AmountPaid) AS Revenue
FROM payments
GROUP BY
    YEAR(PaymentDate),
    MONTH(PaymentDate)
ORDER BY Year, Month;
-- Concept: GROUP BY, YEAR(), MONTH()

-- 24. Display customer and employee names.
SELECT CustomerName AS Name
FROM customers
UNION
SELECT EmployeeName
FROM employees;
-- Concept: UNION

-- 25. Display customer and employee names including duplicates.
SELECT CustomerName AS Name
FROM customers
UNION ALL
SELECT EmployeeName
FROM employees;
-- Concept: UNION ALL

-- 26. Find customers who have placed at least one order.
SELECT * FROM customers c
WHERE EXISTS
(
SELECT 1 FROM orders o WHERE o.CustomerID = c.CustomerID
);
-- Concept: EXISTS

-- 27. Find customers who have never placed an order.
SELECT * FROM customers c
WHERE NOT EXISTS
(
    SELECT 1 FROM orders o WHERE o.CustomerID = c.CustomerID
);
-- Concept: NOT EXISTS

-- 28. Find products frequently purchased together.
SELECT
    od1.ProductID AS ProductA,
    od2.ProductID AS ProductB,
    COUNT(*) AS PurchaseCount
FROM orderdetails od1
INNER JOIN orderdetails od2 ON od1.OrderID = od2.OrderID
AND od1.ProductID < od2.ProductID
GROUP BY
    od1.ProductID,
    od2.ProductID;
-- Concept: SELF JOIN

-- 29. Create a view to display customer revenue.

CREATE VIEW vw_customer_revenue AS
SELECT c.CustomerID,c.CustomerName,SUM(p.AmountPaid) AS Revenue
FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID
INNER JOIN payments p ON o.OrderID = p.OrderID
GROUP BY c.CustomerID,c.CustomerName;
-- Concept: VIEW

-- 30. Create a view to display product sales.
CREATE VIEW vw_product_sales AS
SELECT  p.ProductID, p.ProductName, SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM products p
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
GROUP BY  p.ProductID, p.ProductName;

-- Concept: VIEW





-- --------------------ADVANCED SQL (STORED PROCEDURE, TRIGGERS)
-- 31. Find Products Costing More Than the Average Price
SELECT * FROM products
WHERE Price > (
    SELECT AVG(Price) FROM products
);
-- Concept: Subquery

-- 32. Find Customers Who Spent More Than the Average Customer Spending
SELECT c.CustomerID,c.CustomerName,SUM(p.AmountPaid) AS TotalSpent
FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID
INNER JOIN payments p ON o.OrderID = p.OrderID
GROUP BY  c.CustomerID, c.CustomerName
HAVING SUM(p.AmountPaid) >(
    SELECT AVG(CustomerSpend) FROM ( SELECT SUM(AmountPaid) AS CustomerSpend FROM payments
                                    GROUP BY OrderID) AS AvgSpend
                           );
                           
-- Concept: Nested Subquery

-- 33. Find Top 5 Customers by Revenue Using CTE
WITH CustomerRevenue AS
(
    SELECT  c.CustomerID,  c.CustomerName, SUM(p.AmountPaid) AS Revenue
    FROM customers c
    INNER JOIN orders o ON c.CustomerID = o.CustomerID
    INNER JOIN payments p ON o.OrderID = p.OrderID
    GROUP BY c.CustomerID, c.CustomerName
)

SELECT * FROM CustomerRevenue
ORDER BY Revenue DESC LIMIT 5;
-- Concept: CTE

-- 34. Rank Products Based on Revenue
SELECT ProductID, SUM(Quantity * UnitPrice) AS Revenue,
    RANK() OVER  ( ORDER BY SUM(Quantity * UnitPrice) DESC ) AS ProductRank
FROM orderdetails
GROUP BY ProductID;
-- Concept: Window Function, RANK()

-- 35. Find the Second Highest Spending Customer
SELECT * FROM 
( 
    SELECT c.CustomerID, c.CustomerName,SUM(p.AmountPaid) AS TotalSpent,
    DENSE_RANK() OVER ( ORDER BY SUM(p.AmountPaid) DESC) AS RankNo
    FROM customers c
    INNER JOIN orders o ON c.CustomerID = o.CustomerID
    INNER JOIN payments p ON o.OrderID = p.OrderID
    GROUP BY c.CustomerID, c.CustomerName
) x
WHERE RankNo = 2;
-- Concept: DENSE_RANK()

-- 36. Display Running Revenue Month-wise
SELECT
    YEAR(PaymentDate) AS YearNo,
    MONTH(PaymentDate) AS MonthNo,
    SUM(AmountPaid) AS Revenue,

    SUM(SUM(AmountPaid))
    OVER
    (
        ORDER BY YEAR(PaymentDate),
                 MONTH(PaymentDate)
    ) AS RunningRevenue

FROM payments

GROUP BY
YEAR(PaymentDate),
MONTH(PaymentDate);
-- Concept: SUM() OVER()

-- 37. Rank Products Within Each Category
SELECT  p.CategoryID, p.ProductID,SUM(od.Quantity * od.UnitPrice) AS Revenue,
    RANK() OVER ( PARTITION BY p.CategoryID ORDER BY SUM(od.Quantity * od.UnitPrice) DESC) AS CategoryRank
FROM products p
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
GROUP BY p.CategoryID,p.ProductID;
-- Concept: PARTITION BY

-- 38. Display Month-over-Month Sales Growth
WITH MonthlySales AS
(
    SELECT YEAR(PaymentDate) AS Yr, MONTH(PaymentDate) AS Mn, SUM(AmountPaid) AS Revenue
    FROM payments
    GROUP BY   YEAR(PaymentDate), MONTH(PaymentDate)
)
SELECT Yr, Mn, Revenue,
LAG(Revenue) OVER(ORDER BY Yr,Mn) PreviousRevenue
FROM MonthlySales;
-- Concept: LAG()

-- 39. Categorize Customers Based on Revenue
SELECT CustomerID,CustomerName,Revenue,
CASE
WHEN Revenue > 100000 THEN 'Platinum'
WHEN Revenue > 50000 THEN 'Gold'
WHEN Revenue > 20000 THEN 'Silver'
ELSE 'Bronze'
END AS CustomerCategory
FROM
(
SELECT
c.CustomerID,
c.CustomerName,
SUM(p.AmountPaid) AS Revenue
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID
INNER JOIN payments p
ON o.OrderID = p.OrderID
GROUP BY
c.CustomerID,
c.CustomerName
) x;
-- Concept: CASE

-- 40. Create Stored Procedure to Get Customer Orders
DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER //
CREATE PROCEDURE GetCustomerOrders
(
    IN p_customerid INT
)
BEGIN
SELECT * FROM orders
WHERE CustomerID = p_customerid;
END //
DELIMITER ;
CALL GetCustomerOrders(101);

-- Concept: Stored Procedure (Input Parameter)

-- 41. Create Stored Procedure to Display Monthly Sales
DROP PROCEDURE IF EXISTS MonthlySalesReport;
DELIMITER //
CREATE PROCEDURE MonthlySalesReport()
BEGIN
SELECT
YEAR(PaymentDate) YearNo,
MONTH(PaymentDate) MonthNo,
SUM(AmountPaid) Revenue
FROM payments
GROUP BY YEAR(PaymentDate),MONTH(PaymentDate);
END //
DELIMITER ;

CALL MonthlySalesReport();

-- Concept: Stored Procedure

-- 42. Create Stored Procedure to Display Top 10 Customers
DROP PROCEDURE IF EXISTS TopCustomers;
DELIMITER //
CREATE PROCEDURE TopCustomers()
BEGIN
SELECT c.CustomerID,c.CustomerName,SUM(p.AmountPaid) Revenue 
FROM customers c
INNER JOIN orders o
ON c.CustomerID=o.CustomerID
INNER JOIN payments p
ON o.OrderID=p.OrderID
GROUP BY
c.CustomerID,
c.CustomerName
ORDER BY Revenue DESC
LIMIT 10;
END //
DELIMITER ;

CALL TopCustomers();
-- Concept: Stored Procedure

-- 43. Create BEFORE INSERT Trigger to Validate Payment
DELIMITER //
CREATE TRIGGER ValidatePayment
BEFORE INSERT
ON payments
FOR EACH ROW
BEGIN
IF NEW.AmountPaid <=0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Payment amount must be greater than zero';
END IF;
END //
DELIMITER ;

-- Concept: BEFORE INSERT Trigger

-- 44. Create AFTER INSERT Trigger to Update Inventory
DELIMITER //
CREATE TRIGGER UpdateInventory
AFTER INSERT
ON orderdetails
FOR EACH ROW
BEGIN
UPDATE inventory
SET Stock = Stock - NEW.Quantity
WHERE ProductID = NEW.ProductID;
END //
DELIMITER ;
-- Concept: AFTER INSERT Trigger

-- 45. Create BEFORE DELETE Trigger to Prevent Customer Deletion
DELIMITER //
CREATE TRIGGER PreventCustomerDelete
BEFORE DELETE
ON customers
FOR EACH ROW
BEGIN
IF EXISTS
(
SELECT 1
FROM orders
WHERE CustomerID=OLD.CustomerID
)
THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Customer has orders. Deletion not allowed.';
END IF;
END //
DELIMITER ;
-- Concept: BEFORE DELETE Trigger



