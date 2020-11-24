-- Provide a query only showing the Customers from Brazil.

SELECT
    c.CustomerId CustomerId,
    c.FirstName || " " || c.LastName CustomerFullName,
    c.Country Country
FROM `Customer` c
WHERE Country = "Brazil"
ORDER BY CustomerFullName
