-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT
    c.CustomerId CustomerId,
    c.FirstName || " " || c.LastName CustomerFullName,
    c.Country Country
FROM `Customer` c
WHERE Country != "USA"
ORDER BY CustomerFullName