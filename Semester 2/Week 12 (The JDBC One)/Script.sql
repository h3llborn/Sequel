--VQ1 
CREATE VIEW VQ1
AS
SELECT RPAD(LENGTH(productID, productName, unitPrice
FROM products 
WHERE unitPrice>(SELECT AVG(UnitPrice) FROM products)
WITH READ ONLY;

--VQ2
CREATE VIEW VQ2
AS
SELECT o.OrderID, o.OrderDate, o.ShippedDate, (SELECT c.companyName FROM Customers c WHERE c.CustomerID = o.CustomerID) AS 'Company'
FROM Orders o 
WHERE o.ShippedDate = '10-FEB-07' OR o.ShippedDate = '13-FEB-07'
WITH READ ONLY;

