DROP VIEW VQ1;
--VQ1 
CREATE VIEW VQ1
AS
SELECT LPAD(productID,5) AS productIDC, RPAD(productName,26) AS productNameC, LPAD(TO_CHAR(unitPrice,'$9,999.99'),12) AS unitPriceC
FROM products 
WHERE unitPrice>(SELECT AVG(UnitPrice) FROM products)
WITH READ ONLY;

DROP VIEW VQ2;
--VQ2
CREATE VIEW VQ2
AS
SELECT o.OrderID, LPAD(TO_CHAR(o.OrderDate,'DD-MON-YY'),16) AS OrderDate, LPAD(TO_CHAR(o.ShippedDate,'DD-MON-YY'),16) AS ShippedDateOut, (SELECT c.companyName FROM Customers c WHERE c.CustomerID = o.CustomerID) AS Company
FROM Orders o 
WHERE o.ShippedDate = '10-FEB-07' OR o.ShippedDate = '13-FEB-07'
WITH READ ONLY;
