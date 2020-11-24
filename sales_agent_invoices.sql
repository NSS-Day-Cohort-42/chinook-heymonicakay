-- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT
    InvoiceId,
    e.FirstName || ' ' || e.LastName FullName
FROM `Invoice` AS i
    JOIN Customer AS c ON c.CustomerId = i.CustomerId
    JOIN Employee AS e ON e.EmployeeId = c.SupportRepId