USE northwind;

-- 1. What is the products name(s) of the most expensive products?
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice)
FROM Products);

-- 2. What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"
SELECT OrderID, ShipName, ShipAddress
FROM Orders
WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName LIKE "Federal Shipping");

-- 3. What are the order ids of the orders that ordered "Sasquatch Ale"? 
SELECT OrderID
FROM `Order Details`
WHERE ProductID = (SELECT ProductID FROM Products WHERE ProductName LIKE "%Sasquatch Ale%");

-- 4. What is the name of the employee that sold order 10266?
SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID = (SELECT EmployeeID FROM Orders WHERE OrderID = 10266);

-- 5. What is the name of the customer that bought order 10266
SELECT ContactName
WHERE CustomerID = (SELECT CustomerID FROM Orders WHERE OrderID = 10266);
