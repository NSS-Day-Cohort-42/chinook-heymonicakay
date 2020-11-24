-- Provide a query that shows total sales made by each sales agent.

SELECT
    COUNT(InvoiceId),
    e.FirstName || ' ' || e.LastName FullName
FROM `Invoice`
    JOIN `Customer` c ON c.CustomerId = i.CustomerId
    JOIN `Employee` e ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId