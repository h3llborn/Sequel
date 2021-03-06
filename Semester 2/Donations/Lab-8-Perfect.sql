--1.
SELECT c.COMPANYNAME AS "Customer", REPLACE(POSTALCODE, ' ', '-') AS "Postal Code",  o.ORDERID as "Order #" 
FROM CUSTOMERS c
LEFT OUTER JOIN ORDERS o
ON c.CUSTOMERID = o.CUSTOMERID 
WHERE c.COUNTRY = 'France' OR c.COUNTRY = 'Canada'
ORDER BY ORDERID DESC;

--2.
SELECT RPAD(SUBSTR(s.COMPANYNAME, 1, 20), 20, '.') AS "Company", RPAD(SUBSTR(p.PRODUCTNAME, 1, 15), 15, ' ') AS "Product", LPAD(p.UNITPRICE, 7, '*') AS "Padded Price"
FROM SUPPLIERS s
LEFT OUTER JOIN PRODUCTS p
ON s.SUPPLIERID = p.SUPPLIERID 
WHERE LENGTH(p.UNITPRICE) > 3
ORDER BY UNITPRICE DESC;

--3.
SELECT COMPANYNAME, SUBSTR(PHONE, INSTR(PHONE, '(' ), INSTR(PHONE, ')' )) AS "Area Code"
FROM CUSTOMERS
WHERE SUBSTR(PHONE, INSTR(PHONE, '(' ), INSTR(PHONE, ')' )) IS NOT NULL
ORDER BY COMPANYNAME;

--4.
SELECT CONTACTNAME, CONTACTTITLE
FROM CUSTOMERS
WHERE SUBSTR(CONTACTTITLE, INSTR(CONTACTTITLE, ' ', 1, 1) + 1, INSTR(CONTACTTITLE, ' ', 1, 2) - INSTR(CONTACTTITLE, ' ', 1, 1) - 1) LIKE 'Sales'
OR SUBSTR(CONTACTTITLE, INSTR(CONTACTTITLE, ' ', 1, 1) + 1, LENGTH(CONTACTTITLE) - INSTR(CONTACTTITLE, ' ', 1, 1) + 1) LIKE 'Sales';

