/*
	Submission Format:
	In a word document, for each  question, provide your  sql query and it’s  output.
    If you  faced any difficulty with a query, describe the difficulty and how you overcame it 
    (link to a google search, youtubevideo, class notes...)
*/

USE CHAPTER2HW;

-- 1.Show all data in each of the tables(5points)
SELECT * FROM CUSTOMER, SALE, SALE_ITEM, ITEM;

-- 2.List the LastName, FirstName, and Phone of all customers(5points)
SELECT LASTNAME, FIRSTNAME, PHONE FROM CUSTOMER;

-- 3.List the LastName, FirstName, and Phone for all customers with a FirstName of ‘John’(5points)
SELECT LASTNAME, FIRSTNAME, PHONE FROM CUSTOMER WHERE FIRSTNAME = 'JOHN';

-- 4.List the LastName, FirstName, Phone, SaleDate, and Total of all sales in excess of $100.00(5 points)
SELECT LASTNAME, FIRSTNAME, PHONE, SALEDATE, TOTAL FROM CUSTOMER, SALE WHERE SALE.TOTAL > 100;

-- 5.List the LastName, FirstName, and Phone  of all  customers  whose last  name includes the characters ’ne’.(5 points)
SELECT LASTNAME, FIRSTNAME, PHONE FROM CUSTOMER WHERE LASTNAME LIKE '%NE%';

-- 6.List the LastName,  FirstName, and Phone  for all customers  whose  eight and ninth  digits (starting from the left) 
-- of their phone number are 56. For example, a phone number ending in ‘567’ would meet the criteria.(5points)
SELECT LASTNAME, FIRSTNAME, PHONE FROM CUSTOMER WHERE PHONE LIKE "%56_";

-- 7.Determine the maximum, minimum, and average sales Total. (5points)
SELECT MAX(TOTAL) AS 'MAX', MIN(TOTAL) AS 'MIN', AVG(TOTAL) AS 'AVG' FROM SALE;

-- 8.Count the number of customers having each combination of LastName and FirstName(5 points)
SELECT LASTNAME, FIRSTNAME, COUNT(*) AS 'No. Combinations' FROM CUSTOMER GROUP BY LASTNAME, FIRSTNAME;

-- 9.Show the LastName, FirstName, and Phone of all customers who have had an order with Total  greater  than  $100.00.  Use  a  subquery. 
-- Present  the  results  sorted  by LastName  in ascending order and then FirstName in descending order.(10points)
SELECT LASTNAME, FIRSTNAME, PHONE
FROM CUSTOMER C
WHERE C.CUSTOMERID IN (SELECT S.CUSTOMERID FROM SALE S WHERE S.TOTAL > 100 AND C.CUSTOMERID = S.CUSTOMERID)
GROUP BY LASTNAME ASC, FIRSTNAME DESC;

-- 10.Show the LastName, FirstName, and Phone of all customers who have had an order with Total greater than $100.00. Use a join.
-- Present the results sorted by LastName in ascending order and then FirstName in descending order.(10points)
SELECT C.LASTNAME, C.FIRSTNAME, C.PHONE
FROM CUSTOMER C JOIN SALE S
ON C.CUSTOMERID = S.CUSTOMERID
WHERE S.TOTAL > 100
GROUP BY LASTNAME ASC, FIRSTNAME DESC;

-- 11.Show  the  LastName,  FirstName,  and  Phone  of  all  customers  who  have  bought  an  Item named ‘Desk Lamp’.
-- Use a subquery, Present results sorted by LastName in ascending order and then FirstName is descending order.(20points)
SELECT C.LASTNAME, C.FIRSTNAME, C.PHONE
FROM CUSTOMER C
WHERE C.CUSTOMERID IN (
SELECT S.CUSTOMERID
FROM SALE S 
WHERE S.SALEID IN (
	SELECT SI.SALEID
    FROM SALE_ITEM SI, ITEM I
    WHERE SI.SALEITEMID = I.ITEMID
    AND I.ITEMDESCRIPTION LIKE 'DESK LAMP'
	)
)
GROUP BY LASTNAME ASC, FIRSTNAME DESC;

-- 12.Show  the  LastName,  FirstName,  and  Phone  of  all  customers  who  have  bought  an  Item named ‘Desk Lamp’.
-- Use a join, Present results sorted by LastName in ascending order and then FirstName is descending order.(20points)