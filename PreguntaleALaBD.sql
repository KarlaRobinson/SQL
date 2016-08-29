cat << EOF > ~/.sqliterc
.headers on
.mode column
EOF

sqlite3 EssentialSQL.db
# SQLite version 3.8.5 2014-08-15 22:37:57
# Enter ".help" for usage hints.

# sqlite>

.tables
.schema Customers

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

# 1. El total de ordenes del cliente con el ID 3
SELECT COUNT(CustomerId) FROM Orders
WHERE CustomerId = 3;
#=> 6

# 2. El total de ordenes del cliente con el ContactName igual a 'Jim Wood'
SELECT COUNT(CustomerId) FROM Orders
WHERE CustomerId = (SELECT CustomerID FROM Customers WHERE ContactName = "Jim Wood");
#=> 6

# 3. El total de ordenes del cliente con CompanyName igual a 'Slots Carpet'
SELECT COUNT(CustomerId) FROM Orders
WHERE CustomerId = (SELECT CustomerID FROM Customers WHERE CompanyName = "Slots Carpet");

# 4. El total de ordenes de cada compañía ordenado de manera descendente
SELECT Customers.CompanyName,COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName
ORDER BY NumberOfOrders DESC;

# 5. El total de ordenes de cada compañía ordenado de manera ascendente
SELECT Customers.CompanyName,COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName
ORDER BY NumberOfOrders ASC;

# 6. La compañía con el mayor número de ordenes
SELECT CompanyName, MAX(NumberOfOrders)
FROM (SELECT Customers.CompanyName, COUNT(Orders.OrderID)
  AS NumberOfOrders FROM Orders
  LEFT JOIN Customers
  ON Orders.CustomerID = Customers.CustomerID
  GROUP BY CompanyName);

# 7. La suma total de piezas que fueron ordenadas por cada compañía.

 SELECT Customers.CompanyName, SUM(OrderDetails.Quantity)
  AS ItemsOrdered FROM OrderDetails
  LEFT JOIN Orders, Customers
  ON OrderDetails.OrderID = Orders.OrderID
  AND Customers.CustomerID = Orders.CustomerID
  GROUP BY CompanyName
  ORDER BY ItemsOrdered DESC;

# 8. El monto total en pesos de la orden con ID 4

SELECT OrderID, SUM(Quantity * UnitPrice) AS OrderSum
FROM OrderDetails
WHERE OrderID = 4;

# 9. El monto total en pesos de cada orden

SELECT OrderID, SUM(Quantity * UnitPrice) AS OrderSum
FROM OrderDetails
GROUP BY OrderID;

# 10. Total amount for each order having more than 1000
SELECT OrderID, OrderSum
FROM (SELECT OrderID, SUM(Quantity * UnitPrice) AS OrderSum
FROM OrderDetails
GROUP BY OrderID)
WHERE OrderSum >= 1000;

# 11. Total items in each order

SELECT OrderID, SUM(Quantity) AS QuantityOrdered
FROM OrderDetails
GROUP BY OrderID;








