cat << EOF > ~/.sqliterc
.headers on
.mode column
EOF

sqlite3 EssentialSQL.db

.tables
.schema Customers
.schema Orders
.schema OrderDetails

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

# 1. INSERT
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, State)
VALUES (6, "KarlaCompany", "Karla Robinson", "CEO", "123 Street", "CityCity", "OH");

INSERT INTO Orders (OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate)
VALUES (21, 6, "2012-01-04", "2012-01-09", "2012-01-05");

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity)
VALUES (48, 21, 3, 1.3, 50);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity)
VALUES (49, 21, 2, 0.25, 40);

# 2. Has una consulta para saber cuales son las ordenes de la empresa Floor Co.

SELECT OrderDetailID, Orders.OrderID, ProductID, UnitPrice, Quantity FROM Customers
LEFT JOIN Orders, OrderDetails
ON Orders.CustomerID = Customers.CustomerID
AND Orders.OrderID = OrderDetails.OrderID
WHERE CompanyName = "Floor Co.";

#cambiar a las ordenes de 2013 su valor de CustomerID

SELECT * FROM Orders WHERE OrderDate > "2013-01-01";
UPDATE Orders SET CustomerID = 6 WHERE OrderDate > "2013-01-01";
SELECT * FROM Orders WHERE OrderDate > "2013-01-01";
SELECT * FROM Customers;


# 3. Borrar OrderID 13, CustomerID 5
select count(*) from OrderDetails;
# 49
DELETE FROM OrderDetails
WHERE OrderID = 13;

select count(*) from OrderDetails;
# 48



select count(*) from Orders;
# 21
DELETE FROM Orders
WHERE OrderID = 13;

select count(*) from Orders;
# 20


select count(*) from Customers;
# 6
DELETE FROM Customers
WHERE CustomerID = 5;

select count(*) from Customers;
# 5
SELECT * FROM Customers;






